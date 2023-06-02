.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_RANDF__FP12RS_STACKDATAi
/* E32D0 001E31D0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* E32D4 001E31D4 2000BF7F */  sq         $31, 0x20($sp)
/* E32D8 001E31D8 1000B07F */  sq         $16, 0x10($sp)
/* E32DC 001E31DC 0000B4E7 */  swc1       $f20, 0x0($sp)
/* E32E0 001E31E0 08009024 */  addiu      $16, $4, 0x8
/* E32E4 001E31E4 A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E32E8 001E31E8 00000000 */   nop
/* E32EC 001E31EC 06050046 */  mov.s      $f20, $f0
/* E32F0 001E31F0 BE11040C */  jal        rand
/* E32F4 001E31F4 00000000 */   nop
/* E32F8 001E31F8 00008244 */  mtc1       $2, $f0
/* E32FC 001E31FC 00000000 */  nop
/* E3300 001E3200 20008046 */  cvt.s.w    $f0, $f0
/* E3304 001E3204 42A00046 */  mul.s      $f1, $f20, $f0
/* E3308 001E3208 004F023C */  lui        $2, (0x4F000000 >> 16)
/* E330C 001E320C 00008244 */  mtc1       $2, $f0
/* E3310 001E3210 00000000 */  nop
/* E3314 001E3214 030B0046 */  div.s      $f12, $f1, $f0
/* E3318 001E3218 2C44040C */  jal        fptosi
/* E331C 001E321C 00000000 */   nop
/* E3320 001E3220 00008244 */  mtc1       $2, $f0
/* E3324 001E3224 00000000 */  nop
/* E3328 001E3228 20038046 */  cvt.s.w    $f12, $f0
/* E332C 001E322C 28260072 */  paddub     $4, $16, $0
/* E3330 001E3230 BC85070C */  jal        SetStack__FP12RS_STACKDATAf_3
/* E3334 001E3234 00000000 */   nop
/* E3338 001E3238 01000224 */  addiu      $2, $0, 0x1
/* E333C 001E323C 2000BF7B */  lq         $31, 0x20($sp)
/* E3340 001E3240 1000B07B */  lq         $16, 0x10($sp)
/* E3344 001E3244 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* E3348 001E3248 3000BD27 */  addiu      $sp, $sp, 0x30
/* E334C 001E324C 0800E003 */  jr         $31
/* E3350 001E3250 00000000 */   nop
/* E3354 001E3254 00000000 */  nop
/* E3358 001E3258 00000000 */  nop
/* E335C 001E325C 00000000 */  nop
