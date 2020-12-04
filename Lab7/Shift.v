module Shift(clock,out);
input clock;
output [15:0] out;
reg [0:63] ID = 64'h517370910072FFFF;
always@(posedge clock)
begin
ID[0:59]<= ID[4:63];
ID[60:63]<= ID[0:3];
end 
assign out = ID[0:15] ;
endmodule

