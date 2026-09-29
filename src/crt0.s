# Program entry point and double-precision comparison helpers.
#
# _start is where the EE kernel begins executing SCUS_971.11. It clears the
# small and regular .bss, has the kernel set up the main thread's stack and
# heap, initialises the thread and cache state the runtime relies on, and then
# runs main(), handing its result to Exit().
#
# The _dpf* routines are the comparison entry points the compiler calls for
# double operands. Each wraps dpcmp, which returns a negative, zero or positive
# result, and reduces it to the 0/1 truth value of one relational operator.

.include "macro.inc"

.set noat
.set noreorder

# Addresses and sizes the memory layout fixes. The linker script defines the
# stack and heap values as _stack, _stack_size and _heap_size; they are spelt
# as constants here so that the object carries no relocation against them.
.set BSS_END,        0x01F06B00  # One past the last byte of .bss.
.set STACK_BASE,     0x01F80000  # Lowest address of the main thread's stack.
.set STACK_SIZE,     0x00080000  # Size of the main thread's stack.
.set HEAP_SIZE,      -1          # Heap extends to the bottom of the stack.

# EE kernel system call numbers.
.set SYS_ExitThread,  0x23
.set SYS_SetupThread, 0x3C
.set SYS_SetupHeap,   0x3D

.section .text, "ax"

    nop
    nop

# Entry point: prepares the C runtime environment and runs main().
.global ENTRYPOINT
.global _start
ENTRYPOINT:
_start:
    # Zero everything from the start of .sbss to the end of .bss, one
    # quadword at a time.
    lui     $2, %hi(_fbss)
    lui     $3, %hi(BSS_END)
    addiu   $2, $2, %lo(_fbss)
    addiu   $3, $3, %lo(BSS_END)
.Lclear_bss:
    nop
    nop
    sq      $0, 0($2)
    sltu    $1, $2, $3
    bnez    $1, .Lclear_bss
     addiu  $2, $2, 16

    # SetupThread(_gp, stack, stack_size, _args, _root) returns the stack
    # pointer the main thread is to run on.
    lui     $4, %hi(_gp)
    lui     $5, %hi(STACK_BASE)
    lui     $6, %hi(STACK_SIZE)
    lui     $7, %hi(_args)
    lui     $8, %hi(_root)
    addiu   $4, $4, %lo(_gp)
    addiu   $5, $5, %lo(STACK_BASE)
    addiu   $6, $6, %lo(STACK_SIZE)
    addiu   $7, $7, %lo(_args)
    addiu   $8, $8, %lo(_root)
    move    $28, $4
    addiu   $3, $0, SYS_SetupThread
    syscall
    move    $29, $2

    # SetupHeap(end of .bss, heap size).
    lui     $4, %hi(BSS_END)
    lui     $5, %hi(HEAP_SIZE)
    addiu   $4, $4, %lo(BSS_END)
    addiu   $5, $5, %lo(HEAP_SIZE)
    addiu   $3, $0, SYS_SetupHeap
    syscall

    jal     InitThread
     nop
    jal     FlushCache
     move   $4, $0
    ei

    # Exit(main(argc, argv)), with the arguments the kernel stored in _args.
    lui     $2, %hi(_args)
    addiu   $2, $2, %lo(_args)
    lw      $4, 0($2)
    jal     main
     addiu  $5, $2, 4
    j       Exit
     move   $4, $2

# Terminates the program with a status of zero.
.global _exit
_exit:
    j       Exit
     move   $4, $0

# Entry point of the thread SetupThread creates; ends that thread.
.global _root
_root:
    addiu   $3, $0, SYS_ExitThread
    syscall

# Returns whether two doubles are equal.
.global _dpfeq
.type _dpfeq, @function
_dpfeq:
    addiu   $29, $29, -16
    sq      $31, 0($29)
    jal     dpcmp
     nop
    lq      $31, 0($29)
    xor     $2, $2, $0
    sltiu   $2, $2, 1
    jr      $31
     addiu  $29, $29, 16
.size _dpfeq, . - _dpfeq

# Pad to the next 16-byte boundary.
    nop
    nop
    nop

# Returns whether two doubles are unequal.
.global _dpfne
.type _dpfne, @function
_dpfne:
    addiu   $29, $29, -16
    sq      $31, 0($29)
    jal     dpcmp
     nop
    lq      $31, 0($29)
    sltu    $2, $0, $2
    jr      $31
     addiu  $29, $29, 16
.size _dpfne, . - _dpfne

# Returns whether the first double is less than the second.
.global _dpflt
.type _dpflt, @function
_dpflt:
    addiu   $29, $29, -16
    sq      $31, 0($29)
    jal     dpcmp
     nop
    lq      $31, 0($29)
    slt     $2, $2, $0
    jr      $31
     addiu  $29, $29, 16
.size _dpflt, . - _dpflt

# Returns whether the first double is less than or equal to the second.
.global _dpfle
.type _dpfle, @function
_dpfle:
    addiu   $29, $29, -16
    sq      $31, 0($29)
    jal     dpcmp
     nop
    lq      $31, 0($29)
    slt     $2, $0, $2
    xori    $2, $2, 1
    jr      $31
     addiu  $29, $29, 16
.size _dpfle, . - _dpfle

# Pad to the next 16-byte boundary.
    nop
    nop
    nop

# Returns whether the first double is greater than the second.
.global _dpfgt
.type _dpfgt, @function
_dpfgt:
    addiu   $29, $29, -16
    sq      $31, 0($29)
    jal     dpcmp
     nop
    lq      $31, 0($29)
    slt     $2, $0, $2
    jr      $31
     addiu  $29, $29, 16
.size _dpfgt, . - _dpfgt

# Returns whether the first double is greater than or equal to the second.
.global _dpfge
.type _dpfge, @function
_dpfge:
    addiu   $29, $29, -16
    sq      $31, 0($29)
    jal     dpcmp
     nop
    lq      $31, 0($29)
    slt     $2, $2, $0
    xori    $2, $2, 1
    jr      $31
     addiu  $29, $29, 16
.size _dpfge, . - _dpfge

# Pad to the 8-byte boundary the next unit starts on.
    nop
