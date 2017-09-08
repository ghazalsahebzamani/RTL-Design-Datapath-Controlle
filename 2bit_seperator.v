module two_bit_sep(input [1:0]datain,output out1,out0);
  assign out1=datain[1];
  assign out0=datain[0];
endmodule