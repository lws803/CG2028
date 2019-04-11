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

    ldr R0, N
    ldr R1, FIRST
    ldr R2, =MEMLOC
    str R1, [R2]
    ldr R1, SECOND
    str R1, [R2, #4]

forloop:
    ldr R3, [R2], #4
    ldr R4, [R2]
    add R4, R3
    str R4, [R2, #4]
    subs R0, #1
    bgt forloop

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
N:
    .word 8
FIRST:
    .word 0
SECOND:
    .word 1

@ Store result in SRAM (4 bytes)
    .lcomm  MEMLOC  4
    .end
