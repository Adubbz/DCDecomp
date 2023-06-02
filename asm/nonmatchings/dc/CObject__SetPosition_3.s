.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetPosition__7CObjectFPf
/* 57C00 00157B00 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 57C04 00157B04 0000BF7F */  sq         $31, 0x0($sp)
/* 57C08 00157B08 10008424 */  addiu      $4, $4, 0x10
/* 57C0C 00157B0C 0C86040C */  jal        sceVu0CopyVector
/* 57C10 00157B10 00000000 */   nop
/* 57C14 00157B14 0000BF7B */  lq         $31, 0x0($sp)
/* 57C18 00157B18 1000BD27 */  addiu      $sp, $sp, 0x10
/* 57C1C 00157B1C 0800E003 */  jr         $31
/* 57C20 00157B20 00000000 */   nop
/* 57C24 00157B24 00000000 */  nop
/* 57C28 00157B28 00000000 */  nop
/* 57C2C 00157B2C 00000000 */  nop
