.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckWeaponRot__14CDngStatusDataFi
/* BE090 001BDF90 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* BE094 001BDF94 2000BF7F */  sq         $31, 0x20($sp)
/* BE098 001BDF98 1000B17F */  sq         $17, 0x10($sp)
/* BE09C 001BDF9C 0000B07F */  sq         $16, 0x0($sp)
/* BE0A0 001BDFA0 28868070 */  paddub     $16, $4, $0
/* BE0A4 001BDFA4 288EA070 */  paddub     $17, $5, $0
/* BE0A8 001BDFA8 B4F7060C */  jal        CheckWeaponUser__14CDngStatusDataFi
/* BE0AC 001BDFAC 00000000 */   nop
/* BE0B0 001BDFB0 FFFF0424 */  addiu      $4, $0, -0x1
/* BE0B4 001BDFB4 04004414 */  bne        $2, $4, .L001BDFC8
/* BE0B8 001BDFB8 00000000 */   nop
/* BE0BC 001BDFBC 28168070 */  paddub     $2, $4, $0
/* BE0C0 001BDFC0 1C000010 */  b          .L001BE034
/* BE0C4 001BDFC4 00000000 */   nop
.L001BDFC8:
/* BE0C8 001BDFC8 0101232A */  slti       $3, $17, 0x101
/* BE0CC 001BDFCC 18006014 */  bnez       $3, .L001BE030
/* BE0D0 001BDFD0 00000000 */   nop
/* BE0D4 001BDFD4 282E0070 */  paddub     $5, $0, $0
/* BE0D8 001BDFD8 28360070 */  paddub     $6, $0, $0
/* BE0DC 001BDFDC 0E000010 */  b          .L001BE018
/* BE0E0 001BDFE0 00000000 */   nop
.L001BDFE4:
/* BE0E4 001BDFE4 A80A0324 */  addiu      $3, $0, 0xAA8
/* BE0E8 001BDFE8 18184300 */  mult       $3, $2, $3
/* BE0EC 001BDFEC 21207000 */  addu       $4, $3, $16
/* BE0F0 001BDFF0 40190600 */  sll        $3, $6, 5
/* BE0F4 001BDFF4 23186600 */  subu       $3, $3, $6
/* BE0F8 001BDFF8 C0180300 */  sll        $3, $3, 3
/* BE0FC 001BDFFC 21186400 */  addu       $3, $3, $4
/* BE100 001BE000 0C456384 */  lh         $3, 0x450C($3)
/* BE104 001BE004 01016328 */  slti       $3, $3, 0x101
/* BE108 001BE008 02006014 */  bnez       $3, .L001BE014
/* BE10C 001BE00C 00000000 */   nop
/* BE110 001BE010 0100A524 */  addiu      $5, $5, 0x1
.L001BE014:
/* BE114 001BE014 0100C624 */  addiu      $6, $6, 0x1
.L001BE018:
/* BE118 001BE018 0A00C328 */  slti       $3, $6, 0xA
/* BE11C 001BE01C F1FF6014 */  bnez       $3, .L001BDFE4
/* BE120 001BE020 00000000 */   nop
/* BE124 001BE024 2816A070 */  paddub     $2, $5, $0
/* BE128 001BE028 02000010 */  b          .L001BE034
/* BE12C 001BE02C 00000000 */   nop
.L001BE030:
/* BE130 001BE030 28168070 */  paddub     $2, $4, $0
.L001BE034:
/* BE134 001BE034 2000BF7B */  lq         $31, 0x20($sp)
/* BE138 001BE038 1000B17B */  lq         $17, 0x10($sp)
/* BE13C 001BE03C 0000B07B */  lq         $16, 0x0($sp)
/* BE140 001BE040 3000BD27 */  addiu      $sp, $sp, 0x30
/* BE144 001BE044 0800E003 */  jr         $31
/* BE148 001BE048 00000000 */   nop
/* BE14C 001BE04C 00000000 */  nop
