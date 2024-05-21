class pkt;
    rand bit [3:0] addr;
    rand bit [3:0] data;
endclass

module top;
    pkt p;

    initial begin
        p = new();
        repeat (10) begin
            p.randomize();
            $display("addr=%d ,data=%d \n", p.addr, p.data);
            // Check coverage using assertions
            assert(p.addr != 4'b0000) else $error("Coverage: Address 4'b0000 not covered");
            assert(p.addr != 4'b1111) else $error("Coverage: Address 4'b1111 not covered");
            assert(p.data != 4'b0000) else $error("Coverage: Data 4'b0000 not covered");
            assert(p.data != 4'b1111) else $error("Coverage: Data 4'b1111 not covered");
        end
        $finish; // Terminate simulation
    end
endmodule
