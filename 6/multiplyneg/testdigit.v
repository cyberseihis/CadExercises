module testmlx ();
  reg a, b, c, d;
  wire [6:0] s;
  wire        dp;
  
  digit i0 (a, b, c, d, s, dp);
  
  initial {a,b,c,d} <= 0;
  always #100 {a,b,c,d} <= {a,b,c,d} + 1;

initial # 3200 $finish;
initial
  begin
    $dumpfile("readN.lxt");
    $dumpvars(0, i0);
  end

endmodule
