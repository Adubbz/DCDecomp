.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetNameWidth__6ClsMesFi
/* 04CD60 0014CC60 B0FFBD27 */  addiu       $29, $29, -0x50
/* 04CD64 0014CC64 4000BF7F */  sq          $31, 0x40($29)
/* 04CD68 0014CC68 3000B37F */  sq          $19, 0x30($29)
/* 04CD6C 0014CC6C 2000B27F */  sq          $18, 0x20($29)
/* 04CD70 0014CC70 1000B17F */  sq          $17, 0x10($29)
/* 04CD74 0014CC74 0000B07F */  sq          $16, 0x0($29)
/* 04CD78 0014CC78 289E8070 */  paddub      $19, $4, $0
/* 04CD7C 0014CC7C 0400A104 */  bgez        $5, .L0014CC90
/* 04CD80 0014CC80 00000000 */   nop
/* 04CD84 0014CC84 FFFF0224 */  addiu       $2, $0, -0x1
/* 04CD88 0014CC88 33000010 */  b           .L0014CD58
/* 04CD8C 0014CC8C 00000000 */   nop
.L0014CC90:
/* 04CD90 0014CC90 0600A228 */  slti        $2, $5, 0x6
/* 04CD94 0014CC94 04004014 */  bnez        $2, .L0014CCA8
/* 04CD98 0014CC98 00000000 */   nop
/* 04CD9C 0014CC9C FFFF0224 */  addiu       $2, $0, -0x1
/* 04CDA0 0014CCA0 2D000010 */  b           .L0014CD58
/* 04CDA4 0014CCA4 00000000 */   nop
.L0014CCA8:
/* 04CDA8 0014CCA8 1C8D848F */  lw          $4, -0x72E4($28)
/* 04CDAC 0014CCAC D45E050C */  jal         GetCharaName__9CSaveDataFi
/* 04CDB0 0014CCB0 00000000 */   nop
/* 04CDB4 0014CCB4 28864070 */  paddub      $16, $2, $0
/* 04CDB8 0014CCB8 288E0070 */  paddub      $17, $0, $0
/* 04CDBC 0014CCBC 28960070 */  paddub      $18, $0, $0
/* 04CDC0 0014CCC0 21000010 */  b           .L0014CD48
/* 04CDC4 0014CCC4 00000000 */   nop
.L0014CCC8:
/* 04CDC8 0014CCC8 40101200 */  sll         $2, $18, 1
/* 04CDCC 0014CCCC 21100202 */  addu        $2, $16, $2
/* 04CDD0 0014CCD0 00004294 */  lhu         $2, 0x0($2)
/* 04CDD4 0014CCD4 05004014 */  bnez        $2, .L0014CCEC
/* 04CDD8 0014CCD8 00000000 */   nop
/* 04CDDC 0014CCDC 3C141100 */  dsll32      $2, $17, 16
/* 04CDE0 0014CCE0 3F140200 */  dsra32      $2, $2, 16
/* 04CDE4 0014CCE4 1C000010 */  b           .L0014CD58
/* 04CDE8 0014CCE8 00000000 */   nop
.L0014CCEC:
/* 04CDEC 0014CCEC FFFF4424 */  addiu       $4, $2, -0x1
/* 04CDF0 0014CCF0 9832050C */  jal         NameRegistCodeJtoE__Fi
/* 04CDF4 0014CCF4 00000000 */   nop
/* 04CDF8 0014CCF8 00FD4328 */  slti        $3, $2, -0x300
/* 04CDFC 0014CCFC 0D006014 */  bnez        $3, .L0014CD34
/* 04CE00 0014CD00 00000000 */   nop
/* 04CE04 0014CD04 9EFD4128 */  slti        $1, $2, -0x262
/* 04CE08 0014CD08 0A002010 */  beqz        $1, .L0014CD34
/* 04CE0C 0014CD0C 00000000 */   nop
/* 04CE10 0014CD10 28266072 */  paddub      $4, $19, $0
/* 04CE14 0014CD14 282E4070 */  paddub      $5, $2, $0
/* 04CE18 0014CD18 CC32050C */  jal         GetGaijiW__6ClsMesFi
/* 04CE1C 0014CD1C 00000000 */   nop
/* 04CE20 0014CD20 21102202 */  addu        $2, $17, $2
/* 04CE24 0014CD24 3C8C0200 */  dsll32      $17, $2, 16
/* 04CE28 0014CD28 3F8C1100 */  dsra32      $17, $17, 16
/* 04CE2C 0014CD2C 05000010 */  b           .L0014CD44
/* 04CE30 0014CD30 00000000 */   nop
.L0014CD34:
/* 04CE34 0014CD34 08006286 */  lh          $2, 0x8($19)
/* 04CE38 0014CD38 21102202 */  addu        $2, $17, $2
/* 04CE3C 0014CD3C 3C8C0200 */  dsll32      $17, $2, 16
/* 04CE40 0014CD40 3F8C1100 */  dsra32      $17, $17, 16
.L0014CD44:
/* 04CE44 0014CD44 01005226 */  addiu       $18, $18, 0x1
.L0014CD48:
/* 04CE48 0014CD48 0B00422A */  slti        $2, $18, 0xB
/* 04CE4C 0014CD4C DEFF4014 */  bnez        $2, .L0014CCC8
/* 04CE50 0014CD50 00000000 */   nop
/* 04CE54 0014CD54 FFFF0224 */  addiu       $2, $0, -0x1
.L0014CD58:
/* 04CE58 0014CD58 4000BF7B */  lq          $31, 0x40($29)
/* 04CE5C 0014CD5C 3000B37B */  lq          $19, 0x30($29)
/* 04CE60 0014CD60 2000B27B */  lq          $18, 0x20($29)
/* 04CE64 0014CD64 1000B17B */  lq          $17, 0x10($29)
/* 04CE68 0014CD68 0000B07B */  lq          $16, 0x0($29)
/* 04CE6C 0014CD6C 5000BD27 */  addiu       $29, $29, 0x50
/* 04CE70 0014CD70 0800E003 */  jr          $31
/* 04CE74 0014CD74 00000000 */   nop
/* 04CE78 0014CD78 00000000 */  nop
/* 04CE7C 0014CD7C 00000000 */  nop
