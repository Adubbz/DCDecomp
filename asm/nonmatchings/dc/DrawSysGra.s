.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawSysGra__Fv
/* 7DAF0 0017D9F0 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 7DAF4 0017D9F4 1000BF7F */  sq         $31, 0x10($sp)
/* 7DAF8 0017D9F8 0000B07F */  sq         $16, 0x0($sp)
/* 7DAFC 0017D9FC 448F838F */  lw         $3, -0x70BC($gp)
/* 7DB00 0017DA00 51006014 */  bnez       $3, .L0017DB48
/* 7DB04 0017DA04 00000000 */   nop
/* 7DB08 0017DA08 C701023C */  lui        $2, %hi(TexManager)
/* 7DB0C 0017DA0C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 7DB10 0017DA10 D48B858F */  lw         $5, -0x742C($gp)
/* 7DB14 0017DA14 14000624 */  addiu      $6, $0, 0x14
/* 7DB18 0017DA18 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 7DB1C 0017DA1C 00000000 */   nop
/* 7DB20 0017DA20 6090828F */  lw         $2, -0x6FA0($gp)
/* 7DB24 0017DA24 0200013C */  lui        $at, (0x23260 >> 16)
/* 7DB28 0017DA28 60322134 */  ori        $at, $at, (0x23260 & 0xFFFF)
/* 7DB2C 0017DA2C 21204100 */  addu       $4, $2, $at
/* 7DB30 0017DA30 00010524 */  addiu      $5, $0, 0x100
/* 7DB34 0017DA34 FCF2050C */  jal        EdDrawSysCursor__FP14ED_EVENT_POINTi
/* 7DB38 0017DA38 00000000 */   nop
/* 7DB3C 0017DA3C 70DD050C */  jal        FishingDrawCheck__Fv
/* 7DB40 0017DA40 00000000 */   nop
/* 7DB44 0017DA44 05004014 */  bnez       $2, .L0017DA5C
/* 7DB48 0017DA48 00000000 */   nop
/* 7DB4C 0017DA4C 28260070 */  paddub     $4, $0, $0
/* 7DB50 0017DA50 282E0070 */  paddub     $5, $0, $0
/* 7DB54 0017DA54 D8F6050C */  jal        EdDrawClock__Fii
/* 7DB58 0017DA58 00000000 */   nop
.L0017DA5C:
/* 7DB5C 0017DA5C 10F4050C */  jal        DrawDay__Fv
/* 7DB60 0017DA60 00000000 */   nop
/* 7DB64 0017DA64 5800A427 */  addiu      $4, $sp, 0x58
/* 7DB68 0017DA68 888780C7 */  lwc1       $f0, -0x7878($gp)
/* 7DB6C 0017DA6C 8C878387 */  lh         $3, -0x7874($gp)
/* 7DB70 0017DA70 000080E4 */  swc1       $f0, 0x0($4)
/* 7DB74 0017DA74 040083A4 */  sh         $3, 0x4($4)
/* 7DB78 0017DA78 6087838F */  lw         $3, -0x78A0($gp)
/* 7DB7C 0017DA7C F7FF6324 */  addiu      $3, $3, -0x9
/* 7DB80 0017DA80 0200612C */  sltiu      $at, $3, 0x2
/* 7DB84 0017DA84 04002014 */  bnez       $at, .L0017DA98
/* 7DB88 0017DA88 00000000 */   nop
/* 7DB8C 0017DA8C 7C90838F */  lw         $3, -0x6F84($gp)
/* 7DB90 0017DA90 2D006010 */  beqz       $3, .L0017DB48
/* 7DB94 0017DA94 00000000 */   nop
.L0017DA98:
/* 7DB98 0017DA98 2000A0AF */  sw         $0, 0x20($sp)
/* 7DB9C 0017DA9C 2400A0AF */  sw         $0, 0x24($sp)
/* 7DBA0 0017DAA0 00280224 */  addiu      $2, $0, 0x2800
/* 7DBA4 0017DAA4 2800A2AF */  sw         $2, 0x28($sp)
/* 7DBA8 0017DAA8 000E0224 */  addiu      $2, $0, 0xE00
/* 7DBAC 0017DAAC 2C00A2AF */  sw         $2, 0x2C($sp)
/* 7DBB0 0017DAB0 2000A427 */  addiu      $4, $sp, 0x20
/* 7DBB4 0017DAB4 282E0070 */  paddub     $5, $0, $0
/* 7DBB8 0017DAB8 28360070 */  paddub     $6, $0, $0
/* 7DBBC 0017DABC 283E0070 */  paddub     $7, $0, $0
/* 7DBC0 0017DAC0 40000824 */  addiu      $8, $0, 0x40
/* 7DBC4 0017DAC4 9CBE040C */  jal        MGFillBox__FRC8CRect_i_UcUcUcUc
/* 7DBC8 0017DAC8 00000000 */   nop
/* 7DBCC 0017DACC 28260070 */  paddub     $4, $0, $0
/* 7DBD0 0017DAD0 046F050C */  jal        setbilinear__Fi
/* 7DBD4 0017DAD4 00000000 */   nop
/* 7DBD8 0017DAD8 4000A0AF */  sw         $0, 0x40($sp)
/* 7DBDC 0017DADC 4400A0AF */  sw         $0, 0x44($sp)
/* 7DBE0 0017DAE0 80000424 */  addiu      $4, $0, 0x80
/* 7DBE4 0017DAE4 4800A4AF */  sw         $4, 0x48($sp)
/* 7DBE8 0017DAE8 28000324 */  addiu      $3, $0, 0x28
/* 7DBEC 0017DAEC 4C00A3AF */  sw         $3, 0x4C($sp)
/* 7DBF0 0017DAF0 00010224 */  addiu      $2, $0, 0x100
/* 7DBF4 0017DAF4 3000A2AF */  sw         $2, 0x30($sp)
/* 7DBF8 0017DAF8 CC000224 */  addiu      $2, $0, 0xCC
/* 7DBFC 0017DAFC 3400A2AF */  sw         $2, 0x34($sp)
/* 7DC00 0017DB00 3800A4AF */  sw         $4, 0x38($sp)
/* 7DC04 0017DB04 3C00A3AF */  sw         $3, 0x3C($sp)
/* 7DC08 0017DB08 A0B8040C */  jal        GetVif1Packet__Fv
/* 7DC0C 0017DB0C 00000000 */   nop
/* 7DC10 0017DB10 28864070 */  paddub     $16, $2, $0
/* 7DC14 0017DB14 C701023C */  lui        $2, %hi(TexManager)
/* 7DC18 0017DB18 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 7DC1C 0017DB1C 5800A527 */  addiu      $5, $sp, 0x58
/* 7DC20 0017DB20 FFFF0624 */  addiu      $6, $0, -0x1
/* 7DC24 0017DB24 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 7DC28 0017DB28 00000000 */   nop
/* 7DC2C 0017DB2C 28260072 */  paddub     $4, $16, $0
/* 7DC30 0017DB30 282E4070 */  paddub     $5, $2, $0
/* 7DC34 0017DB34 3000A627 */  addiu      $6, $sp, 0x30
/* 7DC38 0017DB38 4000A727 */  addiu      $7, $sp, 0x40
/* 7DC3C 0017DB3C 80000824 */  addiu      $8, $0, 0x80
/* 7DC40 0017DB40 C470050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 7DC44 0017DB44 00000000 */   nop
.L0017DB48:
/* 7DC48 0017DB48 1000BF7B */  lq         $31, 0x10($sp)
/* 7DC4C 0017DB4C 0000B07B */  lq         $16, 0x0($sp)
/* 7DC50 0017DB50 6000BD27 */  addiu      $sp, $sp, 0x60
/* 7DC54 0017DB54 0800E003 */  jr         $31
/* 7DC58 0017DB58 00000000 */   nop
/* 7DC5C 0017DB5C 00000000 */  nop
