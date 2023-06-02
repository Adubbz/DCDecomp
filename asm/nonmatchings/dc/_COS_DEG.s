.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _COS_DEG__FP12RS_STACKDATAi
/* E33C0 001E32C0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* E33C4 001E32C4 1000BF7F */  sq         $31, 0x10($sp)
/* E33C8 001E32C8 0000B07F */  sq         $16, 0x0($sp)
/* E33CC 001E32CC 08009024 */  addiu      $16, $4, 0x8
/* E33D0 001E32D0 A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E33D4 001E32D4 00000000 */   nop
/* E33D8 001E32D8 788181C7 */  lwc1       $f1, -0x7E88($gp)
/* E33DC 001E32DC 02080046 */  mul.s      $f0, $f1, $f0
/* E33E0 001E32E0 06030046 */  mov.s      $f12, $f0
/* E33E4 001E32E4 AC75040C */  jal        cosf
/* E33E8 001E32E8 00000000 */   nop
/* E33EC 001E32EC 28260072 */  paddub     $4, $16, $0
/* E33F0 001E32F0 06030046 */  mov.s      $f12, $f0
/* E33F4 001E32F4 BC85070C */  jal        SetStack__FP12RS_STACKDATAf_3
/* E33F8 001E32F8 00000000 */   nop
/* E33FC 001E32FC 01000224 */  addiu      $2, $0, 0x1
/* E3400 001E3300 1000BF7B */  lq         $31, 0x10($sp)
/* E3404 001E3304 0000B07B */  lq         $16, 0x0($sp)
/* E3408 001E3308 2000BD27 */  addiu      $sp, $sp, 0x20
/* E340C 001E330C 0800E003 */  jr         $31
/* E3410 001E3310 00000000 */   nop
/* E3414 001E3314 00000000 */  nop
/* E3418 001E3318 00000000 */  nop
/* E341C 001E331C 00000000 */  nop
