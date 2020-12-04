module Rolling(roll,clock,cathode,anode);
input [15:0] roll;
input clock; 
output [7:0] cathode;
output [3:0] anode;
reg[7:0] cathode;
reg [3:0] anode;
reg [1:0] i = 0;
reg [3:0] disp; 
always@ (*)
case (i)
0:  disp =  roll[3:0] ;
1:  disp =  roll[7:4] ;
2:  disp =  roll[11:8] ;
3:  disp =  roll[15:12] ;
default:disp =  roll[3:0] ;
endcase
always@ (*)
case (disp)
0:    cathode =8'b00000011;
1:    cathode =8'b10011111;
2:    cathode =8'b00100101;
3:    cathode =8'b00001101;
4:    cathode =8'b10011001;
5:    cathode =8'b01001001;
6:    cathode =8'b01000001;
7:    cathode =8'b00011111;
8:    cathode =8'b00000001;
9:    cathode =8'b00001001; 
default: cathode =8'b11111111;
endcase  
always@(*)
begin
anode=4'b1111;
anode[i]=0;
end
always@ (posedge clock)
begin
i<=i+1;
end
endmodule

