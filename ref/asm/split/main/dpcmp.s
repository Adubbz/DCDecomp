.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel dpcmp
/* 0104A0 001103A0 90FFBD27 */  addiu       $29, $29, -0x70
/* 0104A4 001103A4 4000A4FF */  sd          $4, 0x40($29)
/* 0104A8 001103A8 4800A5FF */  sd          $5, 0x48($29)
/* 0104AC 001103AC 4000A427 */  addiu       $4, $29, 0x40
/* 0104B0 001103B0 5000B0FF */  sd          $16, 0x50($29)
/* 0104B4 001103B4 6000BFFF */  sd          $31, 0x60($29)
/* 0104B8 001103B8 B63E040C */  jal         __unpack_d
/* 0104BC 001103BC 2D28A003 */   daddu      $5, $29, $0
/* 0104C0 001103C0 2000B027 */  addiu       $16, $29, 0x20
/* 0104C4 001103C4 4800A427 */  addiu       $4, $29, 0x48
/* 0104C8 001103C8 B63E040C */  jal         __unpack_d
/* 0104CC 001103CC 2D280002 */   daddu      $5, $16, $0
/* 0104D0 001103D0 2D280002 */  daddu       $5, $16, $0
/* 0104D4 001103D4 A240040C */  jal         __fpcmp_parts_d
/* 0104D8 001103D8 2D20A003 */   daddu      $4, $29, $0
/* 0104DC 001103DC 6000BFDF */  ld          $31, 0x60($29)
/* 0104E0 001103E0 5000B0DF */  ld          $16, 0x50($29)
/* 0104E4 001103E4 0800E003 */  jr          $31
/* 0104E8 001103E8 7000BD27 */   addiu      $29, $29, 0x70
/* 0104EC 001103EC 00000000 */  nop
