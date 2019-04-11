/*
 * LPC1769_asm_basic : asm.s
 * CK Tham, ECE, NUS
 * June 2011
 *
 * Simple assembly language program to compute
 * ANSWER = A*B + C*D
 */

@ Directives
        .thumb                  @ (same as saying '.code 16')
        .cpu cortex-m3
        .syntax unified
        .align 2

@ Equates
        .equ STACKINIT,   0x10008000

@ Vectors
vectors:
        .word STACKINIT         @ stack pointer value when stack is empty
        .word _start + 1        @ reset vector (manually adjust to odd for thumb)
        .word _nmi_handler + 1  @
        .word _hard_fault  + 1  @
        .word _memory_fault + 1 @
        .word _bus_fault + 1    @
        .word _usage_fault + 1  @
        .word 0                 @ checksum

        .global _start

@ Start of executable code
.section .text

_start:

@ Consider pushing the entire reglist first
@ code starts
    @ R0 already contains N
    sub R0, #1 @ N-1
    ldr R3, =ANSWER @ Load R1 with the address to our answer

@ Assume pointer is already pointed at the last element initially
forloop:
    @ Move value from one memory address to another
    ldr R5, [R3, #-4] @ temp = array[j-1]
    str R5,[R3], #-4 @ array[j--] = temp
    sub R0, #1 @ Decrement the counter
    cmp R0, #1
    beq forloop
endloop: @ just for labelling purposes, serves no purpose
    str R2, [R3] @ x_store[0] = x_n



@ Loop at the end to allow inspection of registers and memory
loop:
    b loop

@ Loop if any exception gets triggered
_exception:
_nmi_handler:
_hard_fault:
_memory_fault:
_bus_fault:
_usage_fault:
        b _exception

@ Define constant values
A:
    .word 4
B:
    .word 200

@ Store result in SRAM
    .lcomm  ANSWER  4
    .end
