.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel mceStorePwd
/* 1EB60 0011EA60 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 1EB64 0011EA64 1000B1FF */  sd         $17, 0x10($sp)
/* 1EB68 0011EA68 3000BFFF */  sd         $31, 0x30($sp)
/* 1EB6C 0011EA6C 2D888000 */  daddu      $17, $4, $0
/* 1EB70 0011EA70 2000B2FF */  sd         $18, 0x20($sp)
/* 1EB74 0011EA74 15002012 */  beqz       $17, .L0011EACC
/* 1EB78 0011EA78 0000B0FF */   sd        $16, 0x0($sp)
/* 1EB7C 0011EA7C 2B00123C */  lui        $18, %hi(D_002A8C00)
/* 1EB80 0011EA80 0020023C */  lui        $2, (0x20000000 >> 16)
/* 1EB84 0011EA84 008C4326 */  addiu      $3, $18, %lo(D_002A8C00)
/* 1EB88 0011EA88 25806200 */  or         $16, $3, $2
/* 1EB8C 0011EA8C A015040C */  jal        strlen
/* 1EB90 0011EA90 2D200002 */   daddu     $4, $16, $0
/* 1EB94 0011EA94 0004422C */  sltiu      $2, $2, 0x400
/* 1EB98 0011EA98 04004050 */  beql       $2, $0, .L0011EAAC
/* 1EB9C 0011EA9C FF031024 */   addiu     $16, $0, 0x3FF
/* 1EBA0 0011EAA0 A015040C */  jal        strlen
/* 1EBA4 0011EAA4 2D200002 */   daddu     $4, $16, $0
/* 1EBA8 0011EAA8 2D804000 */  daddu      $16, $2, $0
.L0011EAAC:
/* 1EBAC 0011EAAC 008C4226 */  addiu      $2, $18, %lo(D_002A8C00)
/* 1EBB0 0011EAB0 0020053C */  lui        $5, (0x20000000 >> 16)
/* 1EBB4 0011EAB4 25284500 */  or         $5, $2, $5
/* 1EBB8 0011EAB8 2D202002 */  daddu      $4, $17, $0
/* 1EBBC 0011EABC EC0C040C */  jal        memcpy
/* 1EBC0 0011EAC0 2D300002 */   daddu     $6, $16, $0
/* 1EBC4 0011EAC4 21183002 */  addu       $3, $17, $16
/* 1EBC8 0011EAC8 000060A0 */  sb         $0, 0x0($3)
.L0011EACC:
/* 1EBCC 0011EACC 3000BFDF */  ld         $31, 0x30($sp)
/* 1EBD0 0011EAD0 2000B2DF */  ld         $18, 0x20($sp)
/* 1EBD4 0011EAD4 1000B1DF */  ld         $17, 0x10($sp)
/* 1EBD8 0011EAD8 0000B0DF */  ld         $16, 0x0($sp)
/* 1EBDC 0011EADC 0800E003 */  jr         $31
/* 1EBE0 0011EAE0 4000BD27 */   addiu     $sp, $sp, 0x40
/* 1EBE4 0011EAE4 00000000 */  nop
