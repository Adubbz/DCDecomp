.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_RES_LIMMIT_ZONE__FP12RS_STACKDATAi
/* 0BD190 001BD090 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0BD194 001BD094 0000BF7F */  sq          $31, 0x0($29)
/* 0BD198 001BD098 789C848F */  lw          $4, -0x6388($28)
/* 0BD19C 001BD09C C4FB060C */  jal         SetResLimmitZone__14CDngStatusDataFv
/* 0BD1A0 001BD0A0 00000000 */   nop
/* 0BD1A4 001BD0A4 789C828F */  lw          $2, -0x6388($28)
/* 0BD1A8 001BD0A8 0100013C */  lui         $1, (0x10000 >> 16)
/* 0BD1AC 001BD0AC 21084100 */  addu        $1, $2, $1
/* 0BD1B0 001BD0B0 108B238C */  lw          $3, -0x74F0($1)
/* 0BD1B4 001BD0B4 FFFF0224 */  addiu       $2, $0, -0x1
/* 0BD1B8 001BD0B8 04006210 */  beq         $3, $2, .L001BD0CC
/* 0BD1BC 001BD0BC 00000000 */   nop
/* 0BD1C0 001BD0C0 1B000424 */  addiu       $4, $0, 0x1B
/* 0BD1C4 001BD0C4 B46D050C */  jal         SndSPSeLoad__Fi
/* 0BD1C8 001BD0C8 00000000 */   nop
.L001BD0CC:
/* 0BD1CC 001BD0CC 01000224 */  addiu       $2, $0, 0x1
/* 0BD1D0 001BD0D0 0000BF7B */  lq          $31, 0x0($29)
/* 0BD1D4 001BD0D4 1000BD27 */  addiu       $29, $29, 0x10
/* 0BD1D8 001BD0D8 0800E003 */  jr          $31
/* 0BD1DC 001BD0DC 00000000 */   nop
