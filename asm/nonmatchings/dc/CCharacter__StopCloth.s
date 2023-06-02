.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StopCloth__10CCharacterFi
/* 3B490 0013B390 28360070 */  paddub     $6, $0, $0
/* 3B494 0013B394 0A000010 */  b          .L0013B3C0
/* 3B498 0013B398 00000000 */   nop
.L0013B39C:
/* 3B49C 0013B39C 80280600 */  sll        $5, $6, 2
/* 3B4A0 0013B3A0 740C838C */  lw         $3, 0xC74($4)
/* 3B4A4 0013B3A4 21186500 */  addu       $3, $3, $5
/* 3B4A8 0013B3A8 0000658C */  lw         $5, 0x0($3)
/* 3B4AC 0013B3AC 0300A010 */  beqz       $5, .L0013B3BC
/* 3B4B0 0013B3B0 00000000 */   nop
/* 3B4B4 0013B3B4 01000324 */  addiu      $3, $0, 0x1
/* 3B4B8 0013B3B8 3800A3AC */  sw         $3, 0x38($5)
.L0013B3BC:
/* 3B4BC 0013B3BC 0100C624 */  addiu      $6, $6, 0x1
.L0013B3C0:
/* 3B4C0 0013B3C0 0400C328 */  slti       $3, $6, 0x4
/* 3B4C4 0013B3C4 F5FF6014 */  bnez       $3, .L0013B39C
/* 3B4C8 0013B3C8 00000000 */   nop
/* 3B4CC 0013B3CC 0800E003 */  jr         $31
/* 3B4D0 0013B3D0 00000000 */   nop
/* 3B4D4 0013B3D4 00000000 */  nop
/* 3B4D8 0013B3D8 00000000 */  nop
/* 3B4DC 0013B3DC 00000000 */  nop
