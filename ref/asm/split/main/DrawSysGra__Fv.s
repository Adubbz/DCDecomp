.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawSysGra__Fv
/* 07DAF0 0017D9F0 A0FFBD27 */  addiu       $29, $29, -0x60
/* 07DAF4 0017D9F4 1000BF7F */  sq          $31, 0x10($29)
/* 07DAF8 0017D9F8 0000B07F */  sq          $16, 0x0($29)
/* 07DAFC 0017D9FC 448F838F */  lw          $3, -0x70BC($28)
/* 07DB00 0017DA00 51006014 */  bnez        $3, .L0017DB48
/* 07DB04 0017DA04 00000000 */   nop
/* 07DB08 0017DA08 C701023C */  lui         $2, %hi(TexManager)
/* 07DB0C 0017DA0C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 07DB10 0017DA10 D48B858F */  lw          $5, -0x742C($28)
/* 07DB14 0017DA14 14000624 */  addiu       $6, $0, 0x14
/* 07DB18 0017DA18 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 07DB1C 0017DA1C 00000000 */   nop
/* 07DB20 0017DA20 6090828F */  lw          $2, -0x6FA0($28)
/* 07DB24 0017DA24 0200013C */  lui         $1, (0x23260 >> 16)
/* 07DB28 0017DA28 60322134 */  ori         $1, $1, (0x23260 & 0xFFFF)
/* 07DB2C 0017DA2C 21204100 */  addu        $4, $2, $1
/* 07DB30 0017DA30 00010524 */  addiu       $5, $0, 0x100
/* 07DB34 0017DA34 FCF2050C */  jal         EdDrawSysCursor__FP14ED_EVENT_POINTi
/* 07DB38 0017DA38 00000000 */   nop
/* 07DB3C 0017DA3C 70DD050C */  jal         FishingDrawCheck__Fv
/* 07DB40 0017DA40 00000000 */   nop
/* 07DB44 0017DA44 05004014 */  bnez        $2, .L0017DA5C
/* 07DB48 0017DA48 00000000 */   nop
/* 07DB4C 0017DA4C 28260070 */  paddub      $4, $0, $0
/* 07DB50 0017DA50 282E0070 */  paddub      $5, $0, $0
/* 07DB54 0017DA54 D8F6050C */  jal         EdDrawClock__Fii
/* 07DB58 0017DA58 00000000 */   nop
.L0017DA5C:
/* 07DB5C 0017DA5C 10F4050C */  jal         DrawDay__Fv
/* 07DB60 0017DA60 00000000 */   nop
/* 07DB64 0017DA64 5800A427 */  addiu       $4, $29, 0x58
/* 07DB68 0017DA68 888780C7 */  lwc1        $f0, -0x7878($28)
/* 07DB6C 0017DA6C 8C878387 */  lh          $3, -0x7874($28)
/* 07DB70 0017DA70 000080E4 */  swc1        $f0, 0x0($4)
/* 07DB74 0017DA74 040083A4 */  sh          $3, 0x4($4)
/* 07DB78 0017DA78 6087838F */  lw          $3, -0x78A0($28)
/* 07DB7C 0017DA7C F7FF6324 */  addiu       $3, $3, -0x9
/* 07DB80 0017DA80 0200612C */  sltiu       $1, $3, 0x2
/* 07DB84 0017DA84 04002014 */  bnez        $1, .L0017DA98
/* 07DB88 0017DA88 00000000 */   nop
/* 07DB8C 0017DA8C 7C90838F */  lw          $3, -0x6F84($28)
/* 07DB90 0017DA90 2D006010 */  beqz        $3, .L0017DB48
/* 07DB94 0017DA94 00000000 */   nop
.L0017DA98:
/* 07DB98 0017DA98 2000A0AF */  sw          $0, 0x20($29)
/* 07DB9C 0017DA9C 2400A0AF */  sw          $0, 0x24($29)
/* 07DBA0 0017DAA0 00280224 */  addiu       $2, $0, 0x2800
/* 07DBA4 0017DAA4 2800A2AF */  sw          $2, 0x28($29)
/* 07DBA8 0017DAA8 000E0224 */  addiu       $2, $0, 0xE00
/* 07DBAC 0017DAAC 2C00A2AF */  sw          $2, 0x2C($29)
/* 07DBB0 0017DAB0 2000A427 */  addiu       $4, $29, 0x20
/* 07DBB4 0017DAB4 282E0070 */  paddub      $5, $0, $0
/* 07DBB8 0017DAB8 28360070 */  paddub      $6, $0, $0
/* 07DBBC 0017DABC 283E0070 */  paddub      $7, $0, $0
/* 07DBC0 0017DAC0 40000824 */  addiu       $8, $0, 0x40
/* 07DBC4 0017DAC4 9CBE040C */  jal         MGFillBox__FRC8CRect_i_UcUcUcUc
/* 07DBC8 0017DAC8 00000000 */   nop
/* 07DBCC 0017DACC 28260070 */  paddub      $4, $0, $0
/* 07DBD0 0017DAD0 046F050C */  jal         setbilinear__Fi
/* 07DBD4 0017DAD4 00000000 */   nop
/* 07DBD8 0017DAD8 4000A0AF */  sw          $0, 0x40($29)
/* 07DBDC 0017DADC 4400A0AF */  sw          $0, 0x44($29)
/* 07DBE0 0017DAE0 80000424 */  addiu       $4, $0, 0x80
/* 07DBE4 0017DAE4 4800A4AF */  sw          $4, 0x48($29)
/* 07DBE8 0017DAE8 28000324 */  addiu       $3, $0, 0x28
/* 07DBEC 0017DAEC 4C00A3AF */  sw          $3, 0x4C($29)
/* 07DBF0 0017DAF0 00010224 */  addiu       $2, $0, 0x100
/* 07DBF4 0017DAF4 3000A2AF */  sw          $2, 0x30($29)
/* 07DBF8 0017DAF8 CC000224 */  addiu       $2, $0, 0xCC
/* 07DBFC 0017DAFC 3400A2AF */  sw          $2, 0x34($29)
/* 07DC00 0017DB00 3800A4AF */  sw          $4, 0x38($29)
/* 07DC04 0017DB04 3C00A3AF */  sw          $3, 0x3C($29)
/* 07DC08 0017DB08 A0B8040C */  jal         GetVif1Packet__Fv
/* 07DC0C 0017DB0C 00000000 */   nop
/* 07DC10 0017DB10 28864070 */  paddub      $16, $2, $0
/* 07DC14 0017DB14 C701023C */  lui         $2, %hi(TexManager)
/* 07DC18 0017DB18 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 07DC1C 0017DB1C 5800A527 */  addiu       $5, $29, 0x58
/* 07DC20 0017DB20 FFFF0624 */  addiu       $6, $0, -0x1
/* 07DC24 0017DB24 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 07DC28 0017DB28 00000000 */   nop
/* 07DC2C 0017DB2C 28260072 */  paddub      $4, $16, $0
/* 07DC30 0017DB30 282E4070 */  paddub      $5, $2, $0
/* 07DC34 0017DB34 3000A627 */  addiu       $6, $29, 0x30
/* 07DC38 0017DB38 4000A727 */  addiu       $7, $29, 0x40
/* 07DC3C 0017DB3C 80000824 */  addiu       $8, $0, 0x80
/* 07DC40 0017DB40 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 07DC44 0017DB44 00000000 */   nop
.L0017DB48:
/* 07DC48 0017DB48 1000BF7B */  lq          $31, 0x10($29)
/* 07DC4C 0017DB4C 0000B07B */  lq          $16, 0x0($29)
/* 07DC50 0017DB50 6000BD27 */  addiu       $29, $29, 0x60
/* 07DC54 0017DB54 0800E003 */  jr          $31
/* 07DC58 0017DB58 00000000 */   nop
/* 07DC5C 0017DB5C 00000000 */  nop
