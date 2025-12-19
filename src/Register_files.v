module Reg_file(A1,A2,A3,WD3,WE3,clk,rst,RD1,RD2);
    input [4:0] A1,A2, A3;
    input [31:0] WD3;
    input WE3,clk,rst;
    output [31:0] RD1,RD2;

    reg [31:0] Registers [31:0];

    // read

    assign RD1 = rst ? Registers[A1] : 32'b0;
    assign RD2 = rst ? Registers[A2] : 32'b0;

    always@(posedge clk)begin
        if(WE3)Registers[A3]<=WD3;
    end

    initial begin
      Registers[0]=32'h00000000;
    end

    initial begin
      //To cross check overflow case
      // Registers[1]=32'h7FFFFFFF;
      // Registers[2]=32'h00000001;
    end
endmodule