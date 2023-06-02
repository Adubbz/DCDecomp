.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Step__12CMotionModelFv
/* B6DD0 001B6CD0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* B6DD4 001B6CD4 0000BF7F */  sq         $31, 0x0($sp)
/* B6DD8 001B6CD8 28468070 */  paddub     $8, $4, $0
/* B6DDC 001B6CDC 9000828C */  lw         $2, 0x90($4)
/* B6DE0 001B6CE0 340082AC */  sw         $2, 0x34($4)
/* B6DE4 001B6CE4 3400838C */  lw         $3, 0x34($4)
/* B6DE8 001B6CE8 3800828C */  lw         $2, 0x38($4)
/* B6DEC 001B6CEC 07006210 */  beq        $3, $2, .L001B6D0C
/* B6DF0 001B6CF0 00000000 */   nop
/* B6DF4 001B6CF4 9000028D */  lw         $2, 0x90($8)
/* B6DF8 001B6CF8 00190200 */  sll        $3, $2, 4
/* B6DFC 001B6CFC 7400028D */  lw         $2, 0x74($8)
/* B6E00 001B6D00 21104300 */  addu       $2, $2, $3
/* B6E04 001B6D04 0000428C */  lw         $2, 0x0($2)
/* B6E08 001B6D08 300002AD */  sw         $2, 0x30($8)
.L001B6D0C:
/* B6E0C 001B6D0C 0000048D */  lw         $4, 0x0($8)
/* B6E10 001B6D10 10000525 */  addiu      $5, $8, 0x10
/* B6E14 001B6D14 7400068D */  lw         $6, 0x74($8)
/* B6E18 001B6D18 20000725 */  addiu      $7, $8, 0x20
/* B6E1C 001B6D1C 7000088D */  lw         $8, 0x70($8)
/* B6E20 001B6D20 4023050C */  jal        SetMotionEX__FP6CFrameP14tagMOTION_TYPEP11MOTION_INFOP12MOTION_STATEP12tagFRAME_INF
/* B6E24 001B6D24 00000000 */   nop
/* B6E28 001B6D28 0000BF7B */  lq         $31, 0x0($sp)
/* B6E2C 001B6D2C 1000BD27 */  addiu      $sp, $sp, 0x10
/* B6E30 001B6D30 0800E003 */  jr         $31
/* B6E34 001B6D34 00000000 */   nop
/* B6E38 001B6D38 00000000 */  nop
/* B6E3C 001B6D3C 00000000 */  nop
