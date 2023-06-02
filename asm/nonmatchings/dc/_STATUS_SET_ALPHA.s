.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _STATUS_SET_ALPHA__FP12RS_STACKDATAi
/* E2D60 001E2C60 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* E2D64 001E2C64 1000BF7F */  sq         $31, 0x10($sp)
/* E2D68 001E2C68 0000B07F */  sq         $16, 0x0($sp)
/* E2D6C 001E2C6C E09C828F */  lw         $2, -0x6320($gp)
/* E2D70 001E2C70 9000438C */  lw         $3, 0x90($2)
/* E2D74 001E2C74 08008624 */  addiu      $6, $4, 0x8
/* E2D78 001E2C78 A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E2D7C 001E2C7C 00000000 */   nop
/* E2D80 001E2C80 E09C848F */  lw         $4, -0x6320($gp)
/* E2D84 001E2C84 80100300 */  sll        $2, $3, 2
/* E2D88 001E2C88 21184300 */  addu       $3, $2, $3
/* E2D8C 001E2C8C 80100300 */  sll        $2, $3, 2
/* E2D90 001E2C90 21106200 */  addu       $2, $3, $2
/* E2D94 001E2C94 00810200 */  sll        $16, $2, 4
/* E2D98 001E2C98 21100402 */  addu       $2, $16, $4
/* E2D9C 001E2C9C 0200013C */  lui        $at, (0x20000 >> 16)
/* E2DA0 001E2CA0 21084100 */  addu       $at, $2, $at
/* E2DA4 001E2CA4 F4E420E4 */  swc1       $f0, -0x1B0C($at)
/* E2DA8 001E2CA8 02000224 */  addiu      $2, $0, 0x2
/* E2DAC 001E2CAC 0E00A214 */  bne        $5, $2, .L001E2CE8
/* E2DB0 001E2CB0 00000000 */   nop
/* E2DB4 001E2CB4 2826C070 */  paddub     $4, $6, $0
/* E2DB8 001E2CB8 9085070C */  jal        GetStackInt__FP12RS_STACKDATA_3
/* E2DBC 001E2CBC 00000000 */   nop
/* E2DC0 001E2CC0 00008244 */  mtc1       $2, $f0
/* E2DC4 001E2CC4 00000000 */  nop
/* E2DC8 001E2CC8 20008046 */  cvt.s.w    $f0, $f0
/* E2DCC 001E2CCC E09C828F */  lw         $2, -0x6320($gp)
/* E2DD0 001E2CD0 21100202 */  addu       $2, $16, $2
/* E2DD4 001E2CD4 0200013C */  lui        $at, (0x20000 >> 16)
/* E2DD8 001E2CD8 21084100 */  addu       $at, $2, $at
/* E2DDC 001E2CDC F4E420E4 */  swc1       $f0, -0x1B0C($at)
/* E2DE0 001E2CE0 06000010 */  b          .L001E2CFC
/* E2DE4 001E2CE4 00000000 */   nop
.L001E2CE8:
/* E2DE8 001E2CE8 E09C828F */  lw         $2, -0x6320($gp)
/* E2DEC 001E2CEC 21100202 */  addu       $2, $16, $2
/* E2DF0 001E2CF0 0200013C */  lui        $at, (0x20000 >> 16)
/* E2DF4 001E2CF4 21084100 */  addu       $at, $2, $at
/* E2DF8 001E2CF8 F8E420AC */  sw         $0, -0x1B08($at)
.L001E2CFC:
/* E2DFC 001E2CFC 01000224 */  addiu      $2, $0, 0x1
/* E2E00 001E2D00 1000BF7B */  lq         $31, 0x10($sp)
/* E2E04 001E2D04 0000B07B */  lq         $16, 0x0($sp)
/* E2E08 001E2D08 2000BD27 */  addiu      $sp, $sp, 0x20
/* E2E0C 001E2D0C 0800E003 */  jr         $31
/* E2E10 001E2D10 00000000 */   nop
/* E2E14 001E2D14 00000000 */  nop
/* E2E18 001E2D18 00000000 */  nop
/* E2E1C 001E2D1C 00000000 */  nop
