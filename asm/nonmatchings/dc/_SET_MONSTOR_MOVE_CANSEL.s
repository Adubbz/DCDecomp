.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_MONSTOR_MOVE_CANSEL__FP12RS_STACKDATAi
/* E4DC0 001E4CC0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* E4DC4 001E4CC4 0000BF7F */  sq         $31, 0x0($sp)
/* E4DC8 001E4CC8 9085070C */  jal        GetStackInt__FP12RS_STACKDATA_3
/* E4DCC 001E4CCC 00000000 */   nop
/* E4DD0 001E4CD0 E09C848F */  lw         $4, -0x6320($gp)
/* E4DD4 001E4CD4 80180200 */  sll        $3, $2, 2
/* E4DD8 001E4CD8 21186200 */  addu       $3, $3, $2
/* E4DDC 001E4CDC 80100300 */  sll        $2, $3, 2
/* E4DE0 001E4CE0 21106200 */  addu       $2, $3, $2
/* E4DE4 001E4CE4 00110200 */  sll        $2, $2, 4
/* E4DE8 001E4CE8 21104400 */  addu       $2, $2, $4
/* E4DEC 001E4CEC 0200013C */  lui        $at, (0x20000 >> 16)
/* E4DF0 001E4CF0 21084100 */  addu       $at, $2, $at
/* E4DF4 001E4CF4 50E420AC */  sw         $0, -0x1BB0($at)
/* E4DF8 001E4CF8 01000224 */  addiu      $2, $0, 0x1
/* E4DFC 001E4CFC 0000BF7B */  lq         $31, 0x0($sp)
/* E4E00 001E4D00 1000BD27 */  addiu      $sp, $sp, 0x10
/* E4E04 001E4D04 0800E003 */  jr         $31
/* E4E08 001E4D08 00000000 */   nop
/* E4E0C 001E4D0C 00000000 */  nop
