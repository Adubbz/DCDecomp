.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel OpB_LoadDataBG__Fv
/* 00D6D0 01DB93D0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 00D6D4 01DB93D4 0000BF7F */  sq          $31, 0x0($29)
.L01DB93D8_2BEBD8:
/* 00D6D8 01DB93D8 8CFB040C */  jal         ReadBGSync__Fv
/* 00D6DC 01DB93DC 00000000 */   nop
/* 00D6E0 01DB93E0 FDFF4014 */  bnez        $2, .L01DB93D8_2BEBD8
/* 00D6E4 01DB93E4 00000000 */   nop
/* 00D6E8 01DB93E8 948B858F */  lw          $5, -0x746C($28)
/* 00D6EC 01DB93EC DE01023C */  lui         $2, %hi(LIT_337__4)
/* 00D6F0 01DB93F0 D0E34424 */  addiu       $4, $2, %lo(LIT_337__4)
/* 00D6F4 01DB93F4 28360070 */  paddub      $6, $0, $0
/* 00D6F8 01DB93F8 ACFA040C */  jal         LoadFileBG__FPcP1Pi
/* 00D6FC 01DB93FC 00000000 */   nop
/* 00D700 01DB9400 FFFF0324 */  addiu       $3, $0, -0x1
/* 00D704 01DB9404 DE01013C */  lui         $1, %hi(CScript__2 + 0x1C)
/* 00D708 01DB9408 1C1B23AC */  sw          $3, %lo(CScript__2 + 0x1C)($1)
/* 00D70C 01DB940C 0000BF7B */  lq          $31, 0x0($29)
/* 00D710 01DB9410 1000BD27 */  addiu       $29, $29, 0x10
/* 00D714 01DB9414 0800E003 */  jr          $31
/* 00D718 01DB9418 00000000 */   nop
/* 00D71C 01DB941C 00000000 */  nop
