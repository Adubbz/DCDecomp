.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SQ_RePlay__6CSoundFi
/* 456A0 001455A0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 456A4 001455A4 1000BF7F */  sq         $31, 0x10($sp)
/* 456A8 001455A8 0000B07F */  sq         $16, 0x0($sp)
/* 456AC 001455AC 2886A070 */  paddub     $16, $5, $0
/* 456B0 001455B0 2A00023C */  lui        $2, %hi(_789)
/* 456B4 001455B4 50994424 */  addiu      $4, $2, %lo(_789)
/* 456B8 001455B8 A611040C */  jal        printf
/* 456BC 001455BC 00000000 */   nop
/* 456C0 001455C0 28260072 */  paddub     $4, $16, $0
/* 456C4 001455C4 282E0070 */  paddub     $5, $0, $0
/* 456C8 001455C8 801E050C */  jal        ezMidi__Fii
/* 456CC 001455CC 00000000 */   nop
/* 456D0 001455D0 1000BF7B */  lq         $31, 0x10($sp)
/* 456D4 001455D4 0000B07B */  lq         $16, 0x0($sp)
/* 456D8 001455D8 2000BD27 */  addiu      $sp, $sp, 0x20
/* 456DC 001455DC 0800E003 */  jr         $31
/* 456E0 001455E0 00000000 */   nop
/* 456E4 001455E4 00000000 */  nop
/* 456E8 001455E8 00000000 */  nop
/* 456EC 001455EC 00000000 */  nop
