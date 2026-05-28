module counter(
    input clk,
    input reset,
    input pulse1,      
    input pulse2,      
    output reg [7:0] count1,  
    output reg [7:0] count2   
    );

    reg pulse1_prev;
    reg pulse2_prev;

    always @(posedge clk) begin
        if (reset) begin
            count1 <= 8'h00;
            count2 <= 8'h00;
            pulse1_prev <= 1'b0;
            pulse2_prev <= 1'b0;
        end else begin
            if (pulse1 == 1'b1 && pulse1_prev == 1'b0) begin
                count1 <= count1 + 1;
            end
            if (pulse2 == 1'b1 && pulse2_prev == 1'b0) begin
                count2 <= count2 + 1;
            end
            pulse1_prev <= pulse1;
            pulse2_prev <= pulse2;
        end
    end
endmodule