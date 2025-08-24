module testbench();
    parameter MEMFILE = "./dat/program.hex";

    reg         clk;
    reg         reset;

    wire [31:0] writedata, dataadr;
    wire memwrite;

    // instantiate device to be tested
    top #(MEMFILE) dut (clk, reset, writedata, dataadr, memwrite);

    // dumping signals for gtkwave
    initial begin
        $dumpfile("./wave/dump.vcd");
        $dumpvars(0, testbench);
    end

    // initialize test
    initial begin
        reset = 1; #22; reset = 0;
    end

    // generate clock to sequence tests
    always begin
        clk = 1; #5; clk = 0; #5;
    end
    
    // check results
    always @(negedge clk) begin
        if(memwrite) begin
            if (dataadr === 0 && writedata === 5040) begin
                $display("\033[32mSimulation succeeded, address = %0d, data = %0d\033[0m", dataadr, writedata);                
                $finish;
            end else if (dataadr !== 0) begin
                $display("\033[31mSimulation failed, Unexpected write at address = %0d with data = %0d\033[0m", dataadr, writedata);
                $stop;
            end
        end
    end

endmodule