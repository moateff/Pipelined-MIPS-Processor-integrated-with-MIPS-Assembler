hi everyone!

# Demo: From Source Code to Execution on Pipelined MIPS Processor 

1. Write the Program in MIPS Assembly
```bash
    ./test/program.asm
```

2. MIPS Assembler Translate Assembly to Machine Code (program.asm -> program.hex)
```bash
    make assemble
```

3. Load Machine Code (program.hex) into Instruction Memory While Compiling MIPS HDL Files 
```bash
    make compile
```

4. Pipelined MIPS Executes Instruction Line by Line (IF -> ID -> EX -> MEM -> WB) 
```bash
    make simulate
```

5. Observe Execution in Waveform Viewer 
```bash
    make waveform
```

you can run all using
```bash
    make all
```


