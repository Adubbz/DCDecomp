.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CharaChangeInitToGL2__Fi
/* 10E9B0 0020E8B0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 10E9B4 0020E8B4 0000BF7F */  sq         $31, 0x0($sp)
/* 10E9B8 0020E8B8 FC95828F */  lw         $2, -0x6A04($gp)
/* 10E9BC 0020E8BC 109682AF */  sw         $2, -0x69F0($gp)
/* 10E9C0 0020E8C0 12008010 */  beqz       $4, .L0020E90C
/* 10E9C4 0020E8C4 00000000 */   nop
/* 10E9C8 0020E8C8 1096848F */  lw         $4, -0x69F0($gp)
/* 10E9CC 0020E8CC 00AF080C */  jal        MenuCalcBufAlignment__FP1
/* 10E9D0 0020E8D0 00000000 */   nop
/* 10E9D4 0020E8D4 109682AF */  sw         $2, -0x69F0($gp)
/* 10E9D8 0020E8D8 1096858F */  lw         $5, -0x69F0($gp)
/* 10E9DC 0020E8DC 2A00023C */  lui        $2, %hi(_1242)
/* 10E9E0 0020E8E0 38E14424 */  addiu      $4, $2, %lo(_1242)
/* 10E9E4 0020E8E4 ACAE080C */  jal        LoadFileBGMenuData__FPcP1
/* 10E9E8 0020E8E8 00000000 */   nop
/* 10E9EC 0020E8EC 1C00A2AF */  sw         $2, 0x1C($sp)
/* 10E9F0 0020E8F0 1C00A28F */  lw         $2, 0x1C($sp)
/* 10E9F4 0020E8F4 03110200 */  sra        $2, $2, 4
/* 10E9F8 0020E8F8 00190200 */  sll        $3, $2, 4
/* 10E9FC 0020E8FC 1096828F */  lw         $2, -0x69F0($gp)
/* 10EA00 0020E900 21104300 */  addu       $2, $2, $3
/* 10EA04 0020E904 10004224 */  addiu      $2, $2, 0x10
/* 10EA08 0020E908 109682AF */  sw         $2, -0x69F0($gp)
.L0020E90C:
/* 10EA0C 0020E90C 1096828F */  lw         $2, -0x69F0($gp)
/* 10EA10 0020E910 149682AF */  sw         $2, -0x69EC($gp)
/* 10EA14 0020E914 1496848F */  lw         $4, -0x69EC($gp)
/* 10EA18 0020E918 00AF080C */  jal        MenuCalcBufAlignment__FP1
/* 10EA1C 0020E91C 00000000 */   nop
/* 10EA20 0020E920 149682AF */  sw         $2, -0x69EC($gp)
/* 10EA24 0020E924 F8958487 */  lh         $4, -0x6A08($gp)
/* 10EA28 0020E928 1496858F */  lw         $5, -0x69EC($gp)
/* 10EA2C 0020E92C 1C00A627 */  addiu      $6, $sp, 0x1C
/* 10EA30 0020E930 206D050C */  jal        SndVoiceLoadBG__FiPUiPi
/* 10EA34 0020E934 00000000 */   nop
/* 10EA38 0020E938 05004014 */  bnez       $2, .L0020E950
/* 10EA3C 0020E93C 00000000 */   nop
/* 10EA40 0020E940 2A00023C */  lui        $2, %hi(_1243)
/* 10EA44 0020E944 50E14424 */  addiu      $4, $2, %lo(_1243)
/* 10EA48 0020E948 A611040C */  jal        printf
/* 10EA4C 0020E94C 00000000 */   nop
.L0020E950:
/* 10EA50 0020E950 0000BF7B */  lq         $31, 0x0($sp)
/* 10EA54 0020E954 2000BD27 */  addiu      $sp, $sp, 0x20
/* 10EA58 0020E958 0800E003 */  jr         $31
/* 10EA5C 0020E95C 00000000 */   nop
