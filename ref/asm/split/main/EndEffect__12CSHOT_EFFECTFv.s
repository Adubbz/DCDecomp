.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EndEffect__12CSHOT_EFFECTFv
/* 0ACC30 001ACB30 281E0070 */  paddub      $3, $0, $0
/* 0ACC34 001ACB34 2E000010 */  b           .L001ACBF0
/* 0ACC38 001ACB38 00000000 */   nop
.L001ACB3C:
/* 0ACC3C 001ACB3C 40280300 */  sll         $5, $3, 1
/* 0ACC40 001ACB40 2130A400 */  addu        $6, $5, $4
/* 0ACC44 001ACB44 0100013C */  lui         $1, (0x10000 >> 16)
/* 0ACC48 001ACB48 2108C100 */  addu        $1, $6, $1
/* 0ACC4C 001ACB4C 00A02584 */  lh          $5, -0x6000($1)
/* 0ACC50 001ACB50 2600A010 */  beqz        $5, .L001ACBEC
/* 0ACC54 001ACB54 00000000 */   nop
/* 0ACC58 001ACB58 F81FC824 */  addiu       $8, $6, 0x1FF8
/* 0ACC5C 001ACB5C F87F0825 */  addiu       $8, $8, 0x7FF8
/* 0ACC60 001ACB60 00000685 */  lh          $6, 0x0($8)
/* 0ACC64 001ACB64 01000524 */  addiu       $5, $0, 0x1
/* 0ACC68 001ACB68 0300C510 */  beq         $6, $5, .L001ACB78
/* 0ACC6C 001ACB6C 00000000 */   nop
/* 0ACC70 001ACB70 1E00C014 */  bnez        $6, .L001ACBEC
/* 0ACC74 001ACB74 00000000 */   nop
.L001ACB78:
/* 0ACC78 001ACB78 02000524 */  addiu       $5, $0, 0x2
/* 0ACC7C 001ACB7C 000005A5 */  sh          $5, 0x0($8)
/* 0ACC80 001ACB80 0000868C */  lw          $6, 0x0($4)
/* 0ACC84 001ACB84 00000585 */  lh          $5, 0x0($8)
/* 0ACC88 001ACB88 40280500 */  sll         $5, $5, 1
/* 0ACC8C 001ACB8C 2128A600 */  addu        $5, $5, $6
/* 0ACC90 001ACB90 4C00A684 */  lh          $6, 0x4C($5)
/* 0ACC94 001ACB94 FFFF0524 */  addiu       $5, $0, -0x1
/* 0ACC98 001ACB98 1400C510 */  beq         $6, $5, .L001ACBEC
/* 0ACC9C 001ACB9C 00000000 */   nop
/* 0ACCA0 001ACBA0 B0110524 */  addiu       $5, $0, 0x11B0
/* 0ACCA4 001ACBA4 18286500 */  mult        $5, $3, $5
/* 0ACCA8 001ACBA8 2138A400 */  addu        $7, $5, $4
/* 0ACCAC 001ACBAC 00310600 */  sll         $6, $6, 4
/* 0ACCB0 001ACBB0 0415E58C */  lw          $5, 0x1504($7)
/* 0ACCB4 001ACBB4 2128A600 */  addu        $5, $5, $6
/* 0ACCB8 001ACBB8 0000A0C4 */  lwc1        $f0, 0x0($5)
/* 0ACCBC 001ACBBC 20008046 */  cvt.s.w     $f0, $f0
/* 0ACCC0 001ACBC0 B014E0E4 */  swc1        $f0, 0x14B0($7)
/* 0ACCC4 001ACBC4 0000868C */  lw          $6, 0x0($4)
/* 0ACCC8 001ACBC8 00000585 */  lh          $5, 0x0($8)
/* 0ACCCC 001ACBCC 40280500 */  sll         $5, $5, 1
/* 0ACCD0 001ACBD0 2128A600 */  addu        $5, $5, $6
/* 0ACCD4 001ACBD4 4C00A584 */  lh          $5, 0x4C($5)
/* 0ACCD8 001ACBD8 281EE5AC */  sw          $5, 0x1E28($7)
/* 0ACCDC 001ACBDC 06000524 */  addiu       $5, $0, 0x6
/* 0ACCE0 001ACBE0 241EE5AC */  sw          $5, 0x1E24($7)
/* 0ACCE4 001ACBE4 80BF053C */  lui         $5, (0xBF800000 >> 16)
/* 0ACCE8 001ACBE8 201EE5AC */  sw          $5, 0x1E20($7)
.L001ACBEC:
/* 0ACCEC 001ACBEC 01006324 */  addiu       $3, $3, 0x1
.L001ACBF0:
/* 0ACCF0 001ACBF0 08006528 */  slti        $5, $3, 0x8
/* 0ACCF4 001ACBF4 D1FFA014 */  bnez        $5, .L001ACB3C
/* 0ACCF8 001ACBF8 00000000 */   nop
/* 0ACCFC 001ACBFC 0800E003 */  jr          $31
/* 0ACD00 001ACC00 00000000 */   nop
/* 0ACD04 001ACC04 00000000 */  nop
/* 0ACD08 001ACC08 00000000 */  nop
/* 0ACD0C 001ACC0C 00000000 */  nop
