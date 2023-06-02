.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawItemDataView__Fi
/* 12B8C0 0022B7C0 50FFBD27 */  addiu      $sp, $sp, -0xB0
/* 12B8C4 0022B7C4 2000BF7F */  sq         $31, 0x20($sp)
/* 12B8C8 0022B7C8 1000B17F */  sq         $17, 0x10($sp)
/* 12B8CC 0022B7CC 0000B07F */  sq         $16, 0x0($sp)
/* 12B8D0 0022B7D0 288E8070 */  paddub     $17, $4, $0
/* 12B8D4 0022B7D4 D894838F */  lw         $3, -0x6B28($gp)
/* 12B8D8 0022B7D8 01000224 */  addiu      $2, $0, 0x1
/* 12B8DC 0022B7DC 08006210 */  beq        $3, $2, .L0022B800
/* 12B8E0 0022B7E0 00000000 */   nop
/* 12B8E4 0022B7E4 03006010 */  beqz       $3, .L0022B7F4
/* 12B8E8 0022B7E8 00000000 */   nop
/* 12B8EC 0022B7EC 05000010 */  b          .L0022B804
/* 12B8F0 0022B7F0 00000000 */   nop
.L0022B7F4:
/* 12B8F4 0022B7F4 0C000424 */  addiu      $4, $0, 0xC
/* 12B8F8 0022B7F8 02000010 */  b          .L0022B804
/* 12B8FC 0022B7FC 00000000 */   nop
.L0022B800:
/* 12B900 0022B800 1F000424 */  addiu      $4, $0, 0x1F
.L0022B804:
/* 12B904 0022B804 38B4080C */  jal        MenuTextureReload__Fi
/* 12B908 0022B808 00000000 */   nop
/* 12B90C 0022B80C 28860070 */  paddub     $16, $0, $0
/* 12B910 0022B810 2900033C */  lui        $3, %hi(_2122_3)
/* 12B914 0022B814 E0436724 */  addiu      $7, $3, %lo(_2122_3)
/* 12B918 0022B818 3000A627 */  addiu      $6, $sp, 0x30
/* 12B91C 0022B81C 04000524 */  addiu      $5, $0, 0x4
.L0022B820:
/* 12B920 0022B820 0000E478 */  lq         $4, 0x0($7)
/* 12B924 0022B824 1000E378 */  lq         $3, 0x10($7)
/* 12B928 0022B828 2000E724 */  addiu      $7, $7, 0x20
/* 12B92C 0022B82C FFFFA524 */  addiu      $5, $5, -0x1
/* 12B930 0022B830 0000C47C */  sq         $4, 0x0($6)
/* 12B934 0022B834 1000C37C */  sq         $3, 0x10($6)
/* 12B938 0022B838 2000C624 */  addiu      $6, $6, 0x20
/* 12B93C 0022B83C F8FFA01C */  bgtz       $5, .L0022B820
/* 12B940 0022B840 00000000 */   nop
/* 12B944 0022B844 2A082002 */  slt        $at, $17, $0
/* 12B948 0022B848 04002014 */  bnez       $at, .L0022B85C
/* 12B94C 0022B84C 00000000 */   nop
/* 12B950 0022B850 5100232A */  slti       $3, $17, 0x51
/* 12B954 0022B854 60006014 */  bnez       $3, .L0022B9D8
/* 12B958 0022B858 00000000 */   nop
.L0022B85C:
/* 12B95C 0022B85C 5100222A */  slti       $2, $17, 0x51
/* 12B960 0022B860 07004014 */  bnez       $2, .L0022B880
/* 12B964 0022B864 00000000 */   nop
/* 12B968 0022B868 FF00212A */  slti       $at, $17, 0xFF
/* 12B96C 0022B86C 04002010 */  beqz       $at, .L0022B880
/* 12B970 0022B870 00000000 */   nop
/* 12B974 0022B874 AFFF2226 */  addiu      $2, $17, -0x51
/* 12B978 0022B878 01004104 */  bgez       $2, .L0022B880
/* 12B97C 0022B87C 00000000 */   nop
.L0022B880:
/* 12B980 0022B880 9897828F */  lw         $2, -0x6868($gp)
/* 12B984 0022B884 39004014 */  bnez       $2, .L0022B96C
/* 12B988 0022B888 00000000 */   nop
/* 12B98C 0022B88C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12B990 0022B890 B88D238C */  lw         $3, -0x7248($at)
/* 12B994 0022B894 DB01023C */  lui        $2, %hi(MenuDbgMsg)
/* 12B998 0022B898 A08D4224 */  addiu      $2, $2, %lo(MenuDbgMsg)
/* 12B99C 0022B89C 21104300 */  addu       $2, $2, $3
/* 12B9A0 0022B8A0 1C004424 */  addiu      $4, $2, 0x1C
/* 12B9A4 0022B8A4 2A00023C */  lui        $2, %hi(_2140_2)
/* 12B9A8 0022B8A8 00F14524 */  addiu      $5, $2, %lo(_2140_2)
/* 12B9AC 0022B8AC 1614040C */  jal        sprintf
/* 12B9B0 0022B8B0 00000000 */   nop
/* 12B9B4 0022B8B4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12B9B8 0022B8B8 B88D238C */  lw         $3, -0x7248($at)
/* 12B9BC 0022B8BC 21106200 */  addu       $2, $3, $2
/* 12B9C0 0022B8C0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12B9C4 0022B8C4 B88D22AC */  sw         $2, -0x7248($at)
/* 12B9C8 0022B8C8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12B9CC 0022B8CC B88D238C */  lw         $3, -0x7248($at)
/* 12B9D0 0022B8D0 DB01023C */  lui        $2, %hi(MenuDbgMsg)
/* 12B9D4 0022B8D4 A08D4224 */  addiu      $2, $2, %lo(MenuDbgMsg)
/* 12B9D8 0022B8D8 21204300 */  addu       $4, $2, $3
/* 12B9DC 0022B8DC 28160072 */  paddub     $2, $16, $0
/* 12B9E0 0022B8E0 01001026 */  addiu      $16, $16, 0x1
/* 12B9E4 0022B8E4 80180200 */  sll        $3, $2, 2
/* 12B9E8 0022B8E8 2900023C */  lui        $2, %hi(ItemTemplete)
/* 12B9EC 0022B8EC C0434224 */  addiu      $2, $2, %lo(ItemTemplete)
/* 12B9F0 0022B8F0 21104300 */  addu       $2, $2, $3
/* 12B9F4 0022B8F4 1C008424 */  addiu      $4, $4, 0x1C
/* 12B9F8 0022B8F8 0000458C */  lw         $5, 0x0($2)
/* 12B9FC 0022B8FC 28362072 */  paddub     $6, $17, $0
/* 12BA00 0022B900 1614040C */  jal        sprintf
/* 12BA04 0022B904 00000000 */   nop
/* 12BA08 0022B908 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12BA0C 0022B90C B88D238C */  lw         $3, -0x7248($at)
/* 12BA10 0022B910 21106200 */  addu       $2, $3, $2
/* 12BA14 0022B914 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12BA18 0022B918 B88D22AC */  sw         $2, -0x7248($at)
/* 12BA1C 0022B91C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12BA20 0022B920 B88D238C */  lw         $3, -0x7248($at)
/* 12BA24 0022B924 DB01023C */  lui        $2, %hi(MenuDbgMsg)
/* 12BA28 0022B928 A08D4224 */  addiu      $2, $2, %lo(MenuDbgMsg)
/* 12BA2C 0022B92C 21204300 */  addu       $4, $2, $3
/* 12BA30 0022B930 80181000 */  sll        $3, $16, 2
/* 12BA34 0022B934 2900023C */  lui        $2, %hi(ItemTemplete)
/* 12BA38 0022B938 C0434224 */  addiu      $2, $2, %lo(ItemTemplete)
/* 12BA3C 0022B93C 21104300 */  addu       $2, $2, $3
/* 12BA40 0022B940 1C008424 */  addiu      $4, $4, 0x1C
/* 12BA44 0022B944 0000458C */  lw         $5, 0x0($2)
/* 12BA48 0022B948 3000A627 */  addiu      $6, $sp, 0x30
/* 12BA4C 0022B94C 1614040C */  jal        sprintf
/* 12BA50 0022B950 00000000 */   nop
/* 12BA54 0022B954 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12BA58 0022B958 B88D238C */  lw         $3, -0x7248($at)
/* 12BA5C 0022B95C 21106200 */  addu       $2, $3, $2
/* 12BA60 0022B960 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12BA64 0022B964 B88D22AC */  sw         $2, -0x7248($at)
/* 12BA68 0022B968 3000A0A3 */  sb         $0, 0x30($sp)
.L0022B96C:
/* 12BA6C 0022B96C CC01023C */  lui        $2, %hi(GamePad)
/* 12BA70 0022B970 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 12BA74 0022B974 10000524 */  addiu      $5, $0, 0x10
/* 12BA78 0022B978 1CAE040C */  jal        Down__8CGamePadFi
/* 12BA7C 0022B97C 00000000 */   nop
/* 12BA80 0022B980 0A004010 */  beqz       $2, .L0022B9AC
/* 12BA84 0022B984 00000000 */   nop
/* 12BA88 0022B988 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12BA8C 0022B98C C08F248C */  lw         $4, -0x7040($at)
/* 12BA90 0022B990 7CAC080C */  jal        ConvDebugSelectToExcelListNo__Fi
/* 12BA94 0022B994 00000000 */   nop
/* 12BA98 0022B998 28264070 */  paddub     $4, $2, $0
/* 12BA9C 0022B99C E494858F */  lw         $5, -0x6B1C($gp)
/* 12BAA0 0022B9A0 0CAB080C */  jal        InitItemPolygonView__FiP1
/* 12BAA4 0022B9A4 00000000 */   nop
/* 12BAA8 0022B9A8 9C9782AF */  sw         $2, -0x6864($gp)
.L0022B9AC:
/* 12BAAC 0022B9AC 9C97838F */  lw         $3, -0x6864($gp)
/* 12BAB0 0022B9B0 04006014 */  bnez       $3, .L0022B9C4
/* 12BAB4 0022B9B4 00000000 */   nop
/* 12BAB8 0022B9B8 48AB080C */  jal        EnterItemPolygonView__Fv
/* 12BABC 0022B9BC 00000000 */   nop
/* 12BAC0 0022B9C0 9C9782AF */  sw         $2, -0x6864($gp)
.L0022B9C4:
/* 12BAC4 0022B9C4 9C97838F */  lw         $3, -0x6864($gp)
/* 12BAC8 0022B9C8 03006010 */  beqz       $3, .L0022B9D8
/* 12BACC 0022B9CC 00000000 */   nop
/* 12BAD0 0022B9D0 6CAC080C */  jal        DrawItemPolygonView__Fv
/* 12BAD4 0022B9D4 00000000 */   nop
.L0022B9D8:
/* 12BAD8 0022B9D8 2000BF7B */  lq         $31, 0x20($sp)
/* 12BADC 0022B9DC 1000B17B */  lq         $17, 0x10($sp)
/* 12BAE0 0022B9E0 0000B07B */  lq         $16, 0x0($sp)
/* 12BAE4 0022B9E4 B000BD27 */  addiu      $sp, $sp, 0xB0
/* 12BAE8 0022B9E8 0800E003 */  jr         $31
/* 12BAEC 0022B9EC 00000000 */   nop
