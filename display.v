module display(
    input clk,
    input [7:0] val1,
    input [7:0] val2,
    output reg [6:0] seg,
    output reg [3:0] an
);

    integer refresh_counter = 0;

    always @(posedge clk) begin
        refresh_counter <= refresh_counter + 1;
        
        if(refresh_counter[16] == 0) begin
            an <= 4'b1110;       
            seg <= ~val1[6:0];   
        end else begin
            an <= 4'b1101;      
            seg <= ~val2[6:0];   
        end
    end
endmodule
