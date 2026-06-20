`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2026 19:35:38
// Design Name: 
// Module Name: fifo
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


module fifo #(parameter DEPTH=8, WIDTH=8)(data_in,clk,reset,wr_en,rd_en,data_out,full,empty);
input logic [WIDTH-1:0]data_in;
input logic clk,reset,wr_en,rd_en;
output logic [WIDTH-1:0]data_out;
output logic full,empty;
logic [WIDTH-1:0] mem [0:DEPTH-1];

localparam PTR_WIDTH = $clog2(DEPTH);
logic [PTR_WIDTH-1:0]wr_ptr;
logic [PTR_WIDTH-1:0]rd_ptr;
logic [PTR_WIDTH:0]count;

assign full = (count==DEPTH);
assign empty = (count==0);

always_ff @(posedge clk)
begin 
    if(reset)
    begin
     wr_ptr <= 0;
     rd_ptr <= 0;
     count <= 0;
     data_out <= 0;
     end
     
     else if(wr_en && !full)
     begin
      mem[wr_ptr] <= data_in;
      wr_ptr <= wr_ptr+1;
      count <= count+1;
     end  
     
     else if (rd_en && !empty)
     begin 
      data_out <= mem[rd_ptr];
      rd_ptr <= rd_ptr+1;
      count <= count-1;
     end   
end

endmodule
