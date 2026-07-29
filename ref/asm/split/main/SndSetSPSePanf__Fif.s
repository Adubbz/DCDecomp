.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SndSetSPSePanf__Fif
/* 05BB00 0015BA00 E0FFBD27 */  addiu       $29, $29, -0x20
/* 05BB04 0015BA04 1000BF7F */  sq          $31, 0x10($29)
/* 05BB08 0015BA08 0000B07F */  sq          $16, 0x0($29)
/* 05BB0C 0015BA0C 80BF023C */  lui         $2, (0xBF800000 >> 16)
/* 05BB10 0015BA10 00008244 */  mtc1        $2, $f0
/* 05BB14 0015BA14 00000000 */  nop
/* 05BB18 0015BA18 34600046 */  c.lt.s      $f12, $f0
/* 05BB1C 0015BA1C 00000000 */  nop
/* 05BB20 0015BA20 02000045 */  bc1f        .L0015BA2C
/* 05BB24 0015BA24 00000000 */   nop
/* 05BB28 0015BA28 06030046 */  mov.s       $f12, $f0
.L0015BA2C:
/* 05BB2C 0015BA2C 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 05BB30 0015BA30 00008244 */  mtc1        $2, $f0
/* 05BB34 0015BA34 00000000 */  nop
/* 05BB38 0015BA38 36600046 */  c.le.s      $f12, $f0
/* 05BB3C 0015BA3C 00000000 */  nop
/* 05BB40 0015BA40 02000145 */  bc1t        .L0015BA4C
/* 05BB44 0015BA44 00000000 */   nop
/* 05BB48 0015BA48 06030046 */  mov.s       $f12, $f0
.L0015BA4C:
/* 05BB4C 0015BA4C 6C6D050C */  jal         GetSPInfo__Fi
/* 05BB50 0015BA50 00000000 */   nop
/* 05BB54 0015BA54 28864070 */  paddub      $16, $2, $0
/* 05BB58 0015BA58 0E000012 */  beqz        $16, .L0015BA94
/* 05BB5C 0015BA5C 00000000 */   nop
/* 05BB60 0015BA60 7C42023C */  lui         $2, (0x427C0000 >> 16)
/* 05BB64 0015BA64 00008244 */  mtc1        $2, $f0
/* 05BB68 0015BA68 00000000 */  nop
/* 05BB6C 0015BA6C 02030C46 */  mul.s       $f12, $f0, $f12
/* 05BB70 0015BA70 2C44040C */  jal         fptosi
/* 05BB74 0015BA74 00000000 */   nop
/* 05BB78 0015BA78 40004724 */  addiu       $7, $2, 0x40
/* 05BB7C 0015BA7C 04000686 */  lh          $6, 0x4($16)
/* 05BB80 0015BA80 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 05BB84 0015BA84 0C000524 */  addiu       $5, $0, 0xC
/* 05BB88 0015BA88 28460070 */  paddub      $8, $0, $0
/* 05BB8C 0015BA8C A816050C */  jal         SE_SetPan__6CSoundFiiii
/* 05BB90 0015BA90 00000000 */   nop
.L0015BA94:
/* 05BB94 0015BA94 1000BF7B */  lq          $31, 0x10($29)
/* 05BB98 0015BA98 0000B07B */  lq          $16, 0x0($29)
/* 05BB9C 0015BA9C 2000BD27 */  addiu       $29, $29, 0x20
/* 05BBA0 0015BAA0 0800E003 */  jr          $31
/* 05BBA4 0015BAA4 00000000 */   nop
/* 05BBA8 0015BAA8 00000000 */  nop
/* 05BBAC 0015BAAC 00000000 */  nop
