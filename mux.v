module mux(input [7:0]pos,neg,input one_sel,zero_sel,output [7:0] out);
  assign out=({one_sel,zero_sel}==2'b10)?neg:({one_sel,zero_sel}==2'b01)?pos:8'b0;
endmodule
