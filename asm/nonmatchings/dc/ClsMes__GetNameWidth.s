.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetNameWidth__6ClsMesFi
/* 4CD60 0014CC60 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 4CD64 0014CC64 4000BF7F */  sq         $31, 0x40($sp)
/* 4CD68 0014CC68 3000B37F */  sq         $19, 0x30($sp)
/* 4CD6C 0014CC6C 2000B27F */  sq         $18, 0x20($sp)
/* 4CD70 0014CC70 1000B17F */  sq         $17, 0x10($sp)
/* 4CD74 0014CC74 0000B07F */  sq         $16, 0x0($sp)
/* 4CD78 0014CC78 289E8070 */  paddub     $19, $4, $0
/* 4CD7C 0014CC7C 0400A104 */  bgez       $5, .L0014CC90
/* 4CD80 0014CC80 00000000 */   nop
/* 4CD84 0014CC84 FFFF0224 */  addiu      $2, $0, -0x1
/* 4CD88 0014CC88 33000010 */  b          .L0014CD58
/* 4CD8C 0014CC8C 00000000 */   nop
.L0014CC90:
/* 4CD90 0014CC90 0600A228 */  slti       $2, $5, 0x6
/* 4CD94 0014CC94 04004014 */  bnez       $2, .L0014CCA8
/* 4CD98 0014CC98 00000000 */   nop
/* 4CD9C 0014CC9C FFFF0224 */  addiu      $2, $0, -0x1
/* 4CDA0 0014CCA0 2D000010 */  b          .L0014CD58
/* 4CDA4 0014CCA4 00000000 */   nop
.L0014CCA8:
/* 4CDA8 0014CCA8 1C8D848F */  lw         $4, -0x72E4($gp)
/* 4CDAC 0014CCAC D45E050C */  jal        GetCharaName__9CSaveDataFi
/* 4CDB0 0014CCB0 00000000 */   nop
/* 4CDB4 0014CCB4 28864070 */  paddub     $16, $2, $0
/* 4CDB8 0014CCB8 288E0070 */  paddub     $17, $0, $0
/* 4CDBC 0014CCBC 28960070 */  paddub     $18, $0, $0
/* 4CDC0 0014CCC0 21000010 */  b          .L0014CD48
/* 4CDC4 0014CCC4 00000000 */   nop
.L0014CCC8:
/* 4CDC8 0014CCC8 40101200 */  sll        $2, $18, 1
/* 4CDCC 0014CCCC 21100202 */  addu       $2, $16, $2
/* 4CDD0 0014CCD0 00004294 */  lhu        $2, 0x0($2)
/* 4CDD4 0014CCD4 05004014 */  bnez       $2, .L0014CCEC
/* 4CDD8 0014CCD8 00000000 */   nop
/* 4CDDC 0014CCDC 3C141100 */  dsll32     $2, $17, 16
/* 4CDE0 0014CCE0 3F140200 */  dsra32     $2, $2, 16
/* 4CDE4 0014CCE4 1C000010 */  b          .L0014CD58
/* 4CDE8 0014CCE8 00000000 */   nop
.L0014CCEC:
/* 4CDEC 0014CCEC FFFF4424 */  addiu      $4, $2, -0x1
/* 4CDF0 0014CCF0 9832050C */  jal        NameRegistCodeJtoE__Fi
/* 4CDF4 0014CCF4 00000000 */   nop
/* 4CDF8 0014CCF8 00FD4328 */  slti       $3, $2, -0x300
/* 4CDFC 0014CCFC 0D006014 */  bnez       $3, .L0014CD34
/* 4CE00 0014CD00 00000000 */   nop
/* 4CE04 0014CD04 9EFD4128 */  slti       $at, $2, -0x262
/* 4CE08 0014CD08 0A002010 */  beqz       $at, .L0014CD34
/* 4CE0C 0014CD0C 00000000 */   nop
/* 4CE10 0014CD10 28266072 */  paddub     $4, $19, $0
/* 4CE14 0014CD14 282E4070 */  paddub     $5, $2, $0
/* 4CE18 0014CD18 CC32050C */  jal        GetGaijiW__6ClsMesFi
/* 4CE1C 0014CD1C 00000000 */   nop
/* 4CE20 0014CD20 21102202 */  addu       $2, $17, $2
/* 4CE24 0014CD24 3C8C0200 */  dsll32     $17, $2, 16
/* 4CE28 0014CD28 3F8C1100 */  dsra32     $17, $17, 16
/* 4CE2C 0014CD2C 05000010 */  b          .L0014CD44
/* 4CE30 0014CD30 00000000 */   nop
.L0014CD34:
/* 4CE34 0014CD34 08006286 */  lh         $2, 0x8($19)
/* 4CE38 0014CD38 21102202 */  addu       $2, $17, $2
/* 4CE3C 0014CD3C 3C8C0200 */  dsll32     $17, $2, 16
/* 4CE40 0014CD40 3F8C1100 */  dsra32     $17, $17, 16
.L0014CD44:
/* 4CE44 0014CD44 01005226 */  addiu      $18, $18, 0x1
.L0014CD48:
/* 4CE48 0014CD48 0B00422A */  slti       $2, $18, 0xB
/* 4CE4C 0014CD4C DEFF4014 */  bnez       $2, .L0014CCC8
/* 4CE50 0014CD50 00000000 */   nop
/* 4CE54 0014CD54 FFFF0224 */  addiu      $2, $0, -0x1
.L0014CD58:
/* 4CE58 0014CD58 4000BF7B */  lq         $31, 0x40($sp)
/* 4CE5C 0014CD5C 3000B37B */  lq         $19, 0x30($sp)
/* 4CE60 0014CD60 2000B27B */  lq         $18, 0x20($sp)
/* 4CE64 0014CD64 1000B17B */  lq         $17, 0x10($sp)
/* 4CE68 0014CD68 0000B07B */  lq         $16, 0x0($sp)
/* 4CE6C 0014CD6C 5000BD27 */  addiu      $sp, $sp, 0x50
/* 4CE70 0014CD70 0800E003 */  jr         $31
/* 4CE74 0014CD74 00000000 */   nop
/* 4CE78 0014CD78 00000000 */  nop
/* 4CE7C 0014CD7C 00000000 */  nop
