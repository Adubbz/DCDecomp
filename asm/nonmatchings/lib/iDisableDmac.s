.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel iDisableDmac
/* 15178 00115078 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 1517C 0011507C 0000BFFF */  sd         $31, 0x0($sp)
/* 15180 00115080 3C50040C */  jal        _iDisableDmac
/* 15184 00115084 00000000 */   nop
/* 15188 00115088 0F000000 */  sync
/* 1518C 0011508C 0000BFDF */  ld         $31, 0x0($sp)
/* 15190 00115090 0800E003 */  jr         $31
/* 15194 00115094 1000BD27 */   addiu     $sp, $sp, 0x10
