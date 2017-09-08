module last_seperator(input [7:0]datain,output out1,output [5:0]out2,output out3);
  assign out1=datain[7];
  assign out2=datain[6:1];
  assign out3=datain[0];
endmodule

