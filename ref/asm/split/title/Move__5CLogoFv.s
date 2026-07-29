.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Move__5CLogoFv
/* 0286D0 01DD43D0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0286D4 01DD43D4 0000BF7F */  sq          $31, 0x0($29)
/* 0286D8 01DD43D8 489C838F */  lw          $3, -0x63B8($28)
/* 0286DC 01DD43DC 80006128 */  slti        $1, $3, 0x80
/* 0286E0 01DD43E0 03002010 */  beqz        $1, .L01DD43F0_2D9BF0
/* 0286E4 01DD43E4 00000000 */   nop
/* 0286E8 01DD43E8 04006324 */  addiu       $3, $3, 0x4
/* 0286EC 01DD43EC 489C83AF */  sw          $3, -0x63B8($28)
.L01DD43F0_2D9BF0:
/* 0286F0 01DD43F0 489C838F */  lw          $3, -0x63B8($28)
/* 0286F4 01DD43F4 41006128 */  slti        $1, $3, 0x41
/* 0286F8 01DD43F8 03002014 */  bnez        $1, .L01DD4408_2D9C08
/* 0286FC 01DD43FC 00000000 */   nop
/* 028700 01DD4400 E04F770C */  jal         FadeOut__5CLogoFv
/* 028704 01DD4404 00000000 */   nop
.L01DD4408_2D9C08:
/* 028708 01DD4408 0000BF7B */  lq          $31, 0x0($29)
/* 02870C 01DD440C 1000BD27 */  addiu       $29, $29, 0x10
/* 028710 01DD4410 0800E003 */  jr          $31
/* 028714 01DD4414 00000000 */   nop
/* 028718 01DD4418 00000000 */  nop
/* 02871C 01DD441C 00000000 */  nop
