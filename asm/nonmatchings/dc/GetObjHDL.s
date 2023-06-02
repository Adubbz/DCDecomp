.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetObjHDL__Fi
/* BB300 001BB200 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* BB304 001BB204 0000BF7F */  sq         $31, 0x0($sp)
/* BB308 001BB208 04008004 */  bltz       $4, .L001BB21C
/* BB30C 001BB20C 00000000 */   nop
/* BB310 001BB210 20008228 */  slti       $2, $4, 0x20
/* BB314 001BB214 08004014 */  bnez       $2, .L001BB238
/* BB318 001BB218 00000000 */   nop
.L001BB21C:
/* BB31C 001BB21C 2A00023C */  lui        $2, %hi(_579)
/* BB320 001BB220 90BC4424 */  addiu      $4, $2, %lo(_579)
/* BB324 001BB224 A611040C */  jal        printf
/* BB328 001BB228 00000000 */   nop
/* BB32C 001BB22C 28160070 */  paddub     $2, $0, $0
/* BB330 001BB230 07000010 */  b          .L001BB250
/* BB334 001BB234 00000000 */   nop
.L001BB238:
/* BB338 001BB238 40100400 */  sll        $2, $4, 1
/* BB33C 001BB23C 21104400 */  addu       $2, $2, $4
/* BB340 001BB240 80180200 */  sll        $3, $2, 2
/* BB344 001BB244 D501023C */  lui        $2, %hi(BtObjHdl)
/* BB348 001BB248 00684224 */  addiu      $2, $2, %lo(BtObjHdl)
/* BB34C 001BB24C 21104300 */  addu       $2, $2, $3
.L001BB250:
/* BB350 001BB250 0000BF7B */  lq         $31, 0x0($sp)
/* BB354 001BB254 1000BD27 */  addiu      $sp, $sp, 0x10
/* BB358 001BB258 0800E003 */  jr         $31
/* BB35C 001BB25C 00000000 */   nop
