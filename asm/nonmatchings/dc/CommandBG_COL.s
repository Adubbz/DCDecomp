.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandBG_COL__FPPv
/* 74F80 00174E80 0000838C */  lw         $3, 0x0($4)
/* 74F84 00174E84 000060C4 */  lwc1       $f0, 0x0($3)
/* 74F88 00174E88 C08F858F */  lw         $5, -0x7040($gp)
/* 74F8C 00174E8C D48F838F */  lw         $3, -0x702C($gp)
/* 74F90 00174E90 00190300 */  sll        $3, $3, 4
/* 74F94 00174E94 21186500 */  addu       $3, $3, $5
/* 74F98 00174E98 300760E4 */  swc1       $f0, 0x730($3)
/* 74F9C 00174E9C 0400838C */  lw         $3, 0x4($4)
/* 74FA0 00174EA0 000060C4 */  lwc1       $f0, 0x0($3)
/* 74FA4 00174EA4 C08F858F */  lw         $5, -0x7040($gp)
/* 74FA8 00174EA8 D48F838F */  lw         $3, -0x702C($gp)
/* 74FAC 00174EAC 00190300 */  sll        $3, $3, 4
/* 74FB0 00174EB0 21186500 */  addu       $3, $3, $5
/* 74FB4 00174EB4 340760E4 */  swc1       $f0, 0x734($3)
/* 74FB8 00174EB8 0800838C */  lw         $3, 0x8($4)
/* 74FBC 00174EBC 000060C4 */  lwc1       $f0, 0x0($3)
/* 74FC0 00174EC0 C08F848F */  lw         $4, -0x7040($gp)
/* 74FC4 00174EC4 D48F838F */  lw         $3, -0x702C($gp)
/* 74FC8 00174EC8 00190300 */  sll        $3, $3, 4
/* 74FCC 00174ECC 21186400 */  addu       $3, $3, $4
/* 74FD0 00174ED0 380760E4 */  swc1       $f0, 0x738($3)
/* 74FD4 00174ED4 0043053C */  lui        $5, (0x43000000 >> 16)
/* 74FD8 00174ED8 C08F848F */  lw         $4, -0x7040($gp)
/* 74FDC 00174EDC D48F838F */  lw         $3, -0x702C($gp)
/* 74FE0 00174EE0 00190300 */  sll        $3, $3, 4
/* 74FE4 00174EE4 21186400 */  addu       $3, $3, $4
/* 74FE8 00174EE8 3C0765AC */  sw         $5, 0x73C($3)
/* 74FEC 00174EEC 0800E003 */  jr         $31
/* 74FF0 00174EF0 00000000 */   nop
/* 74FF4 00174EF4 00000000 */  nop
/* 74FF8 00174EF8 00000000 */  nop
/* 74FFC 00174EFC 00000000 */  nop
