.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ExitSaveSelect__Fv
/* 11FE80 0021FD80 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 11FE84 0021FD84 0000BF7F */  sq         $31, 0x0($sp)
/* 11FE88 0021FD88 DA01013C */  lui        $at, (0x1DA23E8 >> 16)
/* 11FE8C 0021FD8C E82320AC */  sw         $0, (0x1DA23E8 & 0xFFFF)($at)
/* 11FE90 0021FD90 DA01013C */  lui        $at, (0x1DA3A80 >> 16)
/* 11FE94 0021FD94 803A20AC */  sw         $0, (0x1DA3A80 & 0xFFFF)($at)
/* 11FE98 0021FD98 01000524 */  addiu      $5, $0, 0x1
/* 11FE9C 0021FD9C DA01013C */  lui        $at, (0x1DA3A7C >> 16)
/* 11FEA0 0021FDA0 7C3A25AC */  sw         $5, (0x1DA3A7C & 0xFFFF)($at)
/* 11FEA4 0021FDA4 FFFF0324 */  addiu      $3, $0, -0x1
/* 11FEA8 0021FDA8 DA01013C */  lui        $at, (0x1DA23A4 >> 16)
/* 11FEAC 0021FDAC A42323AC */  sw         $3, (0x1DA23A4 & 0xFFFF)($at)
/* 11FEB0 0021FDB0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11FEB4 0021FDB4 D08A248C */  lw         $4, -0x7530($at)
/* 11FEB8 0021FDB8 02000324 */  addiu      $3, $0, 0x2
/* 11FEBC 0021FDBC 33008310 */  beq        $4, $3, .L0021FE8C
/* 11FEC0 0021FDC0 00000000 */   nop
/* 11FEC4 0021FDC4 39008510 */  beq        $4, $5, .L0021FEAC
/* 11FEC8 0021FDC8 00000000 */   nop
/* 11FECC 0021FDCC 03008010 */  beqz       $4, .L0021FDDC
/* 11FED0 0021FDD0 00000000 */   nop
/* 11FED4 0021FDD4 35000010 */  b          .L0021FEAC
/* 11FED8 0021FDD8 00000000 */   nop
.L0021FDDC:
/* 11FEDC 0021FDDC CC01023C */  lui        $2, %hi(GamePad)
/* 11FEE0 0021FDE0 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 11FEE4 0021FDE4 3CAE040C */  jal        AutoRepeatOff__8CGamePadFv
/* 11FEE8 0021FDE8 00000000 */   nop
/* 11FEEC 0021FDEC CC01023C */  lui        $2, %hi(GamePad)
/* 11FEF0 0021FDF0 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 11FEF4 0021FDF4 4CAE040C */  jal        MenuModeOff__8CGamePadFv
/* 11FEF8 0021FDF8 00000000 */   nop
/* 11FEFC 0021FDFC CC01023C */  lui        $2, %hi(GamePad)
/* 11FF00 0021FE00 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 11FF04 0021FE04 00500524 */  addiu      $5, $0, 0x5000
/* 11FF08 0021FE08 1E000624 */  addiu      $6, $0, 0x1E
/* 11FF0C 0021FE0C 09000724 */  addiu      $7, $0, 0x9
/* 11FF10 0021FE10 58AD040C */  jal        SetAutoRepeat__8CGamePadFiii
/* 11FF14 0021FE14 00000000 */   nop
/* 11FF18 0021FE18 CC01023C */  lui        $2, %hi(GamePad)
/* 11FF1C 0021FE1C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 11FF20 0021FE20 78000524 */  addiu      $5, $0, 0x78
/* 11FF24 0021FE24 48AE040C */  jal        MenuModeOn__8CGamePadFi
/* 11FF28 0021FE28 00000000 */   nop
/* 11FF2C 0021FE2C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11FF30 0021FE30 E88A238C */  lw         $3, -0x7518($at)
/* 11FF34 0021FE34 1D006010 */  beqz       $3, .L0021FEAC
/* 11FF38 0021FE38 00000000 */   nop
/* 11FF3C 0021FE3C 1C8D848F */  lw         $4, -0x72E4($gp)
/* 11FF40 0021FE40 CC5E050C */  jal        GetConfigData__9CSaveDataFv
/* 11FF44 0021FE44 00000000 */   nop
/* 11FF48 0021FE48 18004010 */  beqz       $2, .L0021FEAC
/* 11FF4C 0021FE4C 00000000 */   nop
/* 11FF50 0021FE50 1400428C */  lw         $2, 0x14($2)
/* 11FF54 0021FE54 07004010 */  beqz       $2, .L0021FE74
/* 11FF58 0021FE58 00000000 */   nop
/* 11FF5C 0021FE5C 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 11FF60 0021FE60 282E0070 */  paddub     $5, $0, $0
/* 11FF64 0021FE64 641A050C */  jal        SetStereoMode__6CSoundFi
/* 11FF68 0021FE68 00000000 */   nop
/* 11FF6C 0021FE6C 0F000010 */  b          .L0021FEAC
/* 11FF70 0021FE70 00000000 */   nop
.L0021FE74:
/* 11FF74 0021FE74 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 11FF78 0021FE78 01000524 */  addiu      $5, $0, 0x1
/* 11FF7C 0021FE7C 641A050C */  jal        SetStereoMode__6CSoundFi
/* 11FF80 0021FE80 00000000 */   nop
/* 11FF84 0021FE84 09000010 */  b          .L0021FEAC
/* 11FF88 0021FE88 00000000 */   nop
.L0021FE8C:
/* 11FF8C 0021FE8C CC01023C */  lui        $2, %hi(GamePad)
/* 11FF90 0021FE90 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 11FF94 0021FE94 3CAE040C */  jal        AutoRepeatOff__8CGamePadFv
/* 11FF98 0021FE98 00000000 */   nop
/* 11FF9C 0021FE9C CC01023C */  lui        $2, %hi(GamePad)
/* 11FFA0 0021FEA0 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 11FFA4 0021FEA4 4CAE040C */  jal        MenuModeOff__8CGamePadFv
/* 11FFA8 0021FEA8 00000000 */   nop
.L0021FEAC:
/* 11FFAC 0021FEAC DA01013C */  lui        $at, (0x1DA3A98 >> 16)
/* 11FFB0 0021FEB0 983A20AC */  sw         $0, (0x1DA3A98 & 0xFFFF)($at)
/* 11FFB4 0021FEB4 0000BF7B */  lq         $31, 0x0($sp)
/* 11FFB8 0021FEB8 1000BD27 */  addiu      $sp, $sp, 0x10
/* 11FFBC 0021FEBC 0800E003 */  jr         $31
/* 11FFC0 0021FEC0 00000000 */   nop
/* 11FFC4 0021FEC4 00000000 */  nop
/* 11FFC8 0021FEC8 00000000 */  nop
/* 11FFCC 0021FECC 00000000 */  nop
