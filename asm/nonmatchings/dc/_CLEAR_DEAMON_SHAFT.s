.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _CLEAR_DEAMON_SHAFT__FP12RS_STACKDATAi
/* BD1E0 001BD0E0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* BD1E4 001BD0E4 0000BF7F */  sq         $31, 0x0($sp)
/* BD1E8 001BD0E8 789C848F */  lw         $4, -0x6388($gp)
/* BD1EC 001BD0EC 14F8060C */  jal        ClearDeamonShaft__14CDngStatusDataFv
/* BD1F0 001BD0F0 00000000 */   nop
/* BD1F4 001BD0F4 01000224 */  addiu      $2, $0, 0x1
/* BD1F8 001BD0F8 0000BF7B */  lq         $31, 0x0($sp)
/* BD1FC 001BD0FC 1000BD27 */  addiu      $sp, $sp, 0x10
/* BD200 001BD100 0800E003 */  jr         $31
/* BD204 001BD104 00000000 */   nop
/* BD208 001BD108 00000000 */  nop
/* BD20C 001BD10C 00000000 */  nop
