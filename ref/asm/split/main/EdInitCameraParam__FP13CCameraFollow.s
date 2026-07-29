.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdInitCameraParam__FP13CCameraFollow
/* 06A080 00169F80 E0FFBD27 */  addiu       $29, $29, -0x20
/* 06A084 00169F84 1000BF7F */  sq          $31, 0x10($29)
/* 06A088 00169F88 0000B07F */  sq          $16, 0x0($29)
/* 06A08C 00169F8C 28868070 */  paddub      $16, $4, $0
/* 06A090 00169F90 09000012 */  beqz        $16, .L00169FB8
/* 06A094 00169F94 00000000 */   nop
/* 06A098 00169F98 28878CC7 */  lwc1        $f12, -0x78D8($28)
/* 06A09C 00169F9C DC92040C */  jal         SetDistance__13CCameraFollowFf
/* 06A0A0 00169FA0 00000000 */   nop
/* 06A0A4 00169FA4 A040023C */  lui         $2, (0x40A00000 >> 16)
/* 06A0A8 00169FA8 00608244 */  mtc1        $2, $f12
/* 06A0AC 00169FAC 28260072 */  paddub      $4, $16, $0
/* 06A0B0 00169FB0 EC92040C */  jal         SetHeight__13CCameraFollowFf
/* 06A0B4 00169FB4 00000000 */   nop
.L00169FB8:
/* 06A0B8 00169FB8 1000BF7B */  lq          $31, 0x10($29)
/* 06A0BC 00169FBC 0000B07B */  lq          $16, 0x0($29)
/* 06A0C0 00169FC0 2000BD27 */  addiu       $29, $29, 0x20
/* 06A0C4 00169FC4 0800E003 */  jr          $31
/* 06A0C8 00169FC8 00000000 */   nop
/* 06A0CC 00169FCC 00000000 */  nop
