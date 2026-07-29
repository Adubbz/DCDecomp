.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SearchPartsID__16CDungeonEventManFii
/* 0CC9F0 001CC8F0 80290500 */  sll         $5, $5, 6
/* 0CC9F4 001CC8F4 2118A400 */  addu        $3, $5, $4
/* 0CC9F8 001CC8F8 3C00628C */  lw          $2, 0x3C($3)
/* 0CC9FC 001CC8FC 04004010 */  beqz        $2, .L001CC910
/* 0CCA00 001CC900 00000000 */   nop
/* 0CCA04 001CC904 1C00628C */  lw          $2, 0x1C($3)
/* 0CCA08 001CC908 02000010 */  b           .L001CC914
/* 0CCA0C 001CC90C 00000000 */   nop
.L001CC910:
/* 0CCA10 001CC910 FFFF0224 */  addiu       $2, $0, -0x1
.L001CC914:
/* 0CCA14 001CC914 0400C214 */  bne         $6, $2, .L001CC928
/* 0CCA18 001CC918 00000000 */   nop
/* 0CCA1C 001CC91C 21108500 */  addu        $2, $4, $5
/* 0CCA20 001CC920 02000010 */  b           .L001CC92C
/* 0CCA24 001CC924 00000000 */   nop
.L001CC928:
/* 0CCA28 001CC928 28160070 */  paddub      $2, $0, $0
.L001CC92C:
/* 0CCA2C 001CC92C 0800E003 */  jr          $31
/* 0CCA30 001CC930 00000000 */   nop
/* 0CCA34 001CC934 00000000 */  nop
/* 0CCA38 001CC938 00000000 */  nop
/* 0CCA3C 001CC93C 00000000 */  nop
