module Decoder #(parameter WIDTH = 4) (
    input logic [WIDTH-1:0] input,
    input logic [WIDTH-1:0] select,
    output logic [1<<WIDTH-1:0] output
);

    always_comb begin
        output = 0;
        output[select] = input;
    end

endmodule

module Decoder_Testbench;

    // Parameters
    parameter WIDTH = 3;

    // Signals
    logic [WIDTH-1:0] input;
    logic [WIDTH-1:0] select;
    logic [1<<WIDTH-1:0] output;

    // Instantiate Decoder
    Decoder #(WIDTH) dut (
        .input(input),
        .select(select),
        .output(output)
    );

    // Clock generation
    logic clock = 0;
    always #5 clock = ~clock;

    // Testbench stimulus
    initial begin
        // Reset
        input <= 0;
        select <= 0;
        #10;

        // Test cases
        $display("Testing Decoder with WIDTH=%0d", WIDTH);
        for (int i = 0; i < 1<<WIDTH; i++) begin
            select <= i;
            input <= $urandom_range(0, (1<<WIDTH)-1);
            #10;
            $display("Input: %b, Select: %b, Output: %b", input, select, output);
        end

        // End simulation
        $finish;
    end

    // Clock process
    always #1 clock = ~clock;

endmodule