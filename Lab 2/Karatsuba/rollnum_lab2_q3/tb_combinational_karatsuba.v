`timescale 1ns/1ps

module tb_combinational_karatsuba;

parameter N = 32;

// declare your signals as reg or wire
reg[N-1:0] X, Y;
wire[N*2-1:0] Z;
integer i;

initial begin

    X=3574846122;
    Y=3807872197;
    #10;
    $display("%d %d %b", X, Y, Z);
    #10;
// write the stimuli conditions
    for (i = 0; i < 0; i = i + 1) begin
        X=$random%65536;
        Y=$random%65536;
        #5;
        $display("%d %d %b", X, Y, Z[31:0]);
        #5;
    end
end

karatsuba_32 dut (.X(X), .Y(Y), .Z(Z));

initial begin
    // $dumpfile("combinational_karatsuba.vcd");
    // $dumpvars(0, tb_combinational_karatsuba);
end

endmodule