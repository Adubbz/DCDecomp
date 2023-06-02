.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Draw__4CMapFv
/* 43AC0 001439C0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 43AC4 001439C4 2000BF7F */  sq         $31, 0x20($sp)
/* 43AC8 001439C8 1000B17F */  sq         $17, 0x10($sp)
/* 43ACC 001439CC 0000B07F */  sq         $16, 0x0($sp)
/* 43AD0 001439D0 288E8070 */  paddub     $17, $4, $0
/* 43AD4 001439D4 28860070 */  paddub     $16, $0, $0
/* 43AD8 001439D8 25000010 */  b          .L00143A70
/* 43ADC 001439DC 00000000 */   nop
.L001439E0:
/* 43AE0 001439E0 00191000 */  sll        $3, $16, 4
/* 43AE4 001439E4 23187000 */  subu       $3, $3, $16
/* 43AE8 001439E8 00190300 */  sll        $3, $3, 4
/* 43AEC 001439EC 21182302 */  addu       $3, $17, $3
/* 43AF0 001439F0 80016424 */  addiu      $4, $3, 0x180
/* 43AF4 001439F4 6402638C */  lw         $3, 0x264($3)
/* 43AF8 001439F8 1C006004 */  bltz       $3, .L00143A6C
/* 43AFC 001439FC 00000000 */   nop
/* 43B00 00143A00 40100300 */  sll        $2, $3, 1
/* 43B04 00143A04 21104300 */  addu       $2, $2, $3
/* 43B08 00143A08 C0100200 */  sll        $2, $2, 3
/* 43B0C 00143A0C 21282202 */  addu       $5, $17, $2
/* 43B10 00143A10 0000A1C4 */  lwc1       $f1, 0x0($5)
/* 43B14 00143A14 00008044 */  mtc1       $0, $f0
/* 43B18 00143A18 00000000 */  nop
/* 43B1C 00143A1C 36080046 */  c.le.s     $f1, $f0
/* 43B20 00143A20 00000000 */  nop
/* 43B24 00143A24 0D000145 */  bc1t       .L00143A5C
/* 43B28 00143A28 00000000 */   nop
/* 43B2C 00143A2C E00A228E */  lw         $2, 0xAE0($17)
/* 43B30 00143A30 0A004010 */  beqz       $2, .L00143A5C
/* 43B34 00143A34 00000000 */   nop
/* 43B38 00143A38 1000A68C */  lw         $6, 0x10($5)
/* 43B3C 00143A3C 1400A78C */  lw         $7, 0x14($5)
/* 43B40 00143A40 28460070 */  paddub     $8, $0, $0
/* 43B44 00143A44 A000998C */  lw         $25, 0xA0($4)
/* 43B48 00143A48 9800398F */  lw         $25, 0x98($25)
/* 43B4C 00143A4C 09F82003 */  jalr       $25
/* 43B50 00143A50 00000000 */   nop
/* 43B54 00143A54 05000010 */  b          .L00143A6C
/* 43B58 00143A58 00000000 */   nop
.L00143A5C:
/* 43B5C 00143A5C A000998C */  lw         $25, 0xA0($4)
/* 43B60 00143A60 9400398F */  lw         $25, 0x94($25)
/* 43B64 00143A64 09F82003 */  jalr       $25
/* 43B68 00143A68 00000000 */   nop
.L00143A6C:
/* 43B6C 00143A6C 01001026 */  addiu      $16, $16, 0x1
.L00143A70:
/* 43B70 00143A70 0A00032A */  slti       $3, $16, 0xA
/* 43B74 00143A74 DAFF6014 */  bnez       $3, .L001439E0
/* 43B78 00143A78 00000000 */   nop
/* 43B7C 00143A7C 2000BF7B */  lq         $31, 0x20($sp)
/* 43B80 00143A80 1000B17B */  lq         $17, 0x10($sp)
/* 43B84 00143A84 0000B07B */  lq         $16, 0x0($sp)
/* 43B88 00143A88 3000BD27 */  addiu      $sp, $sp, 0x30
/* 43B8C 00143A8C 0800E003 */  jr         $31
/* 43B90 00143A90 00000000 */   nop
/* 43B94 00143A94 00000000 */  nop
/* 43B98 00143A98 00000000 */  nop
/* 43B9C 00143A9C 00000000 */  nop
