.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel write
/* 14940 00114840 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 14944 00114844 FFFF8424 */  addiu      $4, $4, -0x1
/* 14948 00114848 2000B2FF */  sd         $18, 0x20($sp)
/* 1494C 0011484C 0200842C */  sltiu      $4, $4, 0x2
/* 14950 00114850 1000B1FF */  sd         $17, 0x10($sp)
/* 14954 00114854 2D90C000 */  daddu      $18, $6, $0
/* 14958 00114858 3000BFFF */  sd         $31, 0x30($sp)
/* 1495C 0011485C 2D88A000 */  daddu      $17, $5, $0
/* 14960 00114860 0F008010 */  beqz       $4, .L001148A0
/* 14964 00114864 0000B0FF */   sd        $16, 0x0($sp)
/* 14968 00114868 2500103C */  lui        $16, (0x2509E0 >> 16)
/* 1496C 0011486C E009028E */  lw         $2, (0x2509E0 & 0xFFFF)($16)
/* 14970 00114870 07004014 */  bnez       $2, .L00114890
/* 14974 00114874 2D202002 */   daddu     $4, $17, $0
/* 14978 00114878 7A56040C */  jal        sceTtyInit
/* 1497C 0011487C 00000000 */   nop
/* 14980 00114880 07004010 */  beqz       $2, .L001148A0
/* 14984 00114884 01000224 */   addiu     $2, $0, 0x1
/* 14988 00114888 E00902AE */  sw         $2, (0x2509E0 & 0xFFFF)($16)
/* 1498C 0011488C 2D202002 */  daddu      $4, $17, $0
.L00114890:
/* 14990 00114890 F255040C */  jal        sceTtyWrite
/* 14994 00114894 2D284002 */   daddu     $5, $18, $0
/* 14998 00114898 03000010 */  b          .L001148A8
/* 1499C 0011489C 3000BFDF */   ld        $31, 0x30($sp)
.L001148A0:
/* 149A0 001148A0 FFFF0224 */  addiu      $2, $0, -0x1
/* 149A4 001148A4 3000BFDF */  ld         $31, 0x30($sp)
.L001148A8:
/* 149A8 001148A8 2000B2DF */  ld         $18, 0x20($sp)
/* 149AC 001148AC 1000B1DF */  ld         $17, 0x10($sp)
/* 149B0 001148B0 0000B0DF */  ld         $16, 0x0($sp)
/* 149B4 001148B4 0800E003 */  jr         $31
/* 149B8 001148B8 4000BD27 */   addiu     $sp, $sp, 0x40
/* 149BC 001148BC 00000000 */  nop
