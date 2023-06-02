.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndBgmStop__Fv
/* 59CA0 00159BA0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 59CA4 00159BA4 0000BF7F */  sq         $31, 0x0($sp)
/* 59CA8 00159BA8 048E838F */  lw         $3, -0x71FC($gp)
/* 59CAC 00159BAC 0E006004 */  bltz       $3, .L00159BE8
/* 59CB0 00159BB0 00000000 */   nop
/* 59CB4 00159BB4 088E838F */  lw         $3, -0x71F8($gp)
/* 59CB8 00159BB8 0B006010 */  beqz       $3, .L00159BE8
/* 59CBC 00159BBC 00000000 */   nop
/* 59CC0 00159BC0 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 59CC4 00159BC4 282E0070 */  paddub     $5, $0, $0
/* 59CC8 00159BC8 441A050C */  jal        Stop__6CSoundFi
/* 59CCC 00159BCC 00000000 */   nop
/* 59CD0 00159BD0 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 59CD4 00159BD4 282E0070 */  paddub     $5, $0, $0
/* 59CD8 00159BD8 FC0E050C */  jal        StopVoice__6CSoundFi
/* 59CDC 00159BDC 00000000 */   nop
/* 59CE0 00159BE0 0C8E80AF */  sw         $0, -0x71F4($gp)
/* 59CE4 00159BE4 088E80AF */  sw         $0, -0x71F8($gp)
.L00159BE8:
/* 59CE8 00159BE8 0000BF7B */  lq         $31, 0x0($sp)
/* 59CEC 00159BEC 1000BD27 */  addiu      $sp, $sp, 0x10
/* 59CF0 00159BF0 0800E003 */  jr         $31
/* 59CF4 00159BF4 00000000 */   nop
/* 59CF8 00159BF8 00000000 */  nop
/* 59CFC 00159BFC 00000000 */  nop
