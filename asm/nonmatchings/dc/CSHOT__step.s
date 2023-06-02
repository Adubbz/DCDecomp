.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel step__5CSHOTFv
/* ABE10 001ABD10 80FFBD27 */  addiu      $sp, $sp, -0x80
/* ABE14 001ABD14 6000BF7F */  sq         $31, 0x60($sp)
/* ABE18 001ABD18 5000B57F */  sq         $21, 0x50($sp)
/* ABE1C 001ABD1C 4000B47F */  sq         $20, 0x40($sp)
/* ABE20 001ABD20 3000B37F */  sq         $19, 0x30($sp)
/* ABE24 001ABD24 2000B27F */  sq         $18, 0x20($sp)
/* ABE28 001ABD28 1000B17F */  sq         $17, 0x10($sp)
/* ABE2C 001ABD2C 0000B07F */  sq         $16, 0x0($sp)
/* ABE30 001ABD30 288E8070 */  paddub     $17, $4, $0
/* ABE34 001ABD34 28960070 */  paddub     $18, $0, $0
/* ABE38 001ABD38 69000010 */  b          .L001ABEE0
/* ABE3C 001ABD3C 00000000 */   nop
.L001ABD40:
/* ABE40 001ABD40 80A01200 */  sll        $20, $18, 2
/* ABE44 001ABD44 21209102 */  addu       $4, $20, $17
/* ABE48 001ABD48 D0039024 */  addiu      $16, $4, 0x3D0
/* ABE4C 001ABD4C D003838C */  lw         $3, 0x3D0($4)
/* ABE50 001ABD50 62006010 */  beqz       $3, .L001ABEDC
/* ABE54 001ABD54 00000000 */   nop
/* ABE58 001ABD58 8002838C */  lw         $3, 0x280($4)
/* ABE5C 001ABD5C 57006014 */  bnez       $3, .L001ABEBC
/* ABE60 001ABD60 00000000 */   nop
/* ABE64 001ABD64 00991200 */  sll        $19, $18, 4
/* ABE68 001ABD68 21183302 */  addu       $3, $17, $19
/* ABE6C 001ABD6C 0040023C */  lui        $2, (0x40000000 >> 16)
/* ABE70 001ABD70 00608244 */  mtc1       $2, $f12
/* ABE74 001ABD74 40007524 */  addiu      $21, $3, 0x40
/* ABE78 001ABD78 7000A427 */  addiu      $4, $sp, 0x70
/* ABE7C 001ABD7C 282EA072 */  paddub     $5, $21, $0
/* ABE80 001ABD80 C0016624 */  addiu      $6, $3, 0x1C0
/* ABE84 001ABD84 02000724 */  addiu      $7, $0, 0x2
/* ABE88 001ABD88 D0AD060C */  jal        checkCollision__FPfPfPfif
/* ABE8C 001ABD8C 00000000 */   nop
/* ABE90 001ABD90 10004014 */  bnez       $2, .L001ABDD4
/* ABE94 001ABD94 00000000 */   nop
/* ABE98 001ABD98 21187102 */  addu       $3, $19, $17
/* ABE9C 001ABD9C C00161C4 */  lwc1       $f1, 0x1C0($3)
/* ABEA0 001ABDA0 400060C4 */  lwc1       $f0, 0x40($3)
/* ABEA4 001ABDA4 00000146 */  add.s      $f0, $f0, $f1
/* ABEA8 001ABDA8 400060E4 */  swc1       $f0, 0x40($3)
/* ABEAC 001ABDAC C40161C4 */  lwc1       $f1, 0x1C4($3)
/* ABEB0 001ABDB0 440060C4 */  lwc1       $f0, 0x44($3)
/* ABEB4 001ABDB4 00000146 */  add.s      $f0, $f0, $f1
/* ABEB8 001ABDB8 440060E4 */  swc1       $f0, 0x44($3)
/* ABEBC 001ABDBC C80161C4 */  lwc1       $f1, 0x1C8($3)
/* ABEC0 001ABDC0 480060C4 */  lwc1       $f0, 0x48($3)
/* ABEC4 001ABDC4 00000146 */  add.s      $f0, $f0, $f1
/* ABEC8 001ABDC8 480060E4 */  swc1       $f0, 0x48($3)
/* ABECC 001ABDCC 3B000010 */  b          .L001ABEBC
/* ABED0 001ABDD0 00000000 */   nop
.L001ABDD4:
/* ABED4 001ABDD4 4040023C */  lui        $2, (0x40400000 >> 16)
/* ABED8 001ABDD8 00608244 */  mtc1       $2, $f12
/* ABEDC 001ABDDC 00688044 */  mtc1       $0, $f13
/* ABEE0 001ABDE0 21109102 */  addu       $2, $20, $17
/* ABEE4 001ABDE4 F09D848F */  lw         $4, -0x6210($gp)
/* ABEE8 001ABDE8 282EA072 */  paddub     $5, $21, $0
/* ABEEC 001ABDEC E002468C */  lw         $6, 0x2E0($2)
/* ABEF0 001ABDF0 01000724 */  addiu      $7, $0, 0x1
/* ABEF4 001ABDF4 02000824 */  addiu      $8, $0, 0x2
/* ABEF8 001ABDF8 284E0071 */  paddub     $9, $8, $0
/* ABEFC 001ABDFC 28560070 */  paddub     $10, $0, $0
/* ABF00 001ABE00 285E0070 */  paddub     $11, $0, $0
/* ABF04 001ABE04 E8D5060C */  jal        Set__14CCollisionDataFPfiiffiiii
/* ABF08 001ABE08 00000000 */   nop
/* ABF0C 001ABE0C F09D858F */  lw         $5, -0x6210($gp)
/* ABF10 001ABE10 01000424 */  addiu      $4, $0, 0x1
/* ABF14 001ABE14 803DA38C */  lw         $3, 0x3D80($5)
/* ABF18 001ABE18 80100300 */  sll        $2, $3, 2
/* ABF1C 001ABE1C 21104300 */  addu       $2, $2, $3
/* ABF20 001ABE20 40110200 */  sll        $2, $2, 5
/* ABF24 001ABE24 21104500 */  addu       $2, $2, $5
/* ABF28 001ABE28 580044AC */  sw         $4, 0x58($2)
/* ABF2C 001ABE2C 803DA38C */  lw         $3, 0x3D80($5)
/* ABF30 001ABE30 80100300 */  sll        $2, $3, 2
/* ABF34 001ABE34 21104300 */  addu       $2, $2, $3
/* ABF38 001ABE38 40110200 */  sll        $2, $2, 5
/* ABF3C 001ABE3C 21104500 */  addu       $2, $2, $5
/* ABF40 001ABE40 600040AC */  sw         $0, 0x60($2)
/* ABF44 001ABE44 049D828F */  lw         $2, -0x62FC($gp)
/* ABF48 001ABE48 16004480 */  lb         $4, 0x16($2)
/* ABF4C 001ABE4C F09D938F */  lw         $19, -0x6210($gp)
/* ABF50 001ABE50 7CDA060C */  jal        GetWeaponElementAttr__Fi
/* ABF54 001ABE54 00000000 */   nop
/* ABF58 001ABE58 803D648E */  lw         $4, 0x3D80($19)
/* ABF5C 001ABE5C 80180400 */  sll        $3, $4, 2
/* ABF60 001ABE60 21186400 */  addu       $3, $3, $4
/* ABF64 001ABE64 40190300 */  sll        $3, $3, 5
/* ABF68 001ABE68 21187300 */  addu       $3, $3, $19
/* ABF6C 001ABE6C 500062AC */  sw         $2, 0x50($3)
/* ABF70 001ABE70 049D838F */  lw         $3, -0x62FC($gp)
/* ABF74 001ABE74 EE006584 */  lh         $5, 0xEE($3)
/* ABF78 001ABE78 F09D868F */  lw         $6, -0x6210($gp)
/* ABF7C 001ABE7C 803DC48C */  lw         $4, 0x3D80($6)
/* ABF80 001ABE80 80180400 */  sll        $3, $4, 2
/* ABF84 001ABE84 21186400 */  addu       $3, $3, $4
/* ABF88 001ABE88 40190300 */  sll        $3, $3, 5
/* ABF8C 001ABE8C 21186600 */  addu       $3, $3, $6
/* ABF90 001ABE90 6C0065AC */  sw         $5, 0x6C($3)
/* ABF94 001ABE94 049D838F */  lw         $3, -0x62FC($gp)
/* ABF98 001ABE98 1C006524 */  addiu      $5, $3, 0x1C
/* ABF9C 001ABE9C F09D868F */  lw         $6, -0x6210($gp)
/* ABFA0 001ABEA0 803DC48C */  lw         $4, 0x3D80($6)
/* ABFA4 001ABEA4 80180400 */  sll        $3, $4, 2
/* ABFA8 001ABEA8 21186400 */  addu       $3, $3, $4
/* ABFAC 001ABEAC 40190300 */  sll        $3, $3, 5
/* ABFB0 001ABEB0 21186600 */  addu       $3, $3, $6
/* ABFB4 001ABEB4 640065AC */  sw         $5, 0x64($3)
/* ABFB8 001ABEB8 000000AE */  sw         $0, 0x0($16)
.L001ABEBC:
/* ABFBC 001ABEBC 21209102 */  addu       $4, $20, $17
/* ABFC0 001ABEC0 B002838C */  lw         $3, 0x2B0($4)
/* ABFC4 001ABEC4 FFFF6324 */  addiu      $3, $3, -0x1
/* ABFC8 001ABEC8 B00283AC */  sw         $3, 0x2B0($4)
/* ABFCC 001ABECC B002838C */  lw         $3, 0x2B0($4)
/* ABFD0 001ABED0 0200601C */  bgtz       $3, .L001ABEDC
/* ABFD4 001ABED4 00000000 */   nop
/* ABFD8 001ABED8 000000AE */  sw         $0, 0x0($16)
.L001ABEDC:
/* ABFDC 001ABEDC 01005226 */  addiu      $18, $18, 0x1
.L001ABEE0:
/* ABFE0 001ABEE0 0C00432A */  slti       $3, $18, 0xC
/* ABFE4 001ABEE4 96FF6014 */  bnez       $3, .L001ABD40
/* ABFE8 001ABEE8 00000000 */   nop
/* ABFEC 001ABEEC 6000BF7B */  lq         $31, 0x60($sp)
/* ABFF0 001ABEF0 5000B57B */  lq         $21, 0x50($sp)
/* ABFF4 001ABEF4 4000B47B */  lq         $20, 0x40($sp)
/* ABFF8 001ABEF8 3000B37B */  lq         $19, 0x30($sp)
/* ABFFC 001ABEFC 2000B27B */  lq         $18, 0x20($sp)
/* AC000 001ABF00 1000B17B */  lq         $17, 0x10($sp)
/* AC004 001ABF04 0000B07B */  lq         $16, 0x0($sp)
/* AC008 001ABF08 8000BD27 */  addiu      $sp, $sp, 0x80
/* AC00C 001ABF0C 0800E003 */  jr         $31
/* AC010 001ABF10 00000000 */   nop
/* AC014 001ABF14 00000000 */  nop
/* AC018 001ABF18 00000000 */  nop
/* AC01C 001ABF1C 00000000 */  nop
