.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawSellTicket22__Fiiiii
/* ECE10 001ECD10 60FFBD27 */  addiu      $sp, $sp, -0xA0
/* ECE14 001ECD14 8000BF7F */  sq         $31, 0x80($sp)
/* ECE18 001ECD18 7000B77F */  sq         $23, 0x70($sp)
/* ECE1C 001ECD1C 6000B67F */  sq         $22, 0x60($sp)
/* ECE20 001ECD20 5000B57F */  sq         $21, 0x50($sp)
/* ECE24 001ECD24 4000B47F */  sq         $20, 0x40($sp)
/* ECE28 001ECD28 3000B37F */  sq         $19, 0x30($sp)
/* ECE2C 001ECD2C 2000B27F */  sq         $18, 0x20($sp)
/* ECE30 001ECD30 1000B17F */  sq         $17, 0x10($sp)
/* ECE34 001ECD34 0000B07F */  sq         $16, 0x0($sp)
/* ECE38 001ECD38 289E8070 */  paddub     $19, $4, $0
/* ECE3C 001ECD3C 2896A070 */  paddub     $18, $5, $0
/* ECE40 001ECD40 288EC070 */  paddub     $17, $6, $0
/* ECE44 001ECD44 2886E070 */  paddub     $16, $7, $0
/* ECE48 001ECD48 28BE0071 */  paddub     $23, $8, $0
/* ECE4C 001ECD4C D901013C */  lui        $at, (0x1D900DC >> 16)
/* ECE50 001ECD50 DC00268C */  lw         $6, (0x1D900DC & 0xFFFF)($at)
/* ECE54 001ECD54 2900033C */  lui        $3, %hi(_1894)
/* ECE58 001ECD58 40286524 */  addiu      $5, $3, %lo(_1894)
/* ECE5C 001ECD5C 9000A427 */  addiu      $4, $sp, 0x90
/* ECE60 001ECD60 0000A3DC */  ld         $3, 0x0($5)
/* ECE64 001ECD64 0800A0C4 */  lwc1       $f0, 0x8($5)
/* ECE68 001ECD68 000083FC */  sd         $3, 0x0($4)
/* ECE6C 001ECD6C 080080E4 */  swc1       $f0, 0x8($4)
/* ECE70 001ECD70 8494838F */  lw         $3, -0x6B7C($gp)
/* ECE74 001ECD74 60437524 */  addiu      $21, $3, 0x4360
/* ECE78 001ECD78 04057624 */  addiu      $22, $3, 0x504
/* ECE7C 001ECD7C F87FD626 */  addiu      $22, $22, 0x7FF8
/* ECE80 001ECD80 02000324 */  addiu      $3, $0, 0x2
/* ECE84 001ECD84 5700C310 */  beq        $6, $3, .L001ECEE4
/* ECE88 001ECD88 00000000 */   nop
/* ECE8C 001ECD8C 01000324 */  addiu      $3, $0, 0x1
/* ECE90 001ECD90 2300C310 */  beq        $6, $3, .L001ECE20
/* ECE94 001ECD94 00000000 */   nop
/* ECE98 001ECD98 0300C010 */  beqz       $6, .L001ECDA8
/* ECE9C 001ECD9C 00000000 */   nop
/* ECEA0 001ECDA0 6C000010 */  b          .L001ECF54
/* ECEA4 001ECDA4 00000000 */   nop
.L001ECDA8:
/* ECEA8 001ECDA8 28A60070 */  paddub     $20, $0, $0
/* ECEAC 001ECDAC 17000010 */  b          .L001ECE0C
/* ECEB0 001ECDB0 00000000 */   nop
.L001ECDB4:
/* ECEB4 001ECDB4 80201400 */  sll        $4, $20, 2
/* ECEB8 001ECDB8 9494838F */  lw         $3, -0x6B6C($gp)
/* ECEBC 001ECDBC 21186400 */  addu       $3, $3, $4
/* ECEC0 001ECDC0 0000648C */  lw         $4, 0x0($3)
/* ECEC4 001ECDC4 01000324 */  addiu      $3, $0, 0x1
/* ECEC8 001ECDC8 0F008314 */  bne        $4, $3, .L001ECE08
/* ECECC 001ECDCC 00000000 */   nop
/* ECED0 001ECDD0 40181400 */  sll        $3, $20, 1
/* ECED4 001ECDD4 21187500 */  addu       $3, $3, $21
/* ECED8 001ECDD8 0E006984 */  lh         $9, 0xE($3)
/* ECEDC 001ECDDC 84002329 */  slti       $3, $9, 0x84
/* ECEE0 001ECDE0 09006014 */  bnez       $3, .L001ECE08
/* ECEE4 001ECDE4 00000000 */   nop
/* ECEE8 001ECDE8 28266072 */  paddub     $4, $19, $0
/* ECEEC 001ECDEC 282E4072 */  paddub     $5, $18, $0
/* ECEF0 001ECDF0 28362072 */  paddub     $6, $17, $0
/* ECEF4 001ECDF4 283E0072 */  paddub     $7, $16, $0
/* ECEF8 001ECDF8 28468072 */  paddub     $8, $20, $0
/* ECEFC 001ECDFC 2856E072 */  paddub     $10, $23, $0
/* ECF00 001ECE00 F0B2070C */  jal        DrawLocalTicket__Fiiiiiii
/* ECF04 001ECE04 00000000 */   nop
.L001ECE08:
/* ECF08 001ECE08 01009426 */  addiu      $20, $20, 0x1
.L001ECE0C:
/* ECF0C 001ECE0C 6400832A */  slti       $3, $20, 0x64
/* ECF10 001ECE10 E8FF6014 */  bnez       $3, .L001ECDB4
/* ECF14 001ECE14 00000000 */   nop
/* ECF18 001ECE18 4E000010 */  b          .L001ECF54
/* ECF1C 001ECE1C 00000000 */   nop
.L001ECE20:
/* ECF20 001ECE20 28A60070 */  paddub     $20, $0, $0
/* ECF24 001ECE24 2A000010 */  b          .L001ECED0
/* ECF28 001ECE28 00000000 */   nop
.L001ECE2C:
/* ECF2C 001ECE2C 8494848F */  lw         $4, -0x6B7C($gp)
/* ECF30 001ECE30 A80A0324 */  addiu      $3, $0, 0xAA8
/* ECF34 001ECE34 18188302 */  mult       $3, $20, $3
/* ECF38 001ECE38 21188300 */  addu       $3, $4, $3
/* ECF3C 001ECE3C 0C457624 */  addiu      $22, $3, 0x450C
/* ECF40 001ECE40 28AE0070 */  paddub     $21, $0, $0
/* ECF44 001ECE44 1E000010 */  b          .L001ECEC0
/* ECF48 001ECE48 00000000 */   nop
.L001ECE4C:
/* ECF4C 001ECE4C 80181400 */  sll        $3, $20, 2
/* ECF50 001ECE50 21287400 */  addu       $5, $3, $20
/* ECF54 001ECE54 C0200500 */  sll        $4, $5, 3
/* ECF58 001ECE58 9894838F */  lw         $3, -0x6B68($gp)
/* ECF5C 001ECE5C 21206400 */  addu       $4, $3, $4
/* ECF60 001ECE60 80181500 */  sll        $3, $21, 2
/* ECF64 001ECE64 21188300 */  addu       $3, $4, $3
/* ECF68 001ECE68 0000648C */  lw         $4, 0x0($3)
/* ECF6C 001ECE6C 01000324 */  addiu      $3, $0, 0x1
/* ECF70 001ECE70 12008314 */  bne        $4, $3, .L001ECEBC
/* ECF74 001ECE74 00000000 */   nop
/* ECF78 001ECE78 40191500 */  sll        $3, $21, 5
/* ECF7C 001ECE7C 23187500 */  subu       $3, $3, $21
/* ECF80 001ECE80 C0180300 */  sll        $3, $3, 3
/* ECF84 001ECE84 2118C302 */  addu       $3, $22, $3
/* ECF88 001ECE88 00006984 */  lh         $9, 0x0($3)
/* ECF8C 001ECE8C 01012329 */  slti       $3, $9, 0x101
/* ECF90 001ECE90 0A006014 */  bnez       $3, .L001ECEBC
/* ECF94 001ECE94 00000000 */   nop
/* ECF98 001ECE98 40100500 */  sll        $2, $5, 1
/* ECF9C 001ECE9C 2140A202 */  addu       $8, $21, $2
/* ECFA0 001ECEA0 28266072 */  paddub     $4, $19, $0
/* ECFA4 001ECEA4 282E4072 */  paddub     $5, $18, $0
/* ECFA8 001ECEA8 28362072 */  paddub     $6, $17, $0
/* ECFAC 001ECEAC 283E0072 */  paddub     $7, $16, $0
/* ECFB0 001ECEB0 80000A24 */  addiu      $10, $0, 0x80
/* ECFB4 001ECEB4 F0B2070C */  jal        DrawLocalTicket__Fiiiiiii
/* ECFB8 001ECEB8 00000000 */   nop
.L001ECEBC:
/* ECFBC 001ECEBC 0100B526 */  addiu      $21, $21, 0x1
.L001ECEC0:
/* ECFC0 001ECEC0 0A00A32A */  slti       $3, $21, 0xA
/* ECFC4 001ECEC4 E1FF6014 */  bnez       $3, .L001ECE4C
/* ECFC8 001ECEC8 00000000 */   nop
/* ECFCC 001ECECC 01009426 */  addiu      $20, $20, 0x1
.L001ECED0:
/* ECFD0 001ECED0 0600832A */  slti       $3, $20, 0x6
/* ECFD4 001ECED4 D5FF6014 */  bnez       $3, .L001ECE2C
/* ECFD8 001ECED8 00000000 */   nop
/* ECFDC 001ECEDC 1D000010 */  b          .L001ECF54
/* ECFE0 001ECEE0 00000000 */   nop
.L001ECEE4:
/* ECFE4 001ECEE4 28A60070 */  paddub     $20, $0, $0
/* ECFE8 001ECEE8 17000010 */  b          .L001ECF48
/* ECFEC 001ECEEC 00000000 */   nop
.L001ECEF0:
/* ECFF0 001ECEF0 80201400 */  sll        $4, $20, 2
/* ECFF4 001ECEF4 9C94838F */  lw         $3, -0x6B64($gp)
/* ECFF8 001ECEF8 21186400 */  addu       $3, $3, $4
/* ECFFC 001ECEFC 0000648C */  lw         $4, 0x0($3)
/* ED000 001ECF00 01000324 */  addiu      $3, $0, 0x1
/* ED004 001ECF04 0F008314 */  bne        $4, $3, .L001ECF44
/* ED008 001ECF08 00000000 */   nop
/* ED00C 001ECF0C 40191400 */  sll        $3, $20, 5
/* ED010 001ECF10 2118C302 */  addu       $3, $22, $3
/* ED014 001ECF14 00006984 */  lh         $9, 0x0($3)
/* ED018 001ECF18 51002329 */  slti       $3, $9, 0x51
/* ED01C 001ECF1C 09006014 */  bnez       $3, .L001ECF44
/* ED020 001ECF20 00000000 */   nop
/* ED024 001ECF24 28266072 */  paddub     $4, $19, $0
/* ED028 001ECF28 282E4072 */  paddub     $5, $18, $0
/* ED02C 001ECF2C 28362072 */  paddub     $6, $17, $0
/* ED030 001ECF30 283E0072 */  paddub     $7, $16, $0
/* ED034 001ECF34 28468072 */  paddub     $8, $20, $0
/* ED038 001ECF38 80000A24 */  addiu      $10, $0, 0x80
/* ED03C 001ECF3C F0B2070C */  jal        DrawLocalTicket__Fiiiiiii
/* ED040 001ECF40 00000000 */   nop
.L001ECF44:
/* ED044 001ECF44 01009426 */  addiu      $20, $20, 0x1
.L001ECF48:
/* ED048 001ECF48 2800832A */  slti       $3, $20, 0x28
/* ED04C 001ECF4C E8FF6014 */  bnez       $3, .L001ECEF0
/* ED050 001ECF50 00000000 */   nop
.L001ECF54:
/* ED054 001ECF54 8000BF7B */  lq         $31, 0x80($sp)
/* ED058 001ECF58 7000B77B */  lq         $23, 0x70($sp)
/* ED05C 001ECF5C 6000B67B */  lq         $22, 0x60($sp)
/* ED060 001ECF60 5000B57B */  lq         $21, 0x50($sp)
/* ED064 001ECF64 4000B47B */  lq         $20, 0x40($sp)
/* ED068 001ECF68 3000B37B */  lq         $19, 0x30($sp)
/* ED06C 001ECF6C 2000B27B */  lq         $18, 0x20($sp)
/* ED070 001ECF70 1000B17B */  lq         $17, 0x10($sp)
/* ED074 001ECF74 0000B07B */  lq         $16, 0x0($sp)
/* ED078 001ECF78 A000BD27 */  addiu      $sp, $sp, 0xA0
/* ED07C 001ECF7C 0800E003 */  jr         $31
/* ED080 001ECF80 00000000 */   nop
/* ED084 001ECF84 00000000 */  nop
/* ED088 001ECF88 00000000 */  nop
/* ED08C 001ECF8C 00000000 */  nop
