.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel NPCSetMotion__11CDungeonMapFii
/* C23B0 001C22B0 30130324 */  addiu      $3, $0, 0x1330
/* C23B4 001C22B4 1818A300 */  mult       $3, $5, $3
/* C23B8 001C22B8 21206400 */  addu       $4, $3, $4
/* C23BC 001C22BC 0100013C */  lui        $at, (0x10000 >> 16)
/* C23C0 001C22C0 21088100 */  addu       $at, $4, $at
/* C23C4 001C22C4 58CA26AC */  sw         $6, -0x35A8($at)
/* C23C8 001C22C8 0100013C */  lui        $at, (0x10000 >> 16)
/* C23CC 001C22CC 21088100 */  addu       $at, $4, $at
/* C23D0 001C22D0 54CA20AC */  sw         $0, -0x35AC($at)
/* C23D4 001C22D4 80BF033C */  lui        $3, (0xBF800000 >> 16)
/* C23D8 001C22D8 0100013C */  lui        $at, (0x10000 >> 16)
/* C23DC 001C22DC 21088100 */  addu       $at, $4, $at
/* C23E0 001C22E0 50CA23AC */  sw         $3, -0x35B0($at)
/* C23E4 001C22E4 0800E003 */  jr         $31
/* C23E8 001C22E8 00000000 */   nop
/* C23EC 001C22EC 00000000 */  nop
