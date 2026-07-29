.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetItemShopTalkMode__Fii
/* 0E72D0 001E71D0 03008004 */  bltz        $4, .L001E71E0
/* 0E72D4 001E71D4 00000000 */   nop
/* 0E72D8 001E71D8 D901013C */  lui         $1, %hi(ShopMenu + 0x180)
/* 0E72DC 001E71DC 500224A4 */  sh          $4, %lo(ShopMenu + 0x180)($1)
.L001E71E0:
/* 0E72E0 001E71E0 0300A004 */  bltz        $5, .L001E71F0
/* 0E72E4 001E71E4 00000000 */   nop
/* 0E72E8 001E71E8 D901013C */  lui         $1, %hi(ShopMenu + 0x19A)
/* 0E72EC 001E71EC 6A0225A4 */  sh          $5, %lo(ShopMenu + 0x19A)($1)
.L001E71F0:
/* 0E72F0 001E71F0 D901013C */  lui         $1, %hi(ShopMenu + 0x19A)
/* 0E72F4 001E71F4 6A022484 */  lh          $4, %lo(ShopMenu + 0x19A)($1)
/* 0E72F8 001E71F8 01000324 */  addiu       $3, $0, 0x1
/* 0E72FC 001E71FC 06008314 */  bne         $4, $3, .L001E7218
/* 0E7300 001E7200 00000000 */   nop
/* 0E7304 001E7204 FFFF0324 */  addiu       $3, $0, -0x1
/* 0E7308 001E7208 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x16BC)
/* 0E730C 001E720C CC5123AC */  sw          $3, %lo(CommonMenuMes3 + 0x16BC)($1)
/* 0E7310 001E7210 D901013C */  lui         $1, %hi(ShopMenu + 0x19E)
/* 0E7314 001E7214 6E0223A4 */  sh          $3, %lo(ShopMenu + 0x19E)($1)
.L001E7218:
/* 0E7318 001E7218 0800E003 */  jr          $31
/* 0E731C 001E721C 00000000 */   nop
