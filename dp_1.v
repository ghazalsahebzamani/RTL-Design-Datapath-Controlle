module mult_dp_one (input[7:0] Abus,Bbus,input initP,ldP,ldB,ldQ,initQ,ldA,one_selB,zero_selB,input clck,rst,output Qo,Ao,output[15:0]Rbus,output reg test);
reg[7:0] Areg,Breg,Preg;
reg Qreg;
wire [7:0] ADDbus,muxbus;
always @(posedge clck,posedge rst) begin
  test<=1;
if (rst)
  Preg<=8'b0;
  else if(initP)
    Preg<=8'b0;
  else if (ldP)
    Preg<={ADDbus[7],ADDbus[7:1]};
  end
    always @(posedge clck,posedge rst) begin
    if(rst) Breg<=8'b0;
    else if (ldB) Breg<=Bbus;
    end
    always @(posedge clck,posedge rst) begin
      if (rst)
        Areg<=8'b0;
 else if (ldA) Areg=Abus;
 else
  Areg<={ADDbus[0],Areg[7:1]};
end
always @(posedge clck,posedge rst) begin
 if(rst)
   Qreg<=1'b0;
 else if (initQ)
   Qreg<=1'b0;
 else if(ldQ)
   Qreg<=Areg[0];
 end

 assign muxbus=({one_selB,zero_selB}==2'b10)?(~Breg)+1:
 ({one_selB,zero_selB}==2'b01)? Breg:8'b0;
 assign ADDbus=Preg+muxbus;
 assign Ao=Areg[0];
 assign Qo=Qreg;
 assign Rbus={Preg,Areg};
 endmodule
 
    