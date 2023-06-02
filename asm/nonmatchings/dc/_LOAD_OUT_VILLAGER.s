.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _LOAD_OUT_VILLAGER__FP12RS_STACKDATAi
/* 8D060 0018CF60 80FFBD27 */  addiu      $sp, $sp, -0x80
/* 8D064 0018CF64 5000BF7F */  sq         $31, 0x50($sp)
/* 8D068 0018CF68 4000B47F */  sq         $20, 0x40($sp)
/* 8D06C 0018CF6C 3000B37F */  sq         $19, 0x30($sp)
/* 8D070 0018CF70 2000B27F */  sq         $18, 0x20($sp)
/* 8D074 0018CF74 1000B17F */  sq         $17, 0x10($sp)
/* 8D078 0018CF78 0000B07F */  sq         $16, 0x0($sp)
/* 8D07C 0018CF7C 2896A070 */  paddub     $18, $5, $0
/* 8D080 0018CF80 08009324 */  addiu      $19, $4, 0x8
/* 8D084 0018CF84 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8D088 0018CF88 00000000 */   nop
/* 8D08C 0018CF8C 28A64070 */  paddub     $20, $2, $0
/* 8D090 0018CF90 28268072 */  paddub     $4, $20, $0
/* 8D094 0018CF94 702C060C */  jal        GetNPC__Fi
/* 8D098 0018CF98 00000000 */   nop
/* 8D09C 0018CF9C 28864070 */  paddub     $16, $2, $0
/* 8D0A0 0018CFA0 04000016 */  bnez       $16, .L0018CFB4
/* 8D0A4 0018CFA4 00000000 */   nop
/* 8D0A8 0018CFA8 28160070 */  paddub     $2, $0, $0
/* 8D0AC 0018CFAC 53000010 */  b          .L0018D0FC
/* 8D0B0 0018CFB0 00000000 */   nop
.L0018CFB4:
/* 8D0B4 0018CFB4 28266072 */  paddub     $4, $19, $0
/* 8D0B8 0018CFB8 08009324 */  addiu      $19, $4, 0x8
/* 8D0BC 0018CFBC D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8D0C0 0018CFC0 00000000 */   nop
/* 8D0C4 0018CFC4 28264070 */  paddub     $4, $2, $0
/* 8D0C8 0018CFC8 C82C060C */  jal        GetVillagerInfo__Fi
/* 8D0CC 0018CFCC 00000000 */   nop
/* 8D0D0 0018CFD0 288E4070 */  paddub     $17, $2, $0
/* 8D0D4 0018CFD4 28266072 */  paddub     $4, $19, $0
/* 8D0D8 0018CFD8 08009324 */  addiu      $19, $4, 0x8
/* 8D0DC 0018CFDC F428060C */  jal        GetStackString__FP12RS_STACKDATA
/* 8D0E0 0018CFE0 00000000 */   nop
/* 8D0E4 0018CFE4 04004014 */  bnez       $2, .L0018CFF8
/* 8D0E8 0018CFE8 00000000 */   nop
/* 8D0EC 0018CFEC 28160070 */  paddub     $2, $0, $0
/* 8D0F0 0018CFF0 42000010 */  b          .L0018D0FC
/* 8D0F4 0018CFF4 00000000 */   nop
.L0018CFF8:
/* 8D0F8 0018CFF8 36008326 */  addiu      $3, $20, 0x36
/* 8D0FC 0018CFFC 8C1403AE */  sw         $3, 0x148C($16)
/* 8D100 0018D000 28264070 */  paddub     $4, $2, $0
/* 8D104 0018D004 282E0072 */  paddub     $5, $16, $0
/* 8D108 0018D008 D201023C */  lui        $2, %hi(EdVillagerBuffer)
/* 8D10C 0018D00C 60B34624 */  addiu      $6, $2, %lo(EdVillagerBuffer)
/* 8D110 0018D010 A418060C */  jal        EdLoadVillager__FPcP12CNPCharacterP14CDataAlloc2_1_
/* 8D114 0018D014 00000000 */   nop
/* 8D118 0018D018 FFFF0224 */  addiu      $2, $0, -0x1
/* 8D11C 0018D01C 401402AE */  sw         $2, 0x1440($16)
/* 8D120 0018D020 441402AE */  sw         $2, 0x1444($16)
/* 8D124 0018D024 02002012 */  beqz       $17, .L0018D030
/* 8D128 0018D028 00000000 */   nop
/* 8D12C 0018D02C 440022AE */  sw         $2, 0x44($17)
.L0018D030:
/* 8D130 0018D030 01000224 */  addiu      $2, $0, 0x1
/* 8D134 0018D034 741402AE */  sw         $2, 0x1474($16)
/* 8D138 0018D038 6C1402AE */  sw         $2, 0x146C($16)
/* 8D13C 0018D03C 701402AE */  sw         $2, 0x1470($16)
/* 8D140 0018D040 7C1400AE */  sw         $0, 0x147C($16)
/* 8D144 0018D044 0043023C */  lui        $2, (0x43000000 >> 16)
/* 8D148 0018D048 EC0C02AE */  sw         $2, 0xCEC($16)
/* 8D14C 0018D04C 2700023C */  lui        $2, %hi(_944)
/* 8D150 0018D050 809B4224 */  addiu      $2, $2, %lo(_944)
/* 8D154 0018D054 6000A527 */  addiu      $5, $sp, 0x60
/* 8D158 0018D058 00004278 */  lq         $2, 0x0($2)
/* 8D15C 0018D05C 0000A27C */  sq         $2, 0x0($5)
/* 8D160 0018D060 2700023C */  lui        $2, %hi(_945)
/* 8D164 0018D064 909B4224 */  addiu      $2, $2, %lo(_945)
/* 8D168 0018D068 7000A327 */  addiu      $3, $sp, 0x70
/* 8D16C 0018D06C 00004278 */  lq         $2, 0x0($2)
/* 8D170 0018D070 0000627C */  sq         $2, 0x0($3)
/* 8D174 0018D074 0400412A */  slti       $at, $18, 0x4
/* 8D178 0018D078 0F002014 */  bnez       $at, .L0018D0B8
/* 8D17C 0018D07C 00000000 */   nop
/* 8D180 0018D080 28266072 */  paddub     $4, $19, $0
/* 8D184 0018D084 7C2D060C */  jal        GetPosition__FP12RS_STACKDATAPf
/* 8D188 0018D088 00000000 */   nop
/* 8D18C 0018D08C 18007326 */  addiu      $19, $19, 0x18
/* 8D190 0018D090 28266072 */  paddub     $4, $19, $0
/* 8D194 0018D094 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 8D198 0018D098 00000000 */   nop
/* 8D19C 0018D09C 7400A0E7 */  swc1       $f0, 0x74($sp)
/* 8D1A0 0018D0A0 7800A0AF */  sw         $0, 0x78($sp)
/* 8D1A4 0018D0A4 7000A0AF */  sw         $0, 0x70($sp)
/* 8D1A8 0018D0A8 7000A427 */  addiu      $4, $sp, 0x70
/* 8D1AC 0018D0AC 282E8070 */  paddub     $5, $4, $0
/* 8D1B0 0018D0B0 342D060C */  jal        GetWorldRot__FPfPf
/* 8D1B4 0018D0B4 00000000 */   nop
.L0018D0B8:
/* 8D1B8 0018D0B8 28260072 */  paddub     $4, $16, $0
/* 8D1BC 0018D0BC 6000A527 */  addiu      $5, $sp, 0x60
/* 8D1C0 0018D0C0 A000198E */  lw         $25, 0xA0($16)
/* 8D1C4 0018D0C4 1400398F */  lw         $25, 0x14($25)
/* 8D1C8 0018D0C8 09F82003 */  jalr       $25
/* 8D1CC 0018D0CC 00000000 */   nop
/* 8D1D0 0018D0D0 28260072 */  paddub     $4, $16, $0
/* 8D1D4 0018D0D4 7000A527 */  addiu      $5, $sp, 0x70
/* 8D1D8 0018D0D8 A000198E */  lw         $25, 0xA0($16)
/* 8D1DC 0018D0DC 3400398F */  lw         $25, 0x34($25)
/* 8D1E0 0018D0E0 09F82003 */  jalr       $25
/* 8D1E4 0018D0E4 00000000 */   nop
/* 8D1E8 0018D0E8 680C00AE */  sw         $0, 0xC68($16)
/* 8D1EC 0018D0EC 640C00AE */  sw         $0, 0xC64($16)
/* 8D1F0 0018D0F0 80BF023C */  lui        $2, (0xBF800000 >> 16)
/* 8D1F4 0018D0F4 600C02AE */  sw         $2, 0xC60($16)
/* 8D1F8 0018D0F8 01000224 */  addiu      $2, $0, 0x1
.L0018D0FC:
/* 8D1FC 0018D0FC 5000BF7B */  lq         $31, 0x50($sp)
/* 8D200 0018D100 4000B47B */  lq         $20, 0x40($sp)
/* 8D204 0018D104 3000B37B */  lq         $19, 0x30($sp)
/* 8D208 0018D108 2000B27B */  lq         $18, 0x20($sp)
/* 8D20C 0018D10C 1000B17B */  lq         $17, 0x10($sp)
/* 8D210 0018D110 0000B07B */  lq         $16, 0x0($sp)
/* 8D214 0018D114 8000BD27 */  addiu      $sp, $sp, 0x80
/* 8D218 0018D118 0800E003 */  jr         $31
/* 8D21C 0018D11C 00000000 */   nop
