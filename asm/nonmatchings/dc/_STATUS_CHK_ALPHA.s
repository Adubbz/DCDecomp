.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _STATUS_CHK_ALPHA__FP12RS_STACKDATAi
/* E2E20 001E2D20 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* E2E24 001E2D24 3000BF7F */  sq         $31, 0x30($sp)
/* E2E28 001E2D28 2000B27F */  sq         $18, 0x20($sp)
/* E2E2C 001E2D2C 1000B17F */  sq         $17, 0x10($sp)
/* E2E30 001E2D30 0000B07F */  sq         $16, 0x0($sp)
/* E2E34 001E2D34 28968070 */  paddub     $18, $4, $0
/* E2E38 001E2D38 E09C828F */  lw         $2, -0x6320($gp)
/* E2E3C 001E2D3C 9000518C */  lw         $17, 0x90($2)
/* E2E40 001E2D40 28860070 */  paddub     $16, $0, $0
/* E2E44 001E2D44 28160070 */  paddub     $2, $0, $0
/* E2E48 001E2D48 02000324 */  addiu      $3, $0, 0x2
/* E2E4C 001E2D4C 0400A314 */  bne        $5, $3, .L001E2D60
/* E2E50 001E2D50 00000000 */   nop
/* E2E54 001E2D54 08009224 */  addiu      $18, $4, 0x8
/* E2E58 001E2D58 9085070C */  jal        GetStackInt__FP12RS_STACKDATA_3
/* E2E5C 001E2D5C 00000000 */   nop
.L001E2D60:
/* E2E60 001E2D60 14004014 */  bnez       $2, .L001E2DB4
/* E2E64 001E2D64 00000000 */   nop
/* E2E68 001E2D68 E09C848F */  lw         $4, -0x6320($gp)
/* E2E6C 001E2D6C 80101100 */  sll        $2, $17, 2
/* E2E70 001E2D70 21185100 */  addu       $3, $2, $17
/* E2E74 001E2D74 80100300 */  sll        $2, $3, 2
/* E2E78 001E2D78 21106200 */  addu       $2, $3, $2
/* E2E7C 001E2D7C 00110200 */  sll        $2, $2, 4
/* E2E80 001E2D80 21104400 */  addu       $2, $2, $4
/* E2E84 001E2D84 0200013C */  lui        $at, (0x20000 >> 16)
/* E2E88 001E2D88 21084100 */  addu       $at, $2, $at
/* E2E8C 001E2D8C F0E421C4 */  lwc1       $f1, -0x1B10($at)
/* E2E90 001E2D90 00008044 */  mtc1       $0, $f0
/* E2E94 001E2D94 00000000 */  nop
/* E2E98 001E2D98 36080046 */  c.le.s     $f1, $f0
/* E2E9C 001E2D9C 00000000 */  nop
/* E2EA0 001E2DA0 16000045 */  bc1f       .L001E2DFC
/* E2EA4 001E2DA4 00000000 */   nop
/* E2EA8 001E2DA8 01001024 */  addiu      $16, $0, 0x1
/* E2EAC 001E2DAC 13000010 */  b          .L001E2DFC
/* E2EB0 001E2DB0 00000000 */   nop
.L001E2DB4:
/* E2EB4 001E2DB4 E09C848F */  lw         $4, -0x6320($gp)
/* E2EB8 001E2DB8 80101100 */  sll        $2, $17, 2
/* E2EBC 001E2DBC 21185100 */  addu       $3, $2, $17
/* E2EC0 001E2DC0 80100300 */  sll        $2, $3, 2
/* E2EC4 001E2DC4 21106200 */  addu       $2, $3, $2
/* E2EC8 001E2DC8 00110200 */  sll        $2, $2, 4
/* E2ECC 001E2DCC 21104400 */  addu       $2, $2, $4
/* E2ED0 001E2DD0 0200013C */  lui        $at, (0x20000 >> 16)
/* E2ED4 001E2DD4 21084100 */  addu       $at, $2, $at
/* E2ED8 001E2DD8 F0E421C4 */  lwc1       $f1, -0x1B10($at)
/* E2EDC 001E2DDC 0043023C */  lui        $2, (0x43000000 >> 16)
/* E2EE0 001E2DE0 00008244 */  mtc1       $2, $f0
/* E2EE4 001E2DE4 00000000 */  nop
/* E2EE8 001E2DE8 34080046 */  c.lt.s     $f1, $f0
/* E2EEC 001E2DEC 00000000 */  nop
/* E2EF0 001E2DF0 02000145 */  bc1t       .L001E2DFC
/* E2EF4 001E2DF4 00000000 */   nop
/* E2EF8 001E2DF8 01001024 */  addiu      $16, $0, 0x1
.L001E2DFC:
/* E2EFC 001E2DFC 28264072 */  paddub     $4, $18, $0
/* E2F00 001E2E00 282E0072 */  paddub     $5, $16, $0
/* E2F04 001E2E04 B485070C */  jal        SetStack__FP12RS_STACKDATAi_3
/* E2F08 001E2E08 00000000 */   nop
/* E2F0C 001E2E0C 01000224 */  addiu      $2, $0, 0x1
/* E2F10 001E2E10 3000BF7B */  lq         $31, 0x30($sp)
/* E2F14 001E2E14 2000B27B */  lq         $18, 0x20($sp)
/* E2F18 001E2E18 1000B17B */  lq         $17, 0x10($sp)
/* E2F1C 001E2E1C 0000B07B */  lq         $16, 0x0($sp)
/* E2F20 001E2E20 4000BD27 */  addiu      $sp, $sp, 0x40
/* E2F24 001E2E24 0800E003 */  jr         $31
/* E2F28 001E2E28 00000000 */   nop
/* E2F2C 001E2E2C 00000000 */  nop
