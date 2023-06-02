.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MGClipBox__FP7CBoxVu0
/* 2ED80 0012EC80 40FFBD27 */  addiu      $sp, $sp, -0xC0
/* 2ED84 0012EC84 2000BF7F */  sq         $31, 0x20($sp)
/* 2ED88 0012EC88 1000B17F */  sq         $17, 0x10($sp)
/* 2ED8C 0012EC8C 0000B07F */  sq         $16, 0x0($sp)
/* 2ED90 0012EC90 10008224 */  addiu      $2, $4, 0x10
/* 2ED94 0012EC94 B000A2AF */  sw         $2, 0xB0($sp)
/* 2ED98 0012EC98 B400A4AF */  sw         $4, 0xB4($sp)
/* 2ED9C 0012EC9C 3F001124 */  addiu      $17, $0, 0x3F
/* 2EDA0 0012ECA0 28860070 */  paddub     $16, $0, $0
/* 2EDA4 0012ECA4 29000010 */  b          .L0012ED4C
/* 2EDA8 0012ECA8 00000000 */   nop
.L0012ECAC:
/* 2EDAC 0012ECAC 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 2EDB0 0012ECB0 00191000 */  sll        $3, $16, 4
/* 2EDB4 0012ECB4 21187D00 */  addu       $3, $3, $sp
/* 2EDB8 0012ECB8 3C0062AC */  sw         $2, 0x3C($3)
/* 2EDBC 0012ECBC 01000232 */  andi       $2, $16, 0x1
/* 2EDC0 0012ECC0 2B100200 */  sltu       $2, $0, $2
/* 2EDC4 0012ECC4 80100200 */  sll        $2, $2, 2
/* 2EDC8 0012ECC8 21105D00 */  addu       $2, $2, $sp
/* 2EDCC 0012ECCC B000428C */  lw         $2, 0xB0($2)
/* 2EDD0 0012ECD0 000040C4 */  lwc1       $f0, 0x0($2)
/* 2EDD4 0012ECD4 30006424 */  addiu      $4, $3, 0x30
/* 2EDD8 0012ECD8 000080E4 */  swc1       $f0, 0x0($4)
/* 2EDDC 0012ECDC 02000232 */  andi       $2, $16, 0x2
/* 2EDE0 0012ECE0 2B100200 */  sltu       $2, $0, $2
/* 2EDE4 0012ECE4 80100200 */  sll        $2, $2, 2
/* 2EDE8 0012ECE8 21105D00 */  addu       $2, $2, $sp
/* 2EDEC 0012ECEC B000428C */  lw         $2, 0xB0($2)
/* 2EDF0 0012ECF0 040040C4 */  lwc1       $f0, 0x4($2)
/* 2EDF4 0012ECF4 340060E4 */  swc1       $f0, 0x34($3)
/* 2EDF8 0012ECF8 04000232 */  andi       $2, $16, 0x4
/* 2EDFC 0012ECFC 2B100200 */  sltu       $2, $0, $2
/* 2EE00 0012ED00 80100200 */  sll        $2, $2, 2
/* 2EE04 0012ED04 21105D00 */  addu       $2, $2, $sp
/* 2EE08 0012ED08 B000428C */  lw         $2, 0xB0($2)
/* 2EE0C 0012ED0C 080040C4 */  lwc1       $f0, 0x8($2)
/* 2EE10 0012ED10 380060E4 */  swc1       $f0, 0x38($3)
/* 2EE14 0012ED14 90BA040C */  jal        MGClipVertex__FPf
/* 2EE18 0012ED18 00000000 */   nop
/* 2EE1C 0012ED1C 04004014 */  bnez       $2, .L0012ED30
/* 2EE20 0012ED20 00000000 */   nop
/* 2EE24 0012ED24 28160070 */  paddub     $2, $0, $0
/* 2EE28 0012ED28 0C000010 */  b          .L0012ED5C
/* 2EE2C 0012ED2C 00000000 */   nop
.L0012ED30:
/* 2EE30 0012ED30 24882202 */  and        $17, $17, $2
/* 2EE34 0012ED34 04002016 */  bnez       $17, .L0012ED48
/* 2EE38 0012ED38 00000000 */   nop
/* 2EE3C 0012ED3C 28160070 */  paddub     $2, $0, $0
/* 2EE40 0012ED40 06000010 */  b          .L0012ED5C
/* 2EE44 0012ED44 00000000 */   nop
.L0012ED48:
/* 2EE48 0012ED48 01001026 */  addiu      $16, $16, 0x1
.L0012ED4C:
/* 2EE4C 0012ED4C 0800022A */  slti       $2, $16, 0x8
/* 2EE50 0012ED50 D6FF4014 */  bnez       $2, .L0012ECAC
/* 2EE54 0012ED54 00000000 */   nop
/* 2EE58 0012ED58 01000224 */  addiu      $2, $0, 0x1
.L0012ED5C:
/* 2EE5C 0012ED5C 2000BF7B */  lq         $31, 0x20($sp)
/* 2EE60 0012ED60 1000B17B */  lq         $17, 0x10($sp)
/* 2EE64 0012ED64 0000B07B */  lq         $16, 0x0($sp)
/* 2EE68 0012ED68 C000BD27 */  addiu      $sp, $sp, 0xC0
/* 2EE6C 0012ED6C 0800E003 */  jr         $31
/* 2EE70 0012ED70 00000000 */   nop
/* 2EE74 0012ED74 00000000 */  nop
/* 2EE78 0012ED78 00000000 */  nop
/* 2EE7C 0012ED7C 00000000 */  nop
