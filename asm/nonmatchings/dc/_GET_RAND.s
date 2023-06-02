.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_RAND__FP12RS_STACKDATAi
/* E3240 001E3140 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* E3244 001E3144 2000BF7F */  sq         $31, 0x20($sp)
/* E3248 001E3148 1000B17F */  sq         $17, 0x10($sp)
/* E324C 001E314C 0000B07F */  sq         $16, 0x0($sp)
/* E3250 001E3150 08009124 */  addiu      $17, $4, 0x8
/* E3254 001E3154 9085070C */  jal        GetStackInt__FP12RS_STACKDATA_3
/* E3258 001E3158 00000000 */   nop
/* E325C 001E315C 28864070 */  paddub     $16, $2, $0
/* E3260 001E3160 BE11040C */  jal        rand
/* E3264 001E3164 00000000 */   nop
/* E3268 001E3168 00008244 */  mtc1       $2, $f0
/* E326C 001E316C 00000000 */  nop
/* E3270 001E3170 60008046 */  cvt.s.w    $f1, $f0
/* E3274 001E3174 00009044 */  mtc1       $16, $f0
/* E3278 001E3178 00000000 */  nop
/* E327C 001E317C 20008046 */  cvt.s.w    $f0, $f0
/* E3280 001E3180 42000146 */  mul.s      $f1, $f0, $f1
/* E3284 001E3184 004F023C */  lui        $2, (0x4F000000 >> 16)
/* E3288 001E3188 00008244 */  mtc1       $2, $f0
/* E328C 001E318C 00000000 */  nop
/* E3290 001E3190 030B0046 */  div.s      $f12, $f1, $f0
/* E3294 001E3194 2C44040C */  jal        fptosi
/* E3298 001E3198 00000000 */   nop
/* E329C 001E319C 282E4070 */  paddub     $5, $2, $0
/* E32A0 001E31A0 28262072 */  paddub     $4, $17, $0
/* E32A4 001E31A4 B485070C */  jal        SetStack__FP12RS_STACKDATAi_3
/* E32A8 001E31A8 00000000 */   nop
/* E32AC 001E31AC 01000224 */  addiu      $2, $0, 0x1
/* E32B0 001E31B0 2000BF7B */  lq         $31, 0x20($sp)
/* E32B4 001E31B4 1000B17B */  lq         $17, 0x10($sp)
/* E32B8 001E31B8 0000B07B */  lq         $16, 0x0($sp)
/* E32BC 001E31BC 3000BD27 */  addiu      $sp, $sp, 0x30
/* E32C0 001E31C0 0800E003 */  jr         $31
/* E32C4 001E31C4 00000000 */   nop
/* E32C8 001E31C8 00000000 */  nop
/* E32CC 001E31CC 00000000 */  nop
