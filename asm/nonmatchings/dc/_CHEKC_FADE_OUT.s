.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _CHEKC_FADE_OUT__FP12RS_STACKDATAi
/* E6110 001E6010 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* E6114 001E6014 1000BF7F */  sq         $31, 0x10($sp)
/* E6118 001E6018 0000B07F */  sq         $16, 0x0($sp)
/* E611C 001E601C 28868070 */  paddub     $16, $4, $0
/* E6120 001E6020 0426060C */  jal        EdFadeOutCheck__Fv
/* E6124 001E6024 00000000 */   nop
/* E6128 001E6028 282E4070 */  paddub     $5, $2, $0
/* E612C 001E602C 28260072 */  paddub     $4, $16, $0
/* E6130 001E6030 B485070C */  jal        SetStack__FP12RS_STACKDATAi_3
/* E6134 001E6034 00000000 */   nop
/* E6138 001E6038 01000224 */  addiu      $2, $0, 0x1
/* E613C 001E603C 1000BF7B */  lq         $31, 0x10($sp)
/* E6140 001E6040 0000B07B */  lq         $16, 0x0($sp)
/* E6144 001E6044 2000BD27 */  addiu      $sp, $sp, 0x20
/* E6148 001E6048 0800E003 */  jr         $31
/* E614C 001E604C 00000000 */   nop
