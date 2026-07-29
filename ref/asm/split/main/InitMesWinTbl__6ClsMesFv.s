.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel InitMesWinTbl__6ClsMesFv
/* 04F690 0014F590 282E0070 */  paddub      $5, $0, $0
/* 04F694 0014F594 09000010 */  b           .L0014F5BC
/* 04F698 0014F598 00000000 */   nop
.L0014F59C:
/* 04F69C 0014F59C C0180500 */  sll         $3, $5, 3
/* 04F6A0 0014F5A0 21186400 */  addu        $3, $3, $4
/* 04F6A4 0014F5A4 C40060A4 */  sh          $0, 0xC4($3)
/* 04F6A8 0014F5A8 C60060A4 */  sh          $0, 0xC6($3)
/* 04F6AC 0014F5AC C80060A4 */  sh          $0, 0xC8($3)
/* 04F6B0 0014F5B0 CA0060A0 */  sb          $0, 0xCA($3)
/* 04F6B4 0014F5B4 CB0060A0 */  sb          $0, 0xCB($3)
/* 04F6B8 0014F5B8 0100A524 */  addiu       $5, $5, 0x1
.L0014F5BC:
/* 04F6BC 0014F5BC BC02A328 */  slti        $3, $5, 0x2BC
/* 04F6C0 0014F5C0 F6FF6014 */  bnez        $3, .L0014F59C
/* 04F6C4 0014F5C4 00000000 */   nop
/* 04F6C8 0014F5C8 A41680AC */  sw          $0, 0x16A4($4)
/* 04F6CC 0014F5CC 0800E003 */  jr          $31
/* 04F6D0 0014F5D0 00000000 */   nop
/* 04F6D4 0014F5D4 00000000 */  nop
/* 04F6D8 0014F5D8 00000000 */  nop
/* 04F6DC 0014F5DC 00000000 */  nop
