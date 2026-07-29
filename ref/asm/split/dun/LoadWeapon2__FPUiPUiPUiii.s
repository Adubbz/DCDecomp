.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadWeapon2__FPUiPUiPUiii
/* 00DB40 01DB9840 E0FEBD27 */  addiu       $29, $29, -0x120
/* 00DB44 01DB9844 5000BF7F */  sq          $31, 0x50($29)
/* 00DB48 01DB9848 4000B47F */  sq          $20, 0x40($29)
/* 00DB4C 01DB984C 3000B37F */  sq          $19, 0x30($29)
/* 00DB50 01DB9850 2000B27F */  sq          $18, 0x20($29)
/* 00DB54 01DB9854 1000B17F */  sq          $17, 0x10($29)
/* 00DB58 01DB9858 0000B07F */  sq          $16, 0x0($29)
/* 00DB5C 01DB985C 28A68070 */  paddub      $20, $4, $0
/* 00DB60 01DB9860 289EA070 */  paddub      $19, $5, $0
/* 00DB64 01DB9864 2896C070 */  paddub      $18, $6, $0
/* 00DB68 01DB9868 288EE070 */  paddub      $17, $7, $0
/* 00DB6C 01DB986C DC01023C */  lui         $2, %hi(LIT_4998)
/* 00DB70 01DB9870 B0274224 */  addiu       $2, $2, %lo(LIT_4998)
/* 00DB74 01DB9874 6000A427 */  addiu       $4, $29, 0x60
/* 00DB78 01DB9878 00004378 */  lq          $3, 0x0($2)
/* 00DB7C 01DB987C 100042DC */  ld          $2, 0x10($2)
/* 00DB80 01DB9880 0000837C */  sq          $3, 0x0($4)
/* 00DB84 01DB9884 100082FC */  sd          $2, 0x10($4)
/* 00DB88 01DB9888 DC01023C */  lui         $2, %hi(LIT_4999)
/* 00DB8C 01DB988C D0274224 */  addiu       $2, $2, %lo(LIT_4999)
/* 00DB90 01DB9890 8000A427 */  addiu       $4, $29, 0x80
/* 00DB94 01DB9894 00004378 */  lq          $3, 0x0($2)
/* 00DB98 01DB9898 100042DC */  ld          $2, 0x10($2)
/* 00DB9C 01DB989C 0000837C */  sq          $3, 0x0($4)
/* 00DBA0 01DB98A0 100082FC */  sd          $2, 0x10($4)
/* 00DBA4 01DB98A4 80800700 */  sll         $16, $7, 2
/* 00DBA8 01DB98A8 17000011 */  beqz        $8, .L01DB9908_2F4F08
/* 00DBAC 01DB98AC 00000000 */   nop
/* 00DBB0 01DB98B0 C701023C */  lui         $2, %hi(TexManager)
/* 00DBB4 01DB98B4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00DBB8 01DB98B8 1D000524 */  addiu       $5, $0, 0x1D
/* 00DBBC 01DB98BC C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 00DBC0 01DB98C0 00000000 */   nop
/* 00DBC4 01DB98C4 C701023C */  lui         $2, %hi(TexManager)
/* 00DBC8 01DB98C8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00DBCC 01DB98CC 10000524 */  addiu       $5, $0, 0x10
/* 00DBD0 01DB98D0 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 00DBD4 01DB98D4 00000000 */   nop
/* 00DBD8 01DB98D8 C701023C */  lui         $2, %hi(TexManager)
/* 00DBDC 01DB98DC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00DBE0 01DB98E0 FCCD040C */  jal         CleanUpBuffer__15CTextureManagerFv
/* 00DBE4 01DB98E4 00000000 */   nop
/* 00DBE8 01DB98E8 C701023C */  lui         $2, %hi(TexManager)
/* 00DBEC 01DB98EC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00DBF0 01DB98F0 98CE040C */  jal         CleanUpTextureList__15CTextureManagerFv
/* 00DBF4 01DB98F4 00000000 */   nop
/* 00DBF8 01DB98F8 F001013C */  lui         $1, %hi(WeaponModelBuffer + 0x8)
/* 00DBFC 01DB98FC 786620AC */  sw          $0, %lo(WeaponModelBuffer + 0x8)($1)
/* 00DC00 01DB9900 F001013C */  lui         $1, %hi(WEffectModelBuffer + 0x8)
/* 00DC04 01DB9904 886620AC */  sw          $0, %lo(WEffectModelBuffer + 0x8)($1)
.L01DB9908_2F4F08:
/* 00DC08 01DB9908 A000A427 */  addiu       $4, $29, 0xA0
/* 00DC0C 01DB990C E000A527 */  addiu       $5, $29, 0xE0
/* 00DC10 01DB9910 28362072 */  paddub      $6, $17, $0
/* 00DC14 01DB9914 283E0070 */  paddub      $7, $0, $0
/* 00DC18 01DB9918 94DC060C */  jal         BtGetWeaponNamePath2__FPcPcii
/* 00DC1C 01DB991C 00000000 */   nop
/* 00DC20 01DB9920 EA01023C */  lui         $2, %hi(CrashWeapon)
/* 00DC24 01DB9924 E0634424 */  addiu       $4, $2, %lo(CrashWeapon)
/* 00DC28 01DB9928 74E6040C */  jal         Initialize__10CCharacterFv
/* 00DC2C 01DB992C 00000000 */   nop
/* 00DC30 01DB9930 EA01023C */  lui         $2, %hi(CrashWeapon)
/* 00DC34 01DB9934 E0634424 */  addiu       $4, $2, %lo(CrashWeapon)
/* 00DC38 01DB9938 282E8072 */  paddub      $5, $20, $0
/* 00DC3C 01DB993C E000A627 */  addiu       $6, $29, 0xE0
/* 00DC40 01DB9940 F001023C */  lui         $2, %hi(WeaponModelBuffer)
/* 00DC44 01DB9944 70664724 */  addiu       $7, $2, %lo(WeaponModelBuffer)
/* 00DC48 01DB9948 1D000824 */  addiu       $8, $0, 0x1D
/* 00DC4C 01DB994C F001023C */  lui         $2, %hi(WeaponModelBuffer)
/* 00DC50 01DB9950 70664924 */  addiu       $9, $2, %lo(WeaponModelBuffer)
/* 00DC54 01DB9954 01000A24 */  addiu       $10, $0, 0x1
/* 00DC58 01DB9958 285E0070 */  paddub      $11, $0, $0
/* 00DC5C 01DB995C 24E6040C */  jal         LoadPackData3__10CCharacterFPUiPcP14CDataAlloc2_1_iP14CDataAlloc2_1_ii
/* 00DC60 01DB9960 00000000 */   nop
/* 00DC64 01DB9964 A000A427 */  addiu       $4, $29, 0xA0
/* 00DC68 01DB9968 E000A527 */  addiu       $5, $29, 0xE0
/* 00DC6C 01DB996C 28362072 */  paddub      $6, $17, $0
/* 00DC70 01DB9970 01000724 */  addiu       $7, $0, 0x1
/* 00DC74 01DB9974 94DC060C */  jal         BtGetWeaponNamePath2__FPcPcii
/* 00DC78 01DB9978 00000000 */   nop
/* 00DC7C 01DB997C EA01023C */  lui         $2, %hi(DefaultWeapon)
/* 00DC80 01DB9980 30524424 */  addiu       $4, $2, %lo(DefaultWeapon)
/* 00DC84 01DB9984 74E6040C */  jal         Initialize__10CCharacterFv
/* 00DC88 01DB9988 00000000 */   nop
/* 00DC8C 01DB998C EA01023C */  lui         $2, %hi(DefaultWeapon)
/* 00DC90 01DB9990 30524424 */  addiu       $4, $2, %lo(DefaultWeapon)
/* 00DC94 01DB9994 282E6072 */  paddub      $5, $19, $0
/* 00DC98 01DB9998 E000A627 */  addiu       $6, $29, 0xE0
/* 00DC9C 01DB999C F001023C */  lui         $2, %hi(WeaponModelBuffer)
/* 00DCA0 01DB99A0 70664724 */  addiu       $7, $2, %lo(WeaponModelBuffer)
/* 00DCA4 01DB99A4 1D000824 */  addiu       $8, $0, 0x1D
/* 00DCA8 01DB99A8 F001023C */  lui         $2, %hi(WeaponModelBuffer)
/* 00DCAC 01DB99AC 70664924 */  addiu       $9, $2, %lo(WeaponModelBuffer)
/* 00DCB0 01DB99B0 01000A24 */  addiu       $10, $0, 0x1
/* 00DCB4 01DB99B4 285E0070 */  paddub      $11, $0, $0
/* 00DCB8 01DB99B8 24E6040C */  jal         LoadPackData3__10CCharacterFPUiPcP14CDataAlloc2_1_iP14CDataAlloc2_1_ii
/* 00DCBC 01DB99BC 00000000 */   nop
/* 00DCC0 01DB99C0 789C858F */  lw          $5, -0x6388($28)
/* 00DCC4 01DB99C4 0400A380 */  lb          $3, 0x4($5)
/* 00DCC8 01DB99C8 A80A0224 */  addiu       $2, $0, 0xAA8
/* 00DCCC 01DB99CC 18106200 */  mult        $2, $3, $2
/* 00DCD0 01DB99D0 21204500 */  addu        $4, $2, $5
/* 00DCD4 01DB99D4 21106500 */  addu        $2, $3, $5
/* 00DCD8 01DB99D8 40434380 */  lb          $3, 0x4340($2)
/* 00DCDC 01DB99DC 40110300 */  sll         $2, $3, 5
/* 00DCE0 01DB99E0 23104300 */  subu        $2, $2, $3
/* 00DCE4 01DB99E4 C0100200 */  sll         $2, $2, 3
/* 00DCE8 01DB99E8 21104400 */  addu        $2, $2, $4
/* 00DCEC 01DB99EC 0C454784 */  lh          $7, 0x450C($2)
/* 00DCF0 01DB99F0 21101D02 */  addu        $2, $16, $29
/* 00DCF4 01DB99F4 8000428C */  lw          $2, 0x80($2)
/* 00DCF8 01DB99F8 2338E200 */  subu        $7, $7, $2
/* 00DCFC 01DB99FC A000A427 */  addiu       $4, $29, 0xA0
/* 00DD00 01DB9A00 E000A527 */  addiu       $5, $29, 0xE0
/* 00DD04 01DB9A04 28362072 */  paddub      $6, $17, $0
/* 00DD08 01DB9A08 94DC060C */  jal         BtGetWeaponNamePath2__FPcPcii
/* 00DD0C 01DB9A0C 00000000 */   nop
/* 00DD10 01DB9A10 EA01023C */  lui         $2, %hi(MainWeapon)
/* 00DD14 01DB9A14 80404424 */  addiu       $4, $2, %lo(MainWeapon)
/* 00DD18 01DB9A18 74E6040C */  jal         Initialize__10CCharacterFv
/* 00DD1C 01DB9A1C 00000000 */   nop
/* 00DD20 01DB9A20 EA01023C */  lui         $2, %hi(MainWeapon)
/* 00DD24 01DB9A24 80404424 */  addiu       $4, $2, %lo(MainWeapon)
/* 00DD28 01DB9A28 282E4072 */  paddub      $5, $18, $0
/* 00DD2C 01DB9A2C E000A627 */  addiu       $6, $29, 0xE0
/* 00DD30 01DB9A30 F001023C */  lui         $2, %hi(WeaponModelBuffer)
/* 00DD34 01DB9A34 70664724 */  addiu       $7, $2, %lo(WeaponModelBuffer)
/* 00DD38 01DB9A38 1D000824 */  addiu       $8, $0, 0x1D
/* 00DD3C 01DB9A3C F001023C */  lui         $2, %hi(WeaponModelBuffer)
/* 00DD40 01DB9A40 70664924 */  addiu       $9, $2, %lo(WeaponModelBuffer)
/* 00DD44 01DB9A44 01000A24 */  addiu       $10, $0, 0x1
/* 00DD48 01DB9A48 285E0070 */  paddub      $11, $0, $0
/* 00DD4C 01DB9A4C 24E6040C */  jal         LoadPackData3__10CCharacterFPUiPcP14CDataAlloc2_1_iP14CDataAlloc2_1_ii
/* 00DD50 01DB9A50 00000000 */   nop
/* 00DD54 01DB9A54 EA01023C */  lui         $2, %hi(MainWeapon)
/* 00DD58 01DB9A58 80404424 */  addiu       $4, $2, %lo(MainWeapon)
/* 00DD5C 01DB9A5C 282E2072 */  paddub      $5, $17, $0
/* 00DD60 01DB9A60 F49C868F */  lw          $6, -0x630C($28)
/* 00DD64 01DB9A64 98E5760C */  jal         EquipWeaponFrame__FP10CCharacterii
/* 00DD68 01DB9A68 00000000 */   nop
/* 00DD6C 01DB9A6C F001013C */  lui         $1, %hi(WeaponModelBuffer + 0x8)
/* 00DD70 01DB9A70 7866258C */  lw          $5, %lo(WeaponModelBuffer + 0x8)($1)
/* 00DD74 01DB9A74 00190500 */  sll         $3, $5, 4
/* 00DD78 01DB9A78 F001013C */  lui         $1, %hi(WeaponModelBuffer)
/* 00DD7C 01DB9A7C 7066228C */  lw          $2, %lo(WeaponModelBuffer)($1)
/* 00DD80 01DB9A80 21204300 */  addu        $4, $2, $3
/* 00DD84 01DB9A84 0300023C */  lui         $2, (0x33450 >> 16)
/* 00DD88 01DB9A88 50344334 */  ori         $3, $2, (0x33450 & 0xFFFF)
/* 00DD8C 01DB9A8C F001013C */  lui         $1, %hi(CharaModelBuffer + 0x8)
/* 00DD90 01DB9A90 6866228C */  lw          $2, %lo(CharaModelBuffer + 0x8)($1)
/* 00DD94 01DB9A94 23106200 */  subu        $2, $3, $2
/* 00DD98 01DB9A98 23104500 */  subu        $2, $2, $5
/* 00DD9C 01DB9A9C 3C100200 */  dsll32      $2, $2, 0
/* 00DDA0 01DB9AA0 3F100200 */  dsra32      $2, $2, 0
/* 00DDA4 01DB9AA4 F001013C */  lui         $1, %hi(WEffectModelBuffer)
/* 00DDA8 01DB9AA8 806624AC */  sw          $4, %lo(WEffectModelBuffer)($1)
/* 00DDAC 01DB9AAC F001013C */  lui         $1, %hi(WEffectModelBuffer + 0xC)
/* 00DDB0 01DB9AB0 8C6622AC */  sw          $2, %lo(WEffectModelBuffer + 0xC)($1)
/* 00DDB4 01DB9AB4 F001013C */  lui         $1, %hi(WEffectModelBuffer + 0x8)
/* 00DDB8 01DB9AB8 886620AC */  sw          $0, %lo(WEffectModelBuffer + 0x8)($1)
/* 00DDBC 01DB9ABC 789C858F */  lw          $5, -0x6388($28)
/* 00DDC0 01DB9AC0 0400A480 */  lb          $4, 0x4($5)
/* 00DDC4 01DB9AC4 21108500 */  addu        $2, $4, $5
/* 00DDC8 01DB9AC8 40434380 */  lb          $3, 0x4340($2)
/* 00DDCC 01DB9ACC 40110300 */  sll         $2, $3, 5
/* 00DDD0 01DB9AD0 23104300 */  subu        $2, $2, $3
/* 00DDD4 01DB9AD4 C0180200 */  sll         $3, $2, 3
/* 00DDD8 01DB9AD8 A80A0224 */  addiu       $2, $0, 0xAA8
/* 00DDDC 01DB9ADC 18108200 */  mult        $2, $4, $2
/* 00DDE0 01DB9AE0 2110A200 */  addu        $2, $5, $2
/* 00DDE4 01DB9AE4 21104300 */  addu        $2, $2, $3
/* 00DDE8 01DB9AE8 0C454524 */  addiu       $5, $2, 0x450C
/* 00DDEC 01DB9AEC 009D848F */  lw          $4, -0x6300($28)
/* 00DDF0 01DB9AF0 CC33080C */  jal         MenuWeaponSpSet__FP10CCharacterP11WEAPON_HAVE
/* 00DDF4 01DB9AF4 00000000 */   nop
/* 00DDF8 01DB9AF8 C842033C */  lui         $3, (0x42C80000 >> 16)
/* 00DDFC 01DB9AFC DC01013C */  lui         $1, %hi(BtActStatus + 0x48)
/* 00DE00 01DB9B00 C84423AC */  sw          $3, %lo(BtActStatus + 0x48)($1)
/* 00DE04 01DB9B04 DC01013C */  lui         $1, %hi(BtActStatus + 0xA4)
/* 00DE08 01DB9B08 244520AC */  sw          $0, %lo(BtActStatus + 0xA4)($1)
/* 00DE0C 01DB9B0C 5000BF7B */  lq          $31, 0x50($29)
/* 00DE10 01DB9B10 4000B47B */  lq          $20, 0x40($29)
/* 00DE14 01DB9B14 3000B37B */  lq          $19, 0x30($29)
/* 00DE18 01DB9B18 2000B27B */  lq          $18, 0x20($29)
/* 00DE1C 01DB9B1C 1000B17B */  lq          $17, 0x10($29)
/* 00DE20 01DB9B20 0000B07B */  lq          $16, 0x0($29)
/* 00DE24 01DB9B24 2001BD27 */  addiu       $29, $29, 0x120
/* 00DE28 01DB9B28 0800E003 */  jr          $31
/* 00DE2C 01DB9B2C 00000000 */   nop
