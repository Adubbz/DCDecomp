.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MGBeginFrame__Fv
/* 2CE90 0012CD90 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 2CE94 0012CD94 1000BF7F */  sq         $31, 0x10($sp)
/* 2CE98 0012CD98 0C00B7E7 */  swc1       $f23, 0xC($sp)
/* 2CE9C 0012CD9C 0800B6E7 */  swc1       $f22, 0x8($sp)
/* 2CEA0 0012CDA0 0400B5E7 */  swc1       $f21, 0x4($sp)
/* 2CEA4 0012CDA4 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 2CEA8 0012CDA8 0010013C */  lui        $at, (0x10000000 >> 16)
/* 2CEAC 0012CDAC 0000228C */  lw         $2, (0x10000000 & 0xFFFF)($at)
/* 2CEB0 0012CDB0 2C8C82AF */  sw         $2, -0x73D4($gp)
/* 2CEB4 0012CDB4 C701013C */  lui        $at, (0x1C75500 >> 16)
/* 2CEB8 0012CDB8 005534C4 */  lwc1       $f20, (0x1C75500 & 0xFFFF)($at)
/* 2CEBC 0012CDBC 06A30046 */  mov.s      $f12, $f20
/* 2CEC0 0012CDC0 2C44040C */  jal        fptosi
/* 2CEC4 0012CDC4 00000000 */   nop
/* 2CEC8 0012CDC8 C701013C */  lui        $at, (0x1C753D0 >> 16)
/* 2CECC 0012CDCC D05322A0 */  sb         $2, (0x1C753D0 & 0xFFFF)($at)
/* 2CED0 0012CDD0 C701013C */  lui        $at, (0x1C75504 >> 16)
/* 2CED4 0012CDD4 045535C4 */  lwc1       $f21, (0x1C75504 & 0xFFFF)($at)
/* 2CED8 0012CDD8 06AB0046 */  mov.s      $f12, $f21
/* 2CEDC 0012CDDC 2C44040C */  jal        fptosi
/* 2CEE0 0012CDE0 00000000 */   nop
/* 2CEE4 0012CDE4 C701013C */  lui        $at, (0x1C753D1 >> 16)
/* 2CEE8 0012CDE8 D15322A0 */  sb         $2, (0x1C753D1 & 0xFFFF)($at)
/* 2CEEC 0012CDEC C701013C */  lui        $at, (0x1C75508 >> 16)
/* 2CEF0 0012CDF0 085536C4 */  lwc1       $f22, (0x1C75508 & 0xFFFF)($at)
/* 2CEF4 0012CDF4 06B30046 */  mov.s      $f12, $f22
/* 2CEF8 0012CDF8 2C44040C */  jal        fptosi
/* 2CEFC 0012CDFC 00000000 */   nop
/* 2CF00 0012CE00 C701013C */  lui        $at, (0x1C753D2 >> 16)
/* 2CF04 0012CE04 D25322A0 */  sb         $2, (0x1C753D2 & 0xFFFF)($at)
/* 2CF08 0012CE08 C701013C */  lui        $at, (0x1C7550C >> 16)
/* 2CF0C 0012CE0C 0C5537C4 */  lwc1       $f23, (0x1C7550C & 0xFFFF)($at)
/* 2CF10 0012CE10 06BB0046 */  mov.s      $f12, $f23
/* 2CF14 0012CE14 2C44040C */  jal        fptosi
/* 2CF18 0012CE18 00000000 */   nop
/* 2CF1C 0012CE1C C701013C */  lui        $at, (0x1C753D3 >> 16)
/* 2CF20 0012CE20 D35322A0 */  sb         $2, (0x1C753D3 & 0xFFFF)($at)
/* 2CF24 0012CE24 06A30046 */  mov.s      $f12, $f20
/* 2CF28 0012CE28 2C44040C */  jal        fptosi
/* 2CF2C 0012CE2C 00000000 */   nop
/* 2CF30 0012CE30 C701013C */  lui        $at, (0x1C754C0 >> 16)
/* 2CF34 0012CE34 C05422A0 */  sb         $2, (0x1C754C0 & 0xFFFF)($at)
/* 2CF38 0012CE38 06AB0046 */  mov.s      $f12, $f21
/* 2CF3C 0012CE3C 2C44040C */  jal        fptosi
/* 2CF40 0012CE40 00000000 */   nop
/* 2CF44 0012CE44 C701013C */  lui        $at, (0x1C754C1 >> 16)
/* 2CF48 0012CE48 C15422A0 */  sb         $2, (0x1C754C1 & 0xFFFF)($at)
/* 2CF4C 0012CE4C 06B30046 */  mov.s      $f12, $f22
/* 2CF50 0012CE50 2C44040C */  jal        fptosi
/* 2CF54 0012CE54 00000000 */   nop
/* 2CF58 0012CE58 C701013C */  lui        $at, (0x1C754C2 >> 16)
/* 2CF5C 0012CE5C C25422A0 */  sb         $2, (0x1C754C2 & 0xFFFF)($at)
/* 2CF60 0012CE60 06BB0046 */  mov.s      $f12, $f23
/* 2CF64 0012CE64 2C44040C */  jal        fptosi
/* 2CF68 0012CE68 00000000 */   nop
/* 2CF6C 0012CE6C C701013C */  lui        $at, (0x1C754C3 >> 16)
/* 2CF70 0012CE70 C35422A0 */  sb         $2, (0x1C754C3 & 0xFFFF)($at)
/* 2CF74 0012CE74 C08B828F */  lw         $2, -0x7440($gp)
/* 2CF78 0012CE78 40190200 */  sll        $3, $2, 5
/* 2CF7C 0012CE7C C801023C */  lui        $2, %hi(vifpacket)
/* 2CF80 0012CE80 80A74224 */  addiu      $2, $2, %lo(vifpacket)
/* 2CF84 0012CE84 21104300 */  addu       $2, $2, $3
/* 2CF88 0012CE88 D48B82AF */  sw         $2, -0x742C($gp)
/* 2CF8C 0012CE8C D48B848F */  lw         $4, -0x742C($gp)
/* 2CF90 0012CE90 0683040C */  jal        sceVif1PkReset
/* 2CF94 0012CE94 00000000 */   nop
/* 2CF98 0012CE98 C08B828F */  lw         $2, -0x7440($gp)
/* 2CF9C 0012CE9C 06004010 */  beqz       $2, .L0012CEB8
/* 2CFA0 0012CEA0 00000000 */   nop
/* 2CFA4 0012CEA4 2B00023C */  lui        $2, %hi(ActiveData0)
/* 2CFA8 0012CEA8 60B04224 */  addiu      $2, $2, %lo(ActiveData0)
/* 2CFAC 0012CEAC 9C8B82AF */  sw         $2, -0x7464($gp)
/* 2CFB0 0012CEB0 04000010 */  b          .L0012CEC4
/* 2CFB4 0012CEB4 00000000 */   nop
.L0012CEB8:
/* 2CFB8 0012CEB8 2B00023C */  lui        $2, %hi(ActiveData1)
/* 2CFBC 0012CEBC 70B04224 */  addiu      $2, $2, %lo(ActiveData1)
/* 2CFC0 0012CEC0 9C8B82AF */  sw         $2, -0x7464($gp)
.L0012CEC4:
/* 2CFC4 0012CEC4 9C8B828F */  lw         $2, -0x7464($gp)
/* 2CFC8 0012CEC8 080040AC */  sw         $0, 0x8($2)
/* 2CFCC 0012CECC 988B828F */  lw         $2, -0x7468($gp)
/* 2CFD0 0012CED0 080040AC */  sw         $0, 0x8($2)
/* 2CFD4 0012CED4 C701023C */  lui        $2, %hi(GiftagAD)
/* 2CFD8 0012CED8 C0524224 */  addiu      $2, $2, %lo(GiftagAD)
/* 2CFDC 0012CEDC 0000407C */  sq         $0, 0x0($2)
/* 2CFE0 0012CEE0 C701013C */  lui        $at, (0x1C752C1 >> 16)
/* 2CFE4 0012CEE4 C1522490 */  lbu        $4, (0x1C752C1 & 0xFFFF)($at)
/* 2CFE8 0012CEE8 80000364 */  daddiu     $3, $0, 0x80
/* 2CFEC 0012CEEC 7FFF0224 */  addiu      $2, $0, -0x81
/* 2CFF0 0012CEF0 24108200 */  and        $2, $4, $2
/* 2CFF4 0012CEF4 25104300 */  or         $2, $2, $3
/* 2CFF8 0012CEF8 C701013C */  lui        $at, (0x1C752C1 >> 16)
/* 2CFFC 0012CEFC C15222A0 */  sb         $2, (0x1C752C1 & 0xFFFF)($at)
/* 2D000 0012CF00 C701013C */  lui        $at, (0x1C752C7 >> 16)
/* 2D004 0012CF04 C7522490 */  lbu        $4, (0x1C752C7 & 0xFFFF)($at)
/* 2D008 0012CF08 10000364 */  daddiu     $3, $0, 0x10
/* 2D00C 0012CF0C 0FFF0224 */  addiu      $2, $0, -0xF1
/* 2D010 0012CF10 24108200 */  and        $2, $4, $2
/* 2D014 0012CF14 25104300 */  or         $2, $2, $3
/* 2D018 0012CF18 C701013C */  lui        $at, (0x1C752C7 >> 16)
/* 2D01C 0012CF1C C75222A0 */  sb         $2, (0x1C752C7 & 0xFFFF)($at)
/* 2D020 0012CF20 C701013C */  lui        $at, (0x1C752C8 >> 16)
/* 2D024 0012CF24 C8522490 */  lbu        $4, (0x1C752C8 & 0xFFFF)($at)
/* 2D028 0012CF28 0E000364 */  daddiu     $3, $0, 0xE
/* 2D02C 0012CF2C F0FF0224 */  addiu      $2, $0, -0x10
/* 2D030 0012CF30 24108200 */  and        $2, $4, $2
/* 2D034 0012CF34 25104300 */  or         $2, $2, $3
/* 2D038 0012CF38 C701013C */  lui        $at, (0x1C752C8 >> 16)
/* 2D03C 0012CF3C C85222A0 */  sb         $2, (0x1C752C8 & 0xFFFF)($at)
/* 2D040 0012CF40 C801013C */  lui        $at, (0x1C80000 >> 16)
/* 2D044 0012CF44 C0A620AC */  sw         $0, -0x5940($at)
/* 2D048 0012CF48 C801013C */  lui        $at, (0x1C80000 >> 16)
/* 2D04C 0012CF4C C4A620AC */  sw         $0, -0x593C($at)
/* 2D050 0012CF50 C801013C */  lui        $at, (0x1C80000 >> 16)
/* 2D054 0012CF54 C8A620AC */  sw         $0, -0x5938($at)
/* 2D058 0012CF58 C801013C */  lui        $at, (0x1C80000 >> 16)
/* 2D05C 0012CF5C CCA620AC */  sw         $0, -0x5934($at)
/* 2D060 0012CF60 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 2D064 0012CF64 C801013C */  lui        $at, (0x1C80000 >> 16)
/* 2D068 0012CF68 D0A622AC */  sw         $2, -0x5930($at)
/* 2D06C 0012CF6C C801013C */  lui        $at, (0x1C80000 >> 16)
/* 2D070 0012CF70 D4A622AC */  sw         $2, -0x592C($at)
/* 2D074 0012CF74 C801013C */  lui        $at, (0x1C80000 >> 16)
/* 2D078 0012CF78 D8A622AC */  sw         $2, -0x5928($at)
/* 2D07C 0012CF7C C801013C */  lui        $at, (0x1C80000 >> 16)
/* 2D080 0012CF80 DCA622AC */  sw         $2, -0x5924($at)
/* 2D084 0012CF84 C801023C */  lui        $2, %hi(mgZeroVector2)
/* 2D088 0012CF88 F0A64424 */  addiu      $4, $2, %lo(mgZeroVector2)
/* 2D08C 0012CF8C C801023C */  lui        $2, %hi(mgZeroVector)
/* 2D090 0012CF90 C0A64524 */  addiu      $5, $2, %lo(mgZeroVector)
/* 2D094 0012CF94 0C86040C */  jal        sceVu0CopyVector
/* 2D098 0012CF98 00000000 */   nop
/* 2D09C 0012CF9C C801023C */  lui        $2, %hi(mgUnitVector2)
/* 2D0A0 0012CFA0 E0A64424 */  addiu      $4, $2, %lo(mgUnitVector2)
/* 2D0A4 0012CFA4 C801023C */  lui        $2, %hi(mgUnitVector)
/* 2D0A8 0012CFA8 D0A64524 */  addiu      $5, $2, %lo(mgUnitVector)
/* 2D0AC 0012CFAC 0C86040C */  jal        sceVu0CopyVector
/* 2D0B0 0012CFB0 00000000 */   nop
/* 2D0B4 0012CFB4 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 2D0B8 0012CFB8 C801013C */  lui        $at, (0x1C80000 >> 16)
/* 2D0BC 0012CFBC FCA622AC */  sw         $2, -0x5904($at)
/* 2D0C0 0012CFC0 C801013C */  lui        $at, (0x1C80000 >> 16)
/* 2D0C4 0012CFC4 ECA620AC */  sw         $0, -0x5914($at)
/* 2D0C8 0012CFC8 C801023C */  lui        $2, %hi(mgUnitMatrix)
/* 2D0CC 0012CFCC 00A74424 */  addiu      $4, $2, %lo(mgUnitMatrix)
/* 2D0D0 0012CFD0 2A86040C */  jal        sceVu0UnitMatrix
/* 2D0D4 0012CFD4 00000000 */   nop
/* 2D0D8 0012CFD8 C801023C */  lui        $2, %hi(mgZeroMatrix)
/* 2D0DC 0012CFDC 40A74424 */  addiu      $4, $2, %lo(mgZeroMatrix)
/* 2D0E0 0012CFE0 2A86040C */  jal        sceVu0UnitMatrix
/* 2D0E4 0012CFE4 00000000 */   nop
/* 2D0E8 0012CFE8 C801013C */  lui        $at, (0x1C80000 >> 16)
/* 2D0EC 0012CFEC 40A720AC */  sw         $0, -0x58C0($at)
/* 2D0F0 0012CFF0 C801013C */  lui        $at, (0x1C80000 >> 16)
/* 2D0F4 0012CFF4 54A720AC */  sw         $0, -0x58AC($at)
/* 2D0F8 0012CFF8 C801013C */  lui        $at, (0x1C80000 >> 16)
/* 2D0FC 0012CFFC 68A720AC */  sw         $0, -0x5898($at)
/* 2D100 0012D000 C801013C */  lui        $at, (0x1C80000 >> 16)
/* 2D104 0012D004 7CA720AC */  sw         $0, -0x5884($at)
/* 2D108 0012D008 DC8B828F */  lw         $2, -0x7424($gp)
/* 2D10C 0012D00C 0D004010 */  beqz       $2, .L0012D044
/* 2D110 0012D010 00000000 */   nop
/* 2D114 0012D014 C701013C */  lui        $at, (0x1C753D0 >> 16)
/* 2D118 0012D018 D0532490 */  lbu        $4, (0x1C753D0 & 0xFFFF)($at)
/* 2D11C 0012D01C C701013C */  lui        $at, (0x1C753D1 >> 16)
/* 2D120 0012D020 D1532590 */  lbu        $5, (0x1C753D1 & 0xFFFF)($at)
/* 2D124 0012D024 C701013C */  lui        $at, (0x1C753D2 >> 16)
/* 2D128 0012D028 D2532690 */  lbu        $6, (0x1C753D2 & 0xFFFF)($at)
/* 2D12C 0012D02C C701013C */  lui        $at, (0x1C753D3 >> 16)
/* 2D130 0012D030 D3532790 */  lbu        $7, (0x1C753D3 & 0xFFFF)($at)
/* 2D134 0012D034 00C0040C */  jal        MGClearScreen__FUcUcUcUc
/* 2D138 0012D038 00000000 */   nop
/* 2D13C 0012D03C 04000010 */  b          .L0012D050
/* 2D140 0012D040 00000000 */   nop
.L0012D044:
/* 2D144 0012D044 28260070 */  paddub     $4, $0, $0
/* 2D148 0012D048 4CBF040C */  jal        MGClearZBuffer__Fi
/* 2D14C 0012D04C 00000000 */   nop
.L0012D050:
/* 2D150 0012D050 1000BF7B */  lq         $31, 0x10($sp)
/* 2D154 0012D054 0C00B7C7 */  lwc1       $f23, 0xC($sp)
/* 2D158 0012D058 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* 2D15C 0012D05C 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* 2D160 0012D060 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 2D164 0012D064 2000BD27 */  addiu      $sp, $sp, 0x20
/* 2D168 0012D068 0800E003 */  jr         $31
/* 2D16C 0012D06C 00000000 */   nop
