.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoadScript__Fv
/* 77900 00177800 40FFBD27 */  addiu      $sp, $sp, -0xC0
/* 77904 00177804 1000BF7F */  sq         $31, 0x10($sp)
/* 77908 00177808 0000B07F */  sq         $16, 0x0($sp)
/* 7790C 0017780C D201013C */  lui        $at, (0x1D20000 >> 16)
/* 77910 00177810 A8B320AC */  sw         $0, -0x4C58($at)
/* 77914 00177814 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 77918 00177818 A8B3228C */  lw         $2, -0x4C58($at)
/* 7791C 0017781C 00190200 */  sll        $3, $2, 4
/* 77920 00177820 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 77924 00177824 A0B3228C */  lw         $2, -0x4C60($at)
/* 77928 00177828 21104300 */  addu       $2, $2, $3
/* 7792C 0017782C 649082AF */  sw         $2, -0x6F9C($gp)
/* 77930 00177830 A000A427 */  addiu      $4, $sp, 0xA0
/* 77934 00177834 2A00023C */  lui        $2, %hi(_442_3)
/* 77938 00177838 18A94524 */  addiu      $5, $2, %lo(_442_3)
/* 7793C 0017783C 9886868F */  lw         $6, -0x7968($gp)
/* 77940 00177840 1614040C */  jal        sprintf
/* 77944 00177844 00000000 */   nop
/* 77948 00177848 2000A427 */  addiu      $4, $sp, 0x20
/* 7794C 0017784C F4DD050C */  jal        GetEditDataDir__FPc
/* 77950 00177850 00000000 */   nop
/* 77954 00177854 6000A427 */  addiu      $4, $sp, 0x60
/* 77958 00177858 F4DD050C */  jal        GetEditDataDir__FPc
/* 7795C 0017785C 00000000 */   nop
/* 77960 00177860 2000A427 */  addiu      $4, $sp, 0x20
/* 77964 00177864 2A00023C */  lui        $2, %hi(_443_2)
/* 77968 00177868 20A94524 */  addiu      $5, $2, %lo(_443_2)
/* 7796C 0017786C BC14040C */  jal        strcat
/* 77970 00177870 00000000 */   nop
/* 77974 00177874 6000A427 */  addiu      $4, $sp, 0x60
/* 77978 00177878 D201023C */  lui        $2, %hi(EditMapName)
/* 7797C 0017787C E0B44524 */  addiu      $5, $2, %lo(EditMapName)
/* 77980 00177880 BC14040C */  jal        strcat
/* 77984 00177884 00000000 */   nop
/* 77988 00177888 6000A427 */  addiu      $4, $sp, 0x60
/* 7798C 0017788C A000A527 */  addiu      $5, $sp, 0xA0
/* 77990 00177890 BC14040C */  jal        strcat
/* 77994 00177894 00000000 */   nop
/* 77998 00177898 2000A427 */  addiu      $4, $sp, 0x20
/* 7799C 0017789C 6490858F */  lw         $5, -0x6F9C($gp)
/* 779A0 001778A0 BC00A627 */  addiu      $6, $sp, 0xBC
/* 779A4 001778A4 283E0070 */  paddub     $7, $0, $0
/* 779A8 001778A8 F4FC040C */  jal        LoadFile2__FPcPvPii
/* 779AC 001778AC 00000000 */   nop
/* 779B0 001778B0 28004010 */  beqz       $2, .L00177954
/* 779B4 001778B4 00000000 */   nop
/* 779B8 001778B8 BC00A28F */  lw         $2, 0xBC($sp)
/* 779BC 001778BC 03110200 */  sra        $2, $2, 4
/* 779C0 001778C0 01004524 */  addiu      $5, $2, 0x1
/* 779C4 001778C4 D201023C */  lui        $2, %hi(EdScriptBuffer)
/* 779C8 001778C8 A0B34424 */  addiu      $4, $2, %lo(EdScriptBuffer)
/* 779CC 001778CC 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* 779D0 001778D0 00000000 */   nop
/* 779D4 001778D4 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 779D8 001778D8 A8B3228C */  lw         $2, -0x4C58($at)
/* 779DC 001778DC 00190200 */  sll        $3, $2, 4
/* 779E0 001778E0 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 779E4 001778E4 A0B3228C */  lw         $2, -0x4C60($at)
/* 779E8 001778E8 21804300 */  addu       $16, $2, $3
/* 779EC 001778EC 6000A427 */  addiu      $4, $sp, 0x60
/* 779F0 001778F0 282E0072 */  paddub     $5, $16, $0
/* 779F4 001778F4 BC00A627 */  addiu      $6, $sp, 0xBC
/* 779F8 001778F8 283E0070 */  paddub     $7, $0, $0
/* 779FC 001778FC F4FC040C */  jal        LoadFile2__FPcPvPii
/* 77A00 00177900 00000000 */   nop
/* 77A04 00177904 0A004010 */  beqz       $2, .L00177930
/* 77A08 00177908 00000000 */   nop
/* 77A0C 0017790C BC00A28F */  lw         $2, 0xBC($sp)
/* 77A10 00177910 03110200 */  sra        $2, $2, 4
/* 77A14 00177914 01004524 */  addiu      $5, $2, 0x1
/* 77A18 00177918 D201023C */  lui        $2, %hi(EdScriptBuffer)
/* 77A1C 0017791C A0B34424 */  addiu      $4, $2, %lo(EdScriptBuffer)
/* 77A20 00177920 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* 77A24 00177924 00000000 */   nop
/* 77A28 00177928 02000010 */  b          .L00177934
/* 77A2C 0017792C 00000000 */   nop
.L00177930:
/* 77A30 00177930 28860070 */  paddub     $16, $0, $0
.L00177934:
/* 77A34 00177934 6490848F */  lw         $4, -0x6F9C($gp)
/* 77A38 00177938 282E0072 */  paddub     $5, $16, $0
/* 77A3C 0017793C D201023C */  lui        $2, %hi(EdScriptBuffer)
/* 77A40 00177940 A0B34624 */  addiu      $6, $2, %lo(EdScriptBuffer)
/* 77A44 00177944 3C5B060C */  jal        EdSetEventScript__FPcPcP14CDataAlloc2_1_
/* 77A48 00177948 00000000 */   nop
/* 77A4C 0017794C 02000010 */  b          .L00177958
/* 77A50 00177950 00000000 */   nop
.L00177954:
/* 77A54 00177954 649080AF */  sw         $0, -0x6F9C($gp)
.L00177958:
/* 77A58 00177958 D201023C */  lui        $2, %hi(EdScriptBuffer)
/* 77A5C 0017795C A0B34424 */  addiu      $4, $2, %lo(EdScriptBuffer)
/* 77A60 00177960 609E040C */  jal        Align64__14CDataAlloc2_1_Fv
/* 77A64 00177964 00000000 */   nop
/* 77A68 00177968 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 77A6C 0017796C A8B3228C */  lw         $2, -0x4C58($at)
/* 77A70 00177970 00190200 */  sll        $3, $2, 4
/* 77A74 00177974 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 77A78 00177978 A0B3228C */  lw         $2, -0x4C60($at)
/* 77A7C 0017797C 21104300 */  addu       $2, $2, $3
/* 77A80 00177980 689082AF */  sw         $2, -0x6F98($gp)
/* 77A84 00177984 2A00023C */  lui        $2, %hi(_444_2)
/* 77A88 00177988 30A94424 */  addiu      $4, $2, %lo(_444_2)
/* 77A8C 0017798C 6890858F */  lw         $5, -0x6F98($gp)
/* 77A90 00177990 BC00A627 */  addiu      $6, $sp, 0xBC
/* 77A94 00177994 283E0070 */  paddub     $7, $0, $0
/* 77A98 00177998 F4FC040C */  jal        LoadFile2__FPcPvPii
/* 77A9C 0017799C 00000000 */   nop
/* 77AA0 001779A0 0A004010 */  beqz       $2, .L001779CC
/* 77AA4 001779A4 00000000 */   nop
/* 77AA8 001779A8 BC00A28F */  lw         $2, 0xBC($sp)
/* 77AAC 001779AC 03110200 */  sra        $2, $2, 4
/* 77AB0 001779B0 01004524 */  addiu      $5, $2, 0x1
/* 77AB4 001779B4 D201023C */  lui        $2, %hi(EdScriptBuffer)
/* 77AB8 001779B8 A0B34424 */  addiu      $4, $2, %lo(EdScriptBuffer)
/* 77ABC 001779BC 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* 77AC0 001779C0 00000000 */   nop
/* 77AC4 001779C4 02000010 */  b          .L001779D0
/* 77AC8 001779C8 00000000 */   nop
.L001779CC:
/* 77ACC 001779CC 689080AF */  sw         $0, -0x6F98($gp)
.L001779D0:
/* 77AD0 001779D0 1000BF7B */  lq         $31, 0x10($sp)
/* 77AD4 001779D4 0000B07B */  lq         $16, 0x0($sp)
/* 77AD8 001779D8 C000BD27 */  addiu      $sp, $sp, 0xC0
/* 77ADC 001779DC 0800E003 */  jr         $31
/* 77AE0 001779E0 00000000 */   nop
/* 77AE4 001779E4 00000000 */  nop
/* 77AE8 001779E8 00000000 */  nop
/* 77AEC 001779EC 00000000 */  nop
