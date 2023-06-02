.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoadScript__Fv_2
/* 9BAA0 0019B9A0 C0FEBD27 */  addiu      $sp, $sp, -0x140
/* 9BAA4 0019B9A4 1000BF7F */  sq         $31, 0x10($sp)
/* 9BAA8 0019B9A8 0000B07F */  sq         $16, 0x0($sp)
/* 9BAAC 0019B9AC D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9BAB0 0019B9B0 A8B320AC */  sw         $0, -0x4C58($at)
/* 9BAB4 0019B9B4 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9BAB8 0019B9B8 A8B3228C */  lw         $2, -0x4C58($at)
/* 9BABC 0019B9BC 00190200 */  sll        $3, $2, 4
/* 9BAC0 0019B9C0 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9BAC4 0019B9C4 A0B3228C */  lw         $2, -0x4C60($at)
/* 9BAC8 0019B9C8 21104300 */  addu       $2, $2, $3
/* 9BACC 0019B9CC 649082AF */  sw         $2, -0x6F9C($gp)
/* 9BAD0 0019B9D0 2001A427 */  addiu      $4, $sp, 0x120
/* 9BAD4 0019B9D4 2A00023C */  lui        $2, %hi(_419)
/* 9BAD8 0019B9D8 78B24524 */  addiu      $5, $2, %lo(_419)
/* 9BADC 0019B9DC 9886868F */  lw         $6, -0x7968($gp)
/* 9BAE0 0019B9E0 1614040C */  jal        sprintf
/* 9BAE4 0019B9E4 00000000 */   nop
/* 9BAE8 0019B9E8 E000A427 */  addiu      $4, $sp, 0xE0
/* 9BAEC 0019B9EC 9092858F */  lw         $5, -0x6D70($gp)
/* 9BAF0 0019B9F0 5A15040C */  jal        strcpy
/* 9BAF4 0019B9F4 00000000 */   nop
/* 9BAF8 0019B9F8 E000A427 */  addiu      $4, $sp, 0xE0
/* 9BAFC 0019B9FC A015040C */  jal        strlen
/* 9BB00 0019BA00 00000000 */   nop
/* 9BB04 0019BA04 0E004018 */  blez       $2, .L0019BA40
/* 9BB08 0019BA08 00000000 */   nop
/* 9BB0C 0019BA0C 21105D00 */  addu       $2, $2, $sp
/* 9BB10 0019BA10 DF004424 */  addiu      $4, $2, 0xDF
/* 9BB14 0019BA14 00008380 */  lb         $3, 0x0($4)
/* 9BB18 0019BA18 6D000224 */  addiu      $2, $0, 0x6D
/* 9BB1C 0019BA1C 07006210 */  beq        $3, $2, .L0019BA3C
/* 9BB20 0019BA20 00000000 */   nop
/* 9BB24 0019BA24 6E000224 */  addiu      $2, $0, 0x6E
/* 9BB28 0019BA28 04006210 */  beq        $3, $2, .L0019BA3C
/* 9BB2C 0019BA2C 00000000 */   nop
/* 9BB30 0019BA30 65000224 */  addiu      $2, $0, 0x65
/* 9BB34 0019BA34 02006214 */  bne        $3, $2, .L0019BA40
/* 9BB38 0019BA38 00000000 */   nop
.L0019BA3C:
/* 9BB3C 0019BA3C 000080A0 */  sb         $0, 0x0($4)
.L0019BA40:
/* 9BB40 0019BA40 E000A427 */  addiu      $4, $sp, 0xE0
/* 9BB44 0019BA44 2001A527 */  addiu      $5, $sp, 0x120
/* 9BB48 0019BA48 BC14040C */  jal        strcat
/* 9BB4C 0019BA4C 00000000 */   nop
/* 9BB50 0019BA50 2A00023C */  lui        $2, %hi(_420)
/* 9BB54 0019BA54 80B24424 */  addiu      $4, $2, %lo(_420)
/* 9BB58 0019BA58 E000A527 */  addiu      $5, $sp, 0xE0
/* 9BB5C 0019BA5C A611040C */  jal        printf
/* 9BB60 0019BA60 00000000 */   nop
/* 9BB64 0019BA64 A000A427 */  addiu      $4, $sp, 0xA0
/* 9BB68 0019BA68 9092858F */  lw         $5, -0x6D70($gp)
/* 9BB6C 0019BA6C 5A15040C */  jal        strcpy
/* 9BB70 0019BA70 00000000 */   nop
/* 9BB74 0019BA74 A000A427 */  addiu      $4, $sp, 0xA0
/* 9BB78 0019BA78 282E8070 */  paddub     $5, $4, $0
/* 9BB7C 0019BA7C 08000010 */  b          .L0019BAA0
/* 9BB80 0019BA80 00000000 */   nop
.L0019BA84:
/* 9BB84 0019BA84 3C1E0200 */  dsll32     $3, $2, 24
/* 9BB88 0019BA88 3F1E0300 */  dsra32     $3, $3, 24
/* 9BB8C 0019BA8C 2F000224 */  addiu      $2, $0, 0x2F
/* 9BB90 0019BA90 02006214 */  bne        $3, $2, .L0019BA9C
/* 9BB94 0019BA94 00000000 */   nop
/* 9BB98 0019BA98 282E8070 */  paddub     $5, $4, $0
.L0019BA9C:
/* 9BB9C 0019BA9C 01008424 */  addiu      $4, $4, 0x1
.L0019BAA0:
/* 9BBA0 0019BAA0 00008280 */  lb         $2, 0x0($4)
/* 9BBA4 0019BAA4 F7FF4014 */  bnez       $2, .L0019BA84
/* 9BBA8 0019BAA8 00000000 */   nop
/* 9BBAC 0019BAAC 0000A0A0 */  sb         $0, 0x0($5)
/* 9BBB0 0019BAB0 2000A427 */  addiu      $4, $sp, 0x20
/* 9BBB4 0019BAB4 2A00023C */  lui        $2, %hi(_421_2)
/* 9BBB8 0019BAB8 90B24524 */  addiu      $5, $2, %lo(_421_2)
/* 9BBBC 0019BABC A000A627 */  addiu      $6, $sp, 0xA0
/* 9BBC0 0019BAC0 1614040C */  jal        sprintf
/* 9BBC4 0019BAC4 00000000 */   nop
/* 9BBC8 0019BAC8 2000A427 */  addiu      $4, $sp, 0x20
/* 9BBCC 0019BACC 6490858F */  lw         $5, -0x6F9C($gp)
/* 9BBD0 0019BAD0 3C01A627 */  addiu      $6, $sp, 0x13C
/* 9BBD4 0019BAD4 283E0070 */  paddub     $7, $0, $0
/* 9BBD8 0019BAD8 F4FC040C */  jal        LoadFile2__FPcPvPii
/* 9BBDC 0019BADC 00000000 */   nop
/* 9BBE0 0019BAE0 28004010 */  beqz       $2, .L0019BB84
/* 9BBE4 0019BAE4 00000000 */   nop
/* 9BBE8 0019BAE8 3C01A28F */  lw         $2, 0x13C($sp)
/* 9BBEC 0019BAEC 03110200 */  sra        $2, $2, 4
/* 9BBF0 0019BAF0 01004524 */  addiu      $5, $2, 0x1
/* 9BBF4 0019BAF4 D201023C */  lui        $2, %hi(EdScriptBuffer)
/* 9BBF8 0019BAF8 A0B34424 */  addiu      $4, $2, %lo(EdScriptBuffer)
/* 9BBFC 0019BAFC 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* 9BC00 0019BB00 00000000 */   nop
/* 9BC04 0019BB04 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9BC08 0019BB08 A8B3228C */  lw         $2, -0x4C58($at)
/* 9BC0C 0019BB0C 00190200 */  sll        $3, $2, 4
/* 9BC10 0019BB10 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9BC14 0019BB14 A0B3228C */  lw         $2, -0x4C60($at)
/* 9BC18 0019BB18 21804300 */  addu       $16, $2, $3
/* 9BC1C 0019BB1C E000A427 */  addiu      $4, $sp, 0xE0
/* 9BC20 0019BB20 282E0072 */  paddub     $5, $16, $0
/* 9BC24 0019BB24 3C01A627 */  addiu      $6, $sp, 0x13C
/* 9BC28 0019BB28 283E0070 */  paddub     $7, $0, $0
/* 9BC2C 0019BB2C F4FC040C */  jal        LoadFile2__FPcPvPii
/* 9BC30 0019BB30 00000000 */   nop
/* 9BC34 0019BB34 0A004010 */  beqz       $2, .L0019BB60
/* 9BC38 0019BB38 00000000 */   nop
/* 9BC3C 0019BB3C 3C01A28F */  lw         $2, 0x13C($sp)
/* 9BC40 0019BB40 03110200 */  sra        $2, $2, 4
/* 9BC44 0019BB44 01004524 */  addiu      $5, $2, 0x1
/* 9BC48 0019BB48 D201023C */  lui        $2, %hi(EdScriptBuffer)
/* 9BC4C 0019BB4C A0B34424 */  addiu      $4, $2, %lo(EdScriptBuffer)
/* 9BC50 0019BB50 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* 9BC54 0019BB54 00000000 */   nop
/* 9BC58 0019BB58 02000010 */  b          .L0019BB64
/* 9BC5C 0019BB5C 00000000 */   nop
.L0019BB60:
/* 9BC60 0019BB60 28860070 */  paddub     $16, $0, $0
.L0019BB64:
/* 9BC64 0019BB64 6490848F */  lw         $4, -0x6F9C($gp)
/* 9BC68 0019BB68 282E0072 */  paddub     $5, $16, $0
/* 9BC6C 0019BB6C D201023C */  lui        $2, %hi(EdScriptBuffer)
/* 9BC70 0019BB70 A0B34624 */  addiu      $6, $2, %lo(EdScriptBuffer)
/* 9BC74 0019BB74 3C5B060C */  jal        EdSetEventScript__FPcPcP14CDataAlloc2_1_
/* 9BC78 0019BB78 00000000 */   nop
/* 9BC7C 0019BB7C 0A000010 */  b          .L0019BBA8
/* 9BC80 0019BB80 00000000 */   nop
.L0019BB84:
/* 9BC84 0019BB84 649080AF */  sw         $0, -0x6F9C($gp)
/* 9BC88 0019BB88 28260070 */  paddub     $4, $0, $0
/* 9BC8C 0019BB8C 282E0070 */  paddub     $5, $0, $0
/* 9BC90 0019BB90 D201023C */  lui        $2, %hi(EdScriptBuffer)
/* 9BC94 0019BB94 A0B34624 */  addiu      $6, $2, %lo(EdScriptBuffer)
/* 9BC98 0019BB98 3C5B060C */  jal        EdSetEventScript__FPcPcP14CDataAlloc2_1_
/* 9BC9C 0019BB9C 00000000 */   nop
/* 9BCA0 0019BBA0 885C060C */  jal        EdInitEventParam__Fv
/* 9BCA4 0019BBA4 00000000 */   nop
.L0019BBA8:
/* 9BCA8 0019BBA8 D201023C */  lui        $2, %hi(EdScriptBuffer)
/* 9BCAC 0019BBAC A0B34424 */  addiu      $4, $2, %lo(EdScriptBuffer)
/* 9BCB0 0019BBB0 609E040C */  jal        Align64__14CDataAlloc2_1_Fv
/* 9BCB4 0019BBB4 00000000 */   nop
/* 9BCB8 0019BBB8 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9BCBC 0019BBBC A8B3228C */  lw         $2, -0x4C58($at)
/* 9BCC0 0019BBC0 00190200 */  sll        $3, $2, 4
/* 9BCC4 0019BBC4 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9BCC8 0019BBC8 A0B3228C */  lw         $2, -0x4C60($at)
/* 9BCCC 0019BBCC 21104300 */  addu       $2, $2, $3
/* 9BCD0 0019BBD0 689082AF */  sw         $2, -0x6F98($gp)
/* 9BCD4 0019BBD4 2A00023C */  lui        $2, %hi(_422)
/* 9BCD8 0019BBD8 A0B24424 */  addiu      $4, $2, %lo(_422)
/* 9BCDC 0019BBDC 6890858F */  lw         $5, -0x6F98($gp)
/* 9BCE0 0019BBE0 3C01A627 */  addiu      $6, $sp, 0x13C
/* 9BCE4 0019BBE4 283E0070 */  paddub     $7, $0, $0
/* 9BCE8 0019BBE8 F4FC040C */  jal        LoadFile2__FPcPvPii
/* 9BCEC 0019BBEC 00000000 */   nop
/* 9BCF0 0019BBF0 0A004010 */  beqz       $2, .L0019BC1C
/* 9BCF4 0019BBF4 00000000 */   nop
/* 9BCF8 0019BBF8 3C01A28F */  lw         $2, 0x13C($sp)
/* 9BCFC 0019BBFC 03110200 */  sra        $2, $2, 4
/* 9BD00 0019BC00 01004524 */  addiu      $5, $2, 0x1
/* 9BD04 0019BC04 D201023C */  lui        $2, %hi(EdScriptBuffer)
/* 9BD08 0019BC08 A0B34424 */  addiu      $4, $2, %lo(EdScriptBuffer)
/* 9BD0C 0019BC0C 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* 9BD10 0019BC10 00000000 */   nop
/* 9BD14 0019BC14 02000010 */  b          .L0019BC20
/* 9BD18 0019BC18 00000000 */   nop
.L0019BC1C:
/* 9BD1C 0019BC1C 689080AF */  sw         $0, -0x6F98($gp)
.L0019BC20:
/* 9BD20 0019BC20 1000BF7B */  lq         $31, 0x10($sp)
/* 9BD24 0019BC24 0000B07B */  lq         $16, 0x0($sp)
/* 9BD28 0019BC28 4001BD27 */  addiu      $sp, $sp, 0x140
/* 9BD2C 0019BC2C 0800E003 */  jr         $31
/* 9BD30 0019BC30 00000000 */   nop
/* 9BD34 0019BC34 00000000 */  nop
/* 9BD38 0019BC38 00000000 */  nop
/* 9BD3C 0019BC3C 00000000 */  nop
