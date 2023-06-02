.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_MOTION_FRM__FP12RS_STACKDATAi
/* E1D60 001E1C60 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* E1D64 001E1C64 0000BF7F */  sq         $31, 0x0($sp)
/* E1D68 001E1C68 E09C858F */  lw         $5, -0x6320($gp)
/* E1D6C 001E1C6C 9000A38C */  lw         $3, 0x90($5)
/* E1D70 001E1C70 10350224 */  addiu      $2, $0, 0x3510
/* E1D74 001E1C74 18106200 */  mult       $2, $3, $2
/* E1D78 001E1C78 21104500 */  addu       $2, $2, $5
/* E1D7C 001E1C7C 0200013C */  lui        $at, (0x20000 >> 16)
/* E1D80 001E1C80 21084100 */  addu       $at, $2, $at
/* E1D84 001E1C84 C0FF2CC4 */  lwc1       $f12, -0x40($at)
/* E1D88 001E1C88 BC85070C */  jal        SetStack__FP12RS_STACKDATAf_3
/* E1D8C 001E1C8C 00000000 */   nop
/* E1D90 001E1C90 01000224 */  addiu      $2, $0, 0x1
/* E1D94 001E1C94 0000BF7B */  lq         $31, 0x0($sp)
/* E1D98 001E1C98 1000BD27 */  addiu      $sp, $sp, 0x10
/* E1D9C 001E1C9C 0800E003 */  jr         $31
/* E1DA0 001E1CA0 00000000 */   nop
/* E1DA4 001E1CA4 00000000 */  nop
/* E1DA8 001E1CA8 00000000 */  nop
/* E1DAC 001E1CAC 00000000 */  nop
