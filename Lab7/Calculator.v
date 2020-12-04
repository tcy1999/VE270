module Calculator(clock, reset,equal,number, c_out,anode, cathode);
input clock, reset,equal;
input[3:0] number;
output c_out;
output [3:0] anode;
output[7:0] cathode;
reg [7:0] cathode;
wire [7:0] cathodea;
wire [7:0] cathodeb;
reg [7:0] cathodec;
wire [7:0] cathoded;
wire clock_500;
wire clock_1;
wire [3:0] anode;
wire [3:0] SSD;
wire sign;
assign cathodea = 8'b11111111;
assign cathodeb = 8'b11111111;
Clock_Divider #(18,200000) Five(clock_500,, clock, reset);
Ring_Counter ring (anode,clock_500,reset);
Adder adder (equal, number, c_out,SSD, sign);
Cathode cathodeR(SSD,cathoded);
always @(sign)
if(sign == 0)
cathodec = 8'b11111111;
else cathodec = 8'b11111101;
always @(anode)begin
case (anode)
4'b0111: cathode<=cathodea;
4'b1011: cathode<=cathodeb;
4'b1101: cathode<=cathodec;
4'b1110: cathode<=cathoded;
endcase
end
endmodule

