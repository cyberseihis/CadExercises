module tops (reset, clk, left, right);
  input reset, clk;
  output [6:0] left, right;
  wire [2:0] ts;
  wire [3:0] ss;
      
  OneHertz      i0 (reset, clk, en_nxt);
  secondcounter i1 (reset, clk, en_nxt, ts, ss);
  bin_2_7       lt ({1'b0,ts}, left);
  bin_2_7       rt (ss, right);
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
