.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WeaponMenuAttachModeKey__Fv
/* FF950 001FF850 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* FF954 001FF854 2000BF7F */  sq         $31, 0x20($sp)
/* FF958 001FF858 1000B17F */  sq         $17, 0x10($sp)
/* FF95C 001FF85C 0000B07F */  sq         $16, 0x0($sp)
/* FF960 001FF860 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF964 001FF864 72EA2484 */  lh         $4, -0x158E($at)
/* FF968 001FF868 08000324 */  addiu      $3, $0, 0x8
/* FF96C 001FF86C 0C008310 */  beq        $4, $3, .L001FF8A0
/* FF970 001FF870 00000000 */   nop
/* FF974 001FF874 0A000324 */  addiu      $3, $0, 0xA
/* FF978 001FF878 09008310 */  beq        $4, $3, .L001FF8A0
/* FF97C 001FF87C 00000000 */   nop
/* FF980 001FF880 09000324 */  addiu      $3, $0, 0x9
/* FF984 001FF884 06008310 */  beq        $4, $3, .L001FF8A0
/* FF988 001FF888 00000000 */   nop
/* FF98C 001FF88C 0B000324 */  addiu      $3, $0, 0xB
/* FF990 001FF890 03008310 */  beq        $4, $3, .L001FF8A0
/* FF994 001FF894 00000000 */   nop
/* FF998 001FF898 43000010 */  b          .L001FF9A8
/* FF99C 001FF89C 00000000 */   nop
.L001FF8A0:
/* FF9A0 001FF8A0 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF9A4 001FF8A4 E8EB3080 */  lb         $16, -0x1418($at)
/* FF9A8 001FF8A8 CC01023C */  lui        $2, %hi(GamePad)
/* FF9AC 001FF8AC 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FF9B0 001FF8B0 0A000524 */  addiu      $5, $0, 0xA
/* FF9B4 001FF8B4 1CAE040C */  jal        Down__8CGamePadFi
/* FF9B8 001FF8B8 00000000 */   nop
/* FF9BC 001FF8BC 0D004010 */  beqz       $2, .L001FF8F4
/* FF9C0 001FF8C0 00000000 */   nop
/* FF9C4 001FF8C4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF9C8 001FF8C8 E8EB2280 */  lb         $2, -0x1418($at)
/* FF9CC 001FF8CC 01004224 */  addiu      $2, $2, 0x1
/* FF9D0 001FF8D0 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF9D4 001FF8D4 E8EB22A0 */  sb         $2, -0x1418($at)
/* FF9D8 001FF8D8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF9DC 001FF8DC E8EB2280 */  lb         $2, -0x1418($at)
/* FF9E0 001FF8E0 03004128 */  slti       $at, $2, 0x3
/* FF9E4 001FF8E4 03002014 */  bnez       $at, .L001FF8F4
/* FF9E8 001FF8E8 00000000 */   nop
/* FF9EC 001FF8EC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FF9F0 001FF8F0 E8EB20A0 */  sb         $0, -0x1418($at)
.L001FF8F4:
/* FF9F4 001FF8F4 CC01023C */  lui        $2, %hi(GamePad)
/* FF9F8 001FF8F8 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FF9FC 001FF8FC 05000524 */  addiu      $5, $0, 0x5
/* FFA00 001FF900 1CAE040C */  jal        Down__8CGamePadFi
/* FFA04 001FF904 00000000 */   nop
/* FFA08 001FF908 0D004010 */  beqz       $2, .L001FF940
/* FFA0C 001FF90C 00000000 */   nop
/* FFA10 001FF910 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFA14 001FF914 E8EB2380 */  lb         $3, -0x1418($at)
/* FFA18 001FF918 FFFF6324 */  addiu      $3, $3, -0x1
/* FFA1C 001FF91C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFA20 001FF920 E8EB23A0 */  sb         $3, -0x1418($at)
/* FFA24 001FF924 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFA28 001FF928 E8EB2380 */  lb         $3, -0x1418($at)
/* FFA2C 001FF92C 04006104 */  bgez       $3, .L001FF940
/* FFA30 001FF930 00000000 */   nop
/* FFA34 001FF934 02000324 */  addiu      $3, $0, 0x2
/* FFA38 001FF938 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFA3C 001FF93C E8EB23A0 */  sb         $3, -0x1418($at)
.L001FF940:
/* FFA40 001FF940 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFA44 001FF944 E8EB2580 */  lb         $5, -0x1418($at)
/* FFA48 001FF948 17000512 */  beq        $16, $5, .L001FF9A8
/* FFA4C 001FF94C 00000000 */   nop
/* FFA50 001FF950 2900023C */  lui        $2, %hi(_3657)
/* FFA54 001FF954 08334424 */  addiu      $4, $2, %lo(_3657)
/* FFA58 001FF958 3000A327 */  addiu      $3, $sp, 0x30
/* FFA5C 001FF95C 000082DC */  ld         $2, 0x0($4)
/* FFA60 001FF960 080080C4 */  lwc1       $f0, 0x8($4)
/* FFA64 001FF964 000062FC */  sd         $2, 0x0($3)
/* FFA68 001FF968 080060E4 */  swc1       $f0, 0x8($3)
/* FFA6C 001FF96C 80100500 */  sll        $2, $5, 2
/* FFA70 001FF970 21105D00 */  addu       $2, $2, $sp
/* FFA74 001FF974 30004424 */  addiu      $4, $2, 0x30
/* FFA78 001FF978 0000838C */  lw         $3, 0x0($4)
/* FFA7C 001FF97C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFA80 001FF980 E9EB2280 */  lb         $2, -0x1417($at)
/* FFA84 001FF984 2A086200 */  slt        $at, $3, $2
/* FFA88 001FF988 04002010 */  beqz       $at, .L001FF99C
/* FFA8C 001FF98C 00000000 */   nop
/* FFA90 001FF990 00008280 */  lb         $2, 0x0($4)
/* FFA94 001FF994 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFA98 001FF998 E9EB22A0 */  sb         $2, -0x1417($at)
.L001FF99C:
/* FFA9C 001FF99C 28260070 */  paddub     $4, $0, $0
/* FFAA0 001FF9A0 BCB3080C */  jal        ComMenuSePlay__Fi
/* FFAA4 001FF9A4 00000000 */   nop
.L001FF9A8:
/* FFAA8 001FF9A8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFAAC 001FF9AC E9EB3180 */  lb         $17, -0x1417($at)
/* FFAB0 001FF9B0 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFAB4 001FF9B4 72EA3084 */  lh         $16, -0x158E($at)
/* FFAB8 001FF9B8 A89580AF */  sw         $0, -0x6A58($gp)
/* FFABC 001FF9BC 0A000324 */  addiu      $3, $0, 0xA
/* FFAC0 001FF9C0 18000312 */  beq        $16, $3, .L001FFA24
/* FFAC4 001FF9C4 00000000 */   nop
/* FFAC8 001FF9C8 09000324 */  addiu      $3, $0, 0x9
/* FFACC 001FF9CC 11000312 */  beq        $16, $3, .L001FFA14
/* FFAD0 001FF9D0 00000000 */   nop
/* FFAD4 001FF9D4 0B000324 */  addiu      $3, $0, 0xB
/* FFAD8 001FF9D8 0A000312 */  beq        $16, $3, .L001FFA04
/* FFADC 001FF9DC 00000000 */   nop
/* FFAE0 001FF9E0 08000324 */  addiu      $3, $0, 0x8
/* FFAE4 001FF9E4 03000312 */  beq        $16, $3, .L001FF9F4
/* FFAE8 001FF9E8 00000000 */   nop
/* FFAEC 001FF9EC 0F000010 */  b          .L001FFA2C
/* FFAF0 001FF9F0 00000000 */   nop
.L001FF9F4:
/* FFAF4 001FF9F4 A4FE070C */  jal        WeaponMenuActWepKey__Fv
/* FFAF8 001FF9F8 00000000 */   nop
/* FFAFC 001FF9FC 0B000010 */  b          .L001FFA2C
/* FFB00 001FFA00 00000000 */   nop
.L001FFA04:
/* FFB04 001FFA04 D8FE070C */  jal        WeaponMenuTagKey__Fv
/* FFB08 001FFA08 00000000 */   nop
/* FFB0C 001FFA0C 07000010 */  b          .L001FFA2C
/* FFB10 001FFA10 00000000 */   nop
.L001FFA14:
/* FFB14 001FFA14 4800080C */  jal        WeaponMenuAttachWepKey__Fv
/* FFB18 001FFA18 00000000 */   nop
/* FFB1C 001FFA1C 03000010 */  b          .L001FFA2C
/* FFB20 001FFA20 00000000 */   nop
.L001FFA24:
/* FFB24 001FFA24 5001080C */  jal        WeaponMenuAttachKey__Fv
/* FFB28 001FFA28 00000000 */   nop
.L001FFA2C:
/* FFB2C 001FFA2C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFB30 001FFA30 E9EB2380 */  lb         $3, -0x1417($at)
/* FFB34 001FFA34 05002316 */  bne        $17, $3, .L001FFA4C
/* FFB38 001FFA38 00000000 */   nop
/* FFB3C 001FFA3C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFB40 001FFA40 72EA2384 */  lh         $3, -0x158E($at)
/* FFB44 001FFA44 0B000312 */  beq        $16, $3, .L001FFA74
/* FFB48 001FFA48 00000000 */   nop
.L001FFA4C:
/* FFB4C 001FFA4C CC01023C */  lui        $2, %hi(GamePad)
/* FFB50 001FFA50 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FFB54 001FFA54 20000524 */  addiu      $5, $0, 0x20
/* FFB58 001FFA58 1CAE040C */  jal        Down__8CGamePadFi
/* FFB5C 001FFA5C 00000000 */   nop
/* FFB60 001FFA60 04004014 */  bnez       $2, .L001FFA74
/* FFB64 001FFA64 00000000 */   nop
/* FFB68 001FFA68 28260070 */  paddub     $4, $0, $0
/* FFB6C 001FFA6C BCB3080C */  jal        ComMenuSePlay__Fi
/* FFB70 001FFA70 00000000 */   nop
.L001FFA74:
/* FFB74 001FFA74 2000BF7B */  lq         $31, 0x20($sp)
/* FFB78 001FFA78 1000B17B */  lq         $17, 0x10($sp)
/* FFB7C 001FFA7C 0000B07B */  lq         $16, 0x0($sp)
/* FFB80 001FFA80 4000BD27 */  addiu      $sp, $sp, 0x40
/* FFB84 001FFA84 0800E003 */  jr         $31
/* FFB88 001FFA88 00000000 */   nop
/* FFB8C 001FFA8C 00000000 */  nop
