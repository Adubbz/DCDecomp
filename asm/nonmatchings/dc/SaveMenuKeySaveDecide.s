.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SaveMenuKeySaveDecide__Fv
/* 1219A0 002218A0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 1219A4 002218A4 1000BF7F */  sq         $31, 0x10($sp)
/* 1219A8 002218A8 0000B07F */  sq         $16, 0x0($sp)
/* 1219AC 002218AC CC01023C */  lui        $2, %hi(GamePad)
/* 1219B0 002218B0 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 1219B4 002218B4 40000524 */  addiu      $5, $0, 0x40
/* 1219B8 002218B8 1CAE040C */  jal        Down__8CGamePadFi
/* 1219BC 002218BC 00000000 */   nop
/* 1219C0 002218C0 17004010 */  beqz       $2, .L00221920
/* 1219C4 002218C4 00000000 */   nop
/* 1219C8 002218C8 DB01023C */  lui        $2, %hi(McAccess)
/* 1219CC 002218CC 80824424 */  addiu      $4, $2, %lo(McAccess)
/* 1219D0 002218D0 282E0070 */  paddub     $5, $0, $0
/* 1219D4 002218D4 E44E080C */  jal        SetFuncNo__17CMemoryCardAccessFi
/* 1219D8 002218D8 00000000 */   nop
/* 1219DC 002218DC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 1219E0 002218E0 DC8A308C */  lw         $16, -0x7524($at)
/* 1219E4 002218E4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 1219E8 002218E8 848230AC */  sw         $16, -0x7D7C($at)
/* 1219EC 002218EC 1C8D848F */  lw         $4, -0x72E4($gp)
/* 1219F0 002218F0 CC5E050C */  jal        GetConfigData__9CSaveDataFv
/* 1219F4 002218F4 00000000 */   nop
/* 1219F8 002218F8 440050AC */  sw         $16, 0x44($2)
/* 1219FC 002218FC 0A000224 */  addiu      $2, $0, 0xA
/* 121A00 00221900 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 121A04 00221904 D48A22AC */  sw         $2, -0x752C($at)
/* 121A08 00221908 01000424 */  addiu      $4, $0, 0x1
/* 121A0C 0022190C BCB3080C */  jal        ComMenuSePlay__Fi
/* 121A10 00221910 00000000 */   nop
/* 121A14 00221914 01000224 */  addiu      $2, $0, 0x1
/* 121A18 00221918 14000010 */  b          .L0022196C
/* 121A1C 0022191C 00000000 */   nop
.L00221920:
/* 121A20 00221920 CC01023C */  lui        $2, %hi(GamePad)
/* 121A24 00221924 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 121A28 00221928 20000524 */  addiu      $5, $0, 0x20
/* 121A2C 0022192C 1CAE040C */  jal        Down__8CGamePadFi
/* 121A30 00221930 00000000 */   nop
/* 121A34 00221934 0C004010 */  beqz       $2, .L00221968
/* 121A38 00221938 00000000 */   nop
/* 121A3C 0022193C 07000224 */  addiu      $2, $0, 0x7
/* 121A40 00221940 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 121A44 00221944 D48A22AC */  sw         $2, -0x752C($at)
/* 121A48 00221948 02000424 */  addiu      $4, $0, 0x2
/* 121A4C 0022194C BCB3080C */  jal        ComMenuSePlay__Fi
/* 121A50 00221950 00000000 */   nop
/* 121A54 00221954 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 121A58 00221958 F88A20AC */  sw         $0, -0x7508($at)
/* 121A5C 0022195C 01000224 */  addiu      $2, $0, 0x1
/* 121A60 00221960 02000010 */  b          .L0022196C
/* 121A64 00221964 00000000 */   nop
.L00221968:
/* 121A68 00221968 01000224 */  addiu      $2, $0, 0x1
.L0022196C:
/* 121A6C 0022196C 1000BF7B */  lq         $31, 0x10($sp)
/* 121A70 00221970 0000B07B */  lq         $16, 0x0($sp)
/* 121A74 00221974 2000BD27 */  addiu      $sp, $sp, 0x20
/* 121A78 00221978 0800E003 */  jr         $31
/* 121A7C 0022197C 00000000 */   nop
