.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetNowCharaMotionNo__Fi
/* 10DFF0 0020DEF0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 10DFF4 0020DEF4 2000BF7F */  sq         $31, 0x20($sp)
/* 10DFF8 0020DEF8 1000B17F */  sq         $17, 0x10($sp)
/* 10DFFC 0020DEFC 0000B07F */  sq         $16, 0x0($sp)
/* 10E000 0020DF00 288E8070 */  paddub     $17, $4, $0
/* 10E004 0020DF04 B037080C */  jal        GetNowActiveCharaStatus__Fi
/* 10E008 0020DF08 00000000 */   nop
/* 10E00C 0020DF0C 28864070 */  paddub     $16, $2, $0
/* 10E010 0020DF10 D494828F */  lw         $2, -0x6B2C($gp)
/* 10E014 0020DF14 40181100 */  sll        $3, $17, 1
/* 10E018 0020DF18 21186200 */  addu       $3, $3, $2
/* 10E01C 0020DF1C 06006284 */  lh         $2, 0x6($3)
/* 10E020 0020DF20 00008244 */  mtc1       $2, $f0
/* 10E024 0020DF24 00000000 */  nop
/* 10E028 0020DF28 60008046 */  cvt.s.w    $f1, $f0
/* 10E02C 0020DF2C 12006284 */  lh         $2, 0x12($3)
/* 10E030 0020DF30 00008244 */  mtc1       $2, $f0
/* 10E034 0020DF34 00000000 */  nop
/* 10E038 0020DF38 A0008046 */  cvt.s.w    $f2, $f0
/* 10E03C 0020DF3C D901013C */  lui        $at, (0x1D910E8 >> 16)
/* 10E040 0020DF40 E810258C */  lw         $5, (0x1D910E8 & 0xFFFF)($at)
/* 10E044 0020DF44 2900023C */  lui        $2, %hi(_1136)
/* 10E048 0020DF48 983A4424 */  addiu      $4, $2, %lo(_1136)
/* 10E04C 0020DF4C 3000A327 */  addiu      $3, $sp, 0x30
/* 10E050 0020DF50 000082DC */  ld         $2, 0x0($4)
/* 10E054 0020DF54 080080C4 */  lwc1       $f0, 0x8($4)
/* 10E058 0020DF58 000062FC */  sd         $2, 0x0($3)
/* 10E05C 0020DF5C 080060E4 */  swc1       $f0, 0x8($3)
/* 10E060 0020DF60 281EA070 */  paddub     $3, $5, $0
/* 10E064 0020DF64 908280C7 */  lwc1       $f0, -0x7D70($gp)
/* 10E068 0020DF68 02000146 */  mul.s      $f0, $f0, $f1
/* 10E06C 0020DF6C 34100046 */  c.lt.s     $f2, $f0
/* 10E070 0020DF70 00000000 */  nop
/* 10E074 0020DF74 02000145 */  bc1t       .L0020DF80
/* 10E078 0020DF78 00000000 */   nop
/* 10E07C 0020DF7C 281E0070 */  paddub     $3, $0, $0
.L0020DF80:
/* 10E080 0020DF80 10000232 */  andi       $2, $16, 0x10
/* 10E084 0020DF84 08004014 */  bnez       $2, .L0020DFA8
/* 10E088 0020DF88 00000000 */   nop
/* 10E08C 0020DF8C 02000232 */  andi       $2, $16, 0x2
/* 10E090 0020DF90 05004014 */  bnez       $2, .L0020DFA8
/* 10E094 0020DF94 00000000 */   nop
/* 10E098 0020DF98 34100046 */  c.lt.s     $f2, $f0
/* 10E09C 0020DF9C 00000000 */  nop
/* 10E0A0 0020DFA0 02000045 */  bc1f       .L0020DFAC
/* 10E0A4 0020DFA4 00000000 */   nop
.L0020DFA8:
/* 10E0A8 0020DFA8 01000324 */  addiu      $3, $0, 0x1
.L0020DFAC:
/* 10E0AC 0020DFAC 09006510 */  beq        $3, $5, .L0020DFD4
/* 10E0B0 0020DFB0 00000000 */   nop
/* 10E0B4 0020DFB4 D901013C */  lui        $at, (0x1D910E8 >> 16)
/* 10E0B8 0020DFB8 E81023AC */  sw         $3, (0x1D910E8 & 0xFFFF)($at)
/* 10E0BC 0020DFBC D901013C */  lui        $at, (0x1D910E4 >> 16)
/* 10E0C0 0020DFC0 E41020AC */  sw         $0, (0x1D910E4 & 0xFFFF)($at)
/* 10E0C4 0020DFC4 80BF023C */  lui        $2, (0xBF800000 >> 16)
/* 10E0C8 0020DFC8 D901013C */  lui        $at, (0x1D910E0 >> 16)
/* 10E0CC 0020DFCC E01022AC */  sw         $2, (0x1D910E0 & 0xFFFF)($at)
/* 10E0D0 0020DFD0 282E6070 */  paddub     $5, $3, $0
.L0020DFD4:
/* 10E0D4 0020DFD4 D901023C */  lui        $2, %hi(MenuCharaFrame)
/* 10E0D8 0020DFD8 80044424 */  addiu      $4, $2, %lo(MenuCharaFrame)
/* 10E0DC 0020DFDC 1CE1040C */  jal        GetMotionInfo__10CCharacterFi
/* 10E0E0 0020DFE0 00000000 */   nop
/* 10E0E4 0020DFE4 282E4070 */  paddub     $5, $2, $0
/* 10E0E8 0020DFE8 28260072 */  paddub     $4, $16, $0
/* 10E0EC 0020DFEC A037080C */  jal        GetNowMotionStepCnt__Fi
/* 10E0F0 0020DFF0 00000000 */   nop
/* 10E0F4 0020DFF4 80180200 */  sll        $3, $2, 2
/* 10E0F8 0020DFF8 21187D00 */  addu       $3, $3, $sp
/* 10E0FC 0020DFFC 300060C4 */  lwc1       $f0, 0x30($3)
/* 10E100 0020E000 0800A0E4 */  swc1       $f0, 0x8($5)
/* 10E104 0020E004 2000BF7B */  lq         $31, 0x20($sp)
/* 10E108 0020E008 1000B17B */  lq         $17, 0x10($sp)
/* 10E10C 0020E00C 0000B07B */  lq         $16, 0x0($sp)
/* 10E110 0020E010 4000BD27 */  addiu      $sp, $sp, 0x40
/* 10E114 0020E014 0800E003 */  jr         $31
/* 10E118 0020E018 00000000 */   nop
/* 10E11C 0020E01C 00000000 */  nop
