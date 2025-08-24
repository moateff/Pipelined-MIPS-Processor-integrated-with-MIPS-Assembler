hi everyone!

# Demo: From Source Code to Execution on Pipelined MIPS Processor 

1. Write the Program in MIPS Assembly
```
    > ./test/program.asm
```

2. MIPS Assembler Translate Assembly to Machine Code (program.asm -> program.hex)
```
    > make assemble
```

3. Load Machine Code (program.hex) into Instruction Memory While Compiling MIPS HDL Files 
```
    > make compile
```

4. Pipelined MIPS Executes Instruction Line by Line (IF -> ID -> EX -> MEM -> WB) 
```
    > make simulate
```

5. Observe Execution in Waveform Viewer 
```
    > make waveform
```

you can run all using
```
    > make all
```

used tools
1. iverilog (for compilation)
2. vvp (for simulation)
3. gtkwave (for Visualization)
4. make (for automation)

