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
  output [7:0] dec;

  
  assign dec = (scan == 8'h45) ? 4'd0 :
              (scan == 8'h16) ? 4'd1 :
              (scan == 8'h1E) ? 4'd2 :
              (scan == 8'h26) ? 4'd3 :
              (scan == 8'h25) ? 4'd4 :
              (scan == 8'h2E) ? 4'd5 :
              (scan == 8'h36) ? 4'd6 :
              (scan == 8'h3D) ? 4'd7 :
              (scan == 8'h3E) ? 4'd8 :
              (scan == 8'h46) ? 4'd9 : 8'b10000000 ; // todo add operands
endmodule 

// todo
module dec_2_7seg (dec, ss);
  input  [7:0] scan;
  output [7:0] ss;

  
  assign ss = (scan == 8'h45) ? 8'b01111110 :
              (scan == 8'h16) ? 8'b00110000 :
              (scan == 8'h1E) ? 8'b01101101 :
              (scan == 8'h26) ? 8'b01111001 :
              (scan == 8'h25) ? 8'b00110011 :
              (scan == 8'h2E) ? 8'b01011011 :
              (scan == 8'h36) ? 8'b01011111 :
              (scan == 8'h3D) ? 8'b01110010 :
              (scan == 8'h3E) ? 8'b01111111 :
              (scan == 8'h46) ? 8'b01111011 : 8'b10000000 ;
endmodule 

module show(dig1, dig2, dig3, odig):
  input [3:0] dig1;
  input [3:0] dig2;
  input [3:0] dig3;
  output [3:0] odig;
  
  assign odig = (dig3 < 4'd10) ? dig3 :
    // switch for each operand
	
endmodule

module eight (reset, clk, ps2clk, ps2data, left, right);
  input        reset, clk;
  input        ps2clk, ps2data;
  output [7:0] left;
  output [7:0] right;
  reg [3:0] last;
  reg [3:0] past;
  wire   [7:0] scan;
  wire [3:0] current;
  wire f0;
  
  kbd_protocol kbd (reset, clk, ps2clk, ps2data, f0, scan);
  scan_2_dec s2d (scan, current);

  // When the release of the next key is detected
  // save the 7-seg code of the currently shown digit to the last
  always @(posedge clk)
    if(f0 == 1) begin
      past <= right;
      right <= left;
    end  

endmodule
