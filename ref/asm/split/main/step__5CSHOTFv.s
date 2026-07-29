.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel step__5CSHOTFv
/* 0ABE10 001ABD10 80FFBD27 */  addiu       $29, $29, -0x80
/* 0ABE14 001ABD14 6000BF7F */  sq          $31, 0x60($29)
/* 0ABE18 001ABD18 5000B57F */  sq          $21, 0x50($29)
/* 0ABE1C 001ABD1C 4000B47F */  sq          $20, 0x40($29)
/* 0ABE20 001ABD20 3000B37F */  sq          $19, 0x30($29)
/* 0ABE24 001ABD24 2000B27F */  sq          $18, 0x20($29)
/* 0ABE28 001ABD28 1000B17F */  sq          $17, 0x10($29)
/* 0ABE2C 001ABD2C 0000B07F */  sq          $16, 0x0($29)
/* 0ABE30 001ABD30 288E8070 */  paddub      $17, $4, $0
/* 0ABE34 001ABD34 28960070 */  paddub      $18, $0, $0
/* 0ABE38 001ABD38 69000010 */  b           .L001ABEE0
/* 0ABE3C 001ABD3C 00000000 */   nop
.L001ABD40:
/* 0ABE40 001ABD40 80A01200 */  sll         $20, $18, 2
/* 0ABE44 001ABD44 21209102 */  addu        $4, $20, $17
/* 0ABE48 001ABD48 D0039024 */  addiu       $16, $4, 0x3D0
/* 0ABE4C 001ABD4C D003838C */  lw          $3, 0x3D0($4)
/* 0ABE50 001ABD50 62006010 */  beqz        $3, .L001ABEDC
/* 0ABE54 001ABD54 00000000 */   nop
/* 0ABE58 001ABD58 8002838C */  lw          $3, 0x280($4)
/* 0ABE5C 001ABD5C 57006014 */  bnez        $3, .L001ABEBC
/* 0ABE60 001ABD60 00000000 */   nop
/* 0ABE64 001ABD64 00991200 */  sll         $19, $18, 4
/* 0ABE68 001ABD68 21183302 */  addu        $3, $17, $19
/* 0ABE6C 001ABD6C 0040023C */  lui         $2, (0x40000000 >> 16)
/* 0ABE70 001ABD70 00608244 */  mtc1        $2, $f12
/* 0ABE74 001ABD74 40007524 */  addiu       $21, $3, 0x40
/* 0ABE78 001ABD78 7000A427 */  addiu       $4, $29, 0x70
/* 0ABE7C 001ABD7C 282EA072 */  paddub      $5, $21, $0
/* 0ABE80 001ABD80 C0016624 */  addiu       $6, $3, 0x1C0
/* 0ABE84 001ABD84 02000724 */  addiu       $7, $0, 0x2
/* 0ABE88 001ABD88 D0AD060C */  jal         checkCollision__FPfPfPfif
/* 0ABE8C 001ABD8C 00000000 */   nop
/* 0ABE90 001ABD90 10004014 */  bnez        $2, .L001ABDD4
/* 0ABE94 001ABD94 00000000 */   nop
/* 0ABE98 001ABD98 21187102 */  addu        $3, $19, $17
/* 0ABE9C 001ABD9C C00161C4 */  lwc1        $f1, 0x1C0($3)
/* 0ABEA0 001ABDA0 400060C4 */  lwc1        $f0, 0x40($3)
/* 0ABEA4 001ABDA4 00000146 */  add.s       $f0, $f0, $f1
/* 0ABEA8 001ABDA8 400060E4 */  swc1        $f0, 0x40($3)
/* 0ABEAC 001ABDAC C40161C4 */  lwc1        $f1, 0x1C4($3)
/* 0ABEB0 001ABDB0 440060C4 */  lwc1        $f0, 0x44($3)
/* 0ABEB4 001ABDB4 00000146 */  add.s       $f0, $f0, $f1
/* 0ABEB8 001ABDB8 440060E4 */  swc1        $f0, 0x44($3)
/* 0ABEBC 001ABDBC C80161C4 */  lwc1        $f1, 0x1C8($3)
/* 0ABEC0 001ABDC0 480060C4 */  lwc1        $f0, 0x48($3)
/* 0ABEC4 001ABDC4 00000146 */  add.s       $f0, $f0, $f1
/* 0ABEC8 001ABDC8 480060E4 */  swc1        $f0, 0x48($3)
/* 0ABECC 001ABDCC 3B000010 */  b           .L001ABEBC
/* 0ABED0 001ABDD0 00000000 */   nop
.L001ABDD4:
/* 0ABED4 001ABDD4 4040023C */  lui         $2, (0x40400000 >> 16)
/* 0ABED8 001ABDD8 00608244 */  mtc1        $2, $f12
/* 0ABEDC 001ABDDC 00688044 */  mtc1        $0, $f13
/* 0ABEE0 001ABDE0 21109102 */  addu        $2, $20, $17
/* 0ABEE4 001ABDE4 F09D848F */  lw          $4, -0x6210($28)
/* 0ABEE8 001ABDE8 282EA072 */  paddub      $5, $21, $0
/* 0ABEEC 001ABDEC E002468C */  lw          $6, 0x2E0($2)
/* 0ABEF0 001ABDF0 01000724 */  addiu       $7, $0, 0x1
/* 0ABEF4 001ABDF4 02000824 */  addiu       $8, $0, 0x2
/* 0ABEF8 001ABDF8 284E0071 */  paddub      $9, $8, $0
/* 0ABEFC 001ABDFC 28560070 */  paddub      $10, $0, $0
/* 0ABF00 001ABE00 285E0070 */  paddub      $11, $0, $0
/* 0ABF04 001ABE04 E8D5060C */  jal         Set__14CCollisionDataFPfiiffiiii
/* 0ABF08 001ABE08 00000000 */   nop
/* 0ABF0C 001ABE0C F09D858F */  lw          $5, -0x6210($28)
/* 0ABF10 001ABE10 01000424 */  addiu       $4, $0, 0x1
/* 0ABF14 001ABE14 803DA38C */  lw          $3, 0x3D80($5)
/* 0ABF18 001ABE18 80100300 */  sll         $2, $3, 2
/* 0ABF1C 001ABE1C 21104300 */  addu        $2, $2, $3
/* 0ABF20 001ABE20 40110200 */  sll         $2, $2, 5
/* 0ABF24 001ABE24 21104500 */  addu        $2, $2, $5
/* 0ABF28 001ABE28 580044AC */  sw          $4, 0x58($2)
/* 0ABF2C 001ABE2C 803DA38C */  lw          $3, 0x3D80($5)
/* 0ABF30 001ABE30 80100300 */  sll         $2, $3, 2
/* 0ABF34 001ABE34 21104300 */  addu        $2, $2, $3
/* 0ABF38 001ABE38 40110200 */  sll         $2, $2, 5
/* 0ABF3C 001ABE3C 21104500 */  addu        $2, $2, $5
/* 0ABF40 001ABE40 600040AC */  sw          $0, 0x60($2)
/* 0ABF44 001ABE44 049D828F */  lw          $2, -0x62FC($28)
/* 0ABF48 001ABE48 16004480 */  lb          $4, 0x16($2)
/* 0ABF4C 001ABE4C F09D938F */  lw          $19, -0x6210($28)
/* 0ABF50 001ABE50 7CDA060C */  jal         GetWeaponElementAttr__Fi
/* 0ABF54 001ABE54 00000000 */   nop
/* 0ABF58 001ABE58 803D648E */  lw          $4, 0x3D80($19)
/* 0ABF5C 001ABE5C 80180400 */  sll         $3, $4, 2
/* 0ABF60 001ABE60 21186400 */  addu        $3, $3, $4
/* 0ABF64 001ABE64 40190300 */  sll         $3, $3, 5
/* 0ABF68 001ABE68 21187300 */  addu        $3, $3, $19
/* 0ABF6C 001ABE6C 500062AC */  sw          $2, 0x50($3)
/* 0ABF70 001ABE70 049D838F */  lw          $3, -0x62FC($28)
/* 0ABF74 001ABE74 EE006584 */  lh          $5, 0xEE($3)
/* 0ABF78 001ABE78 F09D868F */  lw          $6, -0x6210($28)
/* 0ABF7C 001ABE7C 803DC48C */  lw          $4, 0x3D80($6)
/* 0ABF80 001ABE80 80180400 */  sll         $3, $4, 2
/* 0ABF84 001ABE84 21186400 */  addu        $3, $3, $4
/* 0ABF88 001ABE88 40190300 */  sll         $3, $3, 5
/* 0ABF8C 001ABE8C 21186600 */  addu        $3, $3, $6
/* 0ABF90 001ABE90 6C0065AC */  sw          $5, 0x6C($3)
/* 0ABF94 001ABE94 049D838F */  lw          $3, -0x62FC($28)
/* 0ABF98 001ABE98 1C006524 */  addiu       $5, $3, 0x1C
/* 0ABF9C 001ABE9C F09D868F */  lw          $6, -0x6210($28)
/* 0ABFA0 001ABEA0 803DC48C */  lw          $4, 0x3D80($6)
/* 0ABFA4 001ABEA4 80180400 */  sll         $3, $4, 2
/* 0ABFA8 001ABEA8 21186400 */  addu        $3, $3, $4
/* 0ABFAC 001ABEAC 40190300 */  sll         $3, $3, 5
/* 0ABFB0 001ABEB0 21186600 */  addu        $3, $3, $6
/* 0ABFB4 001ABEB4 640065AC */  sw          $5, 0x64($3)
/* 0ABFB8 001ABEB8 000000AE */  sw          $0, 0x0($16)
.L001ABEBC:
/* 0ABFBC 001ABEBC 21209102 */  addu        $4, $20, $17
/* 0ABFC0 001ABEC0 B002838C */  lw          $3, 0x2B0($4)
/* 0ABFC4 001ABEC4 FFFF6324 */  addiu       $3, $3, -0x1
/* 0ABFC8 001ABEC8 B00283AC */  sw          $3, 0x2B0($4)
/* 0ABFCC 001ABECC B002838C */  lw          $3, 0x2B0($4)
/* 0ABFD0 001ABED0 0200601C */  bgtz        $3, .L001ABEDC
/* 0ABFD4 001ABED4 00000000 */   nop
/* 0ABFD8 001ABED8 000000AE */  sw          $0, 0x0($16)
.L001ABEDC:
/* 0ABFDC 001ABEDC 01005226 */  addiu       $18, $18, 0x1
.L001ABEE0:
/* 0ABFE0 001ABEE0 0C00432A */  slti        $3, $18, 0xC
/* 0ABFE4 001ABEE4 96FF6014 */  bnez        $3, .L001ABD40
/* 0ABFE8 001ABEE8 00000000 */   nop
/* 0ABFEC 001ABEEC 6000BF7B */  lq          $31, 0x60($29)
/* 0ABFF0 001ABEF0 5000B57B */  lq          $21, 0x50($29)
/* 0ABFF4 001ABEF4 4000B47B */  lq          $20, 0x40($29)
/* 0ABFF8 001ABEF8 3000B37B */  lq          $19, 0x30($29)
/* 0ABFFC 001ABEFC 2000B27B */  lq          $18, 0x20($29)
/* 0AC000 001ABF00 1000B17B */  lq          $17, 0x10($29)
/* 0AC004 001ABF04 0000B07B */  lq          $16, 0x0($29)
/* 0AC008 001ABF08 8000BD27 */  addiu       $29, $29, 0x80
/* 0AC00C 001ABF0C 0800E003 */  jr          $31
/* 0AC010 001ABF10 00000000 */   nop
/* 0AC014 001ABF14 00000000 */  nop
/* 0AC018 001ABF18 00000000 */  nop
/* 0AC01C 001ABF1C 00000000 */  nop
