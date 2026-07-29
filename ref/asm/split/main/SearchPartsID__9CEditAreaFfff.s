.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SearchPartsID__9CEditAreaFfff
/* 06ECE0 0016EBE0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 06ECE4 0016EBE4 1000BF7F */  sq          $31, 0x10($29)
/* 06ECE8 0016EBE8 0000B07F */  sq          $16, 0x0($29)
/* 06ECEC 0016EBEC 28868070 */  paddub      $16, $4, $0
/* 06ECF0 0016EBF0 2000A527 */  addiu       $5, $29, 0x20
/* 06ECF4 0016EBF4 20B6050C */  jal         GetPos__9CEditAreaFP11CVector3_i_fff
/* 06ECF8 0016EBF8 00000000 */   nop
/* 06ECFC 0016EBFC 2000A38F */  lw          $3, 0x20($29)
/* 06ED00 0016EC00 C0100300 */  sll         $2, $3, 3
/* 06ED04 0016EC04 23104300 */  subu        $2, $2, $3
/* 06ED08 0016EC08 80110200 */  sll         $2, $2, 6
/* 06ED0C 0016EC0C 21205000 */  addu        $4, $2, $16
/* 06ED10 0016EC10 2800A38F */  lw          $3, 0x28($29)
/* 06ED14 0016EC14 C0100300 */  sll         $2, $3, 3
/* 06ED18 0016EC18 23104300 */  subu        $2, $2, $3
/* 06ED1C 0016EC1C 80100200 */  sll         $2, $2, 2
/* 06ED20 0016EC20 21104400 */  addu        $2, $2, $4
/* 06ED24 0016EC24 3400428C */  lw          $2, 0x34($2)
/* 06ED28 0016EC28 1000BF7B */  lq          $31, 0x10($29)
/* 06ED2C 0016EC2C 0000B07B */  lq          $16, 0x0($29)
/* 06ED30 0016EC30 3000BD27 */  addiu       $29, $29, 0x30
/* 06ED34 0016EC34 0800E003 */  jr          $31
/* 06ED38 0016EC38 00000000 */   nop
/* 06ED3C 0016EC3C 00000000 */  nop
