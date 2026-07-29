.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SndBgmStop__Fv
/* 059CA0 00159BA0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 059CA4 00159BA4 0000BF7F */  sq          $31, 0x0($29)
/* 059CA8 00159BA8 048E838F */  lw          $3, -0x71FC($28)
/* 059CAC 00159BAC 0E006004 */  bltz        $3, .L00159BE8
/* 059CB0 00159BB0 00000000 */   nop
/* 059CB4 00159BB4 088E838F */  lw          $3, -0x71F8($28)
/* 059CB8 00159BB8 0B006010 */  beqz        $3, .L00159BE8
/* 059CBC 00159BBC 00000000 */   nop
/* 059CC0 00159BC0 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 059CC4 00159BC4 282E0070 */  paddub      $5, $0, $0
/* 059CC8 00159BC8 441A050C */  jal         Stop__6CSoundFi
/* 059CCC 00159BCC 00000000 */   nop
/* 059CD0 00159BD0 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 059CD4 00159BD4 282E0070 */  paddub      $5, $0, $0
/* 059CD8 00159BD8 FC0E050C */  jal         StopVoice__6CSoundFi
/* 059CDC 00159BDC 00000000 */   nop
/* 059CE0 00159BE0 0C8E80AF */  sw          $0, -0x71F4($28)
/* 059CE4 00159BE4 088E80AF */  sw          $0, -0x71F8($28)
.L00159BE8:
/* 059CE8 00159BE8 0000BF7B */  lq          $31, 0x0($29)
/* 059CEC 00159BEC 1000BD27 */  addiu       $29, $29, 0x10
/* 059CF0 00159BF0 0800E003 */  jr          $31
/* 059CF4 00159BF4 00000000 */   nop
/* 059CF8 00159BF8 00000000 */  nop
/* 059CFC 00159BFC 00000000 */  nop
