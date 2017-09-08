`timescale 1ns/1ns
module testbench_6();
  reg[7:0] Abus,Bbus;
  reg go,clck,rst;
  wire[15:0] Rbus1,Rbus2;
  wire done1,done2,test;
  description MUT1(Abus,Bbus,go,clck,rst,Rbus1,done1,test);
   mult_dp MUT2(done2,go,clck,rst,Bbus,Abus,Rbus2);
      initial begin

        
        rst=1;
        #10 rst=0;
        #10 go=0;
        #10 go=1;
        //#10 go=0;
        clck=0;
        #40 clck=1;
        #15 go=0;
        #20 clck=0;
        
        Abus=-22;
        Bbus=100;
        repeat(40) #60 clck=~clck;
        rst=1;
        clck=0;
        #10 rst=0;
        Abus=22;
        Bbus=-100;
        repeat(40) #20 clck=~clck;
        rst=1;
        clck=0;
        #10 rst=0;
        Abus=-22;
        Bbus=-100;
        repeat(40) #20 clck=~clck;
        rst=1;
        clck=0;
        #10 rst=0;
        Abus=22;
        Bbus=100;
        repeat(40) #20 clck=~clck;
         
      end
    endmodule
  
  module hh();
    reg [7:0]Abus = 8'b00000010,Bbus = 8'b00000111;
    reg go = 1'b0;
    reg clck=0,rst = 0;
    wire [15:0]Rbus;
    wire done1,test;
    description MUT1(Abus,Bbus,go,clck,rst,Rbus,done1,test);
    initial repeat(40)#50 clck = ~clck;
    initial begin
      #70 go = 1;
      #100 go = 0;
    end
  endmodule