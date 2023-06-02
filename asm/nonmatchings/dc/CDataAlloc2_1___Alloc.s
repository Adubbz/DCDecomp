.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Alloc__14CDataAlloc2_1_Fi
/* 279A0 001278A0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 279A4 001278A4 0000BF7F */  sq         $31, 0x0($sp)
/* 279A8 001278A8 0800838C */  lw         $3, 0x8($4)
/* 279AC 001278AC 21286500 */  addu       $5, $3, $5
/* 279B0 001278B0 0C00868C */  lw         $6, 0xC($4)
/* 279B4 001278B4 2A08C500 */  slt        $at, $6, $5
/* 279B8 001278B8 08002010 */  beqz       $at, .L001278DC
/* 279BC 001278BC 00000000 */   nop
/* 279C0 001278C0 2A00023C */  lui        $2, %hi(_744)
/* 279C4 001278C4 D08D4424 */  addiu      $4, $2, %lo(_744)
/* 279C8 001278C8 282E6070 */  paddub     $5, $3, $0
/* 279CC 001278CC A611040C */  jal        printf
/* 279D0 001278D0 00000000 */   nop
.L001278D4:
/* 279D4 001278D4 FFFF0010 */  b          .L001278D4
/* 279D8 001278D8 00000000 */   nop
.L001278DC:
/* 279DC 001278DC 00190300 */  sll        $3, $3, 4
/* 279E0 001278E0 0000828C */  lw         $2, 0x0($4)
/* 279E4 001278E4 21104300 */  addu       $2, $2, $3
/* 279E8 001278E8 080085AC */  sw         $5, 0x8($4)
/* 279EC 001278EC 0000BF7B */  lq         $31, 0x0($sp)
/* 279F0 001278F0 1000BD27 */  addiu      $sp, $sp, 0x10
/* 279F4 001278F4 0800E003 */  jr         $31
/* 279F8 001278F8 00000000 */   nop
/* 279FC 001278FC 00000000 */  nop
