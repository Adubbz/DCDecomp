.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdCheckItem__Fi
/* 73370 00173270 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 73374 00173274 2000BF7F */  sq         $31, 0x20($sp)
/* 73378 00173278 1000B17F */  sq         $17, 0x10($sp)
/* 7337C 0017327C 0000B07F */  sq         $16, 0x0($sp)
/* 73380 00173280 288E8070 */  paddub     $17, $4, $0
/* 73384 00173284 1C8D848F */  lw         $4, -0x72E4($gp)
/* 73388 00173288 7860050C */  jal        GetDngStatus__9CSaveDataFv
/* 7338C 0017328C 00000000 */   nop
/* 73390 00173290 28864070 */  paddub     $16, $2, $0
/* 73394 00173294 28262072 */  paddub     $4, $17, $0
/* 73398 00173298 E4CA050C */  jal        ConvertItemNo__Fi
/* 7339C 0017329C 00000000 */   nop
/* 733A0 001732A0 07004004 */  bltz       $2, .L001732C0
/* 733A4 001732A4 00000000 */   nop
/* 733A8 001732A8 28260072 */  paddub     $4, $16, $0
/* 733AC 001732AC 282E4070 */  paddub     $5, $2, $0
/* 733B0 001732B0 50F6060C */  jal        SearchItemIndexNo__14CDngStatusDataFi
/* 733B4 001732B4 00000000 */   nop
/* 733B8 001732B8 02000010 */  b          .L001732C4
/* 733BC 001732BC 00000000 */   nop
.L001732C0:
/* 733C0 001732C0 FFFF0224 */  addiu      $2, $0, -0x1
.L001732C4:
/* 733C4 001732C4 2000BF7B */  lq         $31, 0x20($sp)
/* 733C8 001732C8 1000B17B */  lq         $17, 0x10($sp)
/* 733CC 001732CC 0000B07B */  lq         $16, 0x0($sp)
/* 733D0 001732D0 3000BD27 */  addiu      $sp, $sp, 0x30
/* 733D4 001732D4 0800E003 */  jr         $31
/* 733D8 001732D8 00000000 */   nop
/* 733DC 001732DC 00000000 */  nop
