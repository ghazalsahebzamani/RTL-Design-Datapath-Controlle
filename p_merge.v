module p_merge(input last,input[6:1] middle,output [7:0]out);
  assign out={last,last,middle};
endmodule

