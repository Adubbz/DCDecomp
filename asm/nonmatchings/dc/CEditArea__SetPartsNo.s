.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetPartsNo__9CEditAreaFiii
/* 6DA90 0016D990 0500A004 */  bltz       $5, .L0016D9A8
/* 6DA94 0016D994 00000000 */   nop
/* 6DA98 0016D998 0800838C */  lw         $3, 0x8($4)
/* 6DA9C 0016D99C 2A18A300 */  slt        $3, $5, $3
/* 6DAA0 0016D9A0 03006014 */  bnez       $3, .L0016D9B0
/* 6DAA4 0016D9A4 00000000 */   nop
.L0016D9A8:
/* 6DAA8 0016D9A8 12000010 */  b          .L0016D9F4
/* 6DAAC 0016D9AC 00000000 */   nop
.L0016D9B0:
/* 6DAB0 0016D9B0 0500C004 */  bltz       $6, .L0016D9C8
/* 6DAB4 0016D9B4 00000000 */   nop
/* 6DAB8 0016D9B8 0C00838C */  lw         $3, 0xC($4)
/* 6DABC 0016D9BC 2A18C300 */  slt        $3, $6, $3
/* 6DAC0 0016D9C0 03006014 */  bnez       $3, .L0016D9D0
/* 6DAC4 0016D9C4 00000000 */   nop
.L0016D9C8:
/* 6DAC8 0016D9C8 0A000010 */  b          .L0016D9F4
/* 6DACC 0016D9CC 00000000 */   nop
.L0016D9D0:
/* 6DAD0 0016D9D0 C0180500 */  sll        $3, $5, 3
/* 6DAD4 0016D9D4 23186500 */  subu       $3, $3, $5
/* 6DAD8 0016D9D8 80190300 */  sll        $3, $3, 6
/* 6DADC 0016D9DC 21206400 */  addu       $4, $3, $4
/* 6DAE0 0016D9E0 C0180600 */  sll        $3, $6, 3
/* 6DAE4 0016D9E4 23186600 */  subu       $3, $3, $6
/* 6DAE8 0016D9E8 80180300 */  sll        $3, $3, 2
/* 6DAEC 0016D9EC 21186400 */  addu       $3, $3, $4
/* 6DAF0 0016D9F0 280067AC */  sw         $7, 0x28($3)
.L0016D9F4:
/* 6DAF4 0016D9F4 0800E003 */  jr         $31
/* 6DAF8 0016D9F8 00000000 */   nop
/* 6DAFC 0016D9FC 00000000 */  nop
