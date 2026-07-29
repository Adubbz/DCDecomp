.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadData__Fv__3
/* 00EC30 01DBA930 50FEBD27 */  addiu       $29, $29, -0x1B0
/* 00EC34 01DBA934 3000BF7F */  sq          $31, 0x30($29)
/* 00EC38 01DBA938 2000B27F */  sq          $18, 0x20($29)
/* 00EC3C 01DBA93C 1000B17F */  sq          $17, 0x10($29)
/* 00EC40 01DBA940 0000B07F */  sq          $16, 0x0($29)
/* 00EC44 01DBA944 4000A427 */  addiu       $4, $29, 0x40
/* 00EC48 01DBA948 509F040C */  jal         __ct__10CFrameAttrFv
/* 00EC4C 01DBA94C 00000000 */   nop
/* 00EC50 01DBA950 01000224 */  addiu       $2, $0, 0x1
/* 00EC54 01DBA954 4C00A2A3 */  sb          $2, 0x4C($29)
/* 00EC58 01DBA958 C842023C */  lui         $2, (0x42C80000 >> 16)
/* 00EC5C 01DBA95C 4400A2AF */  sw          $2, 0x44($29)
/* 00EC60 01DBA960 4800A0A3 */  sb          $0, 0x48($29)
/* 00EC64 01DBA964 4B00A0A3 */  sb          $0, 0x4B($29)
/* 00EC68 01DBA968 789C828F */  lw          $2, -0x6388($28)
/* 00EC6C 01DBA96C 040040A0 */  sb          $0, 0x4($2)
/* 00EC70 01DBA970 789C848F */  lw          $4, -0x6388($28)
/* 00EC74 01DBA974 40438380 */  lb          $3, 0x4340($4)
/* 00EC78 01DBA978 40110300 */  sll         $2, $3, 5
/* 00EC7C 01DBA97C 23104300 */  subu        $2, $2, $3
/* 00EC80 01DBA980 C0100200 */  sll         $2, $2, 3
/* 00EC84 01DBA984 21104400 */  addu        $2, $2, $4
/* 00EC88 01DBA988 0C454684 */  lh          $6, 0x450C($2)
/* 00EC8C 01DBA98C E000A427 */  addiu       $4, $29, 0xE0
/* 00EC90 01DBA990 2001A527 */  addiu       $5, $29, 0x120
/* 00EC94 01DBA994 ECDC060C */  jal         BtGetWeaponNamePath3__FPcPci
/* 00EC98 01DBA998 00000000 */   nop
/* 00EC9C 01DBA99C 789C848F */  lw          $4, -0x6388($28)
/* 00ECA0 01DBA9A0 40438380 */  lb          $3, 0x4340($4)
/* 00ECA4 01DBA9A4 40110300 */  sll         $2, $3, 5
/* 00ECA8 01DBA9A8 23104300 */  subu        $2, $2, $3
/* 00ECAC 01DBA9AC C0100200 */  sll         $2, $2, 3
/* 00ECB0 01DBA9B0 21104400 */  addu        $2, $2, $4
/* 00ECB4 01DBA9B4 0C454584 */  lh          $5, 0x450C($2)
/* 00ECB8 01DBA9B8 DC01023C */  lui         $2, %hi(LIT_5226)
/* 00ECBC 01DBA9BC B8314424 */  addiu       $4, $2, %lo(LIT_5226)
/* 00ECC0 01DBA9C0 E000A627 */  addiu       $6, $29, 0xE0
/* 00ECC4 01DBA9C4 A611040C */  jal         printf
/* 00ECC8 01DBA9C8 00000000 */   nop
/* 00ECCC 01DBA9CC A000A427 */  addiu       $4, $29, 0xA0
/* 00ECD0 01DBA9D0 DC01023C */  lui         $2, %hi(LIT_5227)
/* 00ECD4 01DBA9D4 D0314524 */  addiu       $5, $2, %lo(LIT_5227)
/* 00ECD8 01DBA9D8 5A15040C */  jal         strcpy
/* 00ECDC 01DBA9DC 00000000 */   nop
/* 00ECE0 01DBA9E0 A000A427 */  addiu       $4, $29, 0xA0
/* 00ECE4 01DBA9E4 E000A527 */  addiu       $5, $29, 0xE0
/* 00ECE8 01DBA9E8 BC14040C */  jal         strcat
/* 00ECEC 01DBA9EC 00000000 */   nop
/* 00ECF0 01DBA9F0 DC01023C */  lui         $2, %hi(LIT_5228)
/* 00ECF4 01DBA9F4 E0314424 */  addiu       $4, $2, %lo(LIT_5228)
/* 00ECF8 01DBA9F8 948B858F */  lw          $5, -0x746C($28)
/* 00ECFC 01DBA9FC A001A627 */  addiu       $6, $29, 0x1A0
/* 00ED00 01DBAA00 D8FC040C */  jal         LoadFile__FPcPvPi
/* 00ED04 01DBAA04 00000000 */   nop
/* 00ED08 01DBAA08 A001A28F */  lw          $2, 0x1A0($29)
/* 00ED0C 01DBAA0C 83110200 */  sra         $2, $2, 6
/* 00ED10 01DBAA10 01004224 */  addiu       $2, $2, 0x1
/* 00ED14 01DBAA14 80110200 */  sll         $2, $2, 6
/* 00ED18 01DBAA18 82100200 */  srl         $2, $2, 2
/* 00ED1C 01DBAA1C 80180200 */  sll         $3, $2, 2
/* 00ED20 01DBAA20 948B828F */  lw          $2, -0x746C($28)
/* 00ED24 01DBAA24 21804300 */  addu        $16, $2, $3
/* 00ED28 01DBAA28 DC01023C */  lui         $2, %hi(LIT_5229)
/* 00ED2C 01DBAA2C 00324424 */  addiu       $4, $2, %lo(LIT_5229)
/* 00ED30 01DBAA30 282E0072 */  paddub      $5, $16, $0
/* 00ED34 01DBAA34 A401A627 */  addiu       $6, $29, 0x1A4
/* 00ED38 01DBAA38 D8FC040C */  jal         LoadFile__FPcPvPi
/* 00ED3C 01DBAA3C 00000000 */   nop
/* 00ED40 01DBAA40 A401A28F */  lw          $2, 0x1A4($29)
/* 00ED44 01DBAA44 83110200 */  sra         $2, $2, 6
/* 00ED48 01DBAA48 01004224 */  addiu       $2, $2, 0x1
/* 00ED4C 01DBAA4C 80110200 */  sll         $2, $2, 6
/* 00ED50 01DBAA50 82100200 */  srl         $2, $2, 2
/* 00ED54 01DBAA54 80100200 */  sll         $2, $2, 2
/* 00ED58 01DBAA58 21880202 */  addu        $17, $16, $2
/* 00ED5C 01DBAA5C DC01023C */  lui         $2, %hi(LIT_5230)
/* 00ED60 01DBAA60 20324424 */  addiu       $4, $2, %lo(LIT_5230)
/* 00ED64 01DBAA64 282E2072 */  paddub      $5, $17, $0
/* 00ED68 01DBAA68 A801A627 */  addiu       $6, $29, 0x1A8
/* 00ED6C 01DBAA6C D8FC040C */  jal         LoadFile__FPcPvPi
/* 00ED70 01DBAA70 00000000 */   nop
/* 00ED74 01DBAA74 A801A28F */  lw          $2, 0x1A8($29)
/* 00ED78 01DBAA78 83110200 */  sra         $2, $2, 6
/* 00ED7C 01DBAA7C 01004224 */  addiu       $2, $2, 0x1
/* 00ED80 01DBAA80 80110200 */  sll         $2, $2, 6
/* 00ED84 01DBAA84 82100200 */  srl         $2, $2, 2
/* 00ED88 01DBAA88 80100200 */  sll         $2, $2, 2
/* 00ED8C 01DBAA8C 21902202 */  addu        $18, $17, $2
/* 00ED90 01DBAA90 A000A427 */  addiu       $4, $29, 0xA0
/* 00ED94 01DBAA94 282E4072 */  paddub      $5, $18, $0
/* 00ED98 01DBAA98 AC01A627 */  addiu       $6, $29, 0x1AC
/* 00ED9C 01DBAA9C D8FC040C */  jal         LoadFile__FPcPvPi
/* 00EDA0 01DBAAA0 00000000 */   nop
/* 00EDA4 01DBAAA4 DC4F050C */  jal         wait_now_loading_vsync__Fv
/* 00EDA8 01DBAAA8 00000000 */   nop
/* 00EDAC 01DBAAAC 789C828F */  lw          $2, -0x6388($28)
/* 00EDB0 01DBAAB0 04004480 */  lb          $4, 0x4($2)
/* 00EDB4 01DBAAB4 01000524 */  addiu       $5, $0, 0x1
/* 00EDB8 01DBAAB8 948B868F */  lw          $6, -0x746C($28)
/* 00EDBC 01DBAABC 283E0072 */  paddub      $7, $16, $0
/* 00EDC0 01DBAAC0 28462072 */  paddub      $8, $17, $0
/* 00EDC4 01DBAAC4 284E4072 */  paddub      $9, $18, $0
/* 00EDC8 01DBAAC8 F0E8760C */  jal         LoadChara2__FiiPUiPUiPUiPUi
/* 00EDCC 01DBAACC 00000000 */   nop
/* 00EDD0 01DBAAD0 4843023C */  lui         $2, (0x43480000 >> 16)
/* 00EDD4 01DBAAD4 00608244 */  mtc1        $2, $f12
/* 00EDD8 01DBAAD8 00688044 */  mtc1        $0, $f13
/* 00EDDC 01DBAADC 1643023C */  lui         $2, (0x43160000 >> 16)
/* 00EDE0 01DBAAE0 00708244 */  mtc1        $2, $f14
/* 00EDE4 01DBAAE4 109D848F */  lw          $4, -0x62F0($28)
/* 00EDE8 01DBAAE8 A09F040C */  jal         SetPosition__6CFrameFfff
/* 00EDEC 01DBAAEC 00000000 */   nop
/* 00EDF0 01DBAAF0 789C828F */  lw          $2, -0x6388($28)
/* 00EDF4 01DBAAF4 04004480 */  lb          $4, 0x4($2)
/* 00EDF8 01DBAAF8 282E0070 */  paddub      $5, $0, $0
/* 00EDFC 01DBAAFC 18E8760C */  jal         Get_Main_EffectPtr__Fii
/* 00EE00 01DBAB00 00000000 */   nop
/* 00EE04 01DBAB04 28864070 */  paddub      $16, $2, $0
/* 00EE08 01DBAB08 DC01023C */  lui         $2, %hi(LIT_5231)
/* 00EE0C 01DBAB0C 40324424 */  addiu       $4, $2, %lo(LIT_5231)
/* 00EE10 01DBAB10 948B858F */  lw          $5, -0x746C($28)
/* 00EE14 01DBAB14 28360070 */  paddub      $6, $0, $0
/* 00EE18 01DBAB18 D8FC040C */  jal         LoadFile__FPcPvPi
/* 00EE1C 01DBAB1C 00000000 */   nop
/* 00EE20 01DBAB20 DC4F050C */  jal         wait_now_loading_vsync__Fv
/* 00EE24 01DBAB24 00000000 */   nop
/* 00EE28 01DBAB28 28260072 */  paddub      $4, $16, $0
/* 00EE2C 01DBAB2C 948B858F */  lw          $5, -0x746C($28)
/* 00EE30 01DBAB30 28360070 */  paddub      $6, $0, $0
/* 00EE34 01DBAB34 8CE8760C */  jal         MainChara_Effect__FP14BT_SHOT_EFFECTPUii
/* 00EE38 01DBAB38 00000000 */   nop
/* 00EE3C 01DBAB3C 28260070 */  paddub      $4, $0, $0
/* 00EE40 01DBAB40 FC6C050C */  jal         SndVoiceLoad__Fi
/* 00EE44 01DBAB44 00000000 */   nop
/* 00EE48 01DBAB48 07004010 */  beqz        $2, .L01DBAB68_2F6168
/* 00EE4C 01DBAB4C 00000000 */   nop
/* 00EE50 01DBAB50 DC01023C */  lui         $2, %hi(LIT_5232)
/* 00EE54 01DBAB54 68324424 */  addiu       $4, $2, %lo(LIT_5232)
/* 00EE58 01DBAB58 A611040C */  jal         printf
/* 00EE5C 01DBAB5C 00000000 */   nop
/* 00EE60 01DBAB60 05000010 */  b           .L01DBAB78_2F6178
/* 00EE64 01DBAB64 00000000 */   nop
.L01DBAB68_2F6168:
/* 00EE68 01DBAB68 DC01023C */  lui         $2, %hi(LIT_5233)
/* 00EE6C 01DBAB6C 78324424 */  addiu       $4, $2, %lo(LIT_5233)
/* 00EE70 01DBAB70 A611040C */  jal         printf
/* 00EE74 01DBAB74 00000000 */   nop
.L01DBAB78_2F6178:
/* 00EE78 01DBAB78 948B858F */  lw          $5, -0x746C($28)
/* 00EE7C 01DBAB7C DC01023C */  lui         $2, %hi(LIT_5234)
/* 00EE80 01DBAB80 90324424 */  addiu       $4, $2, %lo(LIT_5234)
/* 00EE84 01DBAB84 28360070 */  paddub      $6, $0, $0
/* 00EE88 01DBAB88 D8FC040C */  jal         LoadFile__FPcPvPi
/* 00EE8C 01DBAB8C 00000000 */   nop
/* 00EE90 01DBAB90 DC4F050C */  jal         wait_now_loading_vsync__Fv
/* 00EE94 01DBAB94 00000000 */   nop
/* 00EE98 01DBAB98 948B848F */  lw          $4, -0x746C($28)
/* 00EE9C 01DBAB9C DC01023C */  lui         $2, %hi(LIT_5235)
/* 00EEA0 01DBABA0 B0324524 */  addiu       $5, $2, %lo(LIT_5235)
/* 00EEA4 01DBABA4 F001023C */  lui         $2, %hi(MainModelBuffer)
/* 00EEA8 01DBABA8 40664624 */  addiu       $6, $2, %lo(MainModelBuffer)
/* 00EEAC 01DBABAC 5CDB060C */  jal         LoadMDSFilePack__FPUiPcP14CDataAlloc2_1_
/* 00EEB0 01DBABB0 00000000 */   nop
/* 00EEB4 01DBABB4 849D82AF */  sw          $2, -0x627C($28)
/* 00EEB8 01DBABB8 948B848F */  lw          $4, -0x746C($28)
/* 00EEBC 01DBABBC DC01023C */  lui         $2, %hi(LIT_5236)
/* 00EEC0 01DBABC0 D0324524 */  addiu       $5, $2, %lo(LIT_5236)
/* 00EEC4 01DBABC4 F001023C */  lui         $2, %hi(MainModelBuffer)
/* 00EEC8 01DBABC8 40664624 */  addiu       $6, $2, %lo(MainModelBuffer)
/* 00EECC 01DBABCC 5CDB060C */  jal         LoadMDSFilePack__FPUiPcP14CDataAlloc2_1_
/* 00EED0 01DBABD0 00000000 */   nop
/* 00EED4 01DBABD4 889D82AF */  sw          $2, -0x6278($28)
/* 00EED8 01DBABD8 948B848F */  lw          $4, -0x746C($28)
/* 00EEDC 01DBABDC DC01023C */  lui         $2, %hi(LIT_5237)
/* 00EEE0 01DBABE0 F0324524 */  addiu       $5, $2, %lo(LIT_5237)
/* 00EEE4 01DBABE4 F001023C */  lui         $2, %hi(MainModelBuffer)
/* 00EEE8 01DBABE8 40664624 */  addiu       $6, $2, %lo(MainModelBuffer)
/* 00EEEC 01DBABEC 5CDB060C */  jal         LoadMDSFilePack__FPUiPcP14CDataAlloc2_1_
/* 00EEF0 01DBABF0 00000000 */   nop
/* 00EEF4 01DBABF4 8C9D82AF */  sw          $2, -0x6274($28)
/* 00EEF8 01DBABF8 8C9D848F */  lw          $4, -0x6274($28)
/* 00EEFC 01DBABFC D4808CC7 */  lwc1        $f12, -0x7F2C($28)
/* 00EF00 01DBAC00 46630046 */  mov.s       $f13, $f12
/* 00EF04 01DBAC04 86630046 */  mov.s       $f14, $f12
/* 00EF08 01DBAC08 D49F040C */  jal         SetScale__6CFrameFfff
/* 00EF0C 01DBAC0C 00000000 */   nop
/* 00EF10 01DBAC10 948B848F */  lw          $4, -0x746C($28)
/* 00EF14 01DBAC14 DC01023C */  lui         $2, %hi(LIT_5239)
/* 00EF18 01DBAC18 00334524 */  addiu       $5, $2, %lo(LIT_5239)
/* 00EF1C 01DBAC1C F001023C */  lui         $2, %hi(MainModelBuffer)
/* 00EF20 01DBAC20 40664624 */  addiu       $6, $2, %lo(MainModelBuffer)
/* 00EF24 01DBAC24 5CDB060C */  jal         LoadMDSFilePack__FPUiPcP14CDataAlloc2_1_
/* 00EF28 01DBAC28 00000000 */   nop
/* 00EF2C 01DBAC2C C89C838F */  lw          $3, -0x6338($28)
/* 00EF30 01DBAC30 0100013C */  lui         $1, (0x10000 >> 16)
/* 00EF34 01DBAC34 21086100 */  addu        $1, $3, $1
/* 00EF38 01DBAC38 84BD22AC */  sw          $2, -0x427C($1)
/* 00EF3C 01DBAC3C 948B848F */  lw          $4, -0x746C($28)
/* 00EF40 01DBAC40 DC01023C */  lui         $2, %hi(LIT_4974)
/* 00EF44 01DBAC44 C0304524 */  addiu       $5, $2, %lo(LIT_4974)
/* 00EF48 01DBAC48 F001023C */  lui         $2, %hi(MainModelBuffer)
/* 00EF4C 01DBAC4C 40664624 */  addiu       $6, $2, %lo(MainModelBuffer)
/* 00EF50 01DBAC50 80DB060C */  jal         LoadCollisionFilePack__FPUiPcP14CDataAlloc2_1_
/* 00EF54 01DBAC54 00000000 */   nop
/* 00EF58 01DBAC58 C89C838F */  lw          $3, -0x6338($28)
/* 00EF5C 01DBAC5C 0100013C */  lui         $1, (0x10000 >> 16)
/* 00EF60 01DBAC60 21086100 */  addu        $1, $3, $1
/* 00EF64 01DBAC64 88BD22AC */  sw          $2, -0x4278($1)
/* 00EF68 01DBAC68 C89C828F */  lw          $2, -0x6338($28)
/* 00EF6C 01DBAC6C 0100013C */  lui         $1, (0x10000 >> 16)
/* 00EF70 01DBAC70 21084100 */  addu        $1, $2, $1
/* 00EF74 01DBAC74 84BD248C */  lw          $4, -0x427C($1)
/* 00EF78 01DBAC78 4000A527 */  addiu       $5, $29, 0x40
/* 00EF7C 01DBAC7C 01000624 */  addiu       $6, $0, 0x1
/* 00EF80 01DBAC80 283E0070 */  paddub      $7, $0, $0
/* 00EF84 01DBAC84 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 00EF88 01DBAC88 00000000 */   nop
/* 00EF8C 01DBAC8C 948B848F */  lw          $4, -0x746C($28)
/* 00EF90 01DBAC90 DC01023C */  lui         $2, %hi(LIT_5240)
/* 00EF94 01DBAC94 10334524 */  addiu       $5, $2, %lo(LIT_5240)
/* 00EF98 01DBAC98 28360070 */  paddub      $6, $0, $0
/* 00EF9C 01DBAC9C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00EFA0 01DBACA0 00000000 */   nop
/* 00EFA4 01DBACA4 EB01033C */  lui         $3, %hi(NewChangeFx)
/* 00EFA8 01DBACA8 D03A6424 */  addiu       $4, $3, %lo(NewChangeFx)
/* 00EFAC 01DBACAC 282E4070 */  paddub      $5, $2, $0
/* 00EFB0 01DBACB0 DC01023C */  lui         $2, %hi(LIT_5241)
/* 00EFB4 01DBACB4 20334624 */  addiu       $6, $2, %lo(LIT_5241)
/* 00EFB8 01DBACB8 F001023C */  lui         $2, %hi(MainModelBuffer)
/* 00EFBC 01DBACBC 40664724 */  addiu       $7, $2, %lo(MainModelBuffer)
/* 00EFC0 01DBACC0 0B000824 */  addiu       $8, $0, 0xB
/* 00EFC4 01DBACC4 F001023C */  lui         $2, %hi(MainModelBuffer)
/* 00EFC8 01DBACC8 40664924 */  addiu       $9, $2, %lo(MainModelBuffer)
/* 00EFCC 01DBACCC 28560070 */  paddub      $10, $0, $0
/* 00EFD0 01DBACD0 14E6040C */  jal         LoadPackData2__10CCharacterFPUiPcP14CDataAlloc2_1_iP14CDataAlloc2_1_i
/* 00EFD4 01DBACD4 00000000 */   nop
/* 00EFD8 01DBACD8 EB01023C */  lui         $2, %hi(itemOpenSmallFx)
/* 00EFDC 01DBACDC F05E4424 */  addiu       $4, $2, %lo(itemOpenSmallFx)
/* 00EFE0 01DBACE0 948B858F */  lw          $5, -0x746C($28)
/* 00EFE4 01DBACE4 DC01023C */  lui         $2, %hi(LIT_5242)
/* 00EFE8 01DBACE8 30334624 */  addiu       $6, $2, %lo(LIT_5242)
/* 00EFEC 01DBACEC F001023C */  lui         $2, %hi(MainModelBuffer)
/* 00EFF0 01DBACF0 40664724 */  addiu       $7, $2, %lo(MainModelBuffer)
/* 00EFF4 01DBACF4 2B00023C */  lui         $2, %hi(MotionData)
/* 00EFF8 01DBACF8 20B04824 */  addiu       $8, $2, %lo(MotionData)
/* 00EFFC 01DBACFC DC01023C */  lui         $2, %hi(itemOpenSmallFx_info)
/* 00F000 01DBAD00 20254924 */  addiu       $9, $2, %lo(itemOpenSmallFx_info)
/* 00F004 01DBAD04 28560070 */  paddub      $10, $0, $0
/* 00F008 01DBAD08 8CDA060C */  jal         LoadPack__12CMotionModelFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_P11MOTION_INFOi
/* 00F00C 01DBAD0C 00000000 */   nop
/* 00F010 01DBAD10 EB01023C */  lui         $2, %hi(itemOpenBigFx)
/* 00F014 01DBAD14 30604424 */  addiu       $4, $2, %lo(itemOpenBigFx)
/* 00F018 01DBAD18 948B858F */  lw          $5, -0x746C($28)
/* 00F01C 01DBAD1C DC01023C */  lui         $2, %hi(LIT_5243)
/* 00F020 01DBAD20 38334624 */  addiu       $6, $2, %lo(LIT_5243)
/* 00F024 01DBAD24 F001023C */  lui         $2, %hi(MainModelBuffer)
/* 00F028 01DBAD28 40664724 */  addiu       $7, $2, %lo(MainModelBuffer)
/* 00F02C 01DBAD2C 2B00023C */  lui         $2, %hi(MotionData)
/* 00F030 01DBAD30 20B04824 */  addiu       $8, $2, %lo(MotionData)
/* 00F034 01DBAD34 DC01023C */  lui         $2, %hi(itemOpenBigFx_info)
/* 00F038 01DBAD38 40254924 */  addiu       $9, $2, %lo(itemOpenBigFx_info)
/* 00F03C 01DBAD3C 28560070 */  paddub      $10, $0, $0
/* 00F040 01DBAD40 8CDA060C */  jal         LoadPack__12CMotionModelFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_P11MOTION_INFOi
/* 00F044 01DBAD44 00000000 */   nop
/* 00F048 01DBAD48 948B848F */  lw          $4, -0x746C($28)
/* 00F04C 01DBAD4C DC01023C */  lui         $2, %hi(LIT_5244)
/* 00F050 01DBAD50 40334524 */  addiu       $5, $2, %lo(LIT_5244)
/* 00F054 01DBAD54 28360070 */  paddub      $6, $0, $0
/* 00F058 01DBAD58 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00F05C 01DBAD5C 00000000 */   nop
/* 00F060 01DBAD60 EB01033C */  lui         $3, %hi(Water_Splash)
/* 00F064 01DBAD64 20006424 */  addiu       $4, $3, %lo(Water_Splash)
/* 00F068 01DBAD68 282E4070 */  paddub      $5, $2, $0
/* 00F06C 01DBAD6C DC01023C */  lui         $2, %hi(LIT_5241)
/* 00F070 01DBAD70 20334624 */  addiu       $6, $2, %lo(LIT_5241)
/* 00F074 01DBAD74 F001023C */  lui         $2, %hi(MainModelBuffer)
/* 00F078 01DBAD78 40664724 */  addiu       $7, $2, %lo(MainModelBuffer)
/* 00F07C 01DBAD7C 06000824 */  addiu       $8, $0, 0x6
/* 00F080 01DBAD80 F001023C */  lui         $2, %hi(MainModelBuffer)
/* 00F084 01DBAD84 40664924 */  addiu       $9, $2, %lo(MainModelBuffer)
/* 00F088 01DBAD88 28560070 */  paddub      $10, $0, $0
/* 00F08C 01DBAD8C 14E6040C */  jal         LoadPackData2__10CCharacterFPUiPcP14CDataAlloc2_1_iP14CDataAlloc2_1_i
/* 00F090 01DBAD90 00000000 */   nop
/* 00F094 01DBAD94 948B848F */  lw          $4, -0x746C($28)
/* 00F098 01DBAD98 DC01023C */  lui         $2, %hi(LIT_5245)
/* 00F09C 01DBAD9C 50334524 */  addiu       $5, $2, %lo(LIT_5245)
/* 00F0A0 01DBADA0 28360070 */  paddub      $6, $0, $0
/* 00F0A4 01DBADA4 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00F0A8 01DBADA8 00000000 */   nop
/* 00F0AC 01DBADAC 28864070 */  paddub      $16, $2, $0
/* 00F0B0 01DBADB0 EB01023C */  lui         $2, %hi(Trap_Circle)
/* 00F0B4 01DBADB4 D0114424 */  addiu       $4, $2, %lo(Trap_Circle)
/* 00F0B8 01DBADB8 EB01023C */  lui         $2, %hi(Trap_Circle_TexAnim)
/* 00F0BC 01DBADBC 80234524 */  addiu       $5, $2, %lo(Trap_Circle_TexAnim)
/* 00F0C0 01DBADC0 10000624 */  addiu       $6, $0, 0x10
/* 00F0C4 01DBADC4 FCDF040C */  jal         InitializeTexAnime__10CCharacterFP13CTexAnimeDatai
/* 00F0C8 01DBADC8 00000000 */   nop
/* 00F0CC 01DBADCC EB01023C */  lui         $2, %hi(Trap_Circle)
/* 00F0D0 01DBADD0 D0114424 */  addiu       $4, $2, %lo(Trap_Circle)
/* 00F0D4 01DBADD4 282E0072 */  paddub      $5, $16, $0
/* 00F0D8 01DBADD8 DC01023C */  lui         $2, %hi(LIT_5241)
/* 00F0DC 01DBADDC 20334624 */  addiu       $6, $2, %lo(LIT_5241)
/* 00F0E0 01DBADE0 F001023C */  lui         $2, %hi(MainModelBuffer)
/* 00F0E4 01DBADE4 40664724 */  addiu       $7, $2, %lo(MainModelBuffer)
/* 00F0E8 01DBADE8 47000824 */  addiu       $8, $0, 0x47
/* 00F0EC 01DBADEC F001023C */  lui         $2, %hi(MainModelBuffer)
/* 00F0F0 01DBADF0 40664924 */  addiu       $9, $2, %lo(MainModelBuffer)
/* 00F0F4 01DBADF4 28560070 */  paddub      $10, $0, $0
/* 00F0F8 01DBADF8 14E6040C */  jal         LoadPackData2__10CCharacterFPUiPcP14CDataAlloc2_1_iP14CDataAlloc2_1_i
/* 00F0FC 01DBADFC 00000000 */   nop
/* 00F100 01DBAE00 EB01013C */  lui         $1, %hi(Trap_Circle + 0xBC)
/* 00F104 01DBAE04 8C12248C */  lw          $4, %lo(Trap_Circle + 0xBC)($1)
/* 00F108 01DBAE08 4000A527 */  addiu       $5, $29, 0x40
/* 00F10C 01DBAE0C 01000624 */  addiu       $6, $0, 0x1
/* 00F110 01DBAE10 40000724 */  addiu       $7, $0, 0x40
/* 00F114 01DBAE14 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 00F118 01DBAE18 00000000 */   nop
/* 00F11C 01DBAE1C A49D828F */  lw          $2, -0x625C($28)
/* 00F120 01DBAE20 01004624 */  addiu       $6, $2, 0x1
/* 00F124 01DBAE24 6001A427 */  addiu       $4, $29, 0x160
/* 00F128 01DBAE28 DC01023C */  lui         $2, %hi(LIT_5246)
/* 00F12C 01DBAE2C 60334524 */  addiu       $5, $2, %lo(LIT_5246)
/* 00F130 01DBAE30 1614040C */  jal         sprintf
/* 00F134 01DBAE34 00000000 */   nop
/* 00F138 01DBAE38 948B848F */  lw          $4, -0x746C($28)
/* 00F13C 01DBAE3C 6001A527 */  addiu       $5, $29, 0x160
/* 00F140 01DBAE40 28360070 */  paddub      $6, $0, $0
/* 00F144 01DBAE44 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00F148 01DBAE48 00000000 */   nop
/* 00F14C 01DBAE4C 28264070 */  paddub      $4, $2, $0
/* 00F150 01DBAE50 F001023C */  lui         $2, %hi(MainModelBuffer)
/* 00F154 01DBAE54 40664524 */  addiu       $5, $2, %lo(MainModelBuffer)
/* 00F158 01DBAE58 28360070 */  paddub      $6, $0, $0
/* 00F15C 01DBAE5C 283E0070 */  paddub      $7, $0, $0
/* 00F160 01DBAE60 28460070 */  paddub      $8, $0, $0
/* 00F164 01DBAE64 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 00F168 01DBAE68 00000000 */   nop
/* 00F16C 01DBAE6C 0C9D82AF */  sw          $2, -0x62F4($28)
/* 00F170 01DBAE70 F001013C */  lui         $1, %hi(MasekiModelBuffer + 0x8)
/* 00F174 01DBAE74 986620AC */  sw          $0, %lo(MasekiModelBuffer + 0x8)($1)
/* 00F178 01DBAE78 DC01023C */  lui         $2, %hi(LIT_5247)
/* 00F17C 01DBAE7C 70334424 */  addiu       $4, $2, %lo(LIT_5247)
/* 00F180 01DBAE80 948B858F */  lw          $5, -0x746C($28)
/* 00F184 01DBAE84 28360070 */  paddub      $6, $0, $0
/* 00F188 01DBAE88 D8FC040C */  jal         LoadFile__FPcPvPi
/* 00F18C 01DBAE8C 00000000 */   nop
/* 00F190 01DBAE90 DC4F050C */  jal         wait_now_loading_vsync__Fv
/* 00F194 01DBAE94 00000000 */   nop
/* 00F198 01DBAE98 E601023C */  lui         $2, %hi(MasekiEffect)
/* 00F19C 01DBAE9C 80B34424 */  addiu       $4, $2, %lo(MasekiEffect)
/* 00F1A0 01DBAEA0 DC01023C */  lui         $2, %hi(MyEntryEffect_Maseki00)
/* 00F1A4 01DBAEA4 30224524 */  addiu       $5, $2, %lo(MyEntryEffect_Maseki00)
/* 00F1A8 01DBAEA8 948B868F */  lw          $6, -0x746C($28)
/* 00F1AC 01DBAEAC 06000724 */  addiu       $7, $0, 0x6
/* 00F1B0 01DBAEB0 F001023C */  lui         $2, %hi(MasekiModelBuffer)
/* 00F1B4 01DBAEB4 90664824 */  addiu       $8, $2, %lo(MasekiModelBuffer)
/* 00F1B8 01DBAEB8 03000924 */  addiu       $9, $0, 0x3
/* 00F1BC 01DBAEBC 98B4060C */  jal         Entry2__12CSHOT_EFFECTFP14BT_SHOT_EFFECTPUiiP14CDataAlloc2_1_i
/* 00F1C0 01DBAEC0 00000000 */   nop
/* 00F1C4 01DBAEC4 E601023C */  lui         $2, %hi(MasekiEffect + 0xA160)
/* 00F1C8 01DBAEC8 E0544424 */  addiu       $4, $2, %lo(MasekiEffect + 0xA160)
/* 00F1CC 01DBAECC E601023C */  lui         $2, %hi(MasekiEffect)
/* 00F1D0 01DBAED0 80B34524 */  addiu       $5, $2, %lo(MasekiEffect)
/* 00F1D4 01DBAED4 60A10634 */  ori         $6, $0, 0xA160
/* 00F1D8 01DBAED8 EC0C040C */  jal         memcpy
/* 00F1DC 01DBAEDC 00000000 */   nop
/* 00F1E0 01DBAEE0 E601023C */  lui         $2, %hi(MasekiEffect + 0xA160)
/* 00F1E4 01DBAEE4 E0544424 */  addiu       $4, $2, %lo(MasekiEffect + 0xA160)
/* 00F1E8 01DBAEE8 DC01023C */  lui         $2, %hi(MyEntryEffect_Maseki01)
/* 00F1EC 01DBAEEC A0224524 */  addiu       $5, $2, %lo(MyEntryEffect_Maseki01)
/* 00F1F0 01DBAEF0 F001023C */  lui         $2, %hi(MasekiModelBuffer)
/* 00F1F4 01DBAEF4 90664624 */  addiu       $6, $2, %lo(MasekiModelBuffer)
/* 00F1F8 01DBAEF8 04B6060C */  jal         ReEntry__12CSHOT_EFFECTFP14BT_SHOT_EFFECTP14CDataAlloc2_1_
/* 00F1FC 01DBAEFC 00000000 */   nop
/* 00F200 01DBAF00 E701023C */  lui         $2, %hi(MasekiEffect + 0x142C0)
/* 00F204 01DBAF04 40F64424 */  addiu       $4, $2, %lo(MasekiEffect + 0x142C0)
/* 00F208 01DBAF08 E601023C */  lui         $2, %hi(MasekiEffect)
/* 00F20C 01DBAF0C 80B34524 */  addiu       $5, $2, %lo(MasekiEffect)
/* 00F210 01DBAF10 60A10634 */  ori         $6, $0, 0xA160
/* 00F214 01DBAF14 EC0C040C */  jal         memcpy
/* 00F218 01DBAF18 00000000 */   nop
/* 00F21C 01DBAF1C E701023C */  lui         $2, %hi(MasekiEffect + 0x142C0)
/* 00F220 01DBAF20 40F64424 */  addiu       $4, $2, %lo(MasekiEffect + 0x142C0)
/* 00F224 01DBAF24 DC01023C */  lui         $2, %hi(MyEntryEffect_Maseki02)
/* 00F228 01DBAF28 10234524 */  addiu       $5, $2, %lo(MyEntryEffect_Maseki02)
/* 00F22C 01DBAF2C F001023C */  lui         $2, %hi(MasekiModelBuffer)
/* 00F230 01DBAF30 90664624 */  addiu       $6, $2, %lo(MasekiModelBuffer)
/* 00F234 01DBAF34 04B6060C */  jal         ReEntry__12CSHOT_EFFECTFP14BT_SHOT_EFFECTP14CDataAlloc2_1_
/* 00F238 01DBAF38 00000000 */   nop
/* 00F23C 01DBAF3C E801023C */  lui         $2, %hi(MasekiEffect + 0x1E420)
/* 00F240 01DBAF40 A0974424 */  addiu       $4, $2, %lo(MasekiEffect + 0x1E420)
/* 00F244 01DBAF44 E601023C */  lui         $2, %hi(MasekiEffect)
/* 00F248 01DBAF48 80B34524 */  addiu       $5, $2, %lo(MasekiEffect)
/* 00F24C 01DBAF4C 60A10634 */  ori         $6, $0, 0xA160
/* 00F250 01DBAF50 EC0C040C */  jal         memcpy
/* 00F254 01DBAF54 00000000 */   nop
/* 00F258 01DBAF58 E801023C */  lui         $2, %hi(MasekiEffect + 0x1E420)
/* 00F25C 01DBAF5C A0974424 */  addiu       $4, $2, %lo(MasekiEffect + 0x1E420)
/* 00F260 01DBAF60 DC01023C */  lui         $2, %hi(MyEntryEffect_Maseki03)
/* 00F264 01DBAF64 80234524 */  addiu       $5, $2, %lo(MyEntryEffect_Maseki03)
/* 00F268 01DBAF68 F001023C */  lui         $2, %hi(MasekiModelBuffer)
/* 00F26C 01DBAF6C 90664624 */  addiu       $6, $2, %lo(MasekiModelBuffer)
/* 00F270 01DBAF70 04B6060C */  jal         ReEntry__12CSHOT_EFFECTFP14BT_SHOT_EFFECTP14CDataAlloc2_1_
/* 00F274 01DBAF74 00000000 */   nop
/* 00F278 01DBAF78 E801023C */  lui         $2, %hi(MasekiEffect + 0x28580)
/* 00F27C 01DBAF7C 00394424 */  addiu       $4, $2, %lo(MasekiEffect + 0x28580)
/* 00F280 01DBAF80 E601023C */  lui         $2, %hi(MasekiEffect)
/* 00F284 01DBAF84 80B34524 */  addiu       $5, $2, %lo(MasekiEffect)
/* 00F288 01DBAF88 60A10634 */  ori         $6, $0, 0xA160
/* 00F28C 01DBAF8C EC0C040C */  jal         memcpy
/* 00F290 01DBAF90 00000000 */   nop
/* 00F294 01DBAF94 E801023C */  lui         $2, %hi(MasekiEffect + 0x28580)
/* 00F298 01DBAF98 00394424 */  addiu       $4, $2, %lo(MasekiEffect + 0x28580)
/* 00F29C 01DBAF9C DC01023C */  lui         $2, %hi(MyEntryEffect_Maseki04)
/* 00F2A0 01DBAFA0 F0234524 */  addiu       $5, $2, %lo(MyEntryEffect_Maseki04)
/* 00F2A4 01DBAFA4 F001023C */  lui         $2, %hi(MasekiModelBuffer)
/* 00F2A8 01DBAFA8 90664624 */  addiu       $6, $2, %lo(MasekiModelBuffer)
/* 00F2AC 01DBAFAC 04B6060C */  jal         ReEntry__12CSHOT_EFFECTFP14BT_SHOT_EFFECTP14CDataAlloc2_1_
/* 00F2B0 01DBAFB0 00000000 */   nop
/* 00F2B4 01DBAFB4 3000BF7B */  lq          $31, 0x30($29)
/* 00F2B8 01DBAFB8 2000B27B */  lq          $18, 0x20($29)
/* 00F2BC 01DBAFBC 1000B17B */  lq          $17, 0x10($29)
/* 00F2C0 01DBAFC0 0000B07B */  lq          $16, 0x0($29)
/* 00F2C4 01DBAFC4 B001BD27 */  addiu       $29, $29, 0x1B0
/* 00F2C8 01DBAFC8 0800E003 */  jr          $31
/* 00F2CC 01DBAFCC 00000000 */   nop
