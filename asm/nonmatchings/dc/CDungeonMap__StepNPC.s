.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StepNPC__11CDungeonMapFv
/* C22F0 001C21F0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* C22F4 001C21F4 2000BF7F */  sq         $31, 0x20($sp)
/* C22F8 001C21F8 1000B17F */  sq         $17, 0x10($sp)
/* C22FC 001C21FC 0000B07F */  sq         $16, 0x0($sp)
/* C2300 001C2200 288E8070 */  paddub     $17, $4, $0
/* C2304 001C2204 28860070 */  paddub     $16, $0, $0
/* C2308 001C2208 20000010 */  b          .L001C228C
/* C230C 001C220C 00000000 */   nop
.L001C2210:
/* C2310 001C2210 30130324 */  addiu      $3, $0, 0x1330
/* C2314 001C2214 18180302 */  mult       $3, $16, $3
/* C2318 001C2218 21287100 */  addu       $5, $3, $17
/* C231C 001C221C 0100013C */  lui        $at, (0x10000 >> 16)
/* C2320 001C2220 2108A100 */  addu       $at, $5, $at
/* C2324 001C2224 C4CF238C */  lw         $3, -0x303C($at)
/* C2328 001C2228 17006010 */  beqz       $3, .L001C2288
/* C232C 001C222C 00000000 */   nop
/* C2330 001C2230 0100013C */  lui        $at, (0x10000 >> 16)
/* C2334 001C2234 2108A100 */  addu       $at, $5, $at
/* C2338 001C2238 C8CF238C */  lw         $3, -0x3038($at)
/* C233C 001C223C 12006010 */  beqz       $3, .L001C2288
/* C2340 001C2240 00000000 */   nop
/* C2344 001C2244 0100013C */  lui        $at, (0x10000 >> 16)
/* C2348 001C2248 2108A100 */  addu       $at, $5, $at
/* C234C 001C224C ACBE238C */  lw         $3, -0x4154($at)
/* C2350 001C2250 0D006010 */  beqz       $3, .L001C2288
/* C2354 001C2254 00000000 */   nop
/* C2358 001C2258 0100013C */  lui        $at, (0x10000 >> 16)
/* C235C 001C225C 2108A100 */  addu       $at, $5, $at
/* C2360 001C2260 CCCF248C */  lw         $4, -0x3034($at)
/* C2364 001C2264 FFFF0324 */  addiu      $3, $0, -0x1
/* C2368 001C2268 07008310 */  beq        $4, $3, .L001C2288
/* C236C 001C226C 00000000 */   nop
/* C2370 001C2270 F83DA424 */  addiu      $4, $5, 0x3DF8
/* C2374 001C2274 F87F8424 */  addiu      $4, $4, 0x7FF8
/* C2378 001C2278 A000998C */  lw         $25, 0xA0($4)
/* C237C 001C227C 0800398F */  lw         $25, 0x8($25)
/* C2380 001C2280 09F82003 */  jalr       $25
/* C2384 001C2284 00000000 */   nop
.L001C2288:
/* C2388 001C2288 01001026 */  addiu      $16, $16, 0x1
.L001C228C:
/* C238C 001C228C 0400032A */  slti       $3, $16, 0x4
/* C2390 001C2290 DFFF6014 */  bnez       $3, .L001C2210
/* C2394 001C2294 00000000 */   nop
/* C2398 001C2298 2000BF7B */  lq         $31, 0x20($sp)
/* C239C 001C229C 1000B17B */  lq         $17, 0x10($sp)
/* C23A0 001C22A0 0000B07B */  lq         $16, 0x0($sp)
/* C23A4 001C22A4 3000BD27 */  addiu      $sp, $sp, 0x30
/* C23A8 001C22A8 0800E003 */  jr         $31
/* C23AC 001C22AC 00000000 */   nop