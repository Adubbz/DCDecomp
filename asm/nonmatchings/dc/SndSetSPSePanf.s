.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndSetSPSePanf__Fif
/* 5BB00 0015BA00 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 5BB04 0015BA04 1000BF7F */  sq         $31, 0x10($sp)
/* 5BB08 0015BA08 0000B07F */  sq         $16, 0x0($sp)
/* 5BB0C 0015BA0C 80BF023C */  lui        $2, (0xBF800000 >> 16)
/* 5BB10 0015BA10 00008244 */  mtc1       $2, $f0
/* 5BB14 0015BA14 00000000 */  nop
/* 5BB18 0015BA18 34600046 */  c.lt.s     $f12, $f0
/* 5BB1C 0015BA1C 00000000 */  nop
/* 5BB20 0015BA20 02000045 */  bc1f       .L0015BA2C
/* 5BB24 0015BA24 00000000 */   nop
/* 5BB28 0015BA28 06030046 */  mov.s      $f12, $f0
.L0015BA2C:
/* 5BB2C 0015BA2C 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 5BB30 0015BA30 00008244 */  mtc1       $2, $f0
/* 5BB34 0015BA34 00000000 */  nop
/* 5BB38 0015BA38 36600046 */  c.le.s     $f12, $f0
/* 5BB3C 0015BA3C 00000000 */  nop
/* 5BB40 0015BA40 02000145 */  bc1t       .L0015BA4C
/* 5BB44 0015BA44 00000000 */   nop
/* 5BB48 0015BA48 06030046 */  mov.s      $f12, $f0
.L0015BA4C:
/* 5BB4C 0015BA4C 6C6D050C */  jal        GetSPInfo__Fi
/* 5BB50 0015BA50 00000000 */   nop
/* 5BB54 0015BA54 28864070 */  paddub     $16, $2, $0
/* 5BB58 0015BA58 0E000012 */  beqz       $16, .L0015BA94
/* 5BB5C 0015BA5C 00000000 */   nop
/* 5BB60 0015BA60 7C42023C */  lui        $2, (0x427C0000 >> 16)
/* 5BB64 0015BA64 00008244 */  mtc1       $2, $f0
/* 5BB68 0015BA68 00000000 */  nop
/* 5BB6C 0015BA6C 02030C46 */  mul.s      $f12, $f0, $f12
/* 5BB70 0015BA70 2C44040C */  jal        fptosi
/* 5BB74 0015BA74 00000000 */   nop
/* 5BB78 0015BA78 40004724 */  addiu      $7, $2, 0x40
/* 5BB7C 0015BA7C 04000686 */  lh         $6, 0x4($16)
/* 5BB80 0015BA80 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 5BB84 0015BA84 0C000524 */  addiu      $5, $0, 0xC
/* 5BB88 0015BA88 28460070 */  paddub     $8, $0, $0
/* 5BB8C 0015BA8C A816050C */  jal        SE_SetPan__6CSoundFiiii
/* 5BB90 0015BA90 00000000 */   nop
.L0015BA94:
/* 5BB94 0015BA94 1000BF7B */  lq         $31, 0x10($sp)
/* 5BB98 0015BA98 0000B07B */  lq         $16, 0x0($sp)
/* 5BB9C 0015BA9C 2000BD27 */  addiu      $sp, $sp, 0x20
/* 5BBA0 0015BAA0 0800E003 */  jr         $31
/* 5BBA4 0015BAA4 00000000 */   nop
/* 5BBA8 0015BAA8 00000000 */  nop
/* 5BBAC 0015BAAC 00000000 */  nop
