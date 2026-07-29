.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LostItem__14CDngStatusDataFi
/* 0BDC60 001BDB60 28160070 */  paddub      $2, $0, $0
/* 0BDC64 001BDB64 0D000010 */  b           .L001BDB9C
/* 0BDC68 001BDB68 00000000 */   nop
.L001BDB6C:
/* 0BDC6C 001BDB6C 40180200 */  sll         $3, $2, 1
/* 0BDC70 001BDB70 21306400 */  addu        $6, $3, $4
/* 0BDC74 001BDB74 6E43C724 */  addiu       $7, $6, 0x436E
/* 0BDC78 001BDB78 6E43C384 */  lh          $3, 0x436E($6)
/* 0BDC7C 001BDB7C 06006514 */  bne         $3, $5, .L001BDB98
/* 0BDC80 001BDB80 00000000 */   nop
/* 0BDC84 001BDB84 FFFF0324 */  addiu       $3, $0, -0x1
/* 0BDC88 001BDB88 0000E3A4 */  sh          $3, 0x0($7)
/* 0BDC8C 001BDB8C 3C44C0A4 */  sh          $0, 0x443C($6)
/* 0BDC90 001BDB90 06000010 */  b           .L001BDBAC
/* 0BDC94 001BDB94 00000000 */   nop
.L001BDB98:
/* 0BDC98 001BDB98 01004224 */  addiu       $2, $2, 0x1
.L001BDB9C:
/* 0BDC9C 001BDB9C 67004328 */  slti        $3, $2, 0x67
/* 0BDCA0 001BDBA0 F2FF6014 */  bnez        $3, .L001BDB6C
/* 0BDCA4 001BDBA4 00000000 */   nop
/* 0BDCA8 001BDBA8 FFFF0224 */  addiu       $2, $0, -0x1
.L001BDBAC:
/* 0BDCAC 001BDBAC 0800E003 */  jr          $31
/* 0BDCB0 001BDBB0 00000000 */   nop
/* 0BDCB4 001BDBB4 00000000 */  nop
/* 0BDCB8 001BDBB8 00000000 */  nop
/* 0BDCBC 001BDBBC 00000000 */  nop
