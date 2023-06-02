.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_MONSTOR_POS__FP12RS_STACKDATAi
/* E4B20 001E4A20 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* E4B24 001E4A24 1000BF7F */  sq         $31, 0x10($sp)
/* E4B28 001E4A28 0000B07F */  sq         $16, 0x0($sp)
/* E4B2C 001E4A2C 08009024 */  addiu      $16, $4, 0x8
/* E4B30 001E4A30 9085070C */  jal        GetStackInt__FP12RS_STACKDATA_3
/* E4B34 001E4A34 00000000 */   nop
/* E4B38 001E4A38 281E4070 */  paddub     $3, $2, $0
/* E4B3C 001E4A3C 28260072 */  paddub     $4, $16, $0
/* E4B40 001E4A40 08009024 */  addiu      $16, $4, 0x8
/* E4B44 001E4A44 A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E4B48 001E4A48 00000000 */   nop
/* E4B4C 001E4A4C 2000A0E7 */  swc1       $f0, 0x20($sp)
/* E4B50 001E4A50 28260072 */  paddub     $4, $16, $0
/* E4B54 001E4A54 08009024 */  addiu      $16, $4, 0x8
/* E4B58 001E4A58 A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E4B5C 001E4A5C 00000000 */   nop
/* E4B60 001E4A60 2400A0E7 */  swc1       $f0, 0x24($sp)
/* E4B64 001E4A64 28260072 */  paddub     $4, $16, $0
/* E4B68 001E4A68 A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E4B6C 001E4A6C 00000000 */   nop
/* E4B70 001E4A70 2800A0E7 */  swc1       $f0, 0x28($sp)
/* E4B74 001E4A74 10350224 */  addiu      $2, $0, 0x3510
/* E4B78 001E4A78 18186200 */  mult       $3, $3, $2
/* E4B7C 001E4A7C E09C828F */  lw         $2, -0x6320($gp)
/* E4B80 001E4A80 21104300 */  addu       $2, $2, $3
/* E4B84 001E4A84 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* E4B88 001E4A88 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* E4B8C 001E4A8C 21204100 */  addu       $4, $2, $at
/* E4B90 001E4A90 2000A527 */  addiu      $5, $sp, 0x20
/* E4B94 001E4A94 A000998C */  lw         $25, 0xA0($4)
/* E4B98 001E4A98 1400398F */  lw         $25, 0x14($25)
/* E4B9C 001E4A9C 09F82003 */  jalr       $25
/* E4BA0 001E4AA0 00000000 */   nop
/* E4BA4 001E4AA4 01000224 */  addiu      $2, $0, 0x1
/* E4BA8 001E4AA8 1000BF7B */  lq         $31, 0x10($sp)
/* E4BAC 001E4AAC 0000B07B */  lq         $16, 0x0($sp)
/* E4BB0 001E4AB0 3000BD27 */  addiu      $sp, $sp, 0x30
/* E4BB4 001E4AB4 0800E003 */  jr         $31
/* E4BB8 001E4AB8 00000000 */   nop
/* E4BBC 001E4ABC 00000000 */  nop
