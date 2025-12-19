module Data_Memory(A,WD,clk,rst,WE,RD);
    input [31:0] A,WD;
    input clk,WE,rst;

    output[31:0]RD;

    reg [31:0] Data_Mem[1023:0];

    assign RD = (rst&&WE) ? 32'hx :
                            rst ? Data_Mem[A] : 
                            32'h0;
    always @(posedge clk) if(WE) Data_Mem[A] <= WD;

    initial begin
        // Data_Mem[28]=32'h00000050;
        Data_Mem[299]=32'h0000090;
        Data_Mem[40]=32'h00000002;
        //Data_Mem[40]=32'h00000002;
    end
endmodule