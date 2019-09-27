`timescale 1ns / 1ps
`default_nettype none

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2019 08:56:17 PM
// Design Name: 
// Module Name: blink
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


module blink(
    input wire clk_100MHz,
    output reg [2:0] leds
    );
    
    wire clk_1Hz;
    divider #(100_000_000) div(clk_100MHz, clk_1Hz);
    
    always @(posedge clk_1Hz)
    begin
        leds <= ~leds;
    end
endmodule