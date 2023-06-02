.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndBgmInit__Fv
/* 59A30 00159930 FFFF0224 */  addiu      $2, $0, -0x1
/* 59A34 00159934 048E82AF */  sw         $2, -0x71FC($gp)
/* 59A38 00159938 088E80AF */  sw         $0, -0x71F8($gp)
/* 59A3C 0015993C 0C8E80AF */  sw         $0, -0x71F4($gp)
/* 59A40 00159940 108E80AF */  sw         $0, -0x71F0($gp)
/* 59A44 00159944 1C8E80AF */  sw         $0, -0x71E4($gp)
/* 59A48 00159948 188E80AF */  sw         $0, -0x71E8($gp)
/* 59A4C 0015994C 148E80AF */  sw         $0, -0x71EC($gp)
/* 59A50 00159950 01000224 */  addiu      $2, $0, 0x1
/* 59A54 00159954 0800E003 */  jr         $31
/* 59A58 00159958 00000000 */   nop
/* 59A5C 0015995C 00000000 */  nop
