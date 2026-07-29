.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel InitEditEffect__FP6CFrameP16EDIT_EFFECT_INFO
/* 066A70 00166970 D0FFBD27 */  addiu       $29, $29, -0x30
/* 066A74 00166974 2000BF7F */  sq          $31, 0x20($29)
/* 066A78 00166978 1000B17F */  sq          $17, 0x10($29)
/* 066A7C 0016697C 0000B07F */  sq          $16, 0x0($29)
/* 066A80 00166980 288E8070 */  paddub      $17, $4, $0
/* 066A84 00166984 2886A070 */  paddub      $16, $5, $0
/* 066A88 00166988 04002016 */  bnez        $17, .L0016699C
/* 066A8C 0016698C 00000000 */   nop
/* 066A90 00166990 200000AE */  sw          $0, 0x20($16)
/* 066A94 00166994 08000010 */  b           .L001669B8
/* 066A98 00166998 00000000 */   nop
.L0016699C:
/* 066A9C 0016699C C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 066AA0 001669A0 00000000 */   nop
/* 066AA4 001669A4 200002AE */  sw          $2, 0x20($16)
/* 066AA8 001669A8 2000038E */  lw          $3, 0x20($16)
/* 066AAC 001669AC 02006014 */  bnez        $3, .L001669B8
/* 066AB0 001669B0 00000000 */   nop
/* 066AB4 001669B4 200011AE */  sw          $17, 0x20($16)
.L001669B8:
/* 066AB8 001669B8 2000BF7B */  lq          $31, 0x20($29)
/* 066ABC 001669BC 1000B17B */  lq          $17, 0x10($29)
/* 066AC0 001669C0 0000B07B */  lq          $16, 0x0($29)
/* 066AC4 001669C4 3000BD27 */  addiu       $29, $29, 0x30
/* 066AC8 001669C8 0800E003 */  jr          $31
/* 066ACC 001669CC 00000000 */   nop
