.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EndEffect__12CSHOT_EFFECTFv
/* ACC30 001ACB30 281E0070 */  paddub     $3, $0, $0
/* ACC34 001ACB34 2E000010 */  b          .L001ACBF0
/* ACC38 001ACB38 00000000 */   nop
.L001ACB3C:
/* ACC3C 001ACB3C 40280300 */  sll        $5, $3, 1
/* ACC40 001ACB40 2130A400 */  addu       $6, $5, $4
/* ACC44 001ACB44 0100013C */  lui        $at, (0x10000 >> 16)
/* ACC48 001ACB48 2108C100 */  addu       $at, $6, $at
/* ACC4C 001ACB4C 00A02584 */  lh         $5, -0x6000($at)
/* ACC50 001ACB50 2600A010 */  beqz       $5, .L001ACBEC
/* ACC54 001ACB54 00000000 */   nop
/* ACC58 001ACB58 F81FC824 */  addiu      $8, $6, 0x1FF8
/* ACC5C 001ACB5C F87F0825 */  addiu      $8, $8, 0x7FF8
/* ACC60 001ACB60 00000685 */  lh         $6, 0x0($8)
/* ACC64 001ACB64 01000524 */  addiu      $5, $0, 0x1
/* ACC68 001ACB68 0300C510 */  beq        $6, $5, .L001ACB78
/* ACC6C 001ACB6C 00000000 */   nop
/* ACC70 001ACB70 1E00C014 */  bnez       $6, .L001ACBEC
/* ACC74 001ACB74 00000000 */   nop
.L001ACB78:
/* ACC78 001ACB78 02000524 */  addiu      $5, $0, 0x2
/* ACC7C 001ACB7C 000005A5 */  sh         $5, 0x0($8)
/* ACC80 001ACB80 0000868C */  lw         $6, 0x0($4)
/* ACC84 001ACB84 00000585 */  lh         $5, 0x0($8)
/* ACC88 001ACB88 40280500 */  sll        $5, $5, 1
/* ACC8C 001ACB8C 2128A600 */  addu       $5, $5, $6
/* ACC90 001ACB90 4C00A684 */  lh         $6, 0x4C($5)
/* ACC94 001ACB94 FFFF0524 */  addiu      $5, $0, -0x1
/* ACC98 001ACB98 1400C510 */  beq        $6, $5, .L001ACBEC
/* ACC9C 001ACB9C 00000000 */   nop
/* ACCA0 001ACBA0 B0110524 */  addiu      $5, $0, 0x11B0
/* ACCA4 001ACBA4 18286500 */  mult       $5, $3, $5
/* ACCA8 001ACBA8 2138A400 */  addu       $7, $5, $4
/* ACCAC 001ACBAC 00310600 */  sll        $6, $6, 4
/* ACCB0 001ACBB0 0415E58C */  lw         $5, 0x1504($7)
/* ACCB4 001ACBB4 2128A600 */  addu       $5, $5, $6
/* ACCB8 001ACBB8 0000A0C4 */  lwc1       $f0, 0x0($5)
/* ACCBC 001ACBBC 20008046 */  cvt.s.w    $f0, $f0
/* ACCC0 001ACBC0 B014E0E4 */  swc1       $f0, 0x14B0($7)
/* ACCC4 001ACBC4 0000868C */  lw         $6, 0x0($4)
/* ACCC8 001ACBC8 00000585 */  lh         $5, 0x0($8)
/* ACCCC 001ACBCC 40280500 */  sll        $5, $5, 1
/* ACCD0 001ACBD0 2128A600 */  addu       $5, $5, $6
/* ACCD4 001ACBD4 4C00A584 */  lh         $5, 0x4C($5)
/* ACCD8 001ACBD8 281EE5AC */  sw         $5, 0x1E28($7)
/* ACCDC 001ACBDC 06000524 */  addiu      $5, $0, 0x6
/* ACCE0 001ACBE0 241EE5AC */  sw         $5, 0x1E24($7)
/* ACCE4 001ACBE4 80BF053C */  lui        $5, (0xBF800000 >> 16)
/* ACCE8 001ACBE8 201EE5AC */  sw         $5, 0x1E20($7)
.L001ACBEC:
/* ACCEC 001ACBEC 01006324 */  addiu      $3, $3, 0x1
.L001ACBF0:
/* ACCF0 001ACBF0 08006528 */  slti       $5, $3, 0x8
/* ACCF4 001ACBF4 D1FFA014 */  bnez       $5, .L001ACB3C
/* ACCF8 001ACBF8 00000000 */   nop
/* ACCFC 001ACBFC 0800E003 */  jr         $31
/* ACD00 001ACC00 00000000 */   nop
/* ACD04 001ACC04 00000000 */  nop
/* ACD08 001ACC08 00000000 */  nop
/* ACD0C 001ACC0C 00000000 */  nop
