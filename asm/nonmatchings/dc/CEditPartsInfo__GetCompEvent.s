.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetCompEvent__14CEditPartsInfoFi
/* 9A200 0019A100 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 9A204 0019A104 0000BF7F */  sq         $31, 0x0($sp)
/* 9A208 0019A108 F467060C */  jal        GetPartsInfo__14CEditPartsInfoFi
/* 9A20C 0019A10C 00000000 */   nop
/* 9A210 0019A110 04004014 */  bnez       $2, .L0019A124
/* 9A214 0019A114 00000000 */   nop
/* 9A218 0019A118 28160070 */  paddub     $2, $0, $0
/* 9A21C 0019A11C 04000010 */  b          .L0019A130
/* 9A220 0019A120 00000000 */   nop
.L0019A124:
/* 9A224 0019A124 0400428C */  lw         $2, 0x4($2)
/* 9A228 0019A128 01004230 */  andi       $2, $2, 0x1
/* 9A22C 0019A12C 2B100200 */  sltu       $2, $0, $2
.L0019A130:
/* 9A230 0019A130 0000BF7B */  lq         $31, 0x0($sp)
/* 9A234 0019A134 1000BD27 */  addiu      $sp, $sp, 0x10
/* 9A238 0019A138 0800E003 */  jr         $31
/* 9A23C 0019A13C 00000000 */   nop
