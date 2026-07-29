.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetCompEvent__14CEditPartsInfoFi
/* 09A200 0019A100 F0FFBD27 */  addiu       $29, $29, -0x10
/* 09A204 0019A104 0000BF7F */  sq          $31, 0x0($29)
/* 09A208 0019A108 F467060C */  jal         GetPartsInfo__14CEditPartsInfoFi
/* 09A20C 0019A10C 00000000 */   nop
/* 09A210 0019A110 04004014 */  bnez        $2, .L0019A124
/* 09A214 0019A114 00000000 */   nop
/* 09A218 0019A118 28160070 */  paddub      $2, $0, $0
/* 09A21C 0019A11C 04000010 */  b           .L0019A130
/* 09A220 0019A120 00000000 */   nop
.L0019A124:
/* 09A224 0019A124 0400428C */  lw          $2, 0x4($2)
/* 09A228 0019A128 01004230 */  andi        $2, $2, 0x1
/* 09A22C 0019A12C 2B100200 */  sltu        $2, $0, $2
.L0019A130:
/* 09A230 0019A130 0000BF7B */  lq          $31, 0x0($29)
/* 09A234 0019A134 1000BD27 */  addiu       $29, $29, 0x10
/* 09A238 0019A138 0800E003 */  jr          $31
/* 09A23C 0019A13C 00000000 */   nop
