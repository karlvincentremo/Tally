`timescale 1ns / 1ps

module tb_tally();
    reg clk;
    reg reset;
    reg btn1;
    reg btn2;

    wire [7:0] tally1;
    wire [7:0] tally2;

    // Loop variable
    integer i; 

    top uut (
        .clk(clk),
        .reset(reset),
        .btn1(btn1),
        .btn2(btn2),
        .tally1(tally1),
        .tally2(tally2)
    );

    // 100MHz Clock
    always #5 clk = ~clk;

    initial begin
       
        clk = 0;
        reset = 1;
        btn1 = 0;
        btn2 = 0;

    
        #100 reset = 0;
        
        // AUTOMATED STRESS TEST
        // This loop simulates 260 people pressing the button
        for (i = 0; i < 260; i = i + 1) begin
            #50 btn1 = 1;         
            #1000000 btn1 = 0;    
            #1000000;             
        end

        #1000000 $finish; 
    end
endmodule
