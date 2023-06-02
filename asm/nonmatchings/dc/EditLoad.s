.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EditLoad__Fv
/* 77D80 00177C80 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 77D84 00177C84 0000BF7F */  sq         $31, 0x0($sp)
/* 77D88 00177C88 288D828F */  lw         $2, -0x72D8($gp)
/* 77D8C 00177C8C 05004128 */  slti       $at, $2, 0x5
/* 77D90 00177C90 0D002010 */  beqz       $at, .L00177CC8
/* 77D94 00177C94 00000000 */   nop
/* 77D98 00177C98 D201023C */  lui        $2, %hi(EditPartsInfo)
/* 77D9C 00177C9C F09B4424 */  addiu      $4, $2, %lo(EditPartsInfo)
/* 77DA0 00177CA0 2090858F */  lw         $5, -0x6FE0($gp)
/* 77DA4 00177CA4 1C8D868F */  lw         $6, -0x72E4($gp)
/* 77DA8 00177CA8 283E0070 */  paddub     $7, $0, $0
/* 77DAC 00177CAC FC68060C */  jal        Load__14CEditPartsInfoFiP9CSaveDatai
/* 77DB0 00177CB0 00000000 */   nop
/* 77DB4 00177CB4 E890848F */  lw         $4, -0x6F18($gp)
/* 77DB8 00177CB8 2090858F */  lw         $5, -0x6FE0($gp)
/* 77DBC 00177CBC 1C8D868F */  lw         $6, -0x72E4($gp)
/* 77DC0 00177CC0 8493060C */  jal        Load__11CEditGroundFiP9CSaveData
/* 77DC4 00177CC4 00000000 */   nop
.L00177CC8:
/* 77DC8 00177CC8 6CF7050C */  jal        EditPartsObjectOnOff__Fv
/* 77DCC 00177CCC 00000000 */   nop
/* 77DD0 00177CD0 E890848F */  lw         $4, -0x6F18($gp)
/* 77DD4 00177CD4 048B060C */  jal        MakePartsBox__11CEditGroundFv
/* 77DD8 00177CD8 00000000 */   nop
/* 77DDC 00177CDC 1C8D848F */  lw         $4, -0x72E4($gp)
/* 77DE0 00177CE0 F45E050C */  jal        GetNowTime__9CSaveDataFv
/* 77DE4 00177CE4 00000000 */   nop
/* 77DE8 00177CE8 C842023C */  lui        $2, (0x42C80000 >> 16)
/* 77DEC 00177CEC 00088244 */  mtc1       $2, $f1
/* 77DF0 00177CF0 00000000 */  nop
/* 77DF4 00177CF4 020B0046 */  mul.s      $f12, $f1, $f0
/* 77DF8 00177CF8 2C44040C */  jal        fptosi
/* 77DFC 00177CFC 00000000 */   nop
/* 77E00 00177D00 B0040324 */  addiu      $3, $0, 0x4B0
/* 77E04 00177D04 1A004300 */  div        $0, $2, $3
/* 77E08 00177D08 00000000 */  nop
/* 77E0C 00177D0C 00000000 */  nop
/* 77E10 00177D10 10180000 */  mfhi       $3
/* 77E14 00177D14 00008344 */  mtc1       $3, $f0
/* 77E18 00177D18 00000000 */  nop
/* 77E1C 00177D1C 60008046 */  cvt.s.w    $f1, $f0
/* 77E20 00177D20 CC8080C7 */  lwc1       $f0, -0x7F34($gp)
/* 77E24 00177D24 02000146 */  mul.s      $f0, $f0, $f1
/* 77E28 00177D28 049180E7 */  swc1       $f0, -0x6EFC($gp)
/* 77E2C 00177D2C 0000BF7B */  lq         $31, 0x0($sp)
/* 77E30 00177D30 1000BD27 */  addiu      $sp, $sp, 0x10
/* 77E34 00177D34 0800E003 */  jr         $31
/* 77E38 00177D38 00000000 */   nop
/* 77E3C 00177D3C 00000000 */  nop
