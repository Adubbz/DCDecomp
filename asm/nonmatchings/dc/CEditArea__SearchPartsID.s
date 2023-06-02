.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SearchPartsID__9CEditAreaFfff
/* 6ECE0 0016EBE0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 6ECE4 0016EBE4 1000BF7F */  sq         $31, 0x10($sp)
/* 6ECE8 0016EBE8 0000B07F */  sq         $16, 0x0($sp)
/* 6ECEC 0016EBEC 28868070 */  paddub     $16, $4, $0
/* 6ECF0 0016EBF0 2000A527 */  addiu      $5, $sp, 0x20
/* 6ECF4 0016EBF4 20B6050C */  jal        GetPos__9CEditAreaFP11CVector3_i_fff
/* 6ECF8 0016EBF8 00000000 */   nop
/* 6ECFC 0016EBFC 2000A38F */  lw         $3, 0x20($sp)
/* 6ED00 0016EC00 C0100300 */  sll        $2, $3, 3
/* 6ED04 0016EC04 23104300 */  subu       $2, $2, $3
/* 6ED08 0016EC08 80110200 */  sll        $2, $2, 6
/* 6ED0C 0016EC0C 21205000 */  addu       $4, $2, $16
/* 6ED10 0016EC10 2800A38F */  lw         $3, 0x28($sp)
/* 6ED14 0016EC14 C0100300 */  sll        $2, $3, 3
/* 6ED18 0016EC18 23104300 */  subu       $2, $2, $3
/* 6ED1C 0016EC1C 80100200 */  sll        $2, $2, 2
/* 6ED20 0016EC20 21104400 */  addu       $2, $2, $4
/* 6ED24 0016EC24 3400428C */  lw         $2, 0x34($2)
/* 6ED28 0016EC28 1000BF7B */  lq         $31, 0x10($sp)
/* 6ED2C 0016EC2C 0000B07B */  lq         $16, 0x0($sp)
/* 6ED30 0016EC30 3000BD27 */  addiu      $sp, $sp, 0x30
/* 6ED34 0016EC34 0800E003 */  jr         $31
/* 6ED38 0016EC38 00000000 */   nop
/* 6ED3C 0016EC3C 00000000 */  nop
