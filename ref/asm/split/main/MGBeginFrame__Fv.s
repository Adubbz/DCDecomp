.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MGBeginFrame__Fv
/* 02CE90 0012CD90 E0FFBD27 */  addiu       $29, $29, -0x20
/* 02CE94 0012CD94 1000BF7F */  sq          $31, 0x10($29)
/* 02CE98 0012CD98 0C00B7E7 */  swc1        $f23, 0xC($29)
/* 02CE9C 0012CD9C 0800B6E7 */  swc1        $f22, 0x8($29)
/* 02CEA0 0012CDA0 0400B5E7 */  swc1        $f21, 0x4($29)
/* 02CEA4 0012CDA4 0000B4E7 */  swc1        $f20, 0x0($29)
/* 02CEA8 0012CDA8 0010013C */  lui         $1, (0x10000000 >> 16)
/* 02CEAC 0012CDAC 0000228C */  lw          $2, (0x10000000 & 0xFFFF)($1)
/* 02CEB0 0012CDB0 2C8C82AF */  sw          $2, -0x73D4($28)
/* 02CEB4 0012CDB4 C701013C */  lui         $1, %hi(mgBackColor)
/* 02CEB8 0012CDB8 005534C4 */  lwc1        $f20, %lo(mgBackColor)($1)
/* 02CEBC 0012CDBC 06A30046 */  mov.s       $f12, $f20
/* 02CEC0 0012CDC0 2C44040C */  jal         fptosi
/* 02CEC4 0012CDC4 00000000 */   nop
/* 02CEC8 0012CDC8 C701013C */  lui         $1, %hi(mgDBuff + 0x100)
/* 02CECC 0012CDCC D05322A0 */  sb          $2, %lo(mgDBuff + 0x100)($1)
/* 02CED0 0012CDD0 C701013C */  lui         $1, %hi(mgBackColor + 0x4)
/* 02CED4 0012CDD4 045535C4 */  lwc1        $f21, %lo(mgBackColor + 0x4)($1)
/* 02CED8 0012CDD8 06AB0046 */  mov.s       $f12, $f21
/* 02CEDC 0012CDDC 2C44040C */  jal         fptosi
/* 02CEE0 0012CDE0 00000000 */   nop
/* 02CEE4 0012CDE4 C701013C */  lui         $1, %hi(mgDBuff + 0x101)
/* 02CEE8 0012CDE8 D15322A0 */  sb          $2, %lo(mgDBuff + 0x101)($1)
/* 02CEEC 0012CDEC C701013C */  lui         $1, %hi(mgBackColor + 0x8)
/* 02CEF0 0012CDF0 085536C4 */  lwc1        $f22, %lo(mgBackColor + 0x8)($1)
/* 02CEF4 0012CDF4 06B30046 */  mov.s       $f12, $f22
/* 02CEF8 0012CDF8 2C44040C */  jal         fptosi
/* 02CEFC 0012CDFC 00000000 */   nop
/* 02CF00 0012CE00 C701013C */  lui         $1, %hi(mgDBuff + 0x102)
/* 02CF04 0012CE04 D25322A0 */  sb          $2, %lo(mgDBuff + 0x102)($1)
/* 02CF08 0012CE08 C701013C */  lui         $1, %hi(mgBackColor + 0xC)
/* 02CF0C 0012CE0C 0C5537C4 */  lwc1        $f23, %lo(mgBackColor + 0xC)($1)
/* 02CF10 0012CE10 06BB0046 */  mov.s       $f12, $f23
/* 02CF14 0012CE14 2C44040C */  jal         fptosi
/* 02CF18 0012CE18 00000000 */   nop
/* 02CF1C 0012CE1C C701013C */  lui         $1, %hi(mgDBuff + 0x103)
/* 02CF20 0012CE20 D35322A0 */  sb          $2, %lo(mgDBuff + 0x103)($1)
/* 02CF24 0012CE24 06A30046 */  mov.s       $f12, $f20
/* 02CF28 0012CE28 2C44040C */  jal         fptosi
/* 02CF2C 0012CE2C 00000000 */   nop
/* 02CF30 0012CE30 C701013C */  lui         $1, %hi(mgDBuff + 0x1F0)
/* 02CF34 0012CE34 C05422A0 */  sb          $2, %lo(mgDBuff + 0x1F0)($1)
/* 02CF38 0012CE38 06AB0046 */  mov.s       $f12, $f21
/* 02CF3C 0012CE3C 2C44040C */  jal         fptosi
/* 02CF40 0012CE40 00000000 */   nop
/* 02CF44 0012CE44 C701013C */  lui         $1, %hi(mgDBuff + 0x1F1)
/* 02CF48 0012CE48 C15422A0 */  sb          $2, %lo(mgDBuff + 0x1F1)($1)
/* 02CF4C 0012CE4C 06B30046 */  mov.s       $f12, $f22
/* 02CF50 0012CE50 2C44040C */  jal         fptosi
/* 02CF54 0012CE54 00000000 */   nop
/* 02CF58 0012CE58 C701013C */  lui         $1, %hi(mgDBuff + 0x1F2)
/* 02CF5C 0012CE5C C25422A0 */  sb          $2, %lo(mgDBuff + 0x1F2)($1)
/* 02CF60 0012CE60 06BB0046 */  mov.s       $f12, $f23
/* 02CF64 0012CE64 2C44040C */  jal         fptosi
/* 02CF68 0012CE68 00000000 */   nop
/* 02CF6C 0012CE6C C701013C */  lui         $1, %hi(mgDBuff + 0x1F3)
/* 02CF70 0012CE70 C35422A0 */  sb          $2, %lo(mgDBuff + 0x1F3)($1)
/* 02CF74 0012CE74 C08B828F */  lw          $2, -0x7440($28)
/* 02CF78 0012CE78 40190200 */  sll         $3, $2, 5
/* 02CF7C 0012CE7C C801023C */  lui         $2, %hi(vifpacket)
/* 02CF80 0012CE80 80A74224 */  addiu       $2, $2, %lo(vifpacket)
/* 02CF84 0012CE84 21104300 */  addu        $2, $2, $3
/* 02CF88 0012CE88 D48B82AF */  sw          $2, -0x742C($28)
/* 02CF8C 0012CE8C D48B848F */  lw          $4, -0x742C($28)
/* 02CF90 0012CE90 0683040C */  jal         sceVif1PkReset
/* 02CF94 0012CE94 00000000 */   nop
/* 02CF98 0012CE98 C08B828F */  lw          $2, -0x7440($28)
/* 02CF9C 0012CE9C 06004010 */  beqz        $2, .L0012CEB8
/* 02CFA0 0012CEA0 00000000 */   nop
/* 02CFA4 0012CEA4 2B00023C */  lui         $2, %hi(ActiveData0)
/* 02CFA8 0012CEA8 60B04224 */  addiu       $2, $2, %lo(ActiveData0)
/* 02CFAC 0012CEAC 9C8B82AF */  sw          $2, -0x7464($28)
/* 02CFB0 0012CEB0 04000010 */  b           .L0012CEC4
/* 02CFB4 0012CEB4 00000000 */   nop
.L0012CEB8:
/* 02CFB8 0012CEB8 2B00023C */  lui         $2, %hi(ActiveData1)
/* 02CFBC 0012CEBC 70B04224 */  addiu       $2, $2, %lo(ActiveData1)
/* 02CFC0 0012CEC0 9C8B82AF */  sw          $2, -0x7464($28)
.L0012CEC4:
/* 02CFC4 0012CEC4 9C8B828F */  lw          $2, -0x7464($28)
/* 02CFC8 0012CEC8 080040AC */  sw          $0, 0x8($2)
/* 02CFCC 0012CECC 988B828F */  lw          $2, -0x7468($28)
/* 02CFD0 0012CED0 080040AC */  sw          $0, 0x8($2)
/* 02CFD4 0012CED4 C701023C */  lui         $2, %hi(GiftagAD)
/* 02CFD8 0012CED8 C0524224 */  addiu       $2, $2, %lo(GiftagAD)
/* 02CFDC 0012CEDC 0000407C */  sq          $0, 0x0($2)
/* 02CFE0 0012CEE0 C701013C */  lui         $1, %hi(GiftagAD + 0x1)
/* 02CFE4 0012CEE4 C1522490 */  lbu         $4, %lo(GiftagAD + 0x1)($1)
/* 02CFE8 0012CEE8 80000364 */  daddiu      $3, $0, 0x80
/* 02CFEC 0012CEEC 7FFF0224 */  addiu       $2, $0, -0x81
/* 02CFF0 0012CEF0 24108200 */  and         $2, $4, $2
/* 02CFF4 0012CEF4 25104300 */  or          $2, $2, $3
/* 02CFF8 0012CEF8 C701013C */  lui         $1, %hi(GiftagAD + 0x1)
/* 02CFFC 0012CEFC C15222A0 */  sb          $2, %lo(GiftagAD + 0x1)($1)
/* 02D000 0012CF00 C701013C */  lui         $1, %hi(GiftagAD + 0x7)
/* 02D004 0012CF04 C7522490 */  lbu         $4, %lo(GiftagAD + 0x7)($1)
/* 02D008 0012CF08 10000364 */  daddiu      $3, $0, 0x10
/* 02D00C 0012CF0C 0FFF0224 */  addiu       $2, $0, -0xF1
/* 02D010 0012CF10 24108200 */  and         $2, $4, $2
/* 02D014 0012CF14 25104300 */  or          $2, $2, $3
/* 02D018 0012CF18 C701013C */  lui         $1, %hi(GiftagAD + 0x7)
/* 02D01C 0012CF1C C75222A0 */  sb          $2, %lo(GiftagAD + 0x7)($1)
/* 02D020 0012CF20 C701013C */  lui         $1, %hi(GiftagAD + 0x8)
/* 02D024 0012CF24 C8522490 */  lbu         $4, %lo(GiftagAD + 0x8)($1)
/* 02D028 0012CF28 0E000364 */  daddiu      $3, $0, 0xE
/* 02D02C 0012CF2C F0FF0224 */  addiu       $2, $0, -0x10
/* 02D030 0012CF30 24108200 */  and         $2, $4, $2
/* 02D034 0012CF34 25104300 */  or          $2, $2, $3
/* 02D038 0012CF38 C701013C */  lui         $1, %hi(GiftagAD + 0x8)
/* 02D03C 0012CF3C C85222A0 */  sb          $2, %lo(GiftagAD + 0x8)($1)
/* 02D040 0012CF40 C801013C */  lui         $1, %hi(mgZeroVector)
/* 02D044 0012CF44 C0A620AC */  sw          $0, %lo(mgZeroVector)($1)
/* 02D048 0012CF48 C801013C */  lui         $1, %hi(mgZeroVector + 0x4)
/* 02D04C 0012CF4C C4A620AC */  sw          $0, %lo(mgZeroVector + 0x4)($1)
/* 02D050 0012CF50 C801013C */  lui         $1, %hi(mgZeroVector + 0x8)
/* 02D054 0012CF54 C8A620AC */  sw          $0, %lo(mgZeroVector + 0x8)($1)
/* 02D058 0012CF58 C801013C */  lui         $1, %hi(mgZeroVector + 0xC)
/* 02D05C 0012CF5C CCA620AC */  sw          $0, %lo(mgZeroVector + 0xC)($1)
/* 02D060 0012CF60 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 02D064 0012CF64 C801013C */  lui         $1, %hi(mgUnitVector)
/* 02D068 0012CF68 D0A622AC */  sw          $2, %lo(mgUnitVector)($1)
/* 02D06C 0012CF6C C801013C */  lui         $1, %hi(mgUnitVector + 0x4)
/* 02D070 0012CF70 D4A622AC */  sw          $2, %lo(mgUnitVector + 0x4)($1)
/* 02D074 0012CF74 C801013C */  lui         $1, %hi(mgUnitVector + 0x8)
/* 02D078 0012CF78 D8A622AC */  sw          $2, %lo(mgUnitVector + 0x8)($1)
/* 02D07C 0012CF7C C801013C */  lui         $1, %hi(mgUnitVector + 0xC)
/* 02D080 0012CF80 DCA622AC */  sw          $2, %lo(mgUnitVector + 0xC)($1)
/* 02D084 0012CF84 C801023C */  lui         $2, %hi(mgZeroVector2)
/* 02D088 0012CF88 F0A64424 */  addiu       $4, $2, %lo(mgZeroVector2)
/* 02D08C 0012CF8C C801023C */  lui         $2, %hi(mgZeroVector)
/* 02D090 0012CF90 C0A64524 */  addiu       $5, $2, %lo(mgZeroVector)
/* 02D094 0012CF94 0C86040C */  jal         sceVu0CopyVector
/* 02D098 0012CF98 00000000 */   nop
/* 02D09C 0012CF9C C801023C */  lui         $2, %hi(mgUnitVector2)
/* 02D0A0 0012CFA0 E0A64424 */  addiu       $4, $2, %lo(mgUnitVector2)
/* 02D0A4 0012CFA4 C801023C */  lui         $2, %hi(mgUnitVector)
/* 02D0A8 0012CFA8 D0A64524 */  addiu       $5, $2, %lo(mgUnitVector)
/* 02D0AC 0012CFAC 0C86040C */  jal         sceVu0CopyVector
/* 02D0B0 0012CFB0 00000000 */   nop
/* 02D0B4 0012CFB4 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 02D0B8 0012CFB8 C801013C */  lui         $1, %hi(mgZeroVector2 + 0xC)
/* 02D0BC 0012CFBC FCA622AC */  sw          $2, %lo(mgZeroVector2 + 0xC)($1)
/* 02D0C0 0012CFC0 C801013C */  lui         $1, %hi(mgUnitVector2 + 0xC)
/* 02D0C4 0012CFC4 ECA620AC */  sw          $0, %lo(mgUnitVector2 + 0xC)($1)
/* 02D0C8 0012CFC8 C801023C */  lui         $2, %hi(mgUnitMatrix)
/* 02D0CC 0012CFCC 00A74424 */  addiu       $4, $2, %lo(mgUnitMatrix)
/* 02D0D0 0012CFD0 2A86040C */  jal         sceVu0UnitMatrix
/* 02D0D4 0012CFD4 00000000 */   nop
/* 02D0D8 0012CFD8 C801023C */  lui         $2, %hi(mgZeroMatrix)
/* 02D0DC 0012CFDC 40A74424 */  addiu       $4, $2, %lo(mgZeroMatrix)
/* 02D0E0 0012CFE0 2A86040C */  jal         sceVu0UnitMatrix
/* 02D0E4 0012CFE4 00000000 */   nop
/* 02D0E8 0012CFE8 C801013C */  lui         $1, %hi(mgZeroMatrix)
/* 02D0EC 0012CFEC 40A720AC */  sw          $0, %lo(mgZeroMatrix)($1)
/* 02D0F0 0012CFF0 C801013C */  lui         $1, %hi(mgZeroMatrix + 0x14)
/* 02D0F4 0012CFF4 54A720AC */  sw          $0, %lo(mgZeroMatrix + 0x14)($1)
/* 02D0F8 0012CFF8 C801013C */  lui         $1, %hi(mgZeroMatrix + 0x28)
/* 02D0FC 0012CFFC 68A720AC */  sw          $0, %lo(mgZeroMatrix + 0x28)($1)
/* 02D100 0012D000 C801013C */  lui         $1, %hi(mgZeroMatrix + 0x3C)
/* 02D104 0012D004 7CA720AC */  sw          $0, %lo(mgZeroMatrix + 0x3C)($1)
/* 02D108 0012D008 DC8B828F */  lw          $2, -0x7424($28)
/* 02D10C 0012D00C 0D004010 */  beqz        $2, .L0012D044
/* 02D110 0012D010 00000000 */   nop
/* 02D114 0012D014 C701013C */  lui         $1, %hi(mgDBuff + 0x100)
/* 02D118 0012D018 D0532490 */  lbu         $4, %lo(mgDBuff + 0x100)($1)
/* 02D11C 0012D01C C701013C */  lui         $1, %hi(mgDBuff + 0x101)
/* 02D120 0012D020 D1532590 */  lbu         $5, %lo(mgDBuff + 0x101)($1)
/* 02D124 0012D024 C701013C */  lui         $1, %hi(mgDBuff + 0x102)
/* 02D128 0012D028 D2532690 */  lbu         $6, %lo(mgDBuff + 0x102)($1)
/* 02D12C 0012D02C C701013C */  lui         $1, %hi(mgDBuff + 0x103)
/* 02D130 0012D030 D3532790 */  lbu         $7, %lo(mgDBuff + 0x103)($1)
/* 02D134 0012D034 00C0040C */  jal         MGClearScreen__FUcUcUcUc
/* 02D138 0012D038 00000000 */   nop
/* 02D13C 0012D03C 04000010 */  b           .L0012D050
/* 02D140 0012D040 00000000 */   nop
.L0012D044:
/* 02D144 0012D044 28260070 */  paddub      $4, $0, $0
/* 02D148 0012D048 4CBF040C */  jal         MGClearZBuffer__Fi
/* 02D14C 0012D04C 00000000 */   nop
.L0012D050:
/* 02D150 0012D050 1000BF7B */  lq          $31, 0x10($29)
/* 02D154 0012D054 0C00B7C7 */  lwc1        $f23, 0xC($29)
/* 02D158 0012D058 0800B6C7 */  lwc1        $f22, 0x8($29)
/* 02D15C 0012D05C 0400B5C7 */  lwc1        $f21, 0x4($29)
/* 02D160 0012D060 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 02D164 0012D064 2000BD27 */  addiu       $29, $29, 0x20
/* 02D168 0012D068 0800E003 */  jr          $31
/* 02D16C 0012D06C 00000000 */   nop
