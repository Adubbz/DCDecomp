.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RsetMimicEvent__11CDungeonMapFv
/* C8F50 001C8E50 283E0070 */  paddub     $7, $0, $0
/* C8F54 001C8E54 18000010 */  b          .L001C8EB8
/* C8F58 001C8E58 00000000 */   nop
.L001C8E5C:
/* C8F5C 001C8E5C 80180700 */  sll        $3, $7, 2
/* C8F60 001C8E60 21186700 */  addu       $3, $3, $7
/* C8F64 001C8E64 00190300 */  sll        $3, $3, 4
/* C8F68 001C8E68 21306400 */  addu       $6, $3, $4
/* C8F6C 001C8E6C 600DC924 */  addiu      $9, $6, 0xD60
/* C8F70 001C8E70 F87F2925 */  addiu      $9, $9, 0x7FF8
/* C8F74 001C8E74 0000288D */  lw         $8, 0x0($9)
/* C8F78 001C8E78 FFFF0524 */  addiu      $5, $0, -0x1
/* C8F7C 001C8E7C 0D000511 */  beq        $8, $5, .L001C8EB4
/* C8F80 001C8E80 00000000 */   nop
/* C8F84 001C8E84 08000324 */  addiu      $3, $0, 0x8
/* C8F88 001C8E88 0A000315 */  bne        $8, $3, .L001C8EB4
/* C8F8C 001C8E8C 00000000 */   nop
/* C8F90 001C8E90 000025AD */  sw         $5, 0x0($9)
/* C8F94 001C8E94 0100013C */  lui        $at, (0x10000 >> 16)
/* C8F98 001C8E98 2108C100 */  addu       $at, $6, $at
/* C8F9C 001C8E9C 788D238C */  lw         $3, -0x7288($at)
/* C8FA0 001C8EA0 80190300 */  sll        $3, $3, 6
/* C8FA4 001C8EA4 21186400 */  addu       $3, $3, $4
/* C8FA8 001C8EA8 0100013C */  lui        $at, (0x10000 >> 16)
/* C8FAC 001C8EAC 21086100 */  addu       $at, $3, $at
/* C8FB0 001C8EB0 60B620AC */  sw         $0, -0x49A0($at)
.L001C8EB4:
/* C8FB4 001C8EB4 0100E724 */  addiu      $7, $7, 0x1
.L001C8EB8:
/* C8FB8 001C8EB8 3000E328 */  slti       $3, $7, 0x30
/* C8FBC 001C8EBC E7FF6014 */  bnez       $3, .L001C8E5C
/* C8FC0 001C8EC0 00000000 */   nop
/* C8FC4 001C8EC4 0800E003 */  jr         $31
/* C8FC8 001C8EC8 00000000 */   nop
/* C8FCC 001C8ECC 00000000 */  nop
