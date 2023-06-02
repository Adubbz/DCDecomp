.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdDrawSysCursor__FP14ED_EVENT_POINTi
/* 7CCF0 0017CBF0 60FFBD27 */  addiu      $sp, $sp, -0xA0
/* 7CCF4 0017CBF4 6000BF7F */  sq         $31, 0x60($sp)
/* 7CCF8 0017CBF8 5000B57F */  sq         $21, 0x50($sp)
/* 7CCFC 0017CBFC 4000B47F */  sq         $20, 0x40($sp)
/* 7CD00 0017CC00 3000B37F */  sq         $19, 0x30($sp)
/* 7CD04 0017CC04 2000B27F */  sq         $18, 0x20($sp)
/* 7CD08 0017CC08 1000B17F */  sq         $17, 0x10($sp)
/* 7CD0C 0017CC0C 0000B07F */  sq         $16, 0x0($sp)
/* 7CD10 0017CC10 28AE8070 */  paddub     $21, $4, $0
/* 7CD14 0017CC14 28A6A070 */  paddub     $20, $5, $0
/* 7CD18 0017CC18 448F838F */  lw         $3, -0x70BC($gp)
/* 7CD1C 0017CC1C F0006014 */  bnez       $3, .L0017CFE0
/* 7CD20 0017CC20 00000000 */   nop
/* 7CD24 0017CC24 A8918283 */  lb         $2, -0x6E58($gp)
/* 7CD28 0017CC28 05004014 */  bnez       $2, .L0017CC40
/* 7CD2C 0017CC2C 00000000 */   nop
/* 7CD30 0017CC30 2040023C */  lui        $2, (0x40200000 >> 16)
/* 7CD34 0017CC34 A49182AF */  sw         $2, -0x6E5C($gp)
/* 7CD38 0017CC38 01000224 */  addiu      $2, $0, 0x1
/* 7CD3C 0017CC3C A89182A3 */  sb         $2, -0x6E58($gp)
.L0017CC40:
/* 7CD40 0017CC40 A49181C7 */  lwc1       $f1, -0x6E5C($gp)
/* 7CD44 0017CC44 808080C7 */  lwc1       $f0, -0x7F80($gp)
/* 7CD48 0017CC48 41080046 */  sub.s      $f1, $f1, $f0
/* 7CD4C 0017CC4C A49181E7 */  swc1       $f1, -0x6E5C($gp)
/* 7CD50 0017CC50 00008044 */  mtc1       $0, $f0
/* 7CD54 0017CC54 00000000 */  nop
/* 7CD58 0017CC58 34080046 */  c.lt.s     $f1, $f0
/* 7CD5C 0017CC5C 00000000 */  nop
/* 7CD60 0017CC60 03000045 */  bc1f       .L0017CC70
/* 7CD64 0017CC64 00000000 */   nop
/* 7CD68 0017CC68 2040023C */  lui        $2, (0x40200000 >> 16)
/* 7CD6C 0017CC6C A49182AF */  sw         $2, -0x6E5C($gp)
.L0017CC70:
/* 7CD70 0017CC70 28260070 */  paddub     $4, $0, $0
/* 7CD74 0017CC74 D83A080C */  jal        SetMonsterNameDrawFlag__Fi
/* 7CD78 0017CC78 00000000 */   nop
/* 7CD7C 0017CC7C 28860070 */  paddub     $16, $0, $0
/* 7CD80 0017CC80 8D000010 */  b          .L0017CEB8
/* 7CD84 0017CC84 00000000 */   nop
.L0017CC88:
/* 7CD88 0017CC88 28260070 */  paddub     $4, $0, $0
/* 7CD8C 0017CC8C 40111000 */  sll        $2, $16, 5
/* 7CD90 0017CC90 21185000 */  addu       $3, $2, $16
/* 7CD94 0017CC94 80100300 */  sll        $2, $3, 2
/* 7CD98 0017CC98 21106200 */  addu       $2, $3, $2
/* 7CD9C 0017CC9C 40890200 */  sll        $17, $2, 5
/* 7CDA0 0017CCA0 D201023C */  lui        $2, %hi(D_1D26FFC)
/* 7CDA4 0017CCA4 FC6F4224 */  addiu      $2, $2, %lo(D_1D26FFC)
/* 7CDA8 0017CCA8 21105100 */  addu       $2, $2, $17
/* 7CDAC 0017CCAC 0000428C */  lw         $2, 0x0($2)
/* 7CDB0 0017CCB0 08004010 */  beqz       $2, .L0017CCD4
/* 7CDB4 0017CCB4 00000000 */   nop
/* 7CDB8 0017CCB8 D201023C */  lui        $2, %hi(D_1D27000)
/* 7CDBC 0017CCBC 00704224 */  addiu      $2, $2, %lo(D_1D27000)
/* 7CDC0 0017CCC0 21105100 */  addu       $2, $2, $17
/* 7CDC4 0017CCC4 0000428C */  lw         $2, 0x0($2)
/* 7CDC8 0017CCC8 02004010 */  beqz       $2, .L0017CCD4
/* 7CDCC 0017CCCC 00000000 */   nop
/* 7CDD0 0017CCD0 01000464 */  daddiu     $4, $0, 0x1
.L0017CCD4:
/* 7CDD4 0017CCD4 FF008230 */  andi       $2, $4, 0xFF
/* 7CDD8 0017CCD8 76004010 */  beqz       $2, .L0017CEB4
/* 7CDDC 0017CCDC 00000000 */   nop
/* 7CDE0 0017CCE0 D201023C */  lui        $2, %hi(EdVillager)
/* 7CDE4 0017CCE4 905B4224 */  addiu      $2, $2, %lo(EdVillager)
/* 7CDE8 0017CCE8 21905100 */  addu       $18, $2, $17
/* 7CDEC 0017CCEC 7000A427 */  addiu      $4, $sp, 0x70
/* 7CDF0 0017CCF0 10004526 */  addiu      $5, $18, 0x10
/* 7CDF4 0017CCF4 0C86040C */  jal        sceVu0CopyVector
/* 7CDF8 0017CCF8 00000000 */   nop
/* 7CDFC 0017CCFC D201023C */  lui        $2, %hi(D_1D25C44)
/* 7CE00 0017CD00 445C4224 */  addiu      $2, $2, %lo(D_1D25C44)
/* 7CE04 0017CD04 21105100 */  addu       $2, $2, $17
/* 7CE08 0017CD08 000041C4 */  lwc1       $f1, 0x0($2)
/* 7CE0C 0017CD0C 0040023C */  lui        $2, (0x40000000 >> 16)
/* 7CE10 0017CD10 00008244 */  mtc1       $2, $f0
/* 7CE14 0017CD14 00000000 */  nop
/* 7CE18 0017CD18 40000146 */  add.s      $f1, $f0, $f1
/* 7CE1C 0017CD1C 7400B327 */  addiu      $19, $sp, 0x74
/* 7CE20 0017CD20 000060C6 */  lwc1       $f0, 0x0($19)
/* 7CE24 0017CD24 00000146 */  add.s      $f0, $f0, $f1
/* 7CE28 0017CD28 000060E6 */  swc1       $f0, 0x0($19)
/* 7CE2C 0017CD2C 2C90828F */  lw         $2, -0x6FD4($gp)
/* 7CE30 0017CD30 2B004014 */  bnez       $2, .L0017CDE0
/* 7CE34 0017CD34 00000000 */   nop
/* 7CE38 0017CD38 28264072 */  paddub     $4, $18, $0
/* 7CE3C 0017CD3C 9C59050C */  jal        CheckDraw__12CNPCharacterFv
/* 7CE40 0017CD40 00000000 */   nop
/* 7CE44 0017CD44 26004014 */  bnez       $2, .L0017CDE0
/* 7CE48 0017CD48 00000000 */   nop
/* 7CE4C 0017CD4C D201023C */  lui        $2, %hi(D_1D26FF8)
/* 7CE50 0017CD50 F86F4224 */  addiu      $2, $2, %lo(D_1D26FF8)
/* 7CE54 0017CD54 21105100 */  addu       $2, $2, $17
/* 7CE58 0017CD58 0000428C */  lw         $2, 0x0($2)
/* 7CE5C 0017CD5C 20004014 */  bnez       $2, .L0017CDE0
/* 7CE60 0017CD60 00000000 */   nop
/* 7CE64 0017CD64 288D838F */  lw         $3, -0x72D8($gp)
/* 7CE68 0017CD68 03000224 */  addiu      $2, $0, 0x3
/* 7CE6C 0017CD6C 08006214 */  bne        $3, $2, .L0017CD90
/* 7CE70 0017CD70 00000000 */   nop
/* 7CE74 0017CD74 D201023C */  lui        $2, %hi(D_1D26FD4)
/* 7CE78 0017CD78 D46F4224 */  addiu      $2, $2, %lo(D_1D26FD4)
/* 7CE7C 0017CD7C 21105100 */  addu       $2, $2, $17
/* 7CE80 0017CD80 0000438C */  lw         $3, 0x0($2)
/* 7CE84 0017CD84 08000224 */  addiu      $2, $0, 0x8
/* 7CE88 0017CD88 4A006210 */  beq        $3, $2, .L0017CEB4
/* 7CE8C 0017CD8C 00000000 */   nop
.L0017CD90:
/* 7CE90 0017CD90 000061C6 */  lwc1       $f1, 0x0($19)
/* 7CE94 0017CD94 A49180C7 */  lwc1       $f0, -0x6E5C($gp)
/* 7CE98 0017CD98 00080046 */  add.s      $f0, $f1, $f0
/* 7CE9C 0017CD9C 000060E6 */  swc1       $f0, 0x0($19)
/* 7CEA0 0017CDA0 1091848F */  lw         $4, -0x6EF0($gp)
/* 7CEA4 0017CDA4 7000A527 */  addiu      $5, $sp, 0x70
/* 7CEA8 0017CDA8 B89F040C */  jal        SetPosition__6CFrameFPf
/* 7CEAC 0017CDAC 00000000 */   nop
/* 7CEB0 0017CDB0 00608044 */  mtc1       $0, $f12
/* 7CEB4 0017CDB4 00000000 */  nop
/* 7CEB8 0017CDB8 86630046 */  mov.s      $f14, $f12
/* 7CEBC 0017CDBC 46630046 */  mov.s      $f13, $f12
/* 7CEC0 0017CDC0 1091848F */  lw         $4, -0x6EF0($gp)
/* 7CEC4 0017CDC4 70A3040C */  jal        SetRotation__6CFrameFfff
/* 7CEC8 0017CDC8 00000000 */   nop
/* 7CECC 0017CDCC 1091848F */  lw         $4, -0x6EF0($gp)
/* 7CED0 0017CDD0 60BB040C */  jal        MGDraw__FP6CFrame
/* 7CED4 0017CDD4 00000000 */   nop
/* 7CED8 0017CDD8 36000010 */  b          .L0017CEB4
/* 7CEDC 0017CDDC 00000000 */   nop
.L0017CDE0:
/* 7CEE0 0017CDE0 28264072 */  paddub     $4, $18, $0
/* 7CEE4 0017CDE4 9C59050C */  jal        CheckDraw__12CNPCharacterFv
/* 7CEE8 0017CDE8 00000000 */   nop
/* 7CEEC 0017CDEC 31004010 */  beqz       $2, .L0017CEB4
/* 7CEF0 0017CDF0 00000000 */   nop
/* 7CEF4 0017CDF4 D201023C */  lui        $2, %hi(D_1D26FF8)
/* 7CEF8 0017CDF8 F86F4224 */  addiu      $2, $2, %lo(D_1D26FF8)
/* 7CEFC 0017CDFC 21105100 */  addu       $2, $2, $17
/* 7CF00 0017CE00 0000428C */  lw         $2, 0x0($2)
/* 7CF04 0017CE04 2B004010 */  beqz       $2, .L0017CEB4
/* 7CF08 0017CE08 00000000 */   nop
/* 7CF0C 0017CE0C 48A8050C */  jal        EdCheckViewMode__Fv
/* 7CF10 0017CE10 00000000 */   nop
/* 7CF14 0017CE14 27004014 */  bnez       $2, .L0017CEB4
/* 7CF18 0017CE18 00000000 */   nop
/* 7CF1C 0017CE1C 0C91848F */  lw         $4, -0x6EF4($gp)
/* 7CF20 0017CE20 7000A527 */  addiu      $5, $sp, 0x70
/* 7CF24 0017CE24 B89F040C */  jal        SetPosition__6CFrameFPf
/* 7CF28 0017CE28 00000000 */   nop
/* 7CF2C 0017CE2C 0C91848F */  lw         $4, -0x6EF4($gp)
/* 7CF30 0017CE30 60BB040C */  jal        MGDraw__FP6CFrame
/* 7CF34 0017CE34 00000000 */   nop
/* 7CF38 0017CE38 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 7CF3C 0017CE3C 7C00A2AF */  sw         $2, 0x7C($sp)
/* 7CF40 0017CE40 8000A427 */  addiu      $4, $sp, 0x80
/* 7CF44 0017CE44 7000A527 */  addiu      $5, $sp, 0x70
/* 7CF48 0017CE48 28360070 */  paddub     $6, $0, $0
/* 7CF4C 0017CE4C 38B9040C */  jal        MGRotTransPers2D__FPiPfi
/* 7CF50 0017CE50 00000000 */   nop
/* 7CF54 0017CE54 17004010 */  beqz       $2, .L0017CEB4
/* 7CF58 0017CE58 00000000 */   nop
/* 7CF5C 0017CE5C 288D838F */  lw         $3, -0x72D8($gp)
/* 7CF60 0017CE60 80100300 */  sll        $2, $3, 2
/* 7CF64 0017CE64 21184300 */  addu       $3, $2, $3
/* 7CF68 0017CE68 80100300 */  sll        $2, $3, 2
/* 7CF6C 0017CE6C 21106200 */  addu       $2, $3, $2
/* 7CF70 0017CE70 80100200 */  sll        $2, $2, 2
/* 7CF74 0017CE74 30F84324 */  addiu      $3, $2, -0x7D0
/* 7CF78 0017CE78 D201023C */  lui        $2, %hi(D_1D26FD4)
/* 7CF7C 0017CE7C D46F4224 */  addiu      $2, $2, %lo(D_1D26FD4)
/* 7CF80 0017CE80 21105100 */  addu       $2, $2, $17
/* 7CF84 0017CE84 0000428C */  lw         $2, 0x0($2)
/* 7CF88 0017CE88 21206200 */  addu       $4, $3, $2
/* 7CF8C 0017CE8C 643B080C */  jal        MonsterNameMake__Fi
/* 7CF90 0017CE90 00000000 */   nop
/* 7CF94 0017CE94 8400A28F */  lw         $2, 0x84($sp)
/* 7CF98 0017CE98 BAFF4524 */  addiu      $5, $2, -0x46
/* 7CF9C 0017CE9C 8000A48F */  lw         $4, 0x80($sp)
/* 7CFA0 0017CEA0 843B080C */  jal        MonsterNamePosSet__Fii
/* 7CFA4 0017CEA4 00000000 */   nop
/* 7CFA8 0017CEA8 01000424 */  addiu      $4, $0, 0x1
/* 7CFAC 0017CEAC D83A080C */  jal        SetMonsterNameDrawFlag__Fi
/* 7CFB0 0017CEB0 00000000 */   nop
.L0017CEB4:
/* 7CFB4 0017CEB4 01001026 */  addiu      $16, $16, 0x1
.L0017CEB8:
/* 7CFB8 0017CEB8 0A00012A */  slti       $at, $16, 0xA
/* 7CFBC 0017CEBC 04002010 */  beqz       $at, .L0017CED0
/* 7CFC0 0017CEC0 00000000 */   nop
/* 7CFC4 0017CEC4 B490828F */  lw         $2, -0x6F4C($gp)
/* 7CFC8 0017CEC8 6FFF4014 */  bnez       $2, .L0017CC88
/* 7CFCC 0017CECC 00000000 */   nop
.L0017CED0:
/* 7CFD0 0017CED0 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 7CFD4 0017CED4 A8D4228C */  lw         $2, -0x2B58($at)
/* 7CFD8 0017CED8 3A004010 */  beqz       $2, .L0017CFC4
/* 7CFDC 0017CEDC 00000000 */   nop
/* 7CFE0 0017CEE0 1491828F */  lw         $2, -0x6EEC($gp)
/* 7CFE4 0017CEE4 35004010 */  beqz       $2, .L0017CFBC
/* 7CFE8 0017CEE8 00000000 */   nop
/* 7CFEC 0017CEEC 6487848F */  lw         $4, -0x789C($gp)
/* 7CFF0 0017CEF0 9000A527 */  addiu      $5, $sp, 0x90
/* 7CFF4 0017CEF4 A000998C */  lw         $25, 0xA0($4)
/* 7CFF8 0017CEF8 A000398F */  lw         $25, 0xA0($25)
/* 7CFFC 0017CEFC 09F82003 */  jalr       $25
/* 7D000 0017CF00 00000000 */   nop
/* 7D004 0017CF04 B0918283 */  lb         $2, -0x6E50($gp)
/* 7D008 0017CF08 04004014 */  bnez       $2, .L0017CF1C
/* 7D00C 0017CF0C 00000000 */   nop
/* 7D010 0017CF10 AC9180AF */  sw         $0, -0x6E54($gp)
/* 7D014 0017CF14 01000224 */  addiu      $2, $0, 0x1
/* 7D018 0017CF18 B09182A3 */  sb         $2, -0x6E50($gp)
.L0017CF1C:
/* 7D01C 0017CF1C AC918CC7 */  lwc1       $f12, -0x6E54($gp)
/* 7D020 0017CF20 2876040C */  jal        sinf
/* 7D024 0017CF24 00000000 */   nop
/* 7D028 0017CF28 003F023C */  lui        $2, (0x3F000000 >> 16)
/* 7D02C 0017CF2C 00088244 */  mtc1       $2, $f1
/* 7D030 0017CF30 00000000 */  nop
/* 7D034 0017CF34 82080046 */  mul.s      $f2, $f1, $f0
/* 7D038 0017CF38 6487828F */  lw         $2, -0x789C($gp)
/* 7D03C 0017CF3C B40041C4 */  lwc1       $f1, 0xB4($2)
/* 7D040 0017CF40 4040023C */  lui        $2, (0x40400000 >> 16)
/* 7D044 0017CF44 00008244 */  mtc1       $2, $f0
/* 7D048 0017CF48 00000000 */  nop
/* 7D04C 0017CF4C 00000146 */  add.s      $f0, $f0, $f1
/* 7D050 0017CF50 40000246 */  add.s      $f1, $f0, $f2
/* 7D054 0017CF54 9400A0C7 */  lwc1       $f0, 0x94($sp)
/* 7D058 0017CF58 00000146 */  add.s      $f0, $f0, $f1
/* 7D05C 0017CF5C 9400A0E7 */  swc1       $f0, 0x94($sp)
/* 7D060 0017CF60 AC9181C7 */  lwc1       $f1, -0x6E54($gp)
/* 7D064 0017CF64 808080C7 */  lwc1       $f0, -0x7F80($gp)
/* 7D068 0017CF68 40080046 */  add.s      $f1, $f1, $f0
/* 7D06C 0017CF6C AC9181E7 */  swc1       $f1, -0x6E54($gp)
/* 7D070 0017CF70 288180C7 */  lwc1       $f0, -0x7ED8($gp)
/* 7D074 0017CF74 36080046 */  c.le.s     $f1, $f0
/* 7D078 0017CF78 00000000 */  nop
/* 7D07C 0017CF7C 05000145 */  bc1t       .L0017CF94
/* 7D080 0017CF80 00000000 */   nop
/* 7D084 0017CF84 AC9181C7 */  lwc1       $f1, -0x6E54($gp)
/* 7D088 0017CF88 288380C7 */  lwc1       $f0, -0x7CD8($gp)
/* 7D08C 0017CF8C 01080046 */  sub.s      $f0, $f1, $f0
/* 7D090 0017CF90 AC9180E7 */  swc1       $f0, -0x6E54($gp)
.L0017CF94:
/* 7D094 0017CF94 1491848F */  lw         $4, -0x6EEC($gp)
/* 7D098 0017CF98 9000A527 */  addiu      $5, $sp, 0x90
/* 7D09C 0017CF9C B89F040C */  jal        SetPosition__6CFrameFPf
/* 7D0A0 0017CFA0 00000000 */   nop
/* 7D0A4 0017CFA4 1491838F */  lw         $3, -0x6EEC($gp)
/* 7D0A8 0017CFA8 02000224 */  addiu      $2, $0, 0x2
/* 7D0AC 0017CFAC 080162A4 */  sh         $2, 0x108($3)
/* 7D0B0 0017CFB0 1491848F */  lw         $4, -0x6EEC($gp)
/* 7D0B4 0017CFB4 60BB040C */  jal        MGDraw__FP6CFrame
/* 7D0B8 0017CFB8 00000000 */   nop
.L0017CFBC:
/* 7D0BC 0017CFBC D401013C */  lui        $at, (0x1D40000 >> 16)
/* 7D0C0 0017CFC0 A8D420AC */  sw         $0, -0x2B58($at)
.L0017CFC4:
/* 7D0C4 0017CFC4 2826A072 */  paddub     $4, $21, $0
/* 7D0C8 0017CFC8 282E8072 */  paddub     $5, $20, $0
/* 7D0CC 0017CFCC 04918CC7 */  lwc1       $f12, -0x6EFC($gp)
/* 7D0D0 0017CFD0 D411060C */  jal        EdEventPointDraw__FP14ED_EVENT_POINTif
/* 7D0D4 0017CFD4 00000000 */   nop
/* 7D0D8 0017CFD8 40CF050C */  jal        EdDrawOpenItemBox__Fv
/* 7D0DC 0017CFDC 00000000 */   nop
.L0017CFE0:
/* 7D0E0 0017CFE0 6000BF7B */  lq         $31, 0x60($sp)
/* 7D0E4 0017CFE4 5000B57B */  lq         $21, 0x50($sp)
/* 7D0E8 0017CFE8 4000B47B */  lq         $20, 0x40($sp)
/* 7D0EC 0017CFEC 3000B37B */  lq         $19, 0x30($sp)
/* 7D0F0 0017CFF0 2000B27B */  lq         $18, 0x20($sp)
/* 7D0F4 0017CFF4 1000B17B */  lq         $17, 0x10($sp)
/* 7D0F8 0017CFF8 0000B07B */  lq         $16, 0x0($sp)
/* 7D0FC 0017CFFC A000BD27 */  addiu      $sp, $sp, 0xA0
/* 7D100 0017D000 0800E003 */  jr         $31
/* 7D104 0017D004 00000000 */   nop
/* 7D108 0017D008 00000000 */  nop
/* 7D10C 0017D00C 00000000 */  nop
