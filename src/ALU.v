module ALU(A,B,Result,ALUControl,OverFlow,Carry,Zero,Negative);
input [31:0] A,B;//in 2's complement representation
input [2:0] ALUControl;
output reg [31:0] Result;//will be in 2's complement formate only 
output OverFlow,Carry,Zero,Negative;
reg Cout;//meaningless in signed arthmetic

always@(*)begin
Cout=1'b0;
Result=32'b0;
case (ALUControl)
    3'b000 : {Cout,Result}=A+B;
    3'b001 : {Cout,Result}=A+(~B+1);
    3'b010 : Result=A&B;
    3'b011 : Result=A | B; 
    3'b100 : Result=(A==B);
    3'b101 : Result=(A!=B);
    3'b110 : Result=(A<B);
    3'b111 : Result=(A>B);
    default: Result=32'bx; 
endcase
end
    assign OverFlow=((ALUControl==3'b000)&& ((~(A[31]^B[31]))&&(A[31]^Result[31]))) || 
                    ((ALUControl==3'b001)&&(A[31]^B[31])&&(A[31]^Result[31]));
    assign Carry=(~ALUControl[1]&Cout);
    assign Negative=Result[31];
    assign Zero =(~(|Result));
endmodule




