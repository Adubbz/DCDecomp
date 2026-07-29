.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ChargeShopMaxDraw__Fiiii
/* 0EAE50 001EAD50 80FFBD27 */  addiu       $29, $29, -0x80
/* 0EAE54 001EAD54 4000BF7F */  sq          $31, 0x40($29)
/* 0EAE58 001EAD58 3000B37F */  sq          $19, 0x30($29)
/* 0EAE5C 001EAD5C 2000B27F */  sq          $18, 0x20($29)
/* 0EAE60 001EAD60 1000B17F */  sq          $17, 0x10($29)
/* 0EAE64 001EAD64 0000B07F */  sq          $16, 0x0($29)
/* 0EAE68 001EAD68 289E8070 */  paddub      $19, $4, $0
/* 0EAE6C 001EAD6C 2896A070 */  paddub      $18, $5, $0
/* 0EAE70 001EAD70 288EC070 */  paddub      $17, $6, $0
/* 0EAE74 001EAD74 2886E070 */  paddub      $16, $7, $0
/* 0EAE78 001EAD78 D2004526 */  addiu       $5, $18, 0xD2
/* 0EAE7C 001EAD7C D8FF2626 */  addiu       $6, $17, -0x28
/* 0EAE80 001EAD80 00010224 */  addiu       $2, $0, 0x100
/* 0EAE84 001EAD84 7000A2AF */  sw          $2, 0x70($29)
/* 0EAE88 001EAD88 90000224 */  addiu       $2, $0, 0x90
/* 0EAE8C 001EAD8C 7400A2AF */  sw          $2, 0x74($29)
/* 0EAE90 001EAD90 30000324 */  addiu       $3, $0, 0x30
/* 0EAE94 001EAD94 7800A3AF */  sw          $3, 0x78($29)
/* 0EAE98 001EAD98 7C00A3AF */  sw          $3, 0x7C($29)
/* 0EAE9C 001EAD9C 6000A5AF */  sw          $5, 0x60($29)
/* 0EAEA0 001EADA0 0100C224 */  addiu       $2, $6, 0x1
/* 0EAEA4 001EADA4 6400A2AF */  sw          $2, 0x64($29)
/* 0EAEA8 001EADA8 6800A3AF */  sw          $3, 0x68($29)
/* 0EAEAC 001EADAC 2F000224 */  addiu       $2, $0, 0x2F
/* 0EAEB0 001EADB0 6C00A2AF */  sw          $2, 0x6C($29)
/* 0EAEB4 001EADB4 8894848F */  lw          $4, -0x6B78($28)
/* 0EAEB8 001EADB8 6000A527 */  addiu       $5, $29, 0x60
/* 0EAEBC 001EADBC 7000A627 */  addiu       $6, $29, 0x70
/* 0EAEC0 001EADC0 C8B3080C */  jal         DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 0EAEC4 001EADC4 00000000 */   nop
/* 0EAEC8 001EADC8 2900023C */  lui         $2, %hi(LIT_1377)
/* 0EAECC 001EADCC 90274224 */  addiu       $2, $2, %lo(LIT_1377)
/* 0EAED0 001EADD0 5000A827 */  addiu       $8, $29, 0x50
/* 0EAED4 001EADD4 00004278 */  lq          $2, 0x0($2)
/* 0EAED8 001EADD8 0000027D */  sq          $2, 0x0($8)
/* 0EAEDC 001EADDC F7004526 */  addiu       $5, $18, 0xF7
/* 0EAEE0 001EADE0 F2FF2626 */  addiu       $6, $17, -0xE
/* 0EAEE4 001EADE4 28266072 */  paddub      $4, $19, $0
/* 0EAEE8 001EADE8 8894878F */  lw          $7, -0x6B78($28)
/* 0EAEEC 001EADEC 01000924 */  addiu       $9, $0, 0x1
/* 0EAEF0 001EADF0 28560072 */  paddub      $10, $16, $0
/* 0EAEF4 001EADF4 705F080C */  jal         DrawMenuNumber__FiiiP8CTexture4RECTii
/* 0EAEF8 001EADF8 00000000 */   nop
/* 0EAEFC 001EADFC F2004526 */  addiu       $5, $18, 0xF2
/* 0EAF00 001EAE00 DEFF2626 */  addiu       $6, $17, -0x22
/* 0EAF04 001EAE04 28260070 */  paddub      $4, $0, $0
/* 0EAF08 001EAE08 D901013C */  lui         $1, %hi(ShopMenu + 0xC)
/* 0EAF0C 001EAE0C DC00238C */  lw          $3, %lo(ShopMenu + 0xC)($1)
/* 0EAF10 001EAE10 02000224 */  addiu       $2, $0, 0x2
/* 0EAF14 001EAE14 2C006210 */  beq         $3, $2, .L001EAEC8
/* 0EAF18 001EAE18 00000000 */   nop
/* 0EAF1C 001EAE1C 01000224 */  addiu       $2, $0, 0x1
/* 0EAF20 001EAE20 16006210 */  beq         $3, $2, .L001EAE7C
/* 0EAF24 001EAE24 00000000 */   nop
/* 0EAF28 001EAE28 03006010 */  beqz        $3, .L001EAE38
/* 0EAF2C 001EAE2C 00000000 */   nop
/* 0EAF30 001EAE30 34000010 */  b           .L001EAF04
/* 0EAF34 001EAE34 00000000 */   nop
.L001EAE38:
/* 0EAF38 001EAE38 28160070 */  paddub      $2, $0, $0
/* 0EAF3C 001EAE3C 0A000010 */  b           .L001EAE68
/* 0EAF40 001EAE40 00000000 */   nop
.L001EAE44:
/* 0EAF44 001EAE44 40380200 */  sll         $7, $2, 1
/* 0EAF48 001EAE48 8C94838F */  lw          $3, -0x6B74($28)
/* 0EAF4C 001EAE4C 21186700 */  addu        $3, $3, $7
/* 0EAF50 001EAE50 00006384 */  lh          $3, 0x0($3)
/* 0EAF54 001EAE54 84006328 */  slti        $3, $3, 0x84
/* 0EAF58 001EAE58 02006014 */  bnez        $3, .L001EAE64
/* 0EAF5C 001EAE5C 00000000 */   nop
/* 0EAF60 001EAE60 01008424 */  addiu       $4, $4, 0x1
.L001EAE64:
/* 0EAF64 001EAE64 01004224 */  addiu       $2, $2, 0x1
.L001EAE68:
/* 0EAF68 001EAE68 3C004328 */  slti        $3, $2, 0x3C
/* 0EAF6C 001EAE6C F5FF6014 */  bnez        $3, .L001EAE44
/* 0EAF70 001EAE70 00000000 */   nop
/* 0EAF74 001EAE74 23000010 */  b           .L001EAF04
/* 0EAF78 001EAE78 00000000 */   nop
.L001EAE7C:
/* 0EAF7C 001EAE7C 28160070 */  paddub      $2, $0, $0
/* 0EAF80 001EAE80 0C000010 */  b           .L001EAEB4
/* 0EAF84 001EAE84 00000000 */   nop
.L001EAE88:
/* 0EAF88 001EAE88 8C94878F */  lw          $7, -0x6B74($28)
/* 0EAF8C 001EAE8C 40190200 */  sll         $3, $2, 5
/* 0EAF90 001EAE90 23186200 */  subu        $3, $3, $2
/* 0EAF94 001EAE94 C0180300 */  sll         $3, $3, 3
/* 0EAF98 001EAE98 21186700 */  addu        $3, $3, $7
/* 0EAF9C 001EAE9C F0006384 */  lh          $3, 0xF0($3)
/* 0EAFA0 001EAEA0 01016328 */  slti        $3, $3, 0x101
/* 0EAFA4 001EAEA4 02006014 */  bnez        $3, .L001EAEB0
/* 0EAFA8 001EAEA8 00000000 */   nop
/* 0EAFAC 001EAEAC 01008424 */  addiu       $4, $4, 0x1
.L001EAEB0:
/* 0EAFB0 001EAEB0 01004224 */  addiu       $2, $2, 0x1
.L001EAEB4:
/* 0EAFB4 001EAEB4 1E004328 */  slti        $3, $2, 0x1E
/* 0EAFB8 001EAEB8 F3FF6014 */  bnez        $3, .L001EAE88
/* 0EAFBC 001EAEBC 00000000 */   nop
/* 0EAFC0 001EAEC0 10000010 */  b           .L001EAF04
/* 0EAFC4 001EAEC4 00000000 */   nop
.L001EAEC8:
/* 0EAFC8 001EAEC8 28160070 */  paddub      $2, $0, $0
/* 0EAFCC 001EAECC 0A000010 */  b           .L001EAEF8
/* 0EAFD0 001EAED0 00000000 */   nop
.L001EAED4:
/* 0EAFD4 001EAED4 8C94878F */  lw          $7, -0x6B74($28)
/* 0EAFD8 001EAED8 40190200 */  sll         $3, $2, 5
/* 0EAFDC 001EAEDC 21186700 */  addu        $3, $3, $7
/* 0EAFE0 001EAEE0 001E6384 */  lh          $3, 0x1E00($3)
/* 0EAFE4 001EAEE4 51006328 */  slti        $3, $3, 0x51
/* 0EAFE8 001EAEE8 02006014 */  bnez        $3, .L001EAEF4
/* 0EAFEC 001EAEEC 00000000 */   nop
/* 0EAFF0 001EAEF0 01008424 */  addiu       $4, $4, 0x1
.L001EAEF4:
/* 0EAFF4 001EAEF4 01004224 */  addiu       $2, $2, 0x1
.L001EAEF8:
/* 0EAFF8 001EAEF8 1E004328 */  slti        $3, $2, 0x1E
/* 0EAFFC 001EAEFC F5FF6014 */  bnez        $3, .L001EAED4
/* 0EB000 001EAF00 00000000 */   nop
.L001EAF04:
/* 0EB004 001EAF04 8894878F */  lw          $7, -0x6B78($28)
/* 0EB008 001EAF08 5000A827 */  addiu       $8, $29, 0x50
/* 0EB00C 001EAF0C 01000924 */  addiu       $9, $0, 0x1
/* 0EB010 001EAF10 28560072 */  paddub      $10, $16, $0
/* 0EB014 001EAF14 705F080C */  jal         DrawMenuNumber__FiiiP8CTexture4RECTii
/* 0EB018 001EAF18 00000000 */   nop
/* 0EB01C 001EAF1C 4000BF7B */  lq          $31, 0x40($29)
/* 0EB020 001EAF20 3000B37B */  lq          $19, 0x30($29)
/* 0EB024 001EAF24 2000B27B */  lq          $18, 0x20($29)
/* 0EB028 001EAF28 1000B17B */  lq          $17, 0x10($29)
/* 0EB02C 001EAF2C 0000B07B */  lq          $16, 0x0($29)
/* 0EB030 001EAF30 8000BD27 */  addiu       $29, $29, 0x80
/* 0EB034 001EAF34 0800E003 */  jr          $31
/* 0EB038 001EAF38 00000000 */   nop
/* 0EB03C 001EAF3C 00000000 */  nop
