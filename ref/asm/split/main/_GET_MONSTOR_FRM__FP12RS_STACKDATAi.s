.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_MONSTOR_FRM__FP12RS_STACKDATAi
/* 0E4AC0 001E49C0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0E4AC4 001E49C4 1000BF7F */  sq          $31, 0x10($29)
/* 0E4AC8 001E49C8 0000B07F */  sq          $16, 0x0($29)
/* 0E4ACC 001E49CC 08009024 */  addiu       $16, $4, 0x8
/* 0E4AD0 001E49D0 9085070C */  jal         GetStackInt__FP12RS_STACKDATA__3
/* 0E4AD4 001E49D4 00000000 */   nop
/* 0E4AD8 001E49D8 E09C848F */  lw          $4, -0x6320($28)
/* 0E4ADC 001E49DC 10350324 */  addiu       $3, $0, 0x3510
/* 0E4AE0 001E49E0 18104300 */  mult        $2, $2, $3
/* 0E4AE4 001E49E4 21104400 */  addu        $2, $2, $4
/* 0E4AE8 001E49E8 0200013C */  lui         $1, (0x20000 >> 16)
/* 0E4AEC 001E49EC 21084100 */  addu        $1, $2, $1
/* 0E4AF0 001E49F0 C0FF2CC4 */  lwc1        $f12, -0x40($1)
/* 0E4AF4 001E49F4 28260072 */  paddub      $4, $16, $0
/* 0E4AF8 001E49F8 BC85070C */  jal         SetStack__FP12RS_STACKDATAf__3
/* 0E4AFC 001E49FC 00000000 */   nop
/* 0E4B00 001E4A00 01000224 */  addiu       $2, $0, 0x1
/* 0E4B04 001E4A04 1000BF7B */  lq          $31, 0x10($29)
/* 0E4B08 001E4A08 0000B07B */  lq          $16, 0x0($29)
/* 0E4B0C 001E4A0C 2000BD27 */  addiu       $29, $29, 0x20
/* 0E4B10 001E4A10 0800E003 */  jr          $31
/* 0E4B14 001E4A14 00000000 */   nop
/* 0E4B18 001E4A18 00000000 */  nop
/* 0E4B1C 001E4A1C 00000000 */  nop
