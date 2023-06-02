.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetRotation__10CCharacterF11CVector3_f_
/* 39310 00139210 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 39314 00139214 0000BF7F */  sq         $31, 0x0($sp)
/* 39318 00139218 1000A327 */  addiu      $3, $sp, 0x10
/* 3931C 0013921C 0000A278 */  lq         $2, 0x0($5)
/* 39320 00139220 0000627C */  sq         $2, 0x0($3)
/* 39324 00139224 1000ACC7 */  lwc1       $f12, 0x10($sp)
/* 39328 00139228 1400ADC7 */  lwc1       $f13, 0x14($sp)
/* 3932C 0013922C 1800AEC7 */  lwc1       $f14, 0x18($sp)
/* 39330 00139230 54E4040C */  jal        SetRotation__10CCharacterFfff
/* 39334 00139234 00000000 */   nop
/* 39338 00139238 0000BF7B */  lq         $31, 0x0($sp)
/* 3933C 0013923C 2000BD27 */  addiu      $sp, $sp, 0x20
/* 39340 00139240 0800E003 */  jr         $31
/* 39344 00139244 00000000 */   nop
/* 39348 00139248 00000000 */  nop
/* 3934C 0013924C 00000000 */  nop
