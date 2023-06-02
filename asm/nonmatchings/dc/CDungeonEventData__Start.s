.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Start__17CDungeonEventDataFv
/* CC9E0 001CC8E0 01000324 */  addiu      $3, $0, 0x1
/* CC9E4 001CC8E4 340083AC */  sw         $3, 0x34($4)
/* CC9E8 001CC8E8 0800E003 */  jr         $31
/* CC9EC 001CC8EC 00000000 */   nop
