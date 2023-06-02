.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FlushCheckMask__11CDungeonMapFv
/* C3D00 001C3C00 28360070 */  paddub     $6, $0, $0
/* C3D04 001C3C04 07000010 */  b          .L001C3C24
/* C3D08 001C3C08 00000000 */   nop
.L001C3C0C:
/* C3D0C 001C3C0C 80180600 */  sll        $3, $6, 2
/* C3D10 001C3C10 21186400 */  addu       $3, $3, $4
/* C3D14 001C3C14 0100013C */  lui        $at, (0x10000 >> 16)
/* C3D18 001C3C18 21086100 */  addu       $at, $3, $at
/* C3D1C 001C3C1C 108720AC */  sw         $0, -0x78F0($at)
/* C3D20 001C3C20 0100C624 */  addiu      $6, $6, 0x1
.L001C3C24:
/* C3D24 001C3C24 9001C328 */  slti       $3, $6, 0x190
/* C3D28 001C3C28 F8FF6014 */  bnez       $3, .L001C3C0C
/* C3D2C 001C3C2C 00000000 */   nop
/* C3D30 001C3C30 28360070 */  paddub     $6, $0, $0
/* C3D34 001C3C34 05000010 */  b          .L001C3C4C
/* C3D38 001C3C38 00000000 */   nop
.L001C3C3C:
/* C3D3C 001C3C3C 80180600 */  sll        $3, $6, 2
/* C3D40 001C3C40 21186400 */  addu       $3, $3, $4
/* C3D44 001C3C44 080060AC */  sw         $0, 0x8($3)
/* C3D48 001C3C48 0100C624 */  addiu      $6, $6, 0x1
.L001C3C4C:
/* C3D4C 001C3C4C 1000C328 */  slti       $3, $6, 0x10
/* C3D50 001C3C50 FAFF6014 */  bnez       $3, .L001C3C3C
/* C3D54 001C3C54 00000000 */   nop
/* C3D58 001C3C58 28360070 */  paddub     $6, $0, $0
/* C3D5C 001C3C5C 10000010 */  b          .L001C3CA0
/* C3D60 001C3C60 00000000 */   nop
.L001C3C64:
/* C3D64 001C3C64 00190600 */  sll        $3, $6, 4
/* C3D68 001C3C68 21186400 */  addu       $3, $3, $4
/* C3D6C 001C3C6C 0100013C */  lui        $at, (0x10000 >> 16)
/* C3D70 001C3C70 21086100 */  addu       $at, $3, $at
/* C3D74 001C3C74 509C258C */  lw         $5, -0x63B0($at)
/* C3D78 001C3C78 1E000324 */  addiu      $3, $0, 0x1E
/* C3D7C 001C3C7C 0700A314 */  bne        $5, $3, .L001C3C9C
/* C3D80 001C3C80 00000000 */   nop
/* C3D84 001C3C84 01000524 */  addiu      $5, $0, 0x1
/* C3D88 001C3C88 80180600 */  sll        $3, $6, 2
/* C3D8C 001C3C8C 21186400 */  addu       $3, $3, $4
/* C3D90 001C3C90 0100013C */  lui        $at, (0x10000 >> 16)
/* C3D94 001C3C94 21086100 */  addu       $at, $3, $at
/* C3D98 001C3C98 108725AC */  sw         $5, -0x78F0($at)
.L001C3C9C:
/* C3D9C 001C3C9C 0100C624 */  addiu      $6, $6, 0x1
.L001C3CA0:
/* C3DA0 001C3CA0 9001C328 */  slti       $3, $6, 0x190
/* C3DA4 001C3CA4 EFFF6014 */  bnez       $3, .L001C3C64
/* C3DA8 001C3CA8 00000000 */   nop
/* C3DAC 001C3CAC 0800E003 */  jr         $31
/* C3DB0 001C3CB0 00000000 */   nop
/* C3DB4 001C3CB4 00000000 */  nop
/* C3DB8 001C3CB8 00000000 */  nop
/* C3DBC 001C3CBC 00000000 */  nop
