.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetNameTextureInfo__FPP8CTextureiRiRi
/* 1387A0 002386A0 0500A014 */  bnez       $5, .L002386B8
/* 1387A4 002386A4 00000000 */   nop
/* 1387A8 002386A8 E6000524 */  addiu      $5, $0, 0xE6
/* 1387AC 002386AC 0000828C */  lw         $2, 0x0($4)
/* 1387B0 002386B0 12000010 */  b          .L002386FC
/* 1387B4 002386B4 00000000 */   nop
.L002386B8:
/* 1387B8 002386B8 5200A128 */  slti       $at, $5, 0x52
/* 1387BC 002386BC 05002010 */  beqz       $at, .L002386D4
/* 1387C0 002386C0 00000000 */   nop
/* 1387C4 002386C4 FFFFA524 */  addiu      $5, $5, -0x1
/* 1387C8 002386C8 0400828C */  lw         $2, 0x4($4)
/* 1387CC 002386CC 0B000010 */  b          .L002386FC
/* 1387D0 002386D0 00000000 */   nop
.L002386D4:
/* 1387D4 002386D4 A200A128 */  slti       $at, $5, 0xA2
/* 1387D8 002386D8 05002010 */  beqz       $at, .L002386F0
/* 1387DC 002386DC 00000000 */   nop
/* 1387E0 002386E0 AEFFA524 */  addiu      $5, $5, -0x52
/* 1387E4 002386E4 0800828C */  lw         $2, 0x8($4)
/* 1387E8 002386E8 04000010 */  b          .L002386FC
/* 1387EC 002386EC 00000000 */   nop
.L002386F0:
/* 1387F0 002386F0 5EFFA524 */  addiu      $5, $5, -0xA2
/* 1387F4 002386F4 0000828C */  lw         $2, 0x0($4)
/* 1387F8 002386F8 00000000 */  nop
.L002386FC:
/* 1387FC 002386FC 0A000824 */  addiu      $8, $0, 0xA
/* 138800 00238700 1A00A800 */  div        $0, $5, $8
/* 138804 00238704 00000000 */  nop
/* 138808 00238708 00000000 */  nop
/* 13880C 0023870C 10200000 */  mfhi       $4
/* 138810 00238710 80180400 */  sll        $3, $4, 2
/* 138814 00238714 21186400 */  addu       $3, $3, $4
/* 138818 00238718 40180300 */  sll        $3, $3, 1
/* 13881C 0023871C 21186400 */  addu       $3, $3, $4
/* 138820 00238720 40180300 */  sll        $3, $3, 1
/* 138824 00238724 0000C3AC */  sw         $3, 0x0($6)
/* 138828 00238728 1A00A800 */  div        $0, $5, $8
/* 13882C 0023872C 02000015 */  bnez       $8, .L00238738
/* 138830 00238730 00000000 */   nop
/* 138834 00238734 CD010000 */  break      0, 7
.L00238738:
/* 138838 00238738 12200000 */  mflo       $4
/* 13883C 0023873C 80180400 */  sll        $3, $4, 2
/* 138840 00238740 21186400 */  addu       $3, $3, $4
/* 138844 00238744 40180300 */  sll        $3, $3, 1
/* 138848 00238748 21186400 */  addu       $3, $3, $4
/* 13884C 0023874C 40180300 */  sll        $3, $3, 1
/* 138850 00238750 0000E3AC */  sw         $3, 0x0($7)
/* 138854 00238754 0800E003 */  jr         $31
/* 138858 00238758 00000000 */   nop
/* 13885C 0023875C 00000000 */  nop
