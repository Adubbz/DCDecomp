.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Draw__12CSHOT_EFFECTFv
/* AC020 001ABF20 80FFBD27 */  addiu      $sp, $sp, -0x80
/* AC024 001ABF24 5000BF7F */  sq         $31, 0x50($sp)
/* AC028 001ABF28 4000B37F */  sq         $19, 0x40($sp)
/* AC02C 001ABF2C 3000B27F */  sq         $18, 0x30($sp)
/* AC030 001ABF30 2000B17F */  sq         $17, 0x20($sp)
/* AC034 001ABF34 1000B07F */  sq         $16, 0x10($sp)
/* AC038 001ABF38 0000B4E7 */  swc1       $f20, 0x0($sp)
/* AC03C 001ABF3C 289E8070 */  paddub     $19, $4, $0
/* AC040 001ABF40 0000838C */  lw         $3, 0x0($4)
/* AC044 001ABF44 84006010 */  beqz       $3, .L001AC158
/* AC048 001ABF48 00000000 */   nop
/* AC04C 001ABF4C C701023C */  lui        $2, %hi(TexManager)
/* AC050 001ABF50 70584424 */  addiu      $4, $2, %lo(TexManager)
/* AC054 001ABF54 D48B858F */  lw         $5, -0x742C($gp)
/* AC058 001ABF58 0100013C */  lui        $at, (0x10000 >> 16)
/* AC05C 001ABF5C 21086102 */  addu       $at, $19, $at
/* AC060 001ABF60 54A1268C */  lw         $6, -0x5EAC($at)
/* AC064 001ABF64 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* AC068 001ABF68 00000000 */   nop
/* AC06C 001ABF6C 28860070 */  paddub     $16, $0, $0
/* AC070 001ABF70 76000010 */  b          .L001AC14C
/* AC074 001ABF74 00000000 */   nop
.L001ABF78:
/* AC078 001ABF78 40181000 */  sll        $3, $16, 1
/* AC07C 001ABF7C 21187300 */  addu       $3, $3, $19
/* AC080 001ABF80 0100013C */  lui        $at, (0x10000 >> 16)
/* AC084 001ABF84 21086100 */  addu       $at, $3, $at
/* AC088 001ABF88 00A02384 */  lh         $3, -0x6000($at)
/* AC08C 001ABF8C 6E006010 */  beqz       $3, .L001AC148
/* AC090 001ABF90 00000000 */   nop
/* AC094 001ABF94 B0110224 */  addiu      $2, $0, 0x11B0
/* AC098 001ABF98 18100202 */  mult       $2, $16, $2
/* AC09C 001ABF9C 21106202 */  addu       $2, $19, $2
/* AC0A0 001ABFA0 C0115124 */  addiu      $17, $2, 0x11C0
/* AC0A4 001ABFA4 28262072 */  paddub     $4, $17, $0
/* AC0A8 001ABFA8 6012598C */  lw         $25, 0x1260($2)
/* AC0AC 001ABFAC 0800398F */  lw         $25, 0x8($25)
/* AC0B0 001ABFB0 09F82003 */  jalr       $25
/* AC0B4 001ABFB4 00000000 */   nop
/* AC0B8 001ABFB8 80101000 */  sll        $2, $16, 2
/* AC0BC 001ABFBC 21105300 */  addu       $2, $2, $19
/* AC0C0 001ABFC0 D8205224 */  addiu      $18, $2, 0x20D8
/* AC0C4 001ABFC4 F87F5226 */  addiu      $18, $18, 0x7FF8
/* AC0C8 001ABFC8 000041C6 */  lwc1       $f1, 0x0($18)
/* AC0CC 001ABFCC 00008044 */  mtc1       $0, $f0
/* AC0D0 001ABFD0 00000000 */  nop
/* AC0D4 001ABFD4 34080046 */  c.lt.s     $f1, $f0
/* AC0D8 001ABFD8 00000000 */  nop
/* AC0DC 001ABFDC 48000145 */  bc1t       .L001AC100
/* AC0E0 001ABFE0 00000000 */   nop
/* AC0E4 001ABFE4 28262072 */  paddub     $4, $17, $0
/* AC0E8 001ABFE8 6000A527 */  addiu      $5, $sp, 0x60
/* AC0EC 001ABFEC A000398E */  lw         $25, 0xA0($17)
/* AC0F0 001ABFF0 A000398F */  lw         $25, 0xA0($25)
/* AC0F4 001ABFF4 09F82003 */  jalr       $25
/* AC0F8 001ABFF8 00000000 */   nop
/* AC0FC 001ABFFC 000054C6 */  lwc1       $f20, 0x0($18)
/* AC100 001AC000 BE11040C */  jal        rand
/* AC104 001AC004 00000000 */   nop
/* AC108 001AC008 00008244 */  mtc1       $2, $f0
/* AC10C 001AC00C 00000000 */  nop
/* AC110 001AC010 20008046 */  cvt.s.w    $f0, $f0
/* AC114 001AC014 42A00046 */  mul.s      $f1, $f20, $f0
/* AC118 001AC018 0040023C */  lui        $2, (0x40000000 >> 16)
/* AC11C 001AC01C 00008244 */  mtc1       $2, $f0
/* AC120 001AC020 00000000 */  nop
/* AC124 001AC024 42000146 */  mul.s      $f1, $f0, $f1
/* AC128 001AC028 004F023C */  lui        $2, (0x4F000000 >> 16)
/* AC12C 001AC02C 00008244 */  mtc1       $2, $f0
/* AC130 001AC030 00000000 */  nop
/* AC134 001AC034 43080046 */  div.s      $f1, $f1, $f0
/* AC138 001AC038 6000A0C7 */  lwc1       $f0, 0x60($sp)
/* AC13C 001AC03C 00000146 */  add.s      $f0, $f0, $f1
/* AC140 001AC040 01001446 */  sub.s      $f0, $f0, $f20
/* AC144 001AC044 7000A0E7 */  swc1       $f0, 0x70($sp)
/* AC148 001AC048 000054C6 */  lwc1       $f20, 0x0($18)
/* AC14C 001AC04C BE11040C */  jal        rand
/* AC150 001AC050 00000000 */   nop
/* AC154 001AC054 00008244 */  mtc1       $2, $f0
/* AC158 001AC058 00000000 */  nop
/* AC15C 001AC05C 20008046 */  cvt.s.w    $f0, $f0
/* AC160 001AC060 42A00046 */  mul.s      $f1, $f20, $f0
/* AC164 001AC064 0040023C */  lui        $2, (0x40000000 >> 16)
/* AC168 001AC068 00008244 */  mtc1       $2, $f0
/* AC16C 001AC06C 00000000 */  nop
/* AC170 001AC070 42000146 */  mul.s      $f1, $f0, $f1
/* AC174 001AC074 004F023C */  lui        $2, (0x4F000000 >> 16)
/* AC178 001AC078 00008244 */  mtc1       $2, $f0
/* AC17C 001AC07C 00000000 */  nop
/* AC180 001AC080 43080046 */  div.s      $f1, $f1, $f0
/* AC184 001AC084 6400A0C7 */  lwc1       $f0, 0x64($sp)
/* AC188 001AC088 00000146 */  add.s      $f0, $f0, $f1
/* AC18C 001AC08C 01001446 */  sub.s      $f0, $f0, $f20
/* AC190 001AC090 7400A0E7 */  swc1       $f0, 0x74($sp)
/* AC194 001AC094 000054C6 */  lwc1       $f20, 0x0($18)
/* AC198 001AC098 BE11040C */  jal        rand
/* AC19C 001AC09C 00000000 */   nop
/* AC1A0 001AC0A0 00008244 */  mtc1       $2, $f0
/* AC1A4 001AC0A4 00000000 */  nop
/* AC1A8 001AC0A8 20008046 */  cvt.s.w    $f0, $f0
/* AC1AC 001AC0AC 42A00046 */  mul.s      $f1, $f20, $f0
/* AC1B0 001AC0B0 0040023C */  lui        $2, (0x40000000 >> 16)
/* AC1B4 001AC0B4 00008244 */  mtc1       $2, $f0
/* AC1B8 001AC0B8 00000000 */  nop
/* AC1BC 001AC0BC 42000146 */  mul.s      $f1, $f0, $f1
/* AC1C0 001AC0C0 004F023C */  lui        $2, (0x4F000000 >> 16)
/* AC1C4 001AC0C4 00008244 */  mtc1       $2, $f0
/* AC1C8 001AC0C8 00000000 */  nop
/* AC1CC 001AC0CC 43080046 */  div.s      $f1, $f1, $f0
/* AC1D0 001AC0D0 6800A0C7 */  lwc1       $f0, 0x68($sp)
/* AC1D4 001AC0D4 00000146 */  add.s      $f0, $f0, $f1
/* AC1D8 001AC0D8 01001446 */  sub.s      $f0, $f0, $f20
/* AC1DC 001AC0DC 7800A0E7 */  swc1       $f0, 0x78($sp)
/* AC1E0 001AC0E0 803F023C */  lui        $2, (0x3F800000 >> 16)
/* AC1E4 001AC0E4 7C00A2AF */  sw         $2, 0x7C($sp)
/* AC1E8 001AC0E8 28262072 */  paddub     $4, $17, $0
/* AC1EC 001AC0EC 7000A527 */  addiu      $5, $sp, 0x70
/* AC1F0 001AC0F0 A000398E */  lw         $25, 0xA0($17)
/* AC1F4 001AC0F4 1400398F */  lw         $25, 0x14($25)
/* AC1F8 001AC0F8 09F82003 */  jalr       $25
/* AC1FC 001AC0FC 00000000 */   nop
.L001AC100:
/* AC200 001AC100 28262072 */  paddub     $4, $17, $0
/* AC204 001AC104 A000398E */  lw         $25, 0xA0($17)
/* AC208 001AC108 AC00398F */  lw         $25, 0xAC($25)
/* AC20C 001AC10C 09F82003 */  jalr       $25
/* AC210 001AC110 00000000 */   nop
/* AC214 001AC114 000041C6 */  lwc1       $f1, 0x0($18)
/* AC218 001AC118 00008044 */  mtc1       $0, $f0
/* AC21C 001AC11C 00000000 */  nop
/* AC220 001AC120 34080046 */  c.lt.s     $f1, $f0
/* AC224 001AC124 00000000 */  nop
/* AC228 001AC128 07000145 */  bc1t       .L001AC148
/* AC22C 001AC12C 00000000 */   nop
/* AC230 001AC130 28262072 */  paddub     $4, $17, $0
/* AC234 001AC134 6000A527 */  addiu      $5, $sp, 0x60
/* AC238 001AC138 A000398E */  lw         $25, 0xA0($17)
/* AC23C 001AC13C 1400398F */  lw         $25, 0x14($25)
/* AC240 001AC140 09F82003 */  jalr       $25
/* AC244 001AC144 00000000 */   nop
.L001AC148:
/* AC248 001AC148 01001026 */  addiu      $16, $16, 0x1
.L001AC14C:
/* AC24C 001AC14C 0800032A */  slti       $3, $16, 0x8
/* AC250 001AC150 89FF6014 */  bnez       $3, .L001ABF78
/* AC254 001AC154 00000000 */   nop
.L001AC158:
/* AC258 001AC158 5000BF7B */  lq         $31, 0x50($sp)
/* AC25C 001AC15C 4000B37B */  lq         $19, 0x40($sp)
/* AC260 001AC160 3000B27B */  lq         $18, 0x30($sp)
/* AC264 001AC164 2000B17B */  lq         $17, 0x20($sp)
/* AC268 001AC168 1000B07B */  lq         $16, 0x10($sp)
/* AC26C 001AC16C 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* AC270 001AC170 8000BD27 */  addiu      $sp, $sp, 0x80
/* AC274 001AC174 0800E003 */  jr         $31
/* AC278 001AC178 00000000 */   nop
/* AC27C 001AC17C 00000000 */  nop
