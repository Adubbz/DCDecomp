.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ClearNPC_Cash__11CDungeonMapFv
/* C1F70 001C1E70 282E0070 */  paddub     $5, $0, $0
/* C1F74 001C1E74 08000010 */  b          .L001C1E98
/* C1F78 001C1E78 00000000 */   nop
.L001C1E7C:
/* C1F7C 001C1E7C 30130324 */  addiu      $3, $0, 0x1330
/* C1F80 001C1E80 1818A300 */  mult       $3, $5, $3
/* C1F84 001C1E84 21186400 */  addu       $3, $3, $4
/* C1F88 001C1E88 0100013C */  lui        $at, (0x10000 >> 16)
/* C1F8C 001C1E8C 21086100 */  addu       $at, $3, $at
/* C1F90 001C1E90 10D120AC */  sw         $0, -0x2EF0($at)
/* C1F94 001C1E94 0100A524 */  addiu      $5, $5, 0x1
.L001C1E98:
/* C1F98 001C1E98 0400A328 */  slti       $3, $5, 0x4
/* C1F9C 001C1E9C F7FF6014 */  bnez       $3, .L001C1E7C
/* C1FA0 001C1EA0 00000000 */   nop
/* C1FA4 001C1EA4 0800E003 */  jr         $31
/* C1FA8 001C1EA8 00000000 */   nop
/* C1FAC 001C1EAC 00000000 */  nop
