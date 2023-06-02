.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetItemMenuOldAmbient__Fv
/* 10E270 0020E170 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 10E274 0020E174 0000BF7F */  sq         $31, 0x0($sp)
/* 10E278 0020E178 DA01023C */  lui        $2, %hi(MenuCharaOldAmbient)
/* 10E27C 0020E17C D0EE4424 */  addiu      $4, $2, %lo(MenuCharaOldAmbient)
/* 10E280 0020E180 40B7040C */  jal        MGSetAmbient__FPf
/* 10E284 0020E184 00000000 */   nop
/* 10E288 0020E188 0000BF7B */  lq         $31, 0x0($sp)
/* 10E28C 0020E18C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 10E290 0020E190 0800E003 */  jr         $31
/* 10E294 0020E194 00000000 */   nop
/* 10E298 0020E198 00000000 */  nop
/* 10E29C 0020E19C 00000000 */  nop
