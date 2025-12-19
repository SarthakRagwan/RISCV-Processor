module Main_Decoder(Op,RegWrite,MemWrite,ResultSrc,ALUSrc,Branch,ImmSrc,ALUOp,PCSrc);

//Inputs 

// input zero;
input [6:0] Op;

//Outputs

output RegWrite,MemWrite,ResultSrc,ALUSrc,PCSrc,Branch;
output [1:0] ImmSrc,ALUOp;

//Interim wire

wire Branch;

    assign RegWrite = (Op == 7'b0000011 || Op == 7'b0110011 || Op == 7'b0010011);
    
    assign ALUSrc = (Op == 7'b0000011 || Op == 7'b0100011 || Op == 7'b0010011);
    
    assign MemWrite = (Op == 7'b0100011);
    
    assign ResultSrc = (Op == 7'b0000011);
    
    assign Branch = (Op == 7'b1100011);
    
    assign ALUOp = (Op == 7'b0110011) ? 2'b10 :
                   (Op == 7'b1100011) ? 2'b01 :
                   (Op == 7'b0010011) ? 2'b11 :
                                        2'b00 ;
    
    assign ImmSrc = (Op == 7'b0100011) ? 2'b01 : 
                    (Op == 7'b1100011) ? 2'b10 :    
                                         2'b00 ;
    // assign PCSrc = zero & Branch;

endmodule