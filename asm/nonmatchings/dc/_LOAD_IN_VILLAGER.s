.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _LOAD_IN_VILLAGER__FP12RS_STACKDATAi
/* 8CE60 0018CD60 80FFBD27 */  addiu      $sp, $sp, -0x80
/* 8CE64 0018CD64 5000BF7F */  sq         $31, 0x50($sp)
/* 8CE68 0018CD68 4000B47F */  sq         $20, 0x40($sp)
/* 8CE6C 0018CD6C 3000B37F */  sq         $19, 0x30($sp)
/* 8CE70 0018CD70 2000B27F */  sq         $18, 0x20($sp)
/* 8CE74 0018CD74 1000B17F */  sq         $17, 0x10($sp)
/* 8CE78 0018CD78 0000B07F */  sq         $16, 0x0($sp)
/* 8CE7C 0018CD7C 289EA070 */  paddub     $19, $5, $0
/* 8CE80 0018CD80 08009424 */  addiu      $20, $4, 0x8
/* 8CE84 0018CD84 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8CE88 0018CD88 00000000 */   nop
/* 8CE8C 0018CD8C 28864070 */  paddub     $16, $2, $0
/* 8CE90 0018CD90 28260072 */  paddub     $4, $16, $0
/* 8CE94 0018CD94 702C060C */  jal        GetNPC__Fi
/* 8CE98 0018CD98 00000000 */   nop
/* 8CE9C 0018CD9C 288E4070 */  paddub     $17, $2, $0
/* 8CEA0 0018CDA0 04002016 */  bnez       $17, .L0018CDB4
/* 8CEA4 0018CDA4 00000000 */   nop
/* 8CEA8 0018CDA8 28160070 */  paddub     $2, $0, $0
/* 8CEAC 0018CDAC 62000010 */  b          .L0018CF38
/* 8CEB0 0018CDB0 00000000 */   nop
.L0018CDB4:
/* 8CEB4 0018CDB4 28268072 */  paddub     $4, $20, $0
/* 8CEB8 0018CDB8 08009424 */  addiu      $20, $4, 0x8
/* 8CEBC 0018CDBC D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8CEC0 0018CDC0 00000000 */   nop
/* 8CEC4 0018CDC4 28264070 */  paddub     $4, $2, $0
/* 8CEC8 0018CDC8 C82C060C */  jal        GetVillagerInfo__Fi
/* 8CECC 0018CDCC 00000000 */   nop
/* 8CED0 0018CDD0 28964070 */  paddub     $18, $2, $0
/* 8CED4 0018CDD4 28268072 */  paddub     $4, $20, $0
/* 8CED8 0018CDD8 08009424 */  addiu      $20, $4, 0x8
/* 8CEDC 0018CDDC F428060C */  jal        GetStackString__FP12RS_STACKDATA
/* 8CEE0 0018CDE0 00000000 */   nop
/* 8CEE4 0018CDE4 04004014 */  bnez       $2, .L0018CDF8
/* 8CEE8 0018CDE8 00000000 */   nop
/* 8CEEC 0018CDEC 28160070 */  paddub     $2, $0, $0
/* 8CEF0 0018CDF0 51000010 */  b          .L0018CF38
/* 8CEF4 0018CDF4 00000000 */   nop
.L0018CDF8:
/* 8CEF8 0018CDF8 36000326 */  addiu      $3, $16, 0x36
/* 8CEFC 0018CDFC 8C1423AE */  sw         $3, 0x148C($17)
/* 8CF00 0018CE00 28264070 */  paddub     $4, $2, $0
/* 8CF04 0018CE04 282E2072 */  paddub     $5, $17, $0
/* 8CF08 0018CE08 D201023C */  lui        $2, %hi(EdVillagerBuffer)
/* 8CF0C 0018CE0C 60B34624 */  addiu      $6, $2, %lo(EdVillagerBuffer)
/* 8CF10 0018CE10 A418060C */  jal        EdLoadVillager__FPcP12CNPCharacterP14CDataAlloc2_1_
/* 8CF14 0018CE14 00000000 */   nop
/* 8CF18 0018CE18 06004016 */  bnez       $18, .L0018CE34
/* 8CF1C 0018CE1C 00000000 */   nop
/* 8CF20 0018CE20 FFFF0224 */  addiu      $2, $0, -0x1
/* 8CF24 0018CE24 401422AE */  sw         $2, 0x1440($17)
/* 8CF28 0018CE28 441422AE */  sw         $2, 0x1444($17)
/* 8CF2C 0018CE2C 0F000010 */  b          .L0018CE6C
/* 8CF30 0018CE30 00000000 */   nop
.L0018CE34:
/* 8CF34 0018CE34 C0101000 */  sll        $2, $16, 3
/* 8CF38 0018CE38 21105000 */  addu       $2, $2, $16
/* 8CF3C 0018CE3C 00190200 */  sll        $3, $2, 4
/* 8CF40 0018CE40 D301023C */  lui        $2, %hi(EdVillagerInfo)
/* 8CF44 0018CE44 D0294224 */  addiu      $2, $2, %lo(EdVillagerInfo)
/* 8CF48 0018CE48 21204300 */  addu       $4, $2, $3
/* 8CF4C 0018CE4C 282E4072 */  paddub     $5, $18, $0
/* 8CF50 0018CE50 90000624 */  addiu      $6, $0, 0x90
/* 8CF54 0018CE54 EC0C040C */  jal        memcpy
/* 8CF58 0018CE58 00000000 */   nop
/* 8CF5C 0018CE5C 4800428E */  lw         $2, 0x48($18)
/* 8CF60 0018CE60 401422AE */  sw         $2, 0x1440($17)
/* 8CF64 0018CE64 4400428E */  lw         $2, 0x44($18)
/* 8CF68 0018CE68 441422AE */  sw         $2, 0x1444($17)
.L0018CE6C:
/* 8CF6C 0018CE6C 01000224 */  addiu      $2, $0, 0x1
/* 8CF70 0018CE70 741422AE */  sw         $2, 0x1474($17)
/* 8CF74 0018CE74 6C1422AE */  sw         $2, 0x146C($17)
/* 8CF78 0018CE78 701422AE */  sw         $2, 0x1470($17)
/* 8CF7C 0018CE7C 7C1422AE */  sw         $2, 0x147C($17)
/* 8CF80 0018CE80 0043023C */  lui        $2, (0x43000000 >> 16)
/* 8CF84 0018CE84 EC0C22AE */  sw         $2, 0xCEC($17)
/* 8CF88 0018CE88 2700023C */  lui        $2, %hi(_932)
/* 8CF8C 0018CE8C 609B4224 */  addiu      $2, $2, %lo(_932)
/* 8CF90 0018CE90 6000A527 */  addiu      $5, $sp, 0x60
/* 8CF94 0018CE94 00004278 */  lq         $2, 0x0($2)
/* 8CF98 0018CE98 0000A27C */  sq         $2, 0x0($5)
/* 8CF9C 0018CE9C 2700023C */  lui        $2, %hi(_933)
/* 8CFA0 0018CEA0 709B4224 */  addiu      $2, $2, %lo(_933)
/* 8CFA4 0018CEA4 7000A327 */  addiu      $3, $sp, 0x70
/* 8CFA8 0018CEA8 00004278 */  lq         $2, 0x0($2)
/* 8CFAC 0018CEAC 0000627C */  sq         $2, 0x0($3)
/* 8CFB0 0018CEB0 0400612A */  slti       $at, $19, 0x4
/* 8CFB4 0018CEB4 0F002014 */  bnez       $at, .L0018CEF4
/* 8CFB8 0018CEB8 00000000 */   nop
/* 8CFBC 0018CEBC 28268072 */  paddub     $4, $20, $0
/* 8CFC0 0018CEC0 7C2D060C */  jal        GetPosition__FP12RS_STACKDATAPf
/* 8CFC4 0018CEC4 00000000 */   nop
/* 8CFC8 0018CEC8 18009426 */  addiu      $20, $20, 0x18
/* 8CFCC 0018CECC 28268072 */  paddub     $4, $20, $0
/* 8CFD0 0018CED0 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 8CFD4 0018CED4 00000000 */   nop
/* 8CFD8 0018CED8 7400A0E7 */  swc1       $f0, 0x74($sp)
/* 8CFDC 0018CEDC 7800A0AF */  sw         $0, 0x78($sp)
/* 8CFE0 0018CEE0 7000A0AF */  sw         $0, 0x70($sp)
/* 8CFE4 0018CEE4 7000A427 */  addiu      $4, $sp, 0x70
/* 8CFE8 0018CEE8 282E8070 */  paddub     $5, $4, $0
/* 8CFEC 0018CEEC 342D060C */  jal        GetWorldRot__FPfPf
/* 8CFF0 0018CEF0 00000000 */   nop
.L0018CEF4:
/* 8CFF4 0018CEF4 28262072 */  paddub     $4, $17, $0
/* 8CFF8 0018CEF8 6000A527 */  addiu      $5, $sp, 0x60
/* 8CFFC 0018CEFC A000398E */  lw         $25, 0xA0($17)
/* 8D000 0018CF00 1400398F */  lw         $25, 0x14($25)
/* 8D004 0018CF04 09F82003 */  jalr       $25
/* 8D008 0018CF08 00000000 */   nop
/* 8D00C 0018CF0C 28262072 */  paddub     $4, $17, $0
/* 8D010 0018CF10 7000A527 */  addiu      $5, $sp, 0x70
/* 8D014 0018CF14 A000398E */  lw         $25, 0xA0($17)
/* 8D018 0018CF18 3400398F */  lw         $25, 0x34($25)
/* 8D01C 0018CF1C 09F82003 */  jalr       $25
/* 8D020 0018CF20 00000000 */   nop
/* 8D024 0018CF24 680C20AE */  sw         $0, 0xC68($17)
/* 8D028 0018CF28 640C20AE */  sw         $0, 0xC64($17)
/* 8D02C 0018CF2C 80BF023C */  lui        $2, (0xBF800000 >> 16)
/* 8D030 0018CF30 600C22AE */  sw         $2, 0xC60($17)
/* 8D034 0018CF34 01000224 */  addiu      $2, $0, 0x1
.L0018CF38:
/* 8D038 0018CF38 5000BF7B */  lq         $31, 0x50($sp)
/* 8D03C 0018CF3C 4000B47B */  lq         $20, 0x40($sp)
/* 8D040 0018CF40 3000B37B */  lq         $19, 0x30($sp)
/* 8D044 0018CF44 2000B27B */  lq         $18, 0x20($sp)
/* 8D048 0018CF48 1000B17B */  lq         $17, 0x10($sp)
/* 8D04C 0018CF4C 0000B07B */  lq         $16, 0x0($sp)
/* 8D050 0018CF50 8000BD27 */  addiu      $sp, $sp, 0x80
/* 8D054 0018CF54 0800E003 */  jr         $31
/* 8D058 0018CF58 00000000 */   nop
/* 8D05C 0018CF5C 00000000 */  nop
