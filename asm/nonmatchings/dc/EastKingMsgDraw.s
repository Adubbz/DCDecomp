.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EastKingMsgDraw__Fv
/* 132D60 00232C60 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 132D64 00232C64 0000BF7F */  sq         $31, 0x0($sp)
/* 132D68 00232C68 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 132D6C 00232C6C 4CA82284 */  lh         $2, -0x57B4($at)
/* 132D70 00232C70 0F004010 */  beqz       $2, .L00232CB0
/* 132D74 00232C74 00000000 */   nop
/* 132D78 00232C78 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 132D7C 00232C7C 3CA7228C */  lw         $2, -0x58C4($at)
/* 132D80 00232C80 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 132D84 00232C84 60A82584 */  lh         $5, -0x57A0($at)
/* 132D88 00232C88 09004510 */  beq        $2, $5, .L00232CB0
/* 132D8C 00232C8C 00000000 */   nop
/* 132D90 00232C90 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 132D94 00232C94 64A82284 */  lh         $2, -0x579C($at)
/* 132D98 00232C98 05004010 */  beqz       $2, .L00232CB0
/* 132D9C 00232C9C 00000000 */   nop
/* 132DA0 00232CA0 DB01023C */  lui        $2, %hi(EastKingMsgCls)
/* 132DA4 00232CA4 80904424 */  addiu      $4, $2, %lo(EastKingMsgCls)
/* 132DA8 00232CA8 5441050C */  jal        MakeMesWin__6ClsMesFi
/* 132DAC 00232CAC 00000000 */   nop
.L00232CB0:
/* 132DB0 00232CB0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 132DB4 00232CB4 CCA7248C */  lw         $4, -0x5834($at)
/* 132DB8 00232CB8 38B4080C */  jal        MenuTextureReload__Fi
/* 132DBC 00232CBC 00000000 */   nop
/* 132DC0 00232CC0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 132DC4 00232CC4 54A82484 */  lh         $4, -0x57AC($at)
/* 132DC8 00232CC8 03000324 */  addiu      $3, $0, 0x3
/* 132DCC 00232CCC 19008310 */  beq        $4, $3, .L00232D34
/* 132DD0 00232CD0 00000000 */   nop
/* 132DD4 00232CD4 01000324 */  addiu      $3, $0, 0x1
/* 132DD8 00232CD8 16008310 */  beq        $4, $3, .L00232D34
/* 132DDC 00232CDC 00000000 */   nop
/* 132DE0 00232CE0 04000324 */  addiu      $3, $0, 0x4
/* 132DE4 00232CE4 0C008310 */  beq        $4, $3, .L00232D18
/* 132DE8 00232CE8 00000000 */   nop
/* 132DEC 00232CEC 02000324 */  addiu      $3, $0, 0x2
/* 132DF0 00232CF0 09008310 */  beq        $4, $3, .L00232D18
/* 132DF4 00232CF4 00000000 */   nop
/* 132DF8 00232CF8 03008010 */  beqz       $4, .L00232D08
/* 132DFC 00232CFC 00000000 */   nop
/* 132E00 00232D00 11000010 */  b          .L00232D48
/* 132E04 00232D04 00000000 */   nop
.L00232D08:
/* 132E08 00232D08 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 132E0C 00232D0C 4CA82384 */  lh         $3, -0x57B4($at)
/* 132E10 00232D10 0D006010 */  beqz       $3, .L00232D48
/* 132E14 00232D14 00000000 */   nop
.L00232D18:
/* 132E18 00232D18 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 132E1C 00232D1C 6AA82384 */  lh         $3, -0x5796($at)
/* 132E20 00232D20 02006324 */  addiu      $3, $3, 0x2
/* 132E24 00232D24 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 132E28 00232D28 6AA823A4 */  sh         $3, -0x5796($at)
/* 132E2C 00232D2C 06000010 */  b          .L00232D48
/* 132E30 00232D30 00000000 */   nop
.L00232D34:
/* 132E34 00232D34 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 132E38 00232D38 6AA82384 */  lh         $3, -0x5796($at)
/* 132E3C 00232D3C FEFF6324 */  addiu      $3, $3, -0x2
/* 132E40 00232D40 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 132E44 00232D44 6AA823A4 */  sh         $3, -0x5796($at)
.L00232D48:
/* 132E48 00232D48 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 132E4C 00232D4C 6AA82384 */  lh         $3, -0x5796($at)
/* 132E50 00232D50 03006104 */  bgez       $3, .L00232D60
/* 132E54 00232D54 00000000 */   nop
/* 132E58 00232D58 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 132E5C 00232D5C 6AA820A4 */  sh         $0, -0x5796($at)
.L00232D60:
/* 132E60 00232D60 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 132E64 00232D64 6AA82384 */  lh         $3, -0x5796($at)
/* 132E68 00232D68 81006128 */  slti       $at, $3, 0x81
/* 132E6C 00232D6C 04002014 */  bnez       $at, .L00232D80
/* 132E70 00232D70 00000000 */   nop
/* 132E74 00232D74 80000324 */  addiu      $3, $0, 0x80
/* 132E78 00232D78 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 132E7C 00232D7C 6AA823A4 */  sh         $3, -0x5796($at)
.L00232D80:
/* 132E80 00232D80 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 132E84 00232D84 4CA82384 */  lh         $3, -0x57B4($at)
/* 132E88 00232D88 19006010 */  beqz       $3, .L00232DF0
/* 132E8C 00232D8C 00000000 */   nop
/* 132E90 00232D90 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 132E94 00232D94 8890228C */  lw         $2, -0x6F78($at)
/* 132E98 00232D98 43180200 */  sra        $3, $2, 1
/* 132E9C 00232D9C 4C010224 */  addiu      $2, $0, 0x14C
/* 132EA0 00232DA0 23284300 */  subu       $5, $2, $3
/* 132EA4 00232DA4 DB01023C */  lui        $2, %hi(EastKingMsgCls)
/* 132EA8 00232DA8 80904424 */  addiu      $4, $2, %lo(EastKingMsgCls)
/* 132EAC 00232DAC 34B0080C */  jal        GetMenuCommonPutXY__FP6ClsMesi
/* 132EB0 00232DB0 00000000 */   nop
/* 132EB4 00232DB4 32010224 */  addiu      $2, $0, 0x132
/* 132EB8 00232DB8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 132EBC 00232DBC 849022AC */  sw         $2, -0x6F7C($at)
/* 132EC0 00232DC0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 132EC4 00232DC4 6AA82284 */  lh         $2, -0x5796($at)
/* 132EC8 00232DC8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 132ECC 00232DCC 54A722AC */  sw         $2, -0x58AC($at)
/* 132ED0 00232DD0 DB01023C */  lui        $2, %hi(EastKingMsgCls)
/* 132ED4 00232DD4 80904424 */  addiu      $4, $2, %lo(EastKingMsgCls)
/* 132ED8 00232DD8 6437050C */  jal        Step__6ClsMesFv
/* 132EDC 00232DDC 00000000 */   nop
/* 132EE0 00232DE0 DB01023C */  lui        $2, %hi(EastKingMsgCls)
/* 132EE4 00232DE4 80904424 */  addiu      $4, $2, %lo(EastKingMsgCls)
/* 132EE8 00232DE8 C44C050C */  jal        DrawMesWin__6ClsMesFv
/* 132EEC 00232DEC 00000000 */   nop
.L00232DF0:
/* 132EF0 00232DF0 0000BF7B */  lq         $31, 0x0($sp)
/* 132EF4 00232DF4 1000BD27 */  addiu      $sp, $sp, 0x10
/* 132EF8 00232DF8 0800E003 */  jr         $31
/* 132EFC 00232DFC 00000000 */   nop
