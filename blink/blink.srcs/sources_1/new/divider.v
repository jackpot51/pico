`timescale 1ns / 1ps
`default_nettype none

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2019 09:01:37 PM
// Design Name: 
// Module Name: divider
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


module divider(
    input wire in,
    output wire out
    );

parameter DIVISOR = 32'd2;

reg value = 1'd0;
reg[31:0] counter = 32'd0;

always @(posedge in)
begin
    counter <= counter + 32'd1;
    if (counter >= DIVISOR)
    begin
        value <= ~value;
        counter <= 0;
    end
end 

assign out = value;
    
endmodule
