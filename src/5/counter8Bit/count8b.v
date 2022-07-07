module count8b (clear, clock, load, start_stop, count, data);
  input [7:0] data;
  output [7:0] count;
  input start_stop;
  input load;
  input clock;
  input clear;
  wire [7:0] count;
  
  count4b c1(clear, clock, load, start_stop, count[3:0], data[3:0]);
  count4b c2(clear, clock, load, &count[3:0], count[7:4], data[7:4]);

endmodule
