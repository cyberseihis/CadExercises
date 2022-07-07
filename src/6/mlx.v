module mlx (a, b, c, d, s, dp);
  input a, b, c, d;
  output [6:0] s;
  output         dp;
  wire o;
  
  assign o = a^b^c^d;
  assign s[6:0] = o ? 7'b0010010 : 7'b1110111;
  assign dp = 1;
endmodule