.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MenuWeaponSpSet__FP10CCharacterP11WEAPON_HAVE
/* 10D030 0020CF30 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 10D034 0020CF34 4000BF7F */  sq         $31, 0x40($sp)
/* 10D038 0020CF38 3000B37F */  sq         $19, 0x30($sp)
/* 10D03C 0020CF3C 2000B27F */  sq         $18, 0x20($sp)
/* 10D040 0020CF40 1000B17F */  sq         $17, 0x10($sp)
/* 10D044 0020CF44 0000B07F */  sq         $16, 0x0($sp)
/* 10D048 0020CF48 288E8070 */  paddub     $17, $4, $0
/* 10D04C 0020CF4C 2886A070 */  paddub     $16, $5, $0
/* 10D050 0020CF50 03002012 */  beqz       $17, .L0020CF60
/* 10D054 0020CF54 00000000 */   nop
/* 10D058 0020CF58 03000016 */  bnez       $16, .L0020CF68
/* 10D05C 0020CF5C 00000000 */   nop
.L0020CF60:
/* 10D060 0020CF60 30000010 */  b          .L0020D024
/* 10D064 0020CF64 00000000 */   nop
.L0020CF68:
/* 10D068 0020CF68 00000486 */  lh         $4, 0x0($16)
/* 10D06C 0020CF6C 10010324 */  addiu      $3, $0, 0x110
/* 10D070 0020CF70 2C008314 */  bne        $4, $3, .L0020D024
/* 10D074 0020CF74 00000000 */   nop
/* 10D078 0020CF78 BC00248E */  lw         $4, 0xBC($17)
/* 10D07C 0020CF7C 2A00023C */  lui        $2, %hi(_914_2)
/* 10D080 0020CF80 98DD4524 */  addiu      $5, $2, %lo(_914_2)
/* 10D084 0020CF84 C0A1040C */  jal        SearchFrame__6CFrameFPc
/* 10D088 0020CF88 00000000 */   nop
/* 10D08C 0020CF8C 28964070 */  paddub     $18, $2, $0
/* 10D090 0020CF90 BC00248E */  lw         $4, 0xBC($17)
/* 10D094 0020CF94 2A00023C */  lui        $2, %hi(_915_2)
/* 10D098 0020CF98 A0DD4524 */  addiu      $5, $2, %lo(_915_2)
/* 10D09C 0020CF9C C0A1040C */  jal        SearchFrame__6CFrameFPc
/* 10D0A0 0020CFA0 00000000 */   nop
/* 10D0A4 0020CFA4 289E4070 */  paddub     $19, $2, $0
/* 10D0A8 0020CFA8 03004012 */  beqz       $18, .L0020CFB8
/* 10D0AC 0020CFAC 00000000 */   nop
/* 10D0B0 0020CFB0 03006016 */  bnez       $19, .L0020CFC0
/* 10D0B4 0020CFB4 00000000 */   nop
.L0020CFB8:
/* 10D0B8 0020CFB8 1A000010 */  b          .L0020D024
/* 10D0BC 0020CFBC 00000000 */   nop
.L0020CFC0:
/* 10D0C0 0020CFC0 10000CC6 */  lwc1       $f12, 0x10($16)
/* 10D0C4 0020CFC4 9044040C */  jal        fptodp
/* 10D0C8 0020CFC8 00000000 */   nop
/* 10D0CC 0020CFCC 288E4070 */  paddub     $17, $2, $0
/* 10D0D0 0020CFD0 0C000486 */  lh         $4, 0xC($16)
/* 10D0D4 0020CFD4 FC40040C */  jal        litodp
/* 10D0D8 0020CFD8 00000000 */   nop
/* 10D0DC 0020CFDC 288084DF */  ld         $4, -0x7FD8($gp)
/* 10D0E0 0020CFE0 282E4070 */  paddub     $5, $2, $0
/* 10D0E4 0020CFE4 9E3F040C */  jal        dpmul
/* 10D0E8 0020CFE8 00000000 */   nop
/* 10D0EC 0020CFEC 28262072 */  paddub     $4, $17, $0
/* 10D0F0 0020CFF0 282E4070 */  paddub     $5, $2, $0
/* 10D0F4 0020CFF4 4C00040C */  jal        _dpfle
/* 10D0F8 0020CFF8 00000000 */   nop
/* 10D0FC 0020CFFC 05004010 */  beqz       $2, .L0020D014
/* 10D100 0020D000 00000000 */   nop
/* 10D104 0020D004 01000324 */  addiu      $3, $0, 0x1
/* 10D108 0020D008 02000424 */  addiu      $4, $0, 0x2
/* 10D10C 0020D00C 03000010 */  b          .L0020D01C
/* 10D110 0020D010 00000000 */   nop
.L0020D014:
/* 10D114 0020D014 02000324 */  addiu      $3, $0, 0x2
/* 10D118 0020D018 01000424 */  addiu      $4, $0, 0x1
.L0020D01C:
/* 10D11C 0020D01C B00044A6 */  sh         $4, 0xB0($18)
/* 10D120 0020D020 B00063A6 */  sh         $3, 0xB0($19)
.L0020D024:
/* 10D124 0020D024 4000BF7B */  lq         $31, 0x40($sp)
/* 10D128 0020D028 3000B37B */  lq         $19, 0x30($sp)
/* 10D12C 0020D02C 2000B27B */  lq         $18, 0x20($sp)
/* 10D130 0020D030 1000B17B */  lq         $17, 0x10($sp)
/* 10D134 0020D034 0000B07B */  lq         $16, 0x0($sp)
/* 10D138 0020D038 5000BD27 */  addiu      $sp, $sp, 0x50
/* 10D13C 0020D03C 0800E003 */  jr         $31
/* 10D140 0020D040 00000000 */   nop
/* 10D144 0020D044 00000000 */  nop
/* 10D148 0020D048 00000000 */  nop
/* 10D14C 0020D04C 00000000 */  nop
