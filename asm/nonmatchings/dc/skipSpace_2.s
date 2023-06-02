.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel skipSpace__FPci
/* CDA10 001CD910 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* CDA14 001CD914 3000BF7F */  sq         $31, 0x30($sp)
/* CDA18 001CD918 2000B27F */  sq         $18, 0x20($sp)
/* CDA1C 001CD91C 1000B17F */  sq         $17, 0x10($sp)
/* CDA20 001CD920 0000B07F */  sq         $16, 0x0($sp)
/* CDA24 001CD924 28968070 */  paddub     $18, $4, $0
/* CDA28 001CD928 288EA070 */  paddub     $17, $5, $0
/* CDA2C 001CD92C 31000010 */  b          .L001CD9F4
/* CDA30 001CD930 00000000 */   nop
.L001CD934:
/* CDA34 001CD934 28860070 */  paddub     $16, $0, $0
/* CDA38 001CD938 21205102 */  addu       $4, $18, $17
/* CDA3C 001CD93C 2A00023C */  lui        $2, %hi(_549_3)
/* CDA40 001CD940 E0C14524 */  addiu      $5, $2, %lo(_549_3)
/* CDA44 001CD944 02000624 */  addiu      $6, $0, 0x2
/* CDA48 001CD948 C60C040C */  jal        memcmp
/* CDA4C 001CD94C 00000000 */   nop
/* CDA50 001CD950 03004014 */  bnez       $2, .L001CD960
/* CDA54 001CD954 00000000 */   nop
/* CDA58 001CD958 01003126 */  addiu      $17, $17, 0x1
/* CDA5C 001CD95C 01001024 */  addiu      $16, $0, 0x1
.L001CD960:
/* CDA60 001CD960 21105102 */  addu       $2, $18, $17
/* CDA64 001CD964 00004380 */  lb         $3, 0x0($2)
/* CDA68 001CD968 20000224 */  addiu      $2, $0, 0x20
/* CDA6C 001CD96C 02006214 */  bne        $3, $2, .L001CD978
/* CDA70 001CD970 00000000 */   nop
/* CDA74 001CD974 01001024 */  addiu      $16, $0, 0x1
.L001CD978:
/* CDA78 001CD978 09000224 */  addiu      $2, $0, 0x9
/* CDA7C 001CD97C 02006214 */  bne        $3, $2, .L001CD988
/* CDA80 001CD980 00000000 */   nop
/* CDA84 001CD984 01001024 */  addiu      $16, $0, 0x1
.L001CD988:
/* CDA88 001CD988 03006014 */  bnez       $3, .L001CD998
/* CDA8C 001CD98C 00000000 */   nop
/* CDA90 001CD990 01003126 */  addiu      $17, $17, 0x1
/* CDA94 001CD994 01001024 */  addiu      $16, $0, 0x1
.L001CD998:
/* CDA98 001CD998 21205102 */  addu       $4, $18, $17
/* CDA9C 001CD99C 2A00023C */  lui        $2, %hi(_550_2)
/* CDAA0 001CD9A0 E8C14524 */  addiu      $5, $2, %lo(_550_2)
/* CDAA4 001CD9A4 02000624 */  addiu      $6, $0, 0x2
/* CDAA8 001CD9A8 C60C040C */  jal        memcmp
/* CDAAC 001CD9AC 00000000 */   nop
/* CDAB0 001CD9B0 0A004014 */  bnez       $2, .L001CD9DC
/* CDAB4 001CD9B4 00000000 */   nop
/* CDAB8 001CD9B8 02000010 */  b          .L001CD9C4
/* CDABC 001CD9BC 00000000 */   nop
.L001CD9C0:
/* CDAC0 001CD9C0 01003126 */  addiu      $17, $17, 0x1
.L001CD9C4:
/* CDAC4 001CD9C4 21105102 */  addu       $2, $18, $17
/* CDAC8 001CD9C8 00004280 */  lb         $2, 0x0($2)
/* CDACC 001CD9CC FCFF4014 */  bnez       $2, .L001CD9C0
/* CDAD0 001CD9D0 00000000 */   nop
/* CDAD4 001CD9D4 01003126 */  addiu      $17, $17, 0x1
/* CDAD8 001CD9D8 01001024 */  addiu      $16, $0, 0x1
.L001CD9DC:
/* CDADC 001CD9DC 04000016 */  bnez       $16, .L001CD9F0
/* CDAE0 001CD9E0 00000000 */   nop
/* CDAE4 001CD9E4 28162072 */  paddub     $2, $17, $0
/* CDAE8 001CD9E8 06000010 */  b          .L001CDA04
/* CDAEC 001CD9EC 00000000 */   nop
.L001CD9F0:
/* CDAF0 001CD9F0 01003126 */  addiu      $17, $17, 0x1
.L001CD9F4:
/* CDAF4 001CD9F4 1094828F */  lw         $2, -0x6BF0($gp)
/* CDAF8 001CD9F8 2A182202 */  slt        $3, $17, $2
/* CDAFC 001CD9FC CDFF6014 */  bnez       $3, .L001CD934
/* CDB00 001CDA00 00000000 */   nop
.L001CDA04:
/* CDB04 001CDA04 3000BF7B */  lq         $31, 0x30($sp)
/* CDB08 001CDA08 2000B27B */  lq         $18, 0x20($sp)
/* CDB0C 001CDA0C 1000B17B */  lq         $17, 0x10($sp)
/* CDB10 001CDA10 0000B07B */  lq         $16, 0x0($sp)
/* CDB14 001CDA14 4000BD27 */  addiu      $sp, $sp, 0x40
/* CDB18 001CDA18 0800E003 */  jr         $31
/* CDB1C 001CDA1C 00000000 */   nop
