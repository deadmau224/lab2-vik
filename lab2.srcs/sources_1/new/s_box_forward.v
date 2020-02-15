`timescale 1ns / 1ps

module s_box_forward
(
    input clk,
    input rst,
    input [7:0] idata,
    output reg [7:0] odata,
    output iready,
    input ivalid,
    input oready, //Raise when data is completely processed by s_box, and ready to be read by outside driver
    output reg ovalid //Raise after two clocks cycles from zero when s_box is ready to take in data
);

reg counter; //keeps track of state. Should wait 2 clock cycles before raising flags

reg odata01;
reg odata02;
reg odata03;
reg odata_f;

reg odata04;
reg odata05;
reg odata06;
reg odata_f1;

reg odata07;
reg odata08;
reg odata09;
reg odata_f2;

reg odata10;
reg odata11;
reg odata12;
reg odata_f3;

reg odata13;
reg odata14;
reg odata15;
reg odata_f4;

reg odata16;
reg odata17;
reg odata18;
reg odata_f5;

reg odata19;
reg odata20;
reg odata21;
reg odata_f6;

reg odata22;
reg odata23;
reg odata24;
reg odata_f7;

always@ (posedge clk)
begin

if (rst)
    begin
        odata[7:0] = 7'b0;
        ovalid <= 0;
        ivalid <= 0;
        oready <= 0;
        iready <= 0;
        counter = 0;
    end
    
else if (ivalid)
    begin     
        if (counter==2) begin
            ovalid = 1;
        end
    end

if (oready)
    begin
    
    end

if(counter<2) begin
    counter=counter+1;
end


odata01 <= idata[0]^idata[4];
odata02 <= idata[5]^idata[6];
odata03 <= idata[7]^1;
odata_f = odata01^odata02^odata03;

odata04 <= idata[1]^idata[5];
odata05 <= idata[6]^idata[7];
odata06 <= idata[0]^1;
odata_f1 = odata04^odata05^odata06;

odata07 <= idata[2]^idata[6];
odata08 <= idata[7]^idata[0];
odata09 <= idata[1]^1;
odata_f2 = odata07^odata08^odata09;

odata10 <= idata[3]^idata[7];
odata11 <= idata[0]^idata[1];
odata12 <= idata[2]^1;
odata_f3 = odata10^odata11^odata12;

odata13 <= idata[4]^idata[0];
odata14 <= idata[1]^idata[2];
odata15 <= idata[3]^1;
odata_f4 = odata13^odata14^odata15;

odata16 <= idata[5]^idata[1];
odata17 <= idata[2]^idata[3];
odata18 <= idata[4]^1;
odata_f5 = odata16^odata17^odata18;

odata19 <= idata[6]^idata[2];
odata20 <= idata[3]^idata[4];
odata21 <= idata[5]^1;
odata_f6 = odata19^odata20^odata21;

odata22 <= idata[7]^idata[3];
odata23 <= idata[4]^idata[5];
odata24 <= idata[6]^1;
odata_f7 = odata22^odata23^odata24;


end
endmodule

