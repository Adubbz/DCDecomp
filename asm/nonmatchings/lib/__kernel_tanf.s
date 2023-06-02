.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __kernel_tanf
/* 1CA28 0011C928 00600244 */  mfc1       $2, $f12
/* 1CA2C 0011C92C F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 1CA30 0011C930 2D304000 */  daddu      $6, $2, $0
/* 1CA34 0011C934 FF7F033C */  lui        $3, (0x7FFFFFFF >> 16)
/* 1CA38 0011C938 FFFF6334 */  ori        $3, $3, (0x7FFFFFFF & 0xFFFF)
/* 1CA3C 0011C93C 7F31023C */  lui        $2, (0x317FFFFF >> 16)
/* 1CA40 0011C940 2428C300 */  and        $5, $6, $3
/* 1CA44 0011C944 FFFF4234 */  ori        $2, $2, (0x317FFFFF & 0xFFFF)
/* 1CA48 0011C948 2A104500 */  slt        $2, $2, $5
/* 1CA4C 0011C94C 1F004014 */  bnez       $2, .L0011C9CC
/* 1CA50 0011C950 0000BFFF */   sd        $31, 0x0($sp)
/* 1CA54 0011C954 24600046 */  .word      0x46006024                    # cvt.w.s    $f0, $f12 # 00000000
/* 1CA58 0011C958 00000244 */  mfc1       $2, $f0
/* 1CA5C 0011C95C 00000000 */  nop
/* 1CA60 0011C960 1B004014 */  bnez       $2, .L0011C9D0
/* 1CA64 0011C964 2C3F023C */   lui       $2, (0x3F2CA13F >> 16)
/* 1CA68 0011C968 01008224 */  addiu      $2, $4, 0x1
/* 1CA6C 0011C96C 2510A200 */  or         $2, $5, $2
/* 1CA70 0011C970 0B004014 */  bnez       $2, .L0011C9A0
/* 1CA74 0011C974 01000224 */   addiu     $2, $0, 0x1
/* 1CA78 0011C978 E675040C */  jal        fabsf
/* 1CA7C 0011C97C 00000000 */   nop
/* 1CA80 0011C980 803F013C */  lui        $at, (0x3F800000 >> 16)
/* 1CA84 0011C984 00088144 */  mtc1       $at, $f1
/* 1CA88 0011C988 00000000 */  nop
/* 1CA8C 0011C98C 00000000 */  nop
/* 1CA90 0011C990 03080046 */  div.s      $f0, $f1, $f0
/* 1CA94 0011C994 87000010 */  b          .L0011CBB4
/* 1CA98 0011C998 0000BFDF */   ld        $31, 0x0($sp)
/* 1CA9C 0011C99C 00000000 */  nop
.L0011C9A0:
/* 1CAA0 0011C9A0 08008210 */  beq        $4, $2, .L0011C9C4
/* 1CAA4 0011C9A4 0000BFDF */   ld        $31, 0x0($sp)
/* 1CAA8 0011C9A8 80BF013C */  lui        $at, (0xBF800000 >> 16)
/* 1CAAC 0011C9AC 00008144 */  mtc1       $at, $f0
/* 1CAB0 0011C9B0 00000000 */  nop
/* 1CAB4 0011C9B4 00000000 */  nop
/* 1CAB8 0011C9B8 03000C46 */  div.s      $f0, $f0, $f12
/* 1CABC 0011C9BC 7D000010 */  b          .L0011CBB4
/* 1CAC0 0011C9C0 00000000 */   nop
.L0011C9C4:
/* 1CAC4 0011C9C4 7A000010 */  b          .L0011CBB0
/* 1CAC8 0011C9C8 06600046 */   mov.s     $f0, $f12
.L0011C9CC:
/* 1CACC 0011C9CC 2C3F023C */  lui        $2, (0x3F2CA13F >> 16)
.L0011C9D0:
/* 1CAD0 0011C9D0 3FA14234 */  ori        $2, $2, (0x3F2CA13F & 0xFFFF)
/* 1CAD4 0011C9D4 2A104500 */  slt        $2, $2, $5
/* 1CAD8 0011C9D8 10004050 */  beql       $2, $0, .L0011CA1C
/* 1CADC 0011C9DC 82630C46 */   mul.s     $f14, $f12, $f12
/* 1CAE0 0011C9E0 0300C104 */  bgez       $6, .L0011C9F0
/* 1CAE4 0011C9E4 00000000 */   nop
/* 1CAE8 0011C9E8 07630046 */  neg.s      $f12, $f12
/* 1CAEC 0011C9EC 476B0046 */  neg.s      $f13, $f13
.L0011C9F0:
/* 1CAF0 0011C9F0 493F013C */  lui        $at, (0x3F490FDA >> 16)
/* 1CAF4 0011C9F4 DA0F2134 */  ori        $at, $at, (0x3F490FDA & 0xFFFF)
/* 1CAF8 0011C9F8 00008144 */  mtc1       $at, $f0
/* 1CAFC 0011C9FC 2233013C */  lui        $at, (0x33222168 >> 16)
/* 1CB00 0011CA00 68212134 */  ori        $at, $at, (0x33222168 & 0xFFFF)
/* 1CB04 0011CA04 00088144 */  mtc1       $at, $f1
/* 1CB08 0011CA08 81030C46 */  sub.s      $f14, $f0, $f12
/* 1CB0C 0011CA0C C10A0D46 */  sub.s      $f11, $f1, $f13
/* 1CB10 0011CA10 00688044 */  mtc1       $0, $f13
/* 1CB14 0011CA14 00730B46 */  add.s      $f12, $f14, $f11
/* 1CB18 0011CA18 82630C46 */  mul.s      $f14, $f12, $f12
.L0011CA1C:
/* 1CB1C 0011CA1C 2A00033C */  lui        $3, %hi(T)
/* 1CB20 0011CA20 38896224 */  addiu      $2, $3, %lo(T)
/* 1CB24 0011CA24 388969C4 */  lwc1       $f9, -0x76C8($3)
/* 1CB28 0011CA28 300044C4 */  lwc1       $f4, 0x30($2)
/* 1CB2C 0011CA2C 2C3F033C */  lui        $3, (0x3F2CA13F >> 16)
/* 1CB30 0011CA30 C2720E46 */  mul.s      $f11, $f14, $f14
/* 1CB34 0011CA34 2C0045C4 */  lwc1       $f5, 0x2C($2)
/* 1CB38 0011CA38 280046C4 */  lwc1       $f6, 0x28($2)
/* 1CB3C 0011CA3C C2730C46 */  mul.s      $f15, $f14, $f12
/* 1CB40 0011CA40 240042C4 */  lwc1       $f2, 0x24($2)
/* 1CB44 0011CA44 3FA16334 */  ori        $3, $3, (0x3F2CA13F & 0xFFFF)
/* 1CB48 0011CA48 02590446 */  mul.s      $f4, $f11, $f4
/* 1CB4C 0011CA4C 200043C4 */  lwc1       $f3, 0x20($2)
/* 1CB50 0011CA50 42590546 */  mul.s      $f5, $f11, $f5
/* 1CB54 0011CA54 1C0040C4 */  lwc1       $f0, 0x1C($2)
/* 1CB58 0011CA58 180047C4 */  lwc1       $f7, 0x18($2)
/* 1CB5C 0011CA5C 424A0F46 */  mul.s      $f9, $f9, $f15
/* 1CB60 0011CA60 80310446 */  add.s      $f6, $f6, $f4
/* 1CB64 0011CA64 140041C4 */  lwc1       $f1, 0x14($2)
/* 1CB68 0011CA68 80100546 */  add.s      $f2, $f2, $f5
/* 1CB6C 0011CA6C 100044C4 */  lwc1       $f4, 0x10($2)
/* 1CB70 0011CA70 0C0045C4 */  lwc1       $f5, 0xC($2)
/* 1CB74 0011CA74 2A186500 */  slt        $3, $3, $5
/* 1CB78 0011CA78 82590646 */  mul.s      $f6, $f11, $f6
/* 1CB7C 0011CA7C 080048C4 */  lwc1       $f8, 0x8($2)
/* 1CB80 0011CA80 82580246 */  mul.s      $f2, $f11, $f2
/* 1CB84 0011CA84 04004AC4 */  lwc1       $f10, 0x4($2)
/* 1CB88 0011CA88 C0180646 */  add.s      $f3, $f3, $f6
/* 1CB8C 0011CA8C 00000246 */  add.s      $f0, $f0, $f2
/* 1CB90 0011CA90 C2580346 */  mul.s      $f3, $f11, $f3
/* 1CB94 0011CA94 02580046 */  mul.s      $f0, $f11, $f0
/* 1CB98 0011CA98 C0390346 */  add.s      $f7, $f7, $f3
/* 1CB9C 0011CA9C 40080046 */  add.s      $f1, $f1, $f0
/* 1CBA0 0011CAA0 C2590746 */  mul.s      $f7, $f11, $f7
/* 1CBA4 0011CAA4 42580146 */  mul.s      $f1, $f11, $f1
/* 1CBA8 0011CAA8 00210746 */  add.s      $f4, $f4, $f7
/* 1CBAC 0011CAAC 40290146 */  add.s      $f5, $f5, $f1
/* 1CBB0 0011CAB0 02590446 */  mul.s      $f4, $f11, $f4
/* 1CBB4 0011CAB4 42590546 */  mul.s      $f5, $f11, $f5
/* 1CBB8 0011CAB8 00420446 */  add.s      $f8, $f8, $f4
/* 1CBBC 0011CABC C0500546 */  add.s      $f3, $f10, $f5
/* 1CBC0 0011CAC0 02710846 */  mul.s      $f4, $f14, $f8
/* 1CBC4 0011CAC4 00180446 */  add.s      $f0, $f3, $f4
/* 1CBC8 0011CAC8 02780046 */  mul.s      $f0, $f15, $f0
/* 1CBCC 0011CACC 00000D46 */  add.s      $f0, $f0, $f13
/* 1CBD0 0011CAD0 02700046 */  mul.s      $f0, $f14, $f0
/* 1CBD4 0011CAD4 C0680046 */  add.s      $f3, $f13, $f0
/* 1CBD8 0011CAD8 C0180946 */  add.s      $f3, $f3, $f9
/* 1CBDC 0011CADC 14006010 */  beqz       $3, .L0011CB30
/* 1CBE0 0011CAE0 C0620346 */   add.s     $f11, $f12, $f3
/* 1CBE4 0011CAE4 00208444 */  mtc1       $4, $f4
/* 1CBE8 0011CAE8 20218046 */  cvt.s.w    $f4, $f4
/* 1CBEC 0011CAEC 831F0600 */  sra        $3, $6, 30
/* 1CBF0 0011CAF0 02580B46 */  mul.s      $f0, $f11, $f11
/* 1CBF4 0011CAF4 02006330 */  andi       $3, $3, 0x2
/* 1CBF8 0011CAF8 01000224 */  addiu      $2, $0, 0x1
/* 1CBFC 0011CAFC 40580446 */  add.s      $f1, $f11, $f4
/* 1CC00 0011CB00 23104300 */  subu       $2, $2, $3
/* 1CC04 0011CB04 00108244 */  mtc1       $2, $f2
/* 1CC08 0011CB08 A0108046 */  cvt.s.w    $f2, $f2
/* 1CC0C 0011CB0C 00000000 */  nop
/* 1CC10 0011CB10 00000000 */  nop
/* 1CC14 0011CB14 03000146 */  div.s      $f0, $f0, $f1
/* 1CC18 0011CB18 01000346 */  sub.s      $f0, $f0, $f3
/* 1CC1C 0011CB1C 01600046 */  sub.s      $f0, $f12, $f0
/* 1CC20 0011CB20 00000046 */  add.s      $f0, $f0, $f0
/* 1CC24 0011CB24 01200046 */  sub.s      $f0, $f4, $f0
/* 1CC28 0011CB28 21000010 */  b          .L0011CBB0
/* 1CC2C 0011CB2C 02100046 */   mul.s     $f0, $f2, $f0
.L0011CB30:
/* 1CC30 0011CB30 01000224 */  addiu      $2, $0, 0x1
/* 1CC34 0011CB34 1E008210 */  beq        $4, $2, .L0011CBB0
/* 1CC38 0011CB38 06580046 */   mov.s     $f0, $f11
/* 1CC3C 0011CB3C 00580244 */  mfc1       $2, $f11
/* 1CC40 0011CB40 2D184000 */  daddu      $3, $2, $0
/* 1CC44 0011CB44 FFFF023C */  lui        $2, (0xFFFFF000 >> 16)
/* 1CC48 0011CB48 00F04234 */  ori        $2, $2, (0xFFFFF000 & 0xFFFF)
/* 1CC4C 0011CB4C 24186200 */  and        $3, $3, $2
/* 1CC50 0011CB50 00708344 */  mtc1       $3, $f14
/* 1CC54 0011CB54 41700C46 */  sub.s      $f1, $f14, $f12
/* 1CC58 0011CB58 80BF013C */  lui        $at, (0xBF800000 >> 16)
/* 1CC5C 0011CB5C 00008144 */  mtc1       $at, $f0
/* 1CC60 0011CB60 00000000 */  nop
/* 1CC64 0011CB64 00000000 */  nop
/* 1CC68 0011CB68 03000B46 */  div.s      $f0, $f0, $f11
/* 1CC6C 0011CB6C 01190146 */  sub.s      $f4, $f3, $f1
/* 1CC70 0011CB70 00000444 */  mfc1       $4, $f0
/* 1CC74 0011CB74 2D188000 */  daddu      $3, $4, $0
/* 1CC78 0011CB78 24186200 */  and        $3, $3, $2
/* 1CC7C 0011CB7C 00008344 */  mtc1       $3, $f0
/* 1CC80 0011CB80 42000E46 */  mul.s      $f1, $f0, $f14
/* 1CC84 0011CB84 803F013C */  lui        $at, (0x3F800000 >> 16)
/* 1CC88 0011CB88 00008144 */  mtc1       $at, $f0
/* 1CC8C 0011CB8C C00B0046 */  add.s      $f15, $f1, $f0
/* 1CC90 0011CB90 00088344 */  mtc1       $3, $f1
/* 1CC94 0011CB94 02080446 */  mul.s      $f0, $f1, $f4
/* 1CC98 0011CB98 00088444 */  mtc1       $4, $f1
/* 1CC9C 0011CB9C 00780046 */  add.s      $f0, $f15, $f0
/* 1CCA0 0011CBA0 02080046 */  mul.s      $f0, $f1, $f0
/* 1CCA4 0011CBA4 00088344 */  mtc1       $3, $f1
/* 1CCA8 0011CBA8 00080046 */  add.s      $f0, $f1, $f0
/* 1CCAC 0011CBAC 00000000 */  nop
.L0011CBB0:
/* 1CCB0 0011CBB0 0000BFDF */  ld         $31, 0x0($sp)
.L0011CBB4:
/* 1CCB4 0011CBB4 0800E003 */  jr         $31
/* 1CCB8 0011CBB8 1000BD27 */   addiu     $sp, $sp, 0x10
/* 1CCBC 0011CBBC 00000000 */  nop
