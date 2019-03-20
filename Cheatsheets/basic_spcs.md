# Basic specifications

- RISC: Reduced instruction set computing

### Modules

- PC: Program counter
- IR: Instruction register
- SP: Stack pointer
- CU: Control Unit
- ALU: Arithmetic logic unit
- Register set


#### Register set
- Typically 32 bits each. 1 word can be 16 to 64 bits
- Contains general purpose and special purpose registers

#### Memory organisation
Byte size = 8 bits

##### Byte addressing
For word length of 32 bits, word locations will have `0x0, 4, 8, C`. Access them by incrementing `4` into the counter.


### Properties of RISC

RISC only supports one instruction per cycle. (eg. cannot perform load and add at the same time)

#### Steps to perform an instruction
1. Fetch instruction - fetch instruction from memory
2. Decode instruction - decode instruction (1st few bits define the opcode)
3. Fetch data - fetch the data from memory
4. Process data - perform arithmetic/ logical operations
5. Write data - write result back to memory

PC is then incremented to point to the next instruction (pc register incremented by 4)
