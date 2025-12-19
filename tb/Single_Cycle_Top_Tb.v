`timescale 1s/1ms
`include "Single_Cycle_Top.v"
module Single_Cycle_Top_Tb();
    
    reg clk=1'b1,rst;
    
    Single_Cycle_Top Single_Cycle_Top(
        .clk(clk),
        .rst(rst)
    );

    initial begin
        
        $dumpfile("Single_Cycle.vcd");
        $dumpvars(0,Single_Cycle_Top_Tb);
    end

    always begin clk=~clk; #50;end

    initial begin
        #1 rst=1'b0;
        #50;

        rst=1'b1;
        #300;
        #10000;
        $finish;
    end

endmodule