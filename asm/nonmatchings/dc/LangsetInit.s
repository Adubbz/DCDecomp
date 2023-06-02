.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LangsetInit__Fv
/* 144C30 00244B30 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 144C34 00244B34 0000BF7F */  sq         $31, 0x0($sp)
/* 144C38 00244B38 6496040C */  jal        InitializeDataBuffer__Fv
/* 144C3C 00244B3C 00000000 */   nop
/* 144C40 00244B40 2B00023C */  lui        $2, %hi(VisualData)
/* 144C44 00244B44 10B04424 */  addiu      $4, $2, %lo(VisualData)
/* 144C48 00244B48 0300023C */  lui        $2, (0x30D40 >> 16)
/* 144C4C 00244B4C 400D4534 */  ori        $5, $2, (0x30D40 & 0xFFFF)
/* 144C50 00244B50 A496040C */  jal        SetDataBuffer__FP14CDataAlloc2_1_i
/* 144C54 00244B54 00000000 */   nop
/* 144C58 00244B58 2B00023C */  lui        $2, %hi(MotionData)
/* 144C5C 00244B5C 20B04424 */  addiu      $4, $2, %lo(MotionData)
/* 144C60 00244B60 0700023C */  lui        $2, (0x7A120 >> 16)
/* 144C64 00244B64 20A14534 */  ori        $5, $2, (0x7A120 & 0xFFFF)
/* 144C68 00244B68 A496040C */  jal        SetDataBuffer__FP14CDataAlloc2_1_i
/* 144C6C 00244B6C 00000000 */   nop
/* 144C70 00244B70 2B00023C */  lui        $2, %hi(TextureData)
/* 144C74 00244B74 30B04424 */  addiu      $4, $2, %lo(TextureData)
/* 144C78 00244B78 0400023C */  lui        $2, (0x493E0 >> 16)
/* 144C7C 00244B7C E0934534 */  ori        $5, $2, (0x493E0 & 0xFFFF)
/* 144C80 00244B80 A496040C */  jal        SetDataBuffer__FP14CDataAlloc2_1_i
/* 144C84 00244B84 00000000 */   nop
/* 144C88 00244B88 409C0434 */  ori        $4, $0, 0x9C40
/* 144C8C 00244B8C 0400023C */  lui        $2, (0x493E0 >> 16)
/* 144C90 00244B90 E0934534 */  ori        $5, $2, (0x493E0 & 0xFFFF)
/* 144C94 00244B94 B896040C */  jal        SetPacketReadBuffer__Fii
/* 144C98 00244B98 00000000 */   nop
/* 144C9C 00244B9C 00608044 */  mtc1       $0, $f12
/* 144CA0 00244BA0 0043023C */  lui        $2, (0x43000000 >> 16)
/* 144CA4 00244BA4 00788244 */  mtc1       $2, $f15
/* 144CA8 00244BA8 46630046 */  mov.s      $f13, $f12
/* 144CAC 00244BAC 86630046 */  mov.s      $f14, $f12
/* 144CB0 00244BB0 24B8040C */  jal        MGSetBGColor__Fffff
/* 144CB4 00244BB4 00000000 */   nop
/* 144CB8 00244BB8 2900023C */  lui        $2, %hi(_360_2)
/* 144CBC 00244BBC 30664524 */  addiu      $5, $2, %lo(_360_2)
/* 144CC0 00244BC0 1000A427 */  addiu      $4, $sp, 0x10
/* 144CC4 00244BC4 03000324 */  addiu      $3, $0, 0x3
.L00244BC8:
/* 144CC8 00244BC8 0000A278 */  lq         $2, 0x0($5)
/* 144CCC 00244BCC 1000A524 */  addiu      $5, $5, 0x10
/* 144CD0 00244BD0 FFFF6324 */  addiu      $3, $3, -0x1
/* 144CD4 00244BD4 0000827C */  sq         $2, 0x0($4)
/* 144CD8 00244BD8 10008424 */  addiu      $4, $4, 0x10
/* 144CDC 00244BDC FAFF601C */  bgtz       $3, .L00244BC8
/* 144CE0 00244BE0 00000000 */   nop
/* 144CE4 00244BE4 0000A3DC */  ld         $3, 0x0($5)
/* 144CE8 00244BE8 0800A2C4 */  lwc1       $f2, 0x8($5)
/* 144CEC 00244BEC 000083FC */  sd         $3, 0x0($4)
/* 144CF0 00244BF0 080082E4 */  swc1       $f2, 0x8($4)
/* 144CF4 00244BF4 C701023C */  lui        $2, %hi(TexManager)
/* 144CF8 00244BF8 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 144CFC 00244BFC E03F0524 */  addiu      $5, $0, 0x3FE0
/* 144D00 00244C00 F0C3040C */  jal        Initialize__15CTextureManagerFi
/* 144D04 00244C04 00000000 */   nop
/* 144D08 00244C08 C701023C */  lui        $2, %hi(TexManager)
/* 144D0C 00244C0C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 144D10 00244C10 FFFF0524 */  addiu      $5, $0, -0x1
/* 144D14 00244C14 1000A627 */  addiu      $6, $sp, 0x10
/* 144D18 00244C18 948B878F */  lw         $7, -0x746C($gp)
/* 144D1C 00244C1C 58CF040C */  jal        LoadTextureBlock__15CTextureManagerFiP16LOADTEXTURE_INFOPUi
/* 144D20 00244C20 00000000 */   nop
/* 144D24 00244C24 CC01023C */  lui        $2, %hi(GamePad)
/* 144D28 00244C28 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 144D2C 00244C2C 00500524 */  addiu      $5, $0, 0x5000
/* 144D30 00244C30 1E000624 */  addiu      $6, $0, 0x1E
/* 144D34 00244C34 09000724 */  addiu      $7, $0, 0x9
/* 144D38 00244C38 58AD040C */  jal        SetAutoRepeat__8CGamePadFiii
/* 144D3C 00244C3C 00000000 */   nop
/* 144D40 00244C40 CC01023C */  lui        $2, %hi(GamePad)
/* 144D44 00244C44 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 144D48 00244C48 78000524 */  addiu      $5, $0, 0x78
/* 144D4C 00244C4C 48AE040C */  jal        MenuModeOn__8CGamePadFi
/* 144D50 00244C50 00000000 */   nop
/* 144D54 00244C54 E89780AF */  sw         $0, -0x6818($gp)
/* 144D58 00244C58 EC9780AF */  sw         $0, -0x6814($gp)
/* 144D5C 00244C5C F09780AF */  sw         $0, -0x6810($gp)
/* 144D60 00244C60 0000BF7B */  lq         $31, 0x0($sp)
/* 144D64 00244C64 5000BD27 */  addiu      $sp, $sp, 0x50
/* 144D68 00244C68 0800E003 */  jr         $31
/* 144D6C 00244C6C 00000000 */   nop
