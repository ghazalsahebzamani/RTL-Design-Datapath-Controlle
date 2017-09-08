module controller(input go,Ao,Qo,input clck,rst,output initP,ldP,ldB,ldQ,initQ,ldA,done,output one_selB,zero_selB);
  reg[8:0]outs;
  assign {initP,ldP,ldB,one_selB,zero_selB,ldQ,initQ,ldA,done}=outs;
  reg[3:0]ps,ns;
  always @(ps,go,Ao,Qo) begin
    ns=4'b0;
    case(ps)
      0: if (go==0) ns=0; else ns=1;
      1: if(go==1) ns=1; else ns=2;
      2,3,4,5,6,7,8,9:ns=ps+1;
      10:ns=0;
      default ns=0;
    endcase
  end
  always @(ps,Ao,Qo,go) begin
    outs=9'b0;
    case(ps)
      0:outs=9'b000000001;
      1:outs=9'b100000100;
      2:outs=9'b001000010;
      3,4,5,6,7,8,9,10:begin outs[8:6]=3'b010;
      outs[5:4]={Ao,Qo};
      outs[3:0]=4'b1000;
    end
    endcase
  end
  always @ (posedge clck,posedge rst) begin
    if(rst) ps<=4'b0;
    else ps<=ns;
    end
    endmodule
    
      
      
    
