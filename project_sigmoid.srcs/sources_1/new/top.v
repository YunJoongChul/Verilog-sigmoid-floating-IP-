`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/31 15:19:07
// Design Name: 
// Module Name: top
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


module top(clk, rst, din,en_tvaild, dout, done_tvaild);
input clk, rst, en_tvaild;
input signed [15:0] din;
output [31:0] dout;
output done_tvaild;
wire tvaild0, tvaild1, tvaild2, tvaild3, tvaild4;
wire [31:0] out0, out1, out2, out3, out4;
wire signed [31:0] one;
assign one = 32'h3F80_0000;

floating_point_0 u0( .aclk(clk), .s_axis_a_tvalid(en_tvaild), .s_axis_a_tdata(din), .m_axis_result_tvalid(tvaild0), .m_axis_result_tdata(out0));
exp u1(.aclk(clk), .s_axis_a_tvalid(tvaild0), .s_axis_a_tdata(out0),.m_axis_result_tvalid(tvaild1),.m_axis_result_tdata(out1));
reciprocal u2(.aclk(clk), .s_axis_a_tvalid(tvaild1), .s_axis_a_tdata(out1), .m_axis_result_tvalid(tvaild2), .m_axis_result_tdata(out2));
add u3(.aclk(clk), .s_axis_a_tvalid(tvaild2), .s_axis_a_tdata(out2), .s_axis_b_tvalid(tvaild2), .s_axis_b_tdata(one), .m_axis_result_tvalid(tvaild3), .m_axis_result_tdata(out3));
reciprocal u4(.aclk(clk), .s_axis_a_tvalid(tvaild3), .s_axis_a_tdata(out3), .m_axis_result_tvalid(tvaild4), .m_axis_result_tdata(out4));
float_to_fixed u5( .aclk(clk) ,.s_axis_a_tvalid(tvaild4), .s_axis_a_tdata(out4), .m_axis_result_tvalid(done_tvaild), .m_axis_result_tdata(dout));

endmodule
