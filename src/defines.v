`ifndef DEFINES_V
`define DEFINES_V


// ALU     (binary assignment for each operation)

`define ALU_NOT  3'b000
`define ALU_AND  3'b001
`define ALU_OR  3'b010
`define ALU_ADD  3'b011
`define ALU_SUB  3'b100
`define ALU_XOR  3'b101
`define ALU_INC  3'b110
`define ALU_DEC  3'b111




`define NOT      {1'b1, `ALU_NOT}  // 4'b1000
`define AND      {1'b1, `ALU_AND}  // 4'b1001
`define OR       {1'b1, `ALU_OR}   // 4'b1010
`define ADD      {1'b1, `ALU_ADD}  // 4'b1011
`define SUB      {1'b1, `ALU_SUB}  // 4'b1100
`define XOR      {1'b1, `ALU_XOR}  // 4'b1101
`define INC      {1'b1, `ALU_INC}  // 4'b1110
`define DEC      {1'b1, `ALU_DEC}  // 4'b1111

`define MOV      4'b0000    
`define LDI      4'b0001   
`define OUT      4'b0010    
`define RSR      4'b0011  



`endif //DEFINES_V