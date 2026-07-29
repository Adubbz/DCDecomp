.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ChangeDir__6CBoundFPfPfPf
/* 03D6C0 0013D5C0 C0FFBD27 */  addiu       $29, $29, -0x40
/* 03D6C4 0013D5C4 3000BF7F */  sq          $31, 0x30($29)
/* 03D6C8 0013D5C8 2000B27F */  sq          $18, 0x20($29)
/* 03D6CC 0013D5CC 1000B17F */  sq          $17, 0x10($29)
/* 03D6D0 0013D5D0 0000B07F */  sq          $16, 0x0($29)
/* 03D6D4 0013D5D4 28968070 */  paddub      $18, $4, $0
/* 03D6D8 0013D5D8 288EC070 */  paddub      $17, $6, $0
/* 03D6DC 0013D5DC 2886E070 */  paddub      $16, $7, $0
/* 03D6E0 0013D5E0 F0004426 */  addiu       $4, $18, 0xF0
/* 03D6E4 0013D5E4 0C86040C */  jal         sceVu0CopyVector
/* 03D6E8 0013D5E8 00000000 */   nop
/* 03D6EC 0013D5EC 00014426 */  addiu       $4, $18, 0x100
/* 03D6F0 0013D5F0 282E2072 */  paddub      $5, $17, $0
/* 03D6F4 0013D5F4 0C86040C */  jal         sceVu0CopyVector
/* 03D6F8 0013D5F8 00000000 */   nop
/* 03D6FC 0013D5FC 10014426 */  addiu       $4, $18, 0x110
/* 03D700 0013D600 282E0072 */  paddub      $5, $16, $0
/* 03D704 0013D604 0C86040C */  jal         sceVu0CopyVector
/* 03D708 0013D608 00000000 */   nop
/* 03D70C 0013D60C 3000BF7B */  lq          $31, 0x30($29)
/* 03D710 0013D610 2000B27B */  lq          $18, 0x20($29)
/* 03D714 0013D614 1000B17B */  lq          $17, 0x10($29)
/* 03D718 0013D618 0000B07B */  lq          $16, 0x0($29)
/* 03D71C 0013D61C 4000BD27 */  addiu       $29, $29, 0x40
/* 03D720 0013D620 0800E003 */  jr          $31
/* 03D724 0013D624 00000000 */   nop
/* 03D728 0013D628 00000000 */  nop
/* 03D72C 0013D62C 00000000 */  nop
