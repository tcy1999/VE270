module lab_7(in, clk, equal, sw,anode,cathode,c_out);    
input [3:0] in;
input clk,equal,sw;
output c_out;
output [3:0] anode;
output [7:0] cathode;
reg [3:0] anode;
reg [7:0] cathode;
wire [15:0] roll;
wire clk1,clk5;
wire [7:0] cathodea, cathodeb;
wire [3:0] anodea, anodeb;
Clock_Divider One(clk1,,clk, );
Clock_Divider #(18,200000) five(clk5,,clk, );
Shift shift(clk1,roll);
Rolling rolling(roll,clk5,cathodea,anodea);
Calculator calculator(clk, ,equal,in, c_out,anodeb, cathodeb);
always@(posedge clk)
begin
if (sw==1) begin
cathode <= cathodea;
anode <= anodea;
end
else if (sw==0) begin
cathode <= cathodeb;
anode <= anodeb;
end
else 
cathode = 8'b11111111;
end
endmodule
    

