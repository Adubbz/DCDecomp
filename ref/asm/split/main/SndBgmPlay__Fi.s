.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SndBgmPlay__Fi
/* 059C30 00159B30 F0FFBD27 */  addiu       $29, $29, -0x10
/* 059C34 00159B34 0000BF7F */  sq          $31, 0x0($29)
/* 059C38 00159B38 28368070 */  paddub      $6, $4, $0
/* 059C3C 00159B3C F48D838F */  lw          $3, -0x720C($28)
/* 059C40 00159B40 11006014 */  bnez        $3, .L00159B88
/* 059C44 00159B44 00000000 */   nop
/* 059C48 00159B48 048E838F */  lw          $3, -0x71FC($28)
/* 059C4C 00159B4C 0E006004 */  bltz        $3, .L00159B88
/* 059C50 00159B50 00000000 */   nop
/* 059C54 00159B54 088E848F */  lw          $4, -0x71F8($28)
/* 059C58 00159B58 01000324 */  addiu       $3, $0, 0x1
/* 059C5C 00159B5C 0A008310 */  beq         $4, $3, .L00159B88
/* 059C60 00159B60 00000000 */   nop
/* 059C64 00159B64 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 059C68 00159B68 282E0070 */  paddub      $5, $0, $0
/* 059C6C 00159B6C 8814050C */  jal         SQ_Play__6CSoundFii
/* 059C70 00159B70 00000000 */   nop
/* 059C74 00159B74 7C67050C */  jal         SndGetDefaultBgmVol__Fv
/* 059C78 00159B78 00000000 */   nop
/* 059C7C 00159B7C 0C8E82AF */  sw          $2, -0x71F4($28)
/* 059C80 00159B80 01000324 */  addiu       $3, $0, 0x1
/* 059C84 00159B84 088E83AF */  sw          $3, -0x71F8($28)
.L00159B88:
/* 059C88 00159B88 0000BF7B */  lq          $31, 0x0($29)
/* 059C8C 00159B8C 1000BD27 */  addiu       $29, $29, 0x10
/* 059C90 00159B90 0800E003 */  jr          $31
/* 059C94 00159B94 00000000 */   nop
/* 059C98 00159B98 00000000 */  nop
/* 059C9C 00159B9C 00000000 */  nop
