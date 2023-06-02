.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _CHECK_EVENT_FLG__FP12RS_STACKDATAi
/* BBCC0 001BBBC0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* BBCC4 001BBBC4 1000BF7F */  sq         $31, 0x10($sp)
/* BBCC8 001BBBC8 0000B07F */  sq         $16, 0x0($sp)
/* BBCCC 001BBBCC 08009024 */  addiu      $16, $4, 0x8
/* BBCD0 001BBBD0 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BBCD4 001BBBD4 00000000 */   nop
/* BBCD8 001BBBD8 789C848F */  lw         $4, -0x6388($gp)
/* BBCDC 001BBBDC 282E4070 */  paddub     $5, $2, $0
/* BBCE0 001BBBE0 B0F6060C */  jal        ChkEventFlag__11CUserStatusFi
/* BBCE4 001BBBE4 00000000 */   nop
/* BBCE8 001BBBE8 282E4070 */  paddub     $5, $2, $0
/* BBCEC 001BBBEC 28260072 */  paddub     $4, $16, $0
/* BBCF0 001BBBF0 70EE060C */  jal        SetStack__FP12RS_STACKDATAi_2
/* BBCF4 001BBBF4 00000000 */   nop
/* BBCF8 001BBBF8 01000224 */  addiu      $2, $0, 0x1
/* BBCFC 001BBBFC 1000BF7B */  lq         $31, 0x10($sp)
/* BBD00 001BBC00 0000B07B */  lq         $16, 0x0($sp)
/* BBD04 001BBC04 2000BD27 */  addiu      $sp, $sp, 0x20
/* BBD08 001BBC08 0800E003 */  jr         $31
/* BBD0C 001BBC0C 00000000 */   nop
