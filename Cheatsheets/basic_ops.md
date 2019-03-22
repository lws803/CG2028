# Basic operations for assembly (LPC 1769)

### Misc
- {} means optional
- Op2 can be a register or a constant

### Condition codes
- N: 1 if negative
- Z: 1 if 0
- V: 1 if overflow occurs
- C: 1 if carry out occurs

### Immediates
```
#imm8 ; range of 0 - 255
#imm8m ; treat this like #imm8
#imm12 ; range of 0 - 4095
#imm16 ; range of 0 - 065535
```

### Prefixes
- S: Perform signed operation
- U: perform unsigned operation
```
SDIV {Rd,} Rn, Rm ; signed division
UDIV {Rd,} Rn, Rm ; unsigned division
```

### Suffixes (optional)
- S: updates condition codes flag

```
ADDS {Rd,} Rn, Op2
```

### Variables
#### Constants
```
NUM1 .word 123,456 ; using .word to declare a constant
```

#### Static variables
```
.lcomm ANSWER 4 ; use .lcomm to declare a variable
```

## Load/store
Rn (base register) contains the address to the memory location
### Load
```
LDR Rt, [Rn, #offset] ; load register Rt with contents from stated memory
eg. LDR R1, NUM1 ; will load contents of NUM1 to R1
eg. LDR R1, [R3] ; will load contents of R3 to R1
```

Load can also be performed on PC relative addressing. eg. `LDR Rd, ITEM`

#### Load pseudo instruction
```
LDR R2, =NUM1 ; will load R2 with the address to NUM1
eg. LDR R2, =NUM1 ; will load the address (not content) of NUM1 to R2
```

### Store
```
STR Rt, [Rn, #offset] ; stores value from register Rt to stated memory
```


## Move operation

```
MOV Rd, Op2 ; move Rd to Op2, Op2 is bounded by #256
MOVW Rd, Op2 ; Op2 is restricted to 16 bit constants #imm16
```

`MOV` will automatically expand to `MOVW` if need be when we specify an operand that is larger.

### Alternative: move a label address to register
```
MOVW R1, #NUM1 ; will move address of NUM1 to R1, not contents
```

## Arithmetic operations

### Addition and subtraction
```
ADD {Rd,} Rn, Op2 ; Add Rn and Op2 to Rd, ...
SUB {Rd,} Rn, Op2
; Op2 can also be a constant #imm12
; If Rd is omitted then it just does incrementing or decrementing to Rn
```

### Multiplication
```
MUL {Rd,} Rn, Rm ; Multiplies Rn and Rm and stores at Rd. If Rd is omitted, then it will store at Rn
MULA Rd, Rn, Rm, Ra ; Multiply with accumulate
; To get 64 bit results, multiply with suffix L eg. UMULL
```
