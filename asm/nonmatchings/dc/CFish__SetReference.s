.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetReference__5CFishFP6CFrame
/* 141190 00241090 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 141194 00241094 2000BF7F */  sq         $31, 0x20($sp)
/* 141198 00241098 1000B17F */  sq         $17, 0x10($sp)
/* 14119C 0024109C 0000B07F */  sq         $16, 0x0($sp)
/* 1411A0 002410A0 288E8070 */  paddub     $17, $4, $0
/* 1411A4 002410A4 2886A070 */  paddub     $16, $5, $0
/* 1411A8 002410A8 5C01848C */  lw         $4, 0x15C($4)
/* 1411AC 002410AC 03008010 */  beqz       $4, .L002410BC
/* 1411B0 002410B0 00000000 */   nop
/* 1411B4 002410B4 60A0040C */  jal        SetReference__6CFrameFP6CFrame
/* 1411B8 002410B8 00000000 */   nop
.L002410BC:
/* 1411BC 002410BC 0C13248E */  lw         $4, 0x130C($17)
/* 1411C0 002410C0 04008010 */  beqz       $4, .L002410D4
/* 1411C4 002410C4 00000000 */   nop
/* 1411C8 002410C8 282E0072 */  paddub     $5, $16, $0
/* 1411CC 002410CC 60A0040C */  jal        SetReference__6CFrameFP6CFrame
/* 1411D0 002410D0 00000000 */   nop
.L002410D4:
/* 1411D4 002410D4 2000BF7B */  lq         $31, 0x20($sp)
/* 1411D8 002410D8 1000B17B */  lq         $17, 0x10($sp)
/* 1411DC 002410DC 0000B07B */  lq         $16, 0x0($sp)
/* 1411E0 002410E0 3000BD27 */  addiu      $sp, $sp, 0x30
/* 1411E4 002410E4 0800E003 */  jr         $31
/* 1411E8 002410E8 00000000 */   nop
/* 1411EC 002410EC 00000000 */  nop
