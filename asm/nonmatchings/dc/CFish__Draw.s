.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Draw__5CFishFv
/* 140D70 00240C70 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 140D74 00240C74 0000BF7F */  sq         $31, 0x0($sp)
/* 140D78 00240C78 0000838C */  lw         $3, 0x0($4)
/* 140D7C 00240C7C 10006004 */  bltz       $3, .L00240CC0
/* 140D80 00240C80 00000000 */   nop
/* 140D84 00240C84 5C00828C */  lw         $2, 0x5C($4)
/* 140D88 00240C88 08004010 */  beqz       $2, .L00240CAC
/* 140D8C 00240C8C 00000000 */   nop
/* 140D90 00240C90 50128424 */  addiu      $4, $4, 0x1250
/* 140D94 00240C94 A000998C */  lw         $25, 0xA0($4)
/* 140D98 00240C98 AC00398F */  lw         $25, 0xAC($25)
/* 140D9C 00240C9C 09F82003 */  jalr       $25
/* 140DA0 00240CA0 00000000 */   nop
/* 140DA4 00240CA4 06000010 */  b          .L00240CC0
/* 140DA8 00240CA8 00000000 */   nop
.L00240CAC:
/* 140DAC 00240CAC A0008424 */  addiu      $4, $4, 0xA0
/* 140DB0 00240CB0 A000998C */  lw         $25, 0xA0($4)
/* 140DB4 00240CB4 AC00398F */  lw         $25, 0xAC($25)
/* 140DB8 00240CB8 09F82003 */  jalr       $25
/* 140DBC 00240CBC 00000000 */   nop
.L00240CC0:
/* 140DC0 00240CC0 0000BF7B */  lq         $31, 0x0($sp)
/* 140DC4 00240CC4 1000BD27 */  addiu      $sp, $sp, 0x10
/* 140DC8 00240CC8 0800E003 */  jr         $31
/* 140DCC 00240CCC 00000000 */   nop
