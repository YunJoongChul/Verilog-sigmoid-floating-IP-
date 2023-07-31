`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/31 15:37:51
// Design Name: 
// Module Name: top_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_tb();

reg clk, rst, en_tvaild;
reg [15:0] din;
wire [31:0] dout;
wire done_tvaild;

top DUT(.clk(clk), .rst(rst), .din(din), .en_tvaild(en_tvaild), .dout(dout), .done_tvaild(done_tvaild));

always #3 clk = ~clk;

initial begin
clk = 0; rst = 0; en_tvaild = 0; 
#99; 
#15 rst = 1;
#15 rst = 0; din = 15'h0;
#6 en_tvaild = 1;
#300;
end
endmodule
