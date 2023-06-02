.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdSetDOF__FP19DEPTH_OF_FIELD_INFO
/* 723A0 001722A0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 723A4 001722A4 0000BF7F */  sq         $31, 0x0($sp)
/* 723A8 001722A8 D201023C */  lui        $2, %hi(dof)
/* 723AC 001722AC 60994524 */  addiu      $5, $2, %lo(dof)
/* 723B0 001722B0 07000324 */  addiu      $3, $0, 0x7
/* 723B4 001722B4 28368070 */  paddub     $6, $4, $0
.L001722B8:
/* 723B8 001722B8 0000C28C */  lw         $2, 0x0($6)
/* 723BC 001722BC 0400C624 */  addiu      $6, $6, 0x4
/* 723C0 001722C0 FFFF6324 */  addiu      $3, $3, -0x1
/* 723C4 001722C4 0000A2AC */  sw         $2, 0x0($5)
/* 723C8 001722C8 0400A524 */  addiu      $5, $5, 0x4
/* 723CC 001722CC FAFF601C */  bgtz       $3, .L001722B8
/* 723D0 001722D0 00000000 */   nop
/* 723D4 001722D4 1000848C */  lw         $4, 0x10($4)
/* 723D8 001722D8 84C8050C */  jal        EdSetDOFLevel__Fi
/* 723DC 001722DC 00000000 */   nop
/* 723E0 001722E0 0000BF7B */  lq         $31, 0x0($sp)
/* 723E4 001722E4 1000BD27 */  addiu      $sp, $sp, 0x10
/* 723E8 001722E8 0800E003 */  jr         $31
/* 723EC 001722EC 00000000 */   nop
