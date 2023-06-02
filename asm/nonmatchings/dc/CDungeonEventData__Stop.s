.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Stop__17CDungeonEventDataFv
/* CC9D0 001CC8D0 340080AC */  sw         $0, 0x34($4)
/* CC9D4 001CC8D4 0800E003 */  jr         $31
/* CC9D8 001CC8D8 00000000 */   nop
/* CC9DC 001CC8DC 00000000 */  nop
