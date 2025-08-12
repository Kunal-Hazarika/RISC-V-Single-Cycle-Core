
module alu (a,b,alu_control,result,Z,N,V,C);
  input [31:0] a,b;
  input [2:0] alu_control;
  
  output [31:0] result;
  output Z,N,V,C;
  
  wire [31:0] a_and_b;
  wire [31:0] a_or_b;
  wire [31:0] not_b;
  
  wire [31:0] mux_1;
  
  wire [31:0] sum;
  
  wire [31:0] mux_2;
  
  wire slt;
  
  wire cout;
  
  assign a_and_b = a & b;
  assign a_or_b = a | b;
  
  assign mux_1 = (alu_control[0] == 1'b0) ? b : not_b;
  
  assign {cout,sum} = a + mux_1 + alu_control[0];
  
  assign slt = {31'b0000000000000000000000000000000,sum[31]}
  
    assign mux_2 =  (alu_control[2:0] == 3'b000) ? sum : 
      				(alu_control[2:0] == 3'b001) ? sum : 
      				(alu_control[2:0] == 3'b010) ? a_and_b :
                    (alu_control[2:0] == 3'b011) ? a_or_b :
                    (alu_control[2:0] == 3'b101) ? slt : 32'h00000000;
    
  assign result = mux_2;
  
  assign Z = & (~ result);
  assign N = result[31];
  assign C = cout & (~ alu_control[1]);
  assign v = (~ alu_control[1]) & (a[31] ^ sum[31]) & (~(a[31] ^ b[31] ^ alu_control[0]));
  
endmodule  