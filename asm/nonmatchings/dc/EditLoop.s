.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EditLoop__Fv
/* 798E0 001797E0 10FCBD27 */  addiu      $sp, $sp, -0x3F0
/* 798E4 001797E4 4000BF7F */  sq         $31, 0x40($sp)
/* 798E8 001797E8 3000B27F */  sq         $18, 0x30($sp)
/* 798EC 001797EC 2000B17F */  sq         $17, 0x20($sp)
/* 798F0 001797F0 1000B07F */  sq         $16, 0x10($sp)
/* 798F4 001797F4 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 798F8 001797F8 9C9080AF */  sw         $0, -0x6F64($gp)
/* 798FC 001797FC 00080424 */  addiu      $4, $0, 0x800
/* 79900 00179800 04000524 */  addiu      $5, $0, 0x4
/* 79904 00179804 64A6050C */  jal        EdPadDown__Fii
/* 79908 00179808 00000000 */   nop
/* 7990C 0017980C 03004010 */  beqz       $2, .L0017981C
/* 79910 00179810 00000000 */   nop
/* 79914 00179814 01000224 */  addiu      $2, $0, 0x1
/* 79918 00179818 9C9082AF */  sw         $2, -0x6F64($gp)
.L0017981C:
/* 7991C 0017981C 288D828F */  lw         $2, -0x72D8($gp)
/* 79920 00179820 05004128 */  slti       $at, $2, 0x5
/* 79924 00179824 0C002010 */  beqz       $at, .L00179858
/* 79928 00179828 00000000 */   nop
/* 7992C 0017982C 9090838F */  lw         $3, -0x6F70($gp)
/* 79930 00179830 3C000224 */  addiu      $2, $0, 0x3C
/* 79934 00179834 08006214 */  bne        $3, $2, .L00179858
/* 79938 00179838 00000000 */   nop
/* 7993C 0017983C 6087838F */  lw         $3, -0x78A0($gp)
/* 79940 00179840 01000224 */  addiu      $2, $0, 0x1
/* 79944 00179844 04006214 */  bne        $3, $2, .L00179858
/* 79948 00179848 00000000 */   nop
/* 7994C 0017984C 28260070 */  paddub     $4, $0, $0
/* 79950 00179850 0CCE050C */  jal        EdWalkToEditMes__Fi
/* 79954 00179854 00000000 */   nop
.L00179858:
/* 79958 00179858 6C918283 */  lb         $2, -0x6E94($gp)
/* 7995C 0017985C 05004014 */  bnez       $2, .L00179874
/* 79960 00179860 00000000 */   nop
/* 79964 00179864 FFFF0224 */  addiu      $2, $0, -0x1
/* 79968 00179868 689182AF */  sw         $2, -0x6E98($gp)
/* 7996C 0017986C 01000224 */  addiu      $2, $0, 0x1
/* 79970 00179870 6C9182A3 */  sb         $2, -0x6E94($gp)
.L00179874:
/* 79974 00179874 6087838F */  lw         $3, -0x78A0($gp)
/* 79978 00179878 0E000224 */  addiu      $2, $0, 0xE
/* 7997C 0017987C 23006210 */  beq        $3, $2, .L0017990C
/* 79980 00179880 00000000 */   nop
/* 79984 00179884 48A8050C */  jal        EdCheckViewMode__Fv
/* 79988 00179888 00000000 */   nop
/* 7998C 0017988C 11004010 */  beqz       $2, .L001798D4
/* 79990 00179890 00000000 */   nop
/* 79994 00179894 0100023C */  lui        $2, (0x1FFFE >> 16)
/* 79998 00179898 FEFF4234 */  ori        $2, $2, (0x1FFFE & 0xFFFF)
/* 7999C 0017989C 00008244 */  mtc1       $2, $f0
/* 799A0 001798A0 00000000 */  nop
/* 799A4 001798A4 A0038046 */  cvt.s.w    $f14, $f0
/* 799A8 001798A8 4844023C */  lui        $2, (0x44480000 >> 16)
/* 799AC 001798AC 00608244 */  mtc1       $2, $f12
/* 799B0 001798B0 8040023C */  lui        $2, (0x40800000 >> 16)
/* 799B4 001798B4 00688244 */  mtc1       $2, $f13
/* 799B8 001798B8 B8B5040C */  jal        MGSetRenderInfo__Ffff
/* 799BC 001798BC 00000000 */   nop
/* 799C0 001798C0 01000424 */  addiu      $4, $0, 0x1
/* 799C4 001798C4 9CB8040C */  jal        MGScisioringForce__Fi
/* 799C8 001798C8 00000000 */   nop
/* 799CC 001798CC 0F000010 */  b          .L0017990C
/* 799D0 001798D0 00000000 */   nop
.L001798D4:
/* 799D4 001798D4 0100023C */  lui        $2, (0x1FFFE >> 16)
/* 799D8 001798D8 FEFF4234 */  ori        $2, $2, (0x1FFFE & 0xFFFF)
/* 799DC 001798DC 00008244 */  mtc1       $2, $f0
/* 799E0 001798E0 00000000 */  nop
/* 799E4 001798E4 A0038046 */  cvt.s.w    $f14, $f0
/* 799E8 001798E8 4844023C */  lui        $2, (0x44480000 >> 16)
/* 799EC 001798EC 00608244 */  mtc1       $2, $f12
/* 799F0 001798F0 A040023C */  lui        $2, (0x40A00000 >> 16)
/* 799F4 001798F4 00688244 */  mtc1       $2, $f13
/* 799F8 001798F8 B8B5040C */  jal        MGSetRenderInfo__Ffff
/* 799FC 001798FC 00000000 */   nop
/* 79A00 00179900 28260070 */  paddub     $4, $0, $0
/* 79A04 00179904 9CB8040C */  jal        MGScisioringForce__Fi
/* 79A08 00179908 00000000 */   nop
.L0017990C:
/* 79A0C 0017990C 6487828F */  lw         $2, -0x789C($gp)
/* 79A10 00179910 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 79A14 00179914 B09B22AC */  sw         $2, -0x6450($at)
/* 79A18 00179918 E890828F */  lw         $2, -0x6F18($gp)
/* 79A1C 0017991C D201013C */  lui        $at, (0x1D20000 >> 16)
/* 79A20 00179920 BC9B22AC */  sw         $2, -0x6444($at)
/* 79A24 00179924 0091828F */  lw         $2, -0x6F00($gp)
/* 79A28 00179928 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 79A2C 0017992C C89B22AC */  sw         $2, -0x6438($at)
/* 79A30 00179930 1891828F */  lw         $2, -0x6EE8($gp)
/* 79A34 00179934 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 79A38 00179938 C09B22AC */  sw         $2, -0x6440($at)
/* 79A3C 0017993C D301023C */  lui        $2, %hi(SystemEffect)
/* 79A40 00179940 50574224 */  addiu      $2, $2, %lo(SystemEffect)
/* 79A44 00179944 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 79A48 00179948 C49B22AC */  sw         $2, -0x643C($at)
/* 79A4C 0017994C 2400023C */  lui        $2, %hi(D_00246100)
/* 79A50 00179950 00614524 */  addiu      $5, $2, %lo(D_00246100)
/* 79A54 00179954 D48B848F */  lw         $4, -0x742C($gp)
/* 79A58 00179958 28360070 */  paddub     $6, $0, $0
/* 79A5C 0017995C 5C83040C */  jal        sceVif1PkCall
/* 79A60 00179960 00000000 */   nop
/* 79A64 00179964 E8DF050C */  jal        EdSetFlag__Fv
/* 79A68 00179968 00000000 */   nop
/* 79A6C 0017996C 049180C7 */  lwc1       $f0, -0x6EFC($gp)
/* 79A70 00179970 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 79A74 00179974 F0D320E4 */  swc1       $f0, -0x2C10($at)
/* 79A78 00179978 E890838F */  lw         $3, -0x6F18($gp)
/* 79A7C 0017997C FFFF0224 */  addiu      $2, $0, -0x1
/* 79A80 00179980 0100013C */  lui        $at, (0x15F14 >> 16)
/* 79A84 00179984 21086100 */  addu       $at, $3, $at
/* 79A88 00179988 145F22AC */  sw         $2, (0x15F14 & 0xFFFF)($at)
/* 79A8C 0017998C 1C8D848F */  lw         $4, -0x72E4($gp)
/* 79A90 00179990 CC5E050C */  jal        GetConfigData__9CSaveDataFv
/* 79A94 00179994 00000000 */   nop
/* 79A98 00179998 1000428C */  lw         $2, 0x10($2)
/* 79A9C 0017999C 06004010 */  beqz       $2, .L001799B8
/* 79AA0 001799A0 00000000 */   nop
/* 79AA4 001799A4 A08080C7 */  lwc1       $f0, -0x7F60($gp)
/* 79AA8 001799A8 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 79AAC 001799AC F8B520E4 */  swc1       $f0, -0x4A08($at)
/* 79AB0 001799B0 04000010 */  b          .L001799C4
/* 79AB4 001799B4 00000000 */   nop
.L001799B8:
/* 79AB8 001799B8 7C8080C7 */  lwc1       $f0, -0x7F84($gp)
/* 79ABC 001799BC D201013C */  lui        $at, (0x1D20000 >> 16)
/* 79AC0 001799C0 F8B520E4 */  swc1       $f0, -0x4A08($at)
.L001799C4:
/* 79AC4 001799C4 6087848F */  lw         $4, -0x78A0($gp)
/* 79AC8 001799C8 0C000224 */  addiu      $2, $0, 0xC
/* 79ACC 001799CC 03018214 */  bne        $4, $2, .L00179DDC
/* 79AD0 001799D0 00000000 */   nop
/* 79AD4 001799D4 01000224 */  addiu      $2, $0, 0x1
/* 79AD8 001799D8 2C9082AF */  sw         $2, -0x6FD4($gp)
/* 79ADC 001799DC AC70060C */  jal        EditInLoop__Fv
/* 79AE0 001799E0 00000000 */   nop
/* 79AE4 001799E4 FA004010 */  beqz       $2, .L00179DD0
/* 79AE8 001799E8 00000000 */   nop
/* 79AEC 001799EC 63000324 */  addiu      $3, $0, 0x63
/* 79AF0 001799F0 06004314 */  bne        $2, $3, .L00179A0C
/* 79AF4 001799F4 00000000 */   nop
/* 79AF8 001799F8 50DF050C */  jal        EditExit__Fv
/* 79AFC 001799FC 00000000 */   nop
/* 79B00 00179A00 01000224 */  addiu      $2, $0, 0x1
/* 79B04 00179A04 68070010 */  b          .L0017B7A8
/* 79B08 00179A08 00000000 */   nop
.L00179A0C:
/* 79B0C 00179A0C 28260070 */  paddub     $4, $0, $0
/* 79B10 00179A10 C04B040C */  jal        sceGsSyncV
/* 79B14 00179A14 00000000 */   nop
/* 79B18 00179A18 28260070 */  paddub     $4, $0, $0
/* 79B1C 00179A1C C04B040C */  jal        sceGsSyncV
/* 79B20 00179A20 00000000 */   nop
/* 79B24 00179A24 28260070 */  paddub     $4, $0, $0
/* 79B28 00179A28 C04B040C */  jal        sceGsSyncV
/* 79B2C 00179A2C 00000000 */   nop
/* 79B30 00179A30 28260070 */  paddub     $4, $0, $0
/* 79B34 00179A34 C04B040C */  jal        sceGsSyncV
/* 79B38 00179A38 00000000 */   nop
/* 79B3C 00179A3C 149280AF */  sw         $0, -0x6DEC($gp)
/* 79B40 00179A40 00DE050C */  jal        LoadScript__Fv
/* 79B44 00179A44 00000000 */   nop
/* 79B48 00179A48 A003A0AF */  sw         $0, 0x3A0($sp)
/* 79B4C 00179A4C A403A0AF */  sw         $0, 0x3A4($sp)
/* 79B50 00179A50 00280224 */  addiu      $2, $0, 0x2800
/* 79B54 00179A54 A803A2AF */  sw         $2, 0x3A8($sp)
/* 79B58 00179A58 000E0224 */  addiu      $2, $0, 0xE00
/* 79B5C 00179A5C AC03A2AF */  sw         $2, 0x3AC($sp)
/* 79B60 00179A60 A003A427 */  addiu      $4, $sp, 0x3A0
/* 79B64 00179A64 282E0070 */  paddub     $5, $0, $0
/* 79B68 00179A68 28360070 */  paddub     $6, $0, $0
/* 79B6C 00179A6C 283E0070 */  paddub     $7, $0, $0
/* 79B70 00179A70 80000824 */  addiu      $8, $0, 0x80
/* 79B74 00179A74 9CBE040C */  jal        MGFillBox__FRC8CRect_i_UcUcUcUc
/* 79B78 00179A78 00000000 */   nop
/* 79B7C 00179A7C 40B4040C */  jal        MGEndFrame__Fv
/* 79B80 00179A80 00000000 */   nop
/* 79B84 00179A84 C701023C */  lui        $2, %hi(TexManager)
/* 79B88 00179A88 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 79B8C 00179A8C 0F000524 */  addiu      $5, $0, 0xF
/* 79B90 00179A90 C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* 79B94 00179A94 00000000 */   nop
/* 79B98 00179A98 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 79B9C 00179A9C 58B320AC */  sw         $0, -0x4CA8($at)
/* 79BA0 00179AA0 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 79BA4 00179AA4 68B320AC */  sw         $0, -0x4C98($at)
/* 79BA8 00179AA8 88DF050C */  jal        InitWorkBuffer__Fv
/* 79BAC 00179AAC 00000000 */   nop
/* 79BB0 00179AB0 D301023C */  lui        $2, %hi(EdVillagerInfo)
/* 79BB4 00179AB4 D0294424 */  addiu      $4, $2, %lo(EdVillagerInfo)
/* 79BB8 00179AB8 04918CC7 */  lwc1       $f12, -0x6EFC($gp)
/* 79BBC 00179ABC 6090858F */  lw         $5, -0x6FA0($gp)
/* 79BC0 00179AC0 F815060C */  jal        EdSelectVillager__FP13VILLAGER_INFOfP13EDIT_MAP_INFO
/* 79BC4 00179AC4 00000000 */   nop
/* 79BC8 00179AC8 D301023C */  lui        $2, %hi(EdVillagerInfo)
/* 79BCC 00179ACC D0294424 */  addiu      $4, $2, %lo(EdVillagerInfo)
/* 79BD0 00179AD0 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 79BD4 00179AD4 BC9B258C */  lw         $5, -0x6444($at)
/* 79BD8 00179AD8 28360070 */  paddub     $6, $0, $0
/* 79BDC 00179ADC D017060C */  jal        EdInitVilager__FP13VILLAGER_INFOP11CEditGroundP1
/* 79BE0 00179AE0 00000000 */   nop
/* 79BE4 00179AE4 D201023C */  lui        $2, %hi(EdVillager)
/* 79BE8 00179AE8 905B4424 */  addiu      $4, $2, %lo(EdVillager)
/* 79BEC 00179AEC D301023C */  lui        $2, %hi(EdVillagerInfo)
/* 79BF0 00179AF0 D0294524 */  addiu      $5, $2, %lo(EdVillagerInfo)
/* 79BF4 00179AF4 E890868F */  lw         $6, -0x6F18($gp)
/* 79BF8 00179AF8 283E0070 */  paddub     $7, $0, $0
/* 79BFC 00179AFC 4419060C */  jal        EdInitVilagerPosition__FP12CNPCharacterP13VILLAGER_INFOP11CEditGroundPA4_f
/* 79C00 00179B00 00000000 */   nop
/* 79C04 00179B04 64B3040C */  jal        MGBeginFrame__Fv
/* 79C08 00179B08 00000000 */   nop
/* 79C0C 00179B0C B003A0AF */  sw         $0, 0x3B0($sp)
/* 79C10 00179B10 B403A0AF */  sw         $0, 0x3B4($sp)
/* 79C14 00179B14 00280224 */  addiu      $2, $0, 0x2800
/* 79C18 00179B18 B803A2AF */  sw         $2, 0x3B8($sp)
/* 79C1C 00179B1C 000E0224 */  addiu      $2, $0, 0xE00
/* 79C20 00179B20 BC03A2AF */  sw         $2, 0x3BC($sp)
/* 79C24 00179B24 B003A427 */  addiu      $4, $sp, 0x3B0
/* 79C28 00179B28 282E0070 */  paddub     $5, $0, $0
/* 79C2C 00179B2C 28360070 */  paddub     $6, $0, $0
/* 79C30 00179B30 283E0070 */  paddub     $7, $0, $0
/* 79C34 00179B34 80000824 */  addiu      $8, $0, 0x80
/* 79C38 00179B38 9CBE040C */  jal        MGFillBox__FRC8CRect_i_UcUcUcUc
/* 79C3C 00179B3C 00000000 */   nop
/* 79C40 00179B40 5000A427 */  addiu      $4, $sp, 0x50
/* 79C44 00179B44 D201023C */  lui        $2, %hi(EdInteriorName)
/* 79C48 00179B48 00B54524 */  addiu      $5, $2, %lo(EdInteriorName)
/* 79C4C 00179B4C 3490868F */  lw         $6, -0x6FCC($gp)
/* 79C50 00179B50 04918CC7 */  lwc1       $f12, -0x6EFC($gp)
/* 79C54 00179B54 2C13060C */  jal        EdSearchEvent__FP14ED_EVENT_PARAMPcif
/* 79C58 00179B58 00000000 */   nop
/* 79C5C 00179B5C 10004010 */  beqz       $2, .L00179BA0
/* 79C60 00179B60 00000000 */   nop
/* 79C64 00179B64 D301023C */  lui        $2, %hi(fix_chara_pos)
/* 79C68 00179B68 50594424 */  addiu      $4, $2, %lo(fix_chara_pos)
/* 79C6C 00179B6C 6000A527 */  addiu      $5, $sp, 0x60
/* 79C70 00179B70 0C86040C */  jal        sceVu0CopyVector
/* 79C74 00179B74 00000000 */   nop
/* 79C78 00179B78 D301023C */  lui        $2, %hi(fix_chara_rot)
/* 79C7C 00179B7C 60594424 */  addiu      $4, $2, %lo(fix_chara_rot)
/* 79C80 00179B80 8000A527 */  addiu      $5, $sp, 0x80
/* 79C84 00179B84 0C86040C */  jal        sceVu0CopyVector
/* 79C88 00179B88 00000000 */   nop
/* 79C8C 00179B8C D301023C */  lui        $2, %hi(fix_camera_pos)
/* 79C90 00179B90 70594424 */  addiu      $4, $2, %lo(fix_camera_pos)
/* 79C94 00179B94 7000A527 */  addiu      $5, $sp, 0x70
/* 79C98 00179B98 0C86040C */  jal        sceVu0CopyVector
/* 79C9C 00179B9C 00000000 */   nop
.L00179BA0:
/* 79CA0 00179BA0 6487848F */  lw         $4, -0x789C($gp)
/* 79CA4 00179BA4 D301023C */  lui        $2, %hi(fix_chara_pos)
/* 79CA8 00179BA8 50594524 */  addiu      $5, $2, %lo(fix_chara_pos)
/* 79CAC 00179BAC A000998C */  lw         $25, 0xA0($4)
/* 79CB0 00179BB0 1400398F */  lw         $25, 0x14($25)
/* 79CB4 00179BB4 09F82003 */  jalr       $25
/* 79CB8 00179BB8 00000000 */   nop
/* 79CBC 00179BBC D301013C */  lui        $at, (0x1D35964 >> 16)
/* 79CC0 00179BC0 64592DC4 */  lwc1       $f13, (0x1D35964 & 0xFFFF)($at)
/* 79CC4 00179BC4 288180C7 */  lwc1       $f0, -0x7ED8($gp)
/* 79CC8 00179BC8 406B0046 */  add.s      $f13, $f13, $f0
/* 79CCC 00179BCC 36680046 */  c.le.s     $f13, $f0
/* 79CD0 00179BD0 00000000 */  nop
/* 79CD4 00179BD4 03000145 */  bc1t       .L00179BE4
/* 79CD8 00179BD8 00000000 */   nop
/* 79CDC 00179BDC B08280C7 */  lwc1       $f0, -0x7D50($gp)
/* 79CE0 00179BE0 416B0046 */  sub.s      $f13, $f13, $f0
.L00179BE4:
/* 79CE4 00179BE4 6487848F */  lw         $4, -0x789C($gp)
/* 79CE8 00179BE8 D301013C */  lui        $at, (0x1D35960 >> 16)
/* 79CEC 00179BEC 60592CC4 */  lwc1       $f12, (0x1D35960 & 0xFFFF)($at)
/* 79CF0 00179BF0 D301013C */  lui        $at, (0x1D35968 >> 16)
/* 79CF4 00179BF4 68592EC4 */  lwc1       $f14, (0x1D35968 & 0xFFFF)($at)
/* 79CF8 00179BF8 A000998C */  lw         $25, 0xA0($4)
/* 79CFC 00179BFC 3000398F */  lw         $25, 0x30($25)
/* 79D00 00179C00 09F82003 */  jalr       $25
/* 79D04 00179C04 00000000 */   nop
/* 79D08 00179C08 D301023C */  lui        $2, %hi(MainCamera)
/* 79D0C 00179C0C 40454424 */  addiu      $4, $2, %lo(MainCamera)
/* 79D10 00179C10 C492040C */  jal        FollowOff__13CCameraFollowFv
/* 79D14 00179C14 00000000 */   nop
/* 79D18 00179C18 D301023C */  lui        $2, %hi(MainCamera)
/* 79D1C 00179C1C 40454424 */  addiu      $4, $2, %lo(MainCamera)
/* 79D20 00179C20 D301023C */  lui        $2, %hi(fix_camera_pos)
/* 79D24 00179C24 70594524 */  addiu      $5, $2, %lo(fix_camera_pos)
/* 79D28 00179C28 A490040C */  jal        SetPos__7CCameraFPf
/* 79D2C 00179C2C 00000000 */   nop
/* 79D30 00179C30 6041023C */  lui        $2, (0x41600000 >> 16)
/* 79D34 00179C34 00088244 */  mtc1       $2, $f1
/* 79D38 00179C38 D301013C */  lui        $at, (0x1D35954 >> 16)
/* 79D3C 00179C3C 545920C4 */  lwc1       $f0, (0x1D35954 & 0xFFFF)($at)
/* 79D40 00179C40 400B0046 */  add.s      $f13, $f1, $f0
/* 79D44 00179C44 D301023C */  lui        $2, %hi(MainCamera)
/* 79D48 00179C48 40454424 */  addiu      $4, $2, %lo(MainCamera)
/* 79D4C 00179C4C D301013C */  lui        $at, (0x1D35950 >> 16)
/* 79D50 00179C50 50592CC4 */  lwc1       $f12, (0x1D35950 & 0xFFFF)($at)
/* 79D54 00179C54 D301013C */  lui        $at, (0x1D35958 >> 16)
/* 79D58 00179C58 58592EC4 */  lwc1       $f14, (0x1D35958 & 0xFFFF)($at)
/* 79D5C 00179C5C D490040C */  jal        SetRef__7CCameraFfff
/* 79D60 00179C60 00000000 */   nop
/* 79D64 00179C64 D301023C */  lui        $2, %hi(MainCamera)
/* 79D68 00179C68 40454424 */  addiu      $4, $2, %lo(MainCamera)
/* 79D6C 00179C6C FFFF0524 */  addiu      $5, $0, -0x1
/* 79D70 00179C70 F491040C */  jal        Step__13CCameraFollowFi
/* 79D74 00179C74 00000000 */   nop
/* 79D78 00179C78 D301023C */  lui        $2, %hi(MainCamera)
/* 79D7C 00179C7C 40454424 */  addiu      $4, $2, %lo(MainCamera)
/* 79D80 00179C80 B000A527 */  addiu      $5, $sp, 0xB0
/* 79D84 00179C84 E890040C */  jal        GetDir__7CCameraFPf
/* 79D88 00179C88 00000000 */   nop
/* 79D8C 00179C8C D301023C */  lui        $2, %hi(MainCamera)
/* 79D90 00179C90 40454424 */  addiu      $4, $2, %lo(MainCamera)
/* 79D94 00179C94 B491040C */  jal        GetAngleH__7CCameraFv
/* 79D98 00179C98 00000000 */   nop
/* 79D9C 00179C9C 06050046 */  mov.s      $f20, $f0
/* 79DA0 00179CA0 D301023C */  lui        $2, %hi(MainCamera)
/* 79DA4 00179CA4 40454424 */  addiu      $4, $2, %lo(MainCamera)
/* 79DA8 00179CA8 C092040C */  jal        FollowOn__13CCameraFollowFv
/* 79DAC 00179CAC 00000000 */   nop
/* 79DB0 00179CB0 D301023C */  lui        $2, %hi(MainCamera)
/* 79DB4 00179CB4 40454424 */  addiu      $4, $2, %lo(MainCamera)
/* 79DB8 00179CB8 06A30046 */  mov.s      $f12, $f20
/* 79DBC 00179CBC CC92040C */  jal        SetAngleSoon__13CCameraFollowFf
/* 79DC0 00179CC0 00000000 */   nop
/* 79DC4 00179CC4 6487848F */  lw         $4, -0x789C($gp)
/* 79DC8 00179CC8 FFFF0524 */  addiu      $5, $0, -0x1
/* 79DCC 00179CCC A000998C */  lw         $25, 0xA0($4)
/* 79DD0 00179CD0 9400398F */  lw         $25, 0x94($25)
/* 79DD4 00179CD4 09F82003 */  jalr       $25
/* 79DD8 00179CD8 00000000 */   nop
/* 79DDC 00179CDC 28260070 */  paddub     $4, $0, $0
/* 79DE0 00179CE0 C04B040C */  jal        sceGsSyncV
/* 79DE4 00179CE4 00000000 */   nop
/* 79DE8 00179CE8 28260070 */  paddub     $4, $0, $0
/* 79DEC 00179CEC C04B040C */  jal        sceGsSyncV
/* 79DF0 00179CF0 00000000 */   nop
/* 79DF4 00179CF4 00C6050C */  jal        EdInitSoundSrc__Fv
/* 79DF8 00179CF8 00000000 */   nop
/* 79DFC 00179CFC 04918CC7 */  lwc1       $f12, -0x6EFC($gp)
/* 79E00 00179D00 C8DD050C */  jal        PlayAmbient__Ff
/* 79E04 00179D04 00000000 */   nop
/* 79E08 00179D08 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 79E0C 00179D0C 00608244 */  mtc1       $2, $f12
/* 79E10 00179D10 84C5050C */  jal        EdSetAmbientVol__Ff
/* 79E14 00179D14 00000000 */   nop
/* 79E18 00179D18 4090848F */  lw         $4, -0x6FC0($gp)
/* 79E1C 00179D1C 03008004 */  bltz       $4, .L00179D2C
/* 79E20 00179D20 00000000 */   nop
/* 79E24 00179D24 5866050C */  jal        SndBgmLoad__Fi
/* 79E28 00179D28 00000000 */   nop
.L00179D2C:
/* 79E2C 00179D2C 28260070 */  paddub     $4, $0, $0
/* 79E30 00179D30 C04B040C */  jal        sceGsSyncV
/* 79E34 00179D34 00000000 */   nop
/* 79E38 00179D38 28260070 */  paddub     $4, $0, $0
/* 79E3C 00179D3C C04B040C */  jal        sceGsSyncV
/* 79E40 00179D40 00000000 */   nop
/* 79E44 00179D44 00608044 */  mtc1       $0, $f12
/* 79E48 00179D48 00000000 */  nop
/* 79E4C 00179D4C 46630046 */  mov.s      $f13, $f12
/* 79E50 00179D50 86630046 */  mov.s      $f14, $f12
/* 79E54 00179D54 40000424 */  addiu      $4, $0, 0x40
/* 79E58 00179D58 C425060C */  jal        EdFadeIn__Fifff
/* 79E5C 00179D5C 00000000 */   nop
/* 79E60 00179D60 01000224 */  addiu      $2, $0, 0x1
/* 79E64 00179D64 608782AF */  sw         $2, -0x78A0($gp)
/* 79E68 00179D68 3890828F */  lw         $2, -0x6FC8($gp)
/* 79E6C 00179D6C 0A004004 */  bltz       $2, .L00179D98
/* 79E70 00179D70 00000000 */   nop
/* 79E74 00179D74 D301023C */  lui        $2, %hi(MainCamera)
/* 79E78 00179D78 40454424 */  addiu      $4, $2, %lo(MainCamera)
/* 79E7C 00179D7C BC65050C */  jal        SndSetCamera__FP7CCamera
/* 79E80 00179D80 00000000 */   nop
/* 79E84 00179D84 3890848F */  lw         $4, -0x6FC8($gp)
/* 79E88 00179D88 D301023C */  lui        $2, %hi(fix_chara_pos)
/* 79E8C 00179D8C 50594524 */  addiu      $5, $2, %lo(fix_chara_pos)
/* 79E90 00179D90 58C8050C */  jal        EdDoorCloseSe__FiPf
/* 79E94 00179D94 00000000 */   nop
.L00179D98:
/* 79E98 00179D98 288D828F */  lw         $2, -0x72D8($gp)
/* 79E9C 00179D9C 05004128 */  slti       $at, $2, 0x5
/* 79EA0 00179DA0 04002010 */  beqz       $at, .L00179DB4
/* 79EA4 00179DA4 00000000 */   nop
/* 79EA8 00179DA8 3C000424 */  addiu      $4, $0, 0x3C
/* 79EAC 00179DAC 0CCE050C */  jal        EdWalkToEditMes__Fi
/* 79EB0 00179DB0 00000000 */   nop
.L00179DB4:
/* 79EB4 00179DB4 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 79EB8 00179DB8 A4D4248C */  lw         $4, -0x2B5C($at)
/* 79EBC 00179DBC 04008004 */  bltz       $4, .L00179DD0
/* 79EC0 00179DC0 00000000 */   nop
/* 79EC4 00179DC4 282E0070 */  paddub     $5, $0, $0
/* 79EC8 00179DC8 7CDE050C */  jal        RunEvent__FiP7CCamera
/* 79ECC 00179DCC 00000000 */   nop
.L00179DD0:
/* 79ED0 00179DD0 28160070 */  paddub     $2, $0, $0
/* 79ED4 00179DD4 74060010 */  b          .L0017B7A8
/* 79ED8 00179DD8 00000000 */   nop
.L00179DDC:
/* 79EDC 00179DDC 2C9080AF */  sw         $0, -0x6FD4($gp)
/* 79EE0 00179DE0 DC90828F */  lw         $2, -0x6F24($gp)
/* 79EE4 00179DE4 D1004010 */  beqz       $2, .L0017A12C
/* 79EE8 00179DE8 00000000 */   nop
/* 79EEC 00179DEC 74918283 */  lb         $2, -0x6E8C($gp)
/* 79EF0 00179DF0 04004014 */  bnez       $2, .L00179E04
/* 79EF4 00179DF4 00000000 */   nop
/* 79EF8 00179DF8 709180AF */  sw         $0, -0x6E90($gp)
/* 79EFC 00179DFC 01000224 */  addiu      $2, $0, 0x1
/* 79F00 00179E00 749182A3 */  sb         $2, -0x6E8C($gp)
.L00179E04:
/* 79F04 00179E04 7C918283 */  lb         $2, -0x6E84($gp)
/* 79F08 00179E08 04004014 */  bnez       $2, .L00179E1C
/* 79F0C 00179E0C 00000000 */   nop
/* 79F10 00179E10 789180AF */  sw         $0, -0x6E88($gp)
/* 79F14 00179E14 01000224 */  addiu      $2, $0, 0x1
/* 79F18 00179E18 7C9182A3 */  sb         $2, -0x6E84($gp)
.L00179E1C:
/* 79F1C 00179E1C 84918283 */  lb         $2, -0x6E7C($gp)
/* 79F20 00179E20 04004014 */  bnez       $2, .L00179E34
/* 79F24 00179E24 00000000 */   nop
/* 79F28 00179E28 809180AF */  sw         $0, -0x6E80($gp)
/* 79F2C 00179E2C 01000224 */  addiu      $2, $0, 0x1
/* 79F30 00179E30 849182A3 */  sb         $2, -0x6E7C($gp)
.L00179E34:
/* 79F34 00179E34 28260070 */  paddub     $4, $0, $0
/* 79F38 00179E38 0A000010 */  b          .L00179E64
/* 79F3C 00179E3C 00000000 */   nop
.L00179E40:
/* 79F40 00179E40 80280400 */  sll        $5, $4, 2
/* 79F44 00179E44 E090828F */  lw         $2, -0x6F20($gp)
/* 79F48 00179E48 21104500 */  addu       $2, $2, $5
/* 79F4C 00179E4C 0000438C */  lw         $3, 0x0($2)
/* 79F50 00179E50 D401023C */  lui        $2, %hi(menu$807)
/* 79F54 00179E54 50B84224 */  addiu      $2, $2, %lo(menu$807)
/* 79F58 00179E58 21104500 */  addu       $2, $2, $5
/* 79F5C 00179E5C 000043AC */  sw         $3, 0x0($2)
/* 79F60 00179E60 01008424 */  addiu      $4, $4, 0x1
.L00179E64:
/* 79F64 00179E64 40008228 */  slti       $2, $4, 0x40
/* 79F68 00179E68 F5FF4014 */  bnez       $2, .L00179E40
/* 79F6C 00179E6C 00000000 */   nop
/* 79F70 00179E70 28860070 */  paddub     $16, $0, $0
/* 79F74 00179E74 02000010 */  b          .L00179E80
/* 79F78 00179E78 00000000 */   nop
.L00179E7C:
/* 79F7C 00179E7C 01001026 */  addiu      $16, $16, 0x1
.L00179E80:
/* 79F80 00179E80 80181000 */  sll        $3, $16, 2
/* 79F84 00179E84 D401023C */  lui        $2, %hi(menu$807)
/* 79F88 00179E88 50B84224 */  addiu      $2, $2, %lo(menu$807)
/* 79F8C 00179E8C 21104300 */  addu       $2, $2, $3
/* 79F90 00179E90 0000428C */  lw         $2, 0x0($2)
/* 79F94 00179E94 00004280 */  lb         $2, 0x0($2)
/* 79F98 00179E98 F8FF4014 */  bnez       $2, .L00179E7C
/* 79F9C 00179E9C 00000000 */   nop
/* 79FA0 00179EA0 CC01023C */  lui        $2, %hi(GamePad)
/* 79FA4 00179EA4 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 79FA8 00179EA8 00500524 */  addiu      $5, $0, 0x5000
/* 79FAC 00179EAC 14000624 */  addiu      $6, $0, 0x14
/* 79FB0 00179EB0 05000724 */  addiu      $7, $0, 0x5
/* 79FB4 00179EB4 58AD040C */  jal        SetAutoRepeat__8CGamePadFiii
/* 79FB8 00179EB8 00000000 */   nop
/* 79FBC 00179EBC CC01023C */  lui        $2, %hi(GamePad)
/* 79FC0 00179EC0 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 79FC4 00179EC4 00400524 */  addiu      $5, $0, 0x4000
/* 79FC8 00179EC8 1CAE040C */  jal        Down__8CGamePadFi
/* 79FCC 00179ECC 00000000 */   nop
/* 79FD0 00179ED0 04004010 */  beqz       $2, .L00179EE4
/* 79FD4 00179ED4 00000000 */   nop
/* 79FD8 00179ED8 7891828F */  lw         $2, -0x6E88($gp)
/* 79FDC 00179EDC 01004224 */  addiu      $2, $2, 0x1
/* 79FE0 00179EE0 789182AF */  sw         $2, -0x6E88($gp)
.L00179EE4:
/* 79FE4 00179EE4 CC01023C */  lui        $2, %hi(GamePad)
/* 79FE8 00179EE8 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 79FEC 00179EEC 00100524 */  addiu      $5, $0, 0x1000
/* 79FF0 00179EF0 1CAE040C */  jal        Down__8CGamePadFi
/* 79FF4 00179EF4 00000000 */   nop
/* 79FF8 00179EF8 04004010 */  beqz       $2, .L00179F0C
/* 79FFC 00179EFC 00000000 */   nop
/* 7A000 00179F00 7891828F */  lw         $2, -0x6E88($gp)
/* 7A004 00179F04 FFFF4224 */  addiu      $2, $2, -0x1
/* 7A008 00179F08 789182AF */  sw         $2, -0x6E88($gp)
.L00179F0C:
/* 7A00C 00179F0C 7891828F */  lw         $2, -0x6E88($gp)
/* 7A010 00179F10 02004104 */  bgez       $2, .L00179F1C
/* 7A014 00179F14 00000000 */   nop
/* 7A018 00179F18 789180AF */  sw         $0, -0x6E88($gp)
.L00179F1C:
/* 7A01C 00179F1C 7891828F */  lw         $2, -0x6E88($gp)
/* 7A020 00179F20 2A105000 */  slt        $2, $2, $16
/* 7A024 00179F24 03004014 */  bnez       $2, .L00179F34
/* 7A028 00179F28 00000000 */   nop
/* 7A02C 00179F2C FFFF0226 */  addiu      $2, $16, -0x1
/* 7A030 00179F30 789182AF */  sw         $2, -0x6E88($gp)
.L00179F34:
/* 7A034 00179F34 709180AF */  sw         $0, -0x6E90($gp)
/* 7A038 00179F38 7891838F */  lw         $3, -0x6E88($gp)
/* 7A03C 00179F3C 0E006228 */  slti       $2, $3, 0xE
/* 7A040 00179F40 03004014 */  bnez       $2, .L00179F50
/* 7A044 00179F44 00000000 */   nop
/* 7A048 00179F48 F3FF6224 */  addiu      $2, $3, -0xD
/* 7A04C 00179F4C 709182AF */  sw         $2, -0x6E90($gp)
.L00179F50:
/* 7A050 00179F50 E803A327 */  addiu      $3, $sp, 0x3E8
/* 7A054 00179F54 788782DF */  ld         $2, -0x7888($gp)
/* 7A058 00179F58 000062FC */  sd         $2, 0x0($3)
/* 7A05C 00179F5C D301013C */  lui        $at, (0x1D32F88 >> 16)
/* 7A060 00179F60 882F20AC */  sw         $0, (0x1D32F88 & 0xFFFF)($at)
/* 7A064 00179F64 7091908F */  lw         $16, -0x6E90($gp)
/* 7A068 00179F68 1C000010 */  b          .L00179FDC
/* 7A06C 00179F6C 00000000 */   nop
.L00179F70:
/* 7A070 00179F70 D301013C */  lui        $at, (0x1D32F88 >> 16)
/* 7A074 00179F74 882F238C */  lw         $3, (0x1D32F88 & 0xFFFF)($at)
/* 7A078 00179F78 D301023C */  lui        $2, %hi(DebugFont_3)
/* 7A07C 00179F7C 702F4224 */  addiu      $2, $2, %lo(DebugFont_3)
/* 7A080 00179F80 21204300 */  addu       $4, $2, $3
/* 7A084 00179F84 7891828F */  lw         $2, -0x6E88($gp)
/* 7A088 00179F88 26100202 */  xor        $2, $16, $2
/* 7A08C 00179F8C 0100422C */  sltiu      $2, $2, 0x1
/* 7A090 00179F90 80100200 */  sll        $2, $2, 2
/* 7A094 00179F94 21305D00 */  addu       $6, $2, $sp
/* 7A098 00179F98 80181000 */  sll        $3, $16, 2
/* 7A09C 00179F9C D401023C */  lui        $2, %hi(menu$807)
/* 7A0A0 00179FA0 50B84224 */  addiu      $2, $2, %lo(menu$807)
/* 7A0A4 00179FA4 21184300 */  addu       $3, $2, $3
/* 7A0A8 00179FA8 1C008424 */  addiu      $4, $4, 0x1C
/* 7A0AC 00179FAC 2A00023C */  lui        $2, %hi(_1609)
/* 7A0B0 00179FB0 D8AA4524 */  addiu      $5, $2, %lo(_1609)
/* 7A0B4 00179FB4 E803C68C */  lw         $6, 0x3E8($6)
/* 7A0B8 00179FB8 0000678C */  lw         $7, 0x0($3)
/* 7A0BC 00179FBC 1614040C */  jal        sprintf
/* 7A0C0 00179FC0 00000000 */   nop
/* 7A0C4 00179FC4 D301013C */  lui        $at, (0x1D32F88 >> 16)
/* 7A0C8 00179FC8 882F238C */  lw         $3, (0x1D32F88 & 0xFFFF)($at)
/* 7A0CC 00179FCC 21106200 */  addu       $2, $3, $2
/* 7A0D0 00179FD0 D301013C */  lui        $at, (0x1D32F88 >> 16)
/* 7A0D4 00179FD4 882F22AC */  sw         $2, (0x1D32F88 & 0xFFFF)($at)
/* 7A0D8 00179FD8 01001026 */  addiu      $16, $16, 0x1
.L00179FDC:
/* 7A0DC 00179FDC 7091828F */  lw         $2, -0x6E90($gp)
/* 7A0E0 00179FE0 0E004224 */  addiu      $2, $2, 0xE
/* 7A0E4 00179FE4 2A100202 */  slt        $2, $16, $2
/* 7A0E8 00179FE8 E1FF4014 */  bnez       $2, .L00179F70
/* 7A0EC 00179FEC 00000000 */   nop
/* 7A0F0 00179FF0 A0B8040C */  jal        GetVif1Packet__Fv
/* 7A0F4 00179FF4 00000000 */   nop
/* 7A0F8 00179FF8 C701033C */  lui        $3, %hi(TexManager)
/* 7A0FC 00179FFC 70586424 */  addiu      $4, $3, %lo(TexManager)
/* 7A100 0017A000 282E4070 */  paddub     $5, $2, $0
/* 7A104 0017A004 1F000624 */  addiu      $6, $0, 0x1F
/* 7A108 0017A008 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 7A10C 0017A00C 00000000 */   nop
/* 7A110 0017A010 D301023C */  lui        $2, %hi(DebugFont_3)
/* 7A114 0017A014 702F4424 */  addiu      $4, $2, %lo(DebugFont_3)
/* 7A118 0017A018 D0F7040C */  jal        Draw__10CDebugFontFv
/* 7A11C 0017A01C 00000000 */   nop
/* 7A120 0017A020 CC01023C */  lui        $2, %hi(GamePad)
/* 7A124 0017A024 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 7A128 0017A028 20000524 */  addiu      $5, $0, 0x20
/* 7A12C 0017A02C 1CAE040C */  jal        Down__8CGamePadFi
/* 7A130 0017A030 00000000 */   nop
/* 7A134 0017A034 29004010 */  beqz       $2, .L0017A0DC
/* 7A138 0017A038 00000000 */   nop
/* 7A13C 0017A03C 4040023C */  lui        $2, (0x40400000 >> 16)
/* 7A140 0017A040 00088244 */  mtc1       $2, $f1
/* 7A144 0017A044 049180C7 */  lwc1       $f0, -0x6EFC($gp)
/* 7A148 0017A048 03050146 */  div.s      $f20, $f0, $f1
/* 7A14C 0017A04C 06A30046 */  mov.s      $f12, $f20
/* 7A150 0017A050 2C44040C */  jal        fptosi
/* 7A154 0017A054 00000000 */   nop
/* 7A158 0017A058 06A30046 */  mov.s      $f12, $f20
/* 7A15C 0017A05C 2C44040C */  jal        fptosi
/* 7A160 0017A060 00000000 */   nop
/* 7A164 0017A064 7891838F */  lw         $3, -0x6E88($gp)
/* 7A168 0017A068 80200300 */  sll        $4, $3, 2
/* 7A16C 0017A06C D401033C */  lui        $3, %hi(menu$807)
/* 7A170 0017A070 50B86324 */  addiu      $3, $3, %lo(menu$807)
/* 7A174 0017A074 21186400 */  addu       $3, $3, $4
/* 7A178 0017A078 28264070 */  paddub     $4, $2, $0
/* 7A17C 0017A07C 0000658C */  lw         $5, 0x0($3)
/* 7A180 0017A080 AC13060C */  jal        EdMapJump__FiPc
/* 7A184 0017A084 00000000 */   nop
/* 7A188 0017A088 0C000224 */  addiu      $2, $0, 0xC
/* 7A18C 0017A08C 608782AF */  sw         $2, -0x78A0($gp)
.L0017A090:
/* 7A190 0017A090 8CFB040C */  jal        ReadBGSync__Fv
/* 7A194 0017A094 00000000 */   nop
/* 7A198 0017A098 FDFF4014 */  bnez       $2, .L0017A090
/* 7A19C 0017A09C 00000000 */   nop
/* 7A1A0 0017A0A0 7891828F */  lw         $2, -0x6E88($gp)
/* 7A1A4 0017A0A4 80180200 */  sll        $3, $2, 2
/* 7A1A8 0017A0A8 D401023C */  lui        $2, %hi(menu$807)
/* 7A1AC 0017A0AC 50B84224 */  addiu      $2, $2, %lo(menu$807)
/* 7A1B0 0017A0B0 21184300 */  addu       $3, $2, $3
/* 7A1B4 0017A0B4 D301023C */  lui        $2, %hi(interior_map_name)
/* 7A1B8 0017A0B8 80594424 */  addiu      $4, $2, %lo(interior_map_name)
/* 7A1BC 0017A0BC 0000658C */  lw         $5, 0x0($3)
/* 7A1C0 0017A0C0 5A15040C */  jal        strcpy
/* 7A1C4 0017A0C4 00000000 */   nop
/* 7A1C8 0017A0C8 04918CC7 */  lwc1       $f12, -0x6EFC($gp)
/* 7A1CC 0017A0CC D301023C */  lui        $2, %hi(interior_map_name)
/* 7A1D0 0017A0D0 80594424 */  addiu      $4, $2, %lo(interior_map_name)
/* 7A1D4 0017A0D4 8C6F060C */  jal        EditInInit__FfPc
/* 7A1D8 0017A0D8 00000000 */   nop
.L0017A0DC:
/* 7A1DC 0017A0DC CC01023C */  lui        $2, %hi(GamePad)
/* 7A1E0 0017A0E0 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 7A1E4 0017A0E4 00010524 */  addiu      $5, $0, 0x100
/* 7A1E8 0017A0E8 04AE040C */  jal        On__8CGamePadFi
/* 7A1EC 0017A0EC 00000000 */   nop
/* 7A1F0 0017A0F0 0B004010 */  beqz       $2, .L0017A120
/* 7A1F4 0017A0F4 00000000 */   nop
/* 7A1F8 0017A0F8 CC01023C */  lui        $2, %hi(GamePad)
/* 7A1FC 0017A0FC 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 7A200 0017A100 00080524 */  addiu      $5, $0, 0x800
/* 7A204 0017A104 04AE040C */  jal        On__8CGamePadFi
/* 7A208 0017A108 00000000 */   nop
/* 7A20C 0017A10C 04004010 */  beqz       $2, .L0017A120
/* 7A210 0017A110 00000000 */   nop
/* 7A214 0017A114 01000224 */  addiu      $2, $0, 0x1
/* 7A218 0017A118 A3050010 */  b          .L0017B7A8
/* 7A21C 0017A11C 00000000 */   nop
.L0017A120:
/* 7A220 0017A120 28160070 */  paddub     $2, $0, $0
/* 7A224 0017A124 A0050010 */  b          .L0017B7A8
/* 7A228 0017A128 00000000 */   nop
.L0017A12C:
/* 7A22C 0017A12C 1100812C */  sltiu      $at, $4, 0x11
/* 7A230 0017A130 65022010 */  beqz       $at, .L0017AAC8
/* 7A234 0017A134 00000000 */   nop
/* 7A238 0017A138 2A00023C */  lui        $2, %hi(_1611)
/* 7A23C 0017A13C 40AB4324 */  addiu      $3, $2, %lo(_1611)
/* 7A240 0017A140 80100400 */  sll        $2, $4, 2
/* 7A244 0017A144 21104300 */  addu       $2, $2, $3
/* 7A248 0017A148 0000428C */  lw         $2, 0x0($2)
/* 7A24C 0017A14C 08004000 */  jr         $2
/* 7A250 0017A150 00000000 */   nop
/* 7A254 0017A154 B89080AF */  sw         $0, -0x6F48($gp)
/* 7A258 0017A158 44F7050C */  jal        MainMode__Fv
/* 7A25C 0017A15C 00000000 */   nop
/* 7A260 0017A160 A8F7050C */  jal        MainEditMode__Fv
/* 7A264 0017A164 00000000 */   nop
/* 7A268 0017A168 48A8050C */  jal        EdCheckViewMode__Fv
/* 7A26C 0017A16C 00000000 */   nop
/* 7A270 0017A170 06004014 */  bnez       $2, .L0017A18C
/* 7A274 0017A174 00000000 */   nop
/* 7A278 0017A178 D301023C */  lui        $2, %hi(MainCamera)
/* 7A27C 0017A17C 40454224 */  addiu      $2, $2, %lo(MainCamera)
/* 7A280 0017A180 009182AF */  sw         $2, -0x6F00($gp)
/* 7A284 0017A184 04000010 */  b          .L0017A198
/* 7A288 0017A188 00000000 */   nop
.L0017A18C:
/* 7A28C 0017A18C D301023C */  lui        $2, %hi(ViewCamera)
/* 7A290 0017A190 40544224 */  addiu      $2, $2, %lo(ViewCamera)
/* 7A294 0017A194 009182AF */  sw         $2, -0x6F00($gp)
.L0017A198:
/* 7A298 0017A198 48A8050C */  jal        EdCheckViewMode__Fv
/* 7A29C 0017A19C 00000000 */   nop
/* 7A2A0 0017A1A0 49024014 */  bnez       $2, .L0017AAC8
/* 7A2A4 0017A1A4 00000000 */   nop
/* 7A2A8 0017A1A8 0091848F */  lw         $4, -0x6F00($gp)
/* 7A2AC 0017A1AC 01000524 */  addiu      $5, $0, 0x1
/* 7A2B0 0017A1B0 B802998C */  lw         $25, 0x2B8($4)
/* 7A2B4 0017A1B4 0800398F */  lw         $25, 0x8($25)
/* 7A2B8 0017A1B8 09F82003 */  jalr       $25
/* 7A2BC 0017A1BC 00000000 */   nop
/* 7A2C0 0017A1C0 41020010 */  b          .L0017AAC8
/* 7A2C4 0017A1C4 00000000 */   nop
/* 7A2C8 0017A1C8 9090828F */  lw         $2, -0x6F70($gp)
/* 7A2CC 0017A1CC 03004018 */  blez       $2, .L0017A1DC
/* 7A2D0 0017A1D0 00000000 */   nop
/* 7A2D4 0017A1D4 44F7050C */  jal        MainMode__Fv
/* 7A2D8 0017A1D8 00000000 */   nop
.L0017A1DC:
/* 7A2DC 0017A1DC A8F7050C */  jal        MainEditMode__Fv
/* 7A2E0 0017A1E0 00000000 */   nop
/* 7A2E4 0017A1E4 48A8050C */  jal        EdCheckViewMode__Fv
/* 7A2E8 0017A1E8 00000000 */   nop
/* 7A2EC 0017A1EC 06004014 */  bnez       $2, .L0017A208
/* 7A2F0 0017A1F0 00000000 */   nop
/* 7A2F4 0017A1F4 D301023C */  lui        $2, %hi(MainCamera)
/* 7A2F8 0017A1F8 40454224 */  addiu      $2, $2, %lo(MainCamera)
/* 7A2FC 0017A1FC 009182AF */  sw         $2, -0x6F00($gp)
/* 7A300 0017A200 04000010 */  b          .L0017A214
/* 7A304 0017A204 00000000 */   nop
.L0017A208:
/* 7A308 0017A208 D301023C */  lui        $2, %hi(ViewCamera)
/* 7A30C 0017A20C 40544224 */  addiu      $2, $2, %lo(ViewCamera)
/* 7A310 0017A210 009182AF */  sw         $2, -0x6F00($gp)
.L0017A214:
/* 7A314 0017A214 48A8050C */  jal        EdCheckViewMode__Fv
/* 7A318 0017A218 00000000 */   nop
/* 7A31C 0017A21C 07004014 */  bnez       $2, .L0017A23C
/* 7A320 0017A220 00000000 */   nop
/* 7A324 0017A224 0091848F */  lw         $4, -0x6F00($gp)
/* 7A328 0017A228 01000524 */  addiu      $5, $0, 0x1
/* 7A32C 0017A22C B802998C */  lw         $25, 0x2B8($4)
/* 7A330 0017A230 0800398F */  lw         $25, 0x8($25)
/* 7A334 0017A234 09F82003 */  jalr       $25
/* 7A338 0017A238 00000000 */   nop
.L0017A23C:
/* 7A33C 0017A23C A890828F */  lw         $2, -0x6F58($gp)
/* 7A340 0017A240 21024010 */  beqz       $2, .L0017AAC8
/* 7A344 0017A244 00000000 */   nop
/* 7A348 0017A248 9C9080AF */  sw         $0, -0x6F64($gp)
/* 7A34C 0017A24C 0426060C */  jal        EdFadeOutCheck__Fv
/* 7A350 0017A250 00000000 */   nop
/* 7A354 0017A254 1C024010 */  beqz       $2, .L0017AAC8
/* 7A358 0017A258 00000000 */   nop
/* 7A35C 0017A25C A890848F */  lw         $4, -0x6F58($gp)
/* 7A360 0017A260 05008104 */  bgez       $4, .L0017A278
/* 7A364 0017A264 00000000 */   nop
/* 7A368 0017A268 44E0050C */  jal        EdExitLoop__Fv
/* 7A36C 0017A26C 00000000 */   nop
/* 7A370 0017A270 0B000010 */  b          .L0017A2A0
/* 7A374 0017A274 00000000 */   nop
.L0017A278:
/* 7A378 0017A278 282E0070 */  paddub     $5, $0, $0
/* 7A37C 0017A27C 7CDE050C */  jal        RunEvent__FiP7CCamera
/* 7A380 0017A280 00000000 */   nop
/* 7A384 0017A284 00608044 */  mtc1       $0, $f12
/* 7A388 0017A288 00000000 */  nop
/* 7A38C 0017A28C 46630046 */  mov.s      $f13, $f12
/* 7A390 0017A290 86630046 */  mov.s      $f14, $f12
/* 7A394 0017A294 3C000424 */  addiu      $4, $0, 0x3C
/* 7A398 0017A298 C425060C */  jal        EdFadeIn__Fifff
/* 7A39C 0017A29C 00000000 */   nop
.L0017A2A0:
/* 7A3A0 0017A2A0 A89080AF */  sw         $0, -0x6F58($gp)
/* 7A3A4 0017A2A4 08020010 */  b          .L0017AAC8
/* 7A3A8 0017A2A8 00000000 */   nop
/* 7A3AC 0017A2AC D301023C */  lui        $2, %hi(EventCamera)
/* 7A3B0 0017A2B0 40514224 */  addiu      $2, $2, %lo(EventCamera)
/* 7A3B4 0017A2B4 009182AF */  sw         $2, -0x6F00($gp)
/* 7A3B8 0017A2B8 A8F7050C */  jal        MainEditMode__Fv
/* 7A3BC 0017A2BC 00000000 */   nop
/* 7A3C0 0017A2C0 5CFA050C */  jal        EventMode__Fv
/* 7A3C4 0017A2C4 00000000 */   nop
/* 7A3C8 0017A2C8 68FE050C */  jal        VillagerCollision__Fv
/* 7A3CC 0017A2CC 00000000 */   nop
/* 7A3D0 0017A2D0 F461060C */  jal        EdEventNPCStep__Fv
/* 7A3D4 0017A2D4 00000000 */   nop
/* 7A3D8 0017A2D8 0091848F */  lw         $4, -0x6F00($gp)
/* 7A3DC 0017A2DC 01000524 */  addiu      $5, $0, 0x1
/* 7A3E0 0017A2E0 B802998C */  lw         $25, 0x2B8($4)
/* 7A3E4 0017A2E4 0800398F */  lw         $25, 0x8($25)
/* 7A3E8 0017A2E8 09F82003 */  jalr       $25
/* 7A3EC 0017A2EC 00000000 */   nop
/* 7A3F0 0017A2F0 B49080AF */  sw         $0, -0x6F4C($gp)
/* 7A3F4 0017A2F4 B89080AF */  sw         $0, -0x6F48($gp)
/* 7A3F8 0017A2F8 9C9080AF */  sw         $0, -0x6F64($gp)
/* 7A3FC 0017A2FC F2010010 */  b          .L0017AAC8
/* 7A400 0017A300 00000000 */   nop
/* 7A404 0017A304 D301023C */  lui        $2, %hi(TalkCamera)
/* 7A408 0017A308 404E4224 */  addiu      $2, $2, %lo(TalkCamera)
/* 7A40C 0017A30C 009182AF */  sw         $2, -0x6F00($gp)
/* 7A410 0017A310 DCF9050C */  jal        TalkMode__Fv
/* 7A414 0017A314 00000000 */   nop
/* 7A418 0017A318 A8F7050C */  jal        MainEditMode__Fv
/* 7A41C 0017A31C 00000000 */   nop
/* 7A420 0017A320 0091848F */  lw         $4, -0x6F00($gp)
/* 7A424 0017A324 01000524 */  addiu      $5, $0, 0x1
/* 7A428 0017A328 B802998C */  lw         $25, 0x2B8($4)
/* 7A42C 0017A32C 0800398F */  lw         $25, 0x8($25)
/* 7A430 0017A330 09F82003 */  jalr       $25
/* 7A434 0017A334 00000000 */   nop
/* 7A438 0017A338 B49080AF */  sw         $0, -0x6F4C($gp)
/* 7A43C 0017A33C B89080AF */  sw         $0, -0x6F48($gp)
/* 7A440 0017A340 E1010010 */  b          .L0017AAC8
/* 7A444 0017A344 00000000 */   nop
/* 7A448 0017A348 CC01023C */  lui        $2, %hi(GamePad)
/* 7A44C 0017A34C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 7A450 0017A350 00F00534 */  ori        $5, $0, 0xF000
/* 7A454 0017A354 14000624 */  addiu      $6, $0, 0x14
/* 7A458 0017A358 05000724 */  addiu      $7, $0, 0x5
/* 7A45C 0017A35C 58AD040C */  jal        SetAutoRepeat__8CGamePadFiii
/* 7A460 0017A360 00000000 */   nop
/* 7A464 0017A364 D301023C */  lui        $2, %hi(EditCamera)
/* 7A468 0017A368 40484224 */  addiu      $2, $2, %lo(EditCamera)
/* 7A46C 0017A36C 009182AF */  sw         $2, -0x6F00($gp)
/* 7A470 0017A370 A8F7050C */  jal        MainEditMode__Fv
/* 7A474 0017A374 00000000 */   nop
/* 7A478 0017A378 98F7050C */  jal        EditMode__Fv
/* 7A47C 0017A37C 00000000 */   nop
/* 7A480 0017A380 0091848F */  lw         $4, -0x6F00($gp)
/* 7A484 0017A384 01000524 */  addiu      $5, $0, 0x1
/* 7A488 0017A388 B802998C */  lw         $25, 0x2B8($4)
/* 7A48C 0017A38C 0800398F */  lw         $25, 0x8($25)
/* 7A490 0017A390 09F82003 */  jalr       $25
/* 7A494 0017A394 00000000 */   nop
/* 7A498 0017A398 80BF023C */  lui        $2, (0xBF800000 >> 16)
/* 7A49C 0017A39C 00608244 */  mtc1       $2, $f12
/* 7A4A0 0017A3A0 E890848F */  lw         $4, -0x6F18($gp)
/* 7A4A4 0017A3A4 0091858F */  lw         $5, -0x6F00($gp)
/* 7A4A8 0017A3A8 8C87060C */  jal        EditAreaClip__11CEditGroundFP7CCameraf
/* 7A4AC 0017A3AC 00000000 */   nop
/* 7A4B0 0017A3B0 A890828F */  lw         $2, -0x6F58($gp)
/* 7A4B4 0017A3B4 C4014010 */  beqz       $2, .L0017AAC8
/* 7A4B8 0017A3B8 00000000 */   nop
/* 7A4BC 0017A3BC 9C9080AF */  sw         $0, -0x6F64($gp)
/* 7A4C0 0017A3C0 0426060C */  jal        EdFadeOutCheck__Fv
/* 7A4C4 0017A3C4 00000000 */   nop
/* 7A4C8 0017A3C8 BF014010 */  beqz       $2, .L0017AAC8
/* 7A4CC 0017A3CC 00000000 */   nop
/* 7A4D0 0017A3D0 A890848F */  lw         $4, -0x6F58($gp)
/* 7A4D4 0017A3D4 282E0070 */  paddub     $5, $0, $0
/* 7A4D8 0017A3D8 7CDE050C */  jal        RunEvent__FiP7CCamera
/* 7A4DC 0017A3DC 00000000 */   nop
/* 7A4E0 0017A3E0 00608044 */  mtc1       $0, $f12
/* 7A4E4 0017A3E4 00000000 */  nop
/* 7A4E8 0017A3E8 46630046 */  mov.s      $f13, $f12
/* 7A4EC 0017A3EC 86630046 */  mov.s      $f14, $f12
/* 7A4F0 0017A3F0 3C000424 */  addiu      $4, $0, 0x3C
/* 7A4F4 0017A3F4 C425060C */  jal        EdFadeIn__Fifff
/* 7A4F8 0017A3F8 00000000 */   nop
/* 7A4FC 0017A3FC A89080AF */  sw         $0, -0x6F58($gp)
/* 7A500 0017A400 B1010010 */  b          .L0017AAC8
/* 7A504 0017A404 00000000 */   nop
/* 7A508 0017A408 3091838F */  lw         $3, -0x6ED0($gp)
/* 7A50C 0017A40C 9C000224 */  addiu      $2, $0, 0x9C
/* 7A510 0017A410 09006214 */  bne        $3, $2, .L0017A438
/* 7A514 0017A414 00000000 */   nop
/* 7A518 0017A418 04918CC7 */  lwc1       $f12, -0x6EFC($gp)
/* 7A51C 0017A41C 981F060C */  jal        EdGetTime__Ff
/* 7A520 0017A420 00000000 */   nop
/* 7A524 0017A424 28264070 */  paddub     $4, $2, $0
/* 7A528 0017A428 D301023C */  lui        $2, %hi(interior_map_name)
/* 7A52C 0017A42C 80594524 */  addiu      $5, $2, %lo(interior_map_name)
/* 7A530 0017A430 AC13060C */  jal        EdMapJump__FiPc
/* 7A534 0017A434 00000000 */   nop
.L0017A438:
/* 7A538 0017A438 3091828F */  lw         $2, -0x6ED0($gp)
/* 7A53C 0017A43C 9C004128 */  slti       $at, $2, 0x9C
/* 7A540 0017A440 03002010 */  beqz       $at, .L0017A450
/* 7A544 0017A444 00000000 */   nop
/* 7A548 0017A448 38FB040C */  jal        ReadBG__Fv
/* 7A54C 0017A44C 00000000 */   nop
.L0017A450:
/* 7A550 0017A450 3491828F */  lw         $2, -0x6ECC($gp)
/* 7A554 0017A454 04004010 */  beqz       $2, .L0017A468
/* 7A558 0017A458 00000000 */   nop
/* 7A55C 0017A45C D301023C */  lui        $2, %hi(MainCamera)
/* 7A560 0017A460 40454224 */  addiu      $2, $2, %lo(MainCamera)
/* 7A564 0017A464 009182AF */  sw         $2, -0x6F00($gp)
.L0017A468:
/* 7A568 0017A468 94F9050C */  jal        OpenDoorMode__Fv
/* 7A56C 0017A46C 00000000 */   nop
/* 7A570 0017A470 A8F7050C */  jal        MainEditMode__Fv
/* 7A574 0017A474 00000000 */   nop
/* 7A578 0017A478 3091828F */  lw         $2, -0x6ED0($gp)
/* 7A57C 0017A47C FFFF4224 */  addiu      $2, $2, -0x1
/* 7A580 0017A480 309182AF */  sw         $2, -0x6ED0($gp)
/* 7A584 0017A484 0091848F */  lw         $4, -0x6F00($gp)
/* 7A588 0017A488 01000524 */  addiu      $5, $0, 0x1
/* 7A58C 0017A48C B802998C */  lw         $25, 0x2B8($4)
/* 7A590 0017A490 0800398F */  lw         $25, 0x8($25)
/* 7A594 0017A494 09F82003 */  jalr       $25
/* 7A598 0017A498 00000000 */   nop
/* 7A59C 0017A49C 3091838F */  lw         $3, -0x6ED0($gp)
/* 7A5A0 0017A4A0 64000224 */  addiu      $2, $0, 0x64
/* 7A5A4 0017A4A4 0E006214 */  bne        $3, $2, .L0017A4E0
/* 7A5A8 0017A4A8 00000000 */   nop
/* 7A5AC 0017A4AC 3890828F */  lw         $2, -0x6FC8($gp)
/* 7A5B0 0017A4B0 0B004004 */  bltz       $2, .L0017A4E0
/* 7A5B4 0017A4B4 00000000 */   nop
/* 7A5B8 0017A4B8 6487848F */  lw         $4, -0x789C($gp)
/* 7A5BC 0017A4BC C000A527 */  addiu      $5, $sp, 0xC0
/* 7A5C0 0017A4C0 A000998C */  lw         $25, 0xA0($4)
/* 7A5C4 0017A4C4 A000398F */  lw         $25, 0xA0($25)
/* 7A5C8 0017A4C8 09F82003 */  jalr       $25
/* 7A5CC 0017A4CC 00000000 */   nop
/* 7A5D0 0017A4D0 3890848F */  lw         $4, -0x6FC8($gp)
/* 7A5D4 0017A4D4 C000A527 */  addiu      $5, $sp, 0xC0
/* 7A5D8 0017A4D8 40C8050C */  jal        EdDoorOpenSe__FiPf
/* 7A5DC 0017A4DC 00000000 */   nop
.L0017A4E0:
/* 7A5E0 0017A4E0 3091828F */  lw         $2, -0x6ED0($gp)
/* 7A5E4 0017A4E4 96004128 */  slti       $at, $2, 0x96
/* 7A5E8 0017A4E8 07002010 */  beqz       $at, .L0017A508
/* 7A5EC 0017A4EC 00000000 */   nop
/* 7A5F0 0017A4F0 0426060C */  jal        EdFadeOutCheck__Fv
/* 7A5F4 0017A4F4 00000000 */   nop
/* 7A5F8 0017A4F8 03004010 */  beqz       $2, .L0017A508
/* 7A5FC 0017A4FC 00000000 */   nop
/* 7A600 0017A500 FFFF0224 */  addiu      $2, $0, -0x1
/* 7A604 0017A504 309182AF */  sw         $2, -0x6ED0($gp)
.L0017A508:
/* 7A608 0017A508 3091828F */  lw         $2, -0x6ED0($gp)
/* 7A60C 0017A50C 6E014104 */  bgez       $2, .L0017AAC8
/* 7A610 0017A510 00000000 */   nop
/* 7A614 0017A514 309180AF */  sw         $0, -0x6ED0($gp)
/* 7A618 0017A518 0C000224 */  addiu      $2, $0, 0xC
/* 7A61C 0017A51C 608782AF */  sw         $2, -0x78A0($gp)
/* 7A620 0017A520 B4C6050C */  jal        EdStopSoundSrc__Fv
/* 7A624 0017A524 00000000 */   nop
/* 7A628 0017A528 90828CC7 */  lwc1       $f12, -0x7D70($gp)
/* 7A62C 0017A52C 84C5050C */  jal        EdSetAmbientVol__Ff
/* 7A630 0017A530 00000000 */   nop
/* 7A634 0017A534 D464050C */  jal        SndStep__Fv
/* 7A638 0017A538 00000000 */   nop
/* 7A63C 0017A53C 4467050C */  jal        SndGetBgmNo__Fv
/* 7A640 0017A540 00000000 */   nop
/* 7A644 0017A544 409082AF */  sw         $2, -0x6FC0($gp)
/* 7A648 0017A548 9C86838F */  lw         $3, -0x7964($gp)
/* 7A64C 0017A54C 05000224 */  addiu      $2, $0, 0x5
/* 7A650 0017A550 02006214 */  bne        $3, $2, .L0017A55C
/* 7A654 0017A554 00000000 */   nop
/* 7A658 0017A558 409080AF */  sw         $0, -0x6FC0($gp)
.L0017A55C:
/* 7A65C 0017A55C 2491828F */  lw         $2, -0x6EDC($gp)
/* 7A660 0017A560 43100200 */  sra        $2, $2, 1
/* 7A664 0017A564 249182AF */  sw         $2, -0x6EDC($gp)
/* 7A668 0017A568 2491828F */  lw         $2, -0x6EDC($gp)
/* 7A66C 0017A56C 0300401C */  bgtz       $2, .L0017A57C
/* 7A670 0017A570 00000000 */   nop
/* 7A674 0017A574 01000224 */  addiu      $2, $0, 0x1
/* 7A678 0017A578 249182AF */  sw         $2, -0x6EDC($gp)
.L0017A57C:
/* 7A67C 0017A57C D401013C */  lui        $at, (0x1D40000 >> 16)
/* 7A680 0017A580 00D2228C */  lw         $2, -0x2E00($at)
/* 7A684 0017A584 03004010 */  beqz       $2, .L0017A594
/* 7A688 0017A588 00000000 */   nop
/* 7A68C 0017A58C 1467050C */  jal        SndBgmFadeOutStop__Fv
/* 7A690 0017A590 00000000 */   nop
.L0017A594:
/* 7A694 0017A594 D464050C */  jal        SndStep__Fv
/* 7A698 0017A598 00000000 */   nop
/* 7A69C 0017A59C C003A0AF */  sw         $0, 0x3C0($sp)
/* 7A6A0 0017A5A0 C403A0AF */  sw         $0, 0x3C4($sp)
/* 7A6A4 0017A5A4 00280224 */  addiu      $2, $0, 0x2800
/* 7A6A8 0017A5A8 C803A2AF */  sw         $2, 0x3C8($sp)
/* 7A6AC 0017A5AC 000E0224 */  addiu      $2, $0, 0xE00
/* 7A6B0 0017A5B0 CC03A2AF */  sw         $2, 0x3CC($sp)
/* 7A6B4 0017A5B4 C003A427 */  addiu      $4, $sp, 0x3C0
/* 7A6B8 0017A5B8 282E0070 */  paddub     $5, $0, $0
/* 7A6BC 0017A5BC 28360070 */  paddub     $6, $0, $0
/* 7A6C0 0017A5C0 283E0070 */  paddub     $7, $0, $0
/* 7A6C4 0017A5C4 80000824 */  addiu      $8, $0, 0x80
/* 7A6C8 0017A5C8 9CBE040C */  jal        MGFillBox__FRC8CRect_i_UcUcUcUc
/* 7A6CC 0017A5CC 00000000 */   nop
/* 7A6D0 0017A5D0 40B4040C */  jal        MGEndFrame__Fv
/* 7A6D4 0017A5D4 00000000 */   nop
/* 7A6D8 0017A5D8 28860070 */  paddub     $16, $0, $0
/* 7A6DC 0017A5DC 07000010 */  b          .L0017A5FC
/* 7A6E0 0017A5E0 00000000 */   nop
.L0017A5E4:
/* 7A6E4 0017A5E4 36000526 */  addiu      $5, $16, 0x36
/* 7A6E8 0017A5E8 C701023C */  lui        $2, %hi(TexManager)
/* 7A6EC 0017A5EC 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 7A6F0 0017A5F0 C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* 7A6F4 0017A5F4 00000000 */   nop
/* 7A6F8 0017A5F8 01001026 */  addiu      $16, $16, 0x1
.L0017A5FC:
/* 7A6FC 0017A5FC 0A00022A */  slti       $2, $16, 0xA
/* 7A700 0017A600 F8FF4014 */  bnez       $2, .L0017A5E4
/* 7A704 0017A604 00000000 */   nop
/* 7A708 0017A608 C701023C */  lui        $2, %hi(TexManager)
/* 7A70C 0017A60C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 7A710 0017A610 FCCD040C */  jal        CleanUpBuffer__15CTextureManagerFv
/* 7A714 0017A614 00000000 */   nop
.L0017A618:
/* 7A718 0017A618 8CFB040C */  jal        ReadBGSync__Fv
/* 7A71C 0017A61C 00000000 */   nop
/* 7A720 0017A620 FDFF4014 */  bnez       $2, .L0017A618
/* 7A724 0017A624 00000000 */   nop
/* 7A728 0017A628 28260070 */  paddub     $4, $0, $0
/* 7A72C 0017A62C C04B040C */  jal        sceGsSyncV
/* 7A730 0017A630 00000000 */   nop
/* 7A734 0017A634 D301023C */  lui        $2, %hi(EdVillagerInfo)
/* 7A738 0017A638 D0294424 */  addiu      $4, $2, %lo(EdVillagerInfo)
/* 7A73C 0017A63C 04918CC7 */  lwc1       $f12, -0x6EFC($gp)
/* 7A740 0017A640 6090858F */  lw         $5, -0x6FA0($gp)
/* 7A744 0017A644 F815060C */  jal        EdSelectVillager__FP13VILLAGER_INFOfP13EDIT_MAP_INFO
/* 7A748 0017A648 00000000 */   nop
/* 7A74C 0017A64C 04918CC7 */  lwc1       $f12, -0x6EFC($gp)
/* 7A750 0017A650 D301023C */  lui        $2, %hi(interior_map_name)
/* 7A754 0017A654 80594424 */  addiu      $4, $2, %lo(interior_map_name)
/* 7A758 0017A658 8C6F060C */  jal        EditInInit__FfPc
/* 7A75C 0017A65C 00000000 */   nop
/* 7A760 0017A660 64B3040C */  jal        MGBeginFrame__Fv
/* 7A764 0017A664 00000000 */   nop
/* 7A768 0017A668 D003A0AF */  sw         $0, 0x3D0($sp)
/* 7A76C 0017A66C D403A0AF */  sw         $0, 0x3D4($sp)
/* 7A770 0017A670 00280224 */  addiu      $2, $0, 0x2800
/* 7A774 0017A674 D803A2AF */  sw         $2, 0x3D8($sp)
/* 7A778 0017A678 000E0224 */  addiu      $2, $0, 0xE00
/* 7A77C 0017A67C DC03A2AF */  sw         $2, 0x3DC($sp)
/* 7A780 0017A680 D003A427 */  addiu      $4, $sp, 0x3D0
/* 7A784 0017A684 282E0070 */  paddub     $5, $0, $0
/* 7A788 0017A688 28360070 */  paddub     $6, $0, $0
/* 7A78C 0017A68C 283E0070 */  paddub     $7, $0, $0
/* 7A790 0017A690 80000824 */  addiu      $8, $0, 0x80
/* 7A794 0017A694 9CBE040C */  jal        MGFillBox__FRC8CRect_i_UcUcUcUc
/* 7A798 0017A698 00000000 */   nop
/* 7A79C 0017A69C DB01023C */  lui        $2, %hi(ItemVolumeStep)
/* 7A7A0 0017A6A0 10BC4424 */  addiu      $4, $2, %lo(ItemVolumeStep)
/* 7A7A4 0017A6A4 C8D5080C */  jal        CheckItemVolume__13CMenuItemStepFv
/* 7A7A8 0017A6A8 00000000 */   nop
/* 7A7AC 0017A6AC 28160070 */  paddub     $2, $0, $0
/* 7A7B0 0017A6B0 3D040010 */  b          .L0017B7A8
/* 7A7B4 0017A6B4 00000000 */   nop
/* 7A7B8 0017A6B8 A843080C */  jal        EditMenuLoop__Fv
/* 7A7BC 0017A6BC 00000000 */   nop
/* 7A7C0 0017A6C0 01014010 */  beqz       $2, .L0017AAC8
/* 7A7C4 0017A6C4 00000000 */   nop
/* 7A7C8 0017A6C8 04000224 */  addiu      $2, $0, 0x4
/* 7A7CC 0017A6CC 608782AF */  sw         $2, -0x78A0($gp)
/* 7A7D0 0017A6D0 FFFF0424 */  addiu      $4, $0, -0x1
/* 7A7D4 0017A6D4 6C8784AF */  sw         $4, -0x7894($gp)
/* 7A7D8 0017A6D8 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 7A7DC 0017A6DC D09B238C */  lw         $3, -0x6430($at)
/* 7A7E0 0017A6E0 05000224 */  addiu      $2, $0, 0x5
/* 7A7E4 0017A6E4 10006210 */  beq        $3, $2, .L0017A728
/* 7A7E8 0017A6E8 00000000 */   nop
/* 7A7EC 0017A6EC 03000224 */  addiu      $2, $0, 0x3
/* 7A7F0 0017A6F0 0A006210 */  beq        $3, $2, .L0017A71C
/* 7A7F4 0017A6F4 00000000 */   nop
/* 7A7F8 0017A6F8 03006010 */  beqz       $3, .L0017A708
/* 7A7FC 0017A6FC 00000000 */   nop
/* 7A800 0017A700 0F000010 */  b          .L0017A740
/* 7A804 0017A704 00000000 */   nop
.L0017A708:
/* 7A808 0017A708 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 7A80C 0017A70C D49B228C */  lw         $2, -0x642C($at)
/* 7A810 0017A710 6C8782AF */  sw         $2, -0x7894($gp)
/* 7A814 0017A714 0A000010 */  b          .L0017A740
/* 7A818 0017A718 00000000 */   nop
.L0017A71C:
/* 7A81C 0017A71C 6C8784AF */  sw         $4, -0x7894($gp)
/* 7A820 0017A720 07000010 */  b          .L0017A740
/* 7A824 0017A724 00000000 */   nop
.L0017A728:
/* 7A828 0017A728 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 7A82C 0017A72C E09B228C */  lw         $2, -0x6420($at)
/* 7A830 0017A730 C8004424 */  addiu      $4, $2, 0xC8
/* 7A834 0017A734 282E0070 */  paddub     $5, $0, $0
/* 7A838 0017A738 DCDE050C */  jal        FadeOutToEvent__Fii
/* 7A83C 0017A73C 00000000 */   nop
.L0017A740:
/* 7A840 0017A740 CCCB050C */  jal        EdExitMenu__Fv
/* 7A844 0017A744 00000000 */   nop
/* 7A848 0017A748 28160070 */  paddub     $2, $0, $0
/* 7A84C 0017A74C 16040010 */  b          .L0017B7A8
/* 7A850 0017A750 00000000 */   nop
/* 7A854 0017A754 A0B8040C */  jal        GetVif1Packet__Fv
/* 7A858 0017A758 00000000 */   nop
/* 7A85C 0017A75C C701033C */  lui        $3, %hi(TexManager)
/* 7A860 0017A760 70586424 */  addiu      $4, $3, %lo(TexManager)
/* 7A864 0017A764 282E4070 */  paddub     $5, $2, $0
/* 7A868 0017A768 10000624 */  addiu      $6, $0, 0x10
/* 7A86C 0017A76C 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 7A870 0017A770 00000000 */   nop
/* 7A874 0017A774 FFFF0224 */  addiu      $2, $0, -0x1
/* 7A878 0017A778 CC9482AF */  sw         $2, -0x6B34($gp)
/* 7A87C 0017A77C 6CF7050C */  jal        EditPartsObjectOnOff__Fv
/* 7A880 0017A780 00000000 */   nop
/* 7A884 0017A784 E0CB050C */  jal        EdMenuMode__Fv
/* 7A888 0017A788 00000000 */   nop
/* 7A88C 0017A78C CE004010 */  beqz       $2, .L0017AAC8
/* 7A890 0017A790 00000000 */   nop
/* 7A894 0017A794 01000224 */  addiu      $2, $0, 0x1
/* 7A898 0017A798 608782AF */  sw         $2, -0x78A0($gp)
/* 7A89C 0017A79C CCCB050C */  jal        EdExitMenu__Fv
/* 7A8A0 0017A7A0 00000000 */   nop
/* 7A8A4 0017A7A4 CC94848F */  lw         $4, -0x6B34($gp)
/* 7A8A8 0017A7A8 0D008004 */  bltz       $4, .L0017A7E0
/* 7A8AC 0017A7AC 00000000 */   nop
/* 7A8B0 0017A7B0 FFFF0524 */  addiu      $5, $0, -0x1
/* 7A8B4 0017A7B4 4C07050C */  jal        MapJump__Fii
/* 7A8B8 0017A7B8 00000000 */   nop
/* 7A8BC 0017A7BC CC94828F */  lw         $2, -0x6B34($gp)
/* 7A8C0 0017A7C0 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 7A8C4 0017A7C4 D0D522AC */  sw         $2, -0x2A30($at)
/* 7A8C8 0017A7C8 02000424 */  addiu      $4, $0, 0x2
/* 7A8CC 0017A7CC 0091858F */  lw         $5, -0x6F00($gp)
/* 7A8D0 0017A7D0 B0DE050C */  jal        RunSystemEvent__FiP7CCamera
/* 7A8D4 0017A7D4 00000000 */   nop
/* 7A8D8 0017A7D8 FFFF0224 */  addiu      $2, $0, -0x1
/* 7A8DC 0017A7DC CC9482AF */  sw         $2, -0x6B34($gp)
.L0017A7E0:
/* 7A8E0 0017A7E0 D201023C */  lui        $2, %hi(EdVillager)
/* 7A8E4 0017A7E4 905B4424 */  addiu      $4, $2, %lo(EdVillager)
/* 7A8E8 0017A7E8 D301023C */  lui        $2, %hi(EdVillagerInfo)
/* 7A8EC 0017A7EC D0294524 */  addiu      $5, $2, %lo(EdVillagerInfo)
/* 7A8F0 0017A7F0 E890868F */  lw         $6, -0x6F18($gp)
/* 7A8F4 0017A7F4 D818060C */  jal        EdInitVillagerOnOff__FP12CNPCharacterP13VILLAGER_INFOP11CEditGround
/* 7A8F8 0017A7F8 00000000 */   nop
/* 7A8FC 0017A7FC 28160070 */  paddub     $2, $0, $0
/* 7A900 0017A800 E9030010 */  b          .L0017B7A8
/* 7A904 0017A804 00000000 */   nop
/* 7A908 0017A808 4091828F */  lw         $2, -0x6EC0($gp)
/* 7A90C 0017A80C 8C004128 */  slti       $at, $2, 0x8C
/* 7A910 0017A810 03002010 */  beqz       $at, .L0017A820
/* 7A914 0017A814 00000000 */   nop
/* 7A918 0017A818 38FB040C */  jal        ReadBG__Fv
/* 7A91C 0017A81C 00000000 */   nop
.L0017A820:
/* 7A920 0017A820 28860070 */  paddub     $16, $0, $0
/* 7A924 0017A824 18000010 */  b          .L0017A888
/* 7A928 0017A828 00000000 */   nop
.L0017A82C:
/* 7A92C 0017A82C 40111000 */  sll        $2, $16, 5
/* 7A930 0017A830 21185000 */  addu       $3, $2, $16
/* 7A934 0017A834 80100300 */  sll        $2, $3, 2
/* 7A938 0017A838 21106200 */  addu       $2, $3, $2
/* 7A93C 0017A83C 40890200 */  sll        $17, $2, 5
/* 7A940 0017A840 D201023C */  lui        $2, %hi(EdVillager)
/* 7A944 0017A844 905B4224 */  addiu      $2, $2, %lo(EdVillager)
/* 7A948 0017A848 21905100 */  addu       $18, $2, $17
/* 7A94C 0017A84C 28264072 */  paddub     $4, $18, $0
/* 7A950 0017A850 9C59050C */  jal        CheckDraw__12CNPCharacterFv
/* 7A954 0017A854 00000000 */   nop
/* 7A958 0017A858 06004010 */  beqz       $2, .L0017A874
/* 7A95C 0017A85C 00000000 */   nop
/* 7A960 0017A860 28264072 */  paddub     $4, $18, $0
/* 7A964 0017A864 EC57050C */  jal        Step__12CNPCharacterFv
/* 7A968 0017A868 00000000 */   nop
/* 7A96C 0017A86C 05000010 */  b          .L0017A884
/* 7A970 0017A870 00000000 */   nop
.L0017A874:
/* 7A974 0017A874 D201023C */  lui        $2, %hi(D_1D26FFC)
/* 7A978 0017A878 FC6F4224 */  addiu      $2, $2, %lo(D_1D26FFC)
/* 7A97C 0017A87C 21105100 */  addu       $2, $2, $17
/* 7A980 0017A880 000040AC */  sw         $0, 0x0($2)
.L0017A884:
/* 7A984 0017A884 01001026 */  addiu      $16, $16, 0x1
.L0017A888:
/* 7A988 0017A888 0A00022A */  slti       $2, $16, 0xA
/* 7A98C 0017A88C E7FF4014 */  bnez       $2, .L0017A82C
/* 7A990 0017A890 00000000 */   nop
/* 7A994 0017A894 4091838F */  lw         $3, -0x6EC0($gp)
/* 7A998 0017A898 8C000224 */  addiu      $2, $0, 0x8C
/* 7A99C 0017A89C 11006214 */  bne        $3, $2, .L0017A8E4
/* 7A9A0 0017A8A0 00000000 */   nop
/* 7A9A4 0017A8A4 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 7A9A8 0017A8A8 68B320AC */  sw         $0, -0x4C98($at)
/* 7A9AC 0017A8AC 30FB040C */  jal        StartReadBG__Fv
/* 7A9B0 0017A8B0 00000000 */   nop
/* 7A9B4 0017A8B4 D301023C */  lui        $2, %hi(EdVillagerInfo)
/* 7A9B8 0017A8B8 D0294424 */  addiu      $4, $2, %lo(EdVillagerInfo)
/* 7A9BC 0017A8BC 04918CC7 */  lwc1       $f12, -0x6EFC($gp)
/* 7A9C0 0017A8C0 6090858F */  lw         $5, -0x6FA0($gp)
/* 7A9C4 0017A8C4 F815060C */  jal        EdSelectVillager__FP13VILLAGER_INFOfP13EDIT_MAP_INFO
/* 7A9C8 0017A8C8 00000000 */   nop
/* 7A9CC 0017A8CC D301023C */  lui        $2, %hi(EdVillagerInfo)
/* 7A9D0 0017A8D0 D0294424 */  addiu      $4, $2, %lo(EdVillagerInfo)
/* 7A9D4 0017A8D4 E890858F */  lw         $5, -0x6F18($gp)
/* 7A9D8 0017A8D8 2490868F */  lw         $6, -0x6FDC($gp)
/* 7A9DC 0017A8DC D017060C */  jal        EdInitVilager__FP13VILLAGER_INFOP11CEditGroundP1
/* 7A9E0 0017A8E0 00000000 */   nop
.L0017A8E4:
/* 7A9E4 0017A8E4 D301023C */  lui        $2, %hi(MainCamera)
/* 7A9E8 0017A8E8 40454224 */  addiu      $2, $2, %lo(MainCamera)
/* 7A9EC 0017A8EC 009182AF */  sw         $2, -0x6F00($gp)
/* 7A9F0 0017A8F0 00A08044 */  mtc1       $0, $f20
/* 7A9F4 0017A8F4 6487848F */  lw         $4, -0x789C($gp)
/* 7A9F8 0017A8F8 A000998C */  lw         $25, 0xA0($4)
/* 7A9FC 0017A8FC 6800398F */  lw         $25, 0x68($25)
/* 7AA00 0017A900 09F82003 */  jalr       $25
/* 7AA04 0017A904 00000000 */   nop
/* 7AA08 0017A908 040054E4 */  swc1       $f20, 0x4($2)
/* 7AA0C 0017A90C 6487838F */  lw         $3, -0x789C($gp)
/* 7AA10 0017A910 680C60AC */  sw         $0, 0xC68($3)
/* 7AA14 0017A914 640C60AC */  sw         $0, 0xC64($3)
/* 7AA18 0017A918 80BF023C */  lui        $2, (0xBF800000 >> 16)
/* 7AA1C 0017A91C 600C62AC */  sw         $2, 0xC60($3)
/* 7AA20 0017A920 6487848F */  lw         $4, -0x789C($gp)
/* 7AA24 0017A924 A000998C */  lw         $25, 0xA0($4)
/* 7AA28 0017A928 0800398F */  lw         $25, 0x8($25)
/* 7AA2C 0017A92C 09F82003 */  jalr       $25
/* 7AA30 0017A930 00000000 */   nop
/* 7AA34 0017A934 6487848F */  lw         $4, -0x789C($gp)
/* 7AA38 0017A938 282E0070 */  paddub     $5, $0, $0
/* 7AA3C 0017A93C A000998C */  lw         $25, 0xA0($4)
/* 7AA40 0017A940 9400398F */  lw         $25, 0x94($25)
/* 7AA44 0017A944 09F82003 */  jalr       $25
/* 7AA48 0017A948 00000000 */   nop
/* 7AA4C 0017A94C 6487848F */  lw         $4, -0x789C($gp)
/* 7AA50 0017A950 A000998C */  lw         $25, 0xA0($4)
/* 7AA54 0017A954 9000398F */  lw         $25, 0x90($25)
/* 7AA58 0017A958 09F82003 */  jalr       $25
/* 7AA5C 0017A95C 00000000 */   nop
/* 7AA60 0017A960 A8F7050C */  jal        MainEditMode__Fv
/* 7AA64 0017A964 00000000 */   nop
/* 7AA68 0017A968 4091828F */  lw         $2, -0x6EC0($gp)
/* 7AA6C 0017A96C FFFF4224 */  addiu      $2, $2, -0x1
/* 7AA70 0017A970 409182AF */  sw         $2, -0x6EC0($gp)
/* 7AA74 0017A974 0091848F */  lw         $4, -0x6F00($gp)
/* 7AA78 0017A978 01000524 */  addiu      $5, $0, 0x1
/* 7AA7C 0017A97C B802998C */  lw         $25, 0x2B8($4)
/* 7AA80 0017A980 0800398F */  lw         $25, 0x8($25)
/* 7AA84 0017A984 09F82003 */  jalr       $25
/* 7AA88 0017A988 00000000 */   nop
/* 7AA8C 0017A98C 4091828F */  lw         $2, -0x6EC0($gp)
/* 7AA90 0017A990 4D004104 */  bgez       $2, .L0017AAC8
/* 7AA94 0017A994 00000000 */   nop
.L0017A998:
/* 7AA98 0017A998 8CFB040C */  jal        ReadBGSync__Fv
/* 7AA9C 0017A99C 00000000 */   nop
/* 7AAA0 0017A9A0 FDFF4014 */  bnez       $2, .L0017A998
/* 7AAA4 0017A9A4 00000000 */   nop
/* 7AAA8 0017A9A8 36001024 */  addiu      $16, $0, 0x36
/* 7AAAC 0017A9AC 07000010 */  b          .L0017A9CC
/* 7AAB0 0017A9B0 00000000 */   nop
.L0017A9B4:
/* 7AAB4 0017A9B4 C701023C */  lui        $2, %hi(TexManager)
/* 7AAB8 0017A9B8 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 7AABC 0017A9BC 282E0072 */  paddub     $5, $16, $0
/* 7AAC0 0017A9C0 C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* 7AAC4 0017A9C4 00000000 */   nop
/* 7AAC8 0017A9C8 01001026 */  addiu      $16, $16, 0x1
.L0017A9CC:
/* 7AACC 0017A9CC 4000022A */  slti       $2, $16, 0x40
/* 7AAD0 0017A9D0 F8FF4014 */  bnez       $2, .L0017A9B4
/* 7AAD4 0017A9D4 00000000 */   nop
/* 7AAD8 0017A9D8 C701023C */  lui        $2, %hi(TexManager)
/* 7AADC 0017A9DC 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 7AAE0 0017A9E0 FCCD040C */  jal        CleanUpBuffer__15CTextureManagerFv
/* 7AAE4 0017A9E4 00000000 */   nop
/* 7AAE8 0017A9E8 28860070 */  paddub     $16, $0, $0
/* 7AAEC 0017A9EC 15000010 */  b          .L0017AA44
/* 7AAF0 0017A9F0 00000000 */   nop
.L0017A9F4:
/* 7AAF4 0017A9F4 28260072 */  paddub     $4, $16, $0
/* 7AAF8 0017A9F8 18FB040C */  jal        GetReadBGFile__Fi
/* 7AAFC 0017A9FC 00000000 */   nop
/* 7AB00 0017AA00 0F004010 */  beqz       $2, .L0017AA40
/* 7AB04 0017AA04 00000000 */   nop
/* 7AB08 0017AA08 8C00448C */  lw         $4, 0x8C($2)
/* 7AB0C 0017AA0C 40111000 */  sll        $2, $16, 5
/* 7AB10 0017AA10 21185000 */  addu       $3, $2, $16
/* 7AB14 0017AA14 80100300 */  sll        $2, $3, 2
/* 7AB18 0017AA18 21106200 */  addu       $2, $3, $2
/* 7AB1C 0017AA1C 40190200 */  sll        $3, $2, 5
/* 7AB20 0017AA20 D201023C */  lui        $2, %hi(EdVillager)
/* 7AB24 0017AA24 905B4224 */  addiu      $2, $2, %lo(EdVillager)
/* 7AB28 0017AA28 21304300 */  addu       $6, $2, $3
/* 7AB2C 0017AA2C 4814C524 */  addiu      $5, $6, 0x1448
/* 7AB30 0017AA30 D201023C */  lui        $2, %hi(EdVillagerBuffer)
/* 7AB34 0017AA34 60B34724 */  addiu      $7, $2, %lo(EdVillagerBuffer)
/* 7AB38 0017AA38 3018060C */  jal        EdLoadVillager__FPUiPcP12CNPCharacterP14CDataAlloc2_1_
/* 7AB3C 0017AA3C 00000000 */   nop
.L0017AA40:
/* 7AB40 0017AA40 01001026 */  addiu      $16, $16, 0x1
.L0017AA44:
/* 7AB44 0017AA44 0A00022A */  slti       $2, $16, 0xA
/* 7AB48 0017AA48 EAFF4014 */  bnez       $2, .L0017A9F4
/* 7AB4C 0017AA4C 00000000 */   nop
/* 7AB50 0017AA50 D201023C */  lui        $2, %hi(EdVillager)
/* 7AB54 0017AA54 905B4424 */  addiu      $4, $2, %lo(EdVillager)
/* 7AB58 0017AA58 D301023C */  lui        $2, %hi(EdVillagerInfo)
/* 7AB5C 0017AA5C D0294524 */  addiu      $5, $2, %lo(EdVillagerInfo)
/* 7AB60 0017AA60 E890868F */  lw         $6, -0x6F18($gp)
/* 7AB64 0017AA64 283E0070 */  paddub     $7, $0, $0
/* 7AB68 0017AA68 4419060C */  jal        EdInitVilagerPosition__FP12CNPCharacterP13VILLAGER_INFOP11CEditGroundPA4_f
/* 7AB6C 0017AA6C 00000000 */   nop
/* 7AB70 0017AA70 409180AF */  sw         $0, -0x6EC0($gp)
/* 7AB74 0017AA74 01000224 */  addiu      $2, $0, 0x1
/* 7AB78 0017AA78 608782AF */  sw         $2, -0x78A0($gp)
/* 7AB7C 0017AA7C 00608044 */  mtc1       $0, $f12
/* 7AB80 0017AA80 00000000 */  nop
/* 7AB84 0017AA84 46630046 */  mov.s      $f13, $f12
/* 7AB88 0017AA88 86630046 */  mov.s      $f14, $f12
/* 7AB8C 0017AA8C 40000424 */  addiu      $4, $0, 0x40
/* 7AB90 0017AA90 C425060C */  jal        EdFadeIn__Fifff
/* 7AB94 0017AA94 00000000 */   nop
/* 7AB98 0017AA98 0B000010 */  b          .L0017AAC8
/* 7AB9C 0017AA9C 00000000 */   nop
/* 7ABA0 0017AAA0 B89080AF */  sw         $0, -0x6F48($gp)
/* 7ABA4 0017AAA4 01000424 */  addiu      $4, $0, 0x1
/* 7ABA8 0017AAA8 B4B5040C */  jal        MGFlipWaitVSync__Fi
/* 7ABAC 0017AAAC 00000000 */   nop
/* 7ABB0 0017AAB0 80BF023C */  lui        $2, (0xBF800000 >> 16)
/* 7ABB4 0017AAB4 00608244 */  mtc1       $2, $f12
/* 7ABB8 0017AAB8 E890848F */  lw         $4, -0x6F18($gp)
/* 7ABBC 0017AABC 0091858F */  lw         $5, -0x6F00($gp)
/* 7ABC0 0017AAC0 8C87060C */  jal        EditAreaClip__11CEditGroundFP7CCameraf
/* 7ABC4 0017AAC4 00000000 */   nop
.L0017AAC8:
/* 7ABC8 0017AAC8 0091848F */  lw         $4, -0x6F00($gp)
/* 7ABCC 0017AACC D000A527 */  addiu      $5, $sp, 0xD0
/* 7ABD0 0017AAD0 F890040C */  jal        GetCameraMatrix__7CCameraFPA4_f
/* 7ABD4 0017AAD4 00000000 */   nop
/* 7ABD8 0017AAD8 0091848F */  lw         $4, -0x6F00($gp)
/* 7ABDC 0017AADC 1001A527 */  addiu      $5, $sp, 0x110
/* 7ABE0 0017AAE0 9C91040C */  jal        GetPos__7CCameraFPf
/* 7ABE4 0017AAE4 00000000 */   nop
/* 7ABE8 0017AAE8 D000A427 */  addiu      $4, $sp, 0xD0
/* 7ABEC 0017AAEC 1001A527 */  addiu      $5, $sp, 0x110
/* 7ABF0 0017AAF0 E8B7040C */  jal        MGSetViewMatrix__FPA4_fPf
/* 7ABF4 0017AAF4 00000000 */   nop
/* 7ABF8 0017AAF8 6087838F */  lw         $3, -0x78A0($gp)
/* 7ABFC 0017AAFC 04000224 */  addiu      $2, $0, 0x4
/* 7AC00 0017AB00 1A006210 */  beq        $3, $2, .L0017AB6C
/* 7AC04 0017AB04 00000000 */   nop
/* 7AC08 0017AB08 05000224 */  addiu      $2, $0, 0x5
/* 7AC0C 0017AB0C 17006210 */  beq        $3, $2, .L0017AB6C
/* 7AC10 0017AB10 00000000 */   nop
/* 7AC14 0017AB14 0A000224 */  addiu      $2, $0, 0xA
/* 7AC18 0017AB18 14006210 */  beq        $3, $2, .L0017AB6C
/* 7AC1C 0017AB1C 00000000 */   nop
/* 7AC20 0017AB20 D890828F */  lw         $2, -0x6F28($gp)
/* 7AC24 0017AB24 09004018 */  blez       $2, .L0017AB4C
/* 7AC28 0017AB28 00000000 */   nop
/* 7AC2C 0017AB2C 80BF023C */  lui        $2, (0xBF800000 >> 16)
/* 7AC30 0017AB30 00608244 */  mtc1       $2, $f12
/* 7AC34 0017AB34 E890848F */  lw         $4, -0x6F18($gp)
/* 7AC38 0017AB38 0091858F */  lw         $5, -0x6F00($gp)
/* 7AC3C 0017AB3C 8C87060C */  jal        EditAreaClip__11CEditGroundFP7CCameraf
/* 7AC40 0017AB40 00000000 */   nop
/* 7AC44 0017AB44 09000010 */  b          .L0017AB6C
/* 7AC48 0017AB48 00000000 */   nop
.L0017AB4C:
/* 7AC4C 0017AB4C 204E0224 */  addiu      $2, $0, 0x4E20
/* 7AC50 0017AB50 00008244 */  mtc1       $2, $f0
/* 7AC54 0017AB54 00000000 */  nop
/* 7AC58 0017AB58 20038046 */  cvt.s.w    $f12, $f0
/* 7AC5C 0017AB5C E890848F */  lw         $4, -0x6F18($gp)
/* 7AC60 0017AB60 0091858F */  lw         $5, -0x6F00($gp)
/* 7AC64 0017AB64 8C87060C */  jal        EditAreaClip__11CEditGroundFP7CCameraf
/* 7AC68 0017AB68 00000000 */   nop
.L0017AB6C:
/* 7AC6C 0017AB6C 6087848F */  lw         $4, -0x78A0($gp)
/* 7AC70 0017AB70 1100812C */  sltiu      $at, $4, 0x11
/* 7AC74 0017AB74 27002010 */  beqz       $at, .L0017AC14
/* 7AC78 0017AB78 00000000 */   nop
/* 7AC7C 0017AB7C 2A00023C */  lui        $2, %hi(_1612)
/* 7AC80 0017AB80 F0AA4324 */  addiu      $3, $2, %lo(_1612)
/* 7AC84 0017AB84 80100400 */  sll        $2, $4, 2
/* 7AC88 0017AB88 21104300 */  addu       $2, $2, $3
/* 7AC8C 0017AB8C 0000428C */  lw         $2, 0x0($2)
/* 7AC90 0017AB90 08004000 */  jr         $2
/* 7AC94 0017AB94 00000000 */   nop
/* 7AC98 0017AB98 C49080AF */  sw         $0, -0x6F3C($gp)
/* 7AC9C 0017AB9C 01000224 */  addiu      $2, $0, 0x1
/* 7ACA0 0017ABA0 C89082AF */  sw         $2, -0x6F38($gp)
/* 7ACA4 0017ABA4 CC9080AF */  sw         $0, -0x6F34($gp)
/* 7ACA8 0017ABA8 BC9082AF */  sw         $2, -0x6F44($gp)
/* 7ACAC 0017ABAC C09082AF */  sw         $2, -0x6F40($gp)
/* 7ACB0 0017ABB0 F4ED050C */  jal        MainDraw__Fv
/* 7ACB4 0017ABB4 00000000 */   nop
/* 7ACB8 0017ABB8 16000010 */  b          .L0017AC14
/* 7ACBC 0017ABBC 00000000 */   nop
/* 7ACC0 0017ABC0 01000224 */  addiu      $2, $0, 0x1
/* 7ACC4 0017ABC4 C49082AF */  sw         $2, -0x6F3C($gp)
/* 7ACC8 0017ABC8 C89080AF */  sw         $0, -0x6F38($gp)
/* 7ACCC 0017ABCC CC9082AF */  sw         $2, -0x6F34($gp)
/* 7ACD0 0017ABD0 BC9080AF */  sw         $0, -0x6F44($gp)
/* 7ACD4 0017ABD4 D890828F */  lw         $2, -0x6F28($gp)
/* 7ACD8 0017ABD8 0B004128 */  slti       $at, $2, 0xB
/* 7ACDC 0017ABDC 02002010 */  beqz       $at, .L0017ABE8
/* 7ACE0 0017ABE0 00000000 */   nop
/* 7ACE4 0017ABE4 C09080AF */  sw         $0, -0x6F40($gp)
.L0017ABE8:
/* 7ACE8 0017ABE8 F4ED050C */  jal        MainDraw__Fv
/* 7ACEC 0017ABEC 00000000 */   nop
/* 7ACF0 0017ABF0 08000010 */  b          .L0017AC14
/* 7ACF4 0017ABF4 00000000 */   nop
/* 7ACF8 0017ABF8 D201023C */  lui        $2, %hi(EditNameMes)
/* 7ACFC 0017ABFC 50144424 */  addiu      $4, $2, %lo(EditNameMes)
/* 7AD00 0017AC00 FFFF0524 */  addiu      $5, $0, -0x1
/* 7AD04 0017AC04 5441050C */  jal        MakeMesWin__6ClsMesFi
/* 7AD08 0017AC08 00000000 */   nop
/* 7AD0C 0017AC0C 1826060C */  jal        EdFadeInOut__Fv
/* 7AD10 0017AC10 00000000 */   nop
.L0017AC14:
/* 7AD14 0017AC14 D0DF050C */  jal        CheckKeyLock__Fv
/* 7AD18 0017AC18 00000000 */   nop
/* 7AD1C 0017AC1C 6087838F */  lw         $3, -0x78A0($gp)
/* 7AD20 0017AC20 01000224 */  addiu      $2, $0, 0x1
/* 7AD24 0017AC24 09006214 */  bne        $3, $2, .L0017AC4C
/* 7AD28 0017AC28 00000000 */   nop
/* 7AD2C 0017AC2C 6487848F */  lw         $4, -0x789C($gp)
/* 7AD30 0017AC30 2001A527 */  addiu      $5, $sp, 0x120
/* 7AD34 0017AC34 A000998C */  lw         $25, 0xA0($4)
/* 7AD38 0017AC38 A000398F */  lw         $25, 0xA0($25)
/* 7AD3C 0017AC3C 09F82003 */  jalr       $25
/* 7AD40 0017AC40 00000000 */   nop
/* 7AD44 0017AC44 06000010 */  b          .L0017AC60
/* 7AD48 0017AC48 00000000 */   nop
.L0017AC4C:
/* 7AD4C 0017AC4C 7087828F */  lw         $2, -0x7890($gp)
/* 7AD50 0017AC50 2001A427 */  addiu      $4, $sp, 0x120
/* 7AD54 0017AC54 20024524 */  addiu      $5, $2, 0x220
/* 7AD58 0017AC58 0C86040C */  jal        sceVu0CopyVector
/* 7AD5C 0017AC5C 00000000 */   nop
.L0017AC60:
/* 7AD60 0017AC60 4C8F828F */  lw         $2, -0x70B4($gp)
/* 7AD64 0017AC64 0500401C */  bgtz       $2, .L0017AC7C
/* 7AD68 0017AC68 00000000 */   nop
/* 7AD6C 0017AC6C 288D828F */  lw         $2, -0x72D8($gp)
/* 7AD70 0017AC70 05004128 */  slti       $at, $2, 0x5
/* 7AD74 0017AC74 D8002010 */  beqz       $at, .L0017AFD8
/* 7AD78 0017AC78 00000000 */   nop
.L0017AC7C:
/* 7AD7C 0017AC7C 00010424 */  addiu      $4, $0, 0x100
/* 7AD80 0017AC80 02000524 */  addiu      $5, $0, 0x2
/* 7AD84 0017AC84 64A6050C */  jal        EdPadDown__Fii
/* 7AD88 0017AC88 00000000 */   nop
/* 7AD8C 0017AC8C D2004010 */  beqz       $2, .L0017AFD8
/* 7AD90 0017AC90 00000000 */   nop
/* 7AD94 0017AC94 48A8050C */  jal        EdCheckViewMode__Fv
/* 7AD98 0017AC98 00000000 */   nop
/* 7AD9C 0017AC9C CE004014 */  bnez       $2, .L0017AFD8
/* 7ADA0 0017ACA0 00000000 */   nop
/* 7ADA4 0017ACA4 B090828F */  lw         $2, -0x6F50($gp)
/* 7ADA8 0017ACA8 CB004014 */  bnez       $2, .L0017AFD8
/* 7ADAC 0017ACAC 00000000 */   nop
/* 7ADB0 0017ACB0 6087838F */  lw         $3, -0x78A0($gp)
/* 7ADB4 0017ACB4 01000224 */  addiu      $2, $0, 0x1
/* 7ADB8 0017ACB8 54006214 */  bne        $3, $2, .L0017AE0C
/* 7ADBC 0017ACBC 00000000 */   nop
/* 7ADC0 0017ACC0 1E000224 */  addiu      $2, $0, 0x1E
/* 7ADC4 0017ACC4 D89082AF */  sw         $2, -0x6F28($gp)
/* 7ADC8 0017ACC8 04000224 */  addiu      $2, $0, 0x4
/* 7ADCC 0017ACCC 608782AF */  sw         $2, -0x78A0($gp)
/* 7ADD0 0017ACD0 D301023C */  lui        $2, %hi(MainCamera)
/* 7ADD4 0017ACD4 40454424 */  addiu      $4, $2, %lo(MainCamera)
/* 7ADD8 0017ACD8 D092040C */  jal        GetAngle__13CCameraFollowFv
/* 7ADDC 0017ACDC 00000000 */   nop
/* 7ADE0 0017ACE0 D301023C */  lui        $2, %hi(EditCamera)
/* 7ADE4 0017ACE4 40484424 */  addiu      $4, $2, %lo(EditCamera)
/* 7ADE8 0017ACE8 06030046 */  mov.s      $f12, $f0
/* 7ADEC 0017ACEC CC92040C */  jal        SetAngleSoon__13CCameraFollowFf
/* 7ADF0 0017ACF0 00000000 */   nop
/* 7ADF4 0017ACF4 D301023C */  lui        $2, %hi(MainCamera)
/* 7ADF8 0017ACF8 40454424 */  addiu      $4, $2, %lo(MainCamera)
/* 7ADFC 0017ACFC 3001A527 */  addiu      $5, $sp, 0x130
/* 7AE00 0017AD00 9C91040C */  jal        GetPos__7CCameraFPf
/* 7AE04 0017AD04 00000000 */   nop
/* 7AE08 0017AD08 D301023C */  lui        $2, %hi(EditCamera)
/* 7AE0C 0017AD0C 40484424 */  addiu      $4, $2, %lo(EditCamera)
/* 7AE10 0017AD10 3001A527 */  addiu      $5, $sp, 0x130
/* 7AE14 0017AD14 A490040C */  jal        SetPos__7CCameraFPf
/* 7AE18 0017AD18 00000000 */   nop
/* 7AE1C 0017AD1C D301023C */  lui        $2, %hi(MainCamera)
/* 7AE20 0017AD20 40454424 */  addiu      $4, $2, %lo(MainCamera)
/* 7AE24 0017AD24 3001A527 */  addiu      $5, $sp, 0x130
/* 7AE28 0017AD28 A891040C */  jal        GetRef__7CCameraFPf
/* 7AE2C 0017AD2C 00000000 */   nop
/* 7AE30 0017AD30 D301023C */  lui        $2, %hi(EditCamera)
/* 7AE34 0017AD34 40484424 */  addiu      $4, $2, %lo(EditCamera)
/* 7AE38 0017AD38 3001A527 */  addiu      $5, $sp, 0x130
/* 7AE3C 0017AD3C C490040C */  jal        SetRef__7CCameraFPf
/* 7AE40 0017AD40 00000000 */   nop
/* 7AE44 0017AD44 6487848F */  lw         $4, -0x789C($gp)
/* 7AE48 0017AD48 3001A527 */  addiu      $5, $sp, 0x130
/* 7AE4C 0017AD4C A000998C */  lw         $25, 0xA0($4)
/* 7AE50 0017AD50 A000398F */  lw         $25, 0xA0($25)
/* 7AE54 0017AD54 09F82003 */  jalr       $25
/* 7AE58 0017AD58 00000000 */   nop
/* 7AE5C 0017AD5C 449180AF */  sw         $0, -0x6EBC($gp)
/* 7AE60 0017AD60 489180AF */  sw         $0, -0x6EB8($gp)
/* 7AE64 0017AD64 4C9180AF */  sw         $0, -0x6EB4($gp)
/* 7AE68 0017AD68 6487848F */  lw         $4, -0x789C($gp)
/* 7AE6C 0017AD6C 3001A527 */  addiu      $5, $sp, 0x130
/* 7AE70 0017AD70 A000998C */  lw         $25, 0xA0($4)
/* 7AE74 0017AD74 A000398F */  lw         $25, 0xA0($25)
/* 7AE78 0017AD78 09F82003 */  jalr       $25
/* 7AE7C 0017AD7C 00000000 */   nop
/* 7AE80 0017AD80 7087848F */  lw         $4, -0x7890($gp)
/* 7AE84 0017AD84 3001A527 */  addiu      $5, $sp, 0x130
/* 7AE88 0017AD88 B89F040C */  jal        SetPosition__6CFrameFPf
/* 7AE8C 0017AD8C 00000000 */   nop
/* 7AE90 0017AD90 7087838F */  lw         $3, -0x7890($gp)
/* 7AE94 0017AD94 D301023C */  lui        $2, %hi(NowPartsCursorPos)
/* 7AE98 0017AD98 C0594424 */  addiu      $4, $2, %lo(NowPartsCursorPos)
/* 7AE9C 0017AD9C 20026524 */  addiu      $5, $3, 0x220
/* 7AEA0 0017ADA0 0C86040C */  jal        sceVu0CopyVector
/* 7AEA4 0017ADA4 00000000 */   nop
/* 7AEA8 0017ADA8 7087838F */  lw         $3, -0x7890($gp)
/* 7AEAC 0017ADAC D301023C */  lui        $2, %hi(NowCursorPos)
/* 7AEB0 0017ADB0 405C4424 */  addiu      $4, $2, %lo(NowCursorPos)
/* 7AEB4 0017ADB4 20026524 */  addiu      $5, $3, 0x220
/* 7AEB8 0017ADB8 0C86040C */  jal        sceVu0CopyVector
/* 7AEBC 0017ADBC 00000000 */   nop
/* 7AEC0 0017ADC0 7087838F */  lw         $3, -0x7890($gp)
/* 7AEC4 0017ADC4 D301023C */  lui        $2, %hi(NextCursorPos)
/* 7AEC8 0017ADC8 505C4424 */  addiu      $4, $2, %lo(NextCursorPos)
/* 7AECC 0017ADCC 20026524 */  addiu      $5, $3, 0x220
/* 7AED0 0017ADD0 0C86040C */  jal        sceVu0CopyVector
/* 7AED4 0017ADD4 00000000 */   nop
/* 7AED8 0017ADD8 509180AF */  sw         $0, -0x6EB0($gp)
/* 7AEDC 0017ADDC 549180AF */  sw         $0, -0x6EAC($gp)
/* 7AEE0 0017ADE0 FFFF0324 */  addiu      $3, $0, -0x1
/* 7AEE4 0017ADE4 748783AF */  sw         $3, -0x788C($gp)
/* 7AEE8 0017ADE8 1E000224 */  addiu      $2, $0, 0x1E
/* 7AEEC 0017ADEC 589182AF */  sw         $2, -0x6EA8($gp)
/* 7AEF0 0017ADF0 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 7AEF4 0017ADF4 D09B23AC */  sw         $3, -0x6430($at)
/* 7AEF8 0017ADF8 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 7AEFC 0017ADFC D49B23AC */  sw         $3, -0x642C($at)
/* 7AF00 0017AE00 6C8783AF */  sw         $3, -0x7894($gp)
/* 7AF04 0017AE04 74000010 */  b          .L0017AFD8
/* 7AF08 0017AE08 00000000 */   nop
.L0017AE0C:
/* 7AF0C 0017AE0C 04000224 */  addiu      $2, $0, 0x4
/* 7AF10 0017AE10 71006214 */  bne        $3, $2, .L0017AFD8
/* 7AF14 0017AE14 00000000 */   nop
/* 7AF18 0017AE18 E890848F */  lw         $4, -0x6F18($gp)
/* 7AF1C 0017AE1C 7086060C */  jal        CheckEffect__11CEditGroundFv
/* 7AF20 0017AE20 00000000 */   nop
/* 7AF24 0017AE24 6C004014 */  bnez       $2, .L0017AFD8
/* 7AF28 0017AE28 00000000 */   nop
/* 7AF2C 0017AE2C 1E000224 */  addiu      $2, $0, 0x1E
/* 7AF30 0017AE30 D89082AF */  sw         $2, -0x6F28($gp)
/* 7AF34 0017AE34 CC01023C */  lui        $2, %hi(GamePad)
/* 7AF38 0017AE38 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 7AF3C 0017AE3C 3CAE040C */  jal        AutoRepeatOff__8CGamePadFv
/* 7AF40 0017AE40 00000000 */   nop
/* 7AF44 0017AE44 3001A427 */  addiu      $4, $sp, 0x130
/* 7AF48 0017AE48 48FF050C */  jal        CheckEditToWalk__FPf
/* 7AF4C 0017AE4C 00000000 */   nop
/* 7AF50 0017AE50 59004010 */  beqz       $2, .L0017AFB8
/* 7AF54 0017AE54 00000000 */   nop
/* 7AF58 0017AE58 01000224 */  addiu      $2, $0, 0x1
/* 7AF5C 0017AE5C 608782AF */  sw         $2, -0x78A0($gp)
/* 7AF60 0017AE60 6487848F */  lw         $4, -0x789C($gp)
/* 7AF64 0017AE64 3001A527 */  addiu      $5, $sp, 0x130
/* 7AF68 0017AE68 A000998C */  lw         $25, 0xA0($4)
/* 7AF6C 0017AE6C 1400398F */  lw         $25, 0x14($25)
/* 7AF70 0017AE70 09F82003 */  jalr       $25
/* 7AF74 0017AE74 00000000 */   nop
/* 7AF78 0017AE78 D301023C */  lui        $2, %hi(EditCamera)
/* 7AF7C 0017AE7C 40484424 */  addiu      $4, $2, %lo(EditCamera)
/* 7AF80 0017AE80 D092040C */  jal        GetAngle__13CCameraFollowFv
/* 7AF84 0017AE84 00000000 */   nop
/* 7AF88 0017AE88 D301023C */  lui        $2, %hi(MainCamera)
/* 7AF8C 0017AE8C 40454424 */  addiu      $4, $2, %lo(MainCamera)
/* 7AF90 0017AE90 06030046 */  mov.s      $f12, $f0
/* 7AF94 0017AE94 CC92040C */  jal        SetAngleSoon__13CCameraFollowFf
/* 7AF98 0017AE98 00000000 */   nop
/* 7AF9C 0017AE9C D301023C */  lui        $2, %hi(EditCamera)
/* 7AFA0 0017AEA0 40484424 */  addiu      $4, $2, %lo(EditCamera)
/* 7AFA4 0017AEA4 3001A527 */  addiu      $5, $sp, 0x130
/* 7AFA8 0017AEA8 9C91040C */  jal        GetPos__7CCameraFPf
/* 7AFAC 0017AEAC 00000000 */   nop
/* 7AFB0 0017AEB0 D301023C */  lui        $2, %hi(MainCamera)
/* 7AFB4 0017AEB4 40454424 */  addiu      $4, $2, %lo(MainCamera)
/* 7AFB8 0017AEB8 3001A527 */  addiu      $5, $sp, 0x130
/* 7AFBC 0017AEBC A490040C */  jal        SetPos__7CCameraFPf
/* 7AFC0 0017AEC0 00000000 */   nop
/* 7AFC4 0017AEC4 D301023C */  lui        $2, %hi(EditCamera)
/* 7AFC8 0017AEC8 40484424 */  addiu      $4, $2, %lo(EditCamera)
/* 7AFCC 0017AECC 3001A527 */  addiu      $5, $sp, 0x130
/* 7AFD0 0017AED0 A891040C */  jal        GetRef__7CCameraFPf
/* 7AFD4 0017AED4 00000000 */   nop
/* 7AFD8 0017AED8 D301023C */  lui        $2, %hi(MainCamera)
/* 7AFDC 0017AEDC 40454424 */  addiu      $4, $2, %lo(MainCamera)
/* 7AFE0 0017AEE0 3001A527 */  addiu      $5, $sp, 0x130
/* 7AFE4 0017AEE4 C490040C */  jal        SetRef__7CCameraFPf
/* 7AFE8 0017AEE8 00000000 */   nop
/* 7AFEC 0017AEEC 28860070 */  paddub     $16, $0, $0
/* 7AFF0 0017AEF0 1C8D848F */  lw         $4, -0x72E4($gp)
/* 7AFF4 0017AEF4 288D858F */  lw         $5, -0x72D8($gp)
/* 7AFF8 0017AEF8 EC5F050C */  jal        GetGrdData__9CSaveDataFi
/* 7AFFC 0017AEFC 00000000 */   nop
/* 7B000 0017AF00 1B004010 */  beqz       $2, .L0017AF70
/* 7B004 0017AF04 00000000 */   nop
/* 7B008 0017AF08 6400428C */  lw         $2, 0x64($2)
/* 7B00C 0017AF0C 18004014 */  bnez       $2, .L0017AF70
/* 7B010 0017AF10 00000000 */   nop
/* 7B014 0017AF14 28260070 */  paddub     $4, $0, $0
/* 7B018 0017AF18 0A000010 */  b          .L0017AF44
/* 7B01C 0017AF1C 00000000 */   nop
.L0017AF20:
/* 7B020 0017AF20 80180400 */  sll        $3, $4, 2
/* 7B024 0017AF24 D201023C */  lui        $2, %hi(D_1D19BF4)
/* 7B028 0017AF28 F49B4224 */  addiu      $2, $2, %lo(D_1D19BF4)
/* 7B02C 0017AF2C 21104300 */  addu       $2, $2, $3
/* 7B030 0017AF30 0000428C */  lw         $2, 0x0($2)
/* 7B034 0017AF34 02004010 */  beqz       $2, .L0017AF40
/* 7B038 0017AF38 00000000 */   nop
/* 7B03C 0017AF3C 01001026 */  addiu      $16, $16, 0x1
.L0017AF40:
/* 7B040 0017AF40 01008424 */  addiu      $4, $4, 0x1
.L0017AF44:
/* 7B044 0017AF44 18008228 */  slti       $2, $4, 0x18
/* 7B048 0017AF48 F5FF4014 */  bnez       $2, .L0017AF20
/* 7B04C 0017AF4C 00000000 */   nop
/* 7B050 0017AF50 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 7B054 0017AF54 F09B228C */  lw         $2, -0x6410($at)
/* 7B058 0017AF58 05000216 */  bne        $16, $2, .L0017AF70
/* 7B05C 0017AF5C 00000000 */   nop
/* 7B060 0017AF60 83000424 */  addiu      $4, $0, 0x83
/* 7B064 0017AF64 09000524 */  addiu      $5, $0, 0x9
/* 7B068 0017AF68 DCDE050C */  jal        FadeOutToEvent__Fii
/* 7B06C 0017AF6C 00000000 */   nop
.L0017AF70:
/* 7B070 0017AF70 288D838F */  lw         $3, -0x72D8($gp)
/* 7B074 0017AF74 01000224 */  addiu      $2, $0, 0x1
/* 7B078 0017AF78 0F006214 */  bne        $3, $2, .L0017AFB8
/* 7B07C 0017AF7C 00000000 */   nop
/* 7B080 0017AF80 1C8D848F */  lw         $4, -0x72E4($gp)
/* 7B084 0017AF84 14000524 */  addiu      $5, $0, 0x14
/* 7B088 0017AF88 8060050C */  jal        GetGameFlag__9CSaveDataFi
/* 7B08C 0017AF8C 00000000 */   nop
/* 7B090 0017AF90 09004014 */  bnez       $2, .L0017AFB8
/* 7B094 0017AF94 00000000 */   nop
/* 7B098 0017AF98 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 7B09C 0017AF9C 349C228C */  lw         $2, -0x63CC($at)
/* 7B0A0 0017AFA0 05004010 */  beqz       $2, .L0017AFB8
/* 7B0A4 0017AFA4 00000000 */   nop
/* 7B0A8 0017AFA8 0B000424 */  addiu      $4, $0, 0xB
/* 7B0AC 0017AFAC 0A000524 */  addiu      $5, $0, 0xA
/* 7B0B0 0017AFB0 DCDE050C */  jal        FadeOutToEvent__Fii
/* 7B0B4 0017AFB4 00000000 */   nop
.L0017AFB8:
/* 7B0B8 0017AFB8 D201023C */  lui        $2, %hi(EdVillager)
/* 7B0BC 0017AFBC 905B4424 */  addiu      $4, $2, %lo(EdVillager)
/* 7B0C0 0017AFC0 D301023C */  lui        $2, %hi(EdVillagerInfo)
/* 7B0C4 0017AFC4 D0294524 */  addiu      $5, $2, %lo(EdVillagerInfo)
/* 7B0C8 0017AFC8 E890868F */  lw         $6, -0x6F18($gp)
/* 7B0CC 0017AFCC 3001A727 */  addiu      $7, $sp, 0x130
/* 7B0D0 0017AFD0 4419060C */  jal        EdInitVilagerPosition__FP12CNPCharacterP13VILLAGER_INFOP11CEditGroundPA4_f
/* 7B0D4 0017AFD4 00000000 */   nop
.L0017AFD8:
/* 7B0D8 0017AFD8 D890828F */  lw         $2, -0x6F28($gp)
/* 7B0DC 0017AFDC 09004018 */  blez       $2, .L0017B004
/* 7B0E0 0017AFE0 00000000 */   nop
/* 7B0E4 0017AFE4 2041023C */  lui        $2, (0x41200000 >> 16)
/* 7B0E8 0017AFE8 00608244 */  mtc1       $2, $f12
/* 7B0EC 0017AFEC D301023C */  lui        $2, %hi(EditCamera)
/* 7B0F0 0017AFF0 40484424 */  addiu      $4, $2, %lo(EditCamera)
/* 7B0F4 0017AFF4 9491040C */  jal        SetSpeed__7CCameraFf
/* 7B0F8 0017AFF8 00000000 */   nop
/* 7B0FC 0017AFFC 07000010 */  b          .L0017B01C
/* 7B100 0017B000 00000000 */   nop
.L0017B004:
/* 7B104 0017B004 0041023C */  lui        $2, (0x41000000 >> 16)
/* 7B108 0017B008 00608244 */  mtc1       $2, $f12
/* 7B10C 0017B00C D301023C */  lui        $2, %hi(EditCamera)
/* 7B110 0017B010 40484424 */  addiu      $4, $2, %lo(EditCamera)
/* 7B114 0017B014 9491040C */  jal        SetSpeed__7CCameraFf
/* 7B118 0017B018 00000000 */   nop
.L0017B01C:
/* 7B11C 0017B01C D890828F */  lw         $2, -0x6F28($gp)
/* 7B120 0017B020 02004104 */  bgez       $2, .L0017B02C
/* 7B124 0017B024 00000000 */   nop
/* 7B128 0017B028 D89080AF */  sw         $0, -0x6F28($gp)
.L0017B02C:
/* 7B12C 0017B02C D890828F */  lw         $2, -0x6F28($gp)
/* 7B130 0017B030 FFFF4224 */  addiu      $2, $2, -0x1
/* 7B134 0017B034 D89082AF */  sw         $2, -0x6F28($gp)
/* 7B138 0017B038 6087838F */  lw         $3, -0x78A0($gp)
/* 7B13C 0017B03C 05000224 */  addiu      $2, $0, 0x5
/* 7B140 0017B040 04006210 */  beq        $3, $2, .L0017B054
/* 7B144 0017B044 00000000 */   nop
/* 7B148 0017B048 07000224 */  addiu      $2, $0, 0x7
/* 7B14C 0017B04C 0F006214 */  bne        $3, $2, .L0017B08C
/* 7B150 0017B050 00000000 */   nop
.L0017B054:
/* 7B154 0017B054 C701023C */  lui        $2, %hi(TexManager)
/* 7B158 0017B058 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 7B15C 0017B05C 2A00023C */  lui        $2, %hi(_1610)
/* 7B160 0017B060 E0AA4524 */  addiu      $5, $2, %lo(_1610)
/* 7B164 0017B064 FFFF0624 */  addiu      $6, $0, -0x1
/* 7B168 0017B068 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 7B16C 0017B06C 00000000 */   nop
/* 7B170 0017B070 0091848F */  lw         $4, -0x6F00($gp)
/* 7B174 0017B074 282E4070 */  paddub     $5, $2, $0
/* 7B178 0017B078 4CCB050C */  jal        EdInitModeFinish__FP7CCameraP8CTexture
/* 7B17C 0017B07C 00000000 */   nop
/* 7B180 0017B080 02004010 */  beqz       $2, .L0017B08C
/* 7B184 0017B084 00000000 */   nop
/* 7B188 0017B088 608782AF */  sw         $2, -0x78A0($gp)
.L0017B08C:
/* 7B18C 0017B08C 9CCF050C */  jal        EdSaveFrameImageTask__Fv
/* 7B190 0017B090 00000000 */   nop
/* 7B194 0017B094 6087838F */  lw         $3, -0x78A0($gp)
/* 7B198 0017B098 04000224 */  addiu      $2, $0, 0x4
/* 7B19C 0017B09C 1C006214 */  bne        $3, $2, .L0017B110
/* 7B1A0 0017B0A0 00000000 */   nop
/* 7B1A4 0017B0A4 B4C6050C */  jal        EdStopSoundSrc__Fv
/* 7B1A8 0017B0A8 00000000 */   nop
/* 7B1AC 0017B0AC 10000424 */  addiu      $4, $0, 0x10
/* 7B1B0 0017B0B0 02000524 */  addiu      $5, $0, 0x2
/* 7B1B4 0017B0B4 64A6050C */  jal        EdPadDown__Fii
/* 7B1B8 0017B0B8 00000000 */   nop
/* 7B1BC 0017B0BC 07004014 */  bnez       $2, .L0017B0DC
/* 7B1C0 0017B0C0 00000000 */   nop
/* 7B1C4 0017B0C4 20000424 */  addiu      $4, $0, 0x20
/* 7B1C8 0017B0C8 02000524 */  addiu      $5, $0, 0x2
/* 7B1CC 0017B0CC 64A6050C */  jal        EdPadDown__Fii
/* 7B1D0 0017B0D0 00000000 */   nop
/* 7B1D4 0017B0D4 0E004010 */  beqz       $2, .L0017B110
/* 7B1D8 0017B0D8 00000000 */   nop
.L0017B0DC:
/* 7B1DC 0017B0DC 01000424 */  addiu      $4, $0, 0x1
/* 7B1E0 0017B0E0 34CB050C */  jal        EdInitMenu__Fi
/* 7B1E4 0017B0E4 00000000 */   nop
/* 7B1E8 0017B0E8 09004010 */  beqz       $2, .L0017B110
/* 7B1EC 0017B0EC 00000000 */   nop
/* 7B1F0 0017B0F0 FFFF0524 */  addiu      $5, $0, -0x1
/* 7B1F4 0017B0F4 6C8785AF */  sw         $5, -0x7894($gp)
/* 7B1F8 0017B0F8 05000224 */  addiu      $2, $0, 0x5
/* 7B1FC 0017B0FC 608782AF */  sw         $2, -0x78A0($gp)
/* 7B200 0017B100 01000424 */  addiu      $4, $0, 0x1
/* 7B204 0017B104 28360070 */  paddub     $6, $0, $0
/* 7B208 0017B108 AC69050C */  jal        SndSePlay__Fiii
/* 7B20C 0017B10C 00000000 */   nop
.L0017B110:
/* 7B210 0017B110 6087828F */  lw         $2, -0x78A0($gp)
/* 7B214 0017B114 01000524 */  addiu      $5, $0, 0x1
/* 7B218 0017B118 31004514 */  bne        $2, $5, .L0017B1E0
/* 7B21C 0017B11C 00000000 */   nop
/* 7B220 0017B120 10000424 */  addiu      $4, $0, 0x10
/* 7B224 0017B124 64A6050C */  jal        EdPadDown__Fii
/* 7B228 0017B128 00000000 */   nop
/* 7B22C 0017B12C 0C004014 */  bnez       $2, .L0017B160
/* 7B230 0017B130 00000000 */   nop
/* 7B234 0017B134 9890828F */  lw         $2, -0x6F68($gp)
/* 7B238 0017B138 09004014 */  bnez       $2, .L0017B160
/* 7B23C 0017B13C 00000000 */   nop
/* 7B240 0017B140 4480050C */  jal        SystemMesCheck__Fv
/* 7B244 0017B144 00000000 */   nop
/* 7B248 0017B148 25004014 */  bnez       $2, .L0017B1E0
/* 7B24C 0017B14C 00000000 */   nop
/* 7B250 0017B150 84CC050C */  jal        EdCheckItemOver__Fv
/* 7B254 0017B154 00000000 */   nop
/* 7B258 0017B158 21004010 */  beqz       $2, .L0017B1E0
/* 7B25C 0017B15C 00000000 */   nop
.L0017B160:
/* 7B260 0017B160 02000424 */  addiu      $4, $0, 0x2
/* 7B264 0017B164 9890828F */  lw         $2, -0x6F68($gp)
/* 7B268 0017B168 03004010 */  beqz       $2, .L0017B178
/* 7B26C 0017B16C 00000000 */   nop
/* 7B270 0017B170 28264070 */  paddub     $4, $2, $0
/* 7B274 0017B174 989080AF */  sw         $0, -0x6F68($gp)
.L0017B178:
/* 7B278 0017B178 34CB050C */  jal        EdInitMenu__Fi
/* 7B27C 0017B17C 00000000 */   nop
/* 7B280 0017B180 17004010 */  beqz       $2, .L0017B1E0
/* 7B284 0017B184 00000000 */   nop
/* 7B288 0017B188 84CC050C */  jal        EdCheckItemOver__Fv
/* 7B28C 0017B18C 00000000 */   nop
/* 7B290 0017B190 0C004010 */  beqz       $2, .L0017B1C4
/* 7B294 0017B194 00000000 */   nop
/* 7B298 0017B198 9090828F */  lw         $2, -0x6F70($gp)
/* 7B29C 0017B19C 0B004128 */  slti       $at, $2, 0xB
/* 7B2A0 0017B1A0 0D002014 */  bnez       $at, .L0017B1D8
/* 7B2A4 0017B1A4 00000000 */   nop
/* 7B2A8 0017B1A8 01000424 */  addiu      $4, $0, 0x1
/* 7B2AC 0017B1AC FFFF0524 */  addiu      $5, $0, -0x1
/* 7B2B0 0017B1B0 28360070 */  paddub     $6, $0, $0
/* 7B2B4 0017B1B4 AC69050C */  jal        SndSePlay__Fiii
/* 7B2B8 0017B1B8 00000000 */   nop
/* 7B2BC 0017B1BC 06000010 */  b          .L0017B1D8
/* 7B2C0 0017B1C0 00000000 */   nop
.L0017B1C4:
/* 7B2C4 0017B1C4 01000424 */  addiu      $4, $0, 0x1
/* 7B2C8 0017B1C8 FFFF0524 */  addiu      $5, $0, -0x1
/* 7B2CC 0017B1CC 28360070 */  paddub     $6, $0, $0
/* 7B2D0 0017B1D0 AC69050C */  jal        SndSePlay__Fiii
/* 7B2D4 0017B1D4 00000000 */   nop
.L0017B1D8:
/* 7B2D8 0017B1D8 07000224 */  addiu      $2, $0, 0x7
/* 7B2DC 0017B1DC 608782AF */  sw         $2, -0x78A0($gp)
.L0017B1E0:
/* 7B2E0 0017B1E0 8C918283 */  lb         $2, -0x6E74($gp)
/* 7B2E4 0017B1E4 04004014 */  bnez       $2, .L0017B1F8
/* 7B2E8 0017B1E8 00000000 */   nop
/* 7B2EC 0017B1EC 889180AF */  sw         $0, -0x6E78($gp)
/* 7B2F0 0017B1F0 01000224 */  addiu      $2, $0, 0x1
/* 7B2F4 0017B1F4 8C9182A3 */  sb         $2, -0x6E74($gp)
.L0017B1F8:
/* 7B2F8 0017B1F8 6087838F */  lw         $3, -0x78A0($gp)
/* 7B2FC 0017B1FC 06000224 */  addiu      $2, $0, 0x6
/* 7B300 0017B200 4D006210 */  beq        $3, $2, .L0017B338
/* 7B304 0017B204 00000000 */   nop
/* 7B308 0017B208 04000224 */  addiu      $2, $0, 0x4
/* 7B30C 0017B20C 4A006210 */  beq        $3, $2, .L0017B338
/* 7B310 0017B210 00000000 */   nop
/* 7B314 0017B214 9090828F */  lw         $2, -0x6F70($gp)
/* 7B318 0017B218 0B004128 */  slti       $at, $2, 0xB
/* 7B31C 0017B21C 46002014 */  bnez       $at, .L0017B338
/* 7B320 0017B220 00000000 */   nop
/* 7B324 0017B224 0091848F */  lw         $4, -0x6F00($gp)
/* 7B328 0017B228 4001A527 */  addiu      $5, $sp, 0x140
/* 7B32C 0017B22C 9C91040C */  jal        GetPos__7CCameraFPf
/* 7B330 0017B230 00000000 */   nop
/* 7B334 0017B234 0091848F */  lw         $4, -0x6F00($gp)
/* 7B338 0017B238 5001A527 */  addiu      $5, $sp, 0x150
/* 7B33C 0017B23C E890040C */  jal        GetDir__7CCameraFPf
/* 7B340 0017B240 00000000 */   nop
/* 7B344 0017B244 4001A2C7 */  lwc1       $f2, 0x140($sp)
/* 7B348 0017B248 26020224 */  addiu      $2, $0, 0x226
/* 7B34C 0017B24C 00008244 */  mtc1       $2, $f0
/* 7B350 0017B250 00000000 */  nop
/* 7B354 0017B254 60008046 */  cvt.s.w    $f1, $f0
/* 7B358 0017B258 01100146 */  sub.s      $f0, $f2, $f1
/* 7B35C 0017B25C 7001A0E7 */  swc1       $f0, 0x170($sp)
/* 7B360 0017B260 4401A3C7 */  lwc1       $f3, 0x144($sp)
/* 7B364 0017B264 01180146 */  sub.s      $f0, $f3, $f1
/* 7B368 0017B268 7401A0E7 */  swc1       $f0, 0x174($sp)
/* 7B36C 0017B26C 4801A4C7 */  lwc1       $f4, 0x148($sp)
/* 7B370 0017B270 01200146 */  sub.s      $f0, $f4, $f1
/* 7B374 0017B274 7801A0E7 */  swc1       $f0, 0x178($sp)
/* 7B378 0017B278 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 7B37C 0017B27C 7C01A2AF */  sw         $2, 0x17C($sp)
/* 7B380 0017B280 00080246 */  add.s      $f0, $f1, $f2
/* 7B384 0017B284 6001A0E7 */  swc1       $f0, 0x160($sp)
/* 7B388 0017B288 00080346 */  add.s      $f0, $f1, $f3
/* 7B38C 0017B28C 6401A0E7 */  swc1       $f0, 0x164($sp)
/* 7B390 0017B290 00080446 */  add.s      $f0, $f1, $f4
/* 7B394 0017B294 6801A0E7 */  swc1       $f0, 0x168($sp)
/* 7B398 0017B298 6C01A2AF */  sw         $2, 0x16C($sp)
/* 7B39C 0017B29C E890848F */  lw         $4, -0x6F18($gp)
/* 7B3A0 0017B2A0 8001A527 */  addiu      $5, $sp, 0x180
/* 7B3A4 0017B2A4 40000624 */  addiu      $6, $0, 0x40
/* 7B3A8 0017B2A8 6001A727 */  addiu      $7, $sp, 0x160
/* 7B3AC 0017B2AC 28460070 */  paddub     $8, $0, $0
/* 7B3B0 0017B2B0 A48A060C */  jal        GetNearParts__11CEditGroundFPP9CMapPartsiP7CBoxVu0P7CBoxVu0
/* 7B3B4 0017B2B4 00000000 */   nop
/* 7B3B8 0017B2B8 282E0070 */  paddub     $5, $0, $0
/* 7B3BC 0017B2BC 11000010 */  b          .L0017B304
/* 7B3C0 0017B2C0 00000000 */   nop
.L0017B2C4:
/* 7B3C4 0017B2C4 80180500 */  sll        $3, $5, 2
/* 7B3C8 0017B2C8 21187D00 */  addu       $3, $3, $sp
/* 7B3CC 0017B2CC 80016624 */  addiu      $6, $3, 0x180
/* 7B3D0 0017B2D0 0000C38C */  lw         $3, 0x0($6)
/* 7B3D4 0017B2D4 1801648C */  lw         $4, 0x118($3)
/* 7B3D8 0017B2D8 02000324 */  addiu      $3, $0, 0x2
/* 7B3DC 0017B2DC 08008314 */  bne        $4, $3, .L0017B300
/* 7B3E0 0017B2E0 00000000 */   nop
/* 7B3E4 0017B2E4 E890838F */  lw         $3, -0x6F18($gp)
/* 7B3E8 0017B2E8 0200013C */  lui        $at, (0x2095C >> 16)
/* 7B3EC 0017B2EC 21086100 */  addu       $at, $3, $at
/* 7B3F0 0017B2F0 5C09238C */  lw         $3, (0x2095C & 0xFFFF)($at)
/* 7B3F4 0017B2F4 02006010 */  beqz       $3, .L0017B300
/* 7B3F8 0017B2F8 00000000 */   nop
/* 7B3FC 0017B2FC 0000C0AC */  sw         $0, 0x0($6)
.L0017B300:
/* 7B400 0017B300 0100A524 */  addiu      $5, $5, 0x1
.L0017B304:
/* 7B404 0017B304 2A18A200 */  slt        $3, $5, $2
/* 7B408 0017B308 EEFF6014 */  bnez       $3, .L0017B2C4
/* 7B40C 0017B30C 00000000 */   nop
/* 7B410 0017B310 A090838F */  lw         $3, -0x6F60($gp)
/* 7B414 0017B314 0800601C */  bgtz       $3, .L0017B338
/* 7B418 0017B318 00000000 */   nop
/* 7B41C 0017B31C 04918CC7 */  lwc1       $f12, -0x6EFC($gp)
/* 7B420 0017B320 8001A427 */  addiu      $4, $sp, 0x180
/* 7B424 0017B324 282E4070 */  paddub     $5, $2, $0
/* 7B428 0017B328 4001A627 */  addiu      $6, $sp, 0x140
/* 7B42C 0017B32C 5001A727 */  addiu      $7, $sp, 0x150
/* 7B430 0017B330 48C7050C */  jal        EdSetSoundSrcVol__FfPP9CMapPartsiPfPf
/* 7B434 0017B334 00000000 */   nop
.L0017B338:
/* 7B438 0017B338 B090828F */  lw         $2, -0x6F50($gp)
/* 7B43C 0017B33C 0B004010 */  beqz       $2, .L0017B36C
/* 7B440 0017B340 00000000 */   nop
/* 7B444 0017B344 D890828F */  lw         $2, -0x6F28($gp)
/* 7B448 0017B348 0800401C */  bgtz       $2, .L0017B36C
/* 7B44C 0017B34C 00000000 */   nop
/* 7B450 0017B350 84000424 */  addiu      $4, $0, 0x84
/* 7B454 0017B354 0091858F */  lw         $5, -0x6F00($gp)
/* 7B458 0017B358 7CDE050C */  jal        RunEvent__FiP7CCamera
/* 7B45C 0017B35C 00000000 */   nop
/* 7B460 0017B360 02004010 */  beqz       $2, .L0017B36C
/* 7B464 0017B364 00000000 */   nop
/* 7B468 0017B368 B09080AF */  sw         $0, -0x6F50($gp)
.L0017B36C:
/* 7B46C 0017B36C 94918283 */  lb         $2, -0x6E6C($gp)
/* 7B470 0017B370 04004014 */  bnez       $2, .L0017B384
/* 7B474 0017B374 00000000 */   nop
/* 7B478 0017B378 909180AF */  sw         $0, -0x6E70($gp)
/* 7B47C 0017B37C 01000224 */  addiu      $2, $0, 0x1
/* 7B480 0017B380 949182A3 */  sb         $2, -0x6E6C($gp)
.L0017B384:
/* 7B484 0017B384 CC01023C */  lui        $2, %hi(GamePad)
/* 7B488 0017B388 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 7B48C 0017B38C 80000524 */  addiu      $5, $0, 0x80
/* 7B490 0017B390 2CAE040C */  jal        Down2__8CGamePadFi
/* 7B494 0017B394 00000000 */   nop
/* 7B498 0017B398 06004010 */  beqz       $2, .L0017B3B4
/* 7B49C 0017B39C 00000000 */   nop
/* 7B4A0 0017B3A0 04000224 */  addiu      $2, $0, 0x4
/* 7B4A4 0017B3A4 909182AF */  sw         $2, -0x6E70($gp)
/* 7B4A8 0017B3A8 045E060C */  jal        EdEventAllClear__Fv
/* 7B4AC 0017B3AC 00000000 */   nop
/* 7B4B0 0017B3B0 149280AF */  sw         $0, -0x6DEC($gp)
.L0017B3B4:
/* 7B4B4 0017B3B4 9091828F */  lw         $2, -0x6E70($gp)
/* 7B4B8 0017B3B8 FFFF4224 */  addiu      $2, $2, -0x1
/* 7B4BC 0017B3BC 909182AF */  sw         $2, -0x6E70($gp)
/* 7B4C0 0017B3C0 9091828F */  lw         $2, -0x6E70($gp)
/* 7B4C4 0017B3C4 02004104 */  bgez       $2, .L0017B3D0
/* 7B4C8 0017B3C8 00000000 */   nop
/* 7B4CC 0017B3CC 909180AF */  sw         $0, -0x6E70($gp)
.L0017B3D0:
/* 7B4D0 0017B3D0 9091838F */  lw         $3, -0x6E70($gp)
/* 7B4D4 0017B3D4 01000224 */  addiu      $2, $0, 0x1
/* 7B4D8 0017B3D8 03006214 */  bne        $3, $2, .L0017B3E8
/* 7B4DC 0017B3DC 00000000 */   nop
/* 7B4E0 0017B3E0 96000224 */  addiu      $2, $0, 0x96
/* 7B4E4 0017B3E4 D09082AF */  sw         $2, -0x6F30($gp)
.L0017B3E8:
/* 7B4E8 0017B3E8 6087838F */  lw         $3, -0x78A0($gp)
/* 7B4EC 0017B3EC 0E000224 */  addiu      $2, $0, 0xE
/* 7B4F0 0017B3F0 11006210 */  beq        $3, $2, .L0017B438
/* 7B4F4 0017B3F4 00000000 */   nop
/* 7B4F8 0017B3F8 6487838F */  lw         $3, -0x789C($gp)
/* 7B4FC 0017B3FC D011628C */  lw         $2, 0x11D0($3)
/* 7B500 0017B400 0D004010 */  beqz       $2, .L0017B438
/* 7B504 0017B404 00000000 */   nop
/* 7B508 0017B408 9090828F */  lw         $2, -0x6F70($gp)
/* 7B50C 0017B40C 0B004128 */  slti       $at, $2, 0xB
/* 7B510 0017B410 09002014 */  bnez       $at, .L0017B438
/* 7B514 0017B414 00000000 */   nop
/* 7B518 0017B418 20126484 */  lh         $4, 0x1220($3)
/* 7B51C 0017B41C 06008018 */  blez       $4, .L0017B438
/* 7B520 0017B420 00000000 */   nop
/* 7B524 0017B424 0091858F */  lw         $5, -0x6F00($gp)
/* 7B528 0017B428 7CDE050C */  jal        RunEvent__FiP7CCamera
/* 7B52C 0017B42C 00000000 */   nop
/* 7B530 0017B430 6487828F */  lw         $2, -0x789C($gp)
/* 7B534 0017B434 201240A4 */  sh         $0, 0x1220($2)
.L0017B438:
/* 7B538 0017B438 3087828F */  lw         $2, -0x78D0($gp)
/* 7B53C 0017B43C 55004010 */  beqz       $2, .L0017B594
/* 7B540 0017B440 00000000 */   nop
/* 7B544 0017B444 D090828F */  lw         $2, -0x6F30($gp)
/* 7B548 0017B448 0400401C */  bgtz       $2, .L0017B45C
/* 7B54C 0017B44C 00000000 */   nop
/* 7B550 0017B450 D490828F */  lw         $2, -0x6F2C($gp)
/* 7B554 0017B454 4F004018 */  blez       $2, .L0017B594
/* 7B558 0017B458 00000000 */   nop
.L0017B45C:
/* 7B55C 0017B45C 0091848F */  lw         $4, -0x6F00($gp)
/* 7B560 0017B460 8003A527 */  addiu      $5, $sp, 0x380
/* 7B564 0017B464 9C91040C */  jal        GetPos__7CCameraFPf
/* 7B568 0017B468 00000000 */   nop
/* 7B56C 0017B46C 0091848F */  lw         $4, -0x6F00($gp)
/* 7B570 0017B470 9003A527 */  addiu      $5, $sp, 0x390
/* 7B574 0017B474 A891040C */  jal        GetRef__7CCameraFPf
/* 7B578 0017B478 00000000 */   nop
/* 7B57C 0017B47C D301023C */  lui        $2, %hi(EventCamera)
/* 7B580 0017B480 40514424 */  addiu      $4, $2, %lo(EventCamera)
/* 7B584 0017B484 C492040C */  jal        FollowOff__13CCameraFollowFv
/* 7B588 0017B488 00000000 */   nop
/* 7B58C 0017B48C D301023C */  lui        $2, %hi(EventCamera)
/* 7B590 0017B490 40514424 */  addiu      $4, $2, %lo(EventCamera)
/* 7B594 0017B494 8003A527 */  addiu      $5, $sp, 0x380
/* 7B598 0017B498 A490040C */  jal        SetPos__7CCameraFPf
/* 7B59C 0017B49C 00000000 */   nop
/* 7B5A0 0017B4A0 D301023C */  lui        $2, %hi(EventCamera)
/* 7B5A4 0017B4A4 40514424 */  addiu      $4, $2, %lo(EventCamera)
/* 7B5A8 0017B4A8 9003A527 */  addiu      $5, $sp, 0x390
/* 7B5AC 0017B4AC C490040C */  jal        SetRef__7CCameraFPf
/* 7B5B0 0017B4B0 00000000 */   nop
/* 7B5B4 0017B4B4 D301023C */  lui        $2, %hi(EventCamera)
/* 7B5B8 0017B4B8 40514424 */  addiu      $4, $2, %lo(EventCamera)
/* 7B5BC 0017B4BC FFFF0524 */  addiu      $5, $0, -0x1
/* 7B5C0 0017B4C0 F491040C */  jal        Step__13CCameraFollowFi
/* 7B5C4 0017B4C4 00000000 */   nop
/* 7B5C8 0017B4C8 D490848F */  lw         $4, -0x6F2C($gp)
/* 7B5CC 0017B4CC 0E008018 */  blez       $4, .L0017B508
/* 7B5D0 0017B4D0 00000000 */   nop
/* 7B5D4 0017B4D4 6890868F */  lw         $6, -0x6F98($gp)
/* 7B5D8 0017B4D8 D201023C */  lui        $2, %hi(EdWorkBuffer)
/* 7B5DC 0017B4DC C0B34524 */  addiu      $5, $2, %lo(EdWorkBuffer)
/* 7B5E0 0017B4E0 EC5C060C */  jal        EdEventInit__FiP14CDataAlloc2_1_Pc
/* 7B5E4 0017B4E4 00000000 */   nop
/* 7B5E8 0017B4E8 25004010 */  beqz       $2, .L0017B580
/* 7B5EC 0017B4EC 00000000 */   nop
/* 7B5F0 0017B4F0 74E0050C */  jal        EdInitMesParam__Fv
/* 7B5F4 0017B4F4 00000000 */   nop
/* 7B5F8 0017B4F8 0E000224 */  addiu      $2, $0, 0xE
/* 7B5FC 0017B4FC 608782AF */  sw         $2, -0x78A0($gp)
/* 7B600 0017B500 1F000010 */  b          .L0017B580
/* 7B604 0017B504 00000000 */   nop
.L0017B508:
/* 7B608 0017B508 6490868F */  lw         $6, -0x6F9C($gp)
/* 7B60C 0017B50C D090848F */  lw         $4, -0x6F30($gp)
/* 7B610 0017B510 D201023C */  lui        $2, %hi(EdWorkBuffer)
/* 7B614 0017B514 C0B34524 */  addiu      $5, $2, %lo(EdWorkBuffer)
/* 7B618 0017B518 EC5C060C */  jal        EdEventInit__FiP14CDataAlloc2_1_Pc
/* 7B61C 0017B51C 00000000 */   nop
/* 7B620 0017B520 09004010 */  beqz       $2, .L0017B548
/* 7B624 0017B524 00000000 */   nop
/* 7B628 0017B528 74E0050C */  jal        EdInitMesParam__Fv
/* 7B62C 0017B52C 00000000 */   nop
/* 7B630 0017B530 0E000224 */  addiu      $2, $0, 0xE
/* 7B634 0017B534 608782AF */  sw         $2, -0x78A0($gp)
/* 7B638 0017B538 DB01023C */  lui        $2, %hi(ItemVolumeStep)
/* 7B63C 0017B53C 10BC4424 */  addiu      $4, $2, %lo(ItemVolumeStep)
/* 7B640 0017B540 C8D5080C */  jal        CheckItemVolume__13CMenuItemStepFv
/* 7B644 0017B544 00000000 */   nop
.L0017B548:
/* 7B648 0017B548 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 7B64C 0017B54C 18D6238C */  lw         $3, -0x29E8($at)
/* 7B650 0017B550 09000224 */  addiu      $2, $0, 0x9
/* 7B654 0017B554 0A006214 */  bne        $3, $2, .L0017B580
/* 7B658 0017B558 00000000 */   nop
/* 7B65C 0017B55C 74E0050C */  jal        EdInitMesParam__Fv
/* 7B660 0017B560 00000000 */   nop
/* 7B664 0017B564 02000224 */  addiu      $2, $0, 0x2
/* 7B668 0017B568 608782AF */  sw         $2, -0x78A0($gp)
/* 7B66C 0017B56C 149280AF */  sw         $0, -0x6DEC($gp)
/* 7B670 0017B570 DB01023C */  lui        $2, %hi(ItemVolumeStep)
/* 7B674 0017B574 10BC4424 */  addiu      $4, $2, %lo(ItemVolumeStep)
/* 7B678 0017B578 C8D5080C */  jal        CheckItemVolume__13CMenuItemStepFv
/* 7B67C 0017B57C 00000000 */   nop
.L0017B580:
/* 7B680 0017B580 FFFF0224 */  addiu      $2, $0, -0x1
/* 7B684 0017B584 D09082AF */  sw         $2, -0x6F30($gp)
/* 7B688 0017B588 D49082AF */  sw         $2, -0x6F2C($gp)
/* 7B68C 0017B58C 02000010 */  b          .L0017B598
/* 7B690 0017B590 00000000 */   nop
.L0017B594:
/* 7B694 0017B594 149280AF */  sw         $0, -0x6DEC($gp)
.L0017B598:
/* 7B698 0017B598 38E0050C */  jal        PauseOffCheck__Fv
/* 7B69C 0017B59C 00000000 */   nop
/* 7B6A0 0017B5A0 6087828F */  lw         $2, -0x78A0($gp)
/* 7B6A4 0017B5A4 F7FF4224 */  addiu      $2, $2, -0x9
/* 7B6A8 0017B5A8 0200412C */  sltiu      $at, $2, 0x2
/* 7B6AC 0017B5AC 12002010 */  beqz       $at, .L0017B5F8
/* 7B6B0 0017B5B0 00000000 */   nop
/* 7B6B4 0017B5B4 00080424 */  addiu      $4, $0, 0x800
/* 7B6B8 0017B5B8 FFFF0534 */  ori        $5, $0, 0xFFFF
/* 7B6BC 0017B5BC 64A6050C */  jal        EdPadDown__Fii
/* 7B6C0 0017B5C0 00000000 */   nop
/* 7B6C4 0017B5C4 0C004010 */  beqz       $2, .L0017B5F8
/* 7B6C8 0017B5C8 00000000 */   nop
/* 7B6CC 0017B5CC 9891828F */  lw         $2, -0x6E68($gp)
/* 7B6D0 0017B5D0 608782AF */  sw         $2, -0x78A0($gp)
/* 7B6D4 0017B5D4 02000424 */  addiu      $4, $0, 0x2
/* 7B6D8 0017B5D8 FFFF0524 */  addiu      $5, $0, -0x1
/* 7B6DC 0017B5DC 4428060C */  jal        EdSePlay__F11ED_SOUND_IDi
/* 7B6E0 0017B5E0 00000000 */   nop
/* 7B6E4 0017B5E4 01000424 */  addiu      $4, $0, 0x1
/* 7B6E8 0017B5E8 C803050C */  jal        PlayTimeCountFlag__Fi
/* 7B6EC 0017B5EC 00000000 */   nop
/* 7B6F0 0017B5F0 24000010 */  b          .L0017B684
/* 7B6F4 0017B5F4 00000000 */   nop
.L0017B5F8:
/* 7B6F8 0017B5F8 9C90828F */  lw         $2, -0x6F64($gp)
/* 7B6FC 0017B5FC 21004010 */  beqz       $2, .L0017B684
/* 7B700 0017B600 00000000 */   nop
/* 7B704 0017B604 6087838F */  lw         $3, -0x78A0($gp)
/* 7B708 0017B608 01000424 */  addiu      $4, $0, 0x1
/* 7B70C 0017B60C 04006410 */  beq        $3, $4, .L0017B620
/* 7B710 0017B610 00000000 */   nop
/* 7B714 0017B614 10000224 */  addiu      $2, $0, 0x10
/* 7B718 0017B618 0E006214 */  bne        $3, $2, .L0017B654
/* 7B71C 0017B61C 00000000 */   nop
.L0017B620:
/* 7B720 0017B620 989183AF */  sw         $3, -0x6E68($gp)
/* 7B724 0017B624 E49083AF */  sw         $3, -0x6F1C($gp)
/* 7B728 0017B628 09000224 */  addiu      $2, $0, 0x9
/* 7B72C 0017B62C 608782AF */  sw         $2, -0x78A0($gp)
/* 7B730 0017B630 01000424 */  addiu      $4, $0, 0x1
/* 7B734 0017B634 FFFF0524 */  addiu      $5, $0, -0x1
/* 7B738 0017B638 4428060C */  jal        EdSePlay__F11ED_SOUND_IDi
/* 7B73C 0017B63C 00000000 */   nop
/* 7B740 0017B640 28260070 */  paddub     $4, $0, $0
/* 7B744 0017B644 C803050C */  jal        PlayTimeCountFlag__Fi
/* 7B748 0017B648 00000000 */   nop
/* 7B74C 0017B64C 0D000010 */  b          .L0017B684
/* 7B750 0017B650 00000000 */   nop
.L0017B654:
/* 7B754 0017B654 04000224 */  addiu      $2, $0, 0x4
/* 7B758 0017B658 0A006214 */  bne        $3, $2, .L0017B684
/* 7B75C 0017B65C 00000000 */   nop
/* 7B760 0017B660 989183AF */  sw         $3, -0x6E68($gp)
/* 7B764 0017B664 0A000224 */  addiu      $2, $0, 0xA
/* 7B768 0017B668 608782AF */  sw         $2, -0x78A0($gp)
/* 7B76C 0017B66C FFFF0524 */  addiu      $5, $0, -0x1
/* 7B770 0017B670 4428060C */  jal        EdSePlay__F11ED_SOUND_IDi
/* 7B774 0017B674 00000000 */   nop
/* 7B778 0017B678 28260070 */  paddub     $4, $0, $0
/* 7B77C 0017B67C C803050C */  jal        PlayTimeCountFlag__Fi
/* 7B780 0017B680 00000000 */   nop
.L0017B684:
/* 7B784 0017B684 9C9080AF */  sw         $0, -0x6F64($gp)
/* 7B788 0017B688 A0918283 */  lb         $2, -0x6E60($gp)
/* 7B78C 0017B68C 04004014 */  bnez       $2, .L0017B6A0
/* 7B790 0017B690 00000000 */   nop
/* 7B794 0017B694 9C9180AF */  sw         $0, -0x6E64($gp)
/* 7B798 0017B698 01000224 */  addiu      $2, $0, 0x1
/* 7B79C 0017B69C A09182A3 */  sb         $2, -0x6E60($gp)
.L0017B6A0:
/* 7B7A0 0017B6A0 8890828F */  lw         $2, -0x6F78($gp)
/* 7B7A4 0017B6A4 0D004010 */  beqz       $2, .L0017B6DC
/* 7B7A8 0017B6A8 00000000 */   nop
/* 7B7AC 0017B6AC 2091828F */  lw         $2, -0x6EE0($gp)
/* 7B7B0 0017B6B0 0A004014 */  bnez       $2, .L0017B6DC
/* 7B7B4 0017B6B4 00000000 */   nop
/* 7B7B8 0017B6B8 2090828F */  lw         $2, -0x6FE0($gp)
/* 7B7BC 0017B6BC 248D82AF */  sw         $2, -0x72DC($gp)
/* 7B7C0 0017B6C0 C8004424 */  addiu      $4, $2, 0xC8
/* 7B7C4 0017B6C4 FFFF0524 */  addiu      $5, $0, -0x1
/* 7B7C8 0017B6C8 4C07050C */  jal        MapJump__Fii
/* 7B7CC 0017B6CC 00000000 */   nop
/* 7B7D0 0017B6D0 01000224 */  addiu      $2, $0, 0x1
/* 7B7D4 0017B6D4 209182AF */  sw         $2, -0x6EE0($gp)
/* 7B7D8 0017B6D8 9C9182AF */  sw         $2, -0x6E64($gp)
.L0017B6DC:
/* 7B7DC 0017B6DC 949080AF */  sw         $0, -0x6F6C($gp)
/* 7B7E0 0017B6E0 8C90828F */  lw         $2, -0x6F74($gp)
/* 7B7E4 0017B6E4 06004010 */  beqz       $2, .L0017B700
/* 7B7E8 0017B6E8 00000000 */   nop
/* 7B7EC 0017B6EC 50DF050C */  jal        EditExit__Fv
/* 7B7F0 0017B6F0 00000000 */   nop
/* 7B7F4 0017B6F4 01000224 */  addiu      $2, $0, 0x1
/* 7B7F8 0017B6F8 2B000010 */  b          .L0017B7A8
/* 7B7FC 0017B6FC 00000000 */   nop
.L0017B700:
/* 7B800 0017B700 2091838F */  lw         $3, -0x6EE0($gp)
/* 7B804 0017B704 01000224 */  addiu      $2, $0, 0x1
/* 7B808 0017B708 06006214 */  bne        $3, $2, .L0017B724
/* 7B80C 0017B70C 00000000 */   nop
/* 7B810 0017B710 50DF050C */  jal        EditExit__Fv
/* 7B814 0017B714 00000000 */   nop
/* 7B818 0017B718 9C91828F */  lw         $2, -0x6E64($gp)
/* 7B81C 0017B71C 22000010 */  b          .L0017B7A8
/* 7B820 0017B720 00000000 */   nop
.L0017B724:
/* 7B824 0017B724 FFFF6224 */  addiu      $2, $3, -0x1
/* 7B828 0017B728 209182AF */  sw         $2, -0x6EE0($gp)
/* 7B82C 0017B72C 2091828F */  lw         $2, -0x6EE0($gp)
/* 7B830 0017B730 02004104 */  bgez       $2, .L0017B73C
/* 7B834 0017B734 00000000 */   nop
/* 7B838 0017B738 209180AF */  sw         $0, -0x6EE0($gp)
.L0017B73C:
/* 7B83C 0017B73C D464050C */  jal        SndStep__Fv
/* 7B840 0017B740 00000000 */   nop
/* 7B844 0017B744 9090828F */  lw         $2, -0x6F70($gp)
/* 7B848 0017B748 01004224 */  addiu      $2, $2, 0x1
/* 7B84C 0017B74C 909082AF */  sw         $2, -0x6F70($gp)
/* 7B850 0017B750 9490828F */  lw         $2, -0x6F6C($gp)
/* 7B854 0017B754 01004224 */  addiu      $2, $2, 0x1
/* 7B858 0017B758 949082AF */  sw         $2, -0x6F6C($gp)
/* 7B85C 0017B75C A090828F */  lw         $2, -0x6F60($gp)
/* 7B860 0017B760 FFFF4224 */  addiu      $2, $2, -0x1
/* 7B864 0017B764 A09082AF */  sw         $2, -0x6F60($gp)
/* 7B868 0017B768 A090828F */  lw         $2, -0x6F60($gp)
/* 7B86C 0017B76C 02004104 */  bgez       $2, .L0017B778
/* 7B870 0017B770 00000000 */   nop
/* 7B874 0017B774 A09080AF */  sw         $0, -0x6F60($gp)
.L0017B778:
/* 7B878 0017B778 D301013C */  lui        $at, (0x1D32F88 >> 16)
/* 7B87C 0017B77C 882F20AC */  sw         $0, (0x1D32F88 & 0xFFFF)($at)
/* 7B880 0017B780 CC01023C */  lui        $2, %hi(GamePad)
/* 7B884 0017B784 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 7B888 0017B788 20000524 */  addiu      $5, $0, 0x20
/* 7B88C 0017B78C 04AE040C */  jal        On__8CGamePadFi
/* 7B890 0017B790 00000000 */   nop
/* 7B894 0017B794 03004010 */  beqz       $2, .L0017B7A4
/* 7B898 0017B798 00000000 */   nop
/* 7B89C 0017B79C ECE5050C */  jal        cat_end__Fv
/* 7B8A0 0017B7A0 00000000 */   nop
.L0017B7A4:
/* 7B8A4 0017B7A4 28160070 */  paddub     $2, $0, $0
.L0017B7A8:
/* 7B8A8 0017B7A8 4000BF7B */  lq         $31, 0x40($sp)
/* 7B8AC 0017B7AC 3000B27B */  lq         $18, 0x30($sp)
/* 7B8B0 0017B7B0 2000B17B */  lq         $17, 0x20($sp)
/* 7B8B4 0017B7B4 1000B07B */  lq         $16, 0x10($sp)
/* 7B8B8 0017B7B8 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 7B8BC 0017B7BC F003BD27 */  addiu      $sp, $sp, 0x3F0
/* 7B8C0 0017B7C0 0800E003 */  jr         $31
/* 7B8C4 0017B7C4 00000000 */   nop
/* 7B8C8 0017B7C8 00000000 */  nop
/* 7B8CC 0017B7CC 00000000 */  nop
