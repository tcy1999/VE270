module Counter (Out, SSD, Anode, updown,clock, reset);
parameter N = 4;
input  updown,clock, reset;
output [N-1:0] Out;
output [6:0] SSD;
output [N-1:0] Anode;
reg [N-1:0] Out;
reg [6:0] SSD;
reg [N-1:0] Anode;
always @(posedge reset or posedge clock) begin
if (reset == 1'b1) Out <= 0;
else if (updown == 1'b1)  Out <= Out + 1;
else  Out <= Out - 1;
end 
always @(Out) begin
Anode <= 4'b0111;
if (Out == 4'b0000) SSD <= 7'b0000001;
else if (Out == 4'b0001) SSD <= 7'b1001111;
else if (Out == 4'b0010) SSD <= 7'b0010010;
else if (Out == 4'b0011) SSD <= 7'b0000110;
else if (Out == 4'b0100) SSD <= 7'b1001100;
else if (Out == 4'b0101) SSD <= 7'b0100100;
else if (Out == 4'b0110) SSD <= 7'b0100000;
else if (Out == 4'b0111) SSD <= 7'b0001111;
else if (Out == 4'b1000) SSD <= 7'b0000000;
else if (Out == 4'b1001) SSD <= 7'b0000100;
else if (Out == 4'b1010) SSD <= 7'b0001000;
else if (Out == 4'b1011) SSD <= 7'b1100000;
else if (Out == 4'b1100) SSD <= 7'b0110001;
else if (Out == 4'b1101) SSD <= 7'b1000010;
else if (Out == 4'b1110) SSD <= 7'b0110000;
else SSD <= 7'b0111000;
end
endmodule