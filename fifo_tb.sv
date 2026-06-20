`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2026 18:20:13
// Design Name: 
// Module Name: fifo_tb
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


module fifo_tb;
logic clk;
logic reset;
logic wr_en;
logic rd_en;
logic [7:0] data_in;
logic [7:0] data_out;
logic full;
logic empty;

fifo dut(
    .data_in(data_in),
    .clk(clk),
    .reset(reset),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .data_out(data_out),
    .full(full),
    .empty(empty)
);

initial
begin
    clk = 0;
end

always #5 clk = ~clk;

initial
begin
    reset = 1;
    wr_en = 0;
    rd_en = 0;
    data_in = 0;

    #20;
    reset = 0;

    @(posedge clk);
    wr_en = 1;
    data_in = 8'hAA;

    @(posedge clk);
    data_in = 8'hBB;

    @(posedge clk);
    data_in = 8'hCC;

    @(posedge clk);
    wr_en = 0;

    @(posedge clk);
    rd_en = 1;
    
    @(posedge clk);

    @(posedge clk);

    @(posedge clk);
    
    @(posedge clk);
    wr_en  = 1;
    rd_en  = 1;
    data_in = 8'hDD;
    
    rd_en = 0;

    #20;
    $finish;
end

endmodule