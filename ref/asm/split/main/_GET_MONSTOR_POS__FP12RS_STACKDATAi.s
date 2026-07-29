.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_MONSTOR_POS__FP12RS_STACKDATAi
/* 0E4A20 001E4920 D0FFBD27 */  addiu       $29, $29, -0x30
/* 0E4A24 001E4924 1000BF7F */  sq          $31, 0x10($29)
/* 0E4A28 001E4928 0000B07F */  sq          $16, 0x0($29)
/* 0E4A2C 001E492C 08009024 */  addiu       $16, $4, 0x8
/* 0E4A30 001E4930 9085070C */  jal         GetStackInt__FP12RS_STACKDATA__3
/* 0E4A34 001E4934 00000000 */   nop
/* 0E4A38 001E4938 10350324 */  addiu       $3, $0, 0x3510
/* 0E4A3C 001E493C 18184300 */  mult        $3, $2, $3
/* 0E4A40 001E4940 E09C828F */  lw          $2, -0x6320($28)
/* 0E4A44 001E4944 21104300 */  addu        $2, $2, $3
/* 0E4A48 001E4948 0100013C */  lui         $1, (0x1FCD0 >> 16)
/* 0E4A4C 001E494C D0FC2134 */  ori         $1, $1, (0x1FCD0 & 0xFFFF)
/* 0E4A50 001E4950 21204100 */  addu        $4, $2, $1
/* 0E4A54 001E4954 2000A527 */  addiu       $5, $29, 0x20
/* 0E4A58 001E4958 A000998C */  lw          $25, 0xA0($4)
/* 0E4A5C 001E495C A000398F */  lw          $25, 0xA0($25)
/* 0E4A60 001E4960 09F82003 */  jalr        $25
/* 0E4A64 001E4964 00000000 */   nop
/* 0E4A68 001E4968 28260072 */  paddub      $4, $16, $0
/* 0E4A6C 001E496C 08009024 */  addiu       $16, $4, 0x8
/* 0E4A70 001E4970 2000ACC7 */  lwc1        $f12, 0x20($29)
/* 0E4A74 001E4974 BC85070C */  jal         SetStack__FP12RS_STACKDATAf__3
/* 0E4A78 001E4978 00000000 */   nop
/* 0E4A7C 001E497C 28260072 */  paddub      $4, $16, $0
/* 0E4A80 001E4980 08009024 */  addiu       $16, $4, 0x8
/* 0E4A84 001E4984 2400ACC7 */  lwc1        $f12, 0x24($29)
/* 0E4A88 001E4988 BC85070C */  jal         SetStack__FP12RS_STACKDATAf__3
/* 0E4A8C 001E498C 00000000 */   nop
/* 0E4A90 001E4990 28260072 */  paddub      $4, $16, $0
/* 0E4A94 001E4994 2800ACC7 */  lwc1        $f12, 0x28($29)
/* 0E4A98 001E4998 BC85070C */  jal         SetStack__FP12RS_STACKDATAf__3
/* 0E4A9C 001E499C 00000000 */   nop
/* 0E4AA0 001E49A0 01000224 */  addiu       $2, $0, 0x1
/* 0E4AA4 001E49A4 1000BF7B */  lq          $31, 0x10($29)
/* 0E4AA8 001E49A8 0000B07B */  lq          $16, 0x0($29)
/* 0E4AAC 001E49AC 3000BD27 */  addiu       $29, $29, 0x30
/* 0E4AB0 001E49B0 0800E003 */  jr          $31
/* 0E4AB4 001E49B4 00000000 */   nop
/* 0E4AB8 001E49B8 00000000 */  nop
/* 0E4ABC 001E49BC 00000000 */  nop
