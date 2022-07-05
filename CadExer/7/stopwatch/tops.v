module tops (reset, pause, clk, left, right);
  input reset, pause, clk;
  output [6:0] left, right;
  wire [2:0] ts;
  wire [3:0] ss;
  
  reg [3:0] pss;
  reg [2:0] pts;
      
  OneHertz      i0 (reset, clk, en_nxt);
  secondcounter i1 (reset, clk, en_nxt, ts, ss);
  bin_2_7       lt ({1'b0,pts}, left);
  bin_2_7       rt (pss, right);
  
  initial begin
  pss <= 0;
  pts <= 0;
  end
  
  always @(posedge clk) begin
  if (!pause) begin
  pss <= ss;
  pts <= ts;
  end
  end
endmodule

/*
module test();
  reg reset, clk;
  wire [6:0] left, right;
  
  tops CUT (reset, clk, left, right);
  
  initial 
    begin
         reset = 0; clk =0;
      #2 reset = 1;
      #2 reset = 0;
    end
    
  always #5 clk = ~clk;
endmodule
*/
