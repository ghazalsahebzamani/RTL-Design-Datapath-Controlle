`timescale 1ns/1ns
module description(input [7:0]Abus,Bbus,input go,clck,rst,output[15:0] Rbus,output done,output test);
  wire initP,ldB,ldQ,initQ,ldA,ldP,Ao,Qo,one_selB,zero_selB;
controller M1(go,Ao,Qo,clck,rst,initP,ldP,ldB,ldQ,initQ,ldA,done,one_selB,zero_selB);
mult_dp_one M2( Abus,Bbus,initP,ldP,ldB,ldQ,initQ,ldA,one_selB,zero_selB,clck,rst,Qo,Ao,Rbus,test);
endmodule