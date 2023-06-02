.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetVersion__17CMemoryCardAccessFPc
/* 113EB0 00213DB0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 113EB4 00213DB4 0000BF7F */  sq         $31, 0x0($sp)
/* 113EB8 00213DB8 1C008424 */  addiu      $4, $4, 0x1C
/* 113EBC 00213DBC 5A15040C */  jal        strcpy
/* 113EC0 00213DC0 00000000 */   nop
/* 113EC4 00213DC4 0000BF7B */  lq         $31, 0x0($sp)
/* 113EC8 00213DC8 1000BD27 */  addiu      $sp, $sp, 0x10
/* 113ECC 00213DCC 0800E003 */  jr         $31
/* 113ED0 00213DD0 00000000 */   nop
/* 113ED4 00213DD4 00000000 */  nop
/* 113ED8 00213DD8 00000000 */  nop
/* 113EDC 00213DDC 00000000 */  nop
