.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SaveMenuKeyLoadConfig__Fv
/* 1215B0 002214B0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 1215B4 002214B4 0000BF7F */  sq         $31, 0x0($sp)
/* 1215B8 002214B8 DB01023C */  lui        $2, %hi(McAccess)
/* 1215BC 002214BC 80824424 */  addiu      $4, $2, %lo(McAccess)
/* 1215C0 002214C0 04000524 */  addiu      $5, $0, 0x4
/* 1215C4 002214C4 E44E080C */  jal        SetFuncNo__17CMemoryCardAccessFi
/* 1215C8 002214C8 00000000 */   nop
/* 1215CC 002214CC 07000224 */  addiu      $2, $0, 0x7
/* 1215D0 002214D0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 1215D4 002214D4 D48A22AC */  sw         $2, -0x752C($at)
/* 1215D8 002214D8 1C8D848F */  lw         $4, -0x72E4($gp)
/* 1215DC 002214DC CC5E050C */  jal        GetConfigData__9CSaveDataFv
/* 1215E0 002214E0 00000000 */   nop
/* 1215E4 002214E4 3800428C */  lw         $2, 0x38($2)
/* 1215E8 002214E8 03004010 */  beqz       $2, .L002214F8
/* 1215EC 002214EC 00000000 */   nop
/* 1215F0 002214F0 01000224 */  addiu      $2, $0, 0x1
/* 1215F4 002214F4 208D82AF */  sw         $2, -0x72E0($gp)
.L002214F8:
/* 1215F8 002214F8 1C8D848F */  lw         $4, -0x72E4($gp)
/* 1215FC 002214FC CC5E050C */  jal        GetConfigData__9CSaveDataFv
/* 121600 00221500 00000000 */   nop
/* 121604 00221504 4400428C */  lw         $2, 0x44($2)
/* 121608 00221508 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12160C 0022150C DC8A22AC */  sw         $2, -0x7524($at)
/* 121610 00221510 01000224 */  addiu      $2, $0, 0x1
/* 121614 00221514 0000BF7B */  lq         $31, 0x0($sp)
/* 121618 00221518 1000BD27 */  addiu      $sp, $sp, 0x10
/* 12161C 0022151C 0800E003 */  jr         $31
/* 121620 00221520 00000000 */   nop
/* 121624 00221524 00000000 */  nop
/* 121628 00221528 00000000 */  nop
/* 12162C 0022152C 00000000 */  nop
