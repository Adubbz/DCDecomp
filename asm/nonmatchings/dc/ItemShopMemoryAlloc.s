.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ItemShopMemoryAlloc__Fv
/* EDCF0 001EDBF0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* EDCF4 001EDBF4 0000BF7F */  sq         $31, 0x0($sp)
/* EDCF8 001EDBF8 D901023C */  lui        $2, %hi(ShopCashBuffer)
/* EDCFC 001EDBFC B0004424 */  addiu      $4, $2, %lo(ShopCashBuffer)
/* EDD00 001EDC00 78000524 */  addiu      $5, $0, 0x78
/* EDD04 001EDC04 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* EDD08 001EDC08 00000000 */   nop
/* EDD0C 001EDC0C 909482AF */  sw         $2, -0x6B70($gp)
/* EDD10 001EDC10 D901023C */  lui        $2, %hi(ShopCashBuffer)
/* EDD14 001EDC14 B0004424 */  addiu      $4, $2, %lo(ShopCashBuffer)
/* EDD18 001EDC18 90010524 */  addiu      $5, $0, 0x190
/* EDD1C 001EDC1C 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* EDD20 001EDC20 00000000 */   nop
/* EDD24 001EDC24 949482AF */  sw         $2, -0x6B6C($gp)
/* EDD28 001EDC28 D901023C */  lui        $2, %hi(ShopCashBuffer)
/* EDD2C 001EDC2C B0004424 */  addiu      $4, $2, %lo(ShopCashBuffer)
/* EDD30 001EDC30 F0000524 */  addiu      $5, $0, 0xF0
/* EDD34 001EDC34 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* EDD38 001EDC38 00000000 */   nop
/* EDD3C 001EDC3C 989482AF */  sw         $2, -0x6B68($gp)
/* EDD40 001EDC40 D901023C */  lui        $2, %hi(ShopCashBuffer)
/* EDD44 001EDC44 B0004424 */  addiu      $4, $2, %lo(ShopCashBuffer)
/* EDD48 001EDC48 A0000524 */  addiu      $5, $0, 0xA0
/* EDD4C 001EDC4C 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* EDD50 001EDC50 00000000 */   nop
/* EDD54 001EDC54 9C9482AF */  sw         $2, -0x6B64($gp)
/* EDD58 001EDC58 9094848F */  lw         $4, -0x6B70($gp)
/* EDD5C 001EDC5C 282E0070 */  paddub     $5, $0, $0
/* EDD60 001EDC60 78000624 */  addiu      $6, $0, 0x78
/* EDD64 001EDC64 5A0D040C */  jal        memset
/* EDD68 001EDC68 00000000 */   nop
/* EDD6C 001EDC6C 9494848F */  lw         $4, -0x6B6C($gp)
/* EDD70 001EDC70 282E0070 */  paddub     $5, $0, $0
/* EDD74 001EDC74 90010624 */  addiu      $6, $0, 0x190
/* EDD78 001EDC78 5A0D040C */  jal        memset
/* EDD7C 001EDC7C 00000000 */   nop
/* EDD80 001EDC80 9894848F */  lw         $4, -0x6B68($gp)
/* EDD84 001EDC84 282E0070 */  paddub     $5, $0, $0
/* EDD88 001EDC88 F0000624 */  addiu      $6, $0, 0xF0
/* EDD8C 001EDC8C 5A0D040C */  jal        memset
/* EDD90 001EDC90 00000000 */   nop
/* EDD94 001EDC94 9C94848F */  lw         $4, -0x6B64($gp)
/* EDD98 001EDC98 282E0070 */  paddub     $5, $0, $0
/* EDD9C 001EDC9C A0000624 */  addiu      $6, $0, 0xA0
/* EDDA0 001EDCA0 5A0D040C */  jal        memset
/* EDDA4 001EDCA4 00000000 */   nop
/* EDDA8 001EDCA8 D901023C */  lui        $2, %hi(ShopCashBuffer)
/* EDDAC 001EDCAC B0004424 */  addiu      $4, $2, %lo(ShopCashBuffer)
/* EDDB0 001EDCB0 881D0524 */  addiu      $5, $0, 0x1D88
/* EDDB4 001EDCB4 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* EDDB8 001EDCB8 00000000 */   nop
/* EDDBC 001EDCBC A09482AF */  sw         $2, -0x6B60($gp)
/* EDDC0 001EDCC0 A094848F */  lw         $4, -0x6B60($gp)
/* EDDC4 001EDCC4 282E0070 */  paddub     $5, $0, $0
/* EDDC8 001EDCC8 881D0624 */  addiu      $6, $0, 0x1D88
/* EDDCC 001EDCCC 5A0D040C */  jal        memset
/* EDDD0 001EDCD0 00000000 */   nop
/* EDDD4 001EDCD4 D901023C */  lui        $2, %hi(ShopCashBuffer)
/* EDDD8 001EDCD8 B0004424 */  addiu      $4, $2, %lo(ShopCashBuffer)
/* EDDDC 001EDCDC 881D0524 */  addiu      $5, $0, 0x1D88
/* EDDE0 001EDCE0 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* EDDE4 001EDCE4 00000000 */   nop
/* EDDE8 001EDCE8 A49482AF */  sw         $2, -0x6B5C($gp)
/* EDDEC 001EDCEC 0000BF7B */  lq         $31, 0x0($sp)
/* EDDF0 001EDCF0 1000BD27 */  addiu      $sp, $sp, 0x10
/* EDDF4 001EDCF4 0800E003 */  jr         $31
/* EDDF8 001EDCF8 00000000 */   nop
/* EDDFC 001EDCFC 00000000 */  nop
