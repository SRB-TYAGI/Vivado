// Code your design here
module FA(in1, in2, sum, cin, cout);
  input in1, in2, cin;
  output sum, cout;
  assign sum = in1 ^ in2 ^ cin;
  assign cout = (in1 & in2) | (in2 & cin) | (cin & in1);
endmodule