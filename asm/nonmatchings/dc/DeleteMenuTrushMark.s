.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DeleteMenuTrushMark__Fv
/* 12E810 0022E710 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 12E814 0022E714 0000BF7F */  sq         $31, 0x0($sp)
/* 12E818 0022E718 DB01023C */  lui        $2, %hi(MenuTrushMark)
/* 12E81C 0022E71C 10904424 */  addiu      $4, $2, %lo(MenuTrushMark)
/* 12E820 0022E720 282E0070 */  paddub     $5, $0, $0
/* 12E824 0022E724 64000624 */  addiu      $6, $0, 0x64
/* 12E828 0022E728 5A0D040C */  jal        memset
/* 12E82C 0022E72C 00000000 */   nop
/* 12E830 0022E730 0000BF7B */  lq         $31, 0x0($sp)
/* 12E834 0022E734 1000BD27 */  addiu      $sp, $sp, 0x10
/* 12E838 0022E738 0800E003 */  jr         $31
/* 12E83C 0022E73C 00000000 */   nop
