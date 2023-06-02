.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MoveCamera__FP13CCameraFollow
/* 7F3C0 0017F2C0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 7F3C4 0017F2C4 2000BF7F */  sq         $31, 0x20($sp)
/* 7F3C8 0017F2C8 1000B07F */  sq         $16, 0x10($sp)
/* 7F3CC 0017F2CC 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 7F3D0 0017F2D0 28868070 */  paddub     $16, $4, $0
/* 7F3D4 0017F2D4 CC01023C */  lui        $2, %hi(GamePad)
/* 7F3D8 0017F2D8 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 7F3DC 0017F2DC A4AD040C */  jal        GetRXf__8CGamePadFv
/* 7F3E0 0017F2E0 00000000 */   nop
/* 7F3E4 0017F2E4 06050046 */  mov.s      $f20, $f0
/* 7F3E8 0017F2E8 CC01023C */  lui        $2, %hi(GamePad)
/* 7F3EC 0017F2EC 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 7F3F0 0017F2F0 B4AD040C */  jal        GetRYf__8CGamePadFv
/* 7F3F4 0017F2F4 00000000 */   nop
/* 7F3F8 0017F2F8 07030046 */  neg.s      $f12, $f0
/* 7F3FC 0017F2FC 28260072 */  paddub     $4, $16, $0
/* 7F400 0017F300 F492040C */  jal        AddHeight__13CCameraFollowFf
/* 7F404 0017F304 00000000 */   nop
/* 7F408 0017F308 408F828F */  lw         $2, -0x70C0($gp)
/* 7F40C 0017F30C 0E004014 */  bnez       $2, .L0017F348
/* 7F410 0017F310 00000000 */   nop
/* 7F414 0017F314 28260072 */  paddub     $4, $16, $0
/* 7F418 0017F318 F092040C */  jal        GetHeight__13CCameraFollowFv
/* 7F41C 0017F31C 00000000 */   nop
/* 7F420 0017F320 F041023C */  lui        $2, (0x41F00000 >> 16)
/* 7F424 0017F324 00608244 */  mtc1       $2, $f12
/* 7F428 0017F328 00000000 */  nop
/* 7F42C 0017F32C 36000C46 */  c.le.s     $f0, $f12
/* 7F430 0017F330 00000000 */  nop
/* 7F434 0017F334 04000145 */  bc1t       .L0017F348
/* 7F438 0017F338 00000000 */   nop
/* 7F43C 0017F33C 28260072 */  paddub     $4, $16, $0
/* 7F440 0017F340 EC92040C */  jal        SetHeight__13CCameraFollowFf
/* 7F444 0017F344 00000000 */   nop
.L0017F348:
/* 7F448 0017F348 47A00046 */  neg.s      $f1, $f20
/* 7F44C 0017F34C F08180C7 */  lwc1       $f0, -0x7E10($gp)
/* 7F450 0017F350 02030146 */  mul.s      $f12, $f0, $f1
/* 7F454 0017F354 28260072 */  paddub     $4, $16, $0
/* 7F458 0017F358 D492040C */  jal        AddAngle__13CCameraFollowFf
/* 7F45C 0017F35C 00000000 */   nop
/* 7F460 0017F360 00008044 */  mtc1       $0, $f0
/* 7F464 0017F364 00000000 */  nop
/* 7F468 0017F368 32001446 */  c.eq.s     $f0, $f20
/* 7F46C 0017F36C 00000000 */  nop
/* 7F470 0017F370 17000045 */  bc1f       .L0017F3D0
/* 7F474 0017F374 00000000 */   nop
/* 7F478 0017F378 CC01023C */  lui        $2, %hi(GamePad)
/* 7F47C 0017F37C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 7F480 0017F380 08000524 */  addiu      $5, $0, 0x8
/* 7F484 0017F384 04AE040C */  jal        On__8CGamePadFi
/* 7F488 0017F388 00000000 */   nop
/* 7F48C 0017F38C 05004010 */  beqz       $2, .L0017F3A4
/* 7F490 0017F390 00000000 */   nop
/* 7F494 0017F394 28260072 */  paddub     $4, $16, $0
/* 7F498 0017F398 38828CC7 */  lwc1       $f12, -0x7DC8($gp)
/* 7F49C 0017F39C D492040C */  jal        AddAngle__13CCameraFollowFf
/* 7F4A0 0017F3A0 00000000 */   nop
.L0017F3A4:
/* 7F4A4 0017F3A4 CC01023C */  lui        $2, %hi(GamePad)
/* 7F4A8 0017F3A8 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 7F4AC 0017F3AC 04000524 */  addiu      $5, $0, 0x4
/* 7F4B0 0017F3B0 04AE040C */  jal        On__8CGamePadFi
/* 7F4B4 0017F3B4 00000000 */   nop
/* 7F4B8 0017F3B8 05004010 */  beqz       $2, .L0017F3D0
/* 7F4BC 0017F3BC 00000000 */   nop
/* 7F4C0 0017F3C0 28260072 */  paddub     $4, $16, $0
/* 7F4C4 0017F3C4 78818CC7 */  lwc1       $f12, -0x7E88($gp)
/* 7F4C8 0017F3C8 D492040C */  jal        AddAngle__13CCameraFollowFf
/* 7F4CC 0017F3CC 00000000 */   nop
.L0017F3D0:
/* 7F4D0 0017F3D0 2000BF7B */  lq         $31, 0x20($sp)
/* 7F4D4 0017F3D4 1000B07B */  lq         $16, 0x10($sp)
/* 7F4D8 0017F3D8 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 7F4DC 0017F3DC 3000BD27 */  addiu      $sp, $sp, 0x30
/* 7F4E0 0017F3E0 0800E003 */  jr         $31
/* 7F4E4 0017F3E4 00000000 */   nop
/* 7F4E8 0017F3E8 00000000 */  nop
/* 7F4EC 0017F3EC 00000000 */  nop
