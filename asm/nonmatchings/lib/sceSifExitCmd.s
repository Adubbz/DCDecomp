.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceSifExitCmd
/* 16900 00116800 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 16904 00116804 0000BFFF */  sd         $31, 0x0($sp)
/* 16908 00116808 9C53040C */  jal        DisableDmac
/* 1690C 0011680C 05000424 */   addiu     $4, $0, 0x5
/* 16910 00116810 2A00033C */  lui        $3, (0x2A5914 >> 16)
/* 16914 00116814 05000424 */  addiu      $4, $0, 0x5
/* 16918 00116818 1450040C */  jal        RemoveDmacHandler
/* 1691C 0011681C 1459658C */   lw        $5, (0x2A5914 & 0xFFFF)($3)
/* 16920 00116820 2500033C */  lui        $3, (0x2509F8 >> 16)
/* 16924 00116824 0000BFDF */  ld         $31, 0x0($sp)
/* 16928 00116828 F80960AC */  sw         $0, (0x2509F8 & 0xFFFF)($3)
/* 1692C 0011682C 0800E003 */  jr         $31
/* 16930 00116830 1000BD27 */   addiu     $sp, $sp, 0x10
/* 16934 00116834 00000000 */  nop
