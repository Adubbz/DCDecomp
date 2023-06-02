.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _STATUS_GET_LIFE_RATE__FP12RS_STACKDATAi
/* E3050 001E2F50 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* E3054 001E2F54 0000BF7F */  sq         $31, 0x0($sp)
/* E3058 001E2F58 E09C858F */  lw         $5, -0x6320($gp)
/* E305C 001E2F5C 9000A38C */  lw         $3, 0x90($5)
/* E3060 001E2F60 80100300 */  sll        $2, $3, 2
/* E3064 001E2F64 21184300 */  addu       $3, $2, $3
/* E3068 001E2F68 80100300 */  sll        $2, $3, 2
/* E306C 001E2F6C 21106200 */  addu       $2, $3, $2
/* E3070 001E2F70 00110200 */  sll        $2, $2, 4
/* E3074 001E2F74 21104500 */  addu       $2, $2, $5
/* E3078 001E2F78 0200013C */  lui        $at, (0x20000 >> 16)
/* E307C 001E2F7C 21084100 */  addu       $at, $2, $at
/* E3080 001E2F80 F0E3238C */  lw         $3, -0x1C10($at)
/* E3084 001E2F84 0200013C */  lui        $at, (0x20000 >> 16)
/* E3088 001E2F88 21084100 */  addu       $at, $2, $at
/* E308C 001E2F8C F4E3228C */  lw         $2, -0x1C0C($at)
/* E3090 001E2F90 00008244 */  mtc1       $2, $f0
/* E3094 001E2F94 00000000 */  nop
/* E3098 001E2F98 60008046 */  cvt.s.w    $f1, $f0
/* E309C 001E2F9C 00008344 */  mtc1       $3, $f0
/* E30A0 001E2FA0 00000000 */  nop
/* E30A4 001E2FA4 20008046 */  cvt.s.w    $f0, $f0
/* E30A8 001E2FA8 43080046 */  div.s      $f1, $f1, $f0
/* E30AC 001E2FAC C842023C */  lui        $2, (0x42C80000 >> 16)
/* E30B0 001E2FB0 00008244 */  mtc1       $2, $f0
/* E30B4 001E2FB4 00000000 */  nop
/* E30B8 001E2FB8 02030146 */  mul.s      $f12, $f0, $f1
/* E30BC 001E2FBC BC85070C */  jal        SetStack__FP12RS_STACKDATAf_3
/* E30C0 001E2FC0 00000000 */   nop
/* E30C4 001E2FC4 01000224 */  addiu      $2, $0, 0x1
/* E30C8 001E2FC8 0000BF7B */  lq         $31, 0x0($sp)
/* E30CC 001E2FCC 1000BD27 */  addiu      $sp, $sp, 0x10
/* E30D0 001E2FD0 0800E003 */  jr         $31
/* E30D4 001E2FD4 00000000 */   nop
/* E30D8 001E2FD8 00000000 */  nop
/* E30DC 001E2FDC 00000000 */  nop
