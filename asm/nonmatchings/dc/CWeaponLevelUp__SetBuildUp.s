.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetBuildUp__14CWeaponLevelUpFP11WEAPON_HAVEP10CCharacterP1i
/* 136D30 00236C30 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 136D34 00236C34 3000BF7F */  sq         $31, 0x30($sp)
/* 136D38 00236C38 2000B27F */  sq         $18, 0x20($sp)
/* 136D3C 00236C3C 1000B17F */  sq         $17, 0x10($sp)
/* 136D40 00236C40 0000B07F */  sq         $16, 0x0($sp)
/* 136D44 00236C44 28968070 */  paddub     $18, $4, $0
/* 136D48 00236C48 288EA070 */  paddub     $17, $5, $0
/* 136D4C 00236C4C 2886C070 */  paddub     $16, $6, $0
/* 136D50 00236C50 23002012 */  beqz       $17, .L00236CE0
/* 136D54 00236C54 00000000 */   nop
/* 136D58 00236C58 041348A6 */  sh         $8, 0x1304($18)
/* 136D5C 00236C5C 02000224 */  addiu      $2, $0, 0x2
/* 136D60 00236C60 021342A6 */  sh         $2, 0x1302($18)
/* 136D64 00236C64 07000224 */  addiu      $2, $0, 0x7
/* 136D68 00236C68 141342A6 */  sh         $2, 0x1314($18)
/* 136D6C 00236C6C DC1240A6 */  sh         $0, 0x12DC($18)
/* 136D70 00236C70 02134686 */  lh         $6, 0x1302($18)
/* 136D74 00236C74 282EE070 */  paddub     $5, $7, $0
/* 136D78 00236C78 00D8080C */  jal        CMenuEffectDataLoad__14CWeaponLevelUpFP1i
/* 136D7C 00236C7C 00000000 */   nop
/* 136D80 00236C80 D81250AE */  sw         $16, 0x12D8($18)
/* 136D84 00236C84 D41251AE */  sw         $17, 0x12D4($18)
/* 136D88 00236C88 28264072 */  paddub     $4, $18, $0
/* 136D8C 00236C8C D412458E */  lw         $5, 0x12D4($18)
/* 136D90 00236C90 F8000624 */  addiu      $6, $0, 0xF8
/* 136D94 00236C94 EC0C040C */  jal        memcpy
/* 136D98 00236C98 00000000 */   nop
/* 136D9C 00236C9C DE124586 */  lh         $5, 0x12DE($18)
/* 136DA0 00236CA0 28264072 */  paddub     $4, $18, $0
/* 136DA4 00236CA4 C8D4080C */  jal        SetWeaponBuildValue__FP11WEAPON_HAVEi
/* 136DA8 00236CA8 00000000 */   nop
/* 136DAC 00236CAC 00002486 */  lh         $4, 0x0($17)
/* 136DB0 00236CB0 16010324 */  addiu      $3, $0, 0x116
/* 136DB4 00236CB4 04008310 */  beq        $4, $3, .L00236CC8
/* 136DB8 00236CB8 00000000 */   nop
/* 136DBC 00236CBC 17010324 */  addiu      $3, $0, 0x117
/* 136DC0 00236CC0 07008314 */  bne        $4, $3, .L00236CE0
/* 136DC4 00236CC4 00000000 */   nop
.L00236CC8:
/* 136DC8 00236CC8 DCC4070C */  jal        ClearFishMardanGarayanNum__Fv
/* 136DCC 00236CCC 00000000 */   nop
/* 136DD0 00236CD0 2A00023C */  lui        $2, %hi(_1019)
/* 136DD4 00236CD4 10F44424 */  addiu      $4, $2, %lo(_1019)
/* 136DD8 00236CD8 A611040C */  jal        printf
/* 136DDC 00236CDC 00000000 */   nop
.L00236CE0:
/* 136DE0 00236CE0 3000BF7B */  lq         $31, 0x30($sp)
/* 136DE4 00236CE4 2000B27B */  lq         $18, 0x20($sp)
/* 136DE8 00236CE8 1000B17B */  lq         $17, 0x10($sp)
/* 136DEC 00236CEC 0000B07B */  lq         $16, 0x0($sp)
/* 136DF0 00236CF0 4000BD27 */  addiu      $sp, $sp, 0x40
/* 136DF4 00236CF4 0800E003 */  jr         $31
/* 136DF8 00236CF8 00000000 */   nop
/* 136DFC 00236CFC 00000000 */  nop
