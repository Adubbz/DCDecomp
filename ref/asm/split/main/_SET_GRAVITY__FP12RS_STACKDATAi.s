.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_GRAVITY__FP12RS_STACKDATAi
/* 0E6150 001E6050 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0E6154 001E6054 1000BF7F */  sq          $31, 0x10($29)
/* 0E6158 001E6058 0000B07F */  sq          $16, 0x0($29)
/* 0E615C 001E605C E09C828F */  lw          $2, -0x6320($28)
/* 0E6160 001E6060 9000508C */  lw          $16, 0x90($2)
/* 0E6164 001E6064 9085070C */  jal         GetStackInt__FP12RS_STACKDATA__3
/* 0E6168 001E6068 00000000 */   nop
/* 0E616C 001E606C E09C858F */  lw          $5, -0x6320($28)
/* 0E6170 001E6070 80181000 */  sll         $3, $16, 2
/* 0E6174 001E6074 21207000 */  addu        $4, $3, $16
/* 0E6178 001E6078 80180400 */  sll         $3, $4, 2
/* 0E617C 001E607C 21188300 */  addu        $3, $4, $3
/* 0E6180 001E6080 00190300 */  sll         $3, $3, 4
/* 0E6184 001E6084 21186500 */  addu        $3, $3, $5
/* 0E6188 001E6088 0200013C */  lui         $1, (0x20000 >> 16)
/* 0E618C 001E608C 21086100 */  addu        $1, $3, $1
/* 0E6190 001E6090 A6E422A4 */  sh          $2, -0x1B5A($1)
/* 0E6194 001E6094 01000224 */  addiu       $2, $0, 0x1
/* 0E6198 001E6098 1000BF7B */  lq          $31, 0x10($29)
/* 0E619C 001E609C 0000B07B */  lq          $16, 0x0($29)
/* 0E61A0 001E60A0 2000BD27 */  addiu       $29, $29, 0x20
/* 0E61A4 001E60A4 0800E003 */  jr          $31
/* 0E61A8 001E60A8 00000000 */   nop
/* 0E61AC 001E60AC 00000000 */  nop
