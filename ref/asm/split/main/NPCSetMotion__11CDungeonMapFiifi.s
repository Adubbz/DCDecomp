.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel NPCSetMotion__11CDungeonMapFiifi
/* 0C23F0 001C22F0 30130324 */  addiu       $3, $0, 0x1330
/* 0C23F4 001C22F4 1818A300 */  mult        $3, $5, $3
/* 0C23F8 001C22F8 21206400 */  addu        $4, $3, $4
/* 0C23FC 001C22FC 0100013C */  lui         $1, (0x10000 >> 16)
/* 0C2400 001C2300 21088100 */  addu        $1, $4, $1
/* 0C2404 001C2304 58CA26AC */  sw          $6, -0x35A8($1)
/* 0C2408 001C2308 0100013C */  lui         $1, (0x10000 >> 16)
/* 0C240C 001C230C 21088100 */  addu        $1, $4, $1
/* 0C2410 001C2310 54CA27AC */  sw          $7, -0x35AC($1)
/* 0C2414 001C2314 80BF033C */  lui         $3, (0xBF800000 >> 16)
/* 0C2418 001C2318 584A8424 */  addiu       $4, $4, 0x4A58
/* 0C241C 001C231C F87F8424 */  addiu       $4, $4, 0x7FF8
/* 0C2420 001C2320 000083AC */  sw          $3, 0x0($4)
/* 0C2424 001C2324 00008CE4 */  swc1        $f12, 0x0($4)
/* 0C2428 001C2328 0800E003 */  jr          $31
/* 0C242C 001C232C 00000000 */   nop
