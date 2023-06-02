.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetRotation__7CObjectF11CVector3_f_
/* 56EB0 00156DB0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 56EB4 00156DB4 1000A627 */  addiu      $6, $sp, 0x10
/* 56EB8 00156DB8 0000A378 */  lq         $3, 0x0($5)
/* 56EBC 00156DBC 0000C37C */  sq         $3, 0x0($6)
/* 56EC0 00156DC0 0000A527 */  addiu      $5, $sp, 0x0
/* 56EC4 00156DC4 0000C378 */  lq         $3, 0x0($6)
/* 56EC8 00156DC8 0000A37C */  sq         $3, 0x0($5)
/* 56ECC 00156DCC 0000C378 */  lq         $3, 0x0($6)
/* 56ED0 00156DD0 6000837C */  sq         $3, 0x60($4)
/* 56ED4 00156DD4 2000BD27 */  addiu      $sp, $sp, 0x20
/* 56ED8 00156DD8 0800E003 */  jr         $31
/* 56EDC 00156DDC 00000000 */   nop
