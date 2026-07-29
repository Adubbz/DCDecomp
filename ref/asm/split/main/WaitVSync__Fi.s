.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel WaitVSync__Fi
/* 02D170 0012D070 E0FFBD27 */  addiu       $29, $29, -0x20
/* 02D174 0012D074 1000BF7F */  sq          $31, 0x10($29)
/* 02D178 0012D078 0000B07F */  sq          $16, 0x0($29)
/* 02D17C 0012D07C 28868070 */  paddub      $16, $4, $0
.L0012D080:
/* 02D180 0012D080 84B0040C */  jal         MGGetVSyncCount__Fv
/* 02D184 0012D084 00000000 */   nop
/* 02D188 0012D088 28260070 */  paddub      $4, $0, $0
/* 02D18C 0012D08C 04000010 */  b           .L0012D0A0
/* 02D190 0012D090 00000000 */   nop
.L0012D094:
/* 02D194 0012D094 23200400 */  negu        $4, $4
/* 02D198 0012D098 23200400 */  negu        $4, $4
/* 02D19C 0012D09C 01008424 */  addiu       $4, $4, 0x1
.L0012D0A0:
/* 02D1A0 0012D0A0 0A008328 */  slti        $3, $4, 0xA
/* 02D1A4 0012D0A4 FBFF6014 */  bnez        $3, .L0012D094
/* 02D1A8 0012D0A8 00000000 */   nop
/* 02D1AC 0012D0AC 0C000216 */  bne         $16, $2, .L0012D0E0
/* 02D1B0 0012D0B0 00000000 */   nop
/* 02D1B4 0012D0B4 281E0070 */  paddub      $3, $0, $0
/* 02D1B8 0012D0B8 04000010 */  b           .L0012D0CC
/* 02D1BC 0012D0BC 00000000 */   nop
.L0012D0C0:
/* 02D1C0 0012D0C0 23180300 */  negu        $3, $3
/* 02D1C4 0012D0C4 23180300 */  negu        $3, $3
/* 02D1C8 0012D0C8 01006324 */  addiu       $3, $3, 0x1
.L0012D0CC:
/* 02D1CC 0012D0CC 0A006228 */  slti        $2, $3, 0xA
/* 02D1D0 0012D0D0 FBFF4014 */  bnez        $2, .L0012D0C0
/* 02D1D4 0012D0D4 00000000 */   nop
/* 02D1D8 0012D0D8 E9FF0010 */  b           .L0012D080
/* 02D1DC 0012D0DC 00000000 */   nop
.L0012D0E0:
/* 02D1E0 0012D0E0 1000BF7B */  lq          $31, 0x10($29)
/* 02D1E4 0012D0E4 0000B07B */  lq          $16, 0x0($29)
/* 02D1E8 0012D0E8 2000BD27 */  addiu       $29, $29, 0x20
/* 02D1EC 0012D0EC 0800E003 */  jr          $31
/* 02D1F0 0012D0F0 00000000 */   nop
/* 02D1F4 0012D0F4 00000000 */  nop
/* 02D1F8 0012D0F8 00000000 */  nop
/* 02D1FC 0012D0FC 00000000 */  nop
