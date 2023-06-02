.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Draw__10CMainCharaFv
/* 39DA0 00139CA0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 39DA4 00139CA4 0000BF7F */  sq         $31, 0x0($sp)
/* 39DA8 00139CA8 C4E4040C */  jal        Draw__10CCharacterFv
/* 39DAC 00139CAC 00000000 */   nop
/* 39DB0 00139CB0 0000BF7B */  lq         $31, 0x0($sp)
/* 39DB4 00139CB4 1000BD27 */  addiu      $sp, $sp, 0x10
/* 39DB8 00139CB8 0800E003 */  jr         $31
/* 39DBC 00139CBC 00000000 */   nop
