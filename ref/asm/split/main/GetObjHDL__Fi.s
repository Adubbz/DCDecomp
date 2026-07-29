.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetObjHDL__Fi
/* 0BB300 001BB200 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0BB304 001BB204 0000BF7F */  sq          $31, 0x0($29)
/* 0BB308 001BB208 04008004 */  bltz        $4, .L001BB21C
/* 0BB30C 001BB20C 00000000 */   nop
/* 0BB310 001BB210 20008228 */  slti        $2, $4, 0x20
/* 0BB314 001BB214 08004014 */  bnez        $2, .L001BB238
/* 0BB318 001BB218 00000000 */   nop
.L001BB21C:
/* 0BB31C 001BB21C 2A00023C */  lui         $2, %hi(LIT_579)
/* 0BB320 001BB220 90BC4424 */  addiu       $4, $2, %lo(LIT_579)
/* 0BB324 001BB224 A611040C */  jal         printf
/* 0BB328 001BB228 00000000 */   nop
/* 0BB32C 001BB22C 28160070 */  paddub      $2, $0, $0
/* 0BB330 001BB230 07000010 */  b           .L001BB250
/* 0BB334 001BB234 00000000 */   nop
.L001BB238:
/* 0BB338 001BB238 40100400 */  sll         $2, $4, 1
/* 0BB33C 001BB23C 21104400 */  addu        $2, $2, $4
/* 0BB340 001BB240 80180200 */  sll         $3, $2, 2
/* 0BB344 001BB244 D501023C */  lui         $2, %hi(BtObjHdl)
/* 0BB348 001BB248 00684224 */  addiu       $2, $2, %lo(BtObjHdl)
/* 0BB34C 001BB24C 21104300 */  addu        $2, $2, $3
.L001BB250:
/* 0BB350 001BB250 0000BF7B */  lq          $31, 0x0($29)
/* 0BB354 001BB254 1000BD27 */  addiu       $29, $29, 0x10
/* 0BB358 001BB258 0800E003 */  jr          $31
/* 0BB35C 001BB25C 00000000 */   nop
