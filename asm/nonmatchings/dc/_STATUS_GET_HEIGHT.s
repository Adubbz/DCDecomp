.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _STATUS_GET_HEIGHT__FP12RS_STACKDATAi
/* E31F0 001E30F0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* E31F4 001E30F4 0000BF7F */  sq         $31, 0x0($sp)
/* E31F8 001E30F8 E09C858F */  lw         $5, -0x6320($gp)
/* E31FC 001E30FC 9000A38C */  lw         $3, 0x90($5)
/* E3200 001E3100 80100300 */  sll        $2, $3, 2
/* E3204 001E3104 21184300 */  addu       $3, $2, $3
/* E3208 001E3108 80100300 */  sll        $2, $3, 2
/* E320C 001E310C 21106200 */  addu       $2, $3, $2
/* E3210 001E3110 00110200 */  sll        $2, $2, 4
/* E3214 001E3114 21104500 */  addu       $2, $2, $5
/* E3218 001E3118 0200013C */  lui        $at, (0x20000 >> 16)
/* E321C 001E311C 21084100 */  addu       $at, $2, $at
/* E3220 001E3120 88E42CC4 */  lwc1       $f12, -0x1B78($at)
/* E3224 001E3124 BC85070C */  jal        SetStack__FP12RS_STACKDATAf_3
/* E3228 001E3128 00000000 */   nop
/* E322C 001E312C 01000224 */  addiu      $2, $0, 0x1
/* E3230 001E3130 0000BF7B */  lq         $31, 0x0($sp)
/* E3234 001E3134 1000BD27 */  addiu      $sp, $sp, 0x10
/* E3238 001E3138 0800E003 */  jr         $31
/* E323C 001E313C 00000000 */   nop
