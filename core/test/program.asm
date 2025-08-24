# calculate factorial of a number for example 7! = 5040

main:   addi $s0, $zero, 0x07      # n = 7 (store factorial input in $s0)                
        addi $s1, $zero, 0x01      # result = 1 (store running factorial in $s1)

label:  beq  $s0, $zero, end       # if (n == 0), jump to end (base case)         
        mul  $s1, $s1, $s0         # result = result * n               
        addi $s0, $s0, -1          # n = n - 1            
        j    label                 # repeat loop until (n == 0)             		        

end:    sw   $s1, 0($zero)         # store final factorial result in memory[0]

# expected output: address = 0, data = 5040
