.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel NPCSetMotion__11CDungeonMapFii
/* 0C23B0 001C22B0 30130324 */  addiu       $3, $0, 0x1330
/* 0C23B4 001C22B4 1818A300 */  mult        $3, $5, $3
/* 0C23B8 001C22B8 21206400 */  addu        $4, $3, $4
/* 0C23BC 001C22BC 0100013C */  lui         $1, (0x10000 >> 16)
/* 0C23C0 001C22C0 21088100 */  addu        $1, $4, $1
/* 0C23C4 001C22C4 58CA26AC */  sw          $6, -0x35A8($1)
/* 0C23C8 001C22C8 0100013C */  lui         $1, (0x10000 >> 16)
/* 0C23CC 001C22CC 21088100 */  addu        $1, $4, $1
/* 0C23D0 001C22D0 54CA20AC */  sw          $0, -0x35AC($1)
/* 0C23D4 001C22D4 80BF033C */  lui         $3, (0xBF800000 >> 16)
/* 0C23D8 001C22D8 0100013C */  lui         $1, (0x10000 >> 16)
/* 0C23DC 001C22DC 21088100 */  addu        $1, $4, $1
/* 0C23E0 001C22E0 50CA23AC */  sw          $3, -0x35B0($1)
/* 0C23E4 001C22E4 0800E003 */  jr          $31
/* 0C23E8 001C22E8 00000000 */   nop
/* 0C23EC 001C22EC 00000000 */  nop
