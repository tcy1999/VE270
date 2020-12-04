module Clock_Divider(clock_out,Q, clock_in, reset);
parameter n =  27, N = 50000000;
input reset,clock_in;
output clock_out = 0;
output [n-1:0] Q = 0;
reg [n-1:0] Q;
reg clock_out;
always @ (posedge reset or posedge clock_in)begin
if (reset == 1'b1) begin
Q <= 0;
clock_out<=0;
end
else if (Q == N-1) begin
Q<= 0;
clock_out <= ~clock_out;
end
else Q <= Q + 1;
end
endmodule