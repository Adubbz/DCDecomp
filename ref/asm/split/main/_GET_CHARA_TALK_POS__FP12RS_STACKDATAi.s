.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_CHARA_TALK_POS__FP12RS_STACKDATAi
/* 08E120 0018E020 D0FFBD27 */  addiu       $29, $29, -0x30
/* 08E124 0018E024 1000BF7F */  sq          $31, 0x10($29)
/* 08E128 0018E028 0000B07F */  sq          $16, 0x0($29)
/* 08E12C 0018E02C 28868070 */  paddub      $16, $4, $0
/* 08E130 0018E030 0200A128 */  slti        $1, $5, 0x2
/* 08E134 0018E034 04002010 */  beqz        $1, .L0018E048
/* 08E138 0018E038 00000000 */   nop
/* 08E13C 0018E03C 28160070 */  paddub      $2, $0, $0
/* 08E140 0018E040 10000010 */  b           .L0018E084
/* 08E144 0018E044 00000000 */   nop
.L0018E048:
/* 08E148 0018E048 D401013C */  lui         $1, %hi(EdEventInfo + 0x4C)
/* 08E14C 0018E04C 1CD2248C */  lw          $4, %lo(EdEventInfo + 0x4C)($1)
/* 08E150 0018E050 2800A527 */  addiu       $5, $29, 0x28
/* 08E154 0018E054 6032050C */  jal         GetScrPosFromChar__FP10CCharacterPi
/* 08E158 0018E058 00000000 */   nop
/* 08E15C 0018E05C 28260072 */  paddub      $4, $16, $0
/* 08E160 0018E060 08009024 */  addiu       $16, $4, 0x8
/* 08E164 0018E064 2800A58F */  lw          $5, 0x28($29)
/* 08E168 0018E068 F828060C */  jal         SetStack__FP12RS_STACKDATAi
/* 08E16C 0018E06C 00000000 */   nop
/* 08E170 0018E070 28260072 */  paddub      $4, $16, $0
/* 08E174 0018E074 2C00A58F */  lw          $5, 0x2C($29)
/* 08E178 0018E078 F828060C */  jal         SetStack__FP12RS_STACKDATAi
/* 08E17C 0018E07C 00000000 */   nop
/* 08E180 0018E080 01000224 */  addiu       $2, $0, 0x1
.L0018E084:
/* 08E184 0018E084 1000BF7B */  lq          $31, 0x10($29)
/* 08E188 0018E088 0000B07B */  lq          $16, 0x0($29)
/* 08E18C 0018E08C 3000BD27 */  addiu       $29, $29, 0x30
/* 08E190 0018E090 0800E003 */  jr          $31
/* 08E194 0018E094 00000000 */   nop
/* 08E198 0018E098 00000000 */  nop
/* 08E19C 0018E09C 00000000 */  nop
