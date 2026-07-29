.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetPartsExtra__9CEditAreaFiii
/* 06DB70 0016DA70 0500A004 */  bltz        $5, .L0016DA88
/* 06DB74 0016DA74 00000000 */   nop
/* 06DB78 0016DA78 0800838C */  lw          $3, 0x8($4)
/* 06DB7C 0016DA7C 2A18A300 */  slt         $3, $5, $3
/* 06DB80 0016DA80 03006014 */  bnez        $3, .L0016DA90
/* 06DB84 0016DA84 00000000 */   nop
.L0016DA88:
/* 06DB88 0016DA88 12000010 */  b           .L0016DAD4
/* 06DB8C 0016DA8C 00000000 */   nop
.L0016DA90:
/* 06DB90 0016DA90 0500C004 */  bltz        $6, .L0016DAA8
/* 06DB94 0016DA94 00000000 */   nop
/* 06DB98 0016DA98 0C00838C */  lw          $3, 0xC($4)
/* 06DB9C 0016DA9C 2A18C300 */  slt         $3, $6, $3
/* 06DBA0 0016DAA0 03006014 */  bnez        $3, .L0016DAB0
/* 06DBA4 0016DAA4 00000000 */   nop
.L0016DAA8:
/* 06DBA8 0016DAA8 0A000010 */  b           .L0016DAD4
/* 06DBAC 0016DAAC 00000000 */   nop
.L0016DAB0:
/* 06DBB0 0016DAB0 C0180500 */  sll         $3, $5, 3
/* 06DBB4 0016DAB4 23186500 */  subu        $3, $3, $5
/* 06DBB8 0016DAB8 80190300 */  sll         $3, $3, 6
/* 06DBBC 0016DABC 21206400 */  addu        $4, $3, $4
/* 06DBC0 0016DAC0 C0180600 */  sll         $3, $6, 3
/* 06DBC4 0016DAC4 23186600 */  subu        $3, $3, $6
/* 06DBC8 0016DAC8 80180300 */  sll         $3, $3, 2
/* 06DBCC 0016DACC 21186400 */  addu        $3, $3, $4
/* 06DBD0 0016DAD0 3C0067AC */  sw          $7, 0x3C($3)
.L0016DAD4:
/* 06DBD4 0016DAD4 0800E003 */  jr          $31
/* 06DBD8 0016DAD8 00000000 */   nop
/* 06DBDC 0016DADC 00000000 */  nop
