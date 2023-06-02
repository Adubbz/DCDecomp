.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_COL_HIT_ID__FP12RS_STACKDATAi
/* E49A0 001E48A0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* E49A4 001E48A4 0000BF7F */  sq         $31, 0x0($sp)
/* E49A8 001E48A8 E09C858F */  lw         $5, -0x6320($gp)
/* E49AC 001E48AC 9000A38C */  lw         $3, 0x90($5)
/* E49B0 001E48B0 C0100300 */  sll        $2, $3, 3
/* E49B4 001E48B4 21184300 */  addu       $3, $2, $3
/* E49B8 001E48B8 C0100300 */  sll        $2, $3, 3
/* E49BC 001E48BC 21106200 */  addu       $2, $3, $2
/* E49C0 001E48C0 00110200 */  sll        $2, $2, 4
/* E49C4 001E48C4 21104500 */  addu       $2, $2, $5
/* E49C8 001E48C8 0500013C */  lui        $at, (0x55750 >> 16)
/* E49CC 001E48CC 21084100 */  addu       $at, $2, $at
/* E49D0 001E48D0 5057258C */  lw         $5, (0x55750 & 0xFFFF)($at)
/* E49D4 001E48D4 B485070C */  jal        SetStack__FP12RS_STACKDATAi_3
/* E49D8 001E48D8 00000000 */   nop
/* E49DC 001E48DC 01000224 */  addiu      $2, $0, 0x1
/* E49E0 001E48E0 0000BF7B */  lq         $31, 0x0($sp)
/* E49E4 001E48E4 1000BD27 */  addiu      $sp, $sp, 0x10
/* E49E8 001E48E8 0800E003 */  jr         $31
/* E49EC 001E48EC 00000000 */   nop
