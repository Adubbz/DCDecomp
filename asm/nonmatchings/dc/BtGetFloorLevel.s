.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BtGetFloorLevel__Fi
/* B78C0 001B77C0 0B008004 */  bltz       $4, .L001B77F0
/* B78C4 001B77C4 00000000 */   nop
/* B78C8 001B77C8 19008128 */  slti       $at, $4, 0x19
/* B78CC 001B77CC 08002010 */  beqz       $at, .L001B77F0
/* B78D0 001B77D0 00000000 */   nop
/* B78D4 001B77D4 80180400 */  sll        $3, $4, 2
/* B78D8 001B77D8 2700023C */  lui        $2, %hi(yearFloorTbl)
/* B78DC 001B77DC 50B24224 */  addiu      $2, $2, %lo(yearFloorTbl)
/* B78E0 001B77E0 21104300 */  addu       $2, $2, $3
/* B78E4 001B77E4 0000428C */  lw         $2, 0x0($2)
/* B78E8 001B77E8 02000010 */  b          .L001B77F4
/* B78EC 001B77EC 00000000 */   nop
.L001B77F0:
/* B78F0 001B77F0 28160070 */  paddub     $2, $0, $0
.L001B77F4:
/* B78F4 001B77F4 0800E003 */  jr         $31
/* B78F8 001B77F8 00000000 */   nop
/* B78FC 001B77FC 00000000 */  nop
