module Timer(Q_L,Q_R,reset, clock);
input reset, clock;
output [2:0]Q_L;
output [3:0]Q_R;
reg [2:0]Q_L; 
reg [3:0]Q_R;
always @(posedge reset or posedge clock)begin
if (reset == 1'b1) begin
Q_L<=0; Q_R<=0;
end
else if (Q_R == 4'b1001)begin
Q_R<=0; 
if (Q_L == 3'b101)
Q_L<=0;
else Q_L <= Q_L + 1; 
end
else 
Q_R <= Q_R + 1;
end
endmodule