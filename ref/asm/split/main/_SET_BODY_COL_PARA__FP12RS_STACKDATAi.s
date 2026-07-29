.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_BODY_COL_PARA__FP12RS_STACKDATAi
/* 0E3DA0 001E3CA0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 0E3DA4 001E3CA4 2000BF7F */  sq          $31, 0x20($29)
/* 0E3DA8 001E3CA8 1000B17F */  sq          $17, 0x10($29)
/* 0E3DAC 001E3CAC 0000B07F */  sq          $16, 0x0($29)
/* 0E3DB0 001E3CB0 08009124 */  addiu       $17, $4, 0x8
/* 0E3DB4 001E3CB4 9085070C */  jal         GetStackInt__FP12RS_STACKDATA__3
/* 0E3DB8 001E3CB8 00000000 */   nop
/* 0E3DBC 001E3CBC 28864070 */  paddub      $16, $2, $0
/* 0E3DC0 001E3CC0 28262072 */  paddub      $4, $17, $0
/* 0E3DC4 001E3CC4 9085070C */  jal         GetStackInt__FP12RS_STACKDATA__3
/* 0E3DC8 001E3CC8 00000000 */   nop
/* 0E3DCC 001E3CCC E09C858F */  lw          $5, -0x6320($28)
/* 0E3DD0 001E3CD0 9000A68C */  lw          $6, 0x90($5)
/* 0E3DD4 001E3CD4 8094878F */  lw          $7, -0x6B80($28)
/* 0E3DD8 001E3CD8 FFFF0324 */  addiu       $3, $0, -0x1
/* 0E3DDC 001E3CDC 0400E314 */  bne         $7, $3, .L001E3CF0
/* 0E3DE0 001E3CE0 00000000 */   nop
/* 0E3DE4 001E3CE4 01000224 */  addiu       $2, $0, 0x1
/* 0E3DE8 001E3CE8 28000010 */  b           .L001E3D8C
/* 0E3DEC 001E3CEC 00000000 */   nop
.L001E3CF0:
/* 0E3DF0 001E3CF0 0A00012A */  slti        $1, $16, 0xA
/* 0E3DF4 001E3CF4 10002010 */  beqz        $1, .L001E3D38
/* 0E3DF8 001E3CF8 00000000 */   nop
/* 0E3DFC 001E3CFC C0180600 */  sll         $3, $6, 3
/* 0E3E00 001E3D00 21206600 */  addu        $4, $3, $6
/* 0E3E04 001E3D04 C0180400 */  sll         $3, $4, 3
/* 0E3E08 001E3D08 21188300 */  addu        $3, $4, $3
/* 0E3E0C 001E3D0C 00190300 */  sll         $3, $3, 4
/* 0E3E10 001E3D10 21206500 */  addu        $4, $3, $5
/* 0E3E14 001E3D14 80180700 */  sll         $3, $7, 2
/* 0E3E18 001E3D18 21186700 */  addu        $3, $3, $7
/* 0E3E1C 001E3D1C 80180300 */  sll         $3, $3, 2
/* 0E3E20 001E3D20 21206400 */  addu        $4, $3, $4
/* 0E3E24 001E3D24 80181000 */  sll         $3, $16, 2
/* 0E3E28 001E3D28 21186400 */  addu        $3, $3, $4
/* 0E3E2C 001E3D2C 0500013C */  lui         $1, (0x55490 >> 16)
/* 0E3E30 001E3D30 21086100 */  addu        $1, $3, $1
/* 0E3E34 001E3D34 905422AC */  sw          $2, (0x55490 & 0xFFFF)($1)
.L001E3D38:
/* 0E3E38 001E3D38 0A00032A */  slti        $3, $16, 0xA
/* 0E3E3C 001E3D3C 12006014 */  bnez        $3, .L001E3D88
/* 0E3E40 001E3D40 00000000 */   nop
/* 0E3E44 001E3D44 E09C858F */  lw          $5, -0x6320($28)
/* 0E3E48 001E3D48 C0180600 */  sll         $3, $6, 3
/* 0E3E4C 001E3D4C 21206600 */  addu        $4, $3, $6
/* 0E3E50 001E3D50 C0180400 */  sll         $3, $4, 3
/* 0E3E54 001E3D54 21188300 */  addu        $3, $4, $3
/* 0E3E58 001E3D58 00190300 */  sll         $3, $3, 4
/* 0E3E5C 001E3D5C 21286500 */  addu        $5, $3, $5
/* 0E3E60 001E3D60 8094848F */  lw          $4, -0x6B80($28)
/* 0E3E64 001E3D64 40180400 */  sll         $3, $4, 1
/* 0E3E68 001E3D68 21186400 */  addu        $3, $3, $4
/* 0E3E6C 001E3D6C C0180300 */  sll         $3, $3, 3
/* 0E3E70 001E3D70 21206500 */  addu        $4, $3, $5
/* 0E3E74 001E3D74 80181000 */  sll         $3, $16, 2
/* 0E3E78 001E3D78 21186400 */  addu        $3, $3, $4
/* 0E3E7C 001E3D7C 0500013C */  lui         $1, (0x555A8 >> 16)
/* 0E3E80 001E3D80 21086100 */  addu        $1, $3, $1
/* 0E3E84 001E3D84 A85522AC */  sw          $2, (0x555A8 & 0xFFFF)($1)
.L001E3D88:
/* 0E3E88 001E3D88 01000224 */  addiu       $2, $0, 0x1
.L001E3D8C:
/* 0E3E8C 001E3D8C 2000BF7B */  lq          $31, 0x20($29)
/* 0E3E90 001E3D90 1000B17B */  lq          $17, 0x10($29)
/* 0E3E94 001E3D94 0000B07B */  lq          $16, 0x0($29)
/* 0E3E98 001E3D98 3000BD27 */  addiu       $29, $29, 0x30
/* 0E3E9C 001E3D9C 0800E003 */  jr          $31
/* 0E3EA0 001E3DA0 00000000 */   nop
/* 0E3EA4 001E3DA4 00000000 */  nop
/* 0E3EA8 001E3DA8 00000000 */  nop
/* 0E3EAC 001E3DAC 00000000 */  nop
