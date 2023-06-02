.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel initTrapCircle__11CDungeonMapFv
/* C7AB0 001C79B0 282E0070 */  paddub     $5, $0, $0
/* C7AB4 001C79B4 07000010 */  b          .L001C79D4
/* C7AB8 001C79B8 00000000 */   nop
.L001C79BC:
/* C7ABC 001C79BC 40190500 */  sll        $3, $5, 5
/* C7AC0 001C79C0 21186400 */  addu       $3, $3, $4
/* C7AC4 001C79C4 0100013C */  lui        $at, (0x10AC0 >> 16)
/* C7AC8 001C79C8 21086100 */  addu       $at, $3, $at
/* C7ACC 001C79CC C00A20AC */  sw         $0, (0x10AC0 & 0xFFFF)($at)
/* C7AD0 001C79D0 0100A524 */  addiu      $5, $5, 0x1
.L001C79D4:
/* C7AD4 001C79D4 0300A328 */  slti       $3, $5, 0x3
/* C7AD8 001C79D8 F8FF6014 */  bnez       $3, .L001C79BC
/* C7ADC 001C79DC 00000000 */   nop
/* C7AE0 001C79E0 0800E003 */  jr         $31
/* C7AE4 001C79E4 00000000 */   nop
/* C7AE8 001C79E8 00000000 */  nop
/* C7AEC 001C79EC 00000000 */  nop
