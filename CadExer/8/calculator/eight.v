module kbd_protocol (reset, clk, ps2clk, ps2data, f0, scancode);
  input        reset, clk, ps2clk, ps2data;
  output [7:0] scancode;
  reg    [7:0] scancode;
  output f0;
  
  // Synchronize ps2clk to local clock and check for falling edge;
  reg    [7:0] ps2clksamples; // Stores last 8 ps2clk samples

  always @(posedge clk or posedge reset)
    if (reset) ps2clksamples <= 8'd0;
      else ps2clksamples <= {ps2clksamples[7:0], ps2clk};

  wire fall_edge; // indicates a falling_edge at ps2clk
  assign fall_edge = (ps2clksamples[7:4] == 4'hF) & (ps2clksamples[3:0] == 4'h0);

  reg    [9:0] shift;   // Stores a serial package, excluding the stop bit;
  reg    [3:0] cnt;     // Used to count the ps2data samples stored so far
  reg          f0;      // Used to indicate that f0 was encountered earlier
  
  // A simple FSM is implemented here. Grab a whole package,
  // check its parity validity and output it in the scancode
  // only if the previous read value of the package was F0
  // that is, we only trace when a button is released, NOT when it is
  // pressed.
  
  always @(posedge clk or posedge reset)
    if (reset) 
      begin
        cnt    <= 4'd0;
        scancode <= 8'd0;
        shift    <= 10'd0;
        f0       <= 1'b0;
      end  
     else if (fall_edge)
         begin
           if (cnt == 4'd10) // we just received what should be the stop bit
             begin
               cnt <= 0;
               if ((shift[0] == 0) && (ps2data == 1) && (^shift[9:1]==1)) // A well received serial packet
                 begin
                   if (f0) // following a scancode of f0. So a key is released ! 
                     begin
                       scancode <= shift[8:1];
                       f0 <= 0;
                     end
                    else if (shift[8:1] == 8'hF0) f0 <= 1'b1;
                 end // All other packets have to do with key presses and are ignored
             end
            else
             begin
               shift <= {ps2data, shift[9:1]}; // Shift right since LSB first is transmitted
               cnt <= cnt+1;
             end
         end
endmodule



module scan_2_dec (scan, dec);
  input  [7:0] scan;
  output [3:0] dec;

  
  assign dec =(scan == 8'h45) ? 4'd0 :
              (scan == 8'h16) ? 4'd1 :
              (scan == 8'h1E) ? 4'd2 :
              (scan == 8'h26) ? 4'd3 :
              (scan == 8'h25) ? 4'd4 :
              (scan == 8'h2E) ? 4'd5 :
              (scan == 8'h36) ? 4'd6 :
              (scan == 8'h3D) ? 4'd7 :
              (scan == 8'h3E) ? 4'd8 :
              (scan == 8'h46) ? 4'd9 :
              (scan == 8'h79) ? 4'd12 : // +
              (scan == 8'h7B) ? 4'd13 : // -
              (scan == 8'h7C) ? 4'd14 : // *
              (scan == 8'h4A) ? 4'd15 : // /
              4'd11 ;
endmodule 

module dec_2_7seg (dec, ss);
  input  [3:0] dec;
  output [7:0] ss;

  
  assign ss = (dec == 4'd0) ? 8'b01111110 :
              (dec == 4'd1) ? 8'b00110000 :
              (dec == 4'd2) ? 8'b01101101 :
              (dec == 4'd3) ? 8'b01111001 :
              (dec == 4'd4) ? 8'b00110011 :
              (dec == 4'd5) ? 8'b01011011 :
              (dec == 4'd6) ? 8'b01011111 :
              (dec == 4'd7) ? 8'b01110010 :
              (dec == 4'd8) ? 8'b01111111 :
              (dec == 4'd9) ? 8'b01111011 : 8'b10000000 ;
endmodule 

module show(dig1, dig2, dig3, odig);
  input [3:0] dig1;
  input [3:0] dig2;
  input [3:0] dig3;
  output [3:0] odig;

  wire [3:0] sum;
  wire [3:0] dif;
  wire [3:0] prod;
  wire [3:0] frac;
  
  add add1(dig2, dig1, sum);
  sub sub1(dig2, dig1, dif);
  mul mul1(dig2, dig1, prod);
  div div1(dig2, dig1, frac);
  assign odig = (dig3 < 4'd10) ? dig3 :
                (dig3 == 4'd12) ? sum :
                (dig3 == 4'd13) ? dif :
                (dig3 == 4'd14) ? prod :
                (dig3 == 4'd15) ? frac : 4'd11;
// modulo 10 arithmetic, only 1 digit as output
// the other shows last digit
	
endmodule

module eight (reset, clk, ps2clk, ps2data, left, right);
  input        reset, clk;
  input        ps2clk, ps2data;
  output [7:0] left;
  output [7:0] right;
  reg [7:0] last_2;
  reg last_fo;
  wire   [7:0] scan;
  wire [3:0] current;
  wire [3:0] ldig;
  wire f0;
  wire pos_fo;
  
  kbd_protocol kbd (reset, clk, ps2clk, ps2data, f0, scan);
  scan_2_dec s2d (scan, current);

  show sh (last_2[7:4], last_2[3:0], current, ldig);

  dec_2_7seg dright(last_2[3:0], right);
  dec_2_7seg dleft(ldig, left);

  initial begin
	last_fo <= 0;
	last_2 <= 8'hBB;
  end
	
  always @(posedge clk)
    last_fo <= f0;
	
	assign pos_fo = ~last_fo & f0;

  // When the release of the next key is detected
  // save the last keypress/ result
  always @(posedge clk)
    if(pos_fo == 1) begin
      last_2 <= {last_2[3:0], ldig}; // Past results can be operands
    end  

endmodule
