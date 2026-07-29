.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetRotation__10CCharacterF11CVector3_f_
/* 039310 00139210 E0FFBD27 */  addiu       $29, $29, -0x20
/* 039314 00139214 0000BF7F */  sq          $31, 0x0($29)
/* 039318 00139218 1000A327 */  addiu       $3, $29, 0x10
/* 03931C 0013921C 0000A278 */  lq          $2, 0x0($5)
/* 039320 00139220 0000627C */  sq          $2, 0x0($3)
/* 039324 00139224 1000ACC7 */  lwc1        $f12, 0x10($29)
/* 039328 00139228 1400ADC7 */  lwc1        $f13, 0x14($29)
/* 03932C 0013922C 1800AEC7 */  lwc1        $f14, 0x18($29)
/* 039330 00139230 54E4040C */  jal         SetRotation__10CCharacterFfff
/* 039334 00139234 00000000 */   nop
/* 039338 00139238 0000BF7B */  lq          $31, 0x0($29)
/* 03933C 0013923C 2000BD27 */  addiu       $29, $29, 0x20
/* 039340 00139240 0800E003 */  jr          $31
/* 039344 00139244 00000000 */   nop
/* 039348 00139248 00000000 */  nop
/* 03934C 0013924C 00000000 */  nop
