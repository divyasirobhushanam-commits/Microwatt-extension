// custom_scalar_unit.v
// Synthesizable fixed-point approximation of your FP8/INT8 custom unit.
// insn[5:2]:
//   4'b0000 -> INT8 ADD (ra[7:0] + rb[7:0])
//   4'b0001 -> INT8 SUB (ra[7:0] - rb[7:0])
//   4'b0010 -> FP8 ADD (fixed-point Q4.4 add)
//   4'b0011 -> FP8 MUL (fixed-point Q4.4 mul, shifted back)
// Output placed in result[7:0], rest zeros.

module custom_scalar_unit (
    input  wire [63:0] ra,
    input  wire [63:0] rb,
    input  wire [63:0] rc,      // unused but kept for compatibility
    input  wire [31:0] insn,
    output wire [63:0] result
);

    // control signals
    wire sel_add_i8 = (insn[5:2] == 4'h0);
    wire sel_sub_i8 = (insn[5:2] == 4'h1);
    wire sel_add_fp8 = (insn[5:2] == 4'h2);
    wire sel_mul_fp8 = (insn[5:2] == 4'h3);

    // integer 8-bit ops
    wire [7:0] add_i8 = ra[7:0] + rb[7:0];
    wire [7:0] sub_i8 = ra[7:0] - rb[7:0];

    // FP8 (Q4.4 fixed point) ops
    wire [11:0] add_fp8_ext = {4'b0, ra[7:0]} + {4'b0, rb[7:0]};
    wire [15:0] mul_fp8_ext = (ra[7:0] * rb[7:0]) >> 4;

    reg [7:0] res8;
    always @* begin
        case (1'b1)
            sel_add_i8:  res8 = add_i8;
            sel_sub_i8:  res8 = sub_i8;
            sel_add_fp8: res8 = add_fp8_ext[7:0];
            sel_mul_fp8: res8 = mul_fp8_ext[7:0];
            default:     res8 = 8'h00;
        endcase
    end

    assign result = {56'h0, res8};

endmodule

