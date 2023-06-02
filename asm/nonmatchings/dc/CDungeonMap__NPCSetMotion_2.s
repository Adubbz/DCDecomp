.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel NPCSetMotion__11CDungeonMapFiifi
/* C23F0 001C22F0 30130324 */  addiu      $3, $0, 0x1330
/* C23F4 001C22F4 1818A300 */  mult       $3, $5, $3
/* C23F8 001C22F8 21206400 */  addu       $4, $3, $4
/* C23FC 001C22FC 0100013C */  lui        $at, (0x10000 >> 16)
/* C2400 001C2300 21088100 */  addu       $at, $4, $at
/* C2404 001C2304 58CA26AC */  sw         $6, -0x35A8($at)
/* C2408 001C2308 0100013C */  lui        $at, (0x10000 >> 16)
/* C240C 001C230C 21088100 */  addu       $at, $4, $at
/* C2410 001C2310 54CA27AC */  sw         $7, -0x35AC($at)
/* C2414 001C2314 80BF033C */  lui        $3, (0xBF800000 >> 16)
/* C2418 001C2318 584A8424 */  addiu      $4, $4, 0x4A58
/* C241C 001C231C F87F8424 */  addiu      $4, $4, 0x7FF8
/* C2420 001C2320 000083AC */  sw         $3, 0x0($4)
/* C2424 001C2324 00008CE4 */  swc1       $f12, 0x0($4)
/* C2428 001C2328 0800E003 */  jr         $31
/* C242C 001C232C 00000000 */   nop
