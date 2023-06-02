.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_SHADOW_FLAG__FP12RS_STACKDATAi
/* E6790 001E6690 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* E6794 001E6694 1000BF7F */  sq         $31, 0x10($sp)
/* E6798 001E6698 0000B07F */  sq         $16, 0x0($sp)
/* E679C 001E669C E09C828F */  lw         $2, -0x6320($gp)
/* E67A0 001E66A0 9000508C */  lw         $16, 0x90($2)
/* E67A4 001E66A4 9085070C */  jal        GetStackInt__FP12RS_STACKDATA_3
/* E67A8 001E66A8 00000000 */   nop
/* E67AC 001E66AC E09C858F */  lw         $5, -0x6320($gp)
/* E67B0 001E66B0 80181000 */  sll        $3, $16, 2
/* E67B4 001E66B4 21207000 */  addu       $4, $3, $16
/* E67B8 001E66B8 80180400 */  sll        $3, $4, 2
/* E67BC 001E66BC 21188300 */  addu       $3, $4, $3
/* E67C0 001E66C0 00190300 */  sll        $3, $3, 4
/* E67C4 001E66C4 21186500 */  addu       $3, $3, $5
/* E67C8 001E66C8 0200013C */  lui        $at, (0x20000 >> 16)
/* E67CC 001E66CC 21086100 */  addu       $at, $3, $at
/* E67D0 001E66D0 A2E422A4 */  sh         $2, -0x1B5E($at)
/* E67D4 001E66D4 01000224 */  addiu      $2, $0, 0x1
/* E67D8 001E66D8 1000BF7B */  lq         $31, 0x10($sp)
/* E67DC 001E66DC 0000B07B */  lq         $16, 0x0($sp)
/* E67E0 001E66E0 2000BD27 */  addiu      $sp, $sp, 0x20
/* E67E4 001E66E4 0800E003 */  jr         $31
/* E67E8 001E66E8 00000000 */   nop
/* E67EC 001E66EC 00000000 */  nop
