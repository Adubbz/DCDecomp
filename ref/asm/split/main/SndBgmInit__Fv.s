.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SndBgmInit__Fv
/* 059A30 00159930 FFFF0224 */  addiu       $2, $0, -0x1
/* 059A34 00159934 048E82AF */  sw          $2, -0x71FC($28)
/* 059A38 00159938 088E80AF */  sw          $0, -0x71F8($28)
/* 059A3C 0015993C 0C8E80AF */  sw          $0, -0x71F4($28)
/* 059A40 00159940 108E80AF */  sw          $0, -0x71F0($28)
/* 059A44 00159944 1C8E80AF */  sw          $0, -0x71E4($28)
/* 059A48 00159948 188E80AF */  sw          $0, -0x71E8($28)
/* 059A4C 0015994C 148E80AF */  sw          $0, -0x71EC($28)
/* 059A50 00159950 01000224 */  addiu       $2, $0, 0x1
/* 059A54 00159954 0800E003 */  jr          $31
/* 059A58 00159958 00000000 */   nop
/* 059A5C 0015995C 00000000 */  nop
