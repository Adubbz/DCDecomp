.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_POSITION__FP12RS_STACKDATAi
/* E2BE0 001E2AE0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* E2BE4 001E2AE4 0000BF7F */  sq         $31, 0x0($sp)
/* E2BE8 001E2AE8 E09C828F */  lw         $2, -0x6320($gp)
/* E2BEC 001E2AEC 9000438C */  lw         $3, 0x90($2)
/* E2BF0 001E2AF0 08008524 */  addiu      $5, $4, 0x8
/* E2BF4 001E2AF4 A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E2BF8 001E2AF8 00000000 */   nop
/* E2BFC 001E2AFC 06030046 */  mov.s      $f12, $f0
/* E2C00 001E2B00 2826A070 */  paddub     $4, $5, $0
/* E2C04 001E2B04 08008524 */  addiu      $5, $4, 0x8
/* E2C08 001E2B08 A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E2C0C 001E2B0C 00000000 */   nop
/* E2C10 001E2B10 46030046 */  mov.s      $f13, $f0
/* E2C14 001E2B14 2826A070 */  paddub     $4, $5, $0
/* E2C18 001E2B18 A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E2C1C 001E2B1C 00000000 */   nop
/* E2C20 001E2B20 10350224 */  addiu      $2, $0, 0x3510
/* E2C24 001E2B24 18186200 */  mult       $3, $3, $2
/* E2C28 001E2B28 E09C828F */  lw         $2, -0x6320($gp)
/* E2C2C 001E2B2C 21104300 */  addu       $2, $2, $3
/* E2C30 001E2B30 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* E2C34 001E2B34 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* E2C38 001E2B38 21204100 */  addu       $4, $2, $at
/* E2C3C 001E2B3C 86030046 */  mov.s      $f14, $f0
/* E2C40 001E2B40 A000998C */  lw         $25, 0xA0($4)
/* E2C44 001E2B44 1800398F */  lw         $25, 0x18($25)
/* E2C48 001E2B48 09F82003 */  jalr       $25
/* E2C4C 001E2B4C 00000000 */   nop
/* E2C50 001E2B50 01000224 */  addiu      $2, $0, 0x1
/* E2C54 001E2B54 0000BF7B */  lq         $31, 0x0($sp)
/* E2C58 001E2B58 1000BD27 */  addiu      $sp, $sp, 0x10
/* E2C5C 001E2B5C 0800E003 */  jr         $31
/* E2C60 001E2B60 00000000 */   nop
/* E2C64 001E2B64 00000000 */  nop
/* E2C68 001E2B68 00000000 */  nop
/* E2C6C 001E2B6C 00000000 */  nop
