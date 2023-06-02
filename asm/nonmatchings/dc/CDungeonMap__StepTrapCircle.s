.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StepTrapCircle__11CDungeonMapFv
/* C7F60 001C7E60 283E0070 */  paddub     $7, $0, $0
/* C7F64 001C7E64 18000010 */  b          .L001C7EC8
/* C7F68 001C7E68 00000000 */   nop
.L001C7E6C:
/* C7F6C 001C7E6C 40190700 */  sll        $3, $7, 5
/* C7F70 001C7E70 21306400 */  addu       $6, $3, $4
/* C7F74 001C7E74 0100013C */  lui        $at, (0x10AC0 >> 16)
/* C7F78 001C7E78 C00A2134 */  ori        $at, $at, (0x10AC0 & 0xFFFF)
/* C7F7C 001C7E7C 2140C100 */  addu       $8, $6, $at
/* C7F80 001C7E80 0000058D */  lw         $5, 0x0($8)
/* C7F84 001C7E84 02000324 */  addiu      $3, $0, 0x2
/* C7F88 001C7E88 0E00A314 */  bne        $5, $3, .L001C7EC4
/* C7F8C 001C7E8C 00000000 */   nop
/* C7F90 001C7E90 0100013C */  lui        $at, (0x10AC8 >> 16)
/* C7F94 001C7E94 C80A2134 */  ori        $at, $at, (0x10AC8 & 0xFFFF)
/* C7F98 001C7E98 2118C100 */  addu       $3, $6, $at
/* C7F9C 001C7E9C 000061C4 */  lwc1       $f1, 0x0($3)
/* C7FA0 001C7EA0 A88580C7 */  lwc1       $f0, -0x7A58($gp)
/* C7FA4 001C7EA4 40080046 */  add.s      $f1, $f1, $f0
/* C7FA8 001C7EA8 000061E4 */  swc1       $f1, 0x0($3)
/* C7FAC 001C7EAC AC8580C7 */  lwc1       $f0, -0x7A54($gp)
/* C7FB0 001C7EB0 34080046 */  c.lt.s     $f1, $f0
/* C7FB4 001C7EB4 00000000 */  nop
/* C7FB8 001C7EB8 02000145 */  bc1t       .L001C7EC4
/* C7FBC 001C7EBC 00000000 */   nop
/* C7FC0 001C7EC0 000000AD */  sw         $0, 0x0($8)
.L001C7EC4:
/* C7FC4 001C7EC4 0100E724 */  addiu      $7, $7, 0x1
.L001C7EC8:
/* C7FC8 001C7EC8 0300E328 */  slti       $3, $7, 0x3
/* C7FCC 001C7ECC E7FF6014 */  bnez       $3, .L001C7E6C
/* C7FD0 001C7ED0 00000000 */   nop
/* C7FD4 001C7ED4 0800E003 */  jr         $31
/* C7FD8 001C7ED8 00000000 */   nop
/* C7FDC 001C7EDC 00000000 */  nop
