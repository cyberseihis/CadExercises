module cnt25 (reset, clk, enable, clkdiv25);
input reset, clk, enable;
output clkdiv25;
reg [5:0] cnt;

assign clkdiv25 = (cnt==5'd24);
always @(posedge reset or posedge clk)
  if (reset) cnt <= 0;
   else if (enable) 
          if (clkdiv25) cnt <= 0;
            else cnt <= cnt + 1;
endmodule

module cnt5 (reset, clk, enable, clkdiv5);
input reset, clk, enable;
output clkdiv5;
reg [2:0] cnt;

assign clkdiv5 = (cnt==3'd4);
always @(posedge reset or posedge clk)
  if (reset) cnt <= 0;
   else if (enable) 
          if (clkdiv5) cnt <= 0;
            else cnt <= cnt + 1;
endmodule

module cnt7b (reset, clk, enable, clkdiv128);
input reset, clk, enable;
output clkdiv128;
reg [6:0] cnt;

assign clkdiv128 = (cnt==7'd127);
always @(posedge reset or posedge clk)
  if (reset) cnt <= 0;
   else if (enable) cnt <= cnt + 1;
endmodule


module TenHertz(reset, clk, en_nxt);
input clk, reset;
output en_nxt;
wire clk10Hz;
wire first, second, third, fourth;

cnt25 i0 (reset, clk, 1'b1, first);
cnt25 i1 (reset, clk, first, second);
cnt25 i2 (reset, clk, first & second, third);
cnt5 i3 (reset, clk, first & second & third, fourth);
cnt7b i4 (reset, clk, first & second & third & fourth, clk10Hz);
assign en_nxt = first & second & third & fourth & clk10Hz;
endmodule

/*
module testOneHertz();
  reg reset, clk;
  wire en_nxt;
  
  OneHertz CUT (reset, clk, en_nxt);
  initial begin reset=0; clk = 0; # 10 reset = 1; # 9 reset = 0; end
  always #1 clk=~clk;
endmodule
*/