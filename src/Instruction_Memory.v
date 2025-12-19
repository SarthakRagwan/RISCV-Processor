module Instruction_Memory(A,rst,RD);
    
    input [31:0] A;
    input rst;
    output [31:0] RD;

    // Memory declaration
    reg [31:0] Mem [1023:0];

    assign RD = rst ? Mem[A[31:2]] : 32'b0; //active low reset

    // Instruction through memfile
//    initial begin
//        $readmemh("memfiles/sort.hex",Mem);
//    end
    
    initial begin
        //I type
//        Mem[0]=32'hFFC4A303;
        //Mem[1]=32'h00842383;
        //S type
        //Mem[0]=32'h0064A423;
        // Mem[1]=32'h00B62423;
        //R type
        //Mem[0]=32'h0062E233;

        //First Store then load
        // Mem[0]=32'h0064A423;
        // Mem[1]=32'h02802503;

        //Addition
        // Mem[0]=32'h00628233;
        //Subtraction
        // Mem[0]=32'h40628233;

        //immidiate addition
         Mem[0]=32'h00600093;

        // Mem[0]=32'h002081B3;

    end

endmodule