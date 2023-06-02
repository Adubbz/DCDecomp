.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_ACTIVE_ITEM_ICON__FP12RS_STACKDATAi
/* BD6D0 001BD5D0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* BD6D4 001BD5D4 0000BF7F */  sq         $31, 0x0($sp)
/* BD6D8 001BD5D8 E844070C */  jal        LoadActiveItemIcon__Fv
/* BD6DC 001BD5DC 00000000 */   nop
/* BD6E0 001BD5E0 01000224 */  addiu      $2, $0, 0x1
/* BD6E4 001BD5E4 0000BF7B */  lq         $31, 0x0($sp)
/* BD6E8 001BD5E8 1000BD27 */  addiu      $sp, $sp, 0x10
/* BD6EC 001BD5EC 0800E003 */  jr         $31
/* BD6F0 001BD5F0 00000000 */   nop
/* BD6F4 001BD5F4 00000000 */  nop
/* BD6F8 001BD5F8 00000000 */  nop
/* BD6FC 001BD5FC 00000000 */  nop
