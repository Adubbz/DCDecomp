.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _sceSifLoadElfPart
/* 19198 00119098 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 1919C 0011909C 5000B4FF */  sd         $20, 0x50($sp)
/* 191A0 001190A0 4000B3FF */  sd         $19, 0x40($sp)
/* 191A4 001190A4 2DA0C000 */  daddu      $20, $6, $0
/* 191A8 001190A8 3000B2FF */  sd         $18, 0x30($sp)
/* 191AC 001190AC 2D98E000 */  daddu      $19, $7, $0
/* 191B0 001190B0 1000B0FF */  sd         $16, 0x10($sp)
/* 191B4 001190B4 2D90A000 */  daddu      $18, $5, $0
/* 191B8 001190B8 6000BFFF */  sd         $31, 0x60($sp)
/* 191BC 001190BC 2D808000 */  daddu      $16, $4, $0
/* 191C0 001190C0 BA62040C */  jal        _lf_bind
/* 191C4 001190C4 2000B1FF */   sd        $17, 0x20($sp)
/* 191C8 001190C8 2C004004 */  bltz       $2, .L0011917C
/* 191CC 001190CC FFFF023C */   lui       $2, (0xFFFF0000 >> 16)
/* 191D0 001190D0 FA62040C */  jal        _lf_version
/* 191D4 001190D4 00000000 */   nop
/* 191D8 001190D8 04004050 */  beql       $2, $0, .L001190EC
/* 191DC 001190DC 2B00023C */   lui       $2, %hi(D_002A8388)
/* 191E0 001190E0 FEFF023C */  lui        $2, (0xFFFEFFFC >> 16)
/* 191E4 001190E4 25000010 */  b          .L0011917C
/* 191E8 001190E8 FCFF4234 */   ori       $2, $2, (0xFFFEFFFC & 0xFFFF)
.L001190EC:
/* 191EC 001190EC 2D280002 */  daddu      $5, $16, $0
/* 191F0 001190F0 88835124 */  addiu      $17, $2, %lo(D_002A8388)
/* 191F4 001190F4 FC000624 */  addiu      $6, $0, 0xFC
/* 191F8 001190F8 2D202002 */  daddu      $4, $17, $0
/* 191FC 001190FC 5C16040C */  jal        strncpy
/* 19200 00119100 F8FF3026 */   addiu     $16, $17, -0x8
/* 19204 00119104 2D284002 */  daddu      $5, $18, $0
/* 19208 00119108 030100A2 */  sb         $0, 0x103($16)
/* 1920C 0011910C FC002426 */  addiu      $4, $17, 0xFC
/* 19210 00119110 5C16040C */  jal        strncpy
/* 19214 00119114 FC000624 */   addiu     $6, $0, 0xFC
/* 19218 00119118 2B00043C */  lui        $4, %hi(D_002A8580)
/* 1921C 0011911C FF0100A2 */  sb         $0, 0x1FF($16)
/* 19220 00119120 2D286002 */  daddu      $5, $19, $0
/* 19224 00119124 80858424 */  addiu      $4, $4, %lo(D_002A8580)
/* 19228 00119128 0000A0AF */  sw         $0, 0x0($sp)
/* 1922C 0011912C 2D300000 */  daddu      $6, $0, $0
/* 19230 00119130 2D380002 */  daddu      $7, $16, $0
/* 19234 00119134 00020824 */  addiu      $8, $0, 0x200
/* 19238 00119138 2D480002 */  daddu      $9, $16, $0
/* 1923C 0011913C 10000A24 */  addiu      $10, $0, 0x10
/* 19240 00119140 2A5D040C */  jal        sceSifCallRpc
/* 19244 00119144 2D580000 */   daddu     $11, $0, $0
/* 19248 00119148 04004304 */  bgezl      $2, .L0011915C
/* 1924C 0011914C F8FF228E */   lw        $2, -0x8($17)
/* 19250 00119150 FEFF023C */  lui        $2, (0xFFFEFFFF >> 16)
/* 19254 00119154 09000010 */  b          .L0011917C
/* 19258 00119158 FFFF4234 */   ori       $2, $2, (0xFFFEFFFF & 0xFFFF)
.L0011915C:
/* 1925C 0011915C 04004054 */  bnel       $2, $0, .L00119170
/* 19260 00119160 000082AE */   sw        $2, 0x0($20)
/* 19264 00119164 FEFF023C */  lui        $2, (0xFFFEFFFD >> 16)
/* 19268 00119168 04000010 */  b          .L0011917C
/* 1926C 0011916C FDFF4234 */   ori       $2, $2, (0xFFFEFFFD & 0xFFFF)
.L00119170:
/* 19270 00119170 2D100000 */  daddu      $2, $0, $0
/* 19274 00119174 0400038E */  lw         $3, 0x4($16)
/* 19278 00119178 040083AE */  sw         $3, 0x4($20)
.L0011917C:
/* 1927C 0011917C 6000BFDF */  ld         $31, 0x60($sp)
/* 19280 00119180 5000B4DF */  ld         $20, 0x50($sp)
/* 19284 00119184 4000B3DF */  ld         $19, 0x40($sp)
/* 19288 00119188 3000B2DF */  ld         $18, 0x30($sp)
/* 1928C 0011918C 2000B1DF */  ld         $17, 0x20($sp)
/* 19290 00119190 1000B0DF */  ld         $16, 0x10($sp)
/* 19294 00119194 0800E003 */  jr         $31
/* 19298 00119198 7000BD27 */   addiu     $sp, $sp, 0x70
/* 1929C 0011919C 00000000 */  nop