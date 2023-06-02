.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetWidth__9CMapPartsFv
/* 9AB20 0019AA20 0801858C */  lw         $5, 0x108($4)
/* 9AB24 0019AA24 0400A014 */  bnez       $5, .L0019AA38
/* 9AB28 0019AA28 00000000 */   nop
/* 9AB2C 0019AA2C 01000224 */  addiu      $2, $0, 0x1
/* 9AB30 0019AA30 0F000010 */  b          .L0019AA70
/* 9AB34 0019AA34 00000000 */   nop
.L0019AA38:
/* 9AB38 0019AA38 F800838C */  lw         $3, 0xF8($4)
/* 9AB3C 0019AA3C 01006230 */  andi       $2, $3, 0x1
/* 9AB40 0019AA40 04006104 */  bgez       $3, .L0019AA54
/* 9AB44 0019AA44 00000000 */   nop
/* 9AB48 0019AA48 02004010 */  beqz       $2, .L0019AA54
/* 9AB4C 0019AA4C 00000000 */   nop
/* 9AB50 0019AA50 FEFF4224 */  addiu      $2, $2, -0x2
.L0019AA54:
/* 9AB54 0019AA54 04004010 */  beqz       $2, .L0019AA68
/* 9AB58 0019AA58 00000000 */   nop
/* 9AB5C 0019AA5C 2000A28C */  lw         $2, 0x20($5)
/* 9AB60 0019AA60 03000010 */  b          .L0019AA70
/* 9AB64 0019AA64 00000000 */   nop
.L0019AA68:
/* 9AB68 0019AA68 1C00A28C */  lw         $2, 0x1C($5)
/* 9AB6C 0019AA6C 00000000 */  nop
.L0019AA70:
/* 9AB70 0019AA70 0800E003 */  jr         $31
/* 9AB74 0019AA74 00000000 */   nop
/* 9AB78 0019AA78 00000000 */  nop
/* 9AB7C 0019AA7C 00000000 */  nop
