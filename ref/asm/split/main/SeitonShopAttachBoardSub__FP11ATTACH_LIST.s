.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SeitonShopAttachBoardSub__FP11ATTACH_LIST
/* 0EC040 001EBF40 90FFBD27 */  addiu       $29, $29, -0x70
/* 0EC044 001EBF44 6000BF7F */  sq          $31, 0x60($29)
/* 0EC048 001EBF48 5000B57F */  sq          $21, 0x50($29)
/* 0EC04C 001EBF4C 4000B47F */  sq          $20, 0x40($29)
/* 0EC050 001EBF50 3000B37F */  sq          $19, 0x30($29)
/* 0EC054 001EBF54 2000B27F */  sq          $18, 0x20($29)
/* 0EC058 001EBF58 1000B17F */  sq          $17, 0x10($29)
/* 0EC05C 001EBF5C 0000B07F */  sq          $16, 0x0($29)
/* 0EC060 001EBF60 289E8070 */  paddub      $19, $4, $0
/* 0EC064 001EBF64 1488848F */  lw          $4, -0x77EC($28)
/* 0EC068 001EBF68 28860070 */  paddub      $16, $0, $0
/* 0EC06C 001EBF6C 0C000010 */  b           .L001EBFA0
/* 0EC070 001EBF70 00000000 */   nop
.L001EBF74:
/* 0EC074 001EBF74 80180400 */  sll         $3, $4, 2
/* 0EC078 001EBF78 2900023C */  lui         $2, %hi(asort_table)
/* 0EC07C 001EBF7C 00284224 */  addiu       $2, $2, %lo(asort_table)
/* 0EC080 001EBF80 21104300 */  addu        $2, $2, $3
/* 0EC084 001EBF84 000050AC */  sw          $16, 0x0($2)
/* 0EC088 001EBF88 01008424 */  addiu       $4, $4, 0x1
/* 0EC08C 001EBF8C 05008228 */  slti        $2, $4, 0x5
/* 0EC090 001EBF90 02004014 */  bnez        $2, .L001EBF9C
/* 0EC094 001EBF94 00000000 */   nop
/* 0EC098 001EBF98 28260070 */  paddub      $4, $0, $0
.L001EBF9C:
/* 0EC09C 001EBF9C 01001026 */  addiu       $16, $16, 0x1
.L001EBFA0:
/* 0EC0A0 001EBFA0 0500022A */  slti        $2, $16, 0x5
/* 0EC0A4 001EBFA4 F3FF4014 */  bnez        $2, .L001EBF74
/* 0EC0A8 001EBFA8 00000000 */   nop
/* 0EC0AC 001EBFAC 05000224 */  addiu       $2, $0, 0x5
/* 0EC0B0 001EBFB0 2900013C */  lui         $1, %hi(asort_table)
/* 0EC0B4 001EBFB4 002822AC */  sw          $2, %lo(asort_table)($1)
/* 0EC0B8 001EBFB8 28960070 */  paddub      $18, $0, $0
/* 0EC0BC 001EBFBC 28860070 */  paddub      $16, $0, $0
/* 0EC0C0 001EBFC0 1F000010 */  b           .L001EC040
/* 0EC0C4 001EBFC4 00000000 */   nop
.L001EBFC8:
/* 0EC0C8 001EBFC8 01001126 */  addiu       $17, $16, 0x1
/* 0EC0CC 001EBFCC 18000010 */  b           .L001EC030
/* 0EC0D0 001EBFD0 00000000 */   nop
.L001EBFD4:
/* 0EC0D4 001EBFD4 40111000 */  sll         $2, $16, 5
/* 0EC0D8 001EBFD8 21A86202 */  addu        $21, $19, $2
/* 0EC0DC 001EBFDC 40111100 */  sll         $2, $17, 5
/* 0EC0E0 001EBFE0 21A06202 */  addu        $20, $19, $2
/* 0EC0E4 001EBFE4 2826A072 */  paddub      $4, $21, $0
/* 0EC0E8 001EBFE8 282E8072 */  paddub      $5, $20, $0
/* 0EC0EC 001EBFEC 90AF070C */  jal         CompAttach1__FP11ATTACH_LISTP11ATTACH_LIST
/* 0EC0F0 001EBFF0 00000000 */   nop
/* 0EC0F4 001EBFF4 0D004018 */  blez        $2, .L001EC02C
/* 0EC0F8 001EBFF8 00000000 */   nop
/* 0EC0FC 001EBFFC 2826A072 */  paddub      $4, $21, $0
/* 0EC100 001EC000 282E8072 */  paddub      $5, $20, $0
/* 0EC104 001EC004 74B9080C */  jal         MenuDataSwap__FP11ATTACH_LISTP11ATTACH_LIST
/* 0EC108 001EC008 00000000 */   nop
/* 0EC10C 001EC00C 9C94838F */  lw          $3, -0x6B64($28)
/* 0EC110 001EC010 80101000 */  sll         $2, $16, 2
/* 0EC114 001EC014 21206200 */  addu        $4, $3, $2
/* 0EC118 001EC018 80101100 */  sll         $2, $17, 2
/* 0EC11C 001EC01C 21286200 */  addu        $5, $3, $2
/* 0EC120 001EC020 44B9080C */  jal         MenuDataSwap__FPiPi
/* 0EC124 001EC024 00000000 */   nop
/* 0EC128 001EC028 01001224 */  addiu       $18, $0, 0x1
.L001EC02C:
/* 0EC12C 001EC02C 01003126 */  addiu       $17, $17, 0x1
.L001EC030:
/* 0EC130 001EC030 2800222A */  slti        $2, $17, 0x28
/* 0EC134 001EC034 E7FF4014 */  bnez        $2, .L001EBFD4
/* 0EC138 001EC038 00000000 */   nop
/* 0EC13C 001EC03C 01001026 */  addiu       $16, $16, 0x1
.L001EC040:
/* 0EC140 001EC040 2700022A */  slti        $2, $16, 0x27
/* 0EC144 001EC044 E0FF4014 */  bnez        $2, .L001EBFC8
/* 0EC148 001EC048 00000000 */   nop
/* 0EC14C 001EC04C 28164072 */  paddub      $2, $18, $0
/* 0EC150 001EC050 6000BF7B */  lq          $31, 0x60($29)
/* 0EC154 001EC054 5000B57B */  lq          $21, 0x50($29)
/* 0EC158 001EC058 4000B47B */  lq          $20, 0x40($29)
/* 0EC15C 001EC05C 3000B37B */  lq          $19, 0x30($29)
/* 0EC160 001EC060 2000B27B */  lq          $18, 0x20($29)
/* 0EC164 001EC064 1000B17B */  lq          $17, 0x10($29)
/* 0EC168 001EC068 0000B07B */  lq          $16, 0x0($29)
/* 0EC16C 001EC06C 7000BD27 */  addiu       $29, $29, 0x70
/* 0EC170 001EC070 0800E003 */  jr          $31
/* 0EC174 001EC074 00000000 */   nop
/* 0EC178 001EC078 00000000 */  nop
/* 0EC17C 001EC07C 00000000 */  nop
