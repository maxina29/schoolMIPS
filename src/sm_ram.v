

module sm_ram
#(
    parameter WIDTH = 6
)
(
    input         clk,
    input  [31:0] a,
    input         we,
    input  [31:0] wd,
    output [31:0] rd
);
    localparam RAM32_WIDTH = WIDTH - 2;
    localparam RAM32_SIZE  = 2**(RAM32_WIDTH);

    wire [WIDTH-1:2] addr = a[WIDTH-1:2];

    reg  [31:0] ram [RAM32_SIZE - 1:0];
    assign rd = ram [addr];

    always @(posedge clk)
        if (we)
            ram[addr] <= wd;

endmodule
