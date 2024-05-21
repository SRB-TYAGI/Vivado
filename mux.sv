// Code your design here
module mux(in1, in2 ,in3,in4 , cin, out);
  input in1, in2,in3,in4, cin;
  output reg out;
  assign out = in1 ^ in2 ^ in3^ in4^cin;
//  assign cout = (in1 & in2) | (in2 & cin) | (cin & in1);
endmodule