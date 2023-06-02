.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandPOLYDIVE__FPPv
/* 3FE60 0013FD60 0000868C */  lw         $6, 0x0($4)
/* 3FE64 0013FD64 283E0070 */  paddub     $7, $0, $0
/* 3FE68 0013FD68 0C000010 */  b          .L0013FD9C
/* 3FE6C 0013FD6C 00000000 */   nop
.L0013FD70:
/* 3FE70 0013FD70 0000C380 */  lb         $3, 0x0($6)
/* 3FE74 0013FD74 0C006010 */  beqz       $3, .L0013FDA8
/* 3FE78 0013FD78 00000000 */   nop
/* 3FE7C 0013FD7C 30006338 */  xori       $3, $3, 0x30
/* 3FE80 0013FD80 2B280300 */  sltu       $5, $0, $3
/* 3FE84 0013FD84 0C8D848F */  lw         $4, -0x72F4($gp)
/* 3FE88 0013FD88 80180700 */  sll        $3, $7, 2
/* 3FE8C 0013FD8C 21186400 */  addu       $3, $3, $4
/* 3FE90 0013FD90 107165AC */  sw         $5, 0x7110($3)
/* 3FE94 0013FD94 0100C624 */  addiu      $6, $6, 0x1
/* 3FE98 0013FD98 0100E724 */  addiu      $7, $7, 0x1
.L0013FD9C:
/* 3FE9C 0013FD9C 1000E328 */  slti       $3, $7, 0x10
/* 3FEA0 0013FDA0 F3FF6014 */  bnez       $3, .L0013FD70
/* 3FEA4 0013FDA4 00000000 */   nop
.L0013FDA8:
/* 3FEA8 0013FDA8 0800E003 */  jr         $31
/* 3FEAC 0013FDAC 00000000 */   nop
