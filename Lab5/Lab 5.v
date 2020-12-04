module lab5(clock, reset,anode, cathode);
input clock, reset;
output [3:0] anode;
output[7:0] cathode;
reg [7:0] cathode;
wire [7:0] cathodea;
wire [7:0] cathodeb;
wire [7:0] cathodec;
wire [7:0] cathoded;
wire clock_500;
wire clock_1;
wire [3:0] anode;
wire [2:0]Q_L;
wire [3:0]Q_R;
assign cathodea = 8'b11111111;
assign cathodeb = 8'b11111111;
Clock_Divider One(clock_1,, clock, reset);
Clock_Divider #(18,200000) Five(clock_500,, clock, reset);
Ring_Counter ring (anode,clock_500,reset);
Timer timer(Q_L,Q_R,reset, clock_1);
Cathode cathodeR(Q_R,cathoded);
Cathode #(3)cathodeL(Q_L,cathodec);
always @(anode)begin
case (anode)
4'b0111: cathode<=cathodea;
4'b1011: cathode<=cathodeb;
4'b1101: cathode<=cathodec;
4'b1110: cathode<=cathoded;
endcase
end
endmodule