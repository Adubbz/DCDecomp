.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _STATUS_SET_MUTEKI__FP12RS_STACKDATAi
/* E2CD0 001E2BD0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* E2CD4 001E2BD4 1000BF7F */  sq         $31, 0x10($sp)
/* E2CD8 001E2BD8 0000B07F */  sq         $16, 0x0($sp)
/* E2CDC 001E2BDC E09C828F */  lw         $2, -0x6320($gp)
/* E2CE0 001E2BE0 9000508C */  lw         $16, 0x90($2)
/* E2CE4 001E2BE4 9085070C */  jal        GetStackInt__FP12RS_STACKDATA_3
/* E2CE8 001E2BE8 00000000 */   nop
/* E2CEC 001E2BEC E09C868F */  lw         $6, -0x6320($gp)
/* E2CF0 001E2BF0 80181000 */  sll        $3, $16, 2
/* E2CF4 001E2BF4 21207000 */  addu       $4, $3, $16
/* E2CF8 001E2BF8 80180400 */  sll        $3, $4, 2
/* E2CFC 001E2BFC 21188300 */  addu       $3, $4, $3
/* E2D00 001E2C00 00290300 */  sll        $5, $3, 4
/* E2D04 001E2C04 2120A600 */  addu       $4, $5, $6
/* E2D08 001E2C08 0200013C */  lui        $at, (0x20000 >> 16)
/* E2D0C 001E2C0C 21088100 */  addu       $at, $4, $at
/* E2D10 001E2C10 F4E3238C */  lw         $3, -0x1C0C($at)
/* E2D14 001E2C14 07006018 */  blez       $3, .L001E2C34
/* E2D18 001E2C18 00000000 */   nop
/* E2D1C 001E2C1C 0200013C */  lui        $at, (0x20000 >> 16)
/* E2D20 001E2C20 21088100 */  addu       $at, $4, $at
/* E2D24 001E2C24 B4E4238C */  lw         $3, -0x1B4C($at)
/* E2D28 001E2C28 02006010 */  beqz       $3, .L001E2C34
/* E2D2C 001E2C2C 00000000 */   nop
/* E2D30 001E2C30 28160070 */  paddub     $2, $0, $0
.L001E2C34:
/* E2D34 001E2C34 2118A600 */  addu       $3, $5, $6
/* E2D38 001E2C38 0200013C */  lui        $at, (0x20000 >> 16)
/* E2D3C 001E2C3C 21086100 */  addu       $at, $3, $at
/* E2D40 001E2C40 68E422AC */  sw         $2, -0x1B98($at)
/* E2D44 001E2C44 01000224 */  addiu      $2, $0, 0x1
/* E2D48 001E2C48 1000BF7B */  lq         $31, 0x10($sp)
/* E2D4C 001E2C4C 0000B07B */  lq         $16, 0x0($sp)
/* E2D50 001E2C50 2000BD27 */  addiu      $sp, $sp, 0x20
/* E2D54 001E2C54 0800E003 */  jr         $31
/* E2D58 001E2C58 00000000 */   nop
/* E2D5C 001E2C5C 00000000 */  nop
