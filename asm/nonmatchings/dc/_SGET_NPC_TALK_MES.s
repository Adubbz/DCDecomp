.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SGET_NPC_TALK_MES__FP12RS_STACKDATAi
/* 8F990 0018F890 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 8F994 0018F894 1000BF7F */  sq         $31, 0x10($sp)
/* 8F998 0018F898 0000B07F */  sq         $16, 0x0($sp)
/* 8F99C 0018F89C 0200A128 */  slti       $at, $5, 0x2
/* 8F9A0 0018F8A0 04002010 */  beqz       $at, .L0018F8B4
/* 8F9A4 0018F8A4 00000000 */   nop
/* 8F9A8 0018F8A8 28160070 */  paddub     $2, $0, $0
/* 8F9AC 0018F8AC 13000010 */  b          .L0018F8FC
/* 8F9B0 0018F8B0 00000000 */   nop
.L0018F8B4:
/* 8F9B4 0018F8B4 08009024 */  addiu      $16, $4, 0x8
/* 8F9B8 0018F8B8 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8F9BC 0018F8BC 00000000 */   nop
/* 8F9C0 0018F8C0 1C8D848F */  lw         $4, -0x72E4($gp)
/* 8F9C4 0018F8C4 2090858F */  lw         $5, -0x6FE0($gp)
/* 8F9C8 0018F8C8 28364070 */  paddub     $6, $2, $0
/* 8F9CC 0018F8CC 3460050C */  jal        GetGrdNPCData__9CSaveDataFii
/* 8F9D0 0018F8D0 00000000 */   nop
/* 8F9D4 0018F8D4 04004014 */  bnez       $2, .L0018F8E8
/* 8F9D8 0018F8D8 00000000 */   nop
/* 8F9DC 0018F8DC 28160070 */  paddub     $2, $0, $0
/* 8F9E0 0018F8E0 06000010 */  b          .L0018F8FC
/* 8F9E4 0018F8E4 00000000 */   nop
.L0018F8E8:
/* 8F9E8 0018F8E8 28260072 */  paddub     $4, $16, $0
/* 8F9EC 0018F8EC 0800458C */  lw         $5, 0x8($2)
/* 8F9F0 0018F8F0 F828060C */  jal        SetStack__FP12RS_STACKDATAi
/* 8F9F4 0018F8F4 00000000 */   nop
/* 8F9F8 0018F8F8 01000224 */  addiu      $2, $0, 0x1
.L0018F8FC:
/* 8F9FC 0018F8FC 1000BF7B */  lq         $31, 0x10($sp)
/* 8FA00 0018F900 0000B07B */  lq         $16, 0x0($sp)
/* 8FA04 0018F904 2000BD27 */  addiu      $sp, $sp, 0x20
/* 8FA08 0018F908 0800E003 */  jr         $31
/* 8FA0C 0018F90C 00000000 */   nop
