module Ring_Counter(Out,clock, reset);
input reset, clock;
output [3:0] Out;
reg [3:0] Out;
reg [1:0] counter;
always @ (posedge reset or posedge clock)begin
if (reset == 1'b1) counter <= 0;
else counter <= counter + 1;
end
always @ (Out)begin
case (counter)
2'b00: Out<=4'b0111;
2'b01: Out<=4'b1011;
2'b10: Out<=4'b1101;
2'b11: Out<=4'b1110;
endcase
end
endmodule