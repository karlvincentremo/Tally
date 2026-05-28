module top(
    input clk,
    input reset,
    input btn1,
    input btn2,
    output [7:0] tally1, // These must stay so the Testbench can see them
    output [7:0] tally2,
    output [6:0] seg,    // These are for your Display Driver
    output [3:0] an
);

    wire clean1, clean2;

    // 1. Debouncers
    debouncer db1 (.clk(clk), .raw_btn(btn1), .clean_btn(clean1));
    debouncer db2 (.clk(clk), .raw_btn(btn2), .clean_btn(clean2));

    // 2. Counter (The Tally Logic)
    counter vm_counter (
        .clk(clk),
        .reset(reset),
        .pulse1(clean1),
        .pulse2(clean2),
        .count1(tally1),
        .count2(tally2)
    );

    // 3. Display Driver (Chapter 3 Methodology)
    display display_unit (
        .clk(clk),
        .val1(tally1),
        .val2(tally2),
        .seg(seg),
        .an(an)
    );

endmodule