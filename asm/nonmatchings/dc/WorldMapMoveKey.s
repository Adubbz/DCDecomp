.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WorldMapMoveKey__Fv
/* 10A960 0020A860 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 10A964 0020A864 1000BF7F */  sq         $31, 0x10($sp)
/* 10A968 0020A868 0000B07F */  sq         $16, 0x0($sp)
/* 10A96C 0020A86C D901013C */  lui        $at, (0x1D90460 >> 16)
/* 10A970 0020A870 60042CC4 */  lwc1       $f12, (0x1D90460 & 0xFFFF)($at)
/* 10A974 0020A874 2C44040C */  jal        fptosi
/* 10A978 0020A878 00000000 */   nop
/* 10A97C 0020A87C 2800A2AF */  sw         $2, 0x28($sp)
/* 10A980 0020A880 D901013C */  lui        $at, (0x1D90464 >> 16)
/* 10A984 0020A884 64042CC4 */  lwc1       $f12, (0x1D90464 & 0xFFFF)($at)
/* 10A988 0020A888 2C44040C */  jal        fptosi
/* 10A98C 0020A88C 00000000 */   nop
/* 10A990 0020A890 2C00A2AF */  sw         $2, 0x2C($sp)
/* 10A994 0020A894 28860070 */  paddub     $16, $0, $0
/* 10A998 0020A898 CC01023C */  lui        $2, %hi(GamePad)
/* 10A99C 0020A89C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 10A9A0 0020A8A0 00100524 */  addiu      $5, $0, 0x1000
/* 10A9A4 0020A8A4 1CAE040C */  jal        Down__8CGamePadFi
/* 10A9A8 0020A8A8 00000000 */   nop
/* 10A9AC 0020A8AC 02004010 */  beqz       $2, .L0020A8B8
/* 10A9B0 0020A8B0 00000000 */   nop
/* 10A9B4 0020A8B4 01001036 */  ori        $16, $16, 0x1
.L0020A8B8:
/* 10A9B8 0020A8B8 CC01023C */  lui        $2, %hi(GamePad)
/* 10A9BC 0020A8BC 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 10A9C0 0020A8C0 00400524 */  addiu      $5, $0, 0x4000
/* 10A9C4 0020A8C4 1CAE040C */  jal        Down__8CGamePadFi
/* 10A9C8 0020A8C8 00000000 */   nop
/* 10A9CC 0020A8CC 02004010 */  beqz       $2, .L0020A8D8
/* 10A9D0 0020A8D0 00000000 */   nop
/* 10A9D4 0020A8D4 02001036 */  ori        $16, $16, 0x2
.L0020A8D8:
/* 10A9D8 0020A8D8 CC01023C */  lui        $2, %hi(GamePad)
/* 10A9DC 0020A8DC 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 10A9E0 0020A8E0 00200524 */  addiu      $5, $0, 0x2000
/* 10A9E4 0020A8E4 1CAE040C */  jal        Down__8CGamePadFi
/* 10A9E8 0020A8E8 00000000 */   nop
/* 10A9EC 0020A8EC 02004010 */  beqz       $2, .L0020A8F8
/* 10A9F0 0020A8F0 00000000 */   nop
/* 10A9F4 0020A8F4 08001036 */  ori        $16, $16, 0x8
.L0020A8F8:
/* 10A9F8 0020A8F8 CC01023C */  lui        $2, %hi(GamePad)
/* 10A9FC 0020A8FC 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 10AA00 0020A900 00800534 */  ori        $5, $0, 0x8000
/* 10AA04 0020A904 1CAE040C */  jal        Down__8CGamePadFi
/* 10AA08 0020A908 00000000 */   nop
/* 10AA0C 0020A90C 02004010 */  beqz       $2, .L0020A918
/* 10AA10 0020A910 00000000 */   nop
/* 10AA14 0020A914 04001036 */  ori        $16, $16, 0x4
.L0020A918:
/* 10AA18 0020A918 1D00001A */  blez       $16, .L0020A990
/* 10AA1C 0020A91C 00000000 */   nop
/* 10AA20 0020A920 28260072 */  paddub     $4, $16, $0
/* 10AA24 0020A924 2800A527 */  addiu      $5, $sp, 0x28
/* 10AA28 0020A928 2829080C */  jal        GetNearWorldPos__FiPi
/* 10AA2C 0020A92C 00000000 */   nop
/* 10AA30 0020A930 28864070 */  paddub     $16, $2, $0
/* 10AA34 0020A934 1000012A */  slti       $at, $16, 0x10
/* 10AA38 0020A938 15002010 */  beqz       $at, .L0020A990
/* 10AA3C 0020A93C 00000000 */   nop
/* 10AA40 0020A940 13000006 */  bltz       $16, .L0020A990
/* 10AA44 0020A944 00000000 */   nop
/* 10AA48 0020A948 00191000 */  sll        $3, $16, 4
/* 10AA4C 0020A94C 2900023C */  lui        $2, %hi(TownOrDngPos)
/* 10AA50 0020A950 C0354224 */  addiu      $2, $2, %lo(TownOrDngPos)
/* 10AA54 0020A954 21104300 */  addu       $2, $2, $3
/* 10AA58 0020A958 CC9582AF */  sw         $2, -0x6A34($gp)
/* 10AA5C 0020A95C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 10AA60 0020A960 B4ED30AC */  sw         $16, -0x124C($at)
/* 10AA64 0020A964 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 10AA68 0020A968 B4ED228C */  lw         $2, -0x124C($at)
/* 10AA6C 0020A96C 00190200 */  sll        $3, $2, 4
/* 10AA70 0020A970 2900023C */  lui        $2, %hi(TownOrDngPos)
/* 10AA74 0020A974 C0354224 */  addiu      $2, $2, %lo(TownOrDngPos)
/* 10AA78 0020A978 21284300 */  addu       $5, $2, $3
/* 10AA7C 0020A97C D901013C */  lui        $at, (0x1D9053C >> 16)
/* 10AA80 0020A980 3C05248C */  lw         $4, (0x1D9053C & 0xFFFF)($at)
/* 10AA84 0020A984 C0A1040C */  jal        SearchFrame__6CFrameFPc
/* 10AA88 0020A988 00000000 */   nop
/* 10AA8C 0020A98C D09582AF */  sw         $2, -0x6A30($gp)
.L0020A990:
/* 10AA90 0020A990 01000224 */  addiu      $2, $0, 0x1
/* 10AA94 0020A994 1000BF7B */  lq         $31, 0x10($sp)
/* 10AA98 0020A998 0000B07B */  lq         $16, 0x0($sp)
/* 10AA9C 0020A99C 3000BD27 */  addiu      $sp, $sp, 0x30
/* 10AAA0 0020A9A0 0800E003 */  jr         $31
/* 10AAA4 0020A9A4 00000000 */   nop
/* 10AAA8 0020A9A8 00000000 */  nop
/* 10AAAC 0020A9AC 00000000 */  nop
