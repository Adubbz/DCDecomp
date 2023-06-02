.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetMenuModeMax__Fv
/* F41A0 001F40A0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* F41A4 001F40A4 1000BF7F */  sq         $31, 0x10($sp)
/* F41A8 001F40A8 0000B07F */  sq         $16, 0x0($sp)
/* F41AC 001F40AC D894838F */  lw         $3, -0x6B28($gp)
/* F41B0 001F40B0 01000224 */  addiu      $2, $0, 0x1
/* F41B4 001F40B4 08006210 */  beq        $3, $2, .L001F40D8
/* F41B8 001F40B8 00000000 */   nop
/* F41BC 001F40BC 03006010 */  beqz       $3, .L001F40CC
/* F41C0 001F40C0 00000000 */   nop
/* F41C4 001F40C4 05000010 */  b          .L001F40DC
/* F41C8 001F40C8 00000000 */   nop
.L001F40CC:
/* F41CC 001F40CC 07001024 */  addiu      $16, $0, 0x7
/* F41D0 001F40D0 02000010 */  b          .L001F40DC
/* F41D4 001F40D4 00000000 */   nop
.L001F40D8:
/* F41D8 001F40D8 08001024 */  addiu      $16, $0, 0x8
.L001F40DC:
/* F41DC 001F40DC 58CD080C */  jal        GetGameFlagForManualMenu__Fv
/* F41E0 001F40E0 00000000 */   nop
/* F41E4 001F40E4 02004014 */  bnez       $2, .L001F40F0
/* F41E8 001F40E8 00000000 */   nop
/* F41EC 001F40EC FFFF1026 */  addiu      $16, $16, -0x1
.L001F40F0:
/* F41F0 001F40F0 28160072 */  paddub     $2, $16, $0
/* F41F4 001F40F4 1000BF7B */  lq         $31, 0x10($sp)
/* F41F8 001F40F8 0000B07B */  lq         $16, 0x0($sp)
/* F41FC 001F40FC 2000BD27 */  addiu      $sp, $sp, 0x20
/* F4200 001F4100 0800E003 */  jr         $31
/* F4204 001F4104 00000000 */   nop
/* F4208 001F4108 00000000 */  nop
/* F420C 001F410C 00000000 */  nop
