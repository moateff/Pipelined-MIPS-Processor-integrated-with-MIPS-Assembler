mkdir -p dat bin wave
../asm/bin/MIPS_Assembler ./test/program.asm ./dat/test.hex
iverilog -o ./bin/mips.vvp -s testbench ./src/*.v ./sim/*.v
vvp ./bin/mips.vvp
gtkwave ./wave/dump.vcd 