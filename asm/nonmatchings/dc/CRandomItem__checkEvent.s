.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel checkEvent__11CRandomItemFv
/* D6FF0 001D6EF0 282E0070 */  paddub     $5, $0, $0
/* D6FF4 001D6EF4 0C000010 */  b          .L001D6F28
/* D6FF8 001D6EF8 00000000 */   nop
.L001D6EFC:
/* D6FFC 001D6EFC 80100500 */  sll        $2, $5, 2
/* D7000 001D6F00 21104400 */  addu       $2, $2, $4
/* D7004 001D6F04 94044624 */  addiu      $6, $2, 0x494
/* D7008 001D6F08 9404428C */  lw         $2, 0x494($2)
/* D700C 001D6F0C FFFF0324 */  addiu      $3, $0, -0x1
/* D7010 001D6F10 04004310 */  beq        $2, $3, .L001D6F24
/* D7014 001D6F14 00000000 */   nop
/* D7018 001D6F18 0000C3AC */  sw         $3, 0x0($6)
/* D701C 001D6F1C 06000010 */  b          .L001D6F38
/* D7020 001D6F20 00000000 */   nop
.L001D6F24:
/* D7024 001D6F24 0100A524 */  addiu      $5, $5, 0x1
.L001D6F28:
/* D7028 001D6F28 2000A228 */  slti       $2, $5, 0x20
/* D702C 001D6F2C F3FF4014 */  bnez       $2, .L001D6EFC
/* D7030 001D6F30 00000000 */   nop
/* D7034 001D6F34 FFFF0224 */  addiu      $2, $0, -0x1
.L001D6F38:
/* D7038 001D6F38 0800E003 */  jr         $31
/* D703C 001D6F3C 00000000 */   nop
