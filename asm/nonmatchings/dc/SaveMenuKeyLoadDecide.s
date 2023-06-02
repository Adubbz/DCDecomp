.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SaveMenuKeyLoadDecide__Fv
/* 121C30 00221B30 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 121C34 00221B34 0000BF7F */  sq         $31, 0x0($sp)
/* 121C38 00221B38 CC01023C */  lui        $2, %hi(GamePad)
/* 121C3C 00221B3C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 121C40 00221B40 40000524 */  addiu      $5, $0, 0x40
/* 121C44 00221B44 1CAE040C */  jal        Down__8CGamePadFi
/* 121C48 00221B48 00000000 */   nop
/* 121C4C 00221B4C 23004010 */  beqz       $2, .L00221BDC
/* 121C50 00221B50 00000000 */   nop
/* 121C54 00221B54 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 121C58 00221B58 DC8A238C */  lw         $3, -0x7524($at)
/* 121C5C 00221B5C C0100300 */  sll        $2, $3, 3
/* 121C60 00221B60 23104300 */  subu       $2, $2, $3
/* 121C64 00221B64 C0180200 */  sll        $3, $2, 3
/* 121C68 00221B68 DB01023C */  lui        $2, %hi(McAccess)
/* 121C6C 00221B6C 80824224 */  addiu      $2, $2, %lo(McAccess)
/* 121C70 00221B70 21104300 */  addu       $2, $2, $3
/* 121C74 00221B74 1C05428C */  lw         $2, 0x51C($2)
/* 121C78 00221B78 12004010 */  beqz       $2, .L00221BC4
/* 121C7C 00221B7C 00000000 */   nop
/* 121C80 00221B80 DB01023C */  lui        $2, %hi(McAccess)
/* 121C84 00221B84 80824424 */  addiu      $4, $2, %lo(McAccess)
/* 121C88 00221B88 282E0070 */  paddub     $5, $0, $0
/* 121C8C 00221B8C E44E080C */  jal        SetFuncNo__17CMemoryCardAccessFi
/* 121C90 00221B90 00000000 */   nop
/* 121C94 00221B94 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 121C98 00221B98 DC8A228C */  lw         $2, -0x7524($at)
/* 121C9C 00221B9C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 121CA0 00221BA0 848222AC */  sw         $2, -0x7D7C($at)
/* 121CA4 00221BA4 0D000224 */  addiu      $2, $0, 0xD
/* 121CA8 00221BA8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 121CAC 00221BAC D48A22AC */  sw         $2, -0x752C($at)
/* 121CB0 00221BB0 01000424 */  addiu      $4, $0, 0x1
/* 121CB4 00221BB4 BCB3080C */  jal        ComMenuSePlay__Fi
/* 121CB8 00221BB8 00000000 */   nop
/* 121CBC 00221BBC 04000010 */  b          .L00221BD0
/* 121CC0 00221BC0 00000000 */   nop
.L00221BC4:
/* 121CC4 00221BC4 02000424 */  addiu      $4, $0, 0x2
/* 121CC8 00221BC8 BCB3080C */  jal        ComMenuSePlay__Fi
/* 121CCC 00221BCC 00000000 */   nop
.L00221BD0:
/* 121CD0 00221BD0 01000224 */  addiu      $2, $0, 0x1
/* 121CD4 00221BD4 12000010 */  b          .L00221C20
/* 121CD8 00221BD8 00000000 */   nop
.L00221BDC:
/* 121CDC 00221BDC CC01023C */  lui        $2, %hi(GamePad)
/* 121CE0 00221BE0 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 121CE4 00221BE4 20000524 */  addiu      $5, $0, 0x20
/* 121CE8 00221BE8 1CAE040C */  jal        Down__8CGamePadFi
/* 121CEC 00221BEC 00000000 */   nop
/* 121CF0 00221BF0 0A004010 */  beqz       $2, .L00221C1C
/* 121CF4 00221BF4 00000000 */   nop
/* 121CF8 00221BF8 07000224 */  addiu      $2, $0, 0x7
/* 121CFC 00221BFC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 121D00 00221C00 D48A22AC */  sw         $2, -0x752C($at)
/* 121D04 00221C04 02000424 */  addiu      $4, $0, 0x2
/* 121D08 00221C08 BCB3080C */  jal        ComMenuSePlay__Fi
/* 121D0C 00221C0C 00000000 */   nop
/* 121D10 00221C10 01000224 */  addiu      $2, $0, 0x1
/* 121D14 00221C14 02000010 */  b          .L00221C20
/* 121D18 00221C18 00000000 */   nop
.L00221C1C:
/* 121D1C 00221C1C 01000224 */  addiu      $2, $0, 0x1
.L00221C20:
/* 121D20 00221C20 0000BF7B */  lq         $31, 0x0($sp)
/* 121D24 00221C24 1000BD27 */  addiu      $sp, $sp, 0x10
/* 121D28 00221C28 0800E003 */  jr         $31
/* 121D2C 00221C2C 00000000 */   nop
