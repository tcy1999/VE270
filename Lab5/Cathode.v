module Cathode(Input,cathode);
parameter N = 4;
input [N-1:0]Input;
output [7:0]cathode;
reg [7:0]cathode;
always @(Input) begin
if (Input == 0) cathode <= 8'b00000011;
else if (Input == 1) cathode <= 8'b10011111;
else if (Input == 2) cathode <= 8'b00100101;
else if (Input == 3) cathode <= 8'b00001101;
else if (Input == 4) cathode <= 8'b10011001;
else if (Input == 5) cathode <= 8'b01001001;
else if (Input == 6) cathode <= 8'b01000001;
else if (Input == 7) cathode <= 8'b00011111;
else if (Input == 8) cathode <= 8'b00000001;
else if (Input == 9) cathode <= 8'b00001001;
else if (Input == 10) cathode <= 8'b00010001;
else if (Input == 11) cathode <= 8'b11000001;
else if (Input == 12) cathode <= 8'b01100011;
else if (Input == 13) cathode <= 8'b10000101;
else if (Input == 14) cathode <= 8'b01100001;
else cathode <= 8'b01110001;
end
endmodule