module mulneg (a, b, c, d, s, dp);
  input a, b, c, d;
  output [6:0] s;
  output         dp;
  wire [3:0] o;

  reg [6:0] lut [15:0]; 

initial begin
lut[0] = 7'b1110111;
lut[1] = 7'b1110111;
lut[2] = 7'b1110111;
lut[3] = 7'b1110111;
lut[4] = 7'b1110111;
lut[8] = 7'b1110111;
lut[12] = 7'b1110111;

lut[5] = 7'b0010010;
lut[6] = 7'b1011101;
lut[7] = 7'b0010010;

lut[13] = 7'b0010010;
lut[14] = 7'b1011101;
lut[15] = 7'b0010010;

lut[9] = 7'b1011101;
lut[10] = 7'b0111010;
lut[11] = 7'b1011101;


end

  assign o = {a, b, c, d};
  assign s[6:0] = lut[o];
  assign dp = a ^ c;
endmodule
