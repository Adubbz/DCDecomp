.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetDanceMotion__Fv
/* 009A50 01DB5750 F0FFBD27 */  addiu       $29, $29, -0x10
/* 009A54 01DB5754 0000BF7F */  sq          $31, 0x0($29)
/* 009A58 01DB5758 948B858F */  lw          $5, -0x746C($28)
/* 009A5C 01DB575C DE01023C */  lui         $2, %hi(LIT_344__3)
/* 009A60 01DB5760 50DD4424 */  addiu       $4, $2, %lo(LIT_344__3)
/* 009A64 01DB5764 28360070 */  paddub      $6, $0, $0
/* 009A68 01DB5768 D8FC040C */  jal         LoadFile__FPcPvPi
/* 009A6C 01DB576C 00000000 */   nop
/* 009A70 01DB5770 DF01023C */  lui         $2, %hi(UraEventMan + 0xA50)
/* 009A74 01DB5774 00694424 */  addiu       $4, $2, %lo(UraEventMan + 0xA50)
/* 009A78 01DB5778 948B858F */  lw          $5, -0x746C($28)
/* 009A7C 01DB577C DE01023C */  lui         $2, %hi(LIT_345__8)
/* 009A80 01DB5780 70DD4624 */  addiu       $6, $2, %lo(LIT_345__8)
/* 009A84 01DB5784 DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x40)
/* 009A88 01DB5788 40FE4724 */  addiu       $7, $2, %lo(CharaDataBuffer__2 + 0x40)
/* 009A8C 01DB578C DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x60)
/* 009A90 01DB5790 60FE4824 */  addiu       $8, $2, %lo(CharaDataBuffer__2 + 0x60)
/* 009A94 01DB5794 284E0070 */  paddub      $9, $0, $0
/* 009A98 01DB5798 08E6040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_P14CDataAlloc2_1_
/* 009A9C 01DB579C 00000000 */   nop
/* 009AA0 01DB57A0 F042023C */  lui         $2, (0x42F00000 >> 16)
/* 009AA4 01DB57A4 DF01013C */  lui         $1, %hi(UraEventMan + 0xD40)
/* 009AA8 01DB57A8 F06B22AC */  sw          $2, %lo(UraEventMan + 0xD40)($1)
/* 009AAC 01DB57AC 808080C7 */  lwc1        $f0, -0x7F80($28)
/* 009AB0 01DB57B0 DF01013C */  lui         $1, %hi(UraEventMan + 0xD48)
/* 009AB4 01DB57B4 F86B20E4 */  swc1        $f0, %lo(UraEventMan + 0xD48)($1)
/* 009AB8 01DB57B8 DF01013C */  lui         $1, %hi(UraEventMan + 0xD54)
/* 009ABC 01DB57BC 046C20AC */  sw          $0, %lo(UraEventMan + 0xD54)($1)
/* 009AC0 01DB57C0 DF01013C */  lui         $1, %hi(UraEventMan + 0xD58)
/* 009AC4 01DB57C4 086C20AC */  sw          $0, %lo(UraEventMan + 0xD58)($1)
/* 009AC8 01DB57C8 DD01013C */  lui         $1, %hi(noroi)
/* 009ACC 01DB57CC 4061238C */  lw          $3, %lo(noroi)($1)
/* 009AD0 01DB57D0 DF01013C */  lui         $1, %hi(UraEventMan + 0xD94)
/* 009AD4 01DB57D4 446C228C */  lw          $2, %lo(UraEventMan + 0xD94)($1)
/* 009AD8 01DB57D8 000043AC */  sw          $3, 0x0($2)
/* 009ADC 01DB57DC DD01013C */  lui         $1, %hi(noroi + 0x4)
/* 009AE0 01DB57E0 4461238C */  lw          $3, %lo(noroi + 0x4)($1)
/* 009AE4 01DB57E4 DF01013C */  lui         $1, %hi(UraEventMan + 0xD94)
/* 009AE8 01DB57E8 446C228C */  lw          $2, %lo(UraEventMan + 0xD94)($1)
/* 009AEC 01DB57EC 040043AC */  sw          $3, 0x4($2)
/* 009AF0 01DB57F0 948B858F */  lw          $5, -0x746C($28)
/* 009AF4 01DB57F4 DE01023C */  lui         $2, %hi(LIT_347__4)
/* 009AF8 01DB57F8 80DD4424 */  addiu       $4, $2, %lo(LIT_347__4)
/* 009AFC 01DB57FC 28360070 */  paddub      $6, $0, $0
/* 009B00 01DB5800 D8FC040C */  jal         LoadFile__FPcPvPi
/* 009B04 01DB5804 00000000 */   nop
/* 009B08 01DB5808 DF01023C */  lui         $2, %hi(UraEventMan + 0x1C00)
/* 009B0C 01DB580C B07A4424 */  addiu       $4, $2, %lo(UraEventMan + 0x1C00)
/* 009B10 01DB5810 948B858F */  lw          $5, -0x746C($28)
/* 009B14 01DB5814 DE01023C */  lui         $2, %hi(LIT_348__5)
/* 009B18 01DB5818 A0DD4624 */  addiu       $6, $2, %lo(LIT_348__5)
/* 009B1C 01DB581C DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x40)
/* 009B20 01DB5820 40FE4724 */  addiu       $7, $2, %lo(CharaDataBuffer__2 + 0x40)
/* 009B24 01DB5824 DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x60)
/* 009B28 01DB5828 60FE4824 */  addiu       $8, $2, %lo(CharaDataBuffer__2 + 0x60)
/* 009B2C 01DB582C 284E0070 */  paddub      $9, $0, $0
/* 009B30 01DB5830 08E6040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_P14CDataAlloc2_1_
/* 009B34 01DB5834 00000000 */   nop
/* 009B38 01DB5838 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 009B3C 01DB583C DF01013C */  lui         $1, %hi(UraEventMan + 0x1EF0)
/* 009B40 01DB5840 A07D23AC */  sw          $3, %lo(UraEventMan + 0x1EF0)($1)
/* 009B44 01DB5844 808080C7 */  lwc1        $f0, -0x7F80($28)
/* 009B48 01DB5848 DF01013C */  lui         $1, %hi(UraEventMan + 0x1EF8)
/* 009B4C 01DB584C A87D20E4 */  swc1        $f0, %lo(UraEventMan + 0x1EF8)($1)
/* 009B50 01DB5850 DF01013C */  lui         $1, %hi(UraEventMan + 0x1F04)
/* 009B54 01DB5854 B47D20AC */  sw          $0, %lo(UraEventMan + 0x1F04)($1)
/* 009B58 01DB5858 DF01013C */  lui         $1, %hi(UraEventMan + 0x1F08)
/* 009B5C 01DB585C B87D20AC */  sw          $0, %lo(UraEventMan + 0x1F08)($1)
/* 009B60 01DB5860 DD01013C */  lui         $1, %hi(dancer)
/* 009B64 01DB5864 E061248C */  lw          $4, %lo(dancer)($1)
/* 009B68 01DB5868 DF01013C */  lui         $1, %hi(UraEventMan + 0x1F44)
/* 009B6C 01DB586C F47D238C */  lw          $3, %lo(UraEventMan + 0x1F44)($1)
/* 009B70 01DB5870 000064AC */  sw          $4, 0x0($3)
/* 009B74 01DB5874 DD01013C */  lui         $1, %hi(dancer + 0x4)
/* 009B78 01DB5878 E461248C */  lw          $4, %lo(dancer + 0x4)($1)
/* 009B7C 01DB587C DF01013C */  lui         $1, %hi(UraEventMan + 0x1F44)
/* 009B80 01DB5880 F47D238C */  lw          $3, %lo(UraEventMan + 0x1F44)($1)
/* 009B84 01DB5884 040064AC */  sw          $4, 0x4($3)
/* 009B88 01DB5888 0000BF7B */  lq          $31, 0x0($29)
/* 009B8C 01DB588C 1000BD27 */  addiu       $29, $29, 0x10
/* 009B90 01DB5890 0800E003 */  jr          $31
/* 009B94 01DB5894 00000000 */   nop
/* 009B98 01DB5898 00000000 */  nop
/* 009B9C 01DB589C 00000000 */  nop
