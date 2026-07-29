.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EditLoop__Fv
/* 0798E0 001797E0 10FCBD27 */  addiu       $29, $29, -0x3F0
/* 0798E4 001797E4 4000BF7F */  sq          $31, 0x40($29)
/* 0798E8 001797E8 3000B27F */  sq          $18, 0x30($29)
/* 0798EC 001797EC 2000B17F */  sq          $17, 0x20($29)
/* 0798F0 001797F0 1000B07F */  sq          $16, 0x10($29)
/* 0798F4 001797F4 0000B4E7 */  swc1        $f20, 0x0($29)
/* 0798F8 001797F8 9C9080AF */  sw          $0, -0x6F64($28)
/* 0798FC 001797FC 00080424 */  addiu       $4, $0, 0x800
/* 079900 00179800 04000524 */  addiu       $5, $0, 0x4
/* 079904 00179804 64A6050C */  jal         EdPadDown__Fii
/* 079908 00179808 00000000 */   nop
/* 07990C 0017980C 03004010 */  beqz        $2, .L0017981C
/* 079910 00179810 00000000 */   nop
/* 079914 00179814 01000224 */  addiu       $2, $0, 0x1
/* 079918 00179818 9C9082AF */  sw          $2, -0x6F64($28)
.L0017981C:
/* 07991C 0017981C 288D828F */  lw          $2, -0x72D8($28)
/* 079920 00179820 05004128 */  slti        $1, $2, 0x5
/* 079924 00179824 0C002010 */  beqz        $1, .L00179858
/* 079928 00179828 00000000 */   nop
/* 07992C 0017982C 9090838F */  lw          $3, -0x6F70($28)
/* 079930 00179830 3C000224 */  addiu       $2, $0, 0x3C
/* 079934 00179834 08006214 */  bne         $3, $2, .L00179858
/* 079938 00179838 00000000 */   nop
/* 07993C 0017983C 6087838F */  lw          $3, -0x78A0($28)
/* 079940 00179840 01000224 */  addiu       $2, $0, 0x1
/* 079944 00179844 04006214 */  bne         $3, $2, .L00179858
/* 079948 00179848 00000000 */   nop
/* 07994C 0017984C 28260070 */  paddub      $4, $0, $0
/* 079950 00179850 0CCE050C */  jal         EdWalkToEditMes__Fi
/* 079954 00179854 00000000 */   nop
.L00179858:
/* 079958 00179858 6C918283 */  lb          $2, -0x6E94($28)
/* 07995C 0017985C 05004014 */  bnez        $2, .L00179874
/* 079960 00179860 00000000 */   nop
/* 079964 00179864 FFFF0224 */  addiu       $2, $0, -0x1
/* 079968 00179868 689182AF */  sw          $2, -0x6E98($28)
/* 07996C 0017986C 01000224 */  addiu       $2, $0, 0x1
/* 079970 00179870 6C9182A3 */  sb          $2, -0x6E94($28)
.L00179874:
/* 079974 00179874 6087838F */  lw          $3, -0x78A0($28)
/* 079978 00179878 0E000224 */  addiu       $2, $0, 0xE
/* 07997C 0017987C 23006210 */  beq         $3, $2, .L0017990C
/* 079980 00179880 00000000 */   nop
/* 079984 00179884 48A8050C */  jal         EdCheckViewMode__Fv
/* 079988 00179888 00000000 */   nop
/* 07998C 0017988C 11004010 */  beqz        $2, .L001798D4
/* 079990 00179890 00000000 */   nop
/* 079994 00179894 0100023C */  lui         $2, (0x1FFFE >> 16)
/* 079998 00179898 FEFF4234 */  ori         $2, $2, (0x1FFFE & 0xFFFF)
/* 07999C 0017989C 00008244 */  mtc1        $2, $f0
/* 0799A0 001798A0 00000000 */  nop
/* 0799A4 001798A4 A0038046 */  cvt.s.w     $f14, $f0
/* 0799A8 001798A8 4844023C */  lui         $2, (0x44480000 >> 16)
/* 0799AC 001798AC 00608244 */  mtc1        $2, $f12
/* 0799B0 001798B0 8040023C */  lui         $2, (0x40800000 >> 16)
/* 0799B4 001798B4 00688244 */  mtc1        $2, $f13
/* 0799B8 001798B8 B8B5040C */  jal         MGSetRenderInfo__Ffff
/* 0799BC 001798BC 00000000 */   nop
/* 0799C0 001798C0 01000424 */  addiu       $4, $0, 0x1
/* 0799C4 001798C4 9CB8040C */  jal         MGScisioringForce__Fi
/* 0799C8 001798C8 00000000 */   nop
/* 0799CC 001798CC 0F000010 */  b           .L0017990C
/* 0799D0 001798D0 00000000 */   nop
.L001798D4:
/* 0799D4 001798D4 0100023C */  lui         $2, (0x1FFFE >> 16)
/* 0799D8 001798D8 FEFF4234 */  ori         $2, $2, (0x1FFFE & 0xFFFF)
/* 0799DC 001798DC 00008244 */  mtc1        $2, $f0
/* 0799E0 001798E0 00000000 */  nop
/* 0799E4 001798E4 A0038046 */  cvt.s.w     $f14, $f0
/* 0799E8 001798E8 4844023C */  lui         $2, (0x44480000 >> 16)
/* 0799EC 001798EC 00608244 */  mtc1        $2, $f12
/* 0799F0 001798F0 A040023C */  lui         $2, (0x40A00000 >> 16)
/* 0799F4 001798F4 00688244 */  mtc1        $2, $f13
/* 0799F8 001798F8 B8B5040C */  jal         MGSetRenderInfo__Ffff
/* 0799FC 001798FC 00000000 */   nop
/* 079A00 00179900 28260070 */  paddub      $4, $0, $0
/* 079A04 00179904 9CB8040C */  jal         MGScisioringForce__Fi
/* 079A08 00179908 00000000 */   nop
.L0017990C:
/* 079A0C 0017990C 6487828F */  lw          $2, -0x789C($28)
/* 079A10 00179910 D201013C */  lui         $1, %hi(EdExchangeInfo)
/* 079A14 00179914 B09B22AC */  sw          $2, %lo(EdExchangeInfo)($1)
/* 079A18 00179918 E890828F */  lw          $2, -0x6F18($28)
/* 079A1C 0017991C D201013C */  lui         $1, %hi(EdExchangeInfo + 0xC)
/* 079A20 00179920 BC9B22AC */  sw          $2, %lo(EdExchangeInfo + 0xC)($1)
/* 079A24 00179924 0091828F */  lw          $2, -0x6F00($28)
/* 079A28 00179928 D201013C */  lui         $1, %hi(EdExchangeInfo + 0x18)
/* 079A2C 0017992C C89B22AC */  sw          $2, %lo(EdExchangeInfo + 0x18)($1)
/* 079A30 00179930 1891828F */  lw          $2, -0x6EE8($28)
/* 079A34 00179934 D201013C */  lui         $1, %hi(EdExchangeInfo + 0x10)
/* 079A38 00179938 C09B22AC */  sw          $2, %lo(EdExchangeInfo + 0x10)($1)
/* 079A3C 0017993C D301023C */  lui         $2, %hi(SystemEffect)
/* 079A40 00179940 50574224 */  addiu       $2, $2, %lo(SystemEffect)
/* 079A44 00179944 D201013C */  lui         $1, %hi(EdExchangeInfo + 0x14)
/* 079A48 00179948 C49B22AC */  sw          $2, %lo(EdExchangeInfo + 0x14)($1)
/* 079A4C 0017994C 2400023C */  lui         $2, %hi(Vu_prog0f)
/* 079A50 00179950 00614524 */  addiu       $5, $2, %lo(Vu_prog0f)
/* 079A54 00179954 D48B848F */  lw          $4, -0x742C($28)
/* 079A58 00179958 28360070 */  paddub      $6, $0, $0
/* 079A5C 0017995C 5C83040C */  jal         sceVif1PkCall
/* 079A60 00179960 00000000 */   nop
/* 079A64 00179964 E8DF050C */  jal         EdSetFlag__Fv
/* 079A68 00179968 00000000 */   nop
/* 079A6C 0017996C 049180C7 */  lwc1        $f0, -0x6EFC($28)
/* 079A70 00179970 D401013C */  lui         $1, %hi(EdEventInfo + 0x220)
/* 079A74 00179974 F0D320E4 */  swc1        $f0, %lo(EdEventInfo + 0x220)($1)
/* 079A78 00179978 E890838F */  lw          $3, -0x6F18($28)
/* 079A7C 0017997C FFFF0224 */  addiu       $2, $0, -0x1
/* 079A80 00179980 0100013C */  lui         $1, (0x15F14 >> 16)
/* 079A84 00179984 21086100 */  addu        $1, $3, $1
/* 079A88 00179988 145F22AC */  sw          $2, (0x15F14 & 0xFFFF)($1)
/* 079A8C 0017998C 1C8D848F */  lw          $4, -0x72E4($28)
/* 079A90 00179990 CC5E050C */  jal         GetConfigData__9CSaveDataFv
/* 079A94 00179994 00000000 */   nop
/* 079A98 00179998 1000428C */  lw          $2, 0x10($2)
/* 079A9C 0017999C 06004010 */  beqz        $2, .L001799B8
/* 079AA0 001799A0 00000000 */   nop
/* 079AA4 001799A4 A08080C7 */  lwc1        $f0, -0x7F60($28)
/* 079AA8 001799A8 D201013C */  lui         $1, %hi(EditMes1 + 0xA8)
/* 079AAC 001799AC F8B520E4 */  swc1        $f0, %lo(EditMes1 + 0xA8)($1)
/* 079AB0 001799B0 04000010 */  b           .L001799C4
/* 079AB4 001799B4 00000000 */   nop
.L001799B8:
/* 079AB8 001799B8 7C8080C7 */  lwc1        $f0, -0x7F84($28)
/* 079ABC 001799BC D201013C */  lui         $1, %hi(EditMes1 + 0xA8)
/* 079AC0 001799C0 F8B520E4 */  swc1        $f0, %lo(EditMes1 + 0xA8)($1)
.L001799C4:
/* 079AC4 001799C4 6087848F */  lw          $4, -0x78A0($28)
/* 079AC8 001799C8 0C000224 */  addiu       $2, $0, 0xC
/* 079ACC 001799CC 03018214 */  bne         $4, $2, .L00179DDC
/* 079AD0 001799D0 00000000 */   nop
/* 079AD4 001799D4 01000224 */  addiu       $2, $0, 0x1
/* 079AD8 001799D8 2C9082AF */  sw          $2, -0x6FD4($28)
/* 079ADC 001799DC AC70060C */  jal         EditInLoop__Fv
/* 079AE0 001799E0 00000000 */   nop
/* 079AE4 001799E4 FA004010 */  beqz        $2, .L00179DD0
/* 079AE8 001799E8 00000000 */   nop
/* 079AEC 001799EC 63000324 */  addiu       $3, $0, 0x63
/* 079AF0 001799F0 06004314 */  bne         $2, $3, .L00179A0C
/* 079AF4 001799F4 00000000 */   nop
/* 079AF8 001799F8 50DF050C */  jal         EditExit__Fv
/* 079AFC 001799FC 00000000 */   nop
/* 079B00 00179A00 01000224 */  addiu       $2, $0, 0x1
/* 079B04 00179A04 68070010 */  b           .L0017B7A8
/* 079B08 00179A08 00000000 */   nop
.L00179A0C:
/* 079B0C 00179A0C 28260070 */  paddub      $4, $0, $0
/* 079B10 00179A10 C04B040C */  jal         sceGsSyncV
/* 079B14 00179A14 00000000 */   nop
/* 079B18 00179A18 28260070 */  paddub      $4, $0, $0
/* 079B1C 00179A1C C04B040C */  jal         sceGsSyncV
/* 079B20 00179A20 00000000 */   nop
/* 079B24 00179A24 28260070 */  paddub      $4, $0, $0
/* 079B28 00179A28 C04B040C */  jal         sceGsSyncV
/* 079B2C 00179A2C 00000000 */   nop
/* 079B30 00179A30 28260070 */  paddub      $4, $0, $0
/* 079B34 00179A34 C04B040C */  jal         sceGsSyncV
/* 079B38 00179A38 00000000 */   nop
/* 079B3C 00179A3C 149280AF */  sw          $0, -0x6DEC($28)
/* 079B40 00179A40 00DE050C */  jal         LoadScript__Fv
/* 079B44 00179A44 00000000 */   nop
/* 079B48 00179A48 A003A0AF */  sw          $0, 0x3A0($29)
/* 079B4C 00179A4C A403A0AF */  sw          $0, 0x3A4($29)
/* 079B50 00179A50 00280224 */  addiu       $2, $0, 0x2800
/* 079B54 00179A54 A803A2AF */  sw          $2, 0x3A8($29)
/* 079B58 00179A58 000E0224 */  addiu       $2, $0, 0xE00
/* 079B5C 00179A5C AC03A2AF */  sw          $2, 0x3AC($29)
/* 079B60 00179A60 A003A427 */  addiu       $4, $29, 0x3A0
/* 079B64 00179A64 282E0070 */  paddub      $5, $0, $0
/* 079B68 00179A68 28360070 */  paddub      $6, $0, $0
/* 079B6C 00179A6C 283E0070 */  paddub      $7, $0, $0
/* 079B70 00179A70 80000824 */  addiu       $8, $0, 0x80
/* 079B74 00179A74 9CBE040C */  jal         MGFillBox__FRC8CRect_i_UcUcUcUc
/* 079B78 00179A78 00000000 */   nop
/* 079B7C 00179A7C 40B4040C */  jal         MGEndFrame__Fv
/* 079B80 00179A80 00000000 */   nop
/* 079B84 00179A84 C701023C */  lui         $2, %hi(TexManager)
/* 079B88 00179A88 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 079B8C 00179A8C 0F000524 */  addiu       $5, $0, 0xF
/* 079B90 00179A90 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 079B94 00179A94 00000000 */   nop
/* 079B98 00179A98 D201013C */  lui         $1, %hi(EdNPCBuffer + 0x8)
/* 079B9C 00179A9C 58B320AC */  sw          $0, %lo(EdNPCBuffer + 0x8)($1)
/* 079BA0 00179AA0 D201013C */  lui         $1, %hi(EdVillagerBuffer + 0x8)
/* 079BA4 00179AA4 68B320AC */  sw          $0, %lo(EdVillagerBuffer + 0x8)($1)
/* 079BA8 00179AA8 88DF050C */  jal         InitWorkBuffer__Fv
/* 079BAC 00179AAC 00000000 */   nop
/* 079BB0 00179AB0 D301023C */  lui         $2, %hi(EdVillagerInfo)
/* 079BB4 00179AB4 D0294424 */  addiu       $4, $2, %lo(EdVillagerInfo)
/* 079BB8 00179AB8 04918CC7 */  lwc1        $f12, -0x6EFC($28)
/* 079BBC 00179ABC 6090858F */  lw          $5, -0x6FA0($28)
/* 079BC0 00179AC0 F815060C */  jal         EdSelectVillager__FP13VILLAGER_INFOfP13EDIT_MAP_INFO
/* 079BC4 00179AC4 00000000 */   nop
/* 079BC8 00179AC8 D301023C */  lui         $2, %hi(EdVillagerInfo)
/* 079BCC 00179ACC D0294424 */  addiu       $4, $2, %lo(EdVillagerInfo)
/* 079BD0 00179AD0 D201013C */  lui         $1, %hi(EdExchangeInfo + 0xC)
/* 079BD4 00179AD4 BC9B258C */  lw          $5, %lo(EdExchangeInfo + 0xC)($1)
/* 079BD8 00179AD8 28360070 */  paddub      $6, $0, $0
/* 079BDC 00179ADC D017060C */  jal         EdInitVilager__FP13VILLAGER_INFOP11CEditGroundP1
/* 079BE0 00179AE0 00000000 */   nop
/* 079BE4 00179AE4 D201023C */  lui         $2, %hi(EdVillager)
/* 079BE8 00179AE8 905B4424 */  addiu       $4, $2, %lo(EdVillager)
/* 079BEC 00179AEC D301023C */  lui         $2, %hi(EdVillagerInfo)
/* 079BF0 00179AF0 D0294524 */  addiu       $5, $2, %lo(EdVillagerInfo)
/* 079BF4 00179AF4 E890868F */  lw          $6, -0x6F18($28)
/* 079BF8 00179AF8 283E0070 */  paddub      $7, $0, $0
/* 079BFC 00179AFC 4419060C */  jal         EdInitVilagerPosition__FP12CNPCharacterP13VILLAGER_INFOP11CEditGroundPA4_f
/* 079C00 00179B00 00000000 */   nop
/* 079C04 00179B04 64B3040C */  jal         MGBeginFrame__Fv
/* 079C08 00179B08 00000000 */   nop
/* 079C0C 00179B0C B003A0AF */  sw          $0, 0x3B0($29)
/* 079C10 00179B10 B403A0AF */  sw          $0, 0x3B4($29)
/* 079C14 00179B14 00280224 */  addiu       $2, $0, 0x2800
/* 079C18 00179B18 B803A2AF */  sw          $2, 0x3B8($29)
/* 079C1C 00179B1C 000E0224 */  addiu       $2, $0, 0xE00
/* 079C20 00179B20 BC03A2AF */  sw          $2, 0x3BC($29)
/* 079C24 00179B24 B003A427 */  addiu       $4, $29, 0x3B0
/* 079C28 00179B28 282E0070 */  paddub      $5, $0, $0
/* 079C2C 00179B2C 28360070 */  paddub      $6, $0, $0
/* 079C30 00179B30 283E0070 */  paddub      $7, $0, $0
/* 079C34 00179B34 80000824 */  addiu       $8, $0, 0x80
/* 079C38 00179B38 9CBE040C */  jal         MGFillBox__FRC8CRect_i_UcUcUcUc
/* 079C3C 00179B3C 00000000 */   nop
/* 079C40 00179B40 5000A427 */  addiu       $4, $29, 0x50
/* 079C44 00179B44 D201023C */  lui         $2, %hi(EdInteriorName)
/* 079C48 00179B48 00B54524 */  addiu       $5, $2, %lo(EdInteriorName)
/* 079C4C 00179B4C 3490868F */  lw          $6, -0x6FCC($28)
/* 079C50 00179B50 04918CC7 */  lwc1        $f12, -0x6EFC($28)
/* 079C54 00179B54 2C13060C */  jal         EdSearchEvent__FP14ED_EVENT_PARAMPcif
/* 079C58 00179B58 00000000 */   nop
/* 079C5C 00179B5C 10004010 */  beqz        $2, .L00179BA0
/* 079C60 00179B60 00000000 */   nop
/* 079C64 00179B64 D301023C */  lui         $2, %hi(fix_chara_pos)
/* 079C68 00179B68 50594424 */  addiu       $4, $2, %lo(fix_chara_pos)
/* 079C6C 00179B6C 6000A527 */  addiu       $5, $29, 0x60
/* 079C70 00179B70 0C86040C */  jal         sceVu0CopyVector
/* 079C74 00179B74 00000000 */   nop
/* 079C78 00179B78 D301023C */  lui         $2, %hi(fix_chara_rot)
/* 079C7C 00179B7C 60594424 */  addiu       $4, $2, %lo(fix_chara_rot)
/* 079C80 00179B80 8000A527 */  addiu       $5, $29, 0x80
/* 079C84 00179B84 0C86040C */  jal         sceVu0CopyVector
/* 079C88 00179B88 00000000 */   nop
/* 079C8C 00179B8C D301023C */  lui         $2, %hi(fix_camera_pos)
/* 079C90 00179B90 70594424 */  addiu       $4, $2, %lo(fix_camera_pos)
/* 079C94 00179B94 7000A527 */  addiu       $5, $29, 0x70
/* 079C98 00179B98 0C86040C */  jal         sceVu0CopyVector
/* 079C9C 00179B9C 00000000 */   nop
.L00179BA0:
/* 079CA0 00179BA0 6487848F */  lw          $4, -0x789C($28)
/* 079CA4 00179BA4 D301023C */  lui         $2, %hi(fix_chara_pos)
/* 079CA8 00179BA8 50594524 */  addiu       $5, $2, %lo(fix_chara_pos)
/* 079CAC 00179BAC A000998C */  lw          $25, 0xA0($4)
/* 079CB0 00179BB0 1400398F */  lw          $25, 0x14($25)
/* 079CB4 00179BB4 09F82003 */  jalr        $25
/* 079CB8 00179BB8 00000000 */   nop
/* 079CBC 00179BBC D301013C */  lui         $1, %hi(fix_chara_rot + 0x4)
/* 079CC0 00179BC0 64592DC4 */  lwc1        $f13, %lo(fix_chara_rot + 0x4)($1)
/* 079CC4 00179BC4 288180C7 */  lwc1        $f0, -0x7ED8($28)
/* 079CC8 00179BC8 406B0046 */  add.s       $f13, $f13, $f0
/* 079CCC 00179BCC 36680046 */  c.le.s      $f13, $f0
/* 079CD0 00179BD0 00000000 */  nop
/* 079CD4 00179BD4 03000145 */  bc1t        .L00179BE4
/* 079CD8 00179BD8 00000000 */   nop
/* 079CDC 00179BDC B08280C7 */  lwc1        $f0, -0x7D50($28)
/* 079CE0 00179BE0 416B0046 */  sub.s       $f13, $f13, $f0
.L00179BE4:
/* 079CE4 00179BE4 6487848F */  lw          $4, -0x789C($28)
/* 079CE8 00179BE8 D301013C */  lui         $1, %hi(fix_chara_rot)
/* 079CEC 00179BEC 60592CC4 */  lwc1        $f12, %lo(fix_chara_rot)($1)
/* 079CF0 00179BF0 D301013C */  lui         $1, %hi(fix_chara_rot + 0x8)
/* 079CF4 00179BF4 68592EC4 */  lwc1        $f14, %lo(fix_chara_rot + 0x8)($1)
/* 079CF8 00179BF8 A000998C */  lw          $25, 0xA0($4)
/* 079CFC 00179BFC 3000398F */  lw          $25, 0x30($25)
/* 079D00 00179C00 09F82003 */  jalr        $25
/* 079D04 00179C04 00000000 */   nop
/* 079D08 00179C08 D301023C */  lui         $2, %hi(MainCamera)
/* 079D0C 00179C0C 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 079D10 00179C10 C492040C */  jal         FollowOff__13CCameraFollowFv
/* 079D14 00179C14 00000000 */   nop
/* 079D18 00179C18 D301023C */  lui         $2, %hi(MainCamera)
/* 079D1C 00179C1C 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 079D20 00179C20 D301023C */  lui         $2, %hi(fix_camera_pos)
/* 079D24 00179C24 70594524 */  addiu       $5, $2, %lo(fix_camera_pos)
/* 079D28 00179C28 A490040C */  jal         SetPos__7CCameraFPf
/* 079D2C 00179C2C 00000000 */   nop
/* 079D30 00179C30 6041023C */  lui         $2, (0x41600000 >> 16)
/* 079D34 00179C34 00088244 */  mtc1        $2, $f1
/* 079D38 00179C38 D301013C */  lui         $1, %hi(fix_chara_pos + 0x4)
/* 079D3C 00179C3C 545920C4 */  lwc1        $f0, %lo(fix_chara_pos + 0x4)($1)
/* 079D40 00179C40 400B0046 */  add.s       $f13, $f1, $f0
/* 079D44 00179C44 D301023C */  lui         $2, %hi(MainCamera)
/* 079D48 00179C48 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 079D4C 00179C4C D301013C */  lui         $1, %hi(fix_chara_pos)
/* 079D50 00179C50 50592CC4 */  lwc1        $f12, %lo(fix_chara_pos)($1)
/* 079D54 00179C54 D301013C */  lui         $1, %hi(fix_chara_pos + 0x8)
/* 079D58 00179C58 58592EC4 */  lwc1        $f14, %lo(fix_chara_pos + 0x8)($1)
/* 079D5C 00179C5C D490040C */  jal         SetRef__7CCameraFfff
/* 079D60 00179C60 00000000 */   nop
/* 079D64 00179C64 D301023C */  lui         $2, %hi(MainCamera)
/* 079D68 00179C68 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 079D6C 00179C6C FFFF0524 */  addiu       $5, $0, -0x1
/* 079D70 00179C70 F491040C */  jal         Step__13CCameraFollowFi
/* 079D74 00179C74 00000000 */   nop
/* 079D78 00179C78 D301023C */  lui         $2, %hi(MainCamera)
/* 079D7C 00179C7C 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 079D80 00179C80 B000A527 */  addiu       $5, $29, 0xB0
/* 079D84 00179C84 E890040C */  jal         GetDir__7CCameraFPf
/* 079D88 00179C88 00000000 */   nop
/* 079D8C 00179C8C D301023C */  lui         $2, %hi(MainCamera)
/* 079D90 00179C90 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 079D94 00179C94 B491040C */  jal         GetAngleH__7CCameraFv
/* 079D98 00179C98 00000000 */   nop
/* 079D9C 00179C9C 06050046 */  mov.s       $f20, $f0
/* 079DA0 00179CA0 D301023C */  lui         $2, %hi(MainCamera)
/* 079DA4 00179CA4 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 079DA8 00179CA8 C092040C */  jal         FollowOn__13CCameraFollowFv
/* 079DAC 00179CAC 00000000 */   nop
/* 079DB0 00179CB0 D301023C */  lui         $2, %hi(MainCamera)
/* 079DB4 00179CB4 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 079DB8 00179CB8 06A30046 */  mov.s       $f12, $f20
/* 079DBC 00179CBC CC92040C */  jal         SetAngleSoon__13CCameraFollowFf
/* 079DC0 00179CC0 00000000 */   nop
/* 079DC4 00179CC4 6487848F */  lw          $4, -0x789C($28)
/* 079DC8 00179CC8 FFFF0524 */  addiu       $5, $0, -0x1
/* 079DCC 00179CCC A000998C */  lw          $25, 0xA0($4)
/* 079DD0 00179CD0 9400398F */  lw          $25, 0x94($25)
/* 079DD4 00179CD4 09F82003 */  jalr        $25
/* 079DD8 00179CD8 00000000 */   nop
/* 079DDC 00179CDC 28260070 */  paddub      $4, $0, $0
/* 079DE0 00179CE0 C04B040C */  jal         sceGsSyncV
/* 079DE4 00179CE4 00000000 */   nop
/* 079DE8 00179CE8 28260070 */  paddub      $4, $0, $0
/* 079DEC 00179CEC C04B040C */  jal         sceGsSyncV
/* 079DF0 00179CF0 00000000 */   nop
/* 079DF4 00179CF4 00C6050C */  jal         EdInitSoundSrc__Fv
/* 079DF8 00179CF8 00000000 */   nop
/* 079DFC 00179CFC 04918CC7 */  lwc1        $f12, -0x6EFC($28)
/* 079E00 00179D00 C8DD050C */  jal         PlayAmbient__Ff
/* 079E04 00179D04 00000000 */   nop
/* 079E08 00179D08 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 079E0C 00179D0C 00608244 */  mtc1        $2, $f12
/* 079E10 00179D10 84C5050C */  jal         EdSetAmbientVol__Ff
/* 079E14 00179D14 00000000 */   nop
/* 079E18 00179D18 4090848F */  lw          $4, -0x6FC0($28)
/* 079E1C 00179D1C 03008004 */  bltz        $4, .L00179D2C
/* 079E20 00179D20 00000000 */   nop
/* 079E24 00179D24 5866050C */  jal         SndBgmLoad__Fi
/* 079E28 00179D28 00000000 */   nop
.L00179D2C:
/* 079E2C 00179D2C 28260070 */  paddub      $4, $0, $0
/* 079E30 00179D30 C04B040C */  jal         sceGsSyncV
/* 079E34 00179D34 00000000 */   nop
/* 079E38 00179D38 28260070 */  paddub      $4, $0, $0
/* 079E3C 00179D3C C04B040C */  jal         sceGsSyncV
/* 079E40 00179D40 00000000 */   nop
/* 079E44 00179D44 00608044 */  mtc1        $0, $f12
/* 079E48 00179D48 00000000 */  nop
/* 079E4C 00179D4C 46630046 */  mov.s       $f13, $f12
/* 079E50 00179D50 86630046 */  mov.s       $f14, $f12
/* 079E54 00179D54 40000424 */  addiu       $4, $0, 0x40
/* 079E58 00179D58 C425060C */  jal         EdFadeIn__Fifff
/* 079E5C 00179D5C 00000000 */   nop
/* 079E60 00179D60 01000224 */  addiu       $2, $0, 0x1
/* 079E64 00179D64 608782AF */  sw          $2, -0x78A0($28)
/* 079E68 00179D68 3890828F */  lw          $2, -0x6FC8($28)
/* 079E6C 00179D6C 0A004004 */  bltz        $2, .L00179D98
/* 079E70 00179D70 00000000 */   nop
/* 079E74 00179D74 D301023C */  lui         $2, %hi(MainCamera)
/* 079E78 00179D78 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 079E7C 00179D7C BC65050C */  jal         SndSetCamera__FP7CCamera
/* 079E80 00179D80 00000000 */   nop
/* 079E84 00179D84 3890848F */  lw          $4, -0x6FC8($28)
/* 079E88 00179D88 D301023C */  lui         $2, %hi(fix_chara_pos)
/* 079E8C 00179D8C 50594524 */  addiu       $5, $2, %lo(fix_chara_pos)
/* 079E90 00179D90 58C8050C */  jal         EdDoorCloseSe__FiPf
/* 079E94 00179D94 00000000 */   nop
.L00179D98:
/* 079E98 00179D98 288D828F */  lw          $2, -0x72D8($28)
/* 079E9C 00179D9C 05004128 */  slti        $1, $2, 0x5
/* 079EA0 00179DA0 04002010 */  beqz        $1, .L00179DB4
/* 079EA4 00179DA4 00000000 */   nop
/* 079EA8 00179DA8 3C000424 */  addiu       $4, $0, 0x3C
/* 079EAC 00179DAC 0CCE050C */  jal         EdWalkToEditMes__Fi
/* 079EB0 00179DB0 00000000 */   nop
.L00179DB4:
/* 079EB4 00179DB4 D401013C */  lui         $1, %hi(EdEventInfo + 0x2D4)
/* 079EB8 00179DB8 A4D4248C */  lw          $4, %lo(EdEventInfo + 0x2D4)($1)
/* 079EBC 00179DBC 04008004 */  bltz        $4, .L00179DD0
/* 079EC0 00179DC0 00000000 */   nop
/* 079EC4 00179DC4 282E0070 */  paddub      $5, $0, $0
/* 079EC8 00179DC8 7CDE050C */  jal         RunEvent__FiP7CCamera
/* 079ECC 00179DCC 00000000 */   nop
.L00179DD0:
/* 079ED0 00179DD0 28160070 */  paddub      $2, $0, $0
/* 079ED4 00179DD4 74060010 */  b           .L0017B7A8
/* 079ED8 00179DD8 00000000 */   nop
.L00179DDC:
/* 079EDC 00179DDC 2C9080AF */  sw          $0, -0x6FD4($28)
/* 079EE0 00179DE0 DC90828F */  lw          $2, -0x6F24($28)
/* 079EE4 00179DE4 D1004010 */  beqz        $2, .L0017A12C
/* 079EE8 00179DE8 00000000 */   nop
/* 079EEC 00179DEC 74918283 */  lb          $2, -0x6E8C($28)
/* 079EF0 00179DF0 04004014 */  bnez        $2, .L00179E04
/* 079EF4 00179DF4 00000000 */   nop
/* 079EF8 00179DF8 709180AF */  sw          $0, -0x6E90($28)
/* 079EFC 00179DFC 01000224 */  addiu       $2, $0, 0x1
/* 079F00 00179E00 749182A3 */  sb          $2, -0x6E8C($28)
.L00179E04:
/* 079F04 00179E04 7C918283 */  lb          $2, -0x6E84($28)
/* 079F08 00179E08 04004014 */  bnez        $2, .L00179E1C
/* 079F0C 00179E0C 00000000 */   nop
/* 079F10 00179E10 789180AF */  sw          $0, -0x6E88($28)
/* 079F14 00179E14 01000224 */  addiu       $2, $0, 0x1
/* 079F18 00179E18 7C9182A3 */  sb          $2, -0x6E84($28)
.L00179E1C:
/* 079F1C 00179E1C 84918283 */  lb          $2, -0x6E7C($28)
/* 079F20 00179E20 04004014 */  bnez        $2, .L00179E34
/* 079F24 00179E24 00000000 */   nop
/* 079F28 00179E28 809180AF */  sw          $0, -0x6E80($28)
/* 079F2C 00179E2C 01000224 */  addiu       $2, $0, 0x1
/* 079F30 00179E30 849182A3 */  sb          $2, -0x6E7C($28)
.L00179E34:
/* 079F34 00179E34 28260070 */  paddub      $4, $0, $0
/* 079F38 00179E38 0A000010 */  b           .L00179E64
/* 079F3C 00179E3C 00000000 */   nop
.L00179E40:
/* 079F40 00179E40 80280400 */  sll         $5, $4, 2
/* 079F44 00179E44 E090828F */  lw          $2, -0x6F20($28)
/* 079F48 00179E48 21104500 */  addu        $2, $2, $5
/* 079F4C 00179E4C 0000438C */  lw          $3, 0x0($2)
/* 079F50 00179E50 D401023C */  lui         $2, %hi(menu$807)
/* 079F54 00179E54 50B84224 */  addiu       $2, $2, %lo(menu$807)
/* 079F58 00179E58 21104500 */  addu        $2, $2, $5
/* 079F5C 00179E5C 000043AC */  sw          $3, 0x0($2)
/* 079F60 00179E60 01008424 */  addiu       $4, $4, 0x1
.L00179E64:
/* 079F64 00179E64 40008228 */  slti        $2, $4, 0x40
/* 079F68 00179E68 F5FF4014 */  bnez        $2, .L00179E40
/* 079F6C 00179E6C 00000000 */   nop
/* 079F70 00179E70 28860070 */  paddub      $16, $0, $0
/* 079F74 00179E74 02000010 */  b           .L00179E80
/* 079F78 00179E78 00000000 */   nop
.L00179E7C:
/* 079F7C 00179E7C 01001026 */  addiu       $16, $16, 0x1
.L00179E80:
/* 079F80 00179E80 80181000 */  sll         $3, $16, 2
/* 079F84 00179E84 D401023C */  lui         $2, %hi(menu$807)
/* 079F88 00179E88 50B84224 */  addiu       $2, $2, %lo(menu$807)
/* 079F8C 00179E8C 21104300 */  addu        $2, $2, $3
/* 079F90 00179E90 0000428C */  lw          $2, 0x0($2)
/* 079F94 00179E94 00004280 */  lb          $2, 0x0($2)
/* 079F98 00179E98 F8FF4014 */  bnez        $2, .L00179E7C
/* 079F9C 00179E9C 00000000 */   nop
/* 079FA0 00179EA0 CC01023C */  lui         $2, %hi(GamePad)
/* 079FA4 00179EA4 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 079FA8 00179EA8 00500524 */  addiu       $5, $0, 0x5000
/* 079FAC 00179EAC 14000624 */  addiu       $6, $0, 0x14
/* 079FB0 00179EB0 05000724 */  addiu       $7, $0, 0x5
/* 079FB4 00179EB4 58AD040C */  jal         SetAutoRepeat__8CGamePadFiii
/* 079FB8 00179EB8 00000000 */   nop
/* 079FBC 00179EBC CC01023C */  lui         $2, %hi(GamePad)
/* 079FC0 00179EC0 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 079FC4 00179EC4 00400524 */  addiu       $5, $0, 0x4000
/* 079FC8 00179EC8 1CAE040C */  jal         Down__8CGamePadFi
/* 079FCC 00179ECC 00000000 */   nop
/* 079FD0 00179ED0 04004010 */  beqz        $2, .L00179EE4
/* 079FD4 00179ED4 00000000 */   nop
/* 079FD8 00179ED8 7891828F */  lw          $2, -0x6E88($28)
/* 079FDC 00179EDC 01004224 */  addiu       $2, $2, 0x1
/* 079FE0 00179EE0 789182AF */  sw          $2, -0x6E88($28)
.L00179EE4:
/* 079FE4 00179EE4 CC01023C */  lui         $2, %hi(GamePad)
/* 079FE8 00179EE8 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 079FEC 00179EEC 00100524 */  addiu       $5, $0, 0x1000
/* 079FF0 00179EF0 1CAE040C */  jal         Down__8CGamePadFi
/* 079FF4 00179EF4 00000000 */   nop
/* 079FF8 00179EF8 04004010 */  beqz        $2, .L00179F0C
/* 079FFC 00179EFC 00000000 */   nop
/* 07A000 00179F00 7891828F */  lw          $2, -0x6E88($28)
/* 07A004 00179F04 FFFF4224 */  addiu       $2, $2, -0x1
/* 07A008 00179F08 789182AF */  sw          $2, -0x6E88($28)
.L00179F0C:
/* 07A00C 00179F0C 7891828F */  lw          $2, -0x6E88($28)
/* 07A010 00179F10 02004104 */  bgez        $2, .L00179F1C
/* 07A014 00179F14 00000000 */   nop
/* 07A018 00179F18 789180AF */  sw          $0, -0x6E88($28)
.L00179F1C:
/* 07A01C 00179F1C 7891828F */  lw          $2, -0x6E88($28)
/* 07A020 00179F20 2A105000 */  slt         $2, $2, $16
/* 07A024 00179F24 03004014 */  bnez        $2, .L00179F34
/* 07A028 00179F28 00000000 */   nop
/* 07A02C 00179F2C FFFF0226 */  addiu       $2, $16, -0x1
/* 07A030 00179F30 789182AF */  sw          $2, -0x6E88($28)
.L00179F34:
/* 07A034 00179F34 709180AF */  sw          $0, -0x6E90($28)
/* 07A038 00179F38 7891838F */  lw          $3, -0x6E88($28)
/* 07A03C 00179F3C 0E006228 */  slti        $2, $3, 0xE
/* 07A040 00179F40 03004014 */  bnez        $2, .L00179F50
/* 07A044 00179F44 00000000 */   nop
/* 07A048 00179F48 F3FF6224 */  addiu       $2, $3, -0xD
/* 07A04C 00179F4C 709182AF */  sw          $2, -0x6E90($28)
.L00179F50:
/* 07A050 00179F50 E803A327 */  addiu       $3, $29, 0x3E8
/* 07A054 00179F54 788782DF */  ld          $2, -0x7888($28)
/* 07A058 00179F58 000062FC */  sd          $2, 0x0($3)
/* 07A05C 00179F5C D301013C */  lui         $1, %hi(DebugFont__3 + 0x18)
/* 07A060 00179F60 882F20AC */  sw          $0, %lo(DebugFont__3 + 0x18)($1)
/* 07A064 00179F64 7091908F */  lw          $16, -0x6E90($28)
/* 07A068 00179F68 1C000010 */  b           .L00179FDC
/* 07A06C 00179F6C 00000000 */   nop
.L00179F70:
/* 07A070 00179F70 D301013C */  lui         $1, %hi(DebugFont__3 + 0x18)
/* 07A074 00179F74 882F238C */  lw          $3, %lo(DebugFont__3 + 0x18)($1)
/* 07A078 00179F78 D301023C */  lui         $2, %hi(DebugFont__3)
/* 07A07C 00179F7C 702F4224 */  addiu       $2, $2, %lo(DebugFont__3)
/* 07A080 00179F80 21204300 */  addu        $4, $2, $3
/* 07A084 00179F84 7891828F */  lw          $2, -0x6E88($28)
/* 07A088 00179F88 26100202 */  xor         $2, $16, $2
/* 07A08C 00179F8C 0100422C */  sltiu       $2, $2, 0x1
/* 07A090 00179F90 80100200 */  sll         $2, $2, 2
/* 07A094 00179F94 21305D00 */  addu        $6, $2, $29
/* 07A098 00179F98 80181000 */  sll         $3, $16, 2
/* 07A09C 00179F9C D401023C */  lui         $2, %hi(menu$807)
/* 07A0A0 00179FA0 50B84224 */  addiu       $2, $2, %lo(menu$807)
/* 07A0A4 00179FA4 21184300 */  addu        $3, $2, $3
/* 07A0A8 00179FA8 1C008424 */  addiu       $4, $4, 0x1C
/* 07A0AC 00179FAC 2A00023C */  lui         $2, %hi(LIT_1609)
/* 07A0B0 00179FB0 D8AA4524 */  addiu       $5, $2, %lo(LIT_1609)
/* 07A0B4 00179FB4 E803C68C */  lw          $6, 0x3E8($6)
/* 07A0B8 00179FB8 0000678C */  lw          $7, 0x0($3)
/* 07A0BC 00179FBC 1614040C */  jal         sprintf
/* 07A0C0 00179FC0 00000000 */   nop
/* 07A0C4 00179FC4 D301013C */  lui         $1, %hi(DebugFont__3 + 0x18)
/* 07A0C8 00179FC8 882F238C */  lw          $3, %lo(DebugFont__3 + 0x18)($1)
/* 07A0CC 00179FCC 21106200 */  addu        $2, $3, $2
/* 07A0D0 00179FD0 D301013C */  lui         $1, %hi(DebugFont__3 + 0x18)
/* 07A0D4 00179FD4 882F22AC */  sw          $2, %lo(DebugFont__3 + 0x18)($1)
/* 07A0D8 00179FD8 01001026 */  addiu       $16, $16, 0x1
.L00179FDC:
/* 07A0DC 00179FDC 7091828F */  lw          $2, -0x6E90($28)
/* 07A0E0 00179FE0 0E004224 */  addiu       $2, $2, 0xE
/* 07A0E4 00179FE4 2A100202 */  slt         $2, $16, $2
/* 07A0E8 00179FE8 E1FF4014 */  bnez        $2, .L00179F70
/* 07A0EC 00179FEC 00000000 */   nop
/* 07A0F0 00179FF0 A0B8040C */  jal         GetVif1Packet__Fv
/* 07A0F4 00179FF4 00000000 */   nop
/* 07A0F8 00179FF8 C701033C */  lui         $3, %hi(TexManager)
/* 07A0FC 00179FFC 70586424 */  addiu       $4, $3, %lo(TexManager)
/* 07A100 0017A000 282E4070 */  paddub      $5, $2, $0
/* 07A104 0017A004 1F000624 */  addiu       $6, $0, 0x1F
/* 07A108 0017A008 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 07A10C 0017A00C 00000000 */   nop
/* 07A110 0017A010 D301023C */  lui         $2, %hi(DebugFont__3)
/* 07A114 0017A014 702F4424 */  addiu       $4, $2, %lo(DebugFont__3)
/* 07A118 0017A018 D0F7040C */  jal         Draw__10CDebugFontFv
/* 07A11C 0017A01C 00000000 */   nop
/* 07A120 0017A020 CC01023C */  lui         $2, %hi(GamePad)
/* 07A124 0017A024 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 07A128 0017A028 20000524 */  addiu       $5, $0, 0x20
/* 07A12C 0017A02C 1CAE040C */  jal         Down__8CGamePadFi
/* 07A130 0017A030 00000000 */   nop
/* 07A134 0017A034 29004010 */  beqz        $2, .L0017A0DC
/* 07A138 0017A038 00000000 */   nop
/* 07A13C 0017A03C 4040023C */  lui         $2, (0x40400000 >> 16)
/* 07A140 0017A040 00088244 */  mtc1        $2, $f1
/* 07A144 0017A044 049180C7 */  lwc1        $f0, -0x6EFC($28)
/* 07A148 0017A048 03050146 */  div.s       $f20, $f0, $f1
/* 07A14C 0017A04C 06A30046 */  mov.s       $f12, $f20
/* 07A150 0017A050 2C44040C */  jal         fptosi
/* 07A154 0017A054 00000000 */   nop
/* 07A158 0017A058 06A30046 */  mov.s       $f12, $f20
/* 07A15C 0017A05C 2C44040C */  jal         fptosi
/* 07A160 0017A060 00000000 */   nop
/* 07A164 0017A064 7891838F */  lw          $3, -0x6E88($28)
/* 07A168 0017A068 80200300 */  sll         $4, $3, 2
/* 07A16C 0017A06C D401033C */  lui         $3, %hi(menu$807)
/* 07A170 0017A070 50B86324 */  addiu       $3, $3, %lo(menu$807)
/* 07A174 0017A074 21186400 */  addu        $3, $3, $4
/* 07A178 0017A078 28264070 */  paddub      $4, $2, $0
/* 07A17C 0017A07C 0000658C */  lw          $5, 0x0($3)
/* 07A180 0017A080 AC13060C */  jal         EdMapJump__FiPc
/* 07A184 0017A084 00000000 */   nop
/* 07A188 0017A088 0C000224 */  addiu       $2, $0, 0xC
/* 07A18C 0017A08C 608782AF */  sw          $2, -0x78A0($28)
.L0017A090:
/* 07A190 0017A090 8CFB040C */  jal         ReadBGSync__Fv
/* 07A194 0017A094 00000000 */   nop
/* 07A198 0017A098 FDFF4014 */  bnez        $2, .L0017A090
/* 07A19C 0017A09C 00000000 */   nop
/* 07A1A0 0017A0A0 7891828F */  lw          $2, -0x6E88($28)
/* 07A1A4 0017A0A4 80180200 */  sll         $3, $2, 2
/* 07A1A8 0017A0A8 D401023C */  lui         $2, %hi(menu$807)
/* 07A1AC 0017A0AC 50B84224 */  addiu       $2, $2, %lo(menu$807)
/* 07A1B0 0017A0B0 21184300 */  addu        $3, $2, $3
/* 07A1B4 0017A0B4 D301023C */  lui         $2, %hi(interior_map_name)
/* 07A1B8 0017A0B8 80594424 */  addiu       $4, $2, %lo(interior_map_name)
/* 07A1BC 0017A0BC 0000658C */  lw          $5, 0x0($3)
/* 07A1C0 0017A0C0 5A15040C */  jal         strcpy
/* 07A1C4 0017A0C4 00000000 */   nop
/* 07A1C8 0017A0C8 04918CC7 */  lwc1        $f12, -0x6EFC($28)
/* 07A1CC 0017A0CC D301023C */  lui         $2, %hi(interior_map_name)
/* 07A1D0 0017A0D0 80594424 */  addiu       $4, $2, %lo(interior_map_name)
/* 07A1D4 0017A0D4 8C6F060C */  jal         EditInInit__FfPc
/* 07A1D8 0017A0D8 00000000 */   nop
.L0017A0DC:
/* 07A1DC 0017A0DC CC01023C */  lui         $2, %hi(GamePad)
/* 07A1E0 0017A0E0 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 07A1E4 0017A0E4 00010524 */  addiu       $5, $0, 0x100
/* 07A1E8 0017A0E8 04AE040C */  jal         On__8CGamePadFi
/* 07A1EC 0017A0EC 00000000 */   nop
/* 07A1F0 0017A0F0 0B004010 */  beqz        $2, .L0017A120
/* 07A1F4 0017A0F4 00000000 */   nop
/* 07A1F8 0017A0F8 CC01023C */  lui         $2, %hi(GamePad)
/* 07A1FC 0017A0FC 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 07A200 0017A100 00080524 */  addiu       $5, $0, 0x800
/* 07A204 0017A104 04AE040C */  jal         On__8CGamePadFi
/* 07A208 0017A108 00000000 */   nop
/* 07A20C 0017A10C 04004010 */  beqz        $2, .L0017A120
/* 07A210 0017A110 00000000 */   nop
/* 07A214 0017A114 01000224 */  addiu       $2, $0, 0x1
/* 07A218 0017A118 A3050010 */  b           .L0017B7A8
/* 07A21C 0017A11C 00000000 */   nop
.L0017A120:
/* 07A220 0017A120 28160070 */  paddub      $2, $0, $0
/* 07A224 0017A124 A0050010 */  b           .L0017B7A8
/* 07A228 0017A128 00000000 */   nop
.L0017A12C:
/* 07A22C 0017A12C 1100812C */  sltiu       $1, $4, 0x11
/* 07A230 0017A130 65022010 */  beqz        $1, .L0017AAC8$b
/* 07A234 0017A134 00000000 */   nop
/* 07A238 0017A138 2A00023C */  lui         $2, %hi(LIT_1611)
/* 07A23C 0017A13C 40AB4324 */  addiu       $3, $2, %lo(LIT_1611)
/* 07A240 0017A140 80100400 */  sll         $2, $4, 2
/* 07A244 0017A144 21104300 */  addu        $2, $2, $3
/* 07A248 0017A148 0000428C */  lw          $2, 0x0($2)
/* 07A24C 0017A14C 08004000 */  jr          $2
/* 07A250 0017A150 00000000 */   nop
jlabel .L0017A154
.L0017A154$b:
/* 07A254 0017A154 B89080AF */  sw          $0, -0x6F48($28)
/* 07A258 0017A158 44F7050C */  jal         MainMode__Fv
/* 07A25C 0017A15C 00000000 */   nop
/* 07A260 0017A160 A8F7050C */  jal         MainEditMode__Fv
/* 07A264 0017A164 00000000 */   nop
/* 07A268 0017A168 48A8050C */  jal         EdCheckViewMode__Fv
/* 07A26C 0017A16C 00000000 */   nop
/* 07A270 0017A170 06004014 */  bnez        $2, .L0017A18C
/* 07A274 0017A174 00000000 */   nop
/* 07A278 0017A178 D301023C */  lui         $2, %hi(MainCamera)
/* 07A27C 0017A17C 40454224 */  addiu       $2, $2, %lo(MainCamera)
/* 07A280 0017A180 009182AF */  sw          $2, -0x6F00($28)
/* 07A284 0017A184 04000010 */  b           .L0017A198
/* 07A288 0017A188 00000000 */   nop
.L0017A18C:
/* 07A28C 0017A18C D301023C */  lui         $2, %hi(ViewCamera)
/* 07A290 0017A190 40544224 */  addiu       $2, $2, %lo(ViewCamera)
/* 07A294 0017A194 009182AF */  sw          $2, -0x6F00($28)
.L0017A198:
/* 07A298 0017A198 48A8050C */  jal         EdCheckViewMode__Fv
/* 07A29C 0017A19C 00000000 */   nop
/* 07A2A0 0017A1A0 49024014 */  bnez        $2, .L0017AAC8$b
/* 07A2A4 0017A1A4 00000000 */   nop
/* 07A2A8 0017A1A8 0091848F */  lw          $4, -0x6F00($28)
/* 07A2AC 0017A1AC 01000524 */  addiu       $5, $0, 0x1
/* 07A2B0 0017A1B0 B802998C */  lw          $25, 0x2B8($4)
/* 07A2B4 0017A1B4 0800398F */  lw          $25, 0x8($25)
/* 07A2B8 0017A1B8 09F82003 */  jalr        $25
/* 07A2BC 0017A1BC 00000000 */   nop
/* 07A2C0 0017A1C0 41020010 */  b           .L0017AAC8$b
/* 07A2C4 0017A1C4 00000000 */   nop
jlabel .L0017A1C8
.L0017A1C8$b:
/* 07A2C8 0017A1C8 9090828F */  lw          $2, -0x6F70($28)
/* 07A2CC 0017A1CC 03004018 */  blez        $2, .L0017A1DC
/* 07A2D0 0017A1D0 00000000 */   nop
/* 07A2D4 0017A1D4 44F7050C */  jal         MainMode__Fv
/* 07A2D8 0017A1D8 00000000 */   nop
.L0017A1DC:
/* 07A2DC 0017A1DC A8F7050C */  jal         MainEditMode__Fv
/* 07A2E0 0017A1E0 00000000 */   nop
/* 07A2E4 0017A1E4 48A8050C */  jal         EdCheckViewMode__Fv
/* 07A2E8 0017A1E8 00000000 */   nop
/* 07A2EC 0017A1EC 06004014 */  bnez        $2, .L0017A208
/* 07A2F0 0017A1F0 00000000 */   nop
/* 07A2F4 0017A1F4 D301023C */  lui         $2, %hi(MainCamera)
/* 07A2F8 0017A1F8 40454224 */  addiu       $2, $2, %lo(MainCamera)
/* 07A2FC 0017A1FC 009182AF */  sw          $2, -0x6F00($28)
/* 07A300 0017A200 04000010 */  b           .L0017A214
/* 07A304 0017A204 00000000 */   nop
.L0017A208:
/* 07A308 0017A208 D301023C */  lui         $2, %hi(ViewCamera)
/* 07A30C 0017A20C 40544224 */  addiu       $2, $2, %lo(ViewCamera)
/* 07A310 0017A210 009182AF */  sw          $2, -0x6F00($28)
.L0017A214:
/* 07A314 0017A214 48A8050C */  jal         EdCheckViewMode__Fv
/* 07A318 0017A218 00000000 */   nop
/* 07A31C 0017A21C 07004014 */  bnez        $2, .L0017A23C
/* 07A320 0017A220 00000000 */   nop
/* 07A324 0017A224 0091848F */  lw          $4, -0x6F00($28)
/* 07A328 0017A228 01000524 */  addiu       $5, $0, 0x1
/* 07A32C 0017A22C B802998C */  lw          $25, 0x2B8($4)
/* 07A330 0017A230 0800398F */  lw          $25, 0x8($25)
/* 07A334 0017A234 09F82003 */  jalr        $25
/* 07A338 0017A238 00000000 */   nop
.L0017A23C:
/* 07A33C 0017A23C A890828F */  lw          $2, -0x6F58($28)
/* 07A340 0017A240 21024010 */  beqz        $2, .L0017AAC8$b
/* 07A344 0017A244 00000000 */   nop
/* 07A348 0017A248 9C9080AF */  sw          $0, -0x6F64($28)
/* 07A34C 0017A24C 0426060C */  jal         EdFadeOutCheck__Fv
/* 07A350 0017A250 00000000 */   nop
/* 07A354 0017A254 1C024010 */  beqz        $2, .L0017AAC8$b
/* 07A358 0017A258 00000000 */   nop
/* 07A35C 0017A25C A890848F */  lw          $4, -0x6F58($28)
/* 07A360 0017A260 05008104 */  bgez        $4, .L0017A278
/* 07A364 0017A264 00000000 */   nop
/* 07A368 0017A268 44E0050C */  jal         EdExitLoop__Fv
/* 07A36C 0017A26C 00000000 */   nop
/* 07A370 0017A270 0B000010 */  b           .L0017A2A0
/* 07A374 0017A274 00000000 */   nop
.L0017A278:
/* 07A378 0017A278 282E0070 */  paddub      $5, $0, $0
/* 07A37C 0017A27C 7CDE050C */  jal         RunEvent__FiP7CCamera
/* 07A380 0017A280 00000000 */   nop
/* 07A384 0017A284 00608044 */  mtc1        $0, $f12
/* 07A388 0017A288 00000000 */  nop
/* 07A38C 0017A28C 46630046 */  mov.s       $f13, $f12
/* 07A390 0017A290 86630046 */  mov.s       $f14, $f12
/* 07A394 0017A294 3C000424 */  addiu       $4, $0, 0x3C
/* 07A398 0017A298 C425060C */  jal         EdFadeIn__Fifff
/* 07A39C 0017A29C 00000000 */   nop
.L0017A2A0:
/* 07A3A0 0017A2A0 A89080AF */  sw          $0, -0x6F58($28)
/* 07A3A4 0017A2A4 08020010 */  b           .L0017AAC8$b
/* 07A3A8 0017A2A8 00000000 */   nop
jlabel .L0017A2AC
.L0017A2AC$b:
/* 07A3AC 0017A2AC D301023C */  lui         $2, %hi(EventCamera)
/* 07A3B0 0017A2B0 40514224 */  addiu       $2, $2, %lo(EventCamera)
/* 07A3B4 0017A2B4 009182AF */  sw          $2, -0x6F00($28)
/* 07A3B8 0017A2B8 A8F7050C */  jal         MainEditMode__Fv
/* 07A3BC 0017A2BC 00000000 */   nop
/* 07A3C0 0017A2C0 5CFA050C */  jal         EventMode__Fv
/* 07A3C4 0017A2C4 00000000 */   nop
/* 07A3C8 0017A2C8 68FE050C */  jal         VillagerCollision__Fv
/* 07A3CC 0017A2CC 00000000 */   nop
/* 07A3D0 0017A2D0 F461060C */  jal         EdEventNPCStep__Fv
/* 07A3D4 0017A2D4 00000000 */   nop
/* 07A3D8 0017A2D8 0091848F */  lw          $4, -0x6F00($28)
/* 07A3DC 0017A2DC 01000524 */  addiu       $5, $0, 0x1
/* 07A3E0 0017A2E0 B802998C */  lw          $25, 0x2B8($4)
/* 07A3E4 0017A2E4 0800398F */  lw          $25, 0x8($25)
/* 07A3E8 0017A2E8 09F82003 */  jalr        $25
/* 07A3EC 0017A2EC 00000000 */   nop
/* 07A3F0 0017A2F0 B49080AF */  sw          $0, -0x6F4C($28)
/* 07A3F4 0017A2F4 B89080AF */  sw          $0, -0x6F48($28)
/* 07A3F8 0017A2F8 9C9080AF */  sw          $0, -0x6F64($28)
/* 07A3FC 0017A2FC F2010010 */  b           .L0017AAC8$b
/* 07A400 0017A300 00000000 */   nop
jlabel .L0017A304
.L0017A304$b:
/* 07A404 0017A304 D301023C */  lui         $2, %hi(TalkCamera)
/* 07A408 0017A308 404E4224 */  addiu       $2, $2, %lo(TalkCamera)
/* 07A40C 0017A30C 009182AF */  sw          $2, -0x6F00($28)
/* 07A410 0017A310 DCF9050C */  jal         TalkMode__Fv
/* 07A414 0017A314 00000000 */   nop
/* 07A418 0017A318 A8F7050C */  jal         MainEditMode__Fv
/* 07A41C 0017A31C 00000000 */   nop
/* 07A420 0017A320 0091848F */  lw          $4, -0x6F00($28)
/* 07A424 0017A324 01000524 */  addiu       $5, $0, 0x1
/* 07A428 0017A328 B802998C */  lw          $25, 0x2B8($4)
/* 07A42C 0017A32C 0800398F */  lw          $25, 0x8($25)
/* 07A430 0017A330 09F82003 */  jalr        $25
/* 07A434 0017A334 00000000 */   nop
/* 07A438 0017A338 B49080AF */  sw          $0, -0x6F4C($28)
/* 07A43C 0017A33C B89080AF */  sw          $0, -0x6F48($28)
/* 07A440 0017A340 E1010010 */  b           .L0017AAC8$b
/* 07A444 0017A344 00000000 */   nop
jlabel .L0017A348
.L0017A348$b:
/* 07A448 0017A348 CC01023C */  lui         $2, %hi(GamePad)
/* 07A44C 0017A34C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 07A450 0017A350 00F00534 */  ori         $5, $0, 0xF000
/* 07A454 0017A354 14000624 */  addiu       $6, $0, 0x14
/* 07A458 0017A358 05000724 */  addiu       $7, $0, 0x5
/* 07A45C 0017A35C 58AD040C */  jal         SetAutoRepeat__8CGamePadFiii
/* 07A460 0017A360 00000000 */   nop
/* 07A464 0017A364 D301023C */  lui         $2, %hi(EditCamera)
/* 07A468 0017A368 40484224 */  addiu       $2, $2, %lo(EditCamera)
/* 07A46C 0017A36C 009182AF */  sw          $2, -0x6F00($28)
/* 07A470 0017A370 A8F7050C */  jal         MainEditMode__Fv
/* 07A474 0017A374 00000000 */   nop
/* 07A478 0017A378 98F7050C */  jal         EditMode__Fv
/* 07A47C 0017A37C 00000000 */   nop
/* 07A480 0017A380 0091848F */  lw          $4, -0x6F00($28)
/* 07A484 0017A384 01000524 */  addiu       $5, $0, 0x1
/* 07A488 0017A388 B802998C */  lw          $25, 0x2B8($4)
/* 07A48C 0017A38C 0800398F */  lw          $25, 0x8($25)
/* 07A490 0017A390 09F82003 */  jalr        $25
/* 07A494 0017A394 00000000 */   nop
/* 07A498 0017A398 80BF023C */  lui         $2, (0xBF800000 >> 16)
/* 07A49C 0017A39C 00608244 */  mtc1        $2, $f12
/* 07A4A0 0017A3A0 E890848F */  lw          $4, -0x6F18($28)
/* 07A4A4 0017A3A4 0091858F */  lw          $5, -0x6F00($28)
/* 07A4A8 0017A3A8 8C87060C */  jal         EditAreaClip__11CEditGroundFP7CCameraf
/* 07A4AC 0017A3AC 00000000 */   nop
/* 07A4B0 0017A3B0 A890828F */  lw          $2, -0x6F58($28)
/* 07A4B4 0017A3B4 C4014010 */  beqz        $2, .L0017AAC8$b
/* 07A4B8 0017A3B8 00000000 */   nop
/* 07A4BC 0017A3BC 9C9080AF */  sw          $0, -0x6F64($28)
/* 07A4C0 0017A3C0 0426060C */  jal         EdFadeOutCheck__Fv
/* 07A4C4 0017A3C4 00000000 */   nop
/* 07A4C8 0017A3C8 BF014010 */  beqz        $2, .L0017AAC8$b
/* 07A4CC 0017A3CC 00000000 */   nop
/* 07A4D0 0017A3D0 A890848F */  lw          $4, -0x6F58($28)
/* 07A4D4 0017A3D4 282E0070 */  paddub      $5, $0, $0
/* 07A4D8 0017A3D8 7CDE050C */  jal         RunEvent__FiP7CCamera
/* 07A4DC 0017A3DC 00000000 */   nop
/* 07A4E0 0017A3E0 00608044 */  mtc1        $0, $f12
/* 07A4E4 0017A3E4 00000000 */  nop
/* 07A4E8 0017A3E8 46630046 */  mov.s       $f13, $f12
/* 07A4EC 0017A3EC 86630046 */  mov.s       $f14, $f12
/* 07A4F0 0017A3F0 3C000424 */  addiu       $4, $0, 0x3C
/* 07A4F4 0017A3F4 C425060C */  jal         EdFadeIn__Fifff
/* 07A4F8 0017A3F8 00000000 */   nop
/* 07A4FC 0017A3FC A89080AF */  sw          $0, -0x6F58($28)
/* 07A500 0017A400 B1010010 */  b           .L0017AAC8$b
/* 07A504 0017A404 00000000 */   nop
jlabel .L0017A408
.L0017A408$b:
/* 07A508 0017A408 3091838F */  lw          $3, -0x6ED0($28)
/* 07A50C 0017A40C 9C000224 */  addiu       $2, $0, 0x9C
/* 07A510 0017A410 09006214 */  bne         $3, $2, .L0017A438
/* 07A514 0017A414 00000000 */   nop
/* 07A518 0017A418 04918CC7 */  lwc1        $f12, -0x6EFC($28)
/* 07A51C 0017A41C 981F060C */  jal         EdGetTime__Ff
/* 07A520 0017A420 00000000 */   nop
/* 07A524 0017A424 28264070 */  paddub      $4, $2, $0
/* 07A528 0017A428 D301023C */  lui         $2, %hi(interior_map_name)
/* 07A52C 0017A42C 80594524 */  addiu       $5, $2, %lo(interior_map_name)
/* 07A530 0017A430 AC13060C */  jal         EdMapJump__FiPc
/* 07A534 0017A434 00000000 */   nop
.L0017A438:
/* 07A538 0017A438 3091828F */  lw          $2, -0x6ED0($28)
/* 07A53C 0017A43C 9C004128 */  slti        $1, $2, 0x9C
/* 07A540 0017A440 03002010 */  beqz        $1, .L0017A450
/* 07A544 0017A444 00000000 */   nop
/* 07A548 0017A448 38FB040C */  jal         ReadBG__Fv
/* 07A54C 0017A44C 00000000 */   nop
.L0017A450:
/* 07A550 0017A450 3491828F */  lw          $2, -0x6ECC($28)
/* 07A554 0017A454 04004010 */  beqz        $2, .L0017A468
/* 07A558 0017A458 00000000 */   nop
/* 07A55C 0017A45C D301023C */  lui         $2, %hi(MainCamera)
/* 07A560 0017A460 40454224 */  addiu       $2, $2, %lo(MainCamera)
/* 07A564 0017A464 009182AF */  sw          $2, -0x6F00($28)
.L0017A468:
/* 07A568 0017A468 94F9050C */  jal         OpenDoorMode__Fv
/* 07A56C 0017A46C 00000000 */   nop
/* 07A570 0017A470 A8F7050C */  jal         MainEditMode__Fv
/* 07A574 0017A474 00000000 */   nop
/* 07A578 0017A478 3091828F */  lw          $2, -0x6ED0($28)
/* 07A57C 0017A47C FFFF4224 */  addiu       $2, $2, -0x1
/* 07A580 0017A480 309182AF */  sw          $2, -0x6ED0($28)
/* 07A584 0017A484 0091848F */  lw          $4, -0x6F00($28)
/* 07A588 0017A488 01000524 */  addiu       $5, $0, 0x1
/* 07A58C 0017A48C B802998C */  lw          $25, 0x2B8($4)
/* 07A590 0017A490 0800398F */  lw          $25, 0x8($25)
/* 07A594 0017A494 09F82003 */  jalr        $25
/* 07A598 0017A498 00000000 */   nop
/* 07A59C 0017A49C 3091838F */  lw          $3, -0x6ED0($28)
/* 07A5A0 0017A4A0 64000224 */  addiu       $2, $0, 0x64
/* 07A5A4 0017A4A4 0E006214 */  bne         $3, $2, .L0017A4E0
/* 07A5A8 0017A4A8 00000000 */   nop
/* 07A5AC 0017A4AC 3890828F */  lw          $2, -0x6FC8($28)
/* 07A5B0 0017A4B0 0B004004 */  bltz        $2, .L0017A4E0
/* 07A5B4 0017A4B4 00000000 */   nop
/* 07A5B8 0017A4B8 6487848F */  lw          $4, -0x789C($28)
/* 07A5BC 0017A4BC C000A527 */  addiu       $5, $29, 0xC0
/* 07A5C0 0017A4C0 A000998C */  lw          $25, 0xA0($4)
/* 07A5C4 0017A4C4 A000398F */  lw          $25, 0xA0($25)
/* 07A5C8 0017A4C8 09F82003 */  jalr        $25
/* 07A5CC 0017A4CC 00000000 */   nop
/* 07A5D0 0017A4D0 3890848F */  lw          $4, -0x6FC8($28)
/* 07A5D4 0017A4D4 C000A527 */  addiu       $5, $29, 0xC0
/* 07A5D8 0017A4D8 40C8050C */  jal         EdDoorOpenSe__FiPf
/* 07A5DC 0017A4DC 00000000 */   nop
.L0017A4E0:
/* 07A5E0 0017A4E0 3091828F */  lw          $2, -0x6ED0($28)
/* 07A5E4 0017A4E4 96004128 */  slti        $1, $2, 0x96
/* 07A5E8 0017A4E8 07002010 */  beqz        $1, .L0017A508
/* 07A5EC 0017A4EC 00000000 */   nop
/* 07A5F0 0017A4F0 0426060C */  jal         EdFadeOutCheck__Fv
/* 07A5F4 0017A4F4 00000000 */   nop
/* 07A5F8 0017A4F8 03004010 */  beqz        $2, .L0017A508
/* 07A5FC 0017A4FC 00000000 */   nop
/* 07A600 0017A500 FFFF0224 */  addiu       $2, $0, -0x1
/* 07A604 0017A504 309182AF */  sw          $2, -0x6ED0($28)
.L0017A508:
/* 07A608 0017A508 3091828F */  lw          $2, -0x6ED0($28)
/* 07A60C 0017A50C 6E014104 */  bgez        $2, .L0017AAC8$b
/* 07A610 0017A510 00000000 */   nop
/* 07A614 0017A514 309180AF */  sw          $0, -0x6ED0($28)
/* 07A618 0017A518 0C000224 */  addiu       $2, $0, 0xC
/* 07A61C 0017A51C 608782AF */  sw          $2, -0x78A0($28)
/* 07A620 0017A520 B4C6050C */  jal         EdStopSoundSrc__Fv
/* 07A624 0017A524 00000000 */   nop
/* 07A628 0017A528 90828CC7 */  lwc1        $f12, -0x7D70($28)
/* 07A62C 0017A52C 84C5050C */  jal         EdSetAmbientVol__Ff
/* 07A630 0017A530 00000000 */   nop
/* 07A634 0017A534 D464050C */  jal         SndStep__Fv
/* 07A638 0017A538 00000000 */   nop
/* 07A63C 0017A53C 4467050C */  jal         SndGetBgmNo__Fv
/* 07A640 0017A540 00000000 */   nop
/* 07A644 0017A544 409082AF */  sw          $2, -0x6FC0($28)
/* 07A648 0017A548 9C86838F */  lw          $3, -0x7964($28)
/* 07A64C 0017A54C 05000224 */  addiu       $2, $0, 0x5
/* 07A650 0017A550 02006214 */  bne         $3, $2, .L0017A55C
/* 07A654 0017A554 00000000 */   nop
/* 07A658 0017A558 409080AF */  sw          $0, -0x6FC0($28)
.L0017A55C:
/* 07A65C 0017A55C 2491828F */  lw          $2, -0x6EDC($28)
/* 07A660 0017A560 43100200 */  sra         $2, $2, 1
/* 07A664 0017A564 249182AF */  sw          $2, -0x6EDC($28)
/* 07A668 0017A568 2491828F */  lw          $2, -0x6EDC($28)
/* 07A66C 0017A56C 0300401C */  bgtz        $2, .L0017A57C
/* 07A670 0017A570 00000000 */   nop
/* 07A674 0017A574 01000224 */  addiu       $2, $0, 0x1
/* 07A678 0017A578 249182AF */  sw          $2, -0x6EDC($28)
.L0017A57C:
/* 07A67C 0017A57C D401013C */  lui         $1, %hi(EdEventInfo + 0x30)
/* 07A680 0017A580 00D2228C */  lw          $2, %lo(EdEventInfo + 0x30)($1)
/* 07A684 0017A584 03004010 */  beqz        $2, .L0017A594
/* 07A688 0017A588 00000000 */   nop
/* 07A68C 0017A58C 1467050C */  jal         SndBgmFadeOutStop__Fv
/* 07A690 0017A590 00000000 */   nop
.L0017A594:
/* 07A694 0017A594 D464050C */  jal         SndStep__Fv
/* 07A698 0017A598 00000000 */   nop
/* 07A69C 0017A59C C003A0AF */  sw          $0, 0x3C0($29)
/* 07A6A0 0017A5A0 C403A0AF */  sw          $0, 0x3C4($29)
/* 07A6A4 0017A5A4 00280224 */  addiu       $2, $0, 0x2800
/* 07A6A8 0017A5A8 C803A2AF */  sw          $2, 0x3C8($29)
/* 07A6AC 0017A5AC 000E0224 */  addiu       $2, $0, 0xE00
/* 07A6B0 0017A5B0 CC03A2AF */  sw          $2, 0x3CC($29)
/* 07A6B4 0017A5B4 C003A427 */  addiu       $4, $29, 0x3C0
/* 07A6B8 0017A5B8 282E0070 */  paddub      $5, $0, $0
/* 07A6BC 0017A5BC 28360070 */  paddub      $6, $0, $0
/* 07A6C0 0017A5C0 283E0070 */  paddub      $7, $0, $0
/* 07A6C4 0017A5C4 80000824 */  addiu       $8, $0, 0x80
/* 07A6C8 0017A5C8 9CBE040C */  jal         MGFillBox__FRC8CRect_i_UcUcUcUc
/* 07A6CC 0017A5CC 00000000 */   nop
/* 07A6D0 0017A5D0 40B4040C */  jal         MGEndFrame__Fv
/* 07A6D4 0017A5D4 00000000 */   nop
/* 07A6D8 0017A5D8 28860070 */  paddub      $16, $0, $0
/* 07A6DC 0017A5DC 07000010 */  b           .L0017A5FC
/* 07A6E0 0017A5E0 00000000 */   nop
.L0017A5E4:
/* 07A6E4 0017A5E4 36000526 */  addiu       $5, $16, 0x36
/* 07A6E8 0017A5E8 C701023C */  lui         $2, %hi(TexManager)
/* 07A6EC 0017A5EC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 07A6F0 0017A5F0 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 07A6F4 0017A5F4 00000000 */   nop
/* 07A6F8 0017A5F8 01001026 */  addiu       $16, $16, 0x1
.L0017A5FC:
/* 07A6FC 0017A5FC 0A00022A */  slti        $2, $16, 0xA
/* 07A700 0017A600 F8FF4014 */  bnez        $2, .L0017A5E4
/* 07A704 0017A604 00000000 */   nop
/* 07A708 0017A608 C701023C */  lui         $2, %hi(TexManager)
/* 07A70C 0017A60C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 07A710 0017A610 FCCD040C */  jal         CleanUpBuffer__15CTextureManagerFv
/* 07A714 0017A614 00000000 */   nop
.L0017A618:
/* 07A718 0017A618 8CFB040C */  jal         ReadBGSync__Fv
/* 07A71C 0017A61C 00000000 */   nop
/* 07A720 0017A620 FDFF4014 */  bnez        $2, .L0017A618
/* 07A724 0017A624 00000000 */   nop
/* 07A728 0017A628 28260070 */  paddub      $4, $0, $0
/* 07A72C 0017A62C C04B040C */  jal         sceGsSyncV
/* 07A730 0017A630 00000000 */   nop
/* 07A734 0017A634 D301023C */  lui         $2, %hi(EdVillagerInfo)
/* 07A738 0017A638 D0294424 */  addiu       $4, $2, %lo(EdVillagerInfo)
/* 07A73C 0017A63C 04918CC7 */  lwc1        $f12, -0x6EFC($28)
/* 07A740 0017A640 6090858F */  lw          $5, -0x6FA0($28)
/* 07A744 0017A644 F815060C */  jal         EdSelectVillager__FP13VILLAGER_INFOfP13EDIT_MAP_INFO
/* 07A748 0017A648 00000000 */   nop
/* 07A74C 0017A64C 04918CC7 */  lwc1        $f12, -0x6EFC($28)
/* 07A750 0017A650 D301023C */  lui         $2, %hi(interior_map_name)
/* 07A754 0017A654 80594424 */  addiu       $4, $2, %lo(interior_map_name)
/* 07A758 0017A658 8C6F060C */  jal         EditInInit__FfPc
/* 07A75C 0017A65C 00000000 */   nop
/* 07A760 0017A660 64B3040C */  jal         MGBeginFrame__Fv
/* 07A764 0017A664 00000000 */   nop
/* 07A768 0017A668 D003A0AF */  sw          $0, 0x3D0($29)
/* 07A76C 0017A66C D403A0AF */  sw          $0, 0x3D4($29)
/* 07A770 0017A670 00280224 */  addiu       $2, $0, 0x2800
/* 07A774 0017A674 D803A2AF */  sw          $2, 0x3D8($29)
/* 07A778 0017A678 000E0224 */  addiu       $2, $0, 0xE00
/* 07A77C 0017A67C DC03A2AF */  sw          $2, 0x3DC($29)
/* 07A780 0017A680 D003A427 */  addiu       $4, $29, 0x3D0
/* 07A784 0017A684 282E0070 */  paddub      $5, $0, $0
/* 07A788 0017A688 28360070 */  paddub      $6, $0, $0
/* 07A78C 0017A68C 283E0070 */  paddub      $7, $0, $0
/* 07A790 0017A690 80000824 */  addiu       $8, $0, 0x80
/* 07A794 0017A694 9CBE040C */  jal         MGFillBox__FRC8CRect_i_UcUcUcUc
/* 07A798 0017A698 00000000 */   nop
/* 07A79C 0017A69C DB01023C */  lui         $2, %hi(ItemVolumeStep)
/* 07A7A0 0017A6A0 10BC4424 */  addiu       $4, $2, %lo(ItemVolumeStep)
/* 07A7A4 0017A6A4 C8D5080C */  jal         CheckItemVolume__13CMenuItemStepFv
/* 07A7A8 0017A6A8 00000000 */   nop
/* 07A7AC 0017A6AC 28160070 */  paddub      $2, $0, $0
/* 07A7B0 0017A6B0 3D040010 */  b           .L0017B7A8
/* 07A7B4 0017A6B4 00000000 */   nop
jlabel .L0017A6B8
.L0017A6B8$b:
/* 07A7B8 0017A6B8 A843080C */  jal         EditMenuLoop__Fv
/* 07A7BC 0017A6BC 00000000 */   nop
/* 07A7C0 0017A6C0 01014010 */  beqz        $2, .L0017AAC8$b
/* 07A7C4 0017A6C4 00000000 */   nop
/* 07A7C8 0017A6C8 04000224 */  addiu       $2, $0, 0x4
/* 07A7CC 0017A6CC 608782AF */  sw          $2, -0x78A0($28)
/* 07A7D0 0017A6D0 FFFF0424 */  addiu       $4, $0, -0x1
/* 07A7D4 0017A6D4 6C8784AF */  sw          $4, -0x7894($28)
/* 07A7D8 0017A6D8 D201013C */  lui         $1, %hi(EditMenuStatus)
/* 07A7DC 0017A6DC D09B238C */  lw          $3, %lo(EditMenuStatus)($1)
/* 07A7E0 0017A6E0 05000224 */  addiu       $2, $0, 0x5
/* 07A7E4 0017A6E4 10006210 */  beq         $3, $2, .L0017A728
/* 07A7E8 0017A6E8 00000000 */   nop
/* 07A7EC 0017A6EC 03000224 */  addiu       $2, $0, 0x3
/* 07A7F0 0017A6F0 0A006210 */  beq         $3, $2, .L0017A71C
/* 07A7F4 0017A6F4 00000000 */   nop
/* 07A7F8 0017A6F8 03006010 */  beqz        $3, .L0017A708
/* 07A7FC 0017A6FC 00000000 */   nop
/* 07A800 0017A700 0F000010 */  b           .L0017A740
/* 07A804 0017A704 00000000 */   nop
.L0017A708:
/* 07A808 0017A708 D201013C */  lui         $1, %hi(EditMenuStatus + 0x4)
/* 07A80C 0017A70C D49B228C */  lw          $2, %lo(EditMenuStatus + 0x4)($1)
/* 07A810 0017A710 6C8782AF */  sw          $2, -0x7894($28)
/* 07A814 0017A714 0A000010 */  b           .L0017A740
/* 07A818 0017A718 00000000 */   nop
.L0017A71C:
/* 07A81C 0017A71C 6C8784AF */  sw          $4, -0x7894($28)
/* 07A820 0017A720 07000010 */  b           .L0017A740
/* 07A824 0017A724 00000000 */   nop
.L0017A728:
/* 07A828 0017A728 D201013C */  lui         $1, %hi(EditMenuStatus + 0x10)
/* 07A82C 0017A72C E09B228C */  lw          $2, %lo(EditMenuStatus + 0x10)($1)
/* 07A830 0017A730 C8004424 */  addiu       $4, $2, 0xC8
/* 07A834 0017A734 282E0070 */  paddub      $5, $0, $0
/* 07A838 0017A738 DCDE050C */  jal         FadeOutToEvent__Fii
/* 07A83C 0017A73C 00000000 */   nop
.L0017A740:
/* 07A840 0017A740 CCCB050C */  jal         EdExitMenu__Fv
/* 07A844 0017A744 00000000 */   nop
/* 07A848 0017A748 28160070 */  paddub      $2, $0, $0
/* 07A84C 0017A74C 16040010 */  b           .L0017B7A8
/* 07A850 0017A750 00000000 */   nop
jlabel .L0017A754
.L0017A754$b:
/* 07A854 0017A754 A0B8040C */  jal         GetVif1Packet__Fv
/* 07A858 0017A758 00000000 */   nop
/* 07A85C 0017A75C C701033C */  lui         $3, %hi(TexManager)
/* 07A860 0017A760 70586424 */  addiu       $4, $3, %lo(TexManager)
/* 07A864 0017A764 282E4070 */  paddub      $5, $2, $0
/* 07A868 0017A768 10000624 */  addiu       $6, $0, 0x10
/* 07A86C 0017A76C 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 07A870 0017A770 00000000 */   nop
/* 07A874 0017A774 FFFF0224 */  addiu       $2, $0, -0x1
/* 07A878 0017A778 CC9482AF */  sw          $2, -0x6B34($28)
/* 07A87C 0017A77C 6CF7050C */  jal         EditPartsObjectOnOff__Fv
/* 07A880 0017A780 00000000 */   nop
/* 07A884 0017A784 E0CB050C */  jal         EdMenuMode__Fv
/* 07A888 0017A788 00000000 */   nop
/* 07A88C 0017A78C CE004010 */  beqz        $2, .L0017AAC8$b
/* 07A890 0017A790 00000000 */   nop
/* 07A894 0017A794 01000224 */  addiu       $2, $0, 0x1
/* 07A898 0017A798 608782AF */  sw          $2, -0x78A0($28)
/* 07A89C 0017A79C CCCB050C */  jal         EdExitMenu__Fv
/* 07A8A0 0017A7A0 00000000 */   nop
/* 07A8A4 0017A7A4 CC94848F */  lw          $4, -0x6B34($28)
/* 07A8A8 0017A7A8 0D008004 */  bltz        $4, .L0017A7E0
/* 07A8AC 0017A7AC 00000000 */   nop
/* 07A8B0 0017A7B0 FFFF0524 */  addiu       $5, $0, -0x1
/* 07A8B4 0017A7B4 4C07050C */  jal         MapJump__Fii
/* 07A8B8 0017A7B8 00000000 */   nop
/* 07A8BC 0017A7BC CC94828F */  lw          $2, -0x6B34($28)
/* 07A8C0 0017A7C0 D401013C */  lui         $1, %hi(EdEventInfo + 0x400)
/* 07A8C4 0017A7C4 D0D522AC */  sw          $2, %lo(EdEventInfo + 0x400)($1)
/* 07A8C8 0017A7C8 02000424 */  addiu       $4, $0, 0x2
/* 07A8CC 0017A7CC 0091858F */  lw          $5, -0x6F00($28)
/* 07A8D0 0017A7D0 B0DE050C */  jal         RunSystemEvent__FiP7CCamera
/* 07A8D4 0017A7D4 00000000 */   nop
/* 07A8D8 0017A7D8 FFFF0224 */  addiu       $2, $0, -0x1
/* 07A8DC 0017A7DC CC9482AF */  sw          $2, -0x6B34($28)
.L0017A7E0:
/* 07A8E0 0017A7E0 D201023C */  lui         $2, %hi(EdVillager)
/* 07A8E4 0017A7E4 905B4424 */  addiu       $4, $2, %lo(EdVillager)
/* 07A8E8 0017A7E8 D301023C */  lui         $2, %hi(EdVillagerInfo)
/* 07A8EC 0017A7EC D0294524 */  addiu       $5, $2, %lo(EdVillagerInfo)
/* 07A8F0 0017A7F0 E890868F */  lw          $6, -0x6F18($28)
/* 07A8F4 0017A7F4 D818060C */  jal         EdInitVillagerOnOff__FP12CNPCharacterP13VILLAGER_INFOP11CEditGround
/* 07A8F8 0017A7F8 00000000 */   nop
/* 07A8FC 0017A7FC 28160070 */  paddub      $2, $0, $0
/* 07A900 0017A800 E9030010 */  b           .L0017B7A8
/* 07A904 0017A804 00000000 */   nop
jlabel .L0017A808
.L0017A808$b:
/* 07A908 0017A808 4091828F */  lw          $2, -0x6EC0($28)
/* 07A90C 0017A80C 8C004128 */  slti        $1, $2, 0x8C
/* 07A910 0017A810 03002010 */  beqz        $1, .L0017A820
/* 07A914 0017A814 00000000 */   nop
/* 07A918 0017A818 38FB040C */  jal         ReadBG__Fv
/* 07A91C 0017A81C 00000000 */   nop
.L0017A820:
/* 07A920 0017A820 28860070 */  paddub      $16, $0, $0
/* 07A924 0017A824 18000010 */  b           .L0017A888
/* 07A928 0017A828 00000000 */   nop
.L0017A82C:
/* 07A92C 0017A82C 40111000 */  sll         $2, $16, 5
/* 07A930 0017A830 21185000 */  addu        $3, $2, $16
/* 07A934 0017A834 80100300 */  sll         $2, $3, 2
/* 07A938 0017A838 21106200 */  addu        $2, $3, $2
/* 07A93C 0017A83C 40890200 */  sll         $17, $2, 5
/* 07A940 0017A840 D201023C */  lui         $2, %hi(EdVillager)
/* 07A944 0017A844 905B4224 */  addiu       $2, $2, %lo(EdVillager)
/* 07A948 0017A848 21905100 */  addu        $18, $2, $17
/* 07A94C 0017A84C 28264072 */  paddub      $4, $18, $0
/* 07A950 0017A850 9C59050C */  jal         CheckDraw__12CNPCharacterFv
/* 07A954 0017A854 00000000 */   nop
/* 07A958 0017A858 06004010 */  beqz        $2, .L0017A874
/* 07A95C 0017A85C 00000000 */   nop
/* 07A960 0017A860 28264072 */  paddub      $4, $18, $0
/* 07A964 0017A864 EC57050C */  jal         Step__12CNPCharacterFv
/* 07A968 0017A868 00000000 */   nop
/* 07A96C 0017A86C 05000010 */  b           .L0017A884
/* 07A970 0017A870 00000000 */   nop
.L0017A874:
/* 07A974 0017A874 D201023C */  lui         $2, %hi(EdVillager + 0x146C)
/* 07A978 0017A878 FC6F4224 */  addiu       $2, $2, %lo(EdVillager + 0x146C)
/* 07A97C 0017A87C 21105100 */  addu        $2, $2, $17
/* 07A980 0017A880 000040AC */  sw          $0, 0x0($2)
.L0017A884:
/* 07A984 0017A884 01001026 */  addiu       $16, $16, 0x1
.L0017A888:
/* 07A988 0017A888 0A00022A */  slti        $2, $16, 0xA
/* 07A98C 0017A88C E7FF4014 */  bnez        $2, .L0017A82C
/* 07A990 0017A890 00000000 */   nop
/* 07A994 0017A894 4091838F */  lw          $3, -0x6EC0($28)
/* 07A998 0017A898 8C000224 */  addiu       $2, $0, 0x8C
/* 07A99C 0017A89C 11006214 */  bne         $3, $2, .L0017A8E4
/* 07A9A0 0017A8A0 00000000 */   nop
/* 07A9A4 0017A8A4 D201013C */  lui         $1, %hi(EdVillagerBuffer + 0x8)
/* 07A9A8 0017A8A8 68B320AC */  sw          $0, %lo(EdVillagerBuffer + 0x8)($1)
/* 07A9AC 0017A8AC 30FB040C */  jal         StartReadBG__Fv
/* 07A9B0 0017A8B0 00000000 */   nop
/* 07A9B4 0017A8B4 D301023C */  lui         $2, %hi(EdVillagerInfo)
/* 07A9B8 0017A8B8 D0294424 */  addiu       $4, $2, %lo(EdVillagerInfo)
/* 07A9BC 0017A8BC 04918CC7 */  lwc1        $f12, -0x6EFC($28)
/* 07A9C0 0017A8C0 6090858F */  lw          $5, -0x6FA0($28)
/* 07A9C4 0017A8C4 F815060C */  jal         EdSelectVillager__FP13VILLAGER_INFOfP13EDIT_MAP_INFO
/* 07A9C8 0017A8C8 00000000 */   nop
/* 07A9CC 0017A8CC D301023C */  lui         $2, %hi(EdVillagerInfo)
/* 07A9D0 0017A8D0 D0294424 */  addiu       $4, $2, %lo(EdVillagerInfo)
/* 07A9D4 0017A8D4 E890858F */  lw          $5, -0x6F18($28)
/* 07A9D8 0017A8D8 2490868F */  lw          $6, -0x6FDC($28)
/* 07A9DC 0017A8DC D017060C */  jal         EdInitVilager__FP13VILLAGER_INFOP11CEditGroundP1
/* 07A9E0 0017A8E0 00000000 */   nop
.L0017A8E4:
/* 07A9E4 0017A8E4 D301023C */  lui         $2, %hi(MainCamera)
/* 07A9E8 0017A8E8 40454224 */  addiu       $2, $2, %lo(MainCamera)
/* 07A9EC 0017A8EC 009182AF */  sw          $2, -0x6F00($28)
/* 07A9F0 0017A8F0 00A08044 */  mtc1        $0, $f20
/* 07A9F4 0017A8F4 6487848F */  lw          $4, -0x789C($28)
/* 07A9F8 0017A8F8 A000998C */  lw          $25, 0xA0($4)
/* 07A9FC 0017A8FC 6800398F */  lw          $25, 0x68($25)
/* 07AA00 0017A900 09F82003 */  jalr        $25
/* 07AA04 0017A904 00000000 */   nop
/* 07AA08 0017A908 040054E4 */  swc1        $f20, 0x4($2)
/* 07AA0C 0017A90C 6487838F */  lw          $3, -0x789C($28)
/* 07AA10 0017A910 680C60AC */  sw          $0, 0xC68($3)
/* 07AA14 0017A914 640C60AC */  sw          $0, 0xC64($3)
/* 07AA18 0017A918 80BF023C */  lui         $2, (0xBF800000 >> 16)
/* 07AA1C 0017A91C 600C62AC */  sw          $2, 0xC60($3)
/* 07AA20 0017A920 6487848F */  lw          $4, -0x789C($28)
/* 07AA24 0017A924 A000998C */  lw          $25, 0xA0($4)
/* 07AA28 0017A928 0800398F */  lw          $25, 0x8($25)
/* 07AA2C 0017A92C 09F82003 */  jalr        $25
/* 07AA30 0017A930 00000000 */   nop
/* 07AA34 0017A934 6487848F */  lw          $4, -0x789C($28)
/* 07AA38 0017A938 282E0070 */  paddub      $5, $0, $0
/* 07AA3C 0017A93C A000998C */  lw          $25, 0xA0($4)
/* 07AA40 0017A940 9400398F */  lw          $25, 0x94($25)
/* 07AA44 0017A944 09F82003 */  jalr        $25
/* 07AA48 0017A948 00000000 */   nop
/* 07AA4C 0017A94C 6487848F */  lw          $4, -0x789C($28)
/* 07AA50 0017A950 A000998C */  lw          $25, 0xA0($4)
/* 07AA54 0017A954 9000398F */  lw          $25, 0x90($25)
/* 07AA58 0017A958 09F82003 */  jalr        $25
/* 07AA5C 0017A95C 00000000 */   nop
/* 07AA60 0017A960 A8F7050C */  jal         MainEditMode__Fv
/* 07AA64 0017A964 00000000 */   nop
/* 07AA68 0017A968 4091828F */  lw          $2, -0x6EC0($28)
/* 07AA6C 0017A96C FFFF4224 */  addiu       $2, $2, -0x1
/* 07AA70 0017A970 409182AF */  sw          $2, -0x6EC0($28)
/* 07AA74 0017A974 0091848F */  lw          $4, -0x6F00($28)
/* 07AA78 0017A978 01000524 */  addiu       $5, $0, 0x1
/* 07AA7C 0017A97C B802998C */  lw          $25, 0x2B8($4)
/* 07AA80 0017A980 0800398F */  lw          $25, 0x8($25)
/* 07AA84 0017A984 09F82003 */  jalr        $25
/* 07AA88 0017A988 00000000 */   nop
/* 07AA8C 0017A98C 4091828F */  lw          $2, -0x6EC0($28)
/* 07AA90 0017A990 4D004104 */  bgez        $2, .L0017AAC8$b
/* 07AA94 0017A994 00000000 */   nop
.L0017A998:
/* 07AA98 0017A998 8CFB040C */  jal         ReadBGSync__Fv
/* 07AA9C 0017A99C 00000000 */   nop
/* 07AAA0 0017A9A0 FDFF4014 */  bnez        $2, .L0017A998
/* 07AAA4 0017A9A4 00000000 */   nop
/* 07AAA8 0017A9A8 36001024 */  addiu       $16, $0, 0x36
/* 07AAAC 0017A9AC 07000010 */  b           .L0017A9CC
/* 07AAB0 0017A9B0 00000000 */   nop
.L0017A9B4:
/* 07AAB4 0017A9B4 C701023C */  lui         $2, %hi(TexManager)
/* 07AAB8 0017A9B8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 07AABC 0017A9BC 282E0072 */  paddub      $5, $16, $0
/* 07AAC0 0017A9C0 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 07AAC4 0017A9C4 00000000 */   nop
/* 07AAC8 0017A9C8 01001026 */  addiu       $16, $16, 0x1
.L0017A9CC:
/* 07AACC 0017A9CC 4000022A */  slti        $2, $16, 0x40
/* 07AAD0 0017A9D0 F8FF4014 */  bnez        $2, .L0017A9B4
/* 07AAD4 0017A9D4 00000000 */   nop
/* 07AAD8 0017A9D8 C701023C */  lui         $2, %hi(TexManager)
/* 07AADC 0017A9DC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 07AAE0 0017A9E0 FCCD040C */  jal         CleanUpBuffer__15CTextureManagerFv
/* 07AAE4 0017A9E4 00000000 */   nop
/* 07AAE8 0017A9E8 28860070 */  paddub      $16, $0, $0
/* 07AAEC 0017A9EC 15000010 */  b           .L0017AA44
/* 07AAF0 0017A9F0 00000000 */   nop
.L0017A9F4:
/* 07AAF4 0017A9F4 28260072 */  paddub      $4, $16, $0
/* 07AAF8 0017A9F8 18FB040C */  jal         GetReadBGFile__Fi
/* 07AAFC 0017A9FC 00000000 */   nop
/* 07AB00 0017AA00 0F004010 */  beqz        $2, .L0017AA40
/* 07AB04 0017AA04 00000000 */   nop
/* 07AB08 0017AA08 8C00448C */  lw          $4, 0x8C($2)
/* 07AB0C 0017AA0C 40111000 */  sll         $2, $16, 5
/* 07AB10 0017AA10 21185000 */  addu        $3, $2, $16
/* 07AB14 0017AA14 80100300 */  sll         $2, $3, 2
/* 07AB18 0017AA18 21106200 */  addu        $2, $3, $2
/* 07AB1C 0017AA1C 40190200 */  sll         $3, $2, 5
/* 07AB20 0017AA20 D201023C */  lui         $2, %hi(EdVillager)
/* 07AB24 0017AA24 905B4224 */  addiu       $2, $2, %lo(EdVillager)
/* 07AB28 0017AA28 21304300 */  addu        $6, $2, $3
/* 07AB2C 0017AA2C 4814C524 */  addiu       $5, $6, 0x1448
/* 07AB30 0017AA30 D201023C */  lui         $2, %hi(EdVillagerBuffer)
/* 07AB34 0017AA34 60B34724 */  addiu       $7, $2, %lo(EdVillagerBuffer)
/* 07AB38 0017AA38 3018060C */  jal         EdLoadVillager__FPUiPcP12CNPCharacterP14CDataAlloc2_1_
/* 07AB3C 0017AA3C 00000000 */   nop
.L0017AA40:
/* 07AB40 0017AA40 01001026 */  addiu       $16, $16, 0x1
.L0017AA44:
/* 07AB44 0017AA44 0A00022A */  slti        $2, $16, 0xA
/* 07AB48 0017AA48 EAFF4014 */  bnez        $2, .L0017A9F4
/* 07AB4C 0017AA4C 00000000 */   nop
/* 07AB50 0017AA50 D201023C */  lui         $2, %hi(EdVillager)
/* 07AB54 0017AA54 905B4424 */  addiu       $4, $2, %lo(EdVillager)
/* 07AB58 0017AA58 D301023C */  lui         $2, %hi(EdVillagerInfo)
/* 07AB5C 0017AA5C D0294524 */  addiu       $5, $2, %lo(EdVillagerInfo)
/* 07AB60 0017AA60 E890868F */  lw          $6, -0x6F18($28)
/* 07AB64 0017AA64 283E0070 */  paddub      $7, $0, $0
/* 07AB68 0017AA68 4419060C */  jal         EdInitVilagerPosition__FP12CNPCharacterP13VILLAGER_INFOP11CEditGroundPA4_f
/* 07AB6C 0017AA6C 00000000 */   nop
/* 07AB70 0017AA70 409180AF */  sw          $0, -0x6EC0($28)
/* 07AB74 0017AA74 01000224 */  addiu       $2, $0, 0x1
/* 07AB78 0017AA78 608782AF */  sw          $2, -0x78A0($28)
/* 07AB7C 0017AA7C 00608044 */  mtc1        $0, $f12
/* 07AB80 0017AA80 00000000 */  nop
/* 07AB84 0017AA84 46630046 */  mov.s       $f13, $f12
/* 07AB88 0017AA88 86630046 */  mov.s       $f14, $f12
/* 07AB8C 0017AA8C 40000424 */  addiu       $4, $0, 0x40
/* 07AB90 0017AA90 C425060C */  jal         EdFadeIn__Fifff
/* 07AB94 0017AA94 00000000 */   nop
/* 07AB98 0017AA98 0B000010 */  b           .L0017AAC8$b
/* 07AB9C 0017AA9C 00000000 */   nop
jlabel .L0017AAA0
.L0017AAA0$b:
/* 07ABA0 0017AAA0 B89080AF */  sw          $0, -0x6F48($28)
/* 07ABA4 0017AAA4 01000424 */  addiu       $4, $0, 0x1
/* 07ABA8 0017AAA8 B4B5040C */  jal         MGFlipWaitVSync__Fi
/* 07ABAC 0017AAAC 00000000 */   nop
/* 07ABB0 0017AAB0 80BF023C */  lui         $2, (0xBF800000 >> 16)
/* 07ABB4 0017AAB4 00608244 */  mtc1        $2, $f12
/* 07ABB8 0017AAB8 E890848F */  lw          $4, -0x6F18($28)
/* 07ABBC 0017AABC 0091858F */  lw          $5, -0x6F00($28)
/* 07ABC0 0017AAC0 8C87060C */  jal         EditAreaClip__11CEditGroundFP7CCameraf
/* 07ABC4 0017AAC4 00000000 */   nop
jlabel .L0017AAC8
.L0017AAC8$b:
/* 07ABC8 0017AAC8 0091848F */  lw          $4, -0x6F00($28)
/* 07ABCC 0017AACC D000A527 */  addiu       $5, $29, 0xD0
/* 07ABD0 0017AAD0 F890040C */  jal         GetCameraMatrix__7CCameraFPA4_f
/* 07ABD4 0017AAD4 00000000 */   nop
/* 07ABD8 0017AAD8 0091848F */  lw          $4, -0x6F00($28)
/* 07ABDC 0017AADC 1001A527 */  addiu       $5, $29, 0x110
/* 07ABE0 0017AAE0 9C91040C */  jal         GetPos__7CCameraFPf
/* 07ABE4 0017AAE4 00000000 */   nop
/* 07ABE8 0017AAE8 D000A427 */  addiu       $4, $29, 0xD0
/* 07ABEC 0017AAEC 1001A527 */  addiu       $5, $29, 0x110
/* 07ABF0 0017AAF0 E8B7040C */  jal         MGSetViewMatrix__FPA4_fPf
/* 07ABF4 0017AAF4 00000000 */   nop
/* 07ABF8 0017AAF8 6087838F */  lw          $3, -0x78A0($28)
/* 07ABFC 0017AAFC 04000224 */  addiu       $2, $0, 0x4
/* 07AC00 0017AB00 1A006210 */  beq         $3, $2, .L0017AB6C
/* 07AC04 0017AB04 00000000 */   nop
/* 07AC08 0017AB08 05000224 */  addiu       $2, $0, 0x5
/* 07AC0C 0017AB0C 17006210 */  beq         $3, $2, .L0017AB6C
/* 07AC10 0017AB10 00000000 */   nop
/* 07AC14 0017AB14 0A000224 */  addiu       $2, $0, 0xA
/* 07AC18 0017AB18 14006210 */  beq         $3, $2, .L0017AB6C
/* 07AC1C 0017AB1C 00000000 */   nop
/* 07AC20 0017AB20 D890828F */  lw          $2, -0x6F28($28)
/* 07AC24 0017AB24 09004018 */  blez        $2, .L0017AB4C
/* 07AC28 0017AB28 00000000 */   nop
/* 07AC2C 0017AB2C 80BF023C */  lui         $2, (0xBF800000 >> 16)
/* 07AC30 0017AB30 00608244 */  mtc1        $2, $f12
/* 07AC34 0017AB34 E890848F */  lw          $4, -0x6F18($28)
/* 07AC38 0017AB38 0091858F */  lw          $5, -0x6F00($28)
/* 07AC3C 0017AB3C 8C87060C */  jal         EditAreaClip__11CEditGroundFP7CCameraf
/* 07AC40 0017AB40 00000000 */   nop
/* 07AC44 0017AB44 09000010 */  b           .L0017AB6C
/* 07AC48 0017AB48 00000000 */   nop
.L0017AB4C:
/* 07AC4C 0017AB4C 204E0224 */  addiu       $2, $0, 0x4E20
/* 07AC50 0017AB50 00008244 */  mtc1        $2, $f0
/* 07AC54 0017AB54 00000000 */  nop
/* 07AC58 0017AB58 20038046 */  cvt.s.w     $f12, $f0
/* 07AC5C 0017AB5C E890848F */  lw          $4, -0x6F18($28)
/* 07AC60 0017AB60 0091858F */  lw          $5, -0x6F00($28)
/* 07AC64 0017AB64 8C87060C */  jal         EditAreaClip__11CEditGroundFP7CCameraf
/* 07AC68 0017AB68 00000000 */   nop
.L0017AB6C:
/* 07AC6C 0017AB6C 6087848F */  lw          $4, -0x78A0($28)
/* 07AC70 0017AB70 1100812C */  sltiu       $1, $4, 0x11
/* 07AC74 0017AB74 27002010 */  beqz        $1, .L0017AC14$b
/* 07AC78 0017AB78 00000000 */   nop
/* 07AC7C 0017AB7C 2A00023C */  lui         $2, %hi(LIT_1612)
/* 07AC80 0017AB80 F0AA4324 */  addiu       $3, $2, %lo(LIT_1612)
/* 07AC84 0017AB84 80100400 */  sll         $2, $4, 2
/* 07AC88 0017AB88 21104300 */  addu        $2, $2, $3
/* 07AC8C 0017AB8C 0000428C */  lw          $2, 0x0($2)
/* 07AC90 0017AB90 08004000 */  jr          $2
/* 07AC94 0017AB94 00000000 */   nop
jlabel .L0017AB98
.L0017AB98$b:
/* 07AC98 0017AB98 C49080AF */  sw          $0, -0x6F3C($28)
/* 07AC9C 0017AB9C 01000224 */  addiu       $2, $0, 0x1
/* 07ACA0 0017ABA0 C89082AF */  sw          $2, -0x6F38($28)
/* 07ACA4 0017ABA4 CC9080AF */  sw          $0, -0x6F34($28)
/* 07ACA8 0017ABA8 BC9082AF */  sw          $2, -0x6F44($28)
/* 07ACAC 0017ABAC C09082AF */  sw          $2, -0x6F40($28)
/* 07ACB0 0017ABB0 F4ED050C */  jal         MainDraw__Fv
/* 07ACB4 0017ABB4 00000000 */   nop
/* 07ACB8 0017ABB8 16000010 */  b           .L0017AC14$b
/* 07ACBC 0017ABBC 00000000 */   nop
jlabel .L0017ABC0
.L0017ABC0$b:
/* 07ACC0 0017ABC0 01000224 */  addiu       $2, $0, 0x1
/* 07ACC4 0017ABC4 C49082AF */  sw          $2, -0x6F3C($28)
/* 07ACC8 0017ABC8 C89080AF */  sw          $0, -0x6F38($28)
/* 07ACCC 0017ABCC CC9082AF */  sw          $2, -0x6F34($28)
/* 07ACD0 0017ABD0 BC9080AF */  sw          $0, -0x6F44($28)
/* 07ACD4 0017ABD4 D890828F */  lw          $2, -0x6F28($28)
/* 07ACD8 0017ABD8 0B004128 */  slti        $1, $2, 0xB
/* 07ACDC 0017ABDC 02002010 */  beqz        $1, .L0017ABE8$b
/* 07ACE0 0017ABE0 00000000 */   nop
/* 07ACE4 0017ABE4 C09080AF */  sw          $0, -0x6F40($28)
jlabel .L0017ABE8
.L0017ABE8$b:
/* 07ACE8 0017ABE8 F4ED050C */  jal         MainDraw__Fv
/* 07ACEC 0017ABEC 00000000 */   nop
/* 07ACF0 0017ABF0 08000010 */  b           .L0017AC14$b
/* 07ACF4 0017ABF4 00000000 */   nop
jlabel .L0017ABF8
.L0017ABF8$b:
/* 07ACF8 0017ABF8 D201023C */  lui         $2, %hi(EditNameMes)
/* 07ACFC 0017ABFC 50144424 */  addiu       $4, $2, %lo(EditNameMes)
/* 07AD00 0017AC00 FFFF0524 */  addiu       $5, $0, -0x1
/* 07AD04 0017AC04 5441050C */  jal         MakeMesWin__6ClsMesFi
/* 07AD08 0017AC08 00000000 */   nop
/* 07AD0C 0017AC0C 1826060C */  jal         EdFadeInOut__Fv
/* 07AD10 0017AC10 00000000 */   nop
jlabel .L0017AC14
.L0017AC14$b:
/* 07AD14 0017AC14 D0DF050C */  jal         CheckKeyLock__Fv
/* 07AD18 0017AC18 00000000 */   nop
/* 07AD1C 0017AC1C 6087838F */  lw          $3, -0x78A0($28)
/* 07AD20 0017AC20 01000224 */  addiu       $2, $0, 0x1
/* 07AD24 0017AC24 09006214 */  bne         $3, $2, .L0017AC4C
/* 07AD28 0017AC28 00000000 */   nop
/* 07AD2C 0017AC2C 6487848F */  lw          $4, -0x789C($28)
/* 07AD30 0017AC30 2001A527 */  addiu       $5, $29, 0x120
/* 07AD34 0017AC34 A000998C */  lw          $25, 0xA0($4)
/* 07AD38 0017AC38 A000398F */  lw          $25, 0xA0($25)
/* 07AD3C 0017AC3C 09F82003 */  jalr        $25
/* 07AD40 0017AC40 00000000 */   nop
/* 07AD44 0017AC44 06000010 */  b           .L0017AC60
/* 07AD48 0017AC48 00000000 */   nop
.L0017AC4C:
/* 07AD4C 0017AC4C 7087828F */  lw          $2, -0x7890($28)
/* 07AD50 0017AC50 2001A427 */  addiu       $4, $29, 0x120
/* 07AD54 0017AC54 20024524 */  addiu       $5, $2, 0x220
/* 07AD58 0017AC58 0C86040C */  jal         sceVu0CopyVector
/* 07AD5C 0017AC5C 00000000 */   nop
.L0017AC60:
/* 07AD60 0017AC60 4C8F828F */  lw          $2, -0x70B4($28)
/* 07AD64 0017AC64 0500401C */  bgtz        $2, .L0017AC7C
/* 07AD68 0017AC68 00000000 */   nop
/* 07AD6C 0017AC6C 288D828F */  lw          $2, -0x72D8($28)
/* 07AD70 0017AC70 05004128 */  slti        $1, $2, 0x5
/* 07AD74 0017AC74 D8002010 */  beqz        $1, .L0017AFD8
/* 07AD78 0017AC78 00000000 */   nop
.L0017AC7C:
/* 07AD7C 0017AC7C 00010424 */  addiu       $4, $0, 0x100
/* 07AD80 0017AC80 02000524 */  addiu       $5, $0, 0x2
/* 07AD84 0017AC84 64A6050C */  jal         EdPadDown__Fii
/* 07AD88 0017AC88 00000000 */   nop
/* 07AD8C 0017AC8C D2004010 */  beqz        $2, .L0017AFD8
/* 07AD90 0017AC90 00000000 */   nop
/* 07AD94 0017AC94 48A8050C */  jal         EdCheckViewMode__Fv
/* 07AD98 0017AC98 00000000 */   nop
/* 07AD9C 0017AC9C CE004014 */  bnez        $2, .L0017AFD8
/* 07ADA0 0017ACA0 00000000 */   nop
/* 07ADA4 0017ACA4 B090828F */  lw          $2, -0x6F50($28)
/* 07ADA8 0017ACA8 CB004014 */  bnez        $2, .L0017AFD8
/* 07ADAC 0017ACAC 00000000 */   nop
/* 07ADB0 0017ACB0 6087838F */  lw          $3, -0x78A0($28)
/* 07ADB4 0017ACB4 01000224 */  addiu       $2, $0, 0x1
/* 07ADB8 0017ACB8 54006214 */  bne         $3, $2, .L0017AE0C
/* 07ADBC 0017ACBC 00000000 */   nop
/* 07ADC0 0017ACC0 1E000224 */  addiu       $2, $0, 0x1E
/* 07ADC4 0017ACC4 D89082AF */  sw          $2, -0x6F28($28)
/* 07ADC8 0017ACC8 04000224 */  addiu       $2, $0, 0x4
/* 07ADCC 0017ACCC 608782AF */  sw          $2, -0x78A0($28)
/* 07ADD0 0017ACD0 D301023C */  lui         $2, %hi(MainCamera)
/* 07ADD4 0017ACD4 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 07ADD8 0017ACD8 D092040C */  jal         GetAngle__13CCameraFollowFv
/* 07ADDC 0017ACDC 00000000 */   nop
/* 07ADE0 0017ACE0 D301023C */  lui         $2, %hi(EditCamera)
/* 07ADE4 0017ACE4 40484424 */  addiu       $4, $2, %lo(EditCamera)
/* 07ADE8 0017ACE8 06030046 */  mov.s       $f12, $f0
/* 07ADEC 0017ACEC CC92040C */  jal         SetAngleSoon__13CCameraFollowFf
/* 07ADF0 0017ACF0 00000000 */   nop
/* 07ADF4 0017ACF4 D301023C */  lui         $2, %hi(MainCamera)
/* 07ADF8 0017ACF8 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 07ADFC 0017ACFC 3001A527 */  addiu       $5, $29, 0x130
/* 07AE00 0017AD00 9C91040C */  jal         GetPos__7CCameraFPf
/* 07AE04 0017AD04 00000000 */   nop
/* 07AE08 0017AD08 D301023C */  lui         $2, %hi(EditCamera)
/* 07AE0C 0017AD0C 40484424 */  addiu       $4, $2, %lo(EditCamera)
/* 07AE10 0017AD10 3001A527 */  addiu       $5, $29, 0x130
/* 07AE14 0017AD14 A490040C */  jal         SetPos__7CCameraFPf
/* 07AE18 0017AD18 00000000 */   nop
/* 07AE1C 0017AD1C D301023C */  lui         $2, %hi(MainCamera)
/* 07AE20 0017AD20 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 07AE24 0017AD24 3001A527 */  addiu       $5, $29, 0x130
/* 07AE28 0017AD28 A891040C */  jal         GetRef__7CCameraFPf
/* 07AE2C 0017AD2C 00000000 */   nop
/* 07AE30 0017AD30 D301023C */  lui         $2, %hi(EditCamera)
/* 07AE34 0017AD34 40484424 */  addiu       $4, $2, %lo(EditCamera)
/* 07AE38 0017AD38 3001A527 */  addiu       $5, $29, 0x130
/* 07AE3C 0017AD3C C490040C */  jal         SetRef__7CCameraFPf
/* 07AE40 0017AD40 00000000 */   nop
/* 07AE44 0017AD44 6487848F */  lw          $4, -0x789C($28)
/* 07AE48 0017AD48 3001A527 */  addiu       $5, $29, 0x130
/* 07AE4C 0017AD4C A000998C */  lw          $25, 0xA0($4)
/* 07AE50 0017AD50 A000398F */  lw          $25, 0xA0($25)
/* 07AE54 0017AD54 09F82003 */  jalr        $25
/* 07AE58 0017AD58 00000000 */   nop
/* 07AE5C 0017AD5C 449180AF */  sw          $0, -0x6EBC($28)
/* 07AE60 0017AD60 489180AF */  sw          $0, -0x6EB8($28)
/* 07AE64 0017AD64 4C9180AF */  sw          $0, -0x6EB4($28)
/* 07AE68 0017AD68 6487848F */  lw          $4, -0x789C($28)
/* 07AE6C 0017AD6C 3001A527 */  addiu       $5, $29, 0x130
/* 07AE70 0017AD70 A000998C */  lw          $25, 0xA0($4)
/* 07AE74 0017AD74 A000398F */  lw          $25, 0xA0($25)
/* 07AE78 0017AD78 09F82003 */  jalr        $25
/* 07AE7C 0017AD7C 00000000 */   nop
/* 07AE80 0017AD80 7087848F */  lw          $4, -0x7890($28)
/* 07AE84 0017AD84 3001A527 */  addiu       $5, $29, 0x130
/* 07AE88 0017AD88 B89F040C */  jal         SetPosition__6CFrameFPf
/* 07AE8C 0017AD8C 00000000 */   nop
/* 07AE90 0017AD90 7087838F */  lw          $3, -0x7890($28)
/* 07AE94 0017AD94 D301023C */  lui         $2, %hi(NowPartsCursorPos)
/* 07AE98 0017AD98 C0594424 */  addiu       $4, $2, %lo(NowPartsCursorPos)
/* 07AE9C 0017AD9C 20026524 */  addiu       $5, $3, 0x220
/* 07AEA0 0017ADA0 0C86040C */  jal         sceVu0CopyVector
/* 07AEA4 0017ADA4 00000000 */   nop
/* 07AEA8 0017ADA8 7087838F */  lw          $3, -0x7890($28)
/* 07AEAC 0017ADAC D301023C */  lui         $2, %hi(NowCursorPos)
/* 07AEB0 0017ADB0 405C4424 */  addiu       $4, $2, %lo(NowCursorPos)
/* 07AEB4 0017ADB4 20026524 */  addiu       $5, $3, 0x220
/* 07AEB8 0017ADB8 0C86040C */  jal         sceVu0CopyVector
/* 07AEBC 0017ADBC 00000000 */   nop
/* 07AEC0 0017ADC0 7087838F */  lw          $3, -0x7890($28)
/* 07AEC4 0017ADC4 D301023C */  lui         $2, %hi(NextCursorPos)
/* 07AEC8 0017ADC8 505C4424 */  addiu       $4, $2, %lo(NextCursorPos)
/* 07AECC 0017ADCC 20026524 */  addiu       $5, $3, 0x220
/* 07AED0 0017ADD0 0C86040C */  jal         sceVu0CopyVector
/* 07AED4 0017ADD4 00000000 */   nop
/* 07AED8 0017ADD8 509180AF */  sw          $0, -0x6EB0($28)
/* 07AEDC 0017ADDC 549180AF */  sw          $0, -0x6EAC($28)
/* 07AEE0 0017ADE0 FFFF0324 */  addiu       $3, $0, -0x1
/* 07AEE4 0017ADE4 748783AF */  sw          $3, -0x788C($28)
/* 07AEE8 0017ADE8 1E000224 */  addiu       $2, $0, 0x1E
/* 07AEEC 0017ADEC 589182AF */  sw          $2, -0x6EA8($28)
/* 07AEF0 0017ADF0 D201013C */  lui         $1, %hi(EditMenuStatus)
/* 07AEF4 0017ADF4 D09B23AC */  sw          $3, %lo(EditMenuStatus)($1)
/* 07AEF8 0017ADF8 D201013C */  lui         $1, %hi(EditMenuStatus + 0x4)
/* 07AEFC 0017ADFC D49B23AC */  sw          $3, %lo(EditMenuStatus + 0x4)($1)
/* 07AF00 0017AE00 6C8783AF */  sw          $3, -0x7894($28)
/* 07AF04 0017AE04 74000010 */  b           .L0017AFD8
/* 07AF08 0017AE08 00000000 */   nop
.L0017AE0C:
/* 07AF0C 0017AE0C 04000224 */  addiu       $2, $0, 0x4
/* 07AF10 0017AE10 71006214 */  bne         $3, $2, .L0017AFD8
/* 07AF14 0017AE14 00000000 */   nop
/* 07AF18 0017AE18 E890848F */  lw          $4, -0x6F18($28)
/* 07AF1C 0017AE1C 7086060C */  jal         CheckEffect__11CEditGroundFv
/* 07AF20 0017AE20 00000000 */   nop
/* 07AF24 0017AE24 6C004014 */  bnez        $2, .L0017AFD8
/* 07AF28 0017AE28 00000000 */   nop
/* 07AF2C 0017AE2C 1E000224 */  addiu       $2, $0, 0x1E
/* 07AF30 0017AE30 D89082AF */  sw          $2, -0x6F28($28)
/* 07AF34 0017AE34 CC01023C */  lui         $2, %hi(GamePad)
/* 07AF38 0017AE38 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 07AF3C 0017AE3C 3CAE040C */  jal         AutoRepeatOff__8CGamePadFv
/* 07AF40 0017AE40 00000000 */   nop
/* 07AF44 0017AE44 3001A427 */  addiu       $4, $29, 0x130
/* 07AF48 0017AE48 48FF050C */  jal         CheckEditToWalk__FPf
/* 07AF4C 0017AE4C 00000000 */   nop
/* 07AF50 0017AE50 59004010 */  beqz        $2, .L0017AFB8
/* 07AF54 0017AE54 00000000 */   nop
/* 07AF58 0017AE58 01000224 */  addiu       $2, $0, 0x1
/* 07AF5C 0017AE5C 608782AF */  sw          $2, -0x78A0($28)
/* 07AF60 0017AE60 6487848F */  lw          $4, -0x789C($28)
/* 07AF64 0017AE64 3001A527 */  addiu       $5, $29, 0x130
/* 07AF68 0017AE68 A000998C */  lw          $25, 0xA0($4)
/* 07AF6C 0017AE6C 1400398F */  lw          $25, 0x14($25)
/* 07AF70 0017AE70 09F82003 */  jalr        $25
/* 07AF74 0017AE74 00000000 */   nop
/* 07AF78 0017AE78 D301023C */  lui         $2, %hi(EditCamera)
/* 07AF7C 0017AE7C 40484424 */  addiu       $4, $2, %lo(EditCamera)
/* 07AF80 0017AE80 D092040C */  jal         GetAngle__13CCameraFollowFv
/* 07AF84 0017AE84 00000000 */   nop
/* 07AF88 0017AE88 D301023C */  lui         $2, %hi(MainCamera)
/* 07AF8C 0017AE8C 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 07AF90 0017AE90 06030046 */  mov.s       $f12, $f0
/* 07AF94 0017AE94 CC92040C */  jal         SetAngleSoon__13CCameraFollowFf
/* 07AF98 0017AE98 00000000 */   nop
/* 07AF9C 0017AE9C D301023C */  lui         $2, %hi(EditCamera)
/* 07AFA0 0017AEA0 40484424 */  addiu       $4, $2, %lo(EditCamera)
/* 07AFA4 0017AEA4 3001A527 */  addiu       $5, $29, 0x130
/* 07AFA8 0017AEA8 9C91040C */  jal         GetPos__7CCameraFPf
/* 07AFAC 0017AEAC 00000000 */   nop
/* 07AFB0 0017AEB0 D301023C */  lui         $2, %hi(MainCamera)
/* 07AFB4 0017AEB4 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 07AFB8 0017AEB8 3001A527 */  addiu       $5, $29, 0x130
/* 07AFBC 0017AEBC A490040C */  jal         SetPos__7CCameraFPf
/* 07AFC0 0017AEC0 00000000 */   nop
/* 07AFC4 0017AEC4 D301023C */  lui         $2, %hi(EditCamera)
/* 07AFC8 0017AEC8 40484424 */  addiu       $4, $2, %lo(EditCamera)
/* 07AFCC 0017AECC 3001A527 */  addiu       $5, $29, 0x130
/* 07AFD0 0017AED0 A891040C */  jal         GetRef__7CCameraFPf
/* 07AFD4 0017AED4 00000000 */   nop
/* 07AFD8 0017AED8 D301023C */  lui         $2, %hi(MainCamera)
/* 07AFDC 0017AEDC 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 07AFE0 0017AEE0 3001A527 */  addiu       $5, $29, 0x130
/* 07AFE4 0017AEE4 C490040C */  jal         SetRef__7CCameraFPf
/* 07AFE8 0017AEE8 00000000 */   nop
/* 07AFEC 0017AEEC 28860070 */  paddub      $16, $0, $0
/* 07AFF0 0017AEF0 1C8D848F */  lw          $4, -0x72E4($28)
/* 07AFF4 0017AEF4 288D858F */  lw          $5, -0x72D8($28)
/* 07AFF8 0017AEF8 EC5F050C */  jal         GetGrdData__9CSaveDataFi
/* 07AFFC 0017AEFC 00000000 */   nop
/* 07B000 0017AF00 1B004010 */  beqz        $2, .L0017AF70
/* 07B004 0017AF04 00000000 */   nop
/* 07B008 0017AF08 6400428C */  lw          $2, 0x64($2)
/* 07B00C 0017AF0C 18004014 */  bnez        $2, .L0017AF70
/* 07B010 0017AF10 00000000 */   nop
/* 07B014 0017AF14 28260070 */  paddub      $4, $0, $0
/* 07B018 0017AF18 0A000010 */  b           .L0017AF44
/* 07B01C 0017AF1C 00000000 */   nop
.L0017AF20:
/* 07B020 0017AF20 80180400 */  sll         $3, $4, 2
/* 07B024 0017AF24 D201023C */  lui         $2, %hi(EditPartsInfo + 0x4)
/* 07B028 0017AF28 F49B4224 */  addiu       $2, $2, %lo(EditPartsInfo + 0x4)
/* 07B02C 0017AF2C 21104300 */  addu        $2, $2, $3
/* 07B030 0017AF30 0000428C */  lw          $2, 0x0($2)
/* 07B034 0017AF34 02004010 */  beqz        $2, .L0017AF40
/* 07B038 0017AF38 00000000 */   nop
/* 07B03C 0017AF3C 01001026 */  addiu       $16, $16, 0x1
.L0017AF40:
/* 07B040 0017AF40 01008424 */  addiu       $4, $4, 0x1
.L0017AF44:
/* 07B044 0017AF44 18008228 */  slti        $2, $4, 0x18
/* 07B048 0017AF48 F5FF4014 */  bnez        $2, .L0017AF20
/* 07B04C 0017AF4C 00000000 */   nop
/* 07B050 0017AF50 D201013C */  lui         $1, %hi(EditPartsInfo)
/* 07B054 0017AF54 F09B228C */  lw          $2, %lo(EditPartsInfo)($1)
/* 07B058 0017AF58 05000216 */  bne         $16, $2, .L0017AF70
/* 07B05C 0017AF5C 00000000 */   nop
/* 07B060 0017AF60 83000424 */  addiu       $4, $0, 0x83
/* 07B064 0017AF64 09000524 */  addiu       $5, $0, 0x9
/* 07B068 0017AF68 DCDE050C */  jal         FadeOutToEvent__Fii
/* 07B06C 0017AF6C 00000000 */   nop
.L0017AF70:
/* 07B070 0017AF70 288D838F */  lw          $3, -0x72D8($28)
/* 07B074 0017AF74 01000224 */  addiu       $2, $0, 0x1
/* 07B078 0017AF78 0F006214 */  bne         $3, $2, .L0017AFB8
/* 07B07C 0017AF7C 00000000 */   nop
/* 07B080 0017AF80 1C8D848F */  lw          $4, -0x72E4($28)
/* 07B084 0017AF84 14000524 */  addiu       $5, $0, 0x14
/* 07B088 0017AF88 8060050C */  jal         GetGameFlag__9CSaveDataFi
/* 07B08C 0017AF8C 00000000 */   nop
/* 07B090 0017AF90 09004014 */  bnez        $2, .L0017AFB8
/* 07B094 0017AF94 00000000 */   nop
/* 07B098 0017AF98 D201013C */  lui         $1, %hi(EditPartsInfo + 0x44)
/* 07B09C 0017AF9C 349C228C */  lw          $2, %lo(EditPartsInfo + 0x44)($1)
/* 07B0A0 0017AFA0 05004010 */  beqz        $2, .L0017AFB8
/* 07B0A4 0017AFA4 00000000 */   nop
/* 07B0A8 0017AFA8 0B000424 */  addiu       $4, $0, 0xB
/* 07B0AC 0017AFAC 0A000524 */  addiu       $5, $0, 0xA
/* 07B0B0 0017AFB0 DCDE050C */  jal         FadeOutToEvent__Fii
/* 07B0B4 0017AFB4 00000000 */   nop
.L0017AFB8:
/* 07B0B8 0017AFB8 D201023C */  lui         $2, %hi(EdVillager)
/* 07B0BC 0017AFBC 905B4424 */  addiu       $4, $2, %lo(EdVillager)
/* 07B0C0 0017AFC0 D301023C */  lui         $2, %hi(EdVillagerInfo)
/* 07B0C4 0017AFC4 D0294524 */  addiu       $5, $2, %lo(EdVillagerInfo)
/* 07B0C8 0017AFC8 E890868F */  lw          $6, -0x6F18($28)
/* 07B0CC 0017AFCC 3001A727 */  addiu       $7, $29, 0x130
/* 07B0D0 0017AFD0 4419060C */  jal         EdInitVilagerPosition__FP12CNPCharacterP13VILLAGER_INFOP11CEditGroundPA4_f
/* 07B0D4 0017AFD4 00000000 */   nop
.L0017AFD8:
/* 07B0D8 0017AFD8 D890828F */  lw          $2, -0x6F28($28)
/* 07B0DC 0017AFDC 09004018 */  blez        $2, .L0017B004
/* 07B0E0 0017AFE0 00000000 */   nop
/* 07B0E4 0017AFE4 2041023C */  lui         $2, (0x41200000 >> 16)
/* 07B0E8 0017AFE8 00608244 */  mtc1        $2, $f12
/* 07B0EC 0017AFEC D301023C */  lui         $2, %hi(EditCamera)
/* 07B0F0 0017AFF0 40484424 */  addiu       $4, $2, %lo(EditCamera)
/* 07B0F4 0017AFF4 9491040C */  jal         SetSpeed__7CCameraFf
/* 07B0F8 0017AFF8 00000000 */   nop
/* 07B0FC 0017AFFC 07000010 */  b           .L0017B01C
/* 07B100 0017B000 00000000 */   nop
.L0017B004:
/* 07B104 0017B004 0041023C */  lui         $2, (0x41000000 >> 16)
/* 07B108 0017B008 00608244 */  mtc1        $2, $f12
/* 07B10C 0017B00C D301023C */  lui         $2, %hi(EditCamera)
/* 07B110 0017B010 40484424 */  addiu       $4, $2, %lo(EditCamera)
/* 07B114 0017B014 9491040C */  jal         SetSpeed__7CCameraFf
/* 07B118 0017B018 00000000 */   nop
.L0017B01C:
/* 07B11C 0017B01C D890828F */  lw          $2, -0x6F28($28)
/* 07B120 0017B020 02004104 */  bgez        $2, .L0017B02C
/* 07B124 0017B024 00000000 */   nop
/* 07B128 0017B028 D89080AF */  sw          $0, -0x6F28($28)
.L0017B02C:
/* 07B12C 0017B02C D890828F */  lw          $2, -0x6F28($28)
/* 07B130 0017B030 FFFF4224 */  addiu       $2, $2, -0x1
/* 07B134 0017B034 D89082AF */  sw          $2, -0x6F28($28)
/* 07B138 0017B038 6087838F */  lw          $3, -0x78A0($28)
/* 07B13C 0017B03C 05000224 */  addiu       $2, $0, 0x5
/* 07B140 0017B040 04006210 */  beq         $3, $2, .L0017B054
/* 07B144 0017B044 00000000 */   nop
/* 07B148 0017B048 07000224 */  addiu       $2, $0, 0x7
/* 07B14C 0017B04C 0F006214 */  bne         $3, $2, .L0017B08C
/* 07B150 0017B050 00000000 */   nop
.L0017B054:
/* 07B154 0017B054 C701023C */  lui         $2, %hi(TexManager)
/* 07B158 0017B058 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 07B15C 0017B05C 2A00023C */  lui         $2, %hi(LIT_1610)
/* 07B160 0017B060 E0AA4524 */  addiu       $5, $2, %lo(LIT_1610)
/* 07B164 0017B064 FFFF0624 */  addiu       $6, $0, -0x1
/* 07B168 0017B068 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 07B16C 0017B06C 00000000 */   nop
/* 07B170 0017B070 0091848F */  lw          $4, -0x6F00($28)
/* 07B174 0017B074 282E4070 */  paddub      $5, $2, $0
/* 07B178 0017B078 4CCB050C */  jal         EdInitModeFinish__FP7CCameraP8CTexture
/* 07B17C 0017B07C 00000000 */   nop
/* 07B180 0017B080 02004010 */  beqz        $2, .L0017B08C
/* 07B184 0017B084 00000000 */   nop
/* 07B188 0017B088 608782AF */  sw          $2, -0x78A0($28)
.L0017B08C:
/* 07B18C 0017B08C 9CCF050C */  jal         EdSaveFrameImageTask__Fv
/* 07B190 0017B090 00000000 */   nop
/* 07B194 0017B094 6087838F */  lw          $3, -0x78A0($28)
/* 07B198 0017B098 04000224 */  addiu       $2, $0, 0x4
/* 07B19C 0017B09C 1C006214 */  bne         $3, $2, .L0017B110
/* 07B1A0 0017B0A0 00000000 */   nop
/* 07B1A4 0017B0A4 B4C6050C */  jal         EdStopSoundSrc__Fv
/* 07B1A8 0017B0A8 00000000 */   nop
/* 07B1AC 0017B0AC 10000424 */  addiu       $4, $0, 0x10
/* 07B1B0 0017B0B0 02000524 */  addiu       $5, $0, 0x2
/* 07B1B4 0017B0B4 64A6050C */  jal         EdPadDown__Fii
/* 07B1B8 0017B0B8 00000000 */   nop
/* 07B1BC 0017B0BC 07004014 */  bnez        $2, .L0017B0DC
/* 07B1C0 0017B0C0 00000000 */   nop
/* 07B1C4 0017B0C4 20000424 */  addiu       $4, $0, 0x20
/* 07B1C8 0017B0C8 02000524 */  addiu       $5, $0, 0x2
/* 07B1CC 0017B0CC 64A6050C */  jal         EdPadDown__Fii
/* 07B1D0 0017B0D0 00000000 */   nop
/* 07B1D4 0017B0D4 0E004010 */  beqz        $2, .L0017B110
/* 07B1D8 0017B0D8 00000000 */   nop
.L0017B0DC:
/* 07B1DC 0017B0DC 01000424 */  addiu       $4, $0, 0x1
/* 07B1E0 0017B0E0 34CB050C */  jal         EdInitMenu__Fi
/* 07B1E4 0017B0E4 00000000 */   nop
/* 07B1E8 0017B0E8 09004010 */  beqz        $2, .L0017B110
/* 07B1EC 0017B0EC 00000000 */   nop
/* 07B1F0 0017B0F0 FFFF0524 */  addiu       $5, $0, -0x1
/* 07B1F4 0017B0F4 6C8785AF */  sw          $5, -0x7894($28)
/* 07B1F8 0017B0F8 05000224 */  addiu       $2, $0, 0x5
/* 07B1FC 0017B0FC 608782AF */  sw          $2, -0x78A0($28)
/* 07B200 0017B100 01000424 */  addiu       $4, $0, 0x1
/* 07B204 0017B104 28360070 */  paddub      $6, $0, $0
/* 07B208 0017B108 AC69050C */  jal         SndSePlay__Fiii
/* 07B20C 0017B10C 00000000 */   nop
.L0017B110:
/* 07B210 0017B110 6087828F */  lw          $2, -0x78A0($28)
/* 07B214 0017B114 01000524 */  addiu       $5, $0, 0x1
/* 07B218 0017B118 31004514 */  bne         $2, $5, .L0017B1E0
/* 07B21C 0017B11C 00000000 */   nop
/* 07B220 0017B120 10000424 */  addiu       $4, $0, 0x10
/* 07B224 0017B124 64A6050C */  jal         EdPadDown__Fii
/* 07B228 0017B128 00000000 */   nop
/* 07B22C 0017B12C 0C004014 */  bnez        $2, .L0017B160
/* 07B230 0017B130 00000000 */   nop
/* 07B234 0017B134 9890828F */  lw          $2, -0x6F68($28)
/* 07B238 0017B138 09004014 */  bnez        $2, .L0017B160
/* 07B23C 0017B13C 00000000 */   nop
/* 07B240 0017B140 4480050C */  jal         SystemMesCheck__Fv
/* 07B244 0017B144 00000000 */   nop
/* 07B248 0017B148 25004014 */  bnez        $2, .L0017B1E0
/* 07B24C 0017B14C 00000000 */   nop
/* 07B250 0017B150 84CC050C */  jal         EdCheckItemOver__Fv
/* 07B254 0017B154 00000000 */   nop
/* 07B258 0017B158 21004010 */  beqz        $2, .L0017B1E0
/* 07B25C 0017B15C 00000000 */   nop
.L0017B160:
/* 07B260 0017B160 02000424 */  addiu       $4, $0, 0x2
/* 07B264 0017B164 9890828F */  lw          $2, -0x6F68($28)
/* 07B268 0017B168 03004010 */  beqz        $2, .L0017B178
/* 07B26C 0017B16C 00000000 */   nop
/* 07B270 0017B170 28264070 */  paddub      $4, $2, $0
/* 07B274 0017B174 989080AF */  sw          $0, -0x6F68($28)
.L0017B178:
/* 07B278 0017B178 34CB050C */  jal         EdInitMenu__Fi
/* 07B27C 0017B17C 00000000 */   nop
/* 07B280 0017B180 17004010 */  beqz        $2, .L0017B1E0
/* 07B284 0017B184 00000000 */   nop
/* 07B288 0017B188 84CC050C */  jal         EdCheckItemOver__Fv
/* 07B28C 0017B18C 00000000 */   nop
/* 07B290 0017B190 0C004010 */  beqz        $2, .L0017B1C4
/* 07B294 0017B194 00000000 */   nop
/* 07B298 0017B198 9090828F */  lw          $2, -0x6F70($28)
/* 07B29C 0017B19C 0B004128 */  slti        $1, $2, 0xB
/* 07B2A0 0017B1A0 0D002014 */  bnez        $1, .L0017B1D8
/* 07B2A4 0017B1A4 00000000 */   nop
/* 07B2A8 0017B1A8 01000424 */  addiu       $4, $0, 0x1
/* 07B2AC 0017B1AC FFFF0524 */  addiu       $5, $0, -0x1
/* 07B2B0 0017B1B0 28360070 */  paddub      $6, $0, $0
/* 07B2B4 0017B1B4 AC69050C */  jal         SndSePlay__Fiii
/* 07B2B8 0017B1B8 00000000 */   nop
/* 07B2BC 0017B1BC 06000010 */  b           .L0017B1D8
/* 07B2C0 0017B1C0 00000000 */   nop
.L0017B1C4:
/* 07B2C4 0017B1C4 01000424 */  addiu       $4, $0, 0x1
/* 07B2C8 0017B1C8 FFFF0524 */  addiu       $5, $0, -0x1
/* 07B2CC 0017B1CC 28360070 */  paddub      $6, $0, $0
/* 07B2D0 0017B1D0 AC69050C */  jal         SndSePlay__Fiii
/* 07B2D4 0017B1D4 00000000 */   nop
.L0017B1D8:
/* 07B2D8 0017B1D8 07000224 */  addiu       $2, $0, 0x7
/* 07B2DC 0017B1DC 608782AF */  sw          $2, -0x78A0($28)
.L0017B1E0:
/* 07B2E0 0017B1E0 8C918283 */  lb          $2, -0x6E74($28)
/* 07B2E4 0017B1E4 04004014 */  bnez        $2, .L0017B1F8
/* 07B2E8 0017B1E8 00000000 */   nop
/* 07B2EC 0017B1EC 889180AF */  sw          $0, -0x6E78($28)
/* 07B2F0 0017B1F0 01000224 */  addiu       $2, $0, 0x1
/* 07B2F4 0017B1F4 8C9182A3 */  sb          $2, -0x6E74($28)
.L0017B1F8:
/* 07B2F8 0017B1F8 6087838F */  lw          $3, -0x78A0($28)
/* 07B2FC 0017B1FC 06000224 */  addiu       $2, $0, 0x6
/* 07B300 0017B200 4D006210 */  beq         $3, $2, .L0017B338
/* 07B304 0017B204 00000000 */   nop
/* 07B308 0017B208 04000224 */  addiu       $2, $0, 0x4
/* 07B30C 0017B20C 4A006210 */  beq         $3, $2, .L0017B338
/* 07B310 0017B210 00000000 */   nop
/* 07B314 0017B214 9090828F */  lw          $2, -0x6F70($28)
/* 07B318 0017B218 0B004128 */  slti        $1, $2, 0xB
/* 07B31C 0017B21C 46002014 */  bnez        $1, .L0017B338
/* 07B320 0017B220 00000000 */   nop
/* 07B324 0017B224 0091848F */  lw          $4, -0x6F00($28)
/* 07B328 0017B228 4001A527 */  addiu       $5, $29, 0x140
/* 07B32C 0017B22C 9C91040C */  jal         GetPos__7CCameraFPf
/* 07B330 0017B230 00000000 */   nop
/* 07B334 0017B234 0091848F */  lw          $4, -0x6F00($28)
/* 07B338 0017B238 5001A527 */  addiu       $5, $29, 0x150
/* 07B33C 0017B23C E890040C */  jal         GetDir__7CCameraFPf
/* 07B340 0017B240 00000000 */   nop
/* 07B344 0017B244 4001A2C7 */  lwc1        $f2, 0x140($29)
/* 07B348 0017B248 26020224 */  addiu       $2, $0, 0x226
/* 07B34C 0017B24C 00008244 */  mtc1        $2, $f0
/* 07B350 0017B250 00000000 */  nop
/* 07B354 0017B254 60008046 */  cvt.s.w     $f1, $f0
/* 07B358 0017B258 01100146 */  sub.s       $f0, $f2, $f1
/* 07B35C 0017B25C 7001A0E7 */  swc1        $f0, 0x170($29)
/* 07B360 0017B260 4401A3C7 */  lwc1        $f3, 0x144($29)
/* 07B364 0017B264 01180146 */  sub.s       $f0, $f3, $f1
/* 07B368 0017B268 7401A0E7 */  swc1        $f0, 0x174($29)
/* 07B36C 0017B26C 4801A4C7 */  lwc1        $f4, 0x148($29)
/* 07B370 0017B270 01200146 */  sub.s       $f0, $f4, $f1
/* 07B374 0017B274 7801A0E7 */  swc1        $f0, 0x178($29)
/* 07B378 0017B278 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 07B37C 0017B27C 7C01A2AF */  sw          $2, 0x17C($29)
/* 07B380 0017B280 00080246 */  add.s       $f0, $f1, $f2
/* 07B384 0017B284 6001A0E7 */  swc1        $f0, 0x160($29)
/* 07B388 0017B288 00080346 */  add.s       $f0, $f1, $f3
/* 07B38C 0017B28C 6401A0E7 */  swc1        $f0, 0x164($29)
/* 07B390 0017B290 00080446 */  add.s       $f0, $f1, $f4
/* 07B394 0017B294 6801A0E7 */  swc1        $f0, 0x168($29)
/* 07B398 0017B298 6C01A2AF */  sw          $2, 0x16C($29)
/* 07B39C 0017B29C E890848F */  lw          $4, -0x6F18($28)
/* 07B3A0 0017B2A0 8001A527 */  addiu       $5, $29, 0x180
/* 07B3A4 0017B2A4 40000624 */  addiu       $6, $0, 0x40
/* 07B3A8 0017B2A8 6001A727 */  addiu       $7, $29, 0x160
/* 07B3AC 0017B2AC 28460070 */  paddub      $8, $0, $0
/* 07B3B0 0017B2B0 A48A060C */  jal         GetNearParts__11CEditGroundFPP9CMapPartsiP7CBoxVu0P7CBoxVu0
/* 07B3B4 0017B2B4 00000000 */   nop
/* 07B3B8 0017B2B8 282E0070 */  paddub      $5, $0, $0
/* 07B3BC 0017B2BC 11000010 */  b           .L0017B304
/* 07B3C0 0017B2C0 00000000 */   nop
.L0017B2C4:
/* 07B3C4 0017B2C4 80180500 */  sll         $3, $5, 2
/* 07B3C8 0017B2C8 21187D00 */  addu        $3, $3, $29
/* 07B3CC 0017B2CC 80016624 */  addiu       $6, $3, 0x180
/* 07B3D0 0017B2D0 0000C38C */  lw          $3, 0x0($6)
/* 07B3D4 0017B2D4 1801648C */  lw          $4, 0x118($3)
/* 07B3D8 0017B2D8 02000324 */  addiu       $3, $0, 0x2
/* 07B3DC 0017B2DC 08008314 */  bne         $4, $3, .L0017B300
/* 07B3E0 0017B2E0 00000000 */   nop
/* 07B3E4 0017B2E4 E890838F */  lw          $3, -0x6F18($28)
/* 07B3E8 0017B2E8 0200013C */  lui         $1, (0x2095C >> 16)
/* 07B3EC 0017B2EC 21086100 */  addu        $1, $3, $1
/* 07B3F0 0017B2F0 5C09238C */  lw          $3, (0x2095C & 0xFFFF)($1)
/* 07B3F4 0017B2F4 02006010 */  beqz        $3, .L0017B300
/* 07B3F8 0017B2F8 00000000 */   nop
/* 07B3FC 0017B2FC 0000C0AC */  sw          $0, 0x0($6)
.L0017B300:
/* 07B400 0017B300 0100A524 */  addiu       $5, $5, 0x1
.L0017B304:
/* 07B404 0017B304 2A18A200 */  slt         $3, $5, $2
/* 07B408 0017B308 EEFF6014 */  bnez        $3, .L0017B2C4
/* 07B40C 0017B30C 00000000 */   nop
/* 07B410 0017B310 A090838F */  lw          $3, -0x6F60($28)
/* 07B414 0017B314 0800601C */  bgtz        $3, .L0017B338
/* 07B418 0017B318 00000000 */   nop
/* 07B41C 0017B31C 04918CC7 */  lwc1        $f12, -0x6EFC($28)
/* 07B420 0017B320 8001A427 */  addiu       $4, $29, 0x180
/* 07B424 0017B324 282E4070 */  paddub      $5, $2, $0
/* 07B428 0017B328 4001A627 */  addiu       $6, $29, 0x140
/* 07B42C 0017B32C 5001A727 */  addiu       $7, $29, 0x150
/* 07B430 0017B330 48C7050C */  jal         EdSetSoundSrcVol__FfPP9CMapPartsiPfPf
/* 07B434 0017B334 00000000 */   nop
.L0017B338:
/* 07B438 0017B338 B090828F */  lw          $2, -0x6F50($28)
/* 07B43C 0017B33C 0B004010 */  beqz        $2, .L0017B36C
/* 07B440 0017B340 00000000 */   nop
/* 07B444 0017B344 D890828F */  lw          $2, -0x6F28($28)
/* 07B448 0017B348 0800401C */  bgtz        $2, .L0017B36C
/* 07B44C 0017B34C 00000000 */   nop
/* 07B450 0017B350 84000424 */  addiu       $4, $0, 0x84
/* 07B454 0017B354 0091858F */  lw          $5, -0x6F00($28)
/* 07B458 0017B358 7CDE050C */  jal         RunEvent__FiP7CCamera
/* 07B45C 0017B35C 00000000 */   nop
/* 07B460 0017B360 02004010 */  beqz        $2, .L0017B36C
/* 07B464 0017B364 00000000 */   nop
/* 07B468 0017B368 B09080AF */  sw          $0, -0x6F50($28)
.L0017B36C:
/* 07B46C 0017B36C 94918283 */  lb          $2, -0x6E6C($28)
/* 07B470 0017B370 04004014 */  bnez        $2, .L0017B384
/* 07B474 0017B374 00000000 */   nop
/* 07B478 0017B378 909180AF */  sw          $0, -0x6E70($28)
/* 07B47C 0017B37C 01000224 */  addiu       $2, $0, 0x1
/* 07B480 0017B380 949182A3 */  sb          $2, -0x6E6C($28)
.L0017B384:
/* 07B484 0017B384 CC01023C */  lui         $2, %hi(GamePad)
/* 07B488 0017B388 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 07B48C 0017B38C 80000524 */  addiu       $5, $0, 0x80
/* 07B490 0017B390 2CAE040C */  jal         Down2__8CGamePadFi
/* 07B494 0017B394 00000000 */   nop
/* 07B498 0017B398 06004010 */  beqz        $2, .L0017B3B4
/* 07B49C 0017B39C 00000000 */   nop
/* 07B4A0 0017B3A0 04000224 */  addiu       $2, $0, 0x4
/* 07B4A4 0017B3A4 909182AF */  sw          $2, -0x6E70($28)
/* 07B4A8 0017B3A8 045E060C */  jal         EdEventAllClear__Fv
/* 07B4AC 0017B3AC 00000000 */   nop
/* 07B4B0 0017B3B0 149280AF */  sw          $0, -0x6DEC($28)
.L0017B3B4:
/* 07B4B4 0017B3B4 9091828F */  lw          $2, -0x6E70($28)
/* 07B4B8 0017B3B8 FFFF4224 */  addiu       $2, $2, -0x1
/* 07B4BC 0017B3BC 909182AF */  sw          $2, -0x6E70($28)
/* 07B4C0 0017B3C0 9091828F */  lw          $2, -0x6E70($28)
/* 07B4C4 0017B3C4 02004104 */  bgez        $2, .L0017B3D0
/* 07B4C8 0017B3C8 00000000 */   nop
/* 07B4CC 0017B3CC 909180AF */  sw          $0, -0x6E70($28)
.L0017B3D0:
/* 07B4D0 0017B3D0 9091838F */  lw          $3, -0x6E70($28)
/* 07B4D4 0017B3D4 01000224 */  addiu       $2, $0, 0x1
/* 07B4D8 0017B3D8 03006214 */  bne         $3, $2, .L0017B3E8
/* 07B4DC 0017B3DC 00000000 */   nop
/* 07B4E0 0017B3E0 96000224 */  addiu       $2, $0, 0x96
/* 07B4E4 0017B3E4 D09082AF */  sw          $2, -0x6F30($28)
.L0017B3E8:
/* 07B4E8 0017B3E8 6087838F */  lw          $3, -0x78A0($28)
/* 07B4EC 0017B3EC 0E000224 */  addiu       $2, $0, 0xE
/* 07B4F0 0017B3F0 11006210 */  beq         $3, $2, .L0017B438
/* 07B4F4 0017B3F4 00000000 */   nop
/* 07B4F8 0017B3F8 6487838F */  lw          $3, -0x789C($28)
/* 07B4FC 0017B3FC D011628C */  lw          $2, 0x11D0($3)
/* 07B500 0017B400 0D004010 */  beqz        $2, .L0017B438
/* 07B504 0017B404 00000000 */   nop
/* 07B508 0017B408 9090828F */  lw          $2, -0x6F70($28)
/* 07B50C 0017B40C 0B004128 */  slti        $1, $2, 0xB
/* 07B510 0017B410 09002014 */  bnez        $1, .L0017B438
/* 07B514 0017B414 00000000 */   nop
/* 07B518 0017B418 20126484 */  lh          $4, 0x1220($3)
/* 07B51C 0017B41C 06008018 */  blez        $4, .L0017B438
/* 07B520 0017B420 00000000 */   nop
/* 07B524 0017B424 0091858F */  lw          $5, -0x6F00($28)
/* 07B528 0017B428 7CDE050C */  jal         RunEvent__FiP7CCamera
/* 07B52C 0017B42C 00000000 */   nop
/* 07B530 0017B430 6487828F */  lw          $2, -0x789C($28)
/* 07B534 0017B434 201240A4 */  sh          $0, 0x1220($2)
.L0017B438:
/* 07B538 0017B438 3087828F */  lw          $2, -0x78D0($28)
/* 07B53C 0017B43C 55004010 */  beqz        $2, .L0017B594
/* 07B540 0017B440 00000000 */   nop
/* 07B544 0017B444 D090828F */  lw          $2, -0x6F30($28)
/* 07B548 0017B448 0400401C */  bgtz        $2, .L0017B45C
/* 07B54C 0017B44C 00000000 */   nop
/* 07B550 0017B450 D490828F */  lw          $2, -0x6F2C($28)
/* 07B554 0017B454 4F004018 */  blez        $2, .L0017B594
/* 07B558 0017B458 00000000 */   nop
.L0017B45C:
/* 07B55C 0017B45C 0091848F */  lw          $4, -0x6F00($28)
/* 07B560 0017B460 8003A527 */  addiu       $5, $29, 0x380
/* 07B564 0017B464 9C91040C */  jal         GetPos__7CCameraFPf
/* 07B568 0017B468 00000000 */   nop
/* 07B56C 0017B46C 0091848F */  lw          $4, -0x6F00($28)
/* 07B570 0017B470 9003A527 */  addiu       $5, $29, 0x390
/* 07B574 0017B474 A891040C */  jal         GetRef__7CCameraFPf
/* 07B578 0017B478 00000000 */   nop
/* 07B57C 0017B47C D301023C */  lui         $2, %hi(EventCamera)
/* 07B580 0017B480 40514424 */  addiu       $4, $2, %lo(EventCamera)
/* 07B584 0017B484 C492040C */  jal         FollowOff__13CCameraFollowFv
/* 07B588 0017B488 00000000 */   nop
/* 07B58C 0017B48C D301023C */  lui         $2, %hi(EventCamera)
/* 07B590 0017B490 40514424 */  addiu       $4, $2, %lo(EventCamera)
/* 07B594 0017B494 8003A527 */  addiu       $5, $29, 0x380
/* 07B598 0017B498 A490040C */  jal         SetPos__7CCameraFPf
/* 07B59C 0017B49C 00000000 */   nop
/* 07B5A0 0017B4A0 D301023C */  lui         $2, %hi(EventCamera)
/* 07B5A4 0017B4A4 40514424 */  addiu       $4, $2, %lo(EventCamera)
/* 07B5A8 0017B4A8 9003A527 */  addiu       $5, $29, 0x390
/* 07B5AC 0017B4AC C490040C */  jal         SetRef__7CCameraFPf
/* 07B5B0 0017B4B0 00000000 */   nop
/* 07B5B4 0017B4B4 D301023C */  lui         $2, %hi(EventCamera)
/* 07B5B8 0017B4B8 40514424 */  addiu       $4, $2, %lo(EventCamera)
/* 07B5BC 0017B4BC FFFF0524 */  addiu       $5, $0, -0x1
/* 07B5C0 0017B4C0 F491040C */  jal         Step__13CCameraFollowFi
/* 07B5C4 0017B4C4 00000000 */   nop
/* 07B5C8 0017B4C8 D490848F */  lw          $4, -0x6F2C($28)
/* 07B5CC 0017B4CC 0E008018 */  blez        $4, .L0017B508
/* 07B5D0 0017B4D0 00000000 */   nop
/* 07B5D4 0017B4D4 6890868F */  lw          $6, -0x6F98($28)
/* 07B5D8 0017B4D8 D201023C */  lui         $2, %hi(EdWorkBuffer)
/* 07B5DC 0017B4DC C0B34524 */  addiu       $5, $2, %lo(EdWorkBuffer)
/* 07B5E0 0017B4E0 EC5C060C */  jal         EdEventInit__FiP14CDataAlloc2_1_Pc
/* 07B5E4 0017B4E4 00000000 */   nop
/* 07B5E8 0017B4E8 25004010 */  beqz        $2, .L0017B580
/* 07B5EC 0017B4EC 00000000 */   nop
/* 07B5F0 0017B4F0 74E0050C */  jal         EdInitMesParam__Fv
/* 07B5F4 0017B4F4 00000000 */   nop
/* 07B5F8 0017B4F8 0E000224 */  addiu       $2, $0, 0xE
/* 07B5FC 0017B4FC 608782AF */  sw          $2, -0x78A0($28)
/* 07B600 0017B500 1F000010 */  b           .L0017B580
/* 07B604 0017B504 00000000 */   nop
.L0017B508:
/* 07B608 0017B508 6490868F */  lw          $6, -0x6F9C($28)
/* 07B60C 0017B50C D090848F */  lw          $4, -0x6F30($28)
/* 07B610 0017B510 D201023C */  lui         $2, %hi(EdWorkBuffer)
/* 07B614 0017B514 C0B34524 */  addiu       $5, $2, %lo(EdWorkBuffer)
/* 07B618 0017B518 EC5C060C */  jal         EdEventInit__FiP14CDataAlloc2_1_Pc
/* 07B61C 0017B51C 00000000 */   nop
/* 07B620 0017B520 09004010 */  beqz        $2, .L0017B548
/* 07B624 0017B524 00000000 */   nop
/* 07B628 0017B528 74E0050C */  jal         EdInitMesParam__Fv
/* 07B62C 0017B52C 00000000 */   nop
/* 07B630 0017B530 0E000224 */  addiu       $2, $0, 0xE
/* 07B634 0017B534 608782AF */  sw          $2, -0x78A0($28)
/* 07B638 0017B538 DB01023C */  lui         $2, %hi(ItemVolumeStep)
/* 07B63C 0017B53C 10BC4424 */  addiu       $4, $2, %lo(ItemVolumeStep)
/* 07B640 0017B540 C8D5080C */  jal         CheckItemVolume__13CMenuItemStepFv
/* 07B644 0017B544 00000000 */   nop
.L0017B548:
/* 07B648 0017B548 D401013C */  lui         $1, %hi(EdEventInfo + 0x448)
/* 07B64C 0017B54C 18D6238C */  lw          $3, %lo(EdEventInfo + 0x448)($1)
/* 07B650 0017B550 09000224 */  addiu       $2, $0, 0x9
/* 07B654 0017B554 0A006214 */  bne         $3, $2, .L0017B580
/* 07B658 0017B558 00000000 */   nop
/* 07B65C 0017B55C 74E0050C */  jal         EdInitMesParam__Fv
/* 07B660 0017B560 00000000 */   nop
/* 07B664 0017B564 02000224 */  addiu       $2, $0, 0x2
/* 07B668 0017B568 608782AF */  sw          $2, -0x78A0($28)
/* 07B66C 0017B56C 149280AF */  sw          $0, -0x6DEC($28)
/* 07B670 0017B570 DB01023C */  lui         $2, %hi(ItemVolumeStep)
/* 07B674 0017B574 10BC4424 */  addiu       $4, $2, %lo(ItemVolumeStep)
/* 07B678 0017B578 C8D5080C */  jal         CheckItemVolume__13CMenuItemStepFv
/* 07B67C 0017B57C 00000000 */   nop
.L0017B580:
/* 07B680 0017B580 FFFF0224 */  addiu       $2, $0, -0x1
/* 07B684 0017B584 D09082AF */  sw          $2, -0x6F30($28)
/* 07B688 0017B588 D49082AF */  sw          $2, -0x6F2C($28)
/* 07B68C 0017B58C 02000010 */  b           .L0017B598
/* 07B690 0017B590 00000000 */   nop
.L0017B594:
/* 07B694 0017B594 149280AF */  sw          $0, -0x6DEC($28)
.L0017B598:
/* 07B698 0017B598 38E0050C */  jal         PauseOffCheck__Fv
/* 07B69C 0017B59C 00000000 */   nop
/* 07B6A0 0017B5A0 6087828F */  lw          $2, -0x78A0($28)
/* 07B6A4 0017B5A4 F7FF4224 */  addiu       $2, $2, -0x9
/* 07B6A8 0017B5A8 0200412C */  sltiu       $1, $2, 0x2
/* 07B6AC 0017B5AC 12002010 */  beqz        $1, .L0017B5F8
/* 07B6B0 0017B5B0 00000000 */   nop
/* 07B6B4 0017B5B4 00080424 */  addiu       $4, $0, 0x800
/* 07B6B8 0017B5B8 FFFF0534 */  ori         $5, $0, 0xFFFF
/* 07B6BC 0017B5BC 64A6050C */  jal         EdPadDown__Fii
/* 07B6C0 0017B5C0 00000000 */   nop
/* 07B6C4 0017B5C4 0C004010 */  beqz        $2, .L0017B5F8
/* 07B6C8 0017B5C8 00000000 */   nop
/* 07B6CC 0017B5CC 9891828F */  lw          $2, -0x6E68($28)
/* 07B6D0 0017B5D0 608782AF */  sw          $2, -0x78A0($28)
/* 07B6D4 0017B5D4 02000424 */  addiu       $4, $0, 0x2
/* 07B6D8 0017B5D8 FFFF0524 */  addiu       $5, $0, -0x1
/* 07B6DC 0017B5DC 4428060C */  jal         EdSePlay__F11ED_SOUND_IDi
/* 07B6E0 0017B5E0 00000000 */   nop
/* 07B6E4 0017B5E4 01000424 */  addiu       $4, $0, 0x1
/* 07B6E8 0017B5E8 C803050C */  jal         PlayTimeCountFlag__Fi
/* 07B6EC 0017B5EC 00000000 */   nop
/* 07B6F0 0017B5F0 24000010 */  b           .L0017B684
/* 07B6F4 0017B5F4 00000000 */   nop
.L0017B5F8:
/* 07B6F8 0017B5F8 9C90828F */  lw          $2, -0x6F64($28)
/* 07B6FC 0017B5FC 21004010 */  beqz        $2, .L0017B684
/* 07B700 0017B600 00000000 */   nop
/* 07B704 0017B604 6087838F */  lw          $3, -0x78A0($28)
/* 07B708 0017B608 01000424 */  addiu       $4, $0, 0x1
/* 07B70C 0017B60C 04006410 */  beq         $3, $4, .L0017B620
/* 07B710 0017B610 00000000 */   nop
/* 07B714 0017B614 10000224 */  addiu       $2, $0, 0x10
/* 07B718 0017B618 0E006214 */  bne         $3, $2, .L0017B654
/* 07B71C 0017B61C 00000000 */   nop
.L0017B620:
/* 07B720 0017B620 989183AF */  sw          $3, -0x6E68($28)
/* 07B724 0017B624 E49083AF */  sw          $3, -0x6F1C($28)
/* 07B728 0017B628 09000224 */  addiu       $2, $0, 0x9
/* 07B72C 0017B62C 608782AF */  sw          $2, -0x78A0($28)
/* 07B730 0017B630 01000424 */  addiu       $4, $0, 0x1
/* 07B734 0017B634 FFFF0524 */  addiu       $5, $0, -0x1
/* 07B738 0017B638 4428060C */  jal         EdSePlay__F11ED_SOUND_IDi
/* 07B73C 0017B63C 00000000 */   nop
/* 07B740 0017B640 28260070 */  paddub      $4, $0, $0
/* 07B744 0017B644 C803050C */  jal         PlayTimeCountFlag__Fi
/* 07B748 0017B648 00000000 */   nop
/* 07B74C 0017B64C 0D000010 */  b           .L0017B684
/* 07B750 0017B650 00000000 */   nop
.L0017B654:
/* 07B754 0017B654 04000224 */  addiu       $2, $0, 0x4
/* 07B758 0017B658 0A006214 */  bne         $3, $2, .L0017B684
/* 07B75C 0017B65C 00000000 */   nop
/* 07B760 0017B660 989183AF */  sw          $3, -0x6E68($28)
/* 07B764 0017B664 0A000224 */  addiu       $2, $0, 0xA
/* 07B768 0017B668 608782AF */  sw          $2, -0x78A0($28)
/* 07B76C 0017B66C FFFF0524 */  addiu       $5, $0, -0x1
/* 07B770 0017B670 4428060C */  jal         EdSePlay__F11ED_SOUND_IDi
/* 07B774 0017B674 00000000 */   nop
/* 07B778 0017B678 28260070 */  paddub      $4, $0, $0
/* 07B77C 0017B67C C803050C */  jal         PlayTimeCountFlag__Fi
/* 07B780 0017B680 00000000 */   nop
.L0017B684:
/* 07B784 0017B684 9C9080AF */  sw          $0, -0x6F64($28)
/* 07B788 0017B688 A0918283 */  lb          $2, -0x6E60($28)
/* 07B78C 0017B68C 04004014 */  bnez        $2, .L0017B6A0
/* 07B790 0017B690 00000000 */   nop
/* 07B794 0017B694 9C9180AF */  sw          $0, -0x6E64($28)
/* 07B798 0017B698 01000224 */  addiu       $2, $0, 0x1
/* 07B79C 0017B69C A09182A3 */  sb          $2, -0x6E60($28)
.L0017B6A0:
/* 07B7A0 0017B6A0 8890828F */  lw          $2, -0x6F78($28)
/* 07B7A4 0017B6A4 0D004010 */  beqz        $2, .L0017B6DC
/* 07B7A8 0017B6A8 00000000 */   nop
/* 07B7AC 0017B6AC 2091828F */  lw          $2, -0x6EE0($28)
/* 07B7B0 0017B6B0 0A004014 */  bnez        $2, .L0017B6DC
/* 07B7B4 0017B6B4 00000000 */   nop
/* 07B7B8 0017B6B8 2090828F */  lw          $2, -0x6FE0($28)
/* 07B7BC 0017B6BC 248D82AF */  sw          $2, -0x72DC($28)
/* 07B7C0 0017B6C0 C8004424 */  addiu       $4, $2, 0xC8
/* 07B7C4 0017B6C4 FFFF0524 */  addiu       $5, $0, -0x1
/* 07B7C8 0017B6C8 4C07050C */  jal         MapJump__Fii
/* 07B7CC 0017B6CC 00000000 */   nop
/* 07B7D0 0017B6D0 01000224 */  addiu       $2, $0, 0x1
/* 07B7D4 0017B6D4 209182AF */  sw          $2, -0x6EE0($28)
/* 07B7D8 0017B6D8 9C9182AF */  sw          $2, -0x6E64($28)
.L0017B6DC:
/* 07B7DC 0017B6DC 949080AF */  sw          $0, -0x6F6C($28)
/* 07B7E0 0017B6E0 8C90828F */  lw          $2, -0x6F74($28)
/* 07B7E4 0017B6E4 06004010 */  beqz        $2, .L0017B700
/* 07B7E8 0017B6E8 00000000 */   nop
/* 07B7EC 0017B6EC 50DF050C */  jal         EditExit__Fv
/* 07B7F0 0017B6F0 00000000 */   nop
/* 07B7F4 0017B6F4 01000224 */  addiu       $2, $0, 0x1
/* 07B7F8 0017B6F8 2B000010 */  b           .L0017B7A8
/* 07B7FC 0017B6FC 00000000 */   nop
.L0017B700:
/* 07B800 0017B700 2091838F */  lw          $3, -0x6EE0($28)
/* 07B804 0017B704 01000224 */  addiu       $2, $0, 0x1
/* 07B808 0017B708 06006214 */  bne         $3, $2, .L0017B724
/* 07B80C 0017B70C 00000000 */   nop
/* 07B810 0017B710 50DF050C */  jal         EditExit__Fv
/* 07B814 0017B714 00000000 */   nop
/* 07B818 0017B718 9C91828F */  lw          $2, -0x6E64($28)
/* 07B81C 0017B71C 22000010 */  b           .L0017B7A8
/* 07B820 0017B720 00000000 */   nop
.L0017B724:
/* 07B824 0017B724 FFFF6224 */  addiu       $2, $3, -0x1
/* 07B828 0017B728 209182AF */  sw          $2, -0x6EE0($28)
/* 07B82C 0017B72C 2091828F */  lw          $2, -0x6EE0($28)
/* 07B830 0017B730 02004104 */  bgez        $2, .L0017B73C
/* 07B834 0017B734 00000000 */   nop
/* 07B838 0017B738 209180AF */  sw          $0, -0x6EE0($28)
.L0017B73C:
/* 07B83C 0017B73C D464050C */  jal         SndStep__Fv
/* 07B840 0017B740 00000000 */   nop
/* 07B844 0017B744 9090828F */  lw          $2, -0x6F70($28)
/* 07B848 0017B748 01004224 */  addiu       $2, $2, 0x1
/* 07B84C 0017B74C 909082AF */  sw          $2, -0x6F70($28)
/* 07B850 0017B750 9490828F */  lw          $2, -0x6F6C($28)
/* 07B854 0017B754 01004224 */  addiu       $2, $2, 0x1
/* 07B858 0017B758 949082AF */  sw          $2, -0x6F6C($28)
/* 07B85C 0017B75C A090828F */  lw          $2, -0x6F60($28)
/* 07B860 0017B760 FFFF4224 */  addiu       $2, $2, -0x1
/* 07B864 0017B764 A09082AF */  sw          $2, -0x6F60($28)
/* 07B868 0017B768 A090828F */  lw          $2, -0x6F60($28)
/* 07B86C 0017B76C 02004104 */  bgez        $2, .L0017B778
/* 07B870 0017B770 00000000 */   nop
/* 07B874 0017B774 A09080AF */  sw          $0, -0x6F60($28)
.L0017B778:
/* 07B878 0017B778 D301013C */  lui         $1, %hi(DebugFont__3 + 0x18)
/* 07B87C 0017B77C 882F20AC */  sw          $0, %lo(DebugFont__3 + 0x18)($1)
/* 07B880 0017B780 CC01023C */  lui         $2, %hi(GamePad)
/* 07B884 0017B784 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 07B888 0017B788 20000524 */  addiu       $5, $0, 0x20
/* 07B88C 0017B78C 04AE040C */  jal         On__8CGamePadFi
/* 07B890 0017B790 00000000 */   nop
/* 07B894 0017B794 03004010 */  beqz        $2, .L0017B7A4
/* 07B898 0017B798 00000000 */   nop
/* 07B89C 0017B79C ECE5050C */  jal         cat_end__Fv
/* 07B8A0 0017B7A0 00000000 */   nop
.L0017B7A4:
/* 07B8A4 0017B7A4 28160070 */  paddub      $2, $0, $0
.L0017B7A8:
/* 07B8A8 0017B7A8 4000BF7B */  lq          $31, 0x40($29)
/* 07B8AC 0017B7AC 3000B27B */  lq          $18, 0x30($29)
/* 07B8B0 0017B7B0 2000B17B */  lq          $17, 0x20($29)
/* 07B8B4 0017B7B4 1000B07B */  lq          $16, 0x10($29)
/* 07B8B8 0017B7B8 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 07B8BC 0017B7BC F003BD27 */  addiu       $29, $29, 0x3F0
/* 07B8C0 0017B7C0 0800E003 */  jr          $31
/* 07B8C4 0017B7C4 00000000 */   nop
/* 07B8C8 0017B7C8 00000000 */  nop
/* 07B8CC 0017B7CC 00000000 */  nop
