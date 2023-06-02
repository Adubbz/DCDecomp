.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceVif1PkEnd
/* 20EE0 00120DE0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 20EE4 00120DE4 1000B1FF */  sd         $17, 0x10($sp)
/* 20EE8 00120DE8 2D888000 */  daddu      $17, $4, $0
/* 20EEC 00120DEC 0000B0FF */  sd         $16, 0x0($sp)
/* 20EF0 00120DF0 2000BFFF */  sd         $31, 0x20($sp)
/* 20EF4 00120DF4 0A83040C */  jal        sceVif1PkTerminate
/* 20EF8 00120DF8 2D80A000 */   daddu     $16, $5, $0
/* 20EFC 00120DFC 0000248E */  lw         $4, 0x0($17)
/* 20F00 00120E00 0070033C */  lui        $3, (0x70000000 >> 16)
/* 20F04 00120E04 25800302 */  or         $16, $16, $3
/* 20F08 00120E08 080022AE */  sw         $2, 0x8($17)
/* 20F0C 00120E0C 000090AC */  sw         $16, 0x0($4)
/* 20F10 00120E10 04008424 */  addiu      $4, $4, 0x4
/* 20F14 00120E14 0C0020AE */  sw         $0, 0xC($17)
/* 20F18 00120E18 04008224 */  addiu      $2, $4, 0x4
/* 20F1C 00120E1C 2000BFDF */  ld         $31, 0x20($sp)
/* 20F20 00120E20 000022AE */  sw         $2, 0x0($17)
/* 20F24 00120E24 1000B1DF */  ld         $17, 0x10($sp)
/* 20F28 00120E28 0000B0DF */  ld         $16, 0x0($sp)
/* 20F2C 00120E2C 000080AC */  sw         $0, 0x0($4)
/* 20F30 00120E30 0800E003 */  jr         $31
/* 20F34 00120E34 3000BD27 */   addiu     $sp, $sp, 0x30
