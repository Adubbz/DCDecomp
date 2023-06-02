.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DngEscapeMsgLoop__Fv
/* 10F460 0020F360 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 10F464 0020F364 1000BF7F */  sq         $31, 0x10($sp)
/* 10F468 0020F368 0000B07F */  sq         $16, 0x0($sp)
/* 10F46C 0020F36C 28860070 */  paddub     $16, $0, $0
/* 10F470 0020F370 30968287 */  lh         $2, -0x69D0($gp)
/* 10F474 0020F374 32004014 */  bnez       $2, .L0020F440
/* 10F478 0020F378 00000000 */   nop
/* 10F47C 0020F37C CC01023C */  lui        $2, %hi(GamePad)
/* 10F480 0020F380 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 10F484 0020F384 00500524 */  addiu      $5, $0, 0x5000
/* 10F488 0020F388 1CAE040C */  jal        Down__8CGamePadFi
/* 10F48C 0020F38C 00000000 */   nop
/* 10F490 0020F390 10004010 */  beqz       $2, .L0020F3D4
/* 10F494 0020F394 00000000 */   nop
/* 10F498 0020F398 F0888487 */  lh         $4, -0x7710($gp)
/* 10F49C 0020F39C 02000324 */  addiu      $3, $0, 0x2
/* 10F4A0 0020F3A0 05008314 */  bne        $4, $3, .L0020F3B8
/* 10F4A4 0020F3A4 00000000 */   nop
/* 10F4A8 0020F3A8 01000224 */  addiu      $2, $0, 0x1
/* 10F4AC 0020F3AC F08882A7 */  sh         $2, -0x7710($gp)
/* 10F4B0 0020F3B0 05000010 */  b          .L0020F3C8
/* 10F4B4 0020F3B4 00000000 */   nop
.L0020F3B8:
/* 10F4B8 0020F3B8 01000224 */  addiu      $2, $0, 0x1
/* 10F4BC 0020F3BC 02008214 */  bne        $4, $2, .L0020F3C8
/* 10F4C0 0020F3C0 00000000 */   nop
/* 10F4C4 0020F3C4 F08883A7 */  sh         $3, -0x7710($gp)
.L0020F3C8:
/* 10F4C8 0020F3C8 28260070 */  paddub     $4, $0, $0
/* 10F4CC 0020F3CC BCB3080C */  jal        ComMenuSePlay__Fi
/* 10F4D0 0020F3D0 00000000 */   nop
.L0020F3D4:
/* 10F4D4 0020F3D4 F0888287 */  lh         $2, -0x7710($gp)
/* 10F4D8 0020F3D8 FFFF4224 */  addiu      $2, $2, -0x1
/* 10F4DC 0020F3DC 1896838F */  lw         $3, -0x69E8($gp)
/* 10F4E0 0020F3E0 401762AC */  sw         $2, 0x1740($3)
/* 10F4E4 0020F3E4 CC01023C */  lui        $2, %hi(GamePad)
/* 10F4E8 0020F3E8 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 10F4EC 0020F3EC 40000524 */  addiu      $5, $0, 0x40
/* 10F4F0 0020F3F0 1CAE040C */  jal        Down__8CGamePadFi
/* 10F4F4 0020F3F4 00000000 */   nop
/* 10F4F8 0020F3F8 05004010 */  beqz       $2, .L0020F410
/* 10F4FC 0020F3FC 00000000 */   nop
/* 10F500 0020F400 01000424 */  addiu      $4, $0, 0x1
/* 10F504 0020F404 309684A7 */  sh         $4, -0x69D0($gp)
/* 10F508 0020F408 BCB3080C */  jal        ComMenuSePlay__Fi
/* 10F50C 0020F40C 00000000 */   nop
.L0020F410:
/* 10F510 0020F410 CC01023C */  lui        $2, %hi(GamePad)
/* 10F514 0020F414 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 10F518 0020F418 20000524 */  addiu      $5, $0, 0x20
/* 10F51C 0020F41C 1CAE040C */  jal        Down__8CGamePadFi
/* 10F520 0020F420 00000000 */   nop
/* 10F524 0020F424 1A004010 */  beqz       $2, .L0020F490
/* 10F528 0020F428 00000000 */   nop
/* 10F52C 0020F42C 02000424 */  addiu      $4, $0, 0x2
/* 10F530 0020F430 BCB3080C */  jal        ComMenuSePlay__Fi
/* 10F534 0020F434 00000000 */   nop
/* 10F538 0020F438 15000010 */  b          .L0020F490
/* 10F53C 0020F43C 00000000 */   nop
.L0020F440:
/* 10F540 0020F440 EC888287 */  lh         $2, -0x7714($gp)
/* 10F544 0020F444 80004228 */  slti       $2, $2, 0x80
/* 10F548 0020F448 11004014 */  bnez       $2, .L0020F490
/* 10F54C 0020F44C 00000000 */   nop
/* 10F550 0020F450 F0889087 */  lh         $16, -0x7710($gp)
/* 10F554 0020F454 CC01023C */  lui        $2, %hi(GamePad)
/* 10F558 0020F458 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 10F55C 0020F45C 3CAE040C */  jal        AutoRepeatOff__8CGamePadFv
/* 10F560 0020F460 00000000 */   nop
/* 10F564 0020F464 CC01023C */  lui        $2, %hi(GamePad)
/* 10F568 0020F468 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 10F56C 0020F46C 4CAE040C */  jal        MenuModeOff__8CGamePadFv
/* 10F570 0020F470 00000000 */   nop
/* 10F574 0020F474 DB01023C */  lui        $2, %hi(ItemVolumeStep)
/* 10F578 0020F478 10BC4424 */  addiu      $4, $2, %lo(ItemVolumeStep)
/* 10F57C 0020F47C C8D5080C */  jal        CheckItemVolume__13CMenuItemStepFv
/* 10F580 0020F480 00000000 */   nop
/* 10F584 0020F484 1896838F */  lw         $3, -0x69E8($gp)
/* 10F588 0020F488 FFFF0224 */  addiu      $2, $0, -0x1
/* 10F58C 0020F48C 401762AC */  sw         $2, 0x1740($3)
.L0020F490:
/* 10F590 0020F490 DB01023C */  lui        $2, %hi(ItemVolumeStep)
/* 10F594 0020F494 10BC4424 */  addiu      $4, $2, %lo(ItemVolumeStep)
/* 10F598 0020F498 3C000524 */  addiu      $5, $0, 0x3C
/* 10F59C 0020F49C B4D5080C */  jal        LoopStep__13CMenuItemStepFi
/* 10F5A0 0020F4A0 00000000 */   nop
/* 10F5A4 0020F4A4 903C080C */  jal        DngEscapeMsgDraw__Fv
/* 10F5A8 0020F4A8 00000000 */   nop
/* 10F5AC 0020F4AC 28160072 */  paddub     $2, $16, $0
/* 10F5B0 0020F4B0 1000BF7B */  lq         $31, 0x10($sp)
/* 10F5B4 0020F4B4 0000B07B */  lq         $16, 0x0($sp)
/* 10F5B8 0020F4B8 2000BD27 */  addiu      $sp, $sp, 0x20
/* 10F5BC 0020F4BC 0800E003 */  jr         $31
/* 10F5C0 0020F4C0 00000000 */   nop
/* 10F5C4 0020F4C4 00000000 */  nop
/* 10F5C8 0020F4C8 00000000 */  nop
/* 10F5CC 0020F4CC 00000000 */  nop
