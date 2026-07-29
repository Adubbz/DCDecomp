.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _LOAD_IN_VILLAGER__FP12RS_STACKDATAi
/* 08CE60 0018CD60 80FFBD27 */  addiu       $29, $29, -0x80
/* 08CE64 0018CD64 5000BF7F */  sq          $31, 0x50($29)
/* 08CE68 0018CD68 4000B47F */  sq          $20, 0x40($29)
/* 08CE6C 0018CD6C 3000B37F */  sq          $19, 0x30($29)
/* 08CE70 0018CD70 2000B27F */  sq          $18, 0x20($29)
/* 08CE74 0018CD74 1000B17F */  sq          $17, 0x10($29)
/* 08CE78 0018CD78 0000B07F */  sq          $16, 0x0($29)
/* 08CE7C 0018CD7C 289EA070 */  paddub      $19, $5, $0
/* 08CE80 0018CD80 08009424 */  addiu       $20, $4, 0x8
/* 08CE84 0018CD84 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08CE88 0018CD88 00000000 */   nop
/* 08CE8C 0018CD8C 28864070 */  paddub      $16, $2, $0
/* 08CE90 0018CD90 28260072 */  paddub      $4, $16, $0
/* 08CE94 0018CD94 702C060C */  jal         GetNPC__Fi
/* 08CE98 0018CD98 00000000 */   nop
/* 08CE9C 0018CD9C 288E4070 */  paddub      $17, $2, $0
/* 08CEA0 0018CDA0 04002016 */  bnez        $17, .L0018CDB4
/* 08CEA4 0018CDA4 00000000 */   nop
/* 08CEA8 0018CDA8 28160070 */  paddub      $2, $0, $0
/* 08CEAC 0018CDAC 62000010 */  b           .L0018CF38
/* 08CEB0 0018CDB0 00000000 */   nop
.L0018CDB4:
/* 08CEB4 0018CDB4 28268072 */  paddub      $4, $20, $0
/* 08CEB8 0018CDB8 08009424 */  addiu       $20, $4, 0x8
/* 08CEBC 0018CDBC D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08CEC0 0018CDC0 00000000 */   nop
/* 08CEC4 0018CDC4 28264070 */  paddub      $4, $2, $0
/* 08CEC8 0018CDC8 C82C060C */  jal         GetVillagerInfo__Fi
/* 08CECC 0018CDCC 00000000 */   nop
/* 08CED0 0018CDD0 28964070 */  paddub      $18, $2, $0
/* 08CED4 0018CDD4 28268072 */  paddub      $4, $20, $0
/* 08CED8 0018CDD8 08009424 */  addiu       $20, $4, 0x8
/* 08CEDC 0018CDDC F428060C */  jal         GetStackString__FP12RS_STACKDATA
/* 08CEE0 0018CDE0 00000000 */   nop
/* 08CEE4 0018CDE4 04004014 */  bnez        $2, .L0018CDF8
/* 08CEE8 0018CDE8 00000000 */   nop
/* 08CEEC 0018CDEC 28160070 */  paddub      $2, $0, $0
/* 08CEF0 0018CDF0 51000010 */  b           .L0018CF38
/* 08CEF4 0018CDF4 00000000 */   nop
.L0018CDF8:
/* 08CEF8 0018CDF8 36000326 */  addiu       $3, $16, 0x36
/* 08CEFC 0018CDFC 8C1423AE */  sw          $3, 0x148C($17)
/* 08CF00 0018CE00 28264070 */  paddub      $4, $2, $0
/* 08CF04 0018CE04 282E2072 */  paddub      $5, $17, $0
/* 08CF08 0018CE08 D201023C */  lui         $2, %hi(EdVillagerBuffer)
/* 08CF0C 0018CE0C 60B34624 */  addiu       $6, $2, %lo(EdVillagerBuffer)
/* 08CF10 0018CE10 A418060C */  jal         EdLoadVillager__FPcP12CNPCharacterP14CDataAlloc2_1_
/* 08CF14 0018CE14 00000000 */   nop
/* 08CF18 0018CE18 06004016 */  bnez        $18, .L0018CE34
/* 08CF1C 0018CE1C 00000000 */   nop
/* 08CF20 0018CE20 FFFF0224 */  addiu       $2, $0, -0x1
/* 08CF24 0018CE24 401422AE */  sw          $2, 0x1440($17)
/* 08CF28 0018CE28 441422AE */  sw          $2, 0x1444($17)
/* 08CF2C 0018CE2C 0F000010 */  b           .L0018CE6C
/* 08CF30 0018CE30 00000000 */   nop
.L0018CE34:
/* 08CF34 0018CE34 C0101000 */  sll         $2, $16, 3
/* 08CF38 0018CE38 21105000 */  addu        $2, $2, $16
/* 08CF3C 0018CE3C 00190200 */  sll         $3, $2, 4
/* 08CF40 0018CE40 D301023C */  lui         $2, %hi(EdVillagerInfo)
/* 08CF44 0018CE44 D0294224 */  addiu       $2, $2, %lo(EdVillagerInfo)
/* 08CF48 0018CE48 21204300 */  addu        $4, $2, $3
/* 08CF4C 0018CE4C 282E4072 */  paddub      $5, $18, $0
/* 08CF50 0018CE50 90000624 */  addiu       $6, $0, 0x90
/* 08CF54 0018CE54 EC0C040C */  jal         memcpy
/* 08CF58 0018CE58 00000000 */   nop
/* 08CF5C 0018CE5C 4800428E */  lw          $2, 0x48($18)
/* 08CF60 0018CE60 401422AE */  sw          $2, 0x1440($17)
/* 08CF64 0018CE64 4400428E */  lw          $2, 0x44($18)
/* 08CF68 0018CE68 441422AE */  sw          $2, 0x1444($17)
.L0018CE6C:
/* 08CF6C 0018CE6C 01000224 */  addiu       $2, $0, 0x1
/* 08CF70 0018CE70 741422AE */  sw          $2, 0x1474($17)
/* 08CF74 0018CE74 6C1422AE */  sw          $2, 0x146C($17)
/* 08CF78 0018CE78 701422AE */  sw          $2, 0x1470($17)
/* 08CF7C 0018CE7C 7C1422AE */  sw          $2, 0x147C($17)
/* 08CF80 0018CE80 0043023C */  lui         $2, (0x43000000 >> 16)
/* 08CF84 0018CE84 EC0C22AE */  sw          $2, 0xCEC($17)
/* 08CF88 0018CE88 2700023C */  lui         $2, %hi(LIT_932)
/* 08CF8C 0018CE8C 609B4224 */  addiu       $2, $2, %lo(LIT_932)
/* 08CF90 0018CE90 6000A527 */  addiu       $5, $29, 0x60
/* 08CF94 0018CE94 00004278 */  lq          $2, 0x0($2)
/* 08CF98 0018CE98 0000A27C */  sq          $2, 0x0($5)
/* 08CF9C 0018CE9C 2700023C */  lui         $2, %hi(LIT_933)
/* 08CFA0 0018CEA0 709B4224 */  addiu       $2, $2, %lo(LIT_933)
/* 08CFA4 0018CEA4 7000A327 */  addiu       $3, $29, 0x70
/* 08CFA8 0018CEA8 00004278 */  lq          $2, 0x0($2)
/* 08CFAC 0018CEAC 0000627C */  sq          $2, 0x0($3)
/* 08CFB0 0018CEB0 0400612A */  slti        $1, $19, 0x4
/* 08CFB4 0018CEB4 0F002014 */  bnez        $1, .L0018CEF4
/* 08CFB8 0018CEB8 00000000 */   nop
/* 08CFBC 0018CEBC 28268072 */  paddub      $4, $20, $0
/* 08CFC0 0018CEC0 7C2D060C */  jal         GetPosition__FP12RS_STACKDATAPf
/* 08CFC4 0018CEC4 00000000 */   nop
/* 08CFC8 0018CEC8 18009426 */  addiu       $20, $20, 0x18
/* 08CFCC 0018CECC 28268072 */  paddub      $4, $20, $0
/* 08CFD0 0018CED0 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 08CFD4 0018CED4 00000000 */   nop
/* 08CFD8 0018CED8 7400A0E7 */  swc1        $f0, 0x74($29)
/* 08CFDC 0018CEDC 7800A0AF */  sw          $0, 0x78($29)
/* 08CFE0 0018CEE0 7000A0AF */  sw          $0, 0x70($29)
/* 08CFE4 0018CEE4 7000A427 */  addiu       $4, $29, 0x70
/* 08CFE8 0018CEE8 282E8070 */  paddub      $5, $4, $0
/* 08CFEC 0018CEEC 342D060C */  jal         GetWorldRot__FPfPf
/* 08CFF0 0018CEF0 00000000 */   nop
.L0018CEF4:
/* 08CFF4 0018CEF4 28262072 */  paddub      $4, $17, $0
/* 08CFF8 0018CEF8 6000A527 */  addiu       $5, $29, 0x60
/* 08CFFC 0018CEFC A000398E */  lw          $25, 0xA0($17)
/* 08D000 0018CF00 1400398F */  lw          $25, 0x14($25)
/* 08D004 0018CF04 09F82003 */  jalr        $25
/* 08D008 0018CF08 00000000 */   nop
/* 08D00C 0018CF0C 28262072 */  paddub      $4, $17, $0
/* 08D010 0018CF10 7000A527 */  addiu       $5, $29, 0x70
/* 08D014 0018CF14 A000398E */  lw          $25, 0xA0($17)
/* 08D018 0018CF18 3400398F */  lw          $25, 0x34($25)
/* 08D01C 0018CF1C 09F82003 */  jalr        $25
/* 08D020 0018CF20 00000000 */   nop
/* 08D024 0018CF24 680C20AE */  sw          $0, 0xC68($17)
/* 08D028 0018CF28 640C20AE */  sw          $0, 0xC64($17)
/* 08D02C 0018CF2C 80BF023C */  lui         $2, (0xBF800000 >> 16)
/* 08D030 0018CF30 600C22AE */  sw          $2, 0xC60($17)
/* 08D034 0018CF34 01000224 */  addiu       $2, $0, 0x1
.L0018CF38:
/* 08D038 0018CF38 5000BF7B */  lq          $31, 0x50($29)
/* 08D03C 0018CF3C 4000B47B */  lq          $20, 0x40($29)
/* 08D040 0018CF40 3000B37B */  lq          $19, 0x30($29)
/* 08D044 0018CF44 2000B27B */  lq          $18, 0x20($29)
/* 08D048 0018CF48 1000B17B */  lq          $17, 0x10($29)
/* 08D04C 0018CF4C 0000B07B */  lq          $16, 0x0($29)
/* 08D050 0018CF50 8000BD27 */  addiu       $29, $29, 0x80
/* 08D054 0018CF54 0800E003 */  jr          $31
/* 08D058 0018CF58 00000000 */   nop
/* 08D05C 0018CF5C 00000000 */  nop
