module lab6(clock, reset,row, OR_row,anode, column, cathode,curr_state);
parameter N = 4;
parameter init = 3'b000;
parameter state_1 = 3'b001;
parameter state_2 = 3'b010;
parameter state_3 = 3'b011;
parameter state_4 = 3'b100;
parameter state_5 = 3'b101;
input clock, reset;
input [N-1:0] row;
output [N-1:0] anode = 4'b0111;
output[7:0] cathode;
output[2:0] curr_state;
output [N-1:0] column;
output OR_row;
wire clock_1;
reg [N-1:0]code;
reg [7:0] cathode;
reg [N-1:0] anode;
reg [N-1:0] column;
reg [N-1:0] col;
reg [2:0] curr_state, next_state;
reg OR_row;
Clock_Divider One(clock_1,, clock, reset);
always @(posedge clock_1 or posedge reset)begin
if (reset == 1)  begin 
curr_state <= init; 
end
else curr_state <= next_state;
end
always @(row)
if (row == 4'b0000) OR_row <= 0;
else OR_row <= 1;
always @ (curr_state or OR_row)begin
case (curr_state)
init: begin
column = 4'b1111;
if (OR_row == 1) next_state <= state_1; else
next_state <= init;
end
state_1: begin
column = 4'b0001;
if (OR_row == 0) next_state <= state_2; else
if (OR_row == 1) next_state <= state_5; else
next_state <= init;
end
state_2: begin
column = 4'b0010;
if (OR_row == 0) next_state <= state_3; else
if (OR_row == 1) next_state <= state_5; else
next_state <= init;
end
state_3: begin
column = 4'b0100;
if (OR_row == 0) next_state <= state_4; else
if (OR_row == 1) next_state <= state_5; else
next_state <= init;
end
state_4: begin
column = 4'b1000;
if (OR_row == 1) next_state <= state_5; else
next_state <= init;
end
state_5:begin
col =  column;
column = 4'b1111;
if (OR_row == 1) next_state <= state_5; else
next_state <= init;
column = col;
end
default: next_state <= init;
endcase
end
always @(curr_state)begin
if ({row,column} == 8'b00010001) cathode <= 8'b00000011;
else if ({row,column} == 8'b00010010) cathode <= 8'b10011111;
else if ({row,column} == 8'b00010100) cathode <= 8'b00100101;
else if ({row,column} == 8'b00011000) cathode <= 8'b00001101;
else if ({row,column} == 8'b00100001) cathode <= 8'b10011001;
else if ({row,column} == 8'b00100010) cathode <= 8'b01001001;
else if ({row,column} == 8'b00100100) cathode <= 8'b01000001;
else if ({row,column} == 8'b00101000) cathode <= 8'b00011111;
else if ({row,column} == 8'b01000001) cathode <= 8'b00000001;
else if ({row,column} == 8'b01000010) cathode <= 8'b00001001;
else if ({row,column} == 8'b01000100) cathode <= 8'b00010001;
else if ({row,column} == 8'b01001000) cathode <= 8'b11000001;
else if ({row,column} == 8'b10000001) cathode <= 8'b01100011;
else if ({row,column} == 8'b10000010) cathode <= 8'b10000101;
else if ({row,column} == 8'b10000100) cathode <= 8'b01100001;
else  cathode <= 8'b01110001;
end
endmodule