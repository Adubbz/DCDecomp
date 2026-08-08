.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_701
/* 19BE00 0029BD00 2A2A2A2A */ .word 0x2A2A2A2A
/* 19BE04 0029BD04 2A2A2A2A */ .word 0x2A2A2A2A
/* 19BE08 0029BD08 20416C6C */ .word 0x6C6C4120
/* 19BE0C 0029BD0C 20467261 */ .word 0x61724620
/* 19BE10 0029BD10 6D65204E */ .word 0x4E20656D
/* 19BE14 0029BD14 6F74466F */ .word 0x6F46746F
/* 19BE18 0029BD18 756E7420 */ .word 0x20746E75
/* 19BE1C 0029BD1C 2573202A */ .word 0x2A207325
/* 19BE20 0029BD20 2A2A2A2A */ .word 0x2A2A2A2A
/* 19BE24 0029BD24 2A2A0A00 */ .word 0x000A2A2A
