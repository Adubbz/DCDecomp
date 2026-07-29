.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetTextLineDataTop__6ClsMesFi
/* 04F5B0 0014F4B0 A017828C */  lw          $2, 0x17A0($4)
/* 04F5B4 0014F4B4 00004484 */  lh          $4, 0x0($2)
/* 04F5B8 0014F4B8 02004624 */  addiu       $6, $2, 0x2
/* 04F5BC 0014F4BC 283E0070 */  paddub      $7, $0, $0
/* 04F5C0 0014F4C0 0E000010 */  b           .L0014F4FC
/* 04F5C4 0014F4C4 00000000 */   nop
.L0014F4C8:
/* 04F5C8 0014F4C8 80100700 */  sll         $2, $7, 2
/* 04F5CC 0014F4CC 21184600 */  addu        $3, $2, $6
/* 04F5D0 0014F4D0 02006284 */  lh          $2, 0x2($3)
/* 04F5D4 0014F4D4 0800A214 */  bne         $5, $2, .L0014F4F8
/* 04F5D8 0014F4D8 00000000 */   nop
/* 04F5DC 0014F4DC 04006284 */  lh          $2, 0x4($3)
/* 04F5E0 0014F4E0 40180200 */  sll         $3, $2, 1
/* 04F5E4 0014F4E4 40100400 */  sll         $2, $4, 1
/* 04F5E8 0014F4E8 2110C200 */  addu        $2, $6, $2
/* 04F5EC 0014F4EC 21104300 */  addu        $2, $2, $3
/* 04F5F0 0014F4F0 06000010 */  b           .L0014F50C
/* 04F5F4 0014F4F4 00000000 */   nop
.L0014F4F8:
/* 04F5F8 0014F4F8 0100E724 */  addiu       $7, $7, 0x1
.L0014F4FC:
/* 04F5FC 0014F4FC 2A10E400 */  slt         $2, $7, $4
/* 04F600 0014F500 F1FF4014 */  bnez        $2, .L0014F4C8
/* 04F604 0014F504 00000000 */   nop
/* 04F608 0014F508 28160070 */  paddub      $2, $0, $0
.L0014F50C:
/* 04F60C 0014F50C 0800E003 */  jr          $31
/* 04F610 0014F510 00000000 */   nop
/* 04F614 0014F514 00000000 */  nop
/* 04F618 0014F518 00000000 */  nop
/* 04F61C 0014F51C 00000000 */  nop
