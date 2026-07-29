.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadFileBG__FPcP1Pi
/* 03EBB0 0013EAB0 A0FFBD27 */  addiu       $29, $29, -0x60
/* 03EBB4 0013EAB4 5000BF7F */  sq          $31, 0x50($29)
/* 03EBB8 0013EAB8 4000B47F */  sq          $20, 0x40($29)
/* 03EBBC 0013EABC 3000B37F */  sq          $19, 0x30($29)
/* 03EBC0 0013EAC0 2000B27F */  sq          $18, 0x20($29)
/* 03EBC4 0013EAC4 1000B17F */  sq          $17, 0x10($29)
/* 03EBC8 0013EAC8 0000B07F */  sq          $16, 0x0($29)
/* 03EBCC 0013EACC 28A68070 */  paddub      $20, $4, $0
/* 03EBD0 0013EAD0 289EA070 */  paddub      $19, $5, $0
/* 03EBD4 0013EAD4 2896C070 */  paddub      $18, $6, $0
/* 03EBD8 0013EAD8 02004012 */  beqz        $18, .L0013EAE4
/* 03EBDC 0013EADC 00000000 */   nop
/* 03EBE0 0013EAE0 000040AE */  sw          $0, 0x0($18)
.L0013EAE4:
/* 03EBE4 0013EAE4 04008016 */  bnez        $20, .L0013EAF8
/* 03EBE8 0013EAE8 00000000 */   nop
/* 03EBEC 0013EAEC 28160070 */  paddub      $2, $0, $0
/* 03EBF0 0013EAF0 52000010 */  b           .L0013EC3C
/* 03EBF4 0013EAF4 00000000 */   nop
.L0013EAF8:
/* 03EBF8 0013EAF8 00008282 */  lb          $2, 0x0($20)
/* 03EBFC 0013EAFC 04004014 */  bnez        $2, .L0013EB10
/* 03EC00 0013EB00 00000000 */   nop
/* 03EC04 0013EB04 28160070 */  paddub      $2, $0, $0
/* 03EC08 0013EB08 4C000010 */  b           .L0013EC3C
/* 03EC0C 0013EB0C 00000000 */   nop
.L0013EB10:
/* 03EC10 0013EB10 CC01023C */  lui         $2, %hi(bg_read_info)
/* 03EC14 0013EB14 C0B05024 */  addiu       $16, $2, %lo(bg_read_info)
/* 03EC18 0013EB18 281E0070 */  paddub      $3, $0, $0
/* 03EC1C 0013EB1C 06000010 */  b           .L0013EB38
/* 03EC20 0013EB20 00000000 */   nop
.L0013EB24:
/* 03EC24 0013EB24 0000028E */  lw          $2, 0x0($16)
/* 03EC28 0013EB28 06004010 */  beqz        $2, .L0013EB44
/* 03EC2C 0013EB2C 00000000 */   nop
/* 03EC30 0013EB30 01006324 */  addiu       $3, $3, 0x1
/* 03EC34 0013EB34 9C001026 */  addiu       $16, $16, 0x9C
.L0013EB38:
/* 03EC38 0013EB38 20006228 */  slti        $2, $3, 0x20
/* 03EC3C 0013EB3C F9FF4014 */  bnez        $2, .L0013EB24
/* 03EC40 0013EB40 00000000 */   nop
.L0013EB44:
/* 03EC44 0013EB44 20000224 */  addiu       $2, $0, 0x20
/* 03EC48 0013EB48 04006214 */  bne         $3, $2, .L0013EB5C
/* 03EC4C 0013EB4C 00000000 */   nop
/* 03EC50 0013EB50 28160070 */  paddub      $2, $0, $0
/* 03EC54 0013EB54 39000010 */  b           .L0013EC3C
/* 03EC58 0013EB58 00000000 */   nop
.L0013EB5C:
/* 03EC5C 0013EB5C 0002013C */  lui         $1, (0x2000001 >> 16)
/* 03EC60 0013EB60 01002134 */  ori         $1, $1, (0x2000001 & 0xFFFF)
/* 03EC64 0013EB64 2A086102 */  slt         $1, $19, $1
/* 03EC68 0013EB68 07002014 */  bnez        $1, .L0013EB88
/* 03EC6C 0013EB6C 00000000 */   nop
/* 03EC70 0013EB70 2A00023C */  lui         $2, %hi(LIT_234)
/* 03EC74 0013EB74 78904424 */  addiu       $4, $2, %lo(LIT_234)
/* 03EC78 0013EB78 A611040C */  jal         printf
/* 03EC7C 0013EB7C 00000000 */   nop
.L0013EB80:
/* 03EC80 0013EB80 FFFF0010 */  b           .L0013EB80
/* 03EC84 0013EB84 00000000 */   nop
.L0013EB88:
/* 03EC88 0013EB88 3F006232 */  andi        $2, $19, 0x3F
/* 03EC8C 0013EB8C 04006106 */  bgez        $19, .L0013EBA0
/* 03EC90 0013EB90 00000000 */   nop
/* 03EC94 0013EB94 02004010 */  beqz        $2, .L0013EBA0
/* 03EC98 0013EB98 00000000 */   nop
/* 03EC9C 0013EB9C C0FF4224 */  addiu       $2, $2, -0x40
.L0013EBA0:
/* 03ECA0 0013EBA0 07004010 */  beqz        $2, .L0013EBC0
/* 03ECA4 0013EBA4 00000000 */   nop
/* 03ECA8 0013EBA8 2A00023C */  lui         $2, %hi(LIT_235)
/* 03ECAC 0013EBAC 90904424 */  addiu       $4, $2, %lo(LIT_235)
/* 03ECB0 0013EBB0 282E6072 */  paddub      $5, $19, $0
/* 03ECB4 0013EBB4 28368072 */  paddub      $6, $20, $0
/* 03ECB8 0013EBB8 A611040C */  jal         printf
/* 03ECBC 0013EBBC 00000000 */   nop
.L0013EBC0:
/* 03ECC0 0013EBC0 28268072 */  paddub      $4, $20, $0
/* 03ECC4 0013EBC4 60FA040C */  jal         SearchFile__FPc
/* 03ECC8 0013EBC8 00000000 */   nop
/* 03ECCC 0013EBCC 288E4070 */  paddub      $17, $2, $0
/* 03ECD0 0013EBD0 04002016 */  bnez        $17, .L0013EBE4
/* 03ECD4 0013EBD4 00000000 */   nop
/* 03ECD8 0013EBD8 28160070 */  paddub      $2, $0, $0
/* 03ECDC 0013EBDC 17000010 */  b           .L0013EC3C
/* 03ECE0 0013EBE0 00000000 */   nop
.L0013EBE4:
/* 03ECE4 0013EBE4 0C000426 */  addiu       $4, $16, 0xC
/* 03ECE8 0013EBE8 282E8072 */  paddub      $5, $20, $0
/* 03ECEC 0013EBEC 5A15040C */  jal         strcpy
/* 03ECF0 0013EBF0 00000000 */   nop
/* 03ECF4 0013EBF4 01000224 */  addiu       $2, $0, 0x1
/* 03ECF8 0013EBF8 000002AE */  sw          $2, 0x0($16)
/* 03ECFC 0013EBFC 040000AE */  sw          $0, 0x4($16)
/* 03ED00 0013EC00 080000AE */  sw          $0, 0x8($16)
/* 03ED04 0013EC04 8C0013AE */  sw          $19, 0x8C($16)
/* 03ED08 0013EC08 0800228E */  lw          $2, 0x8($17)
/* 03ED0C 0013EC0C 900002AE */  sw          $2, 0x90($16)
/* 03ED10 0013EC10 03004012 */  beqz        $18, .L0013EC20
/* 03ED14 0013EC14 00000000 */   nop
/* 03ED18 0013EC18 0800228E */  lw          $2, 0x8($17)
/* 03ED1C 0013EC1C 000042AE */  sw          $2, 0x0($18)
.L0013EC20:
/* 03ED20 0013EC20 0C00238E */  lw          $3, 0xC($17)
/* 03ED24 0013EC24 008D828F */  lw          $2, -0x7300($28)
/* 03ED28 0013EC28 21106200 */  addu        $2, $3, $2
/* 03ED2C 0013EC2C 940002AE */  sw          $2, 0x94($16)
/* 03ED30 0013EC30 1000228E */  lw          $2, 0x10($17)
/* 03ED34 0013EC34 980002AE */  sw          $2, 0x98($16)
/* 03ED38 0013EC38 01000224 */  addiu       $2, $0, 0x1
.L0013EC3C:
/* 03ED3C 0013EC3C 5000BF7B */  lq          $31, 0x50($29)
/* 03ED40 0013EC40 4000B47B */  lq          $20, 0x40($29)
/* 03ED44 0013EC44 3000B37B */  lq          $19, 0x30($29)
/* 03ED48 0013EC48 2000B27B */  lq          $18, 0x20($29)
/* 03ED4C 0013EC4C 1000B17B */  lq          $17, 0x10($29)
/* 03ED50 0013EC50 0000B07B */  lq          $16, 0x0($29)
/* 03ED54 0013EC54 6000BD27 */  addiu       $29, $29, 0x60
/* 03ED58 0013EC58 0800E003 */  jr          $31
/* 03ED5C 0013EC5C 00000000 */   nop
