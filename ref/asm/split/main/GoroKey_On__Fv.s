.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GoroKey_On__Fv
/* 144150 00244050 E0FFBD27 */  addiu       $29, $29, -0x20
/* 144154 00244054 0000BF7F */  sq          $31, 0x0($29)
/* 144158 00244058 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 14415C 0024405C 9044238C */  lw          $3, %lo(BtActStatus + 0x10)($1)
/* 144160 00244060 2D006014 */  bnez        $3, .L00244118
/* 144164 00244064 00000000 */   nop
/* 144168 00244068 DC01013C */  lui         $1, %hi(BtActStatus + 0x48)
/* 14416C 0024406C C84421C4 */  lwc1        $f1, %lo(BtActStatus + 0x48)($1)
/* 144170 00244070 C842033C */  lui         $3, (0x42C80000 >> 16)
/* 144174 00244074 00008344 */  mtc1        $3, $f0
/* 144178 00244078 00000000 */  nop
/* 14417C 0024407C 34080046 */  c.lt.s      $f1, $f0
/* 144180 00244080 00000000 */  nop
/* 144184 00244084 22000145 */  bc1t        .L00244110
/* 144188 00244088 00000000 */   nop
/* 14418C 0024408C 24000224 */  addiu       $2, $0, 0x24
/* 144190 00244090 DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 144194 00244094 944422AC */  sw          $2, %lo(BtActStatus + 0x14)($1)
/* 144198 00244098 01000324 */  addiu       $3, $0, 0x1
/* 14419C 0024409C DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 1441A0 002440A0 904423AC */  sw          $3, %lo(BtActStatus + 0x10)($1)
/* 1441A4 002440A4 DC01013C */  lui         $1, %hi(BtActStatus + 0x18)
/* 1441A8 002440A8 984420AC */  sw          $0, %lo(BtActStatus + 0x18)($1)
/* 1441AC 002440AC 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 1441B0 002440B0 DC01013C */  lui         $1, %hi(BtActStatus + 0x1C)
/* 1441B4 002440B4 9C4422AC */  sw          $2, %lo(BtActStatus + 0x1C)($1)
/* 1441B8 002440B8 DC01013C */  lui         $1, %hi(BtActStatus + 0x48)
/* 1441BC 002440BC C84420AC */  sw          $0, %lo(BtActStatus + 0x48)($1)
/* 1441C0 002440C0 DC01013C */  lui         $1, %hi(BtActStatus + 0x5C)
/* 1441C4 002440C4 DC4420AC */  sw          $0, %lo(BtActStatus + 0x5C)($1)
/* 1441C8 002440C8 7C9D83AF */  sw          $3, -0x6284($28)
/* 1441CC 002440CC 0843023C */  lui         $2, (0x43080000 >> 16)
/* 1441D0 002440D0 EA01013C */  lui         $1, %hi(CharaMain + 0x2F0)
/* 1441D4 002440D4 102022AC */  sw          $2, %lo(CharaMain + 0x2F0)($1)
/* 1441D8 002440D8 DC01013C */  lui         $1, %hi(BtActStatus + 0xE8)
/* 1441DC 002440DC 684520AC */  sw          $0, %lo(BtActStatus + 0xE8)($1)
/* 1441E0 002440E0 DC01013C */  lui         $1, %hi(BtActStatus + 0xF0)
/* 1441E4 002440E4 704520AC */  sw          $0, %lo(BtActStatus + 0xF0)($1)
/* 1441E8 002440E8 DC01013C */  lui         $1, %hi(BtActStatus + 0xE0)
/* 1441EC 002440EC 604520AC */  sw          $0, %lo(BtActStatus + 0xE0)($1)
/* 1441F0 002440F0 EA01023C */  lui         $2, %hi(CharaMain)
/* 1441F4 002440F4 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 1441F8 002440F8 1000A527 */  addiu       $5, $29, 0x10
/* 1441FC 002440FC BC5B050C */  jal         GetRotation__7CObjectFPf
/* 144200 00244100 00000000 */   nop
/* 144204 00244104 1400A0C7 */  lwc1        $f0, 0x14($29)
/* 144208 00244108 DC01013C */  lui         $1, %hi(BtActStatus + 0xF4)
/* 14420C 0024410C 744520E4 */  swc1        $f0, %lo(BtActStatus + 0xF4)($1)
.L00244110:
/* 144210 00244110 01000010 */  b           .L00244118
/* 144214 00244114 00000000 */   nop
.L00244118:
/* 144218 00244118 0000BF7B */  lq          $31, 0x0($29)
/* 14421C 0024411C 2000BD27 */  addiu       $29, $29, 0x20
/* 144220 00244120 0800E003 */  jr          $31
/* 144224 00244124 00000000 */   nop
/* 144228 00244128 00000000 */  nop
/* 14422C 0024412C 00000000 */  nop
