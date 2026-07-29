.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BtGetFloorLevel__Fi
/* 0B78C0 001B77C0 0B008004 */  bltz        $4, .L001B77F0
/* 0B78C4 001B77C4 00000000 */   nop
/* 0B78C8 001B77C8 19008128 */  slti        $1, $4, 0x19
/* 0B78CC 001B77CC 08002010 */  beqz        $1, .L001B77F0
/* 0B78D0 001B77D0 00000000 */   nop
/* 0B78D4 001B77D4 80180400 */  sll         $3, $4, 2
/* 0B78D8 001B77D8 2700023C */  lui         $2, %hi(yearFloorTbl)
/* 0B78DC 001B77DC 50B24224 */  addiu       $2, $2, %lo(yearFloorTbl)
/* 0B78E0 001B77E0 21104300 */  addu        $2, $2, $3
/* 0B78E4 001B77E4 0000428C */  lw          $2, 0x0($2)
/* 0B78E8 001B77E8 02000010 */  b           .L001B77F4
/* 0B78EC 001B77EC 00000000 */   nop
.L001B77F0:
/* 0B78F0 001B77F0 28160070 */  paddub      $2, $0, $0
.L001B77F4:
/* 0B78F4 001B77F4 0800E003 */  jr          $31
/* 0B78F8 001B77F8 00000000 */   nop
/* 0B78FC 001B77FC 00000000 */  nop
