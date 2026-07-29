.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ItemShopMemoryAlloc__Fv
/* 0EDCF0 001EDBF0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0EDCF4 001EDBF4 0000BF7F */  sq          $31, 0x0($29)
/* 0EDCF8 001EDBF8 D901023C */  lui         $2, %hi(ShopCashBuffer)
/* 0EDCFC 001EDBFC B0004424 */  addiu       $4, $2, %lo(ShopCashBuffer)
/* 0EDD00 001EDC00 78000524 */  addiu       $5, $0, 0x78
/* 0EDD04 001EDC04 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 0EDD08 001EDC08 00000000 */   nop
/* 0EDD0C 001EDC0C 909482AF */  sw          $2, -0x6B70($28)
/* 0EDD10 001EDC10 D901023C */  lui         $2, %hi(ShopCashBuffer)
/* 0EDD14 001EDC14 B0004424 */  addiu       $4, $2, %lo(ShopCashBuffer)
/* 0EDD18 001EDC18 90010524 */  addiu       $5, $0, 0x190
/* 0EDD1C 001EDC1C 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 0EDD20 001EDC20 00000000 */   nop
/* 0EDD24 001EDC24 949482AF */  sw          $2, -0x6B6C($28)
/* 0EDD28 001EDC28 D901023C */  lui         $2, %hi(ShopCashBuffer)
/* 0EDD2C 001EDC2C B0004424 */  addiu       $4, $2, %lo(ShopCashBuffer)
/* 0EDD30 001EDC30 F0000524 */  addiu       $5, $0, 0xF0
/* 0EDD34 001EDC34 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 0EDD38 001EDC38 00000000 */   nop
/* 0EDD3C 001EDC3C 989482AF */  sw          $2, -0x6B68($28)
/* 0EDD40 001EDC40 D901023C */  lui         $2, %hi(ShopCashBuffer)
/* 0EDD44 001EDC44 B0004424 */  addiu       $4, $2, %lo(ShopCashBuffer)
/* 0EDD48 001EDC48 A0000524 */  addiu       $5, $0, 0xA0
/* 0EDD4C 001EDC4C 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 0EDD50 001EDC50 00000000 */   nop
/* 0EDD54 001EDC54 9C9482AF */  sw          $2, -0x6B64($28)
/* 0EDD58 001EDC58 9094848F */  lw          $4, -0x6B70($28)
/* 0EDD5C 001EDC5C 282E0070 */  paddub      $5, $0, $0
/* 0EDD60 001EDC60 78000624 */  addiu       $6, $0, 0x78
/* 0EDD64 001EDC64 5A0D040C */  jal         memset
/* 0EDD68 001EDC68 00000000 */   nop
/* 0EDD6C 001EDC6C 9494848F */  lw          $4, -0x6B6C($28)
/* 0EDD70 001EDC70 282E0070 */  paddub      $5, $0, $0
/* 0EDD74 001EDC74 90010624 */  addiu       $6, $0, 0x190
/* 0EDD78 001EDC78 5A0D040C */  jal         memset
/* 0EDD7C 001EDC7C 00000000 */   nop
/* 0EDD80 001EDC80 9894848F */  lw          $4, -0x6B68($28)
/* 0EDD84 001EDC84 282E0070 */  paddub      $5, $0, $0
/* 0EDD88 001EDC88 F0000624 */  addiu       $6, $0, 0xF0
/* 0EDD8C 001EDC8C 5A0D040C */  jal         memset
/* 0EDD90 001EDC90 00000000 */   nop
/* 0EDD94 001EDC94 9C94848F */  lw          $4, -0x6B64($28)
/* 0EDD98 001EDC98 282E0070 */  paddub      $5, $0, $0
/* 0EDD9C 001EDC9C A0000624 */  addiu       $6, $0, 0xA0
/* 0EDDA0 001EDCA0 5A0D040C */  jal         memset
/* 0EDDA4 001EDCA4 00000000 */   nop
/* 0EDDA8 001EDCA8 D901023C */  lui         $2, %hi(ShopCashBuffer)
/* 0EDDAC 001EDCAC B0004424 */  addiu       $4, $2, %lo(ShopCashBuffer)
/* 0EDDB0 001EDCB0 881D0524 */  addiu       $5, $0, 0x1D88
/* 0EDDB4 001EDCB4 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 0EDDB8 001EDCB8 00000000 */   nop
/* 0EDDBC 001EDCBC A09482AF */  sw          $2, -0x6B60($28)
/* 0EDDC0 001EDCC0 A094848F */  lw          $4, -0x6B60($28)
/* 0EDDC4 001EDCC4 282E0070 */  paddub      $5, $0, $0
/* 0EDDC8 001EDCC8 881D0624 */  addiu       $6, $0, 0x1D88
/* 0EDDCC 001EDCCC 5A0D040C */  jal         memset
/* 0EDDD0 001EDCD0 00000000 */   nop
/* 0EDDD4 001EDCD4 D901023C */  lui         $2, %hi(ShopCashBuffer)
/* 0EDDD8 001EDCD8 B0004424 */  addiu       $4, $2, %lo(ShopCashBuffer)
/* 0EDDDC 001EDCDC 881D0524 */  addiu       $5, $0, 0x1D88
/* 0EDDE0 001EDCE0 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 0EDDE4 001EDCE4 00000000 */   nop
/* 0EDDE8 001EDCE8 A49482AF */  sw          $2, -0x6B5C($28)
/* 0EDDEC 001EDCEC 0000BF7B */  lq          $31, 0x0($29)
/* 0EDDF0 001EDCF0 1000BD27 */  addiu       $29, $29, 0x10
/* 0EDDF4 001EDCF4 0800E003 */  jr          $31
/* 0EDDF8 001EDCF8 00000000 */   nop
/* 0EDDFC 001EDCFC 00000000 */  nop
