module reg_file #(
    parameter BIT_WIDTH_REG = 8,
    parameter REG_COUNT = 14,
    parameter LOG_REG_COUNT = 4
)(
    input  wire                         clk,            // clock signal 
    input  wire                         rst,            // reset signal 
    input  wire                         write,          // write enable signal
    input  wire [LOG_REG_COUNT-1:0]     w_reg,
    input  wire [BIT_WIDTH_REG-1:0]     w_d,
    input  wire [LOG_REG_COUNT-1:0]     r_reg1,
    input  wire [LOG_REG_COUNT-1:0]     r_reg2,
    output wire [BIT_WIDTH_REG-1:0]     r_d1,
    output wire [BIT_WIDTH_REG-1:0]     r_d2
);

    reg [BIT_WIDTH_REG-1:0] reg_data [0:REG_COUNT-1];      // reg [7:0] reg_data [0:13];

    // Read logic 
    assign r_d1 = reg_data[r_reg1];
    assign r_d2 = reg_data[r_reg2];

    // Write logic   (enable write on the rising edge of the clock, and reset all registers to 0 on reset)
    integer i;

    always(posedge clk or posedge rst) begin
            if(rst) begin
            for(i = 0; i< REG_COUNT; i = i+1)
                begin
                    reg_data[i] <= 8'b0;
                end
            end

            else if (write) begin
                reg_data[w_reg] <= w_d;
            end

        end

    
endmodule

