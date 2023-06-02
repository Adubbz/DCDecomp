.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_LOCKON_SW__FP12RS_STACKDATAi
/* E4E70 001E4D70 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* E4E74 001E4D74 1000BF7F */  sq         $31, 0x10($sp)
/* E4E78 001E4D78 0000B07F */  sq         $16, 0x0($sp)
/* E4E7C 001E4D7C E09C828F */  lw         $2, -0x6320($gp)
/* E4E80 001E4D80 9000508C */  lw         $16, 0x90($2)
/* E4E84 001E4D84 9085070C */  jal        GetStackInt__FP12RS_STACKDATA_3
/* E4E88 001E4D88 00000000 */   nop
/* E4E8C 001E4D8C E09C858F */  lw         $5, -0x6320($gp)
/* E4E90 001E4D90 80181000 */  sll        $3, $16, 2
/* E4E94 001E4D94 21207000 */  addu       $4, $3, $16
/* E4E98 001E4D98 80180400 */  sll        $3, $4, 2
/* E4E9C 001E4D9C 21188300 */  addu       $3, $4, $3
/* E4EA0 001E4DA0 00190300 */  sll        $3, $3, 4
/* E4EA4 001E4DA4 21186500 */  addu       $3, $3, $5
/* E4EA8 001E4DA8 0200013C */  lui        $at, (0x20000 >> 16)
/* E4EAC 001E4DAC 21086100 */  addu       $at, $3, $at
/* E4EB0 001E4DB0 ECE422A4 */  sh         $2, -0x1B14($at)
/* E4EB4 001E4DB4 01000224 */  addiu      $2, $0, 0x1
/* E4EB8 001E4DB8 1000BF7B */  lq         $31, 0x10($sp)
/* E4EBC 001E4DBC 0000B07B */  lq         $16, 0x0($sp)
/* E4EC0 001E4DC0 2000BD27 */  addiu      $sp, $sp, 0x20
/* E4EC4 001E4DC4 0800E003 */  jr         $31
/* E4EC8 001E4DC8 00000000 */   nop
/* E4ECC 001E4DCC 00000000 */  nop
