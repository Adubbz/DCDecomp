.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetHeight__9CMapPartsFv
/* 09AB80 0019AA80 0801858C */  lw          $5, 0x108($4)
/* 09AB84 0019AA84 0400A014 */  bnez        $5, .L0019AA98
/* 09AB88 0019AA88 00000000 */   nop
/* 09AB8C 0019AA8C 01000224 */  addiu       $2, $0, 0x1
/* 09AB90 0019AA90 0F000010 */  b           .L0019AAD0
/* 09AB94 0019AA94 00000000 */   nop
.L0019AA98:
/* 09AB98 0019AA98 F800838C */  lw          $3, 0xF8($4)
/* 09AB9C 0019AA9C 01006230 */  andi        $2, $3, 0x1
/* 09ABA0 0019AAA0 04006104 */  bgez        $3, .L0019AAB4
/* 09ABA4 0019AAA4 00000000 */   nop
/* 09ABA8 0019AAA8 02004010 */  beqz        $2, .L0019AAB4
/* 09ABAC 0019AAAC 00000000 */   nop
/* 09ABB0 0019AAB0 FEFF4224 */  addiu       $2, $2, -0x2
.L0019AAB4:
/* 09ABB4 0019AAB4 04004010 */  beqz        $2, .L0019AAC8
/* 09ABB8 0019AAB8 00000000 */   nop
/* 09ABBC 0019AABC 1C00A28C */  lw          $2, 0x1C($5)
/* 09ABC0 0019AAC0 03000010 */  b           .L0019AAD0
/* 09ABC4 0019AAC4 00000000 */   nop
.L0019AAC8:
/* 09ABC8 0019AAC8 2000A28C */  lw          $2, 0x20($5)
/* 09ABCC 0019AACC 00000000 */  nop
.L0019AAD0:
/* 09ABD0 0019AAD0 0800E003 */  jr          $31
/* 09ABD4 0019AAD4 00000000 */   nop
/* 09ABD8 0019AAD8 00000000 */  nop
/* 09ABDC 0019AADC 00000000 */  nop
