module debouncer(
    input clk,
    input raw_btn,
    output reg clean_btn
);

    reg [15:0] counter = 0;

    always @(posedge clk) begin
        if (raw_btn == 1) begin
            if (counter < 16'hFFFF) 
                counter <= counter + 1;
            else
                clean_btn <= 1; 
        end else begin
            counter <= 0;
            clean_btn <= 0;
        end
    end
endmodule
