.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetFrameNum__6CFrameFv
/* 28120 00128020 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 28124 00128024 2000BF7F */  sq         $31, 0x20($sp)
/* 28128 00128028 1000B17F */  sq         $17, 0x10($sp)
/* 2812C 0012802C 0000B07F */  sq         $16, 0x0($sp)
/* 28130 00128030 01001024 */  addiu      $16, $0, 0x1
/* 28134 00128034 3801918C */  lw         $17, 0x138($4)
/* 28138 00128038 07000010 */  b          .L00128058
/* 2813C 0012803C 00000000 */   nop
.L00128040:
/* 28140 00128040 28262072 */  paddub     $4, $17, $0
/* 28144 00128044 08A0040C */  jal        GetFrameNum__6CFrameFv
/* 28148 00128048 00000000 */   nop
/* 2814C 0012804C 21800202 */  addu       $16, $16, $2
/* 28150 00128050 3C01318E */  lw         $17, 0x13C($17)
/* 28154 00128054 00000000 */  nop
.L00128058:
/* 28158 00128058 F9FF2016 */  bnez       $17, .L00128040
/* 2815C 0012805C 00000000 */   nop
/* 28160 00128060 28160072 */  paddub     $2, $16, $0
/* 28164 00128064 2000BF7B */  lq         $31, 0x20($sp)
/* 28168 00128068 1000B17B */  lq         $17, 0x10($sp)
/* 2816C 0012806C 0000B07B */  lq         $16, 0x0($sp)
/* 28170 00128070 3000BD27 */  addiu      $sp, $sp, 0x30
/* 28174 00128074 0800E003 */  jr         $31
/* 28178 00128078 00000000 */   nop
/* 2817C 0012807C 00000000 */  nop
