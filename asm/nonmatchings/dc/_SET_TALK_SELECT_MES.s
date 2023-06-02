.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_TALK_SELECT_MES__FP12RS_STACKDATAi
/* 919E0 001918E0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 919E4 001918E4 1000BF7F */  sq         $31, 0x10($sp)
/* 919E8 001918E8 0000B07F */  sq         $16, 0x0($sp)
/* 919EC 001918EC 08009024 */  addiu      $16, $4, 0x8
/* 919F0 001918F0 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 919F4 001918F4 00000000 */   nop
/* 919F8 001918F8 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 919FC 001918FC 78D422AC */  sw         $2, -0x2B88($at)
/* 91A00 00191900 28260072 */  paddub     $4, $16, $0
/* 91A04 00191904 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 91A08 00191908 00000000 */   nop
/* 91A0C 0019190C D401013C */  lui        $at, (0x1D40000 >> 16)
/* 91A10 00191910 74D422AC */  sw         $2, -0x2B8C($at)
/* 91A14 00191914 01000224 */  addiu      $2, $0, 0x1
/* 91A18 00191918 1000BF7B */  lq         $31, 0x10($sp)
/* 91A1C 0019191C 0000B07B */  lq         $16, 0x0($sp)
/* 91A20 00191920 2000BD27 */  addiu      $sp, $sp, 0x20
/* 91A24 00191924 0800E003 */  jr         $31
/* 91A28 00191928 00000000 */   nop
/* 91A2C 0019192C 00000000 */  nop
