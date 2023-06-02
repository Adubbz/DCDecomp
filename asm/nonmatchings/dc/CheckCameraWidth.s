.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckCameraWidth__FP6CCPolyiPffPfi
/* 4B930 0014B830 00FFBD27 */  addiu      $sp, $sp, -0x100
/* 4B934 0014B834 A000BF7F */  sq         $31, 0xA0($sp)
/* 4B938 0014B838 9000BE7F */  sq         $fp, 0x90($sp)
/* 4B93C 0014B83C 8000B77F */  sq         $23, 0x80($sp)
/* 4B940 0014B840 7000B67F */  sq         $22, 0x70($sp)
/* 4B944 0014B844 6000B57F */  sq         $21, 0x60($sp)
/* 4B948 0014B848 5000B47F */  sq         $20, 0x50($sp)
/* 4B94C 0014B84C 4000B37F */  sq         $19, 0x40($sp)
/* 4B950 0014B850 3000B27F */  sq         $18, 0x30($sp)
/* 4B954 0014B854 2000B17F */  sq         $17, 0x20($sp)
/* 4B958 0014B858 1000B07F */  sq         $16, 0x10($sp)
/* 4B95C 0014B85C 0400B5E7 */  swc1       $f21, 0x4($sp)
/* 4B960 0014B860 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 4B964 0014B864 289E8070 */  paddub     $19, $4, $0
/* 4B968 0014B868 2896A070 */  paddub     $18, $5, $0
/* 4B96C 0014B86C 28AEC070 */  paddub     $21, $6, $0
/* 4B970 0014B870 46650046 */  mov.s      $f21, $f12
/* 4B974 0014B874 288EE070 */  paddub     $17, $7, $0
/* 4B978 0014B878 28860071 */  paddub     $16, $8, $0
/* 4B97C 0014B87C 28A60070 */  paddub     $20, $0, $0
/* 4B980 0014B880 1C8280C7 */  lwc1       $f0, -0x7DE4($gp)
/* 4B984 0014B884 03AD0046 */  div.s      $f20, $f21, $f0
/* 4B988 0014B888 E000A427 */  addiu      $4, $sp, 0xE0
/* 4B98C 0014B88C 282EA072 */  paddub     $5, $21, $0
/* 4B990 0014B890 0C86040C */  jal        sceVu0CopyVector
/* 4B994 0014B894 00000000 */   nop
/* 4B998 0014B898 28262072 */  paddub     $4, $17, $0
/* 4B99C 0014B89C 282EA072 */  paddub     $5, $21, $0
/* 4B9A0 0014B8A0 0C86040C */  jal        sceVu0CopyVector
/* 4B9A4 0014B8A4 00000000 */   nop
/* 4B9A8 0014B8A8 28B60070 */  paddub     $22, $0, $0
/* 4B9AC 0014B8AC 28AE0070 */  paddub     $21, $0, $0
/* 4B9B0 0014B8B0 E000A0C7 */  lwc1       $f0, 0xE0($sp)
/* 4B9B4 0014B8B4 00001446 */  add.s      $f0, $f0, $f20
/* 4B9B8 0014B8B8 B000A0E7 */  swc1       $f0, 0xB0($sp)
/* 4B9BC 0014B8BC E400A227 */  addiu      $2, $sp, 0xE4
/* 4B9C0 0014B8C0 000040C4 */  lwc1       $f0, 0x0($2)
/* 4B9C4 0014B8C4 B400A227 */  addiu      $2, $sp, 0xB4
/* 4B9C8 0014B8C8 000040E4 */  swc1       $f0, 0x0($2)
/* 4B9CC 0014B8CC E800BE27 */  addiu      $fp, $sp, 0xE8
/* 4B9D0 0014B8D0 0000C0C7 */  lwc1       $f0, 0x0($fp)
/* 4B9D4 0014B8D4 00001446 */  add.s      $f0, $f0, $f20
/* 4B9D8 0014B8D8 B800B727 */  addiu      $23, $sp, 0xB8
/* 4B9DC 0014B8DC 0000E0E6 */  swc1       $f0, 0x0($23)
/* 4B9E0 0014B8E0 28266072 */  paddub     $4, $19, $0
/* 4B9E4 0014B8E4 282E4072 */  paddub     $5, $18, $0
/* 4B9E8 0014B8E8 E000A627 */  addiu      $6, $sp, 0xE0
/* 4B9EC 0014B8EC B000A727 */  addiu      $7, $sp, 0xB0
/* 4B9F0 0014B8F0 C000A827 */  addiu      $8, $sp, 0xC0
/* 4B9F4 0014B8F4 284E0070 */  paddub     $9, $0, $0
/* 4B9F8 0014B8F8 28560072 */  paddub     $10, $16, $0
/* 4B9FC 0014B8FC 5427050C */  jal        CheckHit__FP6CCPolyiPfPfPfii
/* 4BA00 0014B900 00000000 */   nop
/* 4BA04 0014B904 FFFF0324 */  addiu      $3, $0, -0x1
/* 4BA08 0014B908 24004310 */  beq        $2, $3, .L0014B99C
/* 4BA0C 0014B90C 00000000 */   nop
/* 4BA10 0014B910 80180200 */  sll        $3, $2, 2
/* 4BA14 0014B914 21106200 */  addu       $2, $3, $2
/* 4BA18 0014B918 00110200 */  sll        $2, $2, 4
/* 4BA1C 0014B91C 21106202 */  addu       $2, $19, $2
/* 4BA20 0014B920 F000A427 */  addiu      $4, $sp, 0xF0
/* 4BA24 0014B924 30004524 */  addiu      $5, $2, 0x30
/* 4BA28 0014B928 9285040C */  jal        sceVu0Normalize
/* 4BA2C 0014B92C 00000000 */   nop
/* 4BA30 0014B930 F400A1C7 */  lwc1       $f1, 0xF4($sp)
/* 4BA34 0014B934 003F023C */  lui        $2, (0x3F000000 >> 16)
/* 4BA38 0014B938 00008244 */  mtc1       $2, $f0
/* 4BA3C 0014B93C 00000000 */  nop
/* 4BA40 0014B940 34080046 */  c.lt.s     $f1, $f0
/* 4BA44 0014B944 00000000 */  nop
/* 4BA48 0014B948 14000045 */  bc1f       .L0014B99C
/* 4BA4C 0014B94C 00000000 */   nop
/* 4BA50 0014B950 00BF023C */  lui        $2, (0xBF000000 >> 16)
/* 4BA54 0014B954 00008244 */  mtc1       $2, $f0
/* 4BA58 0014B958 00000000 */  nop
/* 4BA5C 0014B95C 36080046 */  c.le.s     $f1, $f0
/* 4BA60 0014B960 00000000 */  nop
/* 4BA64 0014B964 0D000145 */  bc1t       .L0014B99C
/* 4BA68 0014B968 00000000 */   nop
/* 4BA6C 0014B96C F000A0C7 */  lwc1       $f0, 0xF0($sp)
/* 4BA70 0014B970 1A001446 */  mula.s     $f0, $f20
/* 4BA74 0014B974 F800A0C7 */  lwc1       $f0, 0xF8($sp)
/* 4BA78 0014B978 5C001446 */  madd.s     $f1, $f0, $f20
/* 4BA7C 0014B97C 00008044 */  mtc1       $0, $f0
/* 4BA80 0014B980 00000000 */  nop
/* 4BA84 0014B984 34080046 */  c.lt.s     $f1, $f0
/* 4BA88 0014B988 00000000 */  nop
/* 4BA8C 0014B98C 03000045 */  bc1f       .L0014B99C
/* 4BA90 0014B990 00000000 */   nop
/* 4BA94 0014B994 01001524 */  addiu      $21, $0, 0x1
/* 4BA98 0014B998 28A6A072 */  paddub     $20, $21, $0
.L0014B99C:
/* 4BA9C 0014B99C E000A0C7 */  lwc1       $f0, 0xE0($sp)
/* 4BAA0 0014B9A0 01001446 */  sub.s      $f0, $f0, $f20
/* 4BAA4 0014B9A4 B000A0E7 */  swc1       $f0, 0xB0($sp)
/* 4BAA8 0014B9A8 E400A227 */  addiu      $2, $sp, 0xE4
/* 4BAAC 0014B9AC 000040C4 */  lwc1       $f0, 0x0($2)
/* 4BAB0 0014B9B0 B400A227 */  addiu      $2, $sp, 0xB4
/* 4BAB4 0014B9B4 000040E4 */  swc1       $f0, 0x0($2)
/* 4BAB8 0014B9B8 0000C0C7 */  lwc1       $f0, 0x0($fp)
/* 4BABC 0014B9BC 01001446 */  sub.s      $f0, $f0, $f20
/* 4BAC0 0014B9C0 0000E0E6 */  swc1       $f0, 0x0($23)
/* 4BAC4 0014B9C4 28266072 */  paddub     $4, $19, $0
/* 4BAC8 0014B9C8 282E4072 */  paddub     $5, $18, $0
/* 4BACC 0014B9CC E000A627 */  addiu      $6, $sp, 0xE0
/* 4BAD0 0014B9D0 B000A727 */  addiu      $7, $sp, 0xB0
/* 4BAD4 0014B9D4 D000A827 */  addiu      $8, $sp, 0xD0
/* 4BAD8 0014B9D8 284E0070 */  paddub     $9, $0, $0
/* 4BADC 0014B9DC 28560072 */  paddub     $10, $16, $0
/* 4BAE0 0014B9E0 5427050C */  jal        CheckHit__FP6CCPolyiPfPfPfii
/* 4BAE4 0014B9E4 00000000 */   nop
/* 4BAE8 0014B9E8 FFFF0324 */  addiu      $3, $0, -0x1
/* 4BAEC 0014B9EC 25004310 */  beq        $2, $3, .L0014BA84
/* 4BAF0 0014B9F0 00000000 */   nop
/* 4BAF4 0014B9F4 80180200 */  sll        $3, $2, 2
/* 4BAF8 0014B9F8 21106200 */  addu       $2, $3, $2
/* 4BAFC 0014B9FC 00110200 */  sll        $2, $2, 4
/* 4BB00 0014BA00 21106202 */  addu       $2, $19, $2
/* 4BB04 0014BA04 F000A427 */  addiu      $4, $sp, 0xF0
/* 4BB08 0014BA08 30004524 */  addiu      $5, $2, 0x30
/* 4BB0C 0014BA0C 9285040C */  jal        sceVu0Normalize
/* 4BB10 0014BA10 00000000 */   nop
/* 4BB14 0014BA14 F400A1C7 */  lwc1       $f1, 0xF4($sp)
/* 4BB18 0014BA18 003F023C */  lui        $2, (0x3F000000 >> 16)
/* 4BB1C 0014BA1C 00008244 */  mtc1       $2, $f0
/* 4BB20 0014BA20 00000000 */  nop
/* 4BB24 0014BA24 34080046 */  c.lt.s     $f1, $f0
/* 4BB28 0014BA28 00000000 */  nop
/* 4BB2C 0014BA2C 15000045 */  bc1f       .L0014BA84
/* 4BB30 0014BA30 00000000 */   nop
/* 4BB34 0014BA34 00BF023C */  lui        $2, (0xBF000000 >> 16)
/* 4BB38 0014BA38 00008244 */  mtc1       $2, $f0
/* 4BB3C 0014BA3C 00000000 */  nop
/* 4BB40 0014BA40 36080046 */  c.le.s     $f1, $f0
/* 4BB44 0014BA44 00000000 */  nop
/* 4BB48 0014BA48 0E000145 */  bc1t       .L0014BA84
/* 4BB4C 0014BA4C 00000000 */   nop
/* 4BB50 0014BA50 47A00046 */  neg.s      $f1, $f20
/* 4BB54 0014BA54 F000A0C7 */  lwc1       $f0, 0xF0($sp)
/* 4BB58 0014BA58 1A000146 */  mula.s     $f0, $f1
/* 4BB5C 0014BA5C F800A0C7 */  lwc1       $f0, 0xF8($sp)
/* 4BB60 0014BA60 5C000146 */  madd.s     $f1, $f0, $f1
/* 4BB64 0014BA64 00008044 */  mtc1       $0, $f0
/* 4BB68 0014BA68 00000000 */  nop
/* 4BB6C 0014BA6C 34080046 */  c.lt.s     $f1, $f0
/* 4BB70 0014BA70 00000000 */  nop
/* 4BB74 0014BA74 03000045 */  bc1f       .L0014BA84
/* 4BB78 0014BA78 00000000 */   nop
/* 4BB7C 0014BA7C 01001424 */  addiu      $20, $0, 0x1
/* 4BB80 0014BA80 28B68072 */  paddub     $22, $20, $0
.L0014BA84:
/* 4BB84 0014BA84 1200A012 */  beqz       $21, .L0014BAD0
/* 4BB88 0014BA88 00000000 */   nop
/* 4BB8C 0014BA8C 1000C012 */  beqz       $22, .L0014BAD0
/* 4BB90 0014BA90 00000000 */   nop
/* 4BB94 0014BA94 C000A1C7 */  lwc1       $f1, 0xC0($sp)
/* 4BB98 0014BA98 D000A0C7 */  lwc1       $f0, 0xD0($sp)
/* 4BB9C 0014BA9C 00080046 */  add.s      $f0, $f1, $f0
/* 4BBA0 0014BAA0 003F023C */  lui        $2, (0x3F000000 >> 16)
/* 4BBA4 0014BAA4 00108244 */  mtc1       $2, $f2
/* 4BBA8 0014BAA8 00000000 */  nop
/* 4BBAC 0014BAAC 02100046 */  mul.s      $f0, $f2, $f0
/* 4BBB0 0014BAB0 000020E6 */  swc1       $f0, 0x0($17)
/* 4BBB4 0014BAB4 C800A1C7 */  lwc1       $f1, 0xC8($sp)
/* 4BBB8 0014BAB8 D800A0C7 */  lwc1       $f0, 0xD8($sp)
/* 4BBBC 0014BABC 00080046 */  add.s      $f0, $f1, $f0
/* 4BBC0 0014BAC0 02100046 */  mul.s      $f0, $f2, $f0
/* 4BBC4 0014BAC4 080020E6 */  swc1       $f0, 0x8($17)
/* 4BBC8 0014BAC8 11000010 */  b          .L0014BB10
/* 4BBCC 0014BACC 00000000 */   nop
.L0014BAD0:
/* 4BBD0 0014BAD0 0700A012 */  beqz       $21, .L0014BAF0
/* 4BBD4 0014BAD4 00000000 */   nop
/* 4BBD8 0014BAD8 C000A0C7 */  lwc1       $f0, 0xC0($sp)
/* 4BBDC 0014BADC 01001446 */  sub.s      $f0, $f0, $f20
/* 4BBE0 0014BAE0 000020E6 */  swc1       $f0, 0x0($17)
/* 4BBE4 0014BAE4 C800A0C7 */  lwc1       $f0, 0xC8($sp)
/* 4BBE8 0014BAE8 01001446 */  sub.s      $f0, $f0, $f20
/* 4BBEC 0014BAEC 080020E6 */  swc1       $f0, 0x8($17)
.L0014BAF0:
/* 4BBF0 0014BAF0 0700C012 */  beqz       $22, .L0014BB10
/* 4BBF4 0014BAF4 00000000 */   nop
/* 4BBF8 0014BAF8 D000A0C7 */  lwc1       $f0, 0xD0($sp)
/* 4BBFC 0014BAFC 00001446 */  add.s      $f0, $f0, $f20
/* 4BC00 0014BB00 000020E6 */  swc1       $f0, 0x0($17)
/* 4BC04 0014BB04 D800A0C7 */  lwc1       $f0, 0xD8($sp)
/* 4BC08 0014BB08 00001446 */  add.s      $f0, $f0, $f20
/* 4BC0C 0014BB0C 080020E6 */  swc1       $f0, 0x8($17)
.L0014BB10:
/* 4BC10 0014BB10 E000A427 */  addiu      $4, $sp, 0xE0
/* 4BC14 0014BB14 282E2072 */  paddub     $5, $17, $0
/* 4BC18 0014BB18 0C86040C */  jal        sceVu0CopyVector
/* 4BC1C 0014BB1C 00000000 */   nop
/* 4BC20 0014BB20 28B60070 */  paddub     $22, $0, $0
/* 4BC24 0014BB24 28AE0070 */  paddub     $21, $0, $0
/* 4BC28 0014BB28 E000A0C7 */  lwc1       $f0, 0xE0($sp)
/* 4BC2C 0014BB2C 00001446 */  add.s      $f0, $f0, $f20
/* 4BC30 0014BB30 B000A0E7 */  swc1       $f0, 0xB0($sp)
/* 4BC34 0014BB34 E400A227 */  addiu      $2, $sp, 0xE4
/* 4BC38 0014BB38 000040C4 */  lwc1       $f0, 0x0($2)
/* 4BC3C 0014BB3C B400A227 */  addiu      $2, $sp, 0xB4
/* 4BC40 0014BB40 000040E4 */  swc1       $f0, 0x0($2)
/* 4BC44 0014BB44 0000C0C7 */  lwc1       $f0, 0x0($fp)
/* 4BC48 0014BB48 01001446 */  sub.s      $f0, $f0, $f20
/* 4BC4C 0014BB4C 0000E0E6 */  swc1       $f0, 0x0($23)
/* 4BC50 0014BB50 28266072 */  paddub     $4, $19, $0
/* 4BC54 0014BB54 282E4072 */  paddub     $5, $18, $0
/* 4BC58 0014BB58 E000A627 */  addiu      $6, $sp, 0xE0
/* 4BC5C 0014BB5C B000A727 */  addiu      $7, $sp, 0xB0
/* 4BC60 0014BB60 C000A827 */  addiu      $8, $sp, 0xC0
/* 4BC64 0014BB64 284E0070 */  paddub     $9, $0, $0
/* 4BC68 0014BB68 28560072 */  paddub     $10, $16, $0
/* 4BC6C 0014BB6C 5427050C */  jal        CheckHit__FP6CCPolyiPfPfPfii
/* 4BC70 0014BB70 00000000 */   nop
/* 4BC74 0014BB74 FFFF0324 */  addiu      $3, $0, -0x1
/* 4BC78 0014BB78 25004310 */  beq        $2, $3, .L0014BC10
/* 4BC7C 0014BB7C 00000000 */   nop
/* 4BC80 0014BB80 80180200 */  sll        $3, $2, 2
/* 4BC84 0014BB84 21106200 */  addu       $2, $3, $2
/* 4BC88 0014BB88 00110200 */  sll        $2, $2, 4
/* 4BC8C 0014BB8C 21106202 */  addu       $2, $19, $2
/* 4BC90 0014BB90 F000A427 */  addiu      $4, $sp, 0xF0
/* 4BC94 0014BB94 30004524 */  addiu      $5, $2, 0x30
/* 4BC98 0014BB98 9285040C */  jal        sceVu0Normalize
/* 4BC9C 0014BB9C 00000000 */   nop
/* 4BCA0 0014BBA0 F400A1C7 */  lwc1       $f1, 0xF4($sp)
/* 4BCA4 0014BBA4 003F023C */  lui        $2, (0x3F000000 >> 16)
/* 4BCA8 0014BBA8 00008244 */  mtc1       $2, $f0
/* 4BCAC 0014BBAC 00000000 */  nop
/* 4BCB0 0014BBB0 34080046 */  c.lt.s     $f1, $f0
/* 4BCB4 0014BBB4 00000000 */  nop
/* 4BCB8 0014BBB8 15000045 */  bc1f       .L0014BC10
/* 4BCBC 0014BBBC 00000000 */   nop
/* 4BCC0 0014BBC0 00BF023C */  lui        $2, (0xBF000000 >> 16)
/* 4BCC4 0014BBC4 00008244 */  mtc1       $2, $f0
/* 4BCC8 0014BBC8 00000000 */  nop
/* 4BCCC 0014BBCC 36080046 */  c.le.s     $f1, $f0
/* 4BCD0 0014BBD0 00000000 */  nop
/* 4BCD4 0014BBD4 0E000145 */  bc1t       .L0014BC10
/* 4BCD8 0014BBD8 00000000 */   nop
/* 4BCDC 0014BBDC F000A0C7 */  lwc1       $f0, 0xF0($sp)
/* 4BCE0 0014BBE0 1A001446 */  mula.s     $f0, $f20
/* 4BCE4 0014BBE4 47A00046 */  neg.s      $f1, $f20
/* 4BCE8 0014BBE8 F800A0C7 */  lwc1       $f0, 0xF8($sp)
/* 4BCEC 0014BBEC 5C000146 */  madd.s     $f1, $f0, $f1
/* 4BCF0 0014BBF0 00008044 */  mtc1       $0, $f0
/* 4BCF4 0014BBF4 00000000 */  nop
/* 4BCF8 0014BBF8 34080046 */  c.lt.s     $f1, $f0
/* 4BCFC 0014BBFC 00000000 */  nop
/* 4BD00 0014BC00 03000045 */  bc1f       .L0014BC10
/* 4BD04 0014BC04 00000000 */   nop
/* 4BD08 0014BC08 01001524 */  addiu      $21, $0, 0x1
/* 4BD0C 0014BC0C 28A6A072 */  paddub     $20, $21, $0
.L0014BC10:
/* 4BD10 0014BC10 E000A0C7 */  lwc1       $f0, 0xE0($sp)
/* 4BD14 0014BC14 01001446 */  sub.s      $f0, $f0, $f20
/* 4BD18 0014BC18 B000A0E7 */  swc1       $f0, 0xB0($sp)
/* 4BD1C 0014BC1C E400A227 */  addiu      $2, $sp, 0xE4
/* 4BD20 0014BC20 000040C4 */  lwc1       $f0, 0x0($2)
/* 4BD24 0014BC24 B400A227 */  addiu      $2, $sp, 0xB4
/* 4BD28 0014BC28 000040E4 */  swc1       $f0, 0x0($2)
/* 4BD2C 0014BC2C 0000C0C7 */  lwc1       $f0, 0x0($fp)
/* 4BD30 0014BC30 00001446 */  add.s      $f0, $f0, $f20
/* 4BD34 0014BC34 0000E0E6 */  swc1       $f0, 0x0($23)
/* 4BD38 0014BC38 28266072 */  paddub     $4, $19, $0
/* 4BD3C 0014BC3C 282E4072 */  paddub     $5, $18, $0
/* 4BD40 0014BC40 E000A627 */  addiu      $6, $sp, 0xE0
/* 4BD44 0014BC44 B000A727 */  addiu      $7, $sp, 0xB0
/* 4BD48 0014BC48 D000A827 */  addiu      $8, $sp, 0xD0
/* 4BD4C 0014BC4C 284E0070 */  paddub     $9, $0, $0
/* 4BD50 0014BC50 28560072 */  paddub     $10, $16, $0
/* 4BD54 0014BC54 5427050C */  jal        CheckHit__FP6CCPolyiPfPfPfii
/* 4BD58 0014BC58 00000000 */   nop
/* 4BD5C 0014BC5C FFFF0324 */  addiu      $3, $0, -0x1
/* 4BD60 0014BC60 25004310 */  beq        $2, $3, .L0014BCF8
/* 4BD64 0014BC64 00000000 */   nop
/* 4BD68 0014BC68 80180200 */  sll        $3, $2, 2
/* 4BD6C 0014BC6C 21106200 */  addu       $2, $3, $2
/* 4BD70 0014BC70 00110200 */  sll        $2, $2, 4
/* 4BD74 0014BC74 21106202 */  addu       $2, $19, $2
/* 4BD78 0014BC78 F000A427 */  addiu      $4, $sp, 0xF0
/* 4BD7C 0014BC7C 30004524 */  addiu      $5, $2, 0x30
/* 4BD80 0014BC80 9285040C */  jal        sceVu0Normalize
/* 4BD84 0014BC84 00000000 */   nop
/* 4BD88 0014BC88 F400A1C7 */  lwc1       $f1, 0xF4($sp)
/* 4BD8C 0014BC8C 003F023C */  lui        $2, (0x3F000000 >> 16)
/* 4BD90 0014BC90 00008244 */  mtc1       $2, $f0
/* 4BD94 0014BC94 00000000 */  nop
/* 4BD98 0014BC98 34080046 */  c.lt.s     $f1, $f0
/* 4BD9C 0014BC9C 00000000 */  nop
/* 4BDA0 0014BCA0 15000045 */  bc1f       .L0014BCF8
/* 4BDA4 0014BCA4 00000000 */   nop
/* 4BDA8 0014BCA8 00BF023C */  lui        $2, (0xBF000000 >> 16)
/* 4BDAC 0014BCAC 00008244 */  mtc1       $2, $f0
/* 4BDB0 0014BCB0 00000000 */  nop
/* 4BDB4 0014BCB4 36080046 */  c.le.s     $f1, $f0
/* 4BDB8 0014BCB8 00000000 */  nop
/* 4BDBC 0014BCBC 0E000145 */  bc1t       .L0014BCF8
/* 4BDC0 0014BCC0 00000000 */   nop
/* 4BDC4 0014BCC4 47A00046 */  neg.s      $f1, $f20
/* 4BDC8 0014BCC8 F000A0C7 */  lwc1       $f0, 0xF0($sp)
/* 4BDCC 0014BCCC 1A000146 */  mula.s     $f0, $f1
/* 4BDD0 0014BCD0 F800A0C7 */  lwc1       $f0, 0xF8($sp)
/* 4BDD4 0014BCD4 5C001446 */  madd.s     $f1, $f0, $f20
/* 4BDD8 0014BCD8 00008044 */  mtc1       $0, $f0
/* 4BDDC 0014BCDC 00000000 */  nop
/* 4BDE0 0014BCE0 34080046 */  c.lt.s     $f1, $f0
/* 4BDE4 0014BCE4 00000000 */  nop
/* 4BDE8 0014BCE8 03000045 */  bc1f       .L0014BCF8
/* 4BDEC 0014BCEC 00000000 */   nop
/* 4BDF0 0014BCF0 01001424 */  addiu      $20, $0, 0x1
/* 4BDF4 0014BCF4 28B68072 */  paddub     $22, $20, $0
.L0014BCF8:
/* 4BDF8 0014BCF8 1200A012 */  beqz       $21, .L0014BD44
/* 4BDFC 0014BCFC 00000000 */   nop
/* 4BE00 0014BD00 1000C012 */  beqz       $22, .L0014BD44
/* 4BE04 0014BD04 00000000 */   nop
/* 4BE08 0014BD08 C000A1C7 */  lwc1       $f1, 0xC0($sp)
/* 4BE0C 0014BD0C D000A0C7 */  lwc1       $f0, 0xD0($sp)
/* 4BE10 0014BD10 00080046 */  add.s      $f0, $f1, $f0
/* 4BE14 0014BD14 003F023C */  lui        $2, (0x3F000000 >> 16)
/* 4BE18 0014BD18 00108244 */  mtc1       $2, $f2
/* 4BE1C 0014BD1C 00000000 */  nop
/* 4BE20 0014BD20 02100046 */  mul.s      $f0, $f2, $f0
/* 4BE24 0014BD24 000020E6 */  swc1       $f0, 0x0($17)
/* 4BE28 0014BD28 C800A1C7 */  lwc1       $f1, 0xC8($sp)
/* 4BE2C 0014BD2C D800A0C7 */  lwc1       $f0, 0xD8($sp)
/* 4BE30 0014BD30 00080046 */  add.s      $f0, $f1, $f0
/* 4BE34 0014BD34 02100046 */  mul.s      $f0, $f2, $f0
/* 4BE38 0014BD38 080020E6 */  swc1       $f0, 0x8($17)
/* 4BE3C 0014BD3C 11000010 */  b          .L0014BD84
/* 4BE40 0014BD40 00000000 */   nop
.L0014BD44:
/* 4BE44 0014BD44 0700A012 */  beqz       $21, .L0014BD64
/* 4BE48 0014BD48 00000000 */   nop
/* 4BE4C 0014BD4C C000A0C7 */  lwc1       $f0, 0xC0($sp)
/* 4BE50 0014BD50 01001446 */  sub.s      $f0, $f0, $f20
/* 4BE54 0014BD54 000020E6 */  swc1       $f0, 0x0($17)
/* 4BE58 0014BD58 C800A0C7 */  lwc1       $f0, 0xC8($sp)
/* 4BE5C 0014BD5C 00001446 */  add.s      $f0, $f0, $f20
/* 4BE60 0014BD60 080020E6 */  swc1       $f0, 0x8($17)
.L0014BD64:
/* 4BE64 0014BD64 0700C012 */  beqz       $22, .L0014BD84
/* 4BE68 0014BD68 00000000 */   nop
/* 4BE6C 0014BD6C D000A0C7 */  lwc1       $f0, 0xD0($sp)
/* 4BE70 0014BD70 00001446 */  add.s      $f0, $f0, $f20
/* 4BE74 0014BD74 000020E6 */  swc1       $f0, 0x0($17)
/* 4BE78 0014BD78 D800A0C7 */  lwc1       $f0, 0xD8($sp)
/* 4BE7C 0014BD7C 01001446 */  sub.s      $f0, $f0, $f20
/* 4BE80 0014BD80 080020E6 */  swc1       $f0, 0x8($17)
.L0014BD84:
/* 4BE84 0014BD84 E000A427 */  addiu      $4, $sp, 0xE0
/* 4BE88 0014BD88 282E2072 */  paddub     $5, $17, $0
/* 4BE8C 0014BD8C 0C86040C */  jal        sceVu0CopyVector
/* 4BE90 0014BD90 00000000 */   nop
/* 4BE94 0014BD94 28B60070 */  paddub     $22, $0, $0
/* 4BE98 0014BD98 28AE0070 */  paddub     $21, $0, $0
/* 4BE9C 0014BD9C E000A0C7 */  lwc1       $f0, 0xE0($sp)
/* 4BEA0 0014BDA0 00001546 */  add.s      $f0, $f0, $f21
/* 4BEA4 0014BDA4 B000A0E7 */  swc1       $f0, 0xB0($sp)
/* 4BEA8 0014BDA8 E400A227 */  addiu      $2, $sp, 0xE4
/* 4BEAC 0014BDAC 000040C4 */  lwc1       $f0, 0x0($2)
/* 4BEB0 0014BDB0 B400A227 */  addiu      $2, $sp, 0xB4
/* 4BEB4 0014BDB4 000040E4 */  swc1       $f0, 0x0($2)
/* 4BEB8 0014BDB8 0000C0C7 */  lwc1       $f0, 0x0($fp)
/* 4BEBC 0014BDBC 0000E0E6 */  swc1       $f0, 0x0($23)
/* 4BEC0 0014BDC0 28266072 */  paddub     $4, $19, $0
/* 4BEC4 0014BDC4 282E4072 */  paddub     $5, $18, $0
/* 4BEC8 0014BDC8 E000A627 */  addiu      $6, $sp, 0xE0
/* 4BECC 0014BDCC B000A727 */  addiu      $7, $sp, 0xB0
/* 4BED0 0014BDD0 C000A827 */  addiu      $8, $sp, 0xC0
/* 4BED4 0014BDD4 284E0070 */  paddub     $9, $0, $0
/* 4BED8 0014BDD8 28560072 */  paddub     $10, $16, $0
/* 4BEDC 0014BDDC 5427050C */  jal        CheckHit__FP6CCPolyiPfPfPfii
/* 4BEE0 0014BDE0 00000000 */   nop
/* 4BEE4 0014BDE4 FFFF0324 */  addiu      $3, $0, -0x1
/* 4BEE8 0014BDE8 22004310 */  beq        $2, $3, .L0014BE74
/* 4BEEC 0014BDEC 00000000 */   nop
/* 4BEF0 0014BDF0 80180200 */  sll        $3, $2, 2
/* 4BEF4 0014BDF4 21106200 */  addu       $2, $3, $2
/* 4BEF8 0014BDF8 00110200 */  sll        $2, $2, 4
/* 4BEFC 0014BDFC 21106202 */  addu       $2, $19, $2
/* 4BF00 0014BE00 F000A427 */  addiu      $4, $sp, 0xF0
/* 4BF04 0014BE04 30004524 */  addiu      $5, $2, 0x30
/* 4BF08 0014BE08 9285040C */  jal        sceVu0Normalize
/* 4BF0C 0014BE0C 00000000 */   nop
/* 4BF10 0014BE10 F400A1C7 */  lwc1       $f1, 0xF4($sp)
/* 4BF14 0014BE14 003F023C */  lui        $2, (0x3F000000 >> 16)
/* 4BF18 0014BE18 00008244 */  mtc1       $2, $f0
/* 4BF1C 0014BE1C 00000000 */  nop
/* 4BF20 0014BE20 34080046 */  c.lt.s     $f1, $f0
/* 4BF24 0014BE24 00000000 */  nop
/* 4BF28 0014BE28 12000045 */  bc1f       .L0014BE74
/* 4BF2C 0014BE2C 00000000 */   nop
/* 4BF30 0014BE30 00BF023C */  lui        $2, (0xBF000000 >> 16)
/* 4BF34 0014BE34 00008244 */  mtc1       $2, $f0
/* 4BF38 0014BE38 00000000 */  nop
/* 4BF3C 0014BE3C 36080046 */  c.le.s     $f1, $f0
/* 4BF40 0014BE40 00000000 */  nop
/* 4BF44 0014BE44 0B000145 */  bc1t       .L0014BE74
/* 4BF48 0014BE48 00000000 */   nop
/* 4BF4C 0014BE4C F000A0C7 */  lwc1       $f0, 0xF0($sp)
/* 4BF50 0014BE50 42001546 */  mul.s      $f1, $f0, $f21
/* 4BF54 0014BE54 00008044 */  mtc1       $0, $f0
/* 4BF58 0014BE58 00000000 */  nop
/* 4BF5C 0014BE5C 34080046 */  c.lt.s     $f1, $f0
/* 4BF60 0014BE60 00000000 */  nop
/* 4BF64 0014BE64 03000045 */  bc1f       .L0014BE74
/* 4BF68 0014BE68 00000000 */   nop
/* 4BF6C 0014BE6C 01001524 */  addiu      $21, $0, 0x1
/* 4BF70 0014BE70 28A6A072 */  paddub     $20, $21, $0
.L0014BE74:
/* 4BF74 0014BE74 E000A0C7 */  lwc1       $f0, 0xE0($sp)
/* 4BF78 0014BE78 01001546 */  sub.s      $f0, $f0, $f21
/* 4BF7C 0014BE7C B000A0E7 */  swc1       $f0, 0xB0($sp)
/* 4BF80 0014BE80 E400A227 */  addiu      $2, $sp, 0xE4
/* 4BF84 0014BE84 000040C4 */  lwc1       $f0, 0x0($2)
/* 4BF88 0014BE88 B400A227 */  addiu      $2, $sp, 0xB4
/* 4BF8C 0014BE8C 000040E4 */  swc1       $f0, 0x0($2)
/* 4BF90 0014BE90 0000C0C7 */  lwc1       $f0, 0x0($fp)
/* 4BF94 0014BE94 0000E0E6 */  swc1       $f0, 0x0($23)
/* 4BF98 0014BE98 28266072 */  paddub     $4, $19, $0
/* 4BF9C 0014BE9C 282E4072 */  paddub     $5, $18, $0
/* 4BFA0 0014BEA0 E000A627 */  addiu      $6, $sp, 0xE0
/* 4BFA4 0014BEA4 B000A727 */  addiu      $7, $sp, 0xB0
/* 4BFA8 0014BEA8 D000A827 */  addiu      $8, $sp, 0xD0
/* 4BFAC 0014BEAC 284E0070 */  paddub     $9, $0, $0
/* 4BFB0 0014BEB0 28560072 */  paddub     $10, $16, $0
/* 4BFB4 0014BEB4 5427050C */  jal        CheckHit__FP6CCPolyiPfPfPfii
/* 4BFB8 0014BEB8 00000000 */   nop
/* 4BFBC 0014BEBC FFFF0324 */  addiu      $3, $0, -0x1
/* 4BFC0 0014BEC0 23004310 */  beq        $2, $3, .L0014BF50
/* 4BFC4 0014BEC4 00000000 */   nop
/* 4BFC8 0014BEC8 80180200 */  sll        $3, $2, 2
/* 4BFCC 0014BECC 21106200 */  addu       $2, $3, $2
/* 4BFD0 0014BED0 00110200 */  sll        $2, $2, 4
/* 4BFD4 0014BED4 21106202 */  addu       $2, $19, $2
/* 4BFD8 0014BED8 F000A427 */  addiu      $4, $sp, 0xF0
/* 4BFDC 0014BEDC 30004524 */  addiu      $5, $2, 0x30
/* 4BFE0 0014BEE0 9285040C */  jal        sceVu0Normalize
/* 4BFE4 0014BEE4 00000000 */   nop
/* 4BFE8 0014BEE8 F400A1C7 */  lwc1       $f1, 0xF4($sp)
/* 4BFEC 0014BEEC 003F023C */  lui        $2, (0x3F000000 >> 16)
/* 4BFF0 0014BEF0 00008244 */  mtc1       $2, $f0
/* 4BFF4 0014BEF4 00000000 */  nop
/* 4BFF8 0014BEF8 34080046 */  c.lt.s     $f1, $f0
/* 4BFFC 0014BEFC 00000000 */  nop
/* 4C000 0014BF00 13000045 */  bc1f       .L0014BF50
/* 4C004 0014BF04 00000000 */   nop
/* 4C008 0014BF08 00BF023C */  lui        $2, (0xBF000000 >> 16)
/* 4C00C 0014BF0C 00008244 */  mtc1       $2, $f0
/* 4C010 0014BF10 00000000 */  nop
/* 4C014 0014BF14 36080046 */  c.le.s     $f1, $f0
/* 4C018 0014BF18 00000000 */  nop
/* 4C01C 0014BF1C 0C000145 */  bc1t       .L0014BF50
/* 4C020 0014BF20 00000000 */   nop
/* 4C024 0014BF24 47A80046 */  neg.s      $f1, $f21
/* 4C028 0014BF28 F000A0C7 */  lwc1       $f0, 0xF0($sp)
/* 4C02C 0014BF2C 42000146 */  mul.s      $f1, $f0, $f1
/* 4C030 0014BF30 00008044 */  mtc1       $0, $f0
/* 4C034 0014BF34 00000000 */  nop
/* 4C038 0014BF38 34080046 */  c.lt.s     $f1, $f0
/* 4C03C 0014BF3C 00000000 */  nop
/* 4C040 0014BF40 03000045 */  bc1f       .L0014BF50
/* 4C044 0014BF44 00000000 */   nop
/* 4C048 0014BF48 01001424 */  addiu      $20, $0, 0x1
/* 4C04C 0014BF4C 28B68072 */  paddub     $22, $20, $0
.L0014BF50:
/* 4C050 0014BF50 0D00A012 */  beqz       $21, .L0014BF88
/* 4C054 0014BF54 00000000 */   nop
/* 4C058 0014BF58 0B00C012 */  beqz       $22, .L0014BF88
/* 4C05C 0014BF5C 00000000 */   nop
/* 4C060 0014BF60 C000A1C7 */  lwc1       $f1, 0xC0($sp)
/* 4C064 0014BF64 D000A0C7 */  lwc1       $f0, 0xD0($sp)
/* 4C068 0014BF68 40080046 */  add.s      $f1, $f1, $f0
/* 4C06C 0014BF6C 003F023C */  lui        $2, (0x3F000000 >> 16)
/* 4C070 0014BF70 00008244 */  mtc1       $2, $f0
/* 4C074 0014BF74 00000000 */  nop
/* 4C078 0014BF78 02000146 */  mul.s      $f0, $f0, $f1
/* 4C07C 0014BF7C 000020E6 */  swc1       $f0, 0x0($17)
/* 4C080 0014BF80 0B000010 */  b          .L0014BFB0
/* 4C084 0014BF84 00000000 */   nop
.L0014BF88:
/* 4C088 0014BF88 0400A012 */  beqz       $21, .L0014BF9C
/* 4C08C 0014BF8C 00000000 */   nop
/* 4C090 0014BF90 C000A0C7 */  lwc1       $f0, 0xC0($sp)
/* 4C094 0014BF94 01001546 */  sub.s      $f0, $f0, $f21
/* 4C098 0014BF98 000020E6 */  swc1       $f0, 0x0($17)
.L0014BF9C:
/* 4C09C 0014BF9C 0400C012 */  beqz       $22, .L0014BFB0
/* 4C0A0 0014BFA0 00000000 */   nop
/* 4C0A4 0014BFA4 D000A0C7 */  lwc1       $f0, 0xD0($sp)
/* 4C0A8 0014BFA8 00001546 */  add.s      $f0, $f0, $f21
/* 4C0AC 0014BFAC 000020E6 */  swc1       $f0, 0x0($17)
.L0014BFB0:
/* 4C0B0 0014BFB0 E000A427 */  addiu      $4, $sp, 0xE0
/* 4C0B4 0014BFB4 282E2072 */  paddub     $5, $17, $0
/* 4C0B8 0014BFB8 0C86040C */  jal        sceVu0CopyVector
/* 4C0BC 0014BFBC 00000000 */   nop
/* 4C0C0 0014BFC0 28B60070 */  paddub     $22, $0, $0
/* 4C0C4 0014BFC4 28AE0070 */  paddub     $21, $0, $0
/* 4C0C8 0014BFC8 E000A0C7 */  lwc1       $f0, 0xE0($sp)
/* 4C0CC 0014BFCC B000A0E7 */  swc1       $f0, 0xB0($sp)
/* 4C0D0 0014BFD0 E400A227 */  addiu      $2, $sp, 0xE4
/* 4C0D4 0014BFD4 000040C4 */  lwc1       $f0, 0x0($2)
/* 4C0D8 0014BFD8 B400A227 */  addiu      $2, $sp, 0xB4
/* 4C0DC 0014BFDC 000040E4 */  swc1       $f0, 0x0($2)
/* 4C0E0 0014BFE0 0000C0C7 */  lwc1       $f0, 0x0($fp)
/* 4C0E4 0014BFE4 00001546 */  add.s      $f0, $f0, $f21
/* 4C0E8 0014BFE8 0000E0E6 */  swc1       $f0, 0x0($23)
/* 4C0EC 0014BFEC 28266072 */  paddub     $4, $19, $0
/* 4C0F0 0014BFF0 282E4072 */  paddub     $5, $18, $0
/* 4C0F4 0014BFF4 E000A627 */  addiu      $6, $sp, 0xE0
/* 4C0F8 0014BFF8 B000A727 */  addiu      $7, $sp, 0xB0
/* 4C0FC 0014BFFC C000A827 */  addiu      $8, $sp, 0xC0
/* 4C100 0014C000 284E0070 */  paddub     $9, $0, $0
/* 4C104 0014C004 28560072 */  paddub     $10, $16, $0
/* 4C108 0014C008 5427050C */  jal        CheckHit__FP6CCPolyiPfPfPfii
/* 4C10C 0014C00C 00000000 */   nop
/* 4C110 0014C010 FFFF0324 */  addiu      $3, $0, -0x1
/* 4C114 0014C014 22004310 */  beq        $2, $3, .L0014C0A0
/* 4C118 0014C018 00000000 */   nop
/* 4C11C 0014C01C 80180200 */  sll        $3, $2, 2
/* 4C120 0014C020 21106200 */  addu       $2, $3, $2
/* 4C124 0014C024 00110200 */  sll        $2, $2, 4
/* 4C128 0014C028 21106202 */  addu       $2, $19, $2
/* 4C12C 0014C02C F000A427 */  addiu      $4, $sp, 0xF0
/* 4C130 0014C030 30004524 */  addiu      $5, $2, 0x30
/* 4C134 0014C034 9285040C */  jal        sceVu0Normalize
/* 4C138 0014C038 00000000 */   nop
/* 4C13C 0014C03C F400A1C7 */  lwc1       $f1, 0xF4($sp)
/* 4C140 0014C040 003F023C */  lui        $2, (0x3F000000 >> 16)
/* 4C144 0014C044 00008244 */  mtc1       $2, $f0
/* 4C148 0014C048 00000000 */  nop
/* 4C14C 0014C04C 34080046 */  c.lt.s     $f1, $f0
/* 4C150 0014C050 00000000 */  nop
/* 4C154 0014C054 12000045 */  bc1f       .L0014C0A0
/* 4C158 0014C058 00000000 */   nop
/* 4C15C 0014C05C 00BF023C */  lui        $2, (0xBF000000 >> 16)
/* 4C160 0014C060 00008244 */  mtc1       $2, $f0
/* 4C164 0014C064 00000000 */  nop
/* 4C168 0014C068 36080046 */  c.le.s     $f1, $f0
/* 4C16C 0014C06C 00000000 */  nop
/* 4C170 0014C070 0B000145 */  bc1t       .L0014C0A0
/* 4C174 0014C074 00000000 */   nop
/* 4C178 0014C078 F800A0C7 */  lwc1       $f0, 0xF8($sp)
/* 4C17C 0014C07C 42001546 */  mul.s      $f1, $f0, $f21
/* 4C180 0014C080 00008044 */  mtc1       $0, $f0
/* 4C184 0014C084 00000000 */  nop
/* 4C188 0014C088 34080046 */  c.lt.s     $f1, $f0
/* 4C18C 0014C08C 00000000 */  nop
/* 4C190 0014C090 03000045 */  bc1f       .L0014C0A0
/* 4C194 0014C094 00000000 */   nop
/* 4C198 0014C098 01001424 */  addiu      $20, $0, 0x1
/* 4C19C 0014C09C 28AE8072 */  paddub     $21, $20, $0
.L0014C0A0:
/* 4C1A0 0014C0A0 E000A0C7 */  lwc1       $f0, 0xE0($sp)
/* 4C1A4 0014C0A4 B000A0E7 */  swc1       $f0, 0xB0($sp)
/* 4C1A8 0014C0A8 E400A227 */  addiu      $2, $sp, 0xE4
/* 4C1AC 0014C0AC 000040C4 */  lwc1       $f0, 0x0($2)
/* 4C1B0 0014C0B0 B400A227 */  addiu      $2, $sp, 0xB4
/* 4C1B4 0014C0B4 000040E4 */  swc1       $f0, 0x0($2)
/* 4C1B8 0014C0B8 0000C0C7 */  lwc1       $f0, 0x0($fp)
/* 4C1BC 0014C0BC 01001546 */  sub.s      $f0, $f0, $f21
/* 4C1C0 0014C0C0 0000E0E6 */  swc1       $f0, 0x0($23)
/* 4C1C4 0014C0C4 28266072 */  paddub     $4, $19, $0
/* 4C1C8 0014C0C8 282E4072 */  paddub     $5, $18, $0
/* 4C1CC 0014C0CC E000A627 */  addiu      $6, $sp, 0xE0
/* 4C1D0 0014C0D0 B000A727 */  addiu      $7, $sp, 0xB0
/* 4C1D4 0014C0D4 D000A827 */  addiu      $8, $sp, 0xD0
/* 4C1D8 0014C0D8 284E0070 */  paddub     $9, $0, $0
/* 4C1DC 0014C0DC 28560072 */  paddub     $10, $16, $0
/* 4C1E0 0014C0E0 5427050C */  jal        CheckHit__FP6CCPolyiPfPfPfii
/* 4C1E4 0014C0E4 00000000 */   nop
/* 4C1E8 0014C0E8 FFFF0324 */  addiu      $3, $0, -0x1
/* 4C1EC 0014C0EC 23004310 */  beq        $2, $3, .L0014C17C
/* 4C1F0 0014C0F0 00000000 */   nop
/* 4C1F4 0014C0F4 80180200 */  sll        $3, $2, 2
/* 4C1F8 0014C0F8 21106200 */  addu       $2, $3, $2
/* 4C1FC 0014C0FC 00110200 */  sll        $2, $2, 4
/* 4C200 0014C100 21106202 */  addu       $2, $19, $2
/* 4C204 0014C104 F000A427 */  addiu      $4, $sp, 0xF0
/* 4C208 0014C108 30004524 */  addiu      $5, $2, 0x30
/* 4C20C 0014C10C 9285040C */  jal        sceVu0Normalize
/* 4C210 0014C110 00000000 */   nop
/* 4C214 0014C114 F400A1C7 */  lwc1       $f1, 0xF4($sp)
/* 4C218 0014C118 003F023C */  lui        $2, (0x3F000000 >> 16)
/* 4C21C 0014C11C 00008244 */  mtc1       $2, $f0
/* 4C220 0014C120 00000000 */  nop
/* 4C224 0014C124 34080046 */  c.lt.s     $f1, $f0
/* 4C228 0014C128 00000000 */  nop
/* 4C22C 0014C12C 13000045 */  bc1f       .L0014C17C
/* 4C230 0014C130 00000000 */   nop
/* 4C234 0014C134 00BF023C */  lui        $2, (0xBF000000 >> 16)
/* 4C238 0014C138 00008244 */  mtc1       $2, $f0
/* 4C23C 0014C13C 00000000 */  nop
/* 4C240 0014C140 36080046 */  c.le.s     $f1, $f0
/* 4C244 0014C144 00000000 */  nop
/* 4C248 0014C148 0C000145 */  bc1t       .L0014C17C
/* 4C24C 0014C14C 00000000 */   nop
/* 4C250 0014C150 47A80046 */  neg.s      $f1, $f21
/* 4C254 0014C154 F800A0C7 */  lwc1       $f0, 0xF8($sp)
/* 4C258 0014C158 42000146 */  mul.s      $f1, $f0, $f1
/* 4C25C 0014C15C 00008044 */  mtc1       $0, $f0
/* 4C260 0014C160 00000000 */  nop
/* 4C264 0014C164 34080046 */  c.lt.s     $f1, $f0
/* 4C268 0014C168 00000000 */  nop
/* 4C26C 0014C16C 03000045 */  bc1f       .L0014C17C
/* 4C270 0014C170 00000000 */   nop
/* 4C274 0014C174 01001424 */  addiu      $20, $0, 0x1
/* 4C278 0014C178 28B68072 */  paddub     $22, $20, $0
.L0014C17C:
/* 4C27C 0014C17C 0D00A012 */  beqz       $21, .L0014C1B4
/* 4C280 0014C180 00000000 */   nop
/* 4C284 0014C184 0B00C012 */  beqz       $22, .L0014C1B4
/* 4C288 0014C188 00000000 */   nop
/* 4C28C 0014C18C C800A1C7 */  lwc1       $f1, 0xC8($sp)
/* 4C290 0014C190 D800A0C7 */  lwc1       $f0, 0xD8($sp)
/* 4C294 0014C194 40080046 */  add.s      $f1, $f1, $f0
/* 4C298 0014C198 003F023C */  lui        $2, (0x3F000000 >> 16)
/* 4C29C 0014C19C 00008244 */  mtc1       $2, $f0
/* 4C2A0 0014C1A0 00000000 */  nop
/* 4C2A4 0014C1A4 02000146 */  mul.s      $f0, $f0, $f1
/* 4C2A8 0014C1A8 080020E6 */  swc1       $f0, 0x8($17)
/* 4C2AC 0014C1AC 0B000010 */  b          .L0014C1DC
/* 4C2B0 0014C1B0 00000000 */   nop
.L0014C1B4:
/* 4C2B4 0014C1B4 0400A012 */  beqz       $21, .L0014C1C8
/* 4C2B8 0014C1B8 00000000 */   nop
/* 4C2BC 0014C1BC C800A0C7 */  lwc1       $f0, 0xC8($sp)
/* 4C2C0 0014C1C0 01001546 */  sub.s      $f0, $f0, $f21
/* 4C2C4 0014C1C4 080020E6 */  swc1       $f0, 0x8($17)
.L0014C1C8:
/* 4C2C8 0014C1C8 0400C012 */  beqz       $22, .L0014C1DC
/* 4C2CC 0014C1CC 00000000 */   nop
/* 4C2D0 0014C1D0 D800A0C7 */  lwc1       $f0, 0xD8($sp)
/* 4C2D4 0014C1D4 00001546 */  add.s      $f0, $f0, $f21
/* 4C2D8 0014C1D8 080020E6 */  swc1       $f0, 0x8($17)
.L0014C1DC:
/* 4C2DC 0014C1DC 28168072 */  paddub     $2, $20, $0
/* 4C2E0 0014C1E0 A000BF7B */  lq         $31, 0xA0($sp)
/* 4C2E4 0014C1E4 9000BE7B */  lq         $fp, 0x90($sp)
/* 4C2E8 0014C1E8 8000B77B */  lq         $23, 0x80($sp)
/* 4C2EC 0014C1EC 7000B67B */  lq         $22, 0x70($sp)
/* 4C2F0 0014C1F0 6000B57B */  lq         $21, 0x60($sp)
/* 4C2F4 0014C1F4 5000B47B */  lq         $20, 0x50($sp)
/* 4C2F8 0014C1F8 4000B37B */  lq         $19, 0x40($sp)
/* 4C2FC 0014C1FC 3000B27B */  lq         $18, 0x30($sp)
/* 4C300 0014C200 2000B17B */  lq         $17, 0x20($sp)
/* 4C304 0014C204 1000B07B */  lq         $16, 0x10($sp)
/* 4C308 0014C208 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* 4C30C 0014C20C 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 4C310 0014C210 0001BD27 */  addiu      $sp, $sp, 0x100
/* 4C314 0014C214 0800E003 */  jr         $31
/* 4C318 0014C218 00000000 */   nop
/* 4C31C 0014C21C 00000000 */  nop
