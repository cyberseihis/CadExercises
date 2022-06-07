module tops (reset, clk);
  input reset, clk;
  wire [2:0] ts;
  wire [3:0] ss;
  
  secondcounter i1 (reset, clk, 1, ds, ts, ss);
  end
endmodule
