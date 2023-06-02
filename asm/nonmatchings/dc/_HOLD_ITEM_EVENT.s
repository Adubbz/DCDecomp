.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _HOLD_ITEM_EVENT__FP12RS_STACKDATAi
/* BD590 001BD490 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* BD594 001BD494 1000BF7F */  sq         $31, 0x10($sp)
/* BD598 001BD498 0000B07F */  sq         $16, 0x0($sp)
/* BD59C 001BD49C 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BD5A0 001BD4A0 00000000 */   nop
/* BD5A4 001BD4A4 28864070 */  paddub     $16, $2, $0
/* BD5A8 001BD4A8 DF01023C */  lui        $2, %hi(D_1DF36B0)
/* BD5AC 001BD4AC B0364424 */  addiu      $4, $2, %lo(D_1DF36B0)
/* BD5B0 001BD4B0 282E0072 */  paddub     $5, $16, $0
/* BD5B4 001BD4B4 9832070C */  jal        SearchItemEventHold__16CDungeonEventManFi
/* BD5B8 001BD4B8 00000000 */   nop
/* BD5BC 001BD4BC DF01023C */  lui        $2, %hi(D_1DF5EB0)
/* BD5C0 001BD4C0 B05E4424 */  addiu      $4, $2, %lo(D_1DF5EB0)
/* BD5C4 001BD4C4 282E0072 */  paddub     $5, $16, $0
/* BD5C8 001BD4C8 9832070C */  jal        SearchItemEventHold__16CDungeonEventManFi
/* BD5CC 001BD4CC 00000000 */   nop
/* BD5D0 001BD4D0 01000224 */  addiu      $2, $0, 0x1
/* BD5D4 001BD4D4 1000BF7B */  lq         $31, 0x10($sp)
/* BD5D8 001BD4D8 0000B07B */  lq         $16, 0x0($sp)
/* BD5DC 001BD4DC 2000BD27 */  addiu      $sp, $sp, 0x20
/* BD5E0 001BD4E0 0800E003 */  jr         $31
/* BD5E4 001BD4E4 00000000 */   nop
/* BD5E8 001BD4E8 00000000 */  nop
/* BD5EC 001BD4EC 00000000 */  nop
