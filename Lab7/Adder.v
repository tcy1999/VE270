module Adder(equal, number, c_out, SSD, sign);
parameter N = 4;
input [N-1:0] number;
input equal;
output c_out;
output sign;
output [N-1:0] SSD;
reg c_out;
reg sign;
reg [N-1:0] sum;
reg [N-1:0] SSD;
reg [N-1:0] temp;
reg [N-1:0] b;
always @(number)begin
b = number;
end
always @(posedge equal)begin
if (sum == 0 && temp == 0)
{c_out,sum} = b;
else begin
temp = sum;
{c_out,sum} = sum + b;
if (temp[3]^b[3] === 0)
c_out = sum[3]^c_out;
else
c_out = 0;
end
if (sum[3] == 1)begin
SSD = ~sum + 1; sign = 1;
end
else begin
SSD = sum; sign = 0;
end
end 
endmodule
