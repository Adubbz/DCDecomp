.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetPosition__7CObjectF11CVector3_f_
/* 56D90 00156C90 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 56D94 00156C94 0000A627 */  addiu      $6, $sp, 0x0
/* 56D98 00156C98 0000A378 */  lq         $3, 0x0($5)
/* 56D9C 00156C9C 0000C37C */  sq         $3, 0x0($6)
/* 56DA0 00156CA0 0000A0C7 */  lwc1       $f0, 0x0($sp)
/* 56DA4 00156CA4 100080E4 */  swc1       $f0, 0x10($4)
/* 56DA8 00156CA8 0400A0C7 */  lwc1       $f0, 0x4($sp)
/* 56DAC 00156CAC 140080E4 */  swc1       $f0, 0x14($4)
/* 56DB0 00156CB0 0800A0C7 */  lwc1       $f0, 0x8($sp)
/* 56DB4 00156CB4 180080E4 */  swc1       $f0, 0x18($4)
/* 56DB8 00156CB8 1000BD27 */  addiu      $sp, $sp, 0x10
/* 56DBC 00156CBC 0800E003 */  jr         $31
/* 56DC0 00156CC0 00000000 */   nop
/* 56DC4 00156CC4 00000000 */  nop
/* 56DC8 00156CC8 00000000 */  nop
/* 56DCC 00156CCC 00000000 */  nop
