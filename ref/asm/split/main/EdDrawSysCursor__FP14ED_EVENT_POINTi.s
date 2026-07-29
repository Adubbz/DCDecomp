.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdDrawSysCursor__FP14ED_EVENT_POINTi
/* 07CCF0 0017CBF0 60FFBD27 */  addiu       $29, $29, -0xA0
/* 07CCF4 0017CBF4 6000BF7F */  sq          $31, 0x60($29)
/* 07CCF8 0017CBF8 5000B57F */  sq          $21, 0x50($29)
/* 07CCFC 0017CBFC 4000B47F */  sq          $20, 0x40($29)
/* 07CD00 0017CC00 3000B37F */  sq          $19, 0x30($29)
/* 07CD04 0017CC04 2000B27F */  sq          $18, 0x20($29)
/* 07CD08 0017CC08 1000B17F */  sq          $17, 0x10($29)
/* 07CD0C 0017CC0C 0000B07F */  sq          $16, 0x0($29)
/* 07CD10 0017CC10 28AE8070 */  paddub      $21, $4, $0
/* 07CD14 0017CC14 28A6A070 */  paddub      $20, $5, $0
/* 07CD18 0017CC18 448F838F */  lw          $3, -0x70BC($28)
/* 07CD1C 0017CC1C F0006014 */  bnez        $3, .L0017CFE0
/* 07CD20 0017CC20 00000000 */   nop
/* 07CD24 0017CC24 A8918283 */  lb          $2, -0x6E58($28)
/* 07CD28 0017CC28 05004014 */  bnez        $2, .L0017CC40
/* 07CD2C 0017CC2C 00000000 */   nop
/* 07CD30 0017CC30 2040023C */  lui         $2, (0x40200000 >> 16)
/* 07CD34 0017CC34 A49182AF */  sw          $2, -0x6E5C($28)
/* 07CD38 0017CC38 01000224 */  addiu       $2, $0, 0x1
/* 07CD3C 0017CC3C A89182A3 */  sb          $2, -0x6E58($28)
.L0017CC40:
/* 07CD40 0017CC40 A49181C7 */  lwc1        $f1, -0x6E5C($28)
/* 07CD44 0017CC44 808080C7 */  lwc1        $f0, -0x7F80($28)
/* 07CD48 0017CC48 41080046 */  sub.s       $f1, $f1, $f0
/* 07CD4C 0017CC4C A49181E7 */  swc1        $f1, -0x6E5C($28)
/* 07CD50 0017CC50 00008044 */  mtc1        $0, $f0
/* 07CD54 0017CC54 00000000 */  nop
/* 07CD58 0017CC58 34080046 */  c.lt.s      $f1, $f0
/* 07CD5C 0017CC5C 00000000 */  nop
/* 07CD60 0017CC60 03000045 */  bc1f        .L0017CC70
/* 07CD64 0017CC64 00000000 */   nop
/* 07CD68 0017CC68 2040023C */  lui         $2, (0x40200000 >> 16)
/* 07CD6C 0017CC6C A49182AF */  sw          $2, -0x6E5C($28)
.L0017CC70:
/* 07CD70 0017CC70 28260070 */  paddub      $4, $0, $0
/* 07CD74 0017CC74 D83A080C */  jal         SetMonsterNameDrawFlag__Fi
/* 07CD78 0017CC78 00000000 */   nop
/* 07CD7C 0017CC7C 28860070 */  paddub      $16, $0, $0
/* 07CD80 0017CC80 8D000010 */  b           .L0017CEB8
/* 07CD84 0017CC84 00000000 */   nop
.L0017CC88:
/* 07CD88 0017CC88 28260070 */  paddub      $4, $0, $0
/* 07CD8C 0017CC8C 40111000 */  sll         $2, $16, 5
/* 07CD90 0017CC90 21185000 */  addu        $3, $2, $16
/* 07CD94 0017CC94 80100300 */  sll         $2, $3, 2
/* 07CD98 0017CC98 21106200 */  addu        $2, $3, $2
/* 07CD9C 0017CC9C 40890200 */  sll         $17, $2, 5
/* 07CDA0 0017CCA0 D201023C */  lui         $2, %hi(EdVillager + 0x146C)
/* 07CDA4 0017CCA4 FC6F4224 */  addiu       $2, $2, %lo(EdVillager + 0x146C)
/* 07CDA8 0017CCA8 21105100 */  addu        $2, $2, $17
/* 07CDAC 0017CCAC 0000428C */  lw          $2, 0x0($2)
/* 07CDB0 0017CCB0 08004010 */  beqz        $2, .L0017CCD4
/* 07CDB4 0017CCB4 00000000 */   nop
/* 07CDB8 0017CCB8 D201023C */  lui         $2, %hi(EdVillager + 0x1470)
/* 07CDBC 0017CCBC 00704224 */  addiu       $2, $2, %lo(EdVillager + 0x1470)
/* 07CDC0 0017CCC0 21105100 */  addu        $2, $2, $17
/* 07CDC4 0017CCC4 0000428C */  lw          $2, 0x0($2)
/* 07CDC8 0017CCC8 02004010 */  beqz        $2, .L0017CCD4
/* 07CDCC 0017CCCC 00000000 */   nop
/* 07CDD0 0017CCD0 01000464 */  daddiu      $4, $0, 0x1
.L0017CCD4:
/* 07CDD4 0017CCD4 FF008230 */  andi        $2, $4, 0xFF
/* 07CDD8 0017CCD8 76004010 */  beqz        $2, .L0017CEB4
/* 07CDDC 0017CCDC 00000000 */   nop
/* 07CDE0 0017CCE0 D201023C */  lui         $2, %hi(EdVillager)
/* 07CDE4 0017CCE4 905B4224 */  addiu       $2, $2, %lo(EdVillager)
/* 07CDE8 0017CCE8 21905100 */  addu        $18, $2, $17
/* 07CDEC 0017CCEC 7000A427 */  addiu       $4, $29, 0x70
/* 07CDF0 0017CCF0 10004526 */  addiu       $5, $18, 0x10
/* 07CDF4 0017CCF4 0C86040C */  jal         sceVu0CopyVector
/* 07CDF8 0017CCF8 00000000 */   nop
/* 07CDFC 0017CCFC D201023C */  lui         $2, %hi(EdVillager + 0xB4)
/* 07CE00 0017CD00 445C4224 */  addiu       $2, $2, %lo(EdVillager + 0xB4)
/* 07CE04 0017CD04 21105100 */  addu        $2, $2, $17
/* 07CE08 0017CD08 000041C4 */  lwc1        $f1, 0x0($2)
/* 07CE0C 0017CD0C 0040023C */  lui         $2, (0x40000000 >> 16)
/* 07CE10 0017CD10 00008244 */  mtc1        $2, $f0
/* 07CE14 0017CD14 00000000 */  nop
/* 07CE18 0017CD18 40000146 */  add.s       $f1, $f0, $f1
/* 07CE1C 0017CD1C 7400B327 */  addiu       $19, $29, 0x74
/* 07CE20 0017CD20 000060C6 */  lwc1        $f0, 0x0($19)
/* 07CE24 0017CD24 00000146 */  add.s       $f0, $f0, $f1
/* 07CE28 0017CD28 000060E6 */  swc1        $f0, 0x0($19)
/* 07CE2C 0017CD2C 2C90828F */  lw          $2, -0x6FD4($28)
/* 07CE30 0017CD30 2B004014 */  bnez        $2, .L0017CDE0
/* 07CE34 0017CD34 00000000 */   nop
/* 07CE38 0017CD38 28264072 */  paddub      $4, $18, $0
/* 07CE3C 0017CD3C 9C59050C */  jal         CheckDraw__12CNPCharacterFv
/* 07CE40 0017CD40 00000000 */   nop
/* 07CE44 0017CD44 26004014 */  bnez        $2, .L0017CDE0
/* 07CE48 0017CD48 00000000 */   nop
/* 07CE4C 0017CD4C D201023C */  lui         $2, %hi(EdVillager + 0x1468)
/* 07CE50 0017CD50 F86F4224 */  addiu       $2, $2, %lo(EdVillager + 0x1468)
/* 07CE54 0017CD54 21105100 */  addu        $2, $2, $17
/* 07CE58 0017CD58 0000428C */  lw          $2, 0x0($2)
/* 07CE5C 0017CD5C 20004014 */  bnez        $2, .L0017CDE0
/* 07CE60 0017CD60 00000000 */   nop
/* 07CE64 0017CD64 288D838F */  lw          $3, -0x72D8($28)
/* 07CE68 0017CD68 03000224 */  addiu       $2, $0, 0x3
/* 07CE6C 0017CD6C 08006214 */  bne         $3, $2, .L0017CD90
/* 07CE70 0017CD70 00000000 */   nop
/* 07CE74 0017CD74 D201023C */  lui         $2, %hi(EdVillager + 0x1444)
/* 07CE78 0017CD78 D46F4224 */  addiu       $2, $2, %lo(EdVillager + 0x1444)
/* 07CE7C 0017CD7C 21105100 */  addu        $2, $2, $17
/* 07CE80 0017CD80 0000438C */  lw          $3, 0x0($2)
/* 07CE84 0017CD84 08000224 */  addiu       $2, $0, 0x8
/* 07CE88 0017CD88 4A006210 */  beq         $3, $2, .L0017CEB4
/* 07CE8C 0017CD8C 00000000 */   nop
.L0017CD90:
/* 07CE90 0017CD90 000061C6 */  lwc1        $f1, 0x0($19)
/* 07CE94 0017CD94 A49180C7 */  lwc1        $f0, -0x6E5C($28)
/* 07CE98 0017CD98 00080046 */  add.s       $f0, $f1, $f0
/* 07CE9C 0017CD9C 000060E6 */  swc1        $f0, 0x0($19)
/* 07CEA0 0017CDA0 1091848F */  lw          $4, -0x6EF0($28)
/* 07CEA4 0017CDA4 7000A527 */  addiu       $5, $29, 0x70
/* 07CEA8 0017CDA8 B89F040C */  jal         SetPosition__6CFrameFPf
/* 07CEAC 0017CDAC 00000000 */   nop
/* 07CEB0 0017CDB0 00608044 */  mtc1        $0, $f12
/* 07CEB4 0017CDB4 00000000 */  nop
/* 07CEB8 0017CDB8 86630046 */  mov.s       $f14, $f12
/* 07CEBC 0017CDBC 46630046 */  mov.s       $f13, $f12
/* 07CEC0 0017CDC0 1091848F */  lw          $4, -0x6EF0($28)
/* 07CEC4 0017CDC4 70A3040C */  jal         SetRotation__6CFrameFfff
/* 07CEC8 0017CDC8 00000000 */   nop
/* 07CECC 0017CDCC 1091848F */  lw          $4, -0x6EF0($28)
/* 07CED0 0017CDD0 60BB040C */  jal         MGDraw__FP6CFrame
/* 07CED4 0017CDD4 00000000 */   nop
/* 07CED8 0017CDD8 36000010 */  b           .L0017CEB4
/* 07CEDC 0017CDDC 00000000 */   nop
.L0017CDE0:
/* 07CEE0 0017CDE0 28264072 */  paddub      $4, $18, $0
/* 07CEE4 0017CDE4 9C59050C */  jal         CheckDraw__12CNPCharacterFv
/* 07CEE8 0017CDE8 00000000 */   nop
/* 07CEEC 0017CDEC 31004010 */  beqz        $2, .L0017CEB4
/* 07CEF0 0017CDF0 00000000 */   nop
/* 07CEF4 0017CDF4 D201023C */  lui         $2, %hi(EdVillager + 0x1468)
/* 07CEF8 0017CDF8 F86F4224 */  addiu       $2, $2, %lo(EdVillager + 0x1468)
/* 07CEFC 0017CDFC 21105100 */  addu        $2, $2, $17
/* 07CF00 0017CE00 0000428C */  lw          $2, 0x0($2)
/* 07CF04 0017CE04 2B004010 */  beqz        $2, .L0017CEB4
/* 07CF08 0017CE08 00000000 */   nop
/* 07CF0C 0017CE0C 48A8050C */  jal         EdCheckViewMode__Fv
/* 07CF10 0017CE10 00000000 */   nop
/* 07CF14 0017CE14 27004014 */  bnez        $2, .L0017CEB4
/* 07CF18 0017CE18 00000000 */   nop
/* 07CF1C 0017CE1C 0C91848F */  lw          $4, -0x6EF4($28)
/* 07CF20 0017CE20 7000A527 */  addiu       $5, $29, 0x70
/* 07CF24 0017CE24 B89F040C */  jal         SetPosition__6CFrameFPf
/* 07CF28 0017CE28 00000000 */   nop
/* 07CF2C 0017CE2C 0C91848F */  lw          $4, -0x6EF4($28)
/* 07CF30 0017CE30 60BB040C */  jal         MGDraw__FP6CFrame
/* 07CF34 0017CE34 00000000 */   nop
/* 07CF38 0017CE38 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 07CF3C 0017CE3C 7C00A2AF */  sw          $2, 0x7C($29)
/* 07CF40 0017CE40 8000A427 */  addiu       $4, $29, 0x80
/* 07CF44 0017CE44 7000A527 */  addiu       $5, $29, 0x70
/* 07CF48 0017CE48 28360070 */  paddub      $6, $0, $0
/* 07CF4C 0017CE4C 38B9040C */  jal         MGRotTransPers2D__FPiPfi
/* 07CF50 0017CE50 00000000 */   nop
/* 07CF54 0017CE54 17004010 */  beqz        $2, .L0017CEB4
/* 07CF58 0017CE58 00000000 */   nop
/* 07CF5C 0017CE5C 288D838F */  lw          $3, -0x72D8($28)
/* 07CF60 0017CE60 80100300 */  sll         $2, $3, 2
/* 07CF64 0017CE64 21184300 */  addu        $3, $2, $3
/* 07CF68 0017CE68 80100300 */  sll         $2, $3, 2
/* 07CF6C 0017CE6C 21106200 */  addu        $2, $3, $2
/* 07CF70 0017CE70 80100200 */  sll         $2, $2, 2
/* 07CF74 0017CE74 30F84324 */  addiu       $3, $2, -0x7D0
/* 07CF78 0017CE78 D201023C */  lui         $2, %hi(EdVillager + 0x1444)
/* 07CF7C 0017CE7C D46F4224 */  addiu       $2, $2, %lo(EdVillager + 0x1444)
/* 07CF80 0017CE80 21105100 */  addu        $2, $2, $17
/* 07CF84 0017CE84 0000428C */  lw          $2, 0x0($2)
/* 07CF88 0017CE88 21206200 */  addu        $4, $3, $2
/* 07CF8C 0017CE8C 643B080C */  jal         MonsterNameMake__Fi
/* 07CF90 0017CE90 00000000 */   nop
/* 07CF94 0017CE94 8400A28F */  lw          $2, 0x84($29)
/* 07CF98 0017CE98 BAFF4524 */  addiu       $5, $2, -0x46
/* 07CF9C 0017CE9C 8000A48F */  lw          $4, 0x80($29)
/* 07CFA0 0017CEA0 843B080C */  jal         MonsterNamePosSet__Fii
/* 07CFA4 0017CEA4 00000000 */   nop
/* 07CFA8 0017CEA8 01000424 */  addiu       $4, $0, 0x1
/* 07CFAC 0017CEAC D83A080C */  jal         SetMonsterNameDrawFlag__Fi
/* 07CFB0 0017CEB0 00000000 */   nop
.L0017CEB4:
/* 07CFB4 0017CEB4 01001026 */  addiu       $16, $16, 0x1
.L0017CEB8:
/* 07CFB8 0017CEB8 0A00012A */  slti        $1, $16, 0xA
/* 07CFBC 0017CEBC 04002010 */  beqz        $1, .L0017CED0
/* 07CFC0 0017CEC0 00000000 */   nop
/* 07CFC4 0017CEC4 B490828F */  lw          $2, -0x6F4C($28)
/* 07CFC8 0017CEC8 6FFF4014 */  bnez        $2, .L0017CC88
/* 07CFCC 0017CECC 00000000 */   nop
.L0017CED0:
/* 07CFD0 0017CED0 D401013C */  lui         $1, %hi(EdEventInfo + 0x2D8)
/* 07CFD4 0017CED4 A8D4228C */  lw          $2, %lo(EdEventInfo + 0x2D8)($1)
/* 07CFD8 0017CED8 3A004010 */  beqz        $2, .L0017CFC4
/* 07CFDC 0017CEDC 00000000 */   nop
/* 07CFE0 0017CEE0 1491828F */  lw          $2, -0x6EEC($28)
/* 07CFE4 0017CEE4 35004010 */  beqz        $2, .L0017CFBC
/* 07CFE8 0017CEE8 00000000 */   nop
/* 07CFEC 0017CEEC 6487848F */  lw          $4, -0x789C($28)
/* 07CFF0 0017CEF0 9000A527 */  addiu       $5, $29, 0x90
/* 07CFF4 0017CEF4 A000998C */  lw          $25, 0xA0($4)
/* 07CFF8 0017CEF8 A000398F */  lw          $25, 0xA0($25)
/* 07CFFC 0017CEFC 09F82003 */  jalr        $25
/* 07D000 0017CF00 00000000 */   nop
/* 07D004 0017CF04 B0918283 */  lb          $2, -0x6E50($28)
/* 07D008 0017CF08 04004014 */  bnez        $2, .L0017CF1C
/* 07D00C 0017CF0C 00000000 */   nop
/* 07D010 0017CF10 AC9180AF */  sw          $0, -0x6E54($28)
/* 07D014 0017CF14 01000224 */  addiu       $2, $0, 0x1
/* 07D018 0017CF18 B09182A3 */  sb          $2, -0x6E50($28)
.L0017CF1C:
/* 07D01C 0017CF1C AC918CC7 */  lwc1        $f12, -0x6E54($28)
/* 07D020 0017CF20 2876040C */  jal         sinf
/* 07D024 0017CF24 00000000 */   nop
/* 07D028 0017CF28 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 07D02C 0017CF2C 00088244 */  mtc1        $2, $f1
/* 07D030 0017CF30 00000000 */  nop
/* 07D034 0017CF34 82080046 */  mul.s       $f2, $f1, $f0
/* 07D038 0017CF38 6487828F */  lw          $2, -0x789C($28)
/* 07D03C 0017CF3C B40041C4 */  lwc1        $f1, 0xB4($2)
/* 07D040 0017CF40 4040023C */  lui         $2, (0x40400000 >> 16)
/* 07D044 0017CF44 00008244 */  mtc1        $2, $f0
/* 07D048 0017CF48 00000000 */  nop
/* 07D04C 0017CF4C 00000146 */  add.s       $f0, $f0, $f1
/* 07D050 0017CF50 40000246 */  add.s       $f1, $f0, $f2
/* 07D054 0017CF54 9400A0C7 */  lwc1        $f0, 0x94($29)
/* 07D058 0017CF58 00000146 */  add.s       $f0, $f0, $f1
/* 07D05C 0017CF5C 9400A0E7 */  swc1        $f0, 0x94($29)
/* 07D060 0017CF60 AC9181C7 */  lwc1        $f1, -0x6E54($28)
/* 07D064 0017CF64 808080C7 */  lwc1        $f0, -0x7F80($28)
/* 07D068 0017CF68 40080046 */  add.s       $f1, $f1, $f0
/* 07D06C 0017CF6C AC9181E7 */  swc1        $f1, -0x6E54($28)
/* 07D070 0017CF70 288180C7 */  lwc1        $f0, -0x7ED8($28)
/* 07D074 0017CF74 36080046 */  c.le.s      $f1, $f0
/* 07D078 0017CF78 00000000 */  nop
/* 07D07C 0017CF7C 05000145 */  bc1t        .L0017CF94
/* 07D080 0017CF80 00000000 */   nop
/* 07D084 0017CF84 AC9181C7 */  lwc1        $f1, -0x6E54($28)
/* 07D088 0017CF88 288380C7 */  lwc1        $f0, -0x7CD8($28)
/* 07D08C 0017CF8C 01080046 */  sub.s       $f0, $f1, $f0
/* 07D090 0017CF90 AC9180E7 */  swc1        $f0, -0x6E54($28)
.L0017CF94:
/* 07D094 0017CF94 1491848F */  lw          $4, -0x6EEC($28)
/* 07D098 0017CF98 9000A527 */  addiu       $5, $29, 0x90
/* 07D09C 0017CF9C B89F040C */  jal         SetPosition__6CFrameFPf
/* 07D0A0 0017CFA0 00000000 */   nop
/* 07D0A4 0017CFA4 1491838F */  lw          $3, -0x6EEC($28)
/* 07D0A8 0017CFA8 02000224 */  addiu       $2, $0, 0x2
/* 07D0AC 0017CFAC 080162A4 */  sh          $2, 0x108($3)
/* 07D0B0 0017CFB0 1491848F */  lw          $4, -0x6EEC($28)
/* 07D0B4 0017CFB4 60BB040C */  jal         MGDraw__FP6CFrame
/* 07D0B8 0017CFB8 00000000 */   nop
.L0017CFBC:
/* 07D0BC 0017CFBC D401013C */  lui         $1, %hi(EdEventInfo + 0x2D8)
/* 07D0C0 0017CFC0 A8D420AC */  sw          $0, %lo(EdEventInfo + 0x2D8)($1)
.L0017CFC4:
/* 07D0C4 0017CFC4 2826A072 */  paddub      $4, $21, $0
/* 07D0C8 0017CFC8 282E8072 */  paddub      $5, $20, $0
/* 07D0CC 0017CFCC 04918CC7 */  lwc1        $f12, -0x6EFC($28)
/* 07D0D0 0017CFD0 D411060C */  jal         EdEventPointDraw__FP14ED_EVENT_POINTif
/* 07D0D4 0017CFD4 00000000 */   nop
/* 07D0D8 0017CFD8 40CF050C */  jal         EdDrawOpenItemBox__Fv
/* 07D0DC 0017CFDC 00000000 */   nop
.L0017CFE0:
/* 07D0E0 0017CFE0 6000BF7B */  lq          $31, 0x60($29)
/* 07D0E4 0017CFE4 5000B57B */  lq          $21, 0x50($29)
/* 07D0E8 0017CFE8 4000B47B */  lq          $20, 0x40($29)
/* 07D0EC 0017CFEC 3000B37B */  lq          $19, 0x30($29)
/* 07D0F0 0017CFF0 2000B27B */  lq          $18, 0x20($29)
/* 07D0F4 0017CFF4 1000B17B */  lq          $17, 0x10($29)
/* 07D0F8 0017CFF8 0000B07B */  lq          $16, 0x0($29)
/* 07D0FC 0017CFFC A000BD27 */  addiu       $29, $29, 0xA0
/* 07D100 0017D000 0800E003 */  jr          $31
/* 07D104 0017D004 00000000 */   nop
/* 07D108 0017D008 00000000 */  nop
/* 07D10C 0017D00C 00000000 */  nop
