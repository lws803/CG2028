# Intermediate operations for assembly

## Logical operators
- AND
- ORR: OR operator
- EOR: Exclusive OR

eg.
```
AND {Rd,} Rn, Op2

AND Rd, Rn, Rm ; performs the bitwise AND operation between Rn and Rm and save the result to Rd
```

## BIC and ORN

- BIC: Bit clear
- ORN: OR NOT

```
BIC {Rd,} Rn, Op2

BIC Rd, Rn, Rm ; Rd = Rn & (~Rm)

BIC Rn, Rm ; Rn = Rn & (~Rm)
```

This will create the effect of bitmasking

## Shift and Rotate

- LSL: Logical shift left, **multiply** by `2^n`
- LSR: Logical shift right, **unsigned division** by `2^n`
- ASR: Arithmetic shift right, **signed division** by `2^n`
- ROR: Rotate right
eg.
```
LSL Rd, Rm, Rs
LSL Rd, Rm, #n ; n is limited to <= 31 or 32
```
- RRX: Rotate right with extend
eg.
```
RRX Rd, Rm
```

The last bit shifted is written to C flag if the `S` suffix is specified.

## Compare instructions

- CMP: Compare positive
- CMN: Compare negative, this is to be used when comparing between a positive and a negative number

eg.
```
CMP Rn, Op2 ; updates N, Z, C, V condition flags

CMN ; use this when one of the operands is negative
```

## Branch

Perform comparison, arithmetic/ logical instructions first with suffix `S` before branch.

```
B{cond} label ; will teleport you to the label specified earlier
```

## Advanced memory addressing

#### Pre-indexed addressing

```
LDR/ STR Rt, [Rn, #offset]! ; pre-indexed addressing
```

Value of offset is incremented into Rn immediately before LDR/ STR operations

#### Post-indexed addressing
```
LDR/ STR Rt, [Rn], #offset ; post-indexed addressing
```

Value of offset is incrementde into Rn only after LDR/ STR operations


## Stacks

- PUSH reglist: push registers on stack
- POP reglist: pop registers off stack

eg.
```
PUSH {R0-R3} ; will push R0 to R3
```

This is very handy for storing registers as we enter a subroutine then popping them out again once we exit the subroutine.
