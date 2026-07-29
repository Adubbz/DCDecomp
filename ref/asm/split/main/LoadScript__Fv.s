.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadScript__Fv
/* 077900 00177800 40FFBD27 */  addiu       $29, $29, -0xC0
/* 077904 00177804 1000BF7F */  sq          $31, 0x10($29)
/* 077908 00177808 0000B07F */  sq          $16, 0x0($29)
/* 07790C 0017780C D201013C */  lui         $1, %hi(EdScriptBuffer + 0x8)
/* 077910 00177810 A8B320AC */  sw          $0, %lo(EdScriptBuffer + 0x8)($1)
/* 077914 00177814 D201013C */  lui         $1, %hi(EdScriptBuffer + 0x8)
/* 077918 00177818 A8B3228C */  lw          $2, %lo(EdScriptBuffer + 0x8)($1)
/* 07791C 0017781C 00190200 */  sll         $3, $2, 4
/* 077920 00177820 D201013C */  lui         $1, %hi(EdScriptBuffer)
/* 077924 00177824 A0B3228C */  lw          $2, %lo(EdScriptBuffer)($1)
/* 077928 00177828 21104300 */  addu        $2, $2, $3
/* 07792C 0017782C 649082AF */  sw          $2, -0x6F9C($28)
/* 077930 00177830 A000A427 */  addiu       $4, $29, 0xA0
/* 077934 00177834 2A00023C */  lui         $2, %hi(LIT_442__3)
/* 077938 00177838 18A94524 */  addiu       $5, $2, %lo(LIT_442__3)
/* 07793C 0017783C 9886868F */  lw          $6, -0x7968($28)
/* 077940 00177840 1614040C */  jal         sprintf
/* 077944 00177844 00000000 */   nop
/* 077948 00177848 2000A427 */  addiu       $4, $29, 0x20
/* 07794C 0017784C F4DD050C */  jal         GetEditDataDir__FPc
/* 077950 00177850 00000000 */   nop
/* 077954 00177854 6000A427 */  addiu       $4, $29, 0x60
/* 077958 00177858 F4DD050C */  jal         GetEditDataDir__FPc
/* 07795C 0017785C 00000000 */   nop
/* 077960 00177860 2000A427 */  addiu       $4, $29, 0x20
/* 077964 00177864 2A00023C */  lui         $2, %hi(LIT_443__2)
/* 077968 00177868 20A94524 */  addiu       $5, $2, %lo(LIT_443__2)
/* 07796C 0017786C BC14040C */  jal         strcat
/* 077970 00177870 00000000 */   nop
/* 077974 00177874 6000A427 */  addiu       $4, $29, 0x60
/* 077978 00177878 D201023C */  lui         $2, %hi(EditMapName)
/* 07797C 0017787C E0B44524 */  addiu       $5, $2, %lo(EditMapName)
/* 077980 00177880 BC14040C */  jal         strcat
/* 077984 00177884 00000000 */   nop
/* 077988 00177888 6000A427 */  addiu       $4, $29, 0x60
/* 07798C 0017788C A000A527 */  addiu       $5, $29, 0xA0
/* 077990 00177890 BC14040C */  jal         strcat
/* 077994 00177894 00000000 */   nop
/* 077998 00177898 2000A427 */  addiu       $4, $29, 0x20
/* 07799C 0017789C 6490858F */  lw          $5, -0x6F9C($28)
/* 0779A0 001778A0 BC00A627 */  addiu       $6, $29, 0xBC
/* 0779A4 001778A4 283E0070 */  paddub      $7, $0, $0
/* 0779A8 001778A8 F4FC040C */  jal         LoadFile2__FPcPvPii
/* 0779AC 001778AC 00000000 */   nop
/* 0779B0 001778B0 28004010 */  beqz        $2, .L00177954
/* 0779B4 001778B4 00000000 */   nop
/* 0779B8 001778B8 BC00A28F */  lw          $2, 0xBC($29)
/* 0779BC 001778BC 03110200 */  sra         $2, $2, 4
/* 0779C0 001778C0 01004524 */  addiu       $5, $2, 0x1
/* 0779C4 001778C4 D201023C */  lui         $2, %hi(EdScriptBuffer)
/* 0779C8 001778C8 A0B34424 */  addiu       $4, $2, %lo(EdScriptBuffer)
/* 0779CC 001778CC 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 0779D0 001778D0 00000000 */   nop
/* 0779D4 001778D4 D201013C */  lui         $1, %hi(EdScriptBuffer + 0x8)
/* 0779D8 001778D8 A8B3228C */  lw          $2, %lo(EdScriptBuffer + 0x8)($1)
/* 0779DC 001778DC 00190200 */  sll         $3, $2, 4
/* 0779E0 001778E0 D201013C */  lui         $1, %hi(EdScriptBuffer)
/* 0779E4 001778E4 A0B3228C */  lw          $2, %lo(EdScriptBuffer)($1)
/* 0779E8 001778E8 21804300 */  addu        $16, $2, $3
/* 0779EC 001778EC 6000A427 */  addiu       $4, $29, 0x60
/* 0779F0 001778F0 282E0072 */  paddub      $5, $16, $0
/* 0779F4 001778F4 BC00A627 */  addiu       $6, $29, 0xBC
/* 0779F8 001778F8 283E0070 */  paddub      $7, $0, $0
/* 0779FC 001778FC F4FC040C */  jal         LoadFile2__FPcPvPii
/* 077A00 00177900 00000000 */   nop
/* 077A04 00177904 0A004010 */  beqz        $2, .L00177930
/* 077A08 00177908 00000000 */   nop
/* 077A0C 0017790C BC00A28F */  lw          $2, 0xBC($29)
/* 077A10 00177910 03110200 */  sra         $2, $2, 4
/* 077A14 00177914 01004524 */  addiu       $5, $2, 0x1
/* 077A18 00177918 D201023C */  lui         $2, %hi(EdScriptBuffer)
/* 077A1C 0017791C A0B34424 */  addiu       $4, $2, %lo(EdScriptBuffer)
/* 077A20 00177920 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 077A24 00177924 00000000 */   nop
/* 077A28 00177928 02000010 */  b           .L00177934
/* 077A2C 0017792C 00000000 */   nop
.L00177930:
/* 077A30 00177930 28860070 */  paddub      $16, $0, $0
.L00177934:
/* 077A34 00177934 6490848F */  lw          $4, -0x6F9C($28)
/* 077A38 00177938 282E0072 */  paddub      $5, $16, $0
/* 077A3C 0017793C D201023C */  lui         $2, %hi(EdScriptBuffer)
/* 077A40 00177940 A0B34624 */  addiu       $6, $2, %lo(EdScriptBuffer)
/* 077A44 00177944 3C5B060C */  jal         EdSetEventScript__FPcPcP14CDataAlloc2_1_
/* 077A48 00177948 00000000 */   nop
/* 077A4C 0017794C 02000010 */  b           .L00177958
/* 077A50 00177950 00000000 */   nop
.L00177954:
/* 077A54 00177954 649080AF */  sw          $0, -0x6F9C($28)
.L00177958:
/* 077A58 00177958 D201023C */  lui         $2, %hi(EdScriptBuffer)
/* 077A5C 0017795C A0B34424 */  addiu       $4, $2, %lo(EdScriptBuffer)
/* 077A60 00177960 609E040C */  jal         Align64__14CDataAlloc2_1_Fv
/* 077A64 00177964 00000000 */   nop
/* 077A68 00177968 D201013C */  lui         $1, %hi(EdScriptBuffer + 0x8)
/* 077A6C 0017796C A8B3228C */  lw          $2, %lo(EdScriptBuffer + 0x8)($1)
/* 077A70 00177970 00190200 */  sll         $3, $2, 4
/* 077A74 00177974 D201013C */  lui         $1, %hi(EdScriptBuffer)
/* 077A78 00177978 A0B3228C */  lw          $2, %lo(EdScriptBuffer)($1)
/* 077A7C 0017797C 21104300 */  addu        $2, $2, $3
/* 077A80 00177980 689082AF */  sw          $2, -0x6F98($28)
/* 077A84 00177984 2A00023C */  lui         $2, %hi(LIT_444__2)
/* 077A88 00177988 30A94424 */  addiu       $4, $2, %lo(LIT_444__2)
/* 077A8C 0017798C 6890858F */  lw          $5, -0x6F98($28)
/* 077A90 00177990 BC00A627 */  addiu       $6, $29, 0xBC
/* 077A94 00177994 283E0070 */  paddub      $7, $0, $0
/* 077A98 00177998 F4FC040C */  jal         LoadFile2__FPcPvPii
/* 077A9C 0017799C 00000000 */   nop
/* 077AA0 001779A0 0A004010 */  beqz        $2, .L001779CC
/* 077AA4 001779A4 00000000 */   nop
/* 077AA8 001779A8 BC00A28F */  lw          $2, 0xBC($29)
/* 077AAC 001779AC 03110200 */  sra         $2, $2, 4
/* 077AB0 001779B0 01004524 */  addiu       $5, $2, 0x1
/* 077AB4 001779B4 D201023C */  lui         $2, %hi(EdScriptBuffer)
/* 077AB8 001779B8 A0B34424 */  addiu       $4, $2, %lo(EdScriptBuffer)
/* 077ABC 001779BC 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 077AC0 001779C0 00000000 */   nop
/* 077AC4 001779C4 02000010 */  b           .L001779D0
/* 077AC8 001779C8 00000000 */   nop
.L001779CC:
/* 077ACC 001779CC 689080AF */  sw          $0, -0x6F98($28)
.L001779D0:
/* 077AD0 001779D0 1000BF7B */  lq          $31, 0x10($29)
/* 077AD4 001779D4 0000B07B */  lq          $16, 0x0($29)
/* 077AD8 001779D8 C000BD27 */  addiu       $29, $29, 0xC0
/* 077ADC 001779DC 0800E003 */  jr          $31
/* 077AE0 001779E0 00000000 */   nop
/* 077AE4 001779E4 00000000 */  nop
/* 077AE8 001779E8 00000000 */  nop
/* 077AEC 001779EC 00000000 */  nop
