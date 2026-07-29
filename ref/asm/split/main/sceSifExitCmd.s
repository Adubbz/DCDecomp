.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceSifExitCmd
/* 016900 00116800 F0FFBD27 */  addiu       $29, $29, -0x10
/* 016904 00116804 0000BFFF */  sd          $31, 0x0($29)
/* 016908 00116808 9C53040C */  jal         DisableDmac
/* 01690C 0011680C 05000424 */   addiu      $4, $0, 0x5
/* 016910 00116810 2A00033C */  lui         $3, %hi(sif0_handleid)
/* 016914 00116814 05000424 */  addiu       $4, $0, 0x5
/* 016918 00116818 1450040C */  jal         RemoveDmacHandler
/* 01691C 0011681C 1459658C */   lw         $5, %lo(sif0_handleid)($3)
/* 016920 00116820 2500033C */  lui         $3, %hi(_cmd_init_check)
/* 016924 00116824 0000BFDF */  ld          $31, 0x0($29)
/* 016928 00116828 F80960AC */  sw          $0, %lo(_cmd_init_check)($3)
/* 01692C 0011682C 0800E003 */  jr          $31
/* 016930 00116830 1000BD27 */   addiu      $29, $29, 0x10
/* 016934 00116834 00000000 */  nop
