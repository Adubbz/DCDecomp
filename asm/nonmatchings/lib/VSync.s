.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VSync
/* 148A0 001147A0 0010023C */  lui        $2, (0x1000F000 >> 16)
/* 148A4 001147A4 04000324 */  addiu      $3, $0, 0x4
/* 148A8 001147A8 00F04234 */  ori        $2, $2, (0x1000F000 & 0xFFFF)
/* 148AC 001147AC 000043AC */  sw         $3, 0x0($2)
.L001147B0:
/* 148B0 001147B0 0110023C */  lui        $2, (0x10010000 >> 16)
/* 148B4 001147B4 00F0428C */  lw         $2, -0x1000($2)
/* 148B8 001147B8 04004230 */  andi       $2, $2, 0x4
/* 148BC 001147BC 00000000 */  nop
/* 148C0 001147C0 00000000 */  nop
/* 148C4 001147C4 00000000 */  nop
/* 148C8 001147C8 F9FF4010 */  beqz       $2, .L001147B0
/* 148CC 001147CC 00000000 */   nop
/* 148D0 001147D0 04000224 */  addiu      $2, $0, 0x4
/* 148D4 001147D4 0110013C */  lui        $at, (0x10010000 >> 16)
/* 148D8 001147D8 0800E003 */  jr         $31
/* 148DC 001147DC 00F022AC */   sw        $2, -0x1000($at)
