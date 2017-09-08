module two_bit_merge(input one_i,zero_i,output [1:0]out);
  assign out={one_i,zero_i};
endmodule
