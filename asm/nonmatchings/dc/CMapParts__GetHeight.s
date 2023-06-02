.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetHeight__9CMapPartsFv
/* 9AB80 0019AA80 0801858C */  lw         $5, 0x108($4)
/* 9AB84 0019AA84 0400A014 */  bnez       $5, .L0019AA98
/* 9AB88 0019AA88 00000000 */   nop
/* 9AB8C 0019AA8C 01000224 */  addiu      $2, $0, 0x1
/* 9AB90 0019AA90 0F000010 */  b          .L0019AAD0
/* 9AB94 0019AA94 00000000 */   nop
.L0019AA98:
/* 9AB98 0019AA98 F800838C */  lw         $3, 0xF8($4)
/* 9AB9C 0019AA9C 01006230 */  andi       $2, $3, 0x1
/* 9ABA0 0019AAA0 04006104 */  bgez       $3, .L0019AAB4
/* 9ABA4 0019AAA4 00000000 */   nop
/* 9ABA8 0019AAA8 02004010 */  beqz       $2, .L0019AAB4
/* 9ABAC 0019AAAC 00000000 */   nop
/* 9ABB0 0019AAB0 FEFF4224 */  addiu      $2, $2, -0x2
.L0019AAB4:
/* 9ABB4 0019AAB4 04004010 */  beqz       $2, .L0019AAC8
/* 9ABB8 0019AAB8 00000000 */   nop
/* 9ABBC 0019AABC 1C00A28C */  lw         $2, 0x1C($5)
/* 9ABC0 0019AAC0 03000010 */  b          .L0019AAD0
/* 9ABC4 0019AAC4 00000000 */   nop
.L0019AAC8:
/* 9ABC8 0019AAC8 2000A28C */  lw         $2, 0x20($5)
/* 9ABCC 0019AACC 00000000 */  nop
.L0019AAD0:
/* 9ABD0 0019AAD0 0800E003 */  jr         $31
/* 9ABD4 0019AAD4 00000000 */   nop
/* 9ABD8 0019AAD8 00000000 */  nop
/* 9ABDC 0019AADC 00000000 */  nop
