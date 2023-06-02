.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 398F0 001397F0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 398F4 001397F4 0000BF7F */  sq         $31, 0x0($sp)
/* 398F8 001397F8 284E0071 */  paddub     $9, $8, $0
/* 398FC 001397FC 2846E070 */  paddub     $8, $7, $0
/* 39900 00139800 A000998C */  lw         $25, 0xA0($4)
/* 39904 00139804 B800398F */  lw         $25, 0xB8($25)
/* 39908 00139808 09F82003 */  jalr       $25
/* 3990C 0013980C 00000000 */   nop
/* 39910 00139810 0000BF7B */  lq         $31, 0x0($sp)
/* 39914 00139814 1000BD27 */  addiu      $sp, $sp, 0x10
/* 39918 00139818 0800E003 */  jr         $31
/* 3991C 0013981C 00000000 */   nop
