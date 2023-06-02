.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_COLLISION_WIDTH__FP12RS_STACKDATAi
/* E5EC0 001E5DC0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* E5EC4 001E5DC4 0000BF7F */  sq         $31, 0x0($sp)
/* E5EC8 001E5DC8 E09C828F */  lw         $2, -0x6320($gp)
/* E5ECC 001E5DCC 9000438C */  lw         $3, 0x90($2)
/* E5ED0 001E5DD0 A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E5ED4 001E5DD4 00000000 */   nop
/* E5ED8 001E5DD8 E09C848F */  lw         $4, -0x6320($gp)
/* E5EDC 001E5DDC 80100300 */  sll        $2, $3, 2
/* E5EE0 001E5DE0 21184300 */  addu       $3, $2, $3
/* E5EE4 001E5DE4 80100300 */  sll        $2, $3, 2
/* E5EE8 001E5DE8 21106200 */  addu       $2, $3, $2
/* E5EEC 001E5DEC 00110200 */  sll        $2, $2, 4
/* E5EF0 001E5DF0 21104400 */  addu       $2, $2, $4
/* E5EF4 001E5DF4 0200013C */  lui        $at, (0x20000 >> 16)
/* E5EF8 001E5DF8 21084100 */  addu       $at, $2, $at
/* E5EFC 001E5DFC 18E420E4 */  swc1       $f0, -0x1BE8($at)
/* E5F00 001E5E00 01000224 */  addiu      $2, $0, 0x1
/* E5F04 001E5E04 0000BF7B */  lq         $31, 0x0($sp)
/* E5F08 001E5E08 1000BD27 */  addiu      $sp, $sp, 0x10
/* E5F0C 001E5E0C 0800E003 */  jr         $31
/* E5F10 001E5E10 00000000 */   nop
/* E5F14 001E5E14 00000000 */  nop
/* E5F18 001E5E18 00000000 */  nop
/* E5F1C 001E5E1C 00000000 */  nop
