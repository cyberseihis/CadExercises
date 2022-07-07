module testmlx ();
  reg a, b, c, d;
  wire [6:0] s;
  wire        dp;
  
  mlx i0 (a, b, c, d, s, dp);
  
  initial {a,b,c,d} <= 0;
  always #100 {a,b,c,d} <= {a,b,c,d} + 1;
endmodule