module display(
    input clk,
    input [7:0] val1,
    input [7:0] val2,
    output reg [6:0] seg,
    output reg [3:0] an
);
    // This counter creates a flicker-free refresh rate for the display
    integer refresh_counter = 0;

    always @(posedge clk) begin
        refresh_counter <= refresh_counter + 1;
        
        // We use a bit from the counter to toggle between showing Candidate 1 and Candidate 2
        // This is called "Multiplexing"
        if(refresh_counter[16] == 0) begin
            an <= 4'b1110;       // Enable the first digit
            seg <= ~val1[6:0];   // Send Tally 1 bits to segments
        end else begin
            an <= 4'b1101;       // Enable the second digit
            seg <= ~val2[6:0];   // Send Tally 2 bits to segments
        end
    end
endmodule