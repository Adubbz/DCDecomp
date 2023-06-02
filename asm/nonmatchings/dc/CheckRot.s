.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckRot__FP9CMapPartsP9CMapPartsi
/* A7990 001A7890 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* A7994 001A7894 2000BF7F */  sq         $31, 0x20($sp)
/* A7998 001A7898 1000B17F */  sq         $17, 0x10($sp)
/* A799C 001A789C 0000B07F */  sq         $16, 0x0($sp)
/* A79A0 001A78A0 288EA070 */  paddub     $17, $5, $0
/* A79A4 001A78A4 2886C070 */  paddub     $16, $6, $0
/* A79A8 001A78A8 03008010 */  beqz       $4, .L001A78B8
/* A79AC 001A78AC 00000000 */   nop
/* A79B0 001A78B0 04002016 */  bnez       $17, .L001A78C4
/* A79B4 001A78B4 00000000 */   nop
.L001A78B8:
/* A79B8 001A78B8 28160070 */  paddub     $2, $0, $0
/* A79BC 001A78BC 11000010 */  b          .L001A7904
/* A79C0 001A78C0 00000000 */   nop
.L001A78C4:
/* A79C4 001A78C4 2C6A060C */  jal        GetRotY__9CMapPartsFv
/* A79C8 001A78C8 00000000 */   nop
/* A79CC 001A78CC 21800202 */  addu       $16, $16, $2
/* A79D0 001A78D0 28262072 */  paddub     $4, $17, $0
/* A79D4 001A78D4 2C6A060C */  jal        GetRotY__9CMapPartsFv
/* A79D8 001A78D8 00000000 */   nop
/* A79DC 001A78DC 0300012A */  slti       $at, $16, 0x3
/* A79E0 001A78E0 02002014 */  bnez       $at, .L001A78EC
/* A79E4 001A78E4 00000000 */   nop
/* A79E8 001A78E8 FCFF1026 */  addiu      $16, $16, -0x4
.L001A78EC:
/* A79EC 001A78EC FFFF012A */  slti       $at, $16, -0x1
/* A79F0 001A78F0 02002010 */  beqz       $at, .L001A78FC
/* A79F4 001A78F4 00000000 */   nop
/* A79F8 001A78F8 04001026 */  addiu      $16, $16, 0x4
.L001A78FC:
/* A79FC 001A78FC 26100202 */  xor        $2, $16, $2
/* A7A00 001A7900 0100422C */  sltiu      $2, $2, 0x1
.L001A7904:
/* A7A04 001A7904 2000BF7B */  lq         $31, 0x20($sp)
/* A7A08 001A7908 1000B17B */  lq         $17, 0x10($sp)
/* A7A0C 001A790C 0000B07B */  lq         $16, 0x0($sp)
/* A7A10 001A7910 3000BD27 */  addiu      $sp, $sp, 0x30
/* A7A14 001A7914 0800E003 */  jr         $31
/* A7A18 001A7918 00000000 */   nop
/* A7A1C 001A791C 00000000 */  nop
