.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WeaponModelBuildFunc__Fii
/* 10DA30 0020D930 10FFBD27 */  addiu      $sp, $sp, -0xF0
/* 10DA34 0020D934 8000BF7F */  sq         $31, 0x80($sp)
/* 10DA38 0020D938 7000B77F */  sq         $23, 0x70($sp)
/* 10DA3C 0020D93C 6000B67F */  sq         $22, 0x60($sp)
/* 10DA40 0020D940 5000B57F */  sq         $21, 0x50($sp)
/* 10DA44 0020D944 4000B47F */  sq         $20, 0x40($sp)
/* 10DA48 0020D948 3000B37F */  sq         $19, 0x30($sp)
/* 10DA4C 0020D94C 2000B27F */  sq         $18, 0x20($sp)
/* 10DA50 0020D950 1000B17F */  sq         $17, 0x10($sp)
/* 10DA54 0020D954 0000B07F */  sq         $16, 0x0($sp)
/* 10DA58 0020D958 288E8070 */  paddub     $17, $4, $0
/* 10DA5C 0020D95C 2886A070 */  paddub     $16, $5, $0
/* 10DA60 0020D960 2A00023C */  lui        $2, %hi(_1104)
/* 10DA64 0020D964 50DF4424 */  addiu      $4, $2, %lo(_1104)
/* 10DA68 0020D968 A611040C */  jal        printf
/* 10DA6C 0020D96C 00000000 */   nop
/* 10DA70 0020D970 0835080C */  jal        InitMenuWeaponModelReference__Fv
/* 10DA74 0020D974 00000000 */   nop
/* 10DA78 0020D978 2900023C */  lui        $2, %hi(_1041)
/* 10DA7C 0020D97C 803A4224 */  addiu      $2, $2, %lo(_1041)
/* 10DA80 0020D980 9000A427 */  addiu      $4, $sp, 0x90
/* 10DA84 0020D984 00004378 */  lq         $3, 0x0($2)
/* 10DA88 0020D988 100042DC */  ld         $2, 0x10($2)
/* 10DA8C 0020D98C 0000837C */  sq         $3, 0x0($4)
/* 10DA90 0020D990 100082FC */  sd         $2, 0x10($4)
/* 10DA94 0020D994 9400B0AF */  sw         $16, 0x94($sp)
/* 10DA98 0020D998 C701023C */  lui        $2, %hi(TexManager)
/* 10DA9C 0020D99C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 10DAA0 0020D9A0 282E0072 */  paddub     $5, $16, $0
/* 10DAA4 0020D9A4 C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* 10DAA8 0020D9A8 00000000 */   nop
/* 10DAAC 0020D9AC C701023C */  lui        $2, %hi(TexManager)
/* 10DAB0 0020D9B0 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 10DAB4 0020D9B4 98CE040C */  jal        CleanUpTextureList__15CTextureManagerFv
/* 10DAB8 0020D9B8 00000000 */   nop
/* 10DABC 0020D9BC C701023C */  lui        $2, %hi(TexManager)
/* 10DAC0 0020D9C0 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 10DAC4 0020D9C4 FFFF0524 */  addiu      $5, $0, -0x1
/* 10DAC8 0020D9C8 9000A627 */  addiu      $6, $sp, 0x90
/* 10DACC 0020D9CC 30D0040C */  jal        LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 10DAD0 0020D9D0 00000000 */   nop
/* 10DAD4 0020D9D4 2A00023C */  lui        $2, %hi(_1105)
/* 10DAD8 0020D9D8 70DF4424 */  addiu      $4, $2, %lo(_1105)
/* 10DADC 0020D9DC F095858F */  lw         $5, -0x6A10($gp)
/* 10DAE0 0020D9E0 A611040C */  jal        printf
/* 10DAE4 0020D9E4 00000000 */   nop
/* 10DAE8 0020D9E8 F095828F */  lw         $2, -0x6A10($gp)
/* 10DAEC 0020D9EC D901013C */  lui        $at, (0x1D90410 >> 16)
/* 10DAF0 0020D9F0 100422AC */  sw         $2, (0x1D90410 & 0xFFFF)($at)
/* 10DAF4 0020D9F4 00EC0234 */  ori        $2, $0, 0xEC00
/* 10DAF8 0020D9F8 D901013C */  lui        $at, (0x1D9041C >> 16)
/* 10DAFC 0020D9FC 1C0422AC */  sw         $2, (0x1D9041C & 0xFFFF)($at)
/* 10DB00 0020DA00 D901013C */  lui        $at, (0x1D90418 >> 16)
/* 10DB04 0020DA04 180420AC */  sw         $0, (0x1D90418 & 0xFFFF)($at)
/* 10DB08 0020DA08 D494838F */  lw         $3, -0x6B2C($gp)
/* 10DB0C 0020DA0C A80A0224 */  addiu      $2, $0, 0xAA8
/* 10DB10 0020DA10 18102202 */  mult       $2, $17, $2
/* 10DB14 0020DA14 21106200 */  addu       $2, $3, $2
/* 10DB18 0020DA18 0C455624 */  addiu      $22, $2, 0x450C
/* 10DB1C 0020DA1C 28262072 */  paddub     $4, $17, $0
/* 10DB20 0020DA20 68CF070C */  jal        GetDefaultWeaponNo__Fi
/* 10DB24 0020DA24 00000000 */   nop
/* 10DB28 0020DA28 28BE4070 */  paddub     $23, $2, $0
/* 10DB2C 0020DA2C 02001224 */  addiu      $18, $0, 0x2
/* 10DB30 0020DA30 28260070 */  paddub     $4, $0, $0
/* 10DB34 0020DA34 EC34080C */  jal        GetMenuWeaponModelData__Fi
/* 10DB38 0020DA38 00000000 */   nop
/* 10DB3C 0020DA3C 289E4070 */  paddub     $19, $2, $0
/* 10DB40 0020DA40 B000A427 */  addiu      $4, $sp, 0xB0
/* 10DB44 0020DA44 D000A527 */  addiu      $5, $sp, 0xD0
/* 10DB48 0020DA48 28362072 */  paddub     $6, $17, $0
/* 10DB4C 0020DA4C 283E0070 */  paddub     $7, $0, $0
/* 10DB50 0020DA50 94DC060C */  jal        BtGetWeaponNamePath2__FPcPcii
/* 10DB54 0020DA54 00000000 */   nop
/* 10DB58 0020DA58 D901023C */  lui        $2, %hi(DngWeaponFrm)
/* 10DB5C 0020DA5C 30164424 */  addiu      $4, $2, %lo(DngWeaponFrm)
/* 10DB60 0020DA60 0000658E */  lw         $5, 0x0($19)
/* 10DB64 0020DA64 D000A627 */  addiu      $6, $sp, 0xD0
/* 10DB68 0020DA68 D901023C */  lui        $2, %hi(MenuExCashBuffer)
/* 10DB6C 0020DA6C 10044724 */  addiu      $7, $2, %lo(MenuExCashBuffer)
/* 10DB70 0020DA70 28460072 */  paddub     $8, $16, $0
/* 10DB74 0020DA74 D901023C */  lui        $2, %hi(MenuExCashBuffer)
/* 10DB78 0020DA78 10044924 */  addiu      $9, $2, %lo(MenuExCashBuffer)
/* 10DB7C 0020DA7C 01000A24 */  addiu      $10, $0, 0x1
/* 10DB80 0020DA80 285E0070 */  paddub     $11, $0, $0
/* 10DB84 0020DA84 24E6040C */  jal        LoadPackData3__10CCharacterFPUiPcP14CDataAlloc2_1_iP14CDataAlloc2_1_ii
/* 10DB88 0020DA88 00000000 */   nop
/* 10DB8C 0020DA8C 01000424 */  addiu      $4, $0, 0x1
/* 10DB90 0020DA90 EC34080C */  jal        GetMenuWeaponModelData__Fi
/* 10DB94 0020DA94 00000000 */   nop
/* 10DB98 0020DA98 289E4070 */  paddub     $19, $2, $0
/* 10DB9C 0020DA9C B000A427 */  addiu      $4, $sp, 0xB0
/* 10DBA0 0020DAA0 D000A527 */  addiu      $5, $sp, 0xD0
/* 10DBA4 0020DAA4 28362072 */  paddub     $6, $17, $0
/* 10DBA8 0020DAA8 01000724 */  addiu      $7, $0, 0x1
/* 10DBAC 0020DAAC 94DC060C */  jal        BtGetWeaponNamePath2__FPcPcii
/* 10DBB0 0020DAB0 00000000 */   nop
/* 10DBB4 0020DAB4 D901023C */  lui        $2, %hi(D_1D927E0)
/* 10DBB8 0020DAB8 E0274424 */  addiu      $4, $2, %lo(D_1D927E0)
/* 10DBBC 0020DABC 0000658E */  lw         $5, 0x0($19)
/* 10DBC0 0020DAC0 D000A627 */  addiu      $6, $sp, 0xD0
/* 10DBC4 0020DAC4 D901023C */  lui        $2, %hi(MenuExCashBuffer)
/* 10DBC8 0020DAC8 10044724 */  addiu      $7, $2, %lo(MenuExCashBuffer)
/* 10DBCC 0020DACC 28460072 */  paddub     $8, $16, $0
/* 10DBD0 0020DAD0 D901023C */  lui        $2, %hi(MenuExCashBuffer)
/* 10DBD4 0020DAD4 10044924 */  addiu      $9, $2, %lo(MenuExCashBuffer)
/* 10DBD8 0020DAD8 01000A24 */  addiu      $10, $0, 0x1
/* 10DBDC 0020DADC 285E0070 */  paddub     $11, $0, $0
/* 10DBE0 0020DAE0 24E6040C */  jal        LoadPackData3__10CCharacterFPUiPcP14CDataAlloc2_1_iP14CDataAlloc2_1_ii
/* 10DBE4 0020DAE4 00000000 */   nop
/* 10DBE8 0020DAE8 289E0070 */  paddub     $19, $0, $0
/* 10DBEC 0020DAEC 65000010 */  b          .L0020DC84
/* 10DBF0 0020DAF0 00000000 */   nop
.L0020DAF4:
/* 10DBF4 0020DAF4 40111300 */  sll        $2, $19, 5
/* 10DBF8 0020DAF8 23105300 */  subu       $2, $2, $19
/* 10DBFC 0020DAFC C0100200 */  sll        $2, $2, 3
/* 10DC00 0020DB00 2110C202 */  addu       $2, $22, $2
/* 10DC04 0020DB04 08004014 */  bnez       $2, .L0020DB28
/* 10DC08 0020DB08 00000000 */   nop
/* 10DC0C 0020DB0C 28266072 */  paddub     $4, $19, $0
/* 10DC10 0020DB10 FEFF0524 */  addiu      $5, $0, -0x2
/* 10DC14 0020DB14 FFFF0624 */  addiu      $6, $0, -0x1
/* 10DC18 0020DB18 1C35080C */  jal        SetMenuWeaponModelReference__Fiii
/* 10DC1C 0020DB1C 00000000 */   nop
/* 10DC20 0020DB20 57000010 */  b          .L0020DC80
/* 10DC24 0020DB24 00000000 */   nop
.L0020DB28:
/* 10DC28 0020DB28 00004284 */  lh         $2, 0x0($2)
/* 10DC2C 0020DB2C 01014128 */  slti       $at, $2, 0x101
/* 10DC30 0020DB30 08002010 */  beqz       $at, .L0020DB54
/* 10DC34 0020DB34 00000000 */   nop
/* 10DC38 0020DB38 28266072 */  paddub     $4, $19, $0
/* 10DC3C 0020DB3C FEFF0524 */  addiu      $5, $0, -0x2
/* 10DC40 0020DB40 FFFF0624 */  addiu      $6, $0, -0x1
/* 10DC44 0020DB44 1C35080C */  jal        SetMenuWeaponModelReference__Fiii
/* 10DC48 0020DB48 00000000 */   nop
/* 10DC4C 0020DB4C 4C000010 */  b          .L0020DC80
/* 10DC50 0020DB50 00000000 */   nop
.L0020DB54:
/* 10DC54 0020DB54 23A05700 */  subu       $20, $2, $23
/* 10DC58 0020DB58 0200812E */  sltiu      $at, $20, 0x2
/* 10DC5C 0020DB5C 08002010 */  beqz       $at, .L0020DB80
/* 10DC60 0020DB60 00000000 */   nop
/* 10DC64 0020DB64 28266072 */  paddub     $4, $19, $0
/* 10DC68 0020DB68 282E8072 */  paddub     $5, $20, $0
/* 10DC6C 0020DB6C 28368072 */  paddub     $6, $20, $0
/* 10DC70 0020DB70 1C35080C */  jal        SetMenuWeaponModelReference__Fiii
/* 10DC74 0020DB74 00000000 */   nop
/* 10DC78 0020DB78 41000010 */  b          .L0020DC80
/* 10DC7C 0020DB7C 00000000 */   nop
.L0020DB80:
/* 10DC80 0020DB80 28AE0070 */  paddub     $21, $0, $0
/* 10DC84 0020DB84 28260070 */  paddub     $4, $0, $0
/* 10DC88 0020DB88 0E000010 */  b          .L0020DBC4
/* 10DC8C 0020DB8C 00000000 */   nop
.L0020DB90:
/* 10DC90 0020DB90 0035080C */  jal        GetMenuWeaponModelInfo__Fi
/* 10DC94 0020DB94 00000000 */   nop
/* 10DC98 0020DB98 0400468C */  lw         $6, 0x4($2)
/* 10DC9C 0020DB9C 0800D414 */  bne        $6, $20, .L0020DBC0
/* 10DCA0 0020DBA0 00000000 */   nop
/* 10DCA4 0020DBA4 01001524 */  addiu      $21, $0, 0x1
/* 10DCA8 0020DBA8 28266072 */  paddub     $4, $19, $0
/* 10DCAC 0020DBAC 0000458C */  lw         $5, 0x0($2)
/* 10DCB0 0020DBB0 1C35080C */  jal        SetMenuWeaponModelReference__Fiii
/* 10DCB4 0020DBB4 00000000 */   nop
/* 10DCB8 0020DBB8 05000010 */  b          .L0020DBD0
/* 10DCBC 0020DBBC 00000000 */   nop
.L0020DBC0:
/* 10DCC0 0020DBC0 01008424 */  addiu      $4, $4, 0x1
.L0020DBC4:
/* 10DCC4 0020DBC4 0A008228 */  slti       $2, $4, 0xA
/* 10DCC8 0020DBC8 F1FF4014 */  bnez       $2, .L0020DB90
/* 10DCCC 0020DBCC 00000000 */   nop
.L0020DBD0:
/* 10DCD0 0020DBD0 2B00A016 */  bnez       $21, .L0020DC80
/* 10DCD4 0020DBD4 00000000 */   nop
/* 10DCD8 0020DBD8 28268072 */  paddub     $4, $20, $0
/* 10DCDC 0020DBDC EC34080C */  jal        GetMenuWeaponModelData__Fi
/* 10DCE0 0020DBE0 00000000 */   nop
/* 10DCE4 0020DBE4 28AE4070 */  paddub     $21, $2, $0
/* 10DCE8 0020DBE8 0000428C */  lw         $2, 0x0($2)
/* 10DCEC 0020DBEC 08004014 */  bnez       $2, .L0020DC10
/* 10DCF0 0020DBF0 00000000 */   nop
/* 10DCF4 0020DBF4 2A00023C */  lui        $2, %hi(_1106)
/* 10DCF8 0020DBF8 90DF4424 */  addiu      $4, $2, %lo(_1106)
/* 10DCFC 0020DBFC 282E8072 */  paddub     $5, $20, $0
/* 10DD00 0020DC00 A611040C */  jal        printf
/* 10DD04 0020DC04 00000000 */   nop
/* 10DD08 0020DC08 1D000010 */  b          .L0020DC80
/* 10DD0C 0020DC0C 00000000 */   nop
.L0020DC10:
/* 10DD10 0020DC10 B000A427 */  addiu      $4, $sp, 0xB0
/* 10DD14 0020DC14 D000A527 */  addiu      $5, $sp, 0xD0
/* 10DD18 0020DC18 28362072 */  paddub     $6, $17, $0
/* 10DD1C 0020DC1C 283E8072 */  paddub     $7, $20, $0
/* 10DD20 0020DC20 94DC060C */  jal        BtGetWeaponNamePath2__FPcPcii
/* 10DD24 0020DC24 00000000 */   nop
/* 10DD28 0020DC28 B0110224 */  addiu      $2, $0, 0x11B0
/* 10DD2C 0020DC2C 18184202 */  mult       $3, $18, $2
/* 10DD30 0020DC30 D901023C */  lui        $2, %hi(DngWeaponFrm)
/* 10DD34 0020DC34 30164224 */  addiu      $2, $2, %lo(DngWeaponFrm)
/* 10DD38 0020DC38 21204300 */  addu       $4, $2, $3
/* 10DD3C 0020DC3C 0000A58E */  lw         $5, 0x0($21)
/* 10DD40 0020DC40 D000A627 */  addiu      $6, $sp, 0xD0
/* 10DD44 0020DC44 D901023C */  lui        $2, %hi(MenuExCashBuffer)
/* 10DD48 0020DC48 10044724 */  addiu      $7, $2, %lo(MenuExCashBuffer)
/* 10DD4C 0020DC4C 28460072 */  paddub     $8, $16, $0
/* 10DD50 0020DC50 D901023C */  lui        $2, %hi(MenuExCashBuffer)
/* 10DD54 0020DC54 10044924 */  addiu      $9, $2, %lo(MenuExCashBuffer)
/* 10DD58 0020DC58 01000A24 */  addiu      $10, $0, 0x1
/* 10DD5C 0020DC5C 285E0070 */  paddub     $11, $0, $0
/* 10DD60 0020DC60 24E6040C */  jal        LoadPackData3__10CCharacterFPUiPcP14CDataAlloc2_1_iP14CDataAlloc2_1_ii
/* 10DD64 0020DC64 00000000 */   nop
/* 10DD68 0020DC68 28266072 */  paddub     $4, $19, $0
/* 10DD6C 0020DC6C 282E4072 */  paddub     $5, $18, $0
/* 10DD70 0020DC70 28368072 */  paddub     $6, $20, $0
/* 10DD74 0020DC74 1C35080C */  jal        SetMenuWeaponModelReference__Fiii
/* 10DD78 0020DC78 00000000 */   nop
/* 10DD7C 0020DC7C 01005226 */  addiu      $18, $18, 0x1
.L0020DC80:
/* 10DD80 0020DC80 01007326 */  addiu      $19, $19, 0x1
.L0020DC84:
/* 10DD84 0020DC84 0A00622A */  slti       $2, $19, 0xA
/* 10DD88 0020DC88 9AFF4014 */  bnez       $2, .L0020DAF4
/* 10DD8C 0020DC8C 00000000 */   nop
/* 10DD90 0020DC90 F095828F */  lw         $2, -0x6A10($gp)
/* 10DD94 0020DC94 0E00013C */  lui        $at, (0xEC010 >> 16)
/* 10DD98 0020DC98 10C02134 */  ori        $at, $at, (0xEC010 & 0xFFFF)
/* 10DD9C 0020DC9C 21104100 */  addu       $2, $2, $at
/* 10DDA0 0020DCA0 189582AF */  sw         $2, -0x6AE8($gp)
/* 10DDA4 0020DCA4 1895848F */  lw         $4, -0x6AE8($gp)
/* 10DDA8 0020DCA8 00AF080C */  jal        MenuCalcBufAlignment__FP1
/* 10DDAC 0020DCAC 00000000 */   nop
/* 10DDB0 0020DCB0 189582AF */  sw         $2, -0x6AE8($gp)
/* 10DDB4 0020DCB4 2A00023C */  lui        $2, %hi(_1107)
/* 10DDB8 0020DCB8 B0DF4424 */  addiu      $4, $2, %lo(_1107)
/* 10DDBC 0020DCBC 948B858F */  lw         $5, -0x746C($gp)
/* 10DDC0 0020DCC0 A611040C */  jal        printf
/* 10DDC4 0020DCC4 00000000 */   nop
/* 10DDC8 0020DCC8 2A00023C */  lui        $2, %hi(_1108)
/* 10DDCC 0020DCCC D0DF4424 */  addiu      $4, $2, %lo(_1108)
/* 10DDD0 0020DCD0 F095858F */  lw         $5, -0x6A10($gp)
/* 10DDD4 0020DCD4 A611040C */  jal        printf
/* 10DDD8 0020DCD8 00000000 */   nop
/* 10DDDC 0020DCDC D901013C */  lui        $at, (0x1D9041C >> 16)
/* 10DDE0 0020DCE0 1C04258C */  lw         $5, (0x1D9041C & 0xFFFF)($at)
/* 10DDE4 0020DCE4 2A00023C */  lui        $2, %hi(_1109)
/* 10DDE8 0020DCE8 F0DF4424 */  addiu      $4, $2, %lo(_1109)
/* 10DDEC 0020DCEC A611040C */  jal        printf
/* 10DDF0 0020DCF0 00000000 */   nop
/* 10DDF4 0020DCF4 D901013C */  lui        $at, (0x1D90418 >> 16)
/* 10DDF8 0020DCF8 1804228C */  lw         $2, (0x1D90418 & 0xFFFF)($at)
/* 10DDFC 0020DCFC 00190200 */  sll        $3, $2, 4
/* 10DE00 0020DD00 D901013C */  lui        $at, (0x1D90410 >> 16)
/* 10DE04 0020DD04 1004228C */  lw         $2, (0x1D90410 & 0xFFFF)($at)
/* 10DE08 0020DD08 21284300 */  addu       $5, $2, $3
/* 10DE0C 0020DD0C 2A00023C */  lui        $2, %hi(_1110)
/* 10DE10 0020DD10 10E04424 */  addiu      $4, $2, %lo(_1110)
/* 10DE14 0020DD14 A611040C */  jal        printf
/* 10DE18 0020DD18 00000000 */   nop
/* 10DE1C 0020DD1C 2A00023C */  lui        $2, %hi(_1111)
/* 10DE20 0020DD20 30E04424 */  addiu      $4, $2, %lo(_1111)
/* 10DE24 0020DD24 1895858F */  lw         $5, -0x6AE8($gp)
/* 10DE28 0020DD28 A611040C */  jal        printf
/* 10DE2C 0020DD2C 00000000 */   nop
/* 10DE30 0020DD30 8000BF7B */  lq         $31, 0x80($sp)
/* 10DE34 0020DD34 7000B77B */  lq         $23, 0x70($sp)
/* 10DE38 0020DD38 6000B67B */  lq         $22, 0x60($sp)
/* 10DE3C 0020DD3C 5000B57B */  lq         $21, 0x50($sp)
/* 10DE40 0020DD40 4000B47B */  lq         $20, 0x40($sp)
/* 10DE44 0020DD44 3000B37B */  lq         $19, 0x30($sp)
/* 10DE48 0020DD48 2000B27B */  lq         $18, 0x20($sp)
/* 10DE4C 0020DD4C 1000B17B */  lq         $17, 0x10($sp)
/* 10DE50 0020DD50 0000B07B */  lq         $16, 0x0($sp)
/* 10DE54 0020DD54 F000BD27 */  addiu      $sp, $sp, 0xF0
/* 10DE58 0020DD58 0800E003 */  jr         $31
/* 10DE5C 0020DD5C 00000000 */   nop
