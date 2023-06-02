.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SaveMenuKeyLoad__Fv
/* 121D30 00221C30 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 121D34 00221C34 1000BF7F */  sq         $31, 0x10($sp)
/* 121D38 00221C38 0000B07F */  sq         $16, 0x0($sp)
/* 121D3C 00221C3C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 121D40 00221C40 8082238C */  lw         $3, -0x7D80($at)
/* 121D44 00221C44 C0100300 */  sll        $2, $3, 3
/* 121D48 00221C48 21104300 */  addu       $2, $2, $3
/* 121D4C 00221C4C 80180200 */  sll        $3, $2, 2
/* 121D50 00221C50 DB01023C */  lui        $2, %hi(McAccess)
/* 121D54 00221C54 80824224 */  addiu      $2, $2, %lo(McAccess)
/* 121D58 00221C58 21104300 */  addu       $2, $2, $3
/* 121D5C 00221C5C D4045024 */  addiu      $16, $2, 0x4D4
/* 121D60 00221C60 28260072 */  paddub     $4, $16, $0
/* 121D64 00221C64 545B080C */  jal        McCheckMCPs2__FP12MC_CARD_INFO
/* 121D68 00221C68 00000000 */   nop
/* 121D6C 00221C6C 09004014 */  bnez       $2, .L00221C94
/* 121D70 00221C70 00000000 */   nop
/* 121D74 00221C74 0E000224 */  addiu      $2, $0, 0xE
/* 121D78 00221C78 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 121D7C 00221C7C D48A22AC */  sw         $2, -0x752C($at)
/* 121D80 00221C80 01000224 */  addiu      $2, $0, 0x1
/* 121D84 00221C84 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 121D88 00221C88 F08A22AC */  sw         $2, -0x7510($at)
/* 121D8C 00221C8C 1A000010 */  b          .L00221CF8
/* 121D90 00221C90 00000000 */   nop
.L00221C94:
/* 121D94 00221C94 2000028E */  lw         $2, 0x20($16)
/* 121D98 00221C98 0A004104 */  bgez       $2, .L00221CC4
/* 121D9C 00221C9C 00000000 */   nop
/* 121DA0 00221CA0 0E000224 */  addiu      $2, $0, 0xE
/* 121DA4 00221CA4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 121DA8 00221CA8 D48A22AC */  sw         $2, -0x752C($at)
/* 121DAC 00221CAC 06000224 */  addiu      $2, $0, 0x6
/* 121DB0 00221CB0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 121DB4 00221CB4 F08A22AC */  sw         $2, -0x7510($at)
/* 121DB8 00221CB8 01000224 */  addiu      $2, $0, 0x1
/* 121DBC 00221CBC 0E000010 */  b          .L00221CF8
/* 121DC0 00221CC0 00000000 */   nop
.L00221CC4:
/* 121DC4 00221CC4 DB01023C */  lui        $2, %hi(McAccess)
/* 121DC8 00221CC8 80824424 */  addiu      $4, $2, %lo(McAccess)
/* 121DCC 00221CCC 06000524 */  addiu      $5, $0, 0x6
/* 121DD0 00221CD0 E44E080C */  jal        SetFuncNo__17CMemoryCardAccessFi
/* 121DD4 00221CD4 00000000 */   nop
/* 121DD8 00221CD8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 121DDC 00221CDC DC8A228C */  lw         $2, -0x7524($at)
/* 121DE0 00221CE0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 121DE4 00221CE4 848222AC */  sw         $2, -0x7D7C($at)
/* 121DE8 00221CE8 07000224 */  addiu      $2, $0, 0x7
/* 121DEC 00221CEC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 121DF0 00221CF0 D48A22AC */  sw         $2, -0x752C($at)
/* 121DF4 00221CF4 01000224 */  addiu      $2, $0, 0x1
.L00221CF8:
/* 121DF8 00221CF8 1000BF7B */  lq         $31, 0x10($sp)
/* 121DFC 00221CFC 0000B07B */  lq         $16, 0x0($sp)
/* 121E00 00221D00 2000BD27 */  addiu      $sp, $sp, 0x20
/* 121E04 00221D04 0800E003 */  jr         $31
/* 121E08 00221D08 00000000 */   nop
/* 121E0C 00221D0C 00000000 */  nop
