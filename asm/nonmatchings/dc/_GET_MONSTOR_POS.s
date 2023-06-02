.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_MONSTOR_POS__FP12RS_STACKDATAi
/* E4A20 001E4920 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* E4A24 001E4924 1000BF7F */  sq         $31, 0x10($sp)
/* E4A28 001E4928 0000B07F */  sq         $16, 0x0($sp)
/* E4A2C 001E492C 08009024 */  addiu      $16, $4, 0x8
/* E4A30 001E4930 9085070C */  jal        GetStackInt__FP12RS_STACKDATA_3
/* E4A34 001E4934 00000000 */   nop
/* E4A38 001E4938 10350324 */  addiu      $3, $0, 0x3510
/* E4A3C 001E493C 18184300 */  mult       $3, $2, $3
/* E4A40 001E4940 E09C828F */  lw         $2, -0x6320($gp)
/* E4A44 001E4944 21104300 */  addu       $2, $2, $3
/* E4A48 001E4948 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* E4A4C 001E494C D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* E4A50 001E4950 21204100 */  addu       $4, $2, $at
/* E4A54 001E4954 2000A527 */  addiu      $5, $sp, 0x20
/* E4A58 001E4958 A000998C */  lw         $25, 0xA0($4)
/* E4A5C 001E495C A000398F */  lw         $25, 0xA0($25)
/* E4A60 001E4960 09F82003 */  jalr       $25
/* E4A64 001E4964 00000000 */   nop
/* E4A68 001E4968 28260072 */  paddub     $4, $16, $0
/* E4A6C 001E496C 08009024 */  addiu      $16, $4, 0x8
/* E4A70 001E4970 2000ACC7 */  lwc1       $f12, 0x20($sp)
/* E4A74 001E4974 BC85070C */  jal        SetStack__FP12RS_STACKDATAf_3
/* E4A78 001E4978 00000000 */   nop
/* E4A7C 001E497C 28260072 */  paddub     $4, $16, $0
/* E4A80 001E4980 08009024 */  addiu      $16, $4, 0x8
/* E4A84 001E4984 2400ACC7 */  lwc1       $f12, 0x24($sp)
/* E4A88 001E4988 BC85070C */  jal        SetStack__FP12RS_STACKDATAf_3
/* E4A8C 001E498C 00000000 */   nop
/* E4A90 001E4990 28260072 */  paddub     $4, $16, $0
/* E4A94 001E4994 2800ACC7 */  lwc1       $f12, 0x28($sp)
/* E4A98 001E4998 BC85070C */  jal        SetStack__FP12RS_STACKDATAf_3
/* E4A9C 001E499C 00000000 */   nop
/* E4AA0 001E49A0 01000224 */  addiu      $2, $0, 0x1
/* E4AA4 001E49A4 1000BF7B */  lq         $31, 0x10($sp)
/* E4AA8 001E49A8 0000B07B */  lq         $16, 0x0($sp)
/* E4AAC 001E49AC 3000BD27 */  addiu      $sp, $sp, 0x30
/* E4AB0 001E49B0 0800E003 */  jr         $31
/* E4AB4 001E49B4 00000000 */   nop
/* E4AB8 001E49B8 00000000 */  nop
/* E4ABC 001E49BC 00000000 */  nop
