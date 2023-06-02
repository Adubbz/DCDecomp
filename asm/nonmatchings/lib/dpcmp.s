.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel dpcmp
/* 104A0 001103A0 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 104A4 001103A4 4000A4FF */  sd         $4, 0x40($sp)
/* 104A8 001103A8 4800A5FF */  sd         $5, 0x48($sp)
/* 104AC 001103AC 4000A427 */  addiu      $4, $sp, 0x40
/* 104B0 001103B0 5000B0FF */  sd         $16, 0x50($sp)
/* 104B4 001103B4 6000BFFF */  sd         $31, 0x60($sp)
/* 104B8 001103B8 B63E040C */  jal        __unpack_d
/* 104BC 001103BC 2D28A003 */   daddu     $5, $sp, $0
/* 104C0 001103C0 2000B027 */  addiu      $16, $sp, 0x20
/* 104C4 001103C4 4800A427 */  addiu      $4, $sp, 0x48
/* 104C8 001103C8 B63E040C */  jal        __unpack_d
/* 104CC 001103CC 2D280002 */   daddu     $5, $16, $0
/* 104D0 001103D0 2D280002 */  daddu      $5, $16, $0
/* 104D4 001103D4 A240040C */  jal        __fpcmp_parts_d
/* 104D8 001103D8 2D20A003 */   daddu     $4, $sp, $0
/* 104DC 001103DC 6000BFDF */  ld         $31, 0x60($sp)
/* 104E0 001103E0 5000B0DF */  ld         $16, 0x50($sp)
/* 104E4 001103E4 0800E003 */  jr         $31
/* 104E8 001103E8 7000BD27 */   addiu     $sp, $sp, 0x70
/* 104EC 001103EC 00000000 */  nop
