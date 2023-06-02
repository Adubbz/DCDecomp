.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Step__13CSHOT_FIREBARFv
/* AF0A0 001AEFA0 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* AF0A4 001AEFA4 5000BF7F */  sq         $31, 0x50($sp)
/* AF0A8 001AEFA8 4000B47F */  sq         $20, 0x40($sp)
/* AF0AC 001AEFAC 3000B37F */  sq         $19, 0x30($sp)
/* AF0B0 001AEFB0 2000B27F */  sq         $18, 0x20($sp)
/* AF0B4 001AEFB4 1000B17F */  sq         $17, 0x10($sp)
/* AF0B8 001AEFB8 0000B07F */  sq         $16, 0x0($sp)
/* AF0BC 001AEFBC 28A68070 */  paddub     $20, $4, $0
/* AF0C0 001AEFC0 90938383 */  lb         $3, -0x6C70($gp)
/* AF0C4 001AEFC4 04006014 */  bnez       $3, .L001AEFD8
/* AF0C8 001AEFC8 00000000 */   nop
/* AF0CC 001AEFCC 8C9380AF */  sw         $0, -0x6C74($gp)
/* AF0D0 001AEFD0 01000324 */  addiu      $3, $0, 0x1
/* AF0D4 001AEFD4 909383A3 */  sb         $3, -0x6C70($gp)
.L001AEFD8:
/* AF0D8 001AEFD8 8C93838F */  lw         $3, -0x6C74($gp)
/* AF0DC 001AEFDC 01006324 */  addiu      $3, $3, 0x1
/* AF0E0 001AEFE0 8C9383AF */  sw         $3, -0x6C74($gp)
/* AF0E4 001AEFE4 8C93838F */  lw         $3, -0x6C74($gp)
/* AF0E8 001AEFE8 1E006328 */  slti       $3, $3, 0x1E
/* AF0EC 001AEFEC 02006014 */  bnez       $3, .L001AEFF8
/* AF0F0 001AEFF0 00000000 */   nop
/* AF0F4 001AEFF4 8C9380AF */  sw         $0, -0x6C74($gp)
.L001AEFF8:
/* AF0F8 001AEFF8 28860070 */  paddub     $16, $0, $0
/* AF0FC 001AEFFC 6A000010 */  b          .L001AF1A8
/* AF100 001AF000 00000000 */   nop
.L001AF004:
/* AF104 001AF004 80181000 */  sll        $3, $16, 2
/* AF108 001AF008 21307400 */  addu       $6, $3, $20
/* AF10C 001AF00C 000CD324 */  addiu      $19, $6, 0xC00
/* AF110 001AF010 000CC48C */  lw         $4, 0xC00($6)
/* AF114 001AF014 FFFF0324 */  addiu      $3, $0, -0x1
/* AF118 001AF018 62008310 */  beq        $4, $3, .L001AF1A4
/* AF11C 001AF01C 00000000 */   nop
/* AF120 001AF020 60008014 */  bnez       $4, .L001AF1A4
/* AF124 001AF024 00000000 */   nop
/* AF128 001AF028 0009D224 */  addiu      $18, $6, 0x900
/* AF12C 001AF02C 0009C0C4 */  lwc1       $f0, 0x900($6)
/* AF130 001AF030 8040033C */  lui        $3, (0x40800000 >> 16)
/* AF134 001AF034 00608344 */  mtc1       $3, $f12
/* AF138 001AF038 00000000 */  nop
/* AF13C 001AF03C 01000C46 */  sub.s      $f0, $f0, $f12
/* AF140 001AF040 0009C0E4 */  swc1       $f0, 0x900($6)
/* AF144 001AF044 0008C1C4 */  lwc1       $f1, 0x800($6)
/* AF148 001AF048 C48580C7 */  lwc1       $f0, -0x7A3C($gp)
/* AF14C 001AF04C 00080046 */  add.s      $f0, $f1, $f0
/* AF150 001AF050 0008C0E4 */  swc1       $f0, 0x800($6)
/* AF154 001AF054 8C93838F */  lw         $3, -0x6C74($gp)
/* AF158 001AF058 3A006014 */  bnez       $3, .L001AF144
/* AF15C 001AF05C 00000000 */   nop
/* AF160 001AF060 803F023C */  lui        $2, (0x3F800000 >> 16)
/* AF164 001AF064 00688244 */  mtc1       $2, $f13
/* AF168 001AF068 00111000 */  sll        $2, $16, 4
/* AF16C 001AF06C 21288202 */  addu       $5, $20, $2
/* AF170 001AF070 F09D848F */  lw         $4, -0x6210($gp)
/* AF174 001AF074 000AC68C */  lw         $6, 0xA00($6)
/* AF178 001AF078 02000724 */  addiu      $7, $0, 0x2
/* AF17C 001AF07C 2846E070 */  paddub     $8, $7, $0
/* AF180 001AF080 284EE070 */  paddub     $9, $7, $0
/* AF184 001AF084 28560070 */  paddub     $10, $0, $0
/* AF188 001AF088 285E0070 */  paddub     $11, $0, $0
/* AF18C 001AF08C E8D5060C */  jal        Set__14CCollisionDataFPfiiffiiii
/* AF190 001AF090 00000000 */   nop
/* AF194 001AF094 F09D858F */  lw         $5, -0x6210($gp)
/* AF198 001AF098 05000424 */  addiu      $4, $0, 0x5
/* AF19C 001AF09C 803DA38C */  lw         $3, 0x3D80($5)
/* AF1A0 001AF0A0 80100300 */  sll        $2, $3, 2
/* AF1A4 001AF0A4 21104300 */  addu       $2, $2, $3
/* AF1A8 001AF0A8 40110200 */  sll        $2, $2, 5
/* AF1AC 001AF0AC 21104500 */  addu       $2, $2, $5
/* AF1B0 001AF0B0 580044AC */  sw         $4, 0x58($2)
/* AF1B4 001AF0B4 06000424 */  addiu      $4, $0, 0x6
/* AF1B8 001AF0B8 803DA38C */  lw         $3, 0x3D80($5)
/* AF1BC 001AF0BC 80100300 */  sll        $2, $3, 2
/* AF1C0 001AF0C0 21104300 */  addu       $2, $2, $3
/* AF1C4 001AF0C4 40110200 */  sll        $2, $2, 5
/* AF1C8 001AF0C8 21104500 */  addu       $2, $2, $5
/* AF1CC 001AF0CC 600044AC */  sw         $4, 0x60($2)
/* AF1D0 001AF0D0 049D828F */  lw         $2, -0x62FC($gp)
/* AF1D4 001AF0D4 EE004484 */  lh         $4, 0xEE($2)
/* AF1D8 001AF0D8 F09D858F */  lw         $5, -0x6210($gp)
/* AF1DC 001AF0DC 803DA38C */  lw         $3, 0x3D80($5)
/* AF1E0 001AF0E0 80100300 */  sll        $2, $3, 2
/* AF1E4 001AF0E4 21104300 */  addu       $2, $2, $3
/* AF1E8 001AF0E8 40110200 */  sll        $2, $2, 5
/* AF1EC 001AF0EC 21104500 */  addu       $2, $2, $5
/* AF1F0 001AF0F0 6C0044AC */  sw         $4, 0x6C($2)
/* AF1F4 001AF0F4 049D828F */  lw         $2, -0x62FC($gp)
/* AF1F8 001AF0F8 1C004424 */  addiu      $4, $2, 0x1C
/* AF1FC 001AF0FC F09D858F */  lw         $5, -0x6210($gp)
/* AF200 001AF100 803DA38C */  lw         $3, 0x3D80($5)
/* AF204 001AF104 80100300 */  sll        $2, $3, 2
/* AF208 001AF108 21104300 */  addu       $2, $2, $3
/* AF20C 001AF10C 40110200 */  sll        $2, $2, 5
/* AF210 001AF110 21104500 */  addu       $2, $2, $5
/* AF214 001AF114 640044AC */  sw         $4, 0x64($2)
/* AF218 001AF118 049D828F */  lw         $2, -0x62FC($gp)
/* AF21C 001AF11C 16004480 */  lb         $4, 0x16($2)
/* AF220 001AF120 F09D918F */  lw         $17, -0x6210($gp)
/* AF224 001AF124 7CDA060C */  jal        GetWeaponElementAttr__Fi
/* AF228 001AF128 00000000 */   nop
/* AF22C 001AF12C 803D248E */  lw         $4, 0x3D80($17)
/* AF230 001AF130 80180400 */  sll        $3, $4, 2
/* AF234 001AF134 21186400 */  addu       $3, $3, $4
/* AF238 001AF138 40190300 */  sll        $3, $3, 5
/* AF23C 001AF13C 21187100 */  addu       $3, $3, $17
/* AF240 001AF140 500062AC */  sw         $2, 0x50($3)
.L001AF144:
/* AF244 001AF144 00191000 */  sll        $3, $16, 4
/* AF248 001AF148 21187400 */  addu       $3, $3, $20
/* AF24C 001AF14C 000461C4 */  lwc1       $f1, 0x400($3)
/* AF250 001AF150 000060C4 */  lwc1       $f0, 0x0($3)
/* AF254 001AF154 00000146 */  add.s      $f0, $f0, $f1
/* AF258 001AF158 000060E4 */  swc1       $f0, 0x0($3)
/* AF25C 001AF15C 040461C4 */  lwc1       $f1, 0x404($3)
/* AF260 001AF160 040060C4 */  lwc1       $f0, 0x4($3)
/* AF264 001AF164 00000146 */  add.s      $f0, $f0, $f1
/* AF268 001AF168 040060E4 */  swc1       $f0, 0x4($3)
/* AF26C 001AF16C 080461C4 */  lwc1       $f1, 0x408($3)
/* AF270 001AF170 080060C4 */  lwc1       $f0, 0x8($3)
/* AF274 001AF174 00000146 */  add.s      $f0, $f0, $f1
/* AF278 001AF178 080060E4 */  swc1       $f0, 0x8($3)
/* AF27C 001AF17C 000041C6 */  lwc1       $f1, 0x0($18)
/* AF280 001AF180 0042033C */  lui        $3, (0x42000000 >> 16)
/* AF284 001AF184 00008344 */  mtc1       $3, $f0
/* AF288 001AF188 00000000 */  nop
/* AF28C 001AF18C 36080046 */  c.le.s     $f1, $f0
/* AF290 001AF190 00000000 */  nop
/* AF294 001AF194 03000045 */  bc1f       .L001AF1A4
/* AF298 001AF198 00000000 */   nop
/* AF29C 001AF19C FFFF0324 */  addiu      $3, $0, -0x1
/* AF2A0 001AF1A0 000063AE */  sw         $3, 0x0($19)
.L001AF1A4:
/* AF2A4 001AF1A4 01001026 */  addiu      $16, $16, 0x1
.L001AF1A8:
/* AF2A8 001AF1A8 1800032A */  slti       $3, $16, 0x18
/* AF2AC 001AF1AC 95FF6014 */  bnez       $3, .L001AF004
/* AF2B0 001AF1B0 00000000 */   nop
/* AF2B4 001AF1B4 5000BF7B */  lq         $31, 0x50($sp)
/* AF2B8 001AF1B8 4000B47B */  lq         $20, 0x40($sp)
/* AF2BC 001AF1BC 3000B37B */  lq         $19, 0x30($sp)
/* AF2C0 001AF1C0 2000B27B */  lq         $18, 0x20($sp)
/* AF2C4 001AF1C4 1000B17B */  lq         $17, 0x10($sp)
/* AF2C8 001AF1C8 0000B07B */  lq         $16, 0x0($sp)
/* AF2CC 001AF1CC 6000BD27 */  addiu      $sp, $sp, 0x60
/* AF2D0 001AF1D0 0800E003 */  jr         $31
/* AF2D4 001AF1D4 00000000 */   nop
/* AF2D8 001AF1D8 00000000 */  nop
/* AF2DC 001AF1DC 00000000 */  nop
