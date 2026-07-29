.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel RemakeGrid__9CEditAreaFv
/* 06EDF0 0016ECF0 90FFBD27 */  addiu       $29, $29, -0x70
/* 06EDF4 0016ECF4 6000BF7F */  sq          $31, 0x60($29)
/* 06EDF8 0016ECF8 5000B57F */  sq          $21, 0x50($29)
/* 06EDFC 0016ECFC 4000B47F */  sq          $20, 0x40($29)
/* 06EE00 0016ED00 3000B37F */  sq          $19, 0x30($29)
/* 06EE04 0016ED04 2000B27F */  sq          $18, 0x20($29)
/* 06EE08 0016ED08 1000B17F */  sq          $17, 0x10($29)
/* 06EE0C 0016ED0C 0000B07F */  sq          $16, 0x0($29)
/* 06EE10 0016ED10 28AE8070 */  paddub      $21, $4, $0
/* 06EE14 0016ED14 2820848C */  lw          $4, 0x2028($4)
/* 06EE18 0016ED18 61008010 */  beqz        $4, .L0016EEA0
/* 06EE1C 0016ED1C 00000000 */   nop
/* 06EE20 0016ED20 88A8040C */  jal         GetVisual__9CFrameVu1Fv
/* 06EE24 0016ED24 00000000 */   nop
/* 06EE28 0016ED28 28264070 */  paddub      $4, $2, $0
/* 06EE2C 0016ED2C 5C008010 */  beqz        $4, .L0016EEA0
/* 06EE30 0016ED30 00000000 */   nop
/* 06EE34 0016ED34 0800998C */  lw          $25, 0x8($4)
/* 06EE38 0016ED38 1000398F */  lw          $25, 0x10($25)
/* 06EE3C 0016ED3C 09F82003 */  jalr        $25
/* 06EE40 0016ED40 00000000 */   nop
/* 06EE44 0016ED44 56004010 */  beqz        $2, .L0016EEA0
/* 06EE48 0016ED48 00000000 */   nop
/* 06EE4C 0016ED4C 1000438C */  lw          $3, 0x10($2)
/* 06EE50 0016ED50 21804300 */  addu        $16, $2, $3
/* 06EE54 0016ED54 28960070 */  paddub      $18, $0, $0
/* 06EE58 0016ED58 4A000010 */  b           .L0016EE84
/* 06EE5C 0016ED5C 00000000 */   nop
.L0016ED60:
/* 06EE60 0016ED60 288E0070 */  paddub      $17, $0, $0
/* 06EE64 0016ED64 42000010 */  b           .L0016EE70
/* 06EE68 0016ED68 00000000 */   nop
.L0016ED6C:
/* 06EE6C 0016ED6C 0800A28E */  lw          $2, 0x8($21)
/* 06EE70 0016ED70 18102202 */  mult        $2, $17, $2
/* 06EE74 0016ED74 21984202 */  addu        $19, $18, $2
/* 06EE78 0016ED78 80981300 */  sll         $19, $19, 2
/* 06EE7C 0016ED7C 2826A072 */  paddub      $4, $21, $0
/* 06EE80 0016ED80 282E4072 */  paddub      $5, $18, $0
/* 06EE84 0016ED84 28362072 */  paddub      $6, $17, $0
/* 06EE88 0016ED88 F4B6050C */  jal         GetCode__9CEditAreaFii
/* 06EE8C 0016ED8C 00000000 */   nop
/* 06EE90 0016ED90 81000324 */  addiu       $3, $0, 0x81
/* 06EE94 0016ED94 17004314 */  bne         $2, $3, .L0016EDF4
/* 06EE98 0016ED98 00000000 */   nop
/* 06EE9C 0016ED9C 01006226 */  addiu       $2, $19, 0x1
/* 06EEA0 0016EDA0 00110200 */  sll         $2, $2, 4
/* 06EEA4 0016EDA4 21200202 */  addu        $4, $16, $2
/* 06EEA8 0016EDA8 00111300 */  sll         $2, $19, 4
/* 06EEAC 0016EDAC 21A00202 */  addu        $20, $16, $2
/* 06EEB0 0016EDB0 282E8072 */  paddub      $5, $20, $0
/* 06EEB4 0016EDB4 0C86040C */  jal         sceVu0CopyVector
/* 06EEB8 0016EDB8 00000000 */   nop
/* 06EEBC 0016EDBC 02006226 */  addiu       $2, $19, 0x2
/* 06EEC0 0016EDC0 00110200 */  sll         $2, $2, 4
/* 06EEC4 0016EDC4 21200202 */  addu        $4, $16, $2
/* 06EEC8 0016EDC8 282E8072 */  paddub      $5, $20, $0
/* 06EECC 0016EDCC 0C86040C */  jal         sceVu0CopyVector
/* 06EED0 0016EDD0 00000000 */   nop
/* 06EED4 0016EDD4 03006226 */  addiu       $2, $19, 0x3
/* 06EED8 0016EDD8 00110200 */  sll         $2, $2, 4
/* 06EEDC 0016EDDC 21200202 */  addu        $4, $16, $2
/* 06EEE0 0016EDE0 282E8072 */  paddub      $5, $20, $0
/* 06EEE4 0016EDE4 0C86040C */  jal         sceVu0CopyVector
/* 06EEE8 0016EDE8 00000000 */   nop
/* 06EEEC 0016EDEC 1F000010 */  b           .L0016EE6C
/* 06EEF0 0016EDF0 00000000 */   nop
.L0016EDF4:
/* 06EEF4 0016EDF4 00191300 */  sll         $3, $19, 4
/* 06EEF8 0016EDF8 748181C7 */  lwc1        $f1, -0x7E8C($28)
/* 06EEFC 0016EDFC 2000A0C6 */  lwc1        $f0, 0x20($21)
/* 06EF00 0016EE00 42080046 */  mul.s       $f1, $f1, $f0
/* 06EF04 0016EE04 21180302 */  addu        $3, $16, $3
/* 06EF08 0016EE08 000060C4 */  lwc1        $f0, 0x0($3)
/* 06EF0C 0016EE0C 00080046 */  add.s       $f0, $f1, $f0
/* 06EF10 0016EE10 100060E4 */  swc1        $f0, 0x10($3)
/* 06EF14 0016EE14 080060C4 */  lwc1        $f0, 0x8($3)
/* 06EF18 0016EE18 180060E4 */  swc1        $f0, 0x18($3)
/* 06EF1C 0016EE1C 000060C4 */  lwc1        $f0, 0x0($3)
/* 06EF20 0016EE20 200060E4 */  swc1        $f0, 0x20($3)
/* 06EF24 0016EE24 748181C7 */  lwc1        $f1, -0x7E8C($28)
/* 06EF28 0016EE28 2000A0C6 */  lwc1        $f0, 0x20($21)
/* 06EF2C 0016EE2C 42080046 */  mul.s       $f1, $f1, $f0
/* 06EF30 0016EE30 080060C4 */  lwc1        $f0, 0x8($3)
/* 06EF34 0016EE34 00080046 */  add.s       $f0, $f1, $f0
/* 06EF38 0016EE38 280060E4 */  swc1        $f0, 0x28($3)
/* 06EF3C 0016EE3C 748181C7 */  lwc1        $f1, -0x7E8C($28)
/* 06EF40 0016EE40 2000A0C6 */  lwc1        $f0, 0x20($21)
/* 06EF44 0016EE44 42080046 */  mul.s       $f1, $f1, $f0
/* 06EF48 0016EE48 000060C4 */  lwc1        $f0, 0x0($3)
/* 06EF4C 0016EE4C 00080046 */  add.s       $f0, $f1, $f0
/* 06EF50 0016EE50 300060E4 */  swc1        $f0, 0x30($3)
/* 06EF54 0016EE54 748181C7 */  lwc1        $f1, -0x7E8C($28)
/* 06EF58 0016EE58 2000A0C6 */  lwc1        $f0, 0x20($21)
/* 06EF5C 0016EE5C 42080046 */  mul.s       $f1, $f1, $f0
/* 06EF60 0016EE60 080060C4 */  lwc1        $f0, 0x8($3)
/* 06EF64 0016EE64 00080046 */  add.s       $f0, $f1, $f0
/* 06EF68 0016EE68 380060E4 */  swc1        $f0, 0x38($3)
.L0016EE6C:
/* 06EF6C 0016EE6C 01003126 */  addiu       $17, $17, 0x1
.L0016EE70:
/* 06EF70 0016EE70 0C00A38E */  lw          $3, 0xC($21)
/* 06EF74 0016EE74 2A182302 */  slt         $3, $17, $3
/* 06EF78 0016EE78 BCFF6014 */  bnez        $3, .L0016ED6C
/* 06EF7C 0016EE7C 00000000 */   nop
/* 06EF80 0016EE80 01005226 */  addiu       $18, $18, 0x1
.L0016EE84:
/* 06EF84 0016EE84 0800A38E */  lw          $3, 0x8($21)
/* 06EF88 0016EE88 2A184302 */  slt         $3, $18, $3
/* 06EF8C 0016EE8C B4FF6014 */  bnez        $3, .L0016ED60
/* 06EF90 0016EE90 00000000 */   nop
/* 06EF94 0016EE94 01000424 */  addiu       $4, $0, 0x1
/* 06EF98 0016EE98 2820A38E */  lw          $3, 0x2028($21)
/* 06EF9C 0016EE9C BA0064A0 */  sb          $4, 0xBA($3)
.L0016EEA0:
/* 06EFA0 0016EEA0 6000BF7B */  lq          $31, 0x60($29)
/* 06EFA4 0016EEA4 5000B57B */  lq          $21, 0x50($29)
/* 06EFA8 0016EEA8 4000B47B */  lq          $20, 0x40($29)
/* 06EFAC 0016EEAC 3000B37B */  lq          $19, 0x30($29)
/* 06EFB0 0016EEB0 2000B27B */  lq          $18, 0x20($29)
/* 06EFB4 0016EEB4 1000B17B */  lq          $17, 0x10($29)
/* 06EFB8 0016EEB8 0000B07B */  lq          $16, 0x0($29)
/* 06EFBC 0016EEBC 7000BD27 */  addiu       $29, $29, 0x70
/* 06EFC0 0016EEC0 0800E003 */  jr          $31
/* 06EFC4 0016EEC4 00000000 */   nop
/* 06EFC8 0016EEC8 00000000 */  nop
/* 06EFCC 0016EECC 00000000 */  nop
