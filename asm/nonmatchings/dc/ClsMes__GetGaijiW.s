.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetGaijiW__6ClsMesFi
/* 4CC30 0014CB30 00FDA228 */  slti       $2, $5, -0x300
/* 4CC34 0014CB34 22004014 */  bnez       $2, .L0014CBC0
/* 4CC38 0014CB38 00000000 */   nop
/* 4CC3C 0014CB3C 9DFDA128 */  slti       $at, $5, -0x263
/* 4CC40 0014CB40 1F002010 */  beqz       $at, .L0014CBC0
/* 4CC44 0014CB44 00000000 */   nop
/* 4CC48 0014CB48 DC16828C */  lw         $2, 0x16DC($4)
/* 4CC4C 0014CB4C 13004010 */  beqz       $2, .L0014CB9C
/* 4CC50 0014CB50 00000000 */   nop
/* 4CC54 0014CB54 43FD0224 */  addiu      $2, $0, -0x2BD
/* 4CC58 0014CB58 0400A214 */  bne        $5, $2, .L0014CB6C
/* 4CC5C 0014CB5C 00000000 */   nop
/* 4CC60 0014CB60 05000224 */  addiu      $2, $0, 0x5
/* 4CC64 0014CB64 18000010 */  b          .L0014CBC8
/* 4CC68 0014CB68 00000000 */   nop
.L0014CB6C:
/* 4CC6C 0014CB6C 46FD0224 */  addiu      $2, $0, -0x2BA
/* 4CC70 0014CB70 0400A214 */  bne        $5, $2, .L0014CB84
/* 4CC74 0014CB74 00000000 */   nop
/* 4CC78 0014CB78 05000224 */  addiu      $2, $0, 0x5
/* 4CC7C 0014CB7C 12000010 */  b          .L0014CBC8
/* 4CC80 0014CB80 00000000 */   nop
.L0014CB84:
/* 4CC84 0014CB84 55FD0224 */  addiu      $2, $0, -0x2AB
/* 4CC88 0014CB88 0400A214 */  bne        $5, $2, .L0014CB9C
/* 4CC8C 0014CB8C 00000000 */   nop
/* 4CC90 0014CB90 05000224 */  addiu      $2, $0, 0x5
/* 4CC94 0014CB94 0C000010 */  b          .L0014CBC8
/* 4CC98 0014CB98 00000000 */   nop
.L0014CB9C:
/* 4CC9C 0014CB9C 40190500 */  sll        $3, $5, 5
/* 4CCA0 0014CBA0 2600023C */  lui        $2, %hi(EditPartsData + 0x491C)
/* 4CCA4 0014CBA4 EC894224 */  addiu      $2, $2, %lo(EditPartsData + 0x491C)
/* 4CCA8 0014CBA8 21104300 */  addu       $2, $2, $3
/* 4CCAC 0014CBAC 08008384 */  lh         $3, 0x8($4)
/* 4CCB0 0014CBB0 00004284 */  lh         $2, 0x0($2)
/* 4CCB4 0014CBB4 18106200 */  mult       $2, $3, $2
/* 4CCB8 0014CBB8 03000010 */  b          .L0014CBC8
/* 4CCBC 0014CBBC 00000000 */   nop
.L0014CBC0:
/* 4CCC0 0014CBC0 08008284 */  lh         $2, 0x8($4)
/* 4CCC4 0014CBC4 00000000 */  nop
.L0014CBC8:
/* 4CCC8 0014CBC8 0800E003 */  jr         $31
/* 4CCCC 0014CBCC 00000000 */   nop
