.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DeleteItemFrame__Fi
/* 08B3C0 0018B2C0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 08B3C4 0018B2C4 1000BF7F */  sq          $31, 0x10($29)
/* 08B3C8 0018B2C8 0000B07F */  sq          $16, 0x0($29)
/* 08B3CC 0018B2CC 03008004 */  bltz        $4, .L0018B2DC
/* 08B3D0 0018B2D0 00000000 */   nop
/* 08B3D4 0018B2D4 03008018 */  blez        $4, .L0018B2E4
/* 08B3D8 0018B2D8 00000000 */   nop
.L0018B2DC:
/* 08B3DC 0018B2DC 0B000010 */  b           .L0018B30C
/* 08B3E0 0018B2E0 00000000 */   nop
.L0018B2E4:
/* 08B3E4 0018B2E4 80200400 */  sll         $4, $4, 2
/* 08B3E8 0018B2E8 D401033C */  lui         $3, %hi(EdEventInfo + 0x25C)
/* 08B3EC 0018B2EC 2CD46324 */  addiu       $3, $3, %lo(EdEventInfo + 0x25C)
/* 08B3F0 0018B2F0 21806400 */  addu        $16, $3, $4
/* 08B3F4 0018B2F4 0000048E */  lw          $4, 0x0($16)
/* 08B3F8 0018B2F8 04008010 */  beqz        $4, .L0018B30C
/* 08B3FC 0018B2FC 00000000 */   nop
/* 08B400 0018B300 68A0040C */  jal         DeleteReference__6CFrameFv
/* 08B404 0018B304 00000000 */   nop
/* 08B408 0018B308 000000AE */  sw          $0, 0x0($16)
.L0018B30C:
/* 08B40C 0018B30C 1000BF7B */  lq          $31, 0x10($29)
/* 08B410 0018B310 0000B07B */  lq          $16, 0x0($29)
/* 08B414 0018B314 2000BD27 */  addiu       $29, $29, 0x20
/* 08B418 0018B318 0800E003 */  jr          $31
/* 08B41C 0018B31C 00000000 */   nop
