.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel skipSpace__FPci__2
/* 0CDA10 001CD910 C0FFBD27 */  addiu       $29, $29, -0x40
/* 0CDA14 001CD914 3000BF7F */  sq          $31, 0x30($29)
/* 0CDA18 001CD918 2000B27F */  sq          $18, 0x20($29)
/* 0CDA1C 001CD91C 1000B17F */  sq          $17, 0x10($29)
/* 0CDA20 001CD920 0000B07F */  sq          $16, 0x0($29)
/* 0CDA24 001CD924 28968070 */  paddub      $18, $4, $0
/* 0CDA28 001CD928 288EA070 */  paddub      $17, $5, $0
/* 0CDA2C 001CD92C 31000010 */  b           .L001CD9F4
/* 0CDA30 001CD930 00000000 */   nop
.L001CD934:
/* 0CDA34 001CD934 28860070 */  paddub      $16, $0, $0
/* 0CDA38 001CD938 21205102 */  addu        $4, $18, $17
/* 0CDA3C 001CD93C 2A00023C */  lui         $2, %hi(LIT_549__3)
/* 0CDA40 001CD940 E0C14524 */  addiu       $5, $2, %lo(LIT_549__3)
/* 0CDA44 001CD944 02000624 */  addiu       $6, $0, 0x2
/* 0CDA48 001CD948 C60C040C */  jal         memcmp
/* 0CDA4C 001CD94C 00000000 */   nop
/* 0CDA50 001CD950 03004014 */  bnez        $2, .L001CD960
/* 0CDA54 001CD954 00000000 */   nop
/* 0CDA58 001CD958 01003126 */  addiu       $17, $17, 0x1
/* 0CDA5C 001CD95C 01001024 */  addiu       $16, $0, 0x1
.L001CD960:
/* 0CDA60 001CD960 21105102 */  addu        $2, $18, $17
/* 0CDA64 001CD964 00004380 */  lb          $3, 0x0($2)
/* 0CDA68 001CD968 20000224 */  addiu       $2, $0, 0x20
/* 0CDA6C 001CD96C 02006214 */  bne         $3, $2, .L001CD978
/* 0CDA70 001CD970 00000000 */   nop
/* 0CDA74 001CD974 01001024 */  addiu       $16, $0, 0x1
.L001CD978:
/* 0CDA78 001CD978 09000224 */  addiu       $2, $0, 0x9
/* 0CDA7C 001CD97C 02006214 */  bne         $3, $2, .L001CD988
/* 0CDA80 001CD980 00000000 */   nop
/* 0CDA84 001CD984 01001024 */  addiu       $16, $0, 0x1
.L001CD988:
/* 0CDA88 001CD988 03006014 */  bnez        $3, .L001CD998
/* 0CDA8C 001CD98C 00000000 */   nop
/* 0CDA90 001CD990 01003126 */  addiu       $17, $17, 0x1
/* 0CDA94 001CD994 01001024 */  addiu       $16, $0, 0x1
.L001CD998:
/* 0CDA98 001CD998 21205102 */  addu        $4, $18, $17
/* 0CDA9C 001CD99C 2A00023C */  lui         $2, %hi(LIT_550__2)
/* 0CDAA0 001CD9A0 E8C14524 */  addiu       $5, $2, %lo(LIT_550__2)
/* 0CDAA4 001CD9A4 02000624 */  addiu       $6, $0, 0x2
/* 0CDAA8 001CD9A8 C60C040C */  jal         memcmp
/* 0CDAAC 001CD9AC 00000000 */   nop
/* 0CDAB0 001CD9B0 0A004014 */  bnez        $2, .L001CD9DC
/* 0CDAB4 001CD9B4 00000000 */   nop
/* 0CDAB8 001CD9B8 02000010 */  b           .L001CD9C4
/* 0CDABC 001CD9BC 00000000 */   nop
.L001CD9C0:
/* 0CDAC0 001CD9C0 01003126 */  addiu       $17, $17, 0x1
.L001CD9C4:
/* 0CDAC4 001CD9C4 21105102 */  addu        $2, $18, $17
/* 0CDAC8 001CD9C8 00004280 */  lb          $2, 0x0($2)
/* 0CDACC 001CD9CC FCFF4014 */  bnez        $2, .L001CD9C0
/* 0CDAD0 001CD9D0 00000000 */   nop
/* 0CDAD4 001CD9D4 01003126 */  addiu       $17, $17, 0x1
/* 0CDAD8 001CD9D8 01001024 */  addiu       $16, $0, 0x1
.L001CD9DC:
/* 0CDADC 001CD9DC 04000016 */  bnez        $16, .L001CD9F0
/* 0CDAE0 001CD9E0 00000000 */   nop
/* 0CDAE4 001CD9E4 28162072 */  paddub      $2, $17, $0
/* 0CDAE8 001CD9E8 06000010 */  b           .L001CDA04
/* 0CDAEC 001CD9EC 00000000 */   nop
.L001CD9F0:
/* 0CDAF0 001CD9F0 01003126 */  addiu       $17, $17, 0x1
.L001CD9F4:
/* 0CDAF4 001CD9F4 1094828F */  lw          $2, -0x6BF0($28)
/* 0CDAF8 001CD9F8 2A182202 */  slt         $3, $17, $2
/* 0CDAFC 001CD9FC CDFF6014 */  bnez        $3, .L001CD934
/* 0CDB00 001CDA00 00000000 */   nop
.L001CDA04:
/* 0CDB04 001CDA04 3000BF7B */  lq          $31, 0x30($29)
/* 0CDB08 001CDA08 2000B27B */  lq          $18, 0x20($29)
/* 0CDB0C 001CDA0C 1000B17B */  lq          $17, 0x10($29)
/* 0CDB10 001CDA10 0000B07B */  lq          $16, 0x0($29)
/* 0CDB14 001CDA14 4000BD27 */  addiu       $29, $29, 0x40
/* 0CDB18 001CDA18 0800E003 */  jr          $31
/* 0CDB1C 001CDA1C 00000000 */   nop
