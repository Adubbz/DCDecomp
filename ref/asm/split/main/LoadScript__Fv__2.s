.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadScript__Fv__2
/* 09BAA0 0019B9A0 C0FEBD27 */  addiu       $29, $29, -0x140
/* 09BAA4 0019B9A4 1000BF7F */  sq          $31, 0x10($29)
/* 09BAA8 0019B9A8 0000B07F */  sq          $16, 0x0($29)
/* 09BAAC 0019B9AC D201013C */  lui         $1, %hi(EdScriptBuffer + 0x8)
/* 09BAB0 0019B9B0 A8B320AC */  sw          $0, %lo(EdScriptBuffer + 0x8)($1)
/* 09BAB4 0019B9B4 D201013C */  lui         $1, %hi(EdScriptBuffer + 0x8)
/* 09BAB8 0019B9B8 A8B3228C */  lw          $2, %lo(EdScriptBuffer + 0x8)($1)
/* 09BABC 0019B9BC 00190200 */  sll         $3, $2, 4
/* 09BAC0 0019B9C0 D201013C */  lui         $1, %hi(EdScriptBuffer)
/* 09BAC4 0019B9C4 A0B3228C */  lw          $2, %lo(EdScriptBuffer)($1)
/* 09BAC8 0019B9C8 21104300 */  addu        $2, $2, $3
/* 09BACC 0019B9CC 649082AF */  sw          $2, -0x6F9C($28)
/* 09BAD0 0019B9D0 2001A427 */  addiu       $4, $29, 0x120
/* 09BAD4 0019B9D4 2A00023C */  lui         $2, %hi(LIT_419)
/* 09BAD8 0019B9D8 78B24524 */  addiu       $5, $2, %lo(LIT_419)
/* 09BADC 0019B9DC 9886868F */  lw          $6, -0x7968($28)
/* 09BAE0 0019B9E0 1614040C */  jal         sprintf
/* 09BAE4 0019B9E4 00000000 */   nop
/* 09BAE8 0019B9E8 E000A427 */  addiu       $4, $29, 0xE0
/* 09BAEC 0019B9EC 9092858F */  lw          $5, -0x6D70($28)
/* 09BAF0 0019B9F0 5A15040C */  jal         strcpy
/* 09BAF4 0019B9F4 00000000 */   nop
/* 09BAF8 0019B9F8 E000A427 */  addiu       $4, $29, 0xE0
/* 09BAFC 0019B9FC A015040C */  jal         strlen
/* 09BB00 0019BA00 00000000 */   nop
/* 09BB04 0019BA04 0E004018 */  blez        $2, .L0019BA40
/* 09BB08 0019BA08 00000000 */   nop
/* 09BB0C 0019BA0C 21105D00 */  addu        $2, $2, $29
/* 09BB10 0019BA10 DF004424 */  addiu       $4, $2, 0xDF
/* 09BB14 0019BA14 00008380 */  lb          $3, 0x0($4)
/* 09BB18 0019BA18 6D000224 */  addiu       $2, $0, 0x6D
/* 09BB1C 0019BA1C 07006210 */  beq         $3, $2, .L0019BA3C
/* 09BB20 0019BA20 00000000 */   nop
/* 09BB24 0019BA24 6E000224 */  addiu       $2, $0, 0x6E
/* 09BB28 0019BA28 04006210 */  beq         $3, $2, .L0019BA3C
/* 09BB2C 0019BA2C 00000000 */   nop
/* 09BB30 0019BA30 65000224 */  addiu       $2, $0, 0x65
/* 09BB34 0019BA34 02006214 */  bne         $3, $2, .L0019BA40
/* 09BB38 0019BA38 00000000 */   nop
.L0019BA3C:
/* 09BB3C 0019BA3C 000080A0 */  sb          $0, 0x0($4)
.L0019BA40:
/* 09BB40 0019BA40 E000A427 */  addiu       $4, $29, 0xE0
/* 09BB44 0019BA44 2001A527 */  addiu       $5, $29, 0x120
/* 09BB48 0019BA48 BC14040C */  jal         strcat
/* 09BB4C 0019BA4C 00000000 */   nop
/* 09BB50 0019BA50 2A00023C */  lui         $2, %hi(LIT_420)
/* 09BB54 0019BA54 80B24424 */  addiu       $4, $2, %lo(LIT_420)
/* 09BB58 0019BA58 E000A527 */  addiu       $5, $29, 0xE0
/* 09BB5C 0019BA5C A611040C */  jal         printf
/* 09BB60 0019BA60 00000000 */   nop
/* 09BB64 0019BA64 A000A427 */  addiu       $4, $29, 0xA0
/* 09BB68 0019BA68 9092858F */  lw          $5, -0x6D70($28)
/* 09BB6C 0019BA6C 5A15040C */  jal         strcpy
/* 09BB70 0019BA70 00000000 */   nop
/* 09BB74 0019BA74 A000A427 */  addiu       $4, $29, 0xA0
/* 09BB78 0019BA78 282E8070 */  paddub      $5, $4, $0
/* 09BB7C 0019BA7C 08000010 */  b           .L0019BAA0
/* 09BB80 0019BA80 00000000 */   nop
.L0019BA84:
/* 09BB84 0019BA84 3C1E0200 */  dsll32      $3, $2, 24
/* 09BB88 0019BA88 3F1E0300 */  dsra32      $3, $3, 24
/* 09BB8C 0019BA8C 2F000224 */  addiu       $2, $0, 0x2F
/* 09BB90 0019BA90 02006214 */  bne         $3, $2, .L0019BA9C
/* 09BB94 0019BA94 00000000 */   nop
/* 09BB98 0019BA98 282E8070 */  paddub      $5, $4, $0
.L0019BA9C:
/* 09BB9C 0019BA9C 01008424 */  addiu       $4, $4, 0x1
.L0019BAA0:
/* 09BBA0 0019BAA0 00008280 */  lb          $2, 0x0($4)
/* 09BBA4 0019BAA4 F7FF4014 */  bnez        $2, .L0019BA84
/* 09BBA8 0019BAA8 00000000 */   nop
/* 09BBAC 0019BAAC 0000A0A0 */  sb          $0, 0x0($5)
/* 09BBB0 0019BAB0 2000A427 */  addiu       $4, $29, 0x20
/* 09BBB4 0019BAB4 2A00023C */  lui         $2, %hi(LIT_421__2)
/* 09BBB8 0019BAB8 90B24524 */  addiu       $5, $2, %lo(LIT_421__2)
/* 09BBBC 0019BABC A000A627 */  addiu       $6, $29, 0xA0
/* 09BBC0 0019BAC0 1614040C */  jal         sprintf
/* 09BBC4 0019BAC4 00000000 */   nop
/* 09BBC8 0019BAC8 2000A427 */  addiu       $4, $29, 0x20
/* 09BBCC 0019BACC 6490858F */  lw          $5, -0x6F9C($28)
/* 09BBD0 0019BAD0 3C01A627 */  addiu       $6, $29, 0x13C
/* 09BBD4 0019BAD4 283E0070 */  paddub      $7, $0, $0
/* 09BBD8 0019BAD8 F4FC040C */  jal         LoadFile2__FPcPvPii
/* 09BBDC 0019BADC 00000000 */   nop
/* 09BBE0 0019BAE0 28004010 */  beqz        $2, .L0019BB84
/* 09BBE4 0019BAE4 00000000 */   nop
/* 09BBE8 0019BAE8 3C01A28F */  lw          $2, 0x13C($29)
/* 09BBEC 0019BAEC 03110200 */  sra         $2, $2, 4
/* 09BBF0 0019BAF0 01004524 */  addiu       $5, $2, 0x1
/* 09BBF4 0019BAF4 D201023C */  lui         $2, %hi(EdScriptBuffer)
/* 09BBF8 0019BAF8 A0B34424 */  addiu       $4, $2, %lo(EdScriptBuffer)
/* 09BBFC 0019BAFC 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 09BC00 0019BB00 00000000 */   nop
/* 09BC04 0019BB04 D201013C */  lui         $1, %hi(EdScriptBuffer + 0x8)
/* 09BC08 0019BB08 A8B3228C */  lw          $2, %lo(EdScriptBuffer + 0x8)($1)
/* 09BC0C 0019BB0C 00190200 */  sll         $3, $2, 4
/* 09BC10 0019BB10 D201013C */  lui         $1, %hi(EdScriptBuffer)
/* 09BC14 0019BB14 A0B3228C */  lw          $2, %lo(EdScriptBuffer)($1)
/* 09BC18 0019BB18 21804300 */  addu        $16, $2, $3
/* 09BC1C 0019BB1C E000A427 */  addiu       $4, $29, 0xE0
/* 09BC20 0019BB20 282E0072 */  paddub      $5, $16, $0
/* 09BC24 0019BB24 3C01A627 */  addiu       $6, $29, 0x13C
/* 09BC28 0019BB28 283E0070 */  paddub      $7, $0, $0
/* 09BC2C 0019BB2C F4FC040C */  jal         LoadFile2__FPcPvPii
/* 09BC30 0019BB30 00000000 */   nop
/* 09BC34 0019BB34 0A004010 */  beqz        $2, .L0019BB60
/* 09BC38 0019BB38 00000000 */   nop
/* 09BC3C 0019BB3C 3C01A28F */  lw          $2, 0x13C($29)
/* 09BC40 0019BB40 03110200 */  sra         $2, $2, 4
/* 09BC44 0019BB44 01004524 */  addiu       $5, $2, 0x1
/* 09BC48 0019BB48 D201023C */  lui         $2, %hi(EdScriptBuffer)
/* 09BC4C 0019BB4C A0B34424 */  addiu       $4, $2, %lo(EdScriptBuffer)
/* 09BC50 0019BB50 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 09BC54 0019BB54 00000000 */   nop
/* 09BC58 0019BB58 02000010 */  b           .L0019BB64
/* 09BC5C 0019BB5C 00000000 */   nop
.L0019BB60:
/* 09BC60 0019BB60 28860070 */  paddub      $16, $0, $0
.L0019BB64:
/* 09BC64 0019BB64 6490848F */  lw          $4, -0x6F9C($28)
/* 09BC68 0019BB68 282E0072 */  paddub      $5, $16, $0
/* 09BC6C 0019BB6C D201023C */  lui         $2, %hi(EdScriptBuffer)
/* 09BC70 0019BB70 A0B34624 */  addiu       $6, $2, %lo(EdScriptBuffer)
/* 09BC74 0019BB74 3C5B060C */  jal         EdSetEventScript__FPcPcP14CDataAlloc2_1_
/* 09BC78 0019BB78 00000000 */   nop
/* 09BC7C 0019BB7C 0A000010 */  b           .L0019BBA8
/* 09BC80 0019BB80 00000000 */   nop
.L0019BB84:
/* 09BC84 0019BB84 649080AF */  sw          $0, -0x6F9C($28)
/* 09BC88 0019BB88 28260070 */  paddub      $4, $0, $0
/* 09BC8C 0019BB8C 282E0070 */  paddub      $5, $0, $0
/* 09BC90 0019BB90 D201023C */  lui         $2, %hi(EdScriptBuffer)
/* 09BC94 0019BB94 A0B34624 */  addiu       $6, $2, %lo(EdScriptBuffer)
/* 09BC98 0019BB98 3C5B060C */  jal         EdSetEventScript__FPcPcP14CDataAlloc2_1_
/* 09BC9C 0019BB9C 00000000 */   nop
/* 09BCA0 0019BBA0 885C060C */  jal         EdInitEventParam__Fv
/* 09BCA4 0019BBA4 00000000 */   nop
.L0019BBA8:
/* 09BCA8 0019BBA8 D201023C */  lui         $2, %hi(EdScriptBuffer)
/* 09BCAC 0019BBAC A0B34424 */  addiu       $4, $2, %lo(EdScriptBuffer)
/* 09BCB0 0019BBB0 609E040C */  jal         Align64__14CDataAlloc2_1_Fv
/* 09BCB4 0019BBB4 00000000 */   nop
/* 09BCB8 0019BBB8 D201013C */  lui         $1, %hi(EdScriptBuffer + 0x8)
/* 09BCBC 0019BBBC A8B3228C */  lw          $2, %lo(EdScriptBuffer + 0x8)($1)
/* 09BCC0 0019BBC0 00190200 */  sll         $3, $2, 4
/* 09BCC4 0019BBC4 D201013C */  lui         $1, %hi(EdScriptBuffer)
/* 09BCC8 0019BBC8 A0B3228C */  lw          $2, %lo(EdScriptBuffer)($1)
/* 09BCCC 0019BBCC 21104300 */  addu        $2, $2, $3
/* 09BCD0 0019BBD0 689082AF */  sw          $2, -0x6F98($28)
/* 09BCD4 0019BBD4 2A00023C */  lui         $2, %hi(LIT_422)
/* 09BCD8 0019BBD8 A0B24424 */  addiu       $4, $2, %lo(LIT_422)
/* 09BCDC 0019BBDC 6890858F */  lw          $5, -0x6F98($28)
/* 09BCE0 0019BBE0 3C01A627 */  addiu       $6, $29, 0x13C
/* 09BCE4 0019BBE4 283E0070 */  paddub      $7, $0, $0
/* 09BCE8 0019BBE8 F4FC040C */  jal         LoadFile2__FPcPvPii
/* 09BCEC 0019BBEC 00000000 */   nop
/* 09BCF0 0019BBF0 0A004010 */  beqz        $2, .L0019BC1C
/* 09BCF4 0019BBF4 00000000 */   nop
/* 09BCF8 0019BBF8 3C01A28F */  lw          $2, 0x13C($29)
/* 09BCFC 0019BBFC 03110200 */  sra         $2, $2, 4
/* 09BD00 0019BC00 01004524 */  addiu       $5, $2, 0x1
/* 09BD04 0019BC04 D201023C */  lui         $2, %hi(EdScriptBuffer)
/* 09BD08 0019BC08 A0B34424 */  addiu       $4, $2, %lo(EdScriptBuffer)
/* 09BD0C 0019BC0C 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 09BD10 0019BC10 00000000 */   nop
/* 09BD14 0019BC14 02000010 */  b           .L0019BC20
/* 09BD18 0019BC18 00000000 */   nop
.L0019BC1C:
/* 09BD1C 0019BC1C 689080AF */  sw          $0, -0x6F98($28)
.L0019BC20:
/* 09BD20 0019BC20 1000BF7B */  lq          $31, 0x10($29)
/* 09BD24 0019BC24 0000B07B */  lq          $16, 0x0($29)
/* 09BD28 0019BC28 4001BD27 */  addiu       $29, $29, 0x140
/* 09BD2C 0019BC2C 0800E003 */  jr          $31
/* 09BD30 0019BC30 00000000 */   nop
/* 09BD34 0019BC34 00000000 */  nop
/* 09BD38 0019BC38 00000000 */  nop
/* 09BD3C 0019BC3C 00000000 */  nop
