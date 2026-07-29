.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetPartsNo__9CEditAreaFiii
/* 06DA90 0016D990 0500A004 */  bltz        $5, .L0016D9A8
/* 06DA94 0016D994 00000000 */   nop
/* 06DA98 0016D998 0800838C */  lw          $3, 0x8($4)
/* 06DA9C 0016D99C 2A18A300 */  slt         $3, $5, $3
/* 06DAA0 0016D9A0 03006014 */  bnez        $3, .L0016D9B0
/* 06DAA4 0016D9A4 00000000 */   nop
.L0016D9A8:
/* 06DAA8 0016D9A8 12000010 */  b           .L0016D9F4
/* 06DAAC 0016D9AC 00000000 */   nop
.L0016D9B0:
/* 06DAB0 0016D9B0 0500C004 */  bltz        $6, .L0016D9C8
/* 06DAB4 0016D9B4 00000000 */   nop
/* 06DAB8 0016D9B8 0C00838C */  lw          $3, 0xC($4)
/* 06DABC 0016D9BC 2A18C300 */  slt         $3, $6, $3
/* 06DAC0 0016D9C0 03006014 */  bnez        $3, .L0016D9D0
/* 06DAC4 0016D9C4 00000000 */   nop
.L0016D9C8:
/* 06DAC8 0016D9C8 0A000010 */  b           .L0016D9F4
/* 06DACC 0016D9CC 00000000 */   nop
.L0016D9D0:
/* 06DAD0 0016D9D0 C0180500 */  sll         $3, $5, 3
/* 06DAD4 0016D9D4 23186500 */  subu        $3, $3, $5
/* 06DAD8 0016D9D8 80190300 */  sll         $3, $3, 6
/* 06DADC 0016D9DC 21206400 */  addu        $4, $3, $4
/* 06DAE0 0016D9E0 C0180600 */  sll         $3, $6, 3
/* 06DAE4 0016D9E4 23186600 */  subu        $3, $3, $6
/* 06DAE8 0016D9E8 80180300 */  sll         $3, $3, 2
/* 06DAEC 0016D9EC 21186400 */  addu        $3, $3, $4
/* 06DAF0 0016D9F0 280067AC */  sw          $7, 0x28($3)
.L0016D9F4:
/* 06DAF4 0016D9F4 0800E003 */  jr          $31
/* 06DAF8 0016D9F8 00000000 */   nop
/* 06DAFC 0016D9FC 00000000 */  nop
