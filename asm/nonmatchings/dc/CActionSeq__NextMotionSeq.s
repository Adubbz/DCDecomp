.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel NextMotionSeq__10CActionSeqFv
/* 54E70 00154D70 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 54E74 00154D74 1000BF7F */  sq         $31, 0x10($sp)
/* 54E78 00154D78 0000B07F */  sq         $16, 0x0($sp)
/* 54E7C 00154D7C 28868070 */  paddub     $16, $4, $0
/* 54E80 00154D80 0853050C */  jal        GetNextSeq__10CActionSeqFv
/* 54E84 00154D84 00000000 */   nop
/* 54E88 00154D88 04004014 */  bnez       $2, .L00154D9C
/* 54E8C 00154D8C 00000000 */   nop
/* 54E90 00154D90 28160070 */  paddub     $2, $0, $0
/* 54E94 00154D94 0B000010 */  b          .L00154DC4
/* 54E98 00154D98 00000000 */   nop
.L00154D9C:
/* 54E9C 00154D9C B800038E */  lw         $3, 0xB8($16)
/* 54EA0 00154DA0 02006010 */  beqz       $3, .L00154DAC
/* 54EA4 00154DA4 00000000 */   nop
/* 54EA8 00154DA8 0C0062AC */  sw         $2, 0xC($3)
.L00154DAC:
/* 54EAC 00154DAC B80002AE */  sw         $2, 0xB8($16)
/* 54EB0 00154DB0 0C0040AC */  sw         $0, 0xC($2)
/* 54EB4 00154DB4 B400038E */  lw         $3, 0xB4($16)
/* 54EB8 00154DB8 02006014 */  bnez       $3, .L00154DC4
/* 54EBC 00154DBC 00000000 */   nop
/* 54EC0 00154DC0 B40002AE */  sw         $2, 0xB4($16)
.L00154DC4:
/* 54EC4 00154DC4 1000BF7B */  lq         $31, 0x10($sp)
/* 54EC8 00154DC8 0000B07B */  lq         $16, 0x0($sp)
/* 54ECC 00154DCC 2000BD27 */  addiu      $sp, $sp, 0x20
/* 54ED0 00154DD0 0800E003 */  jr         $31
/* 54ED4 00154DD4 00000000 */   nop
/* 54ED8 00154DD8 00000000 */  nop
/* 54EDC 00154DDC 00000000 */  nop
