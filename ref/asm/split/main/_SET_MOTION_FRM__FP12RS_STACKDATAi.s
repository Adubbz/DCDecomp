.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_MOTION_FRM__FP12RS_STACKDATAi
/* 0E1DB0 001E1CB0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0E1DB4 001E1CB4 0000BF7F */  sq          $31, 0x0($29)
/* 0E1DB8 001E1CB8 E09C828F */  lw          $2, -0x6320($28)
/* 0E1DBC 001E1CBC 9000458C */  lw          $5, 0x90($2)
/* 0E1DC0 001E1CC0 A485070C */  jal         GetStackFloat__FP12RS_STACKDATA__3
/* 0E1DC4 001E1CC4 00000000 */   nop
/* 0E1DC8 001E1CC8 E09C838F */  lw          $3, -0x6320($28)
/* 0E1DCC 001E1CCC 10350224 */  addiu       $2, $0, 0x3510
/* 0E1DD0 001E1CD0 1810A200 */  mult        $2, $5, $2
/* 0E1DD4 001E1CD4 21104300 */  addu        $2, $2, $3
/* 0E1DD8 001E1CD8 0200013C */  lui         $1, (0x20000 >> 16)
/* 0E1DDC 001E1CDC 21084100 */  addu        $1, $2, $1
/* 0E1DE0 001E1CE0 C0FF20E4 */  swc1        $f0, -0x40($1)
/* 0E1DE4 001E1CE4 01000224 */  addiu       $2, $0, 0x1
/* 0E1DE8 001E1CE8 0000BF7B */  lq          $31, 0x0($29)
/* 0E1DEC 001E1CEC 1000BD27 */  addiu       $29, $29, 0x10
/* 0E1DF0 001E1CF0 0800E003 */  jr          $31
/* 0E1DF4 001E1CF4 00000000 */   nop
/* 0E1DF8 001E1CF8 00000000 */  nop
/* 0E1DFC 001E1CFC 00000000 */  nop
