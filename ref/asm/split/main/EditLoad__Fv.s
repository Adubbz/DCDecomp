.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EditLoad__Fv
/* 077D80 00177C80 F0FFBD27 */  addiu       $29, $29, -0x10
/* 077D84 00177C84 0000BF7F */  sq          $31, 0x0($29)
/* 077D88 00177C88 288D828F */  lw          $2, -0x72D8($28)
/* 077D8C 00177C8C 05004128 */  slti        $1, $2, 0x5
/* 077D90 00177C90 0D002010 */  beqz        $1, .L00177CC8
/* 077D94 00177C94 00000000 */   nop
/* 077D98 00177C98 D201023C */  lui         $2, %hi(EditPartsInfo)
/* 077D9C 00177C9C F09B4424 */  addiu       $4, $2, %lo(EditPartsInfo)
/* 077DA0 00177CA0 2090858F */  lw          $5, -0x6FE0($28)
/* 077DA4 00177CA4 1C8D868F */  lw          $6, -0x72E4($28)
/* 077DA8 00177CA8 283E0070 */  paddub      $7, $0, $0
/* 077DAC 00177CAC FC68060C */  jal         Load__14CEditPartsInfoFiP9CSaveDatai
/* 077DB0 00177CB0 00000000 */   nop
/* 077DB4 00177CB4 E890848F */  lw          $4, -0x6F18($28)
/* 077DB8 00177CB8 2090858F */  lw          $5, -0x6FE0($28)
/* 077DBC 00177CBC 1C8D868F */  lw          $6, -0x72E4($28)
/* 077DC0 00177CC0 8493060C */  jal         Load__11CEditGroundFiP9CSaveData
/* 077DC4 00177CC4 00000000 */   nop
.L00177CC8:
/* 077DC8 00177CC8 6CF7050C */  jal         EditPartsObjectOnOff__Fv
/* 077DCC 00177CCC 00000000 */   nop
/* 077DD0 00177CD0 E890848F */  lw          $4, -0x6F18($28)
/* 077DD4 00177CD4 048B060C */  jal         MakePartsBox__11CEditGroundFv
/* 077DD8 00177CD8 00000000 */   nop
/* 077DDC 00177CDC 1C8D848F */  lw          $4, -0x72E4($28)
/* 077DE0 00177CE0 F45E050C */  jal         GetNowTime__9CSaveDataFv
/* 077DE4 00177CE4 00000000 */   nop
/* 077DE8 00177CE8 C842023C */  lui         $2, (0x42C80000 >> 16)
/* 077DEC 00177CEC 00088244 */  mtc1        $2, $f1
/* 077DF0 00177CF0 00000000 */  nop
/* 077DF4 00177CF4 020B0046 */  mul.s       $f12, $f1, $f0
/* 077DF8 00177CF8 2C44040C */  jal         fptosi
/* 077DFC 00177CFC 00000000 */   nop
/* 077E00 00177D00 B0040324 */  addiu       $3, $0, 0x4B0
/* 077E04 00177D04 1A004300 */  div         $0, $2, $3
/* 077E08 00177D08 00000000 */  nop
/* 077E0C 00177D0C 00000000 */  nop
/* 077E10 00177D10 10180000 */  mfhi        $3
/* 077E14 00177D14 00008344 */  mtc1        $3, $f0
/* 077E18 00177D18 00000000 */  nop
/* 077E1C 00177D1C 60008046 */  cvt.s.w     $f1, $f0
/* 077E20 00177D20 CC8080C7 */  lwc1        $f0, -0x7F34($28)
/* 077E24 00177D24 02000146 */  mul.s       $f0, $f0, $f1
/* 077E28 00177D28 049180E7 */  swc1        $f0, -0x6EFC($28)
/* 077E2C 00177D2C 0000BF7B */  lq          $31, 0x0($29)
/* 077E30 00177D30 1000BD27 */  addiu       $29, $29, 0x10
/* 077E34 00177D34 0800E003 */  jr          $31
/* 077E38 00177D38 00000000 */   nop
/* 077E3C 00177D3C 00000000 */  nop
