.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdSetDOF__FP19DEPTH_OF_FIELD_INFO
/* 0723A0 001722A0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0723A4 001722A4 0000BF7F */  sq          $31, 0x0($29)
/* 0723A8 001722A8 D201023C */  lui         $2, %hi(dof)
/* 0723AC 001722AC 60994524 */  addiu       $5, $2, %lo(dof)
/* 0723B0 001722B0 07000324 */  addiu       $3, $0, 0x7
/* 0723B4 001722B4 28368070 */  paddub      $6, $4, $0
.L001722B8:
/* 0723B8 001722B8 0000C28C */  lw          $2, 0x0($6)
/* 0723BC 001722BC 0400C624 */  addiu       $6, $6, 0x4
/* 0723C0 001722C0 FFFF6324 */  addiu       $3, $3, -0x1
/* 0723C4 001722C4 0000A2AC */  sw          $2, 0x0($5)
/* 0723C8 001722C8 0400A524 */  addiu       $5, $5, 0x4
/* 0723CC 001722CC FAFF601C */  bgtz        $3, .L001722B8
/* 0723D0 001722D0 00000000 */   nop
/* 0723D4 001722D4 1000848C */  lw          $4, 0x10($4)
/* 0723D8 001722D8 84C8050C */  jal         EdSetDOFLevel__Fi
/* 0723DC 001722DC 00000000 */   nop
/* 0723E0 001722E0 0000BF7B */  lq          $31, 0x0($29)
/* 0723E4 001722E4 1000BD27 */  addiu       $29, $29, 0x10
/* 0723E8 001722E8 0800E003 */  jr          $31
/* 0723EC 001722EC 00000000 */   nop
