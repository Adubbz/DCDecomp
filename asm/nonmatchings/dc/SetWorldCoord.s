.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetWorldCoord__FPfPf
/* 8B460 0018B360 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 8B464 0018B364 1000BF7F */  sq         $31, 0x10($sp)
/* 8B468 0018B368 0000B07F */  sq         $16, 0x0($sp)
/* 8B46C 0018B36C 281E8070 */  paddub     $3, $4, $0
/* 8B470 0018B370 2886A070 */  paddub     $16, $5, $0
/* 8B474 0018B374 D401023C */  lui        $2, %hi(world_pos)
/* 8B478 0018B378 E0EE4424 */  addiu      $4, $2, %lo(world_pos)
/* 8B47C 0018B37C 282E6070 */  paddub     $5, $3, $0
/* 8B480 0018B380 0C86040C */  jal        sceVu0CopyVector
/* 8B484 0018B384 00000000 */   nop
/* 8B488 0018B388 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 8B48C 0018B38C D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8B490 0018B390 ECEE22AC */  sw         $2, -0x1114($at)
/* 8B494 0018B394 D401023C */  lui        $2, %hi(world_rot)
/* 8B498 0018B398 F0EE4424 */  addiu      $4, $2, %lo(world_rot)
/* 8B49C 0018B39C 282E0072 */  paddub     $5, $16, $0
/* 8B4A0 0018B3A0 0C86040C */  jal        sceVu0CopyVector
/* 8B4A4 0018B3A4 00000000 */   nop
/* 8B4A8 0018B3A8 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8B4AC 0018B3AC FCEE20AC */  sw         $0, -0x1104($at)
/* 8B4B0 0018B3B0 D401023C */  lui        $2, %hi(world_local)
/* 8B4B4 0018B3B4 00EF4424 */  addiu      $4, $2, %lo(world_local)
/* 8B4B8 0018B3B8 2A86040C */  jal        sceVu0UnitMatrix
/* 8B4BC 0018B3BC 00000000 */   nop
/* 8B4C0 0018B3C0 D401023C */  lui        $2, %hi(world_local)
/* 8B4C4 0018B3C4 00EF4424 */  addiu      $4, $2, %lo(world_local)
/* 8B4C8 0018B3C8 D401023C */  lui        $2, %hi(world_local)
/* 8B4CC 0018B3CC 00EF4524 */  addiu      $5, $2, %lo(world_local)
/* 8B4D0 0018B3D0 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8B4D4 0018B3D4 F4EE2CC4 */  lwc1       $f12, -0x110C($at)
/* 8B4D8 0018B3D8 A686040C */  jal        sceVu0RotMatrixY
/* 8B4DC 0018B3DC 00000000 */   nop
/* 8B4E0 0018B3E0 D401023C */  lui        $2, %hi(D_1D3EF30)
/* 8B4E4 0018B3E4 30EF4424 */  addiu      $4, $2, %lo(D_1D3EF30)
/* 8B4E8 0018B3E8 D401023C */  lui        $2, %hi(world_pos)
/* 8B4EC 0018B3EC E0EE4524 */  addiu      $5, $2, %lo(world_pos)
/* 8B4F0 0018B3F0 0C86040C */  jal        sceVu0CopyVector
/* 8B4F4 0018B3F4 00000000 */   nop
/* 8B4F8 0018B3F8 D401023C */  lui        $2, %hi(local_world)
/* 8B4FC 0018B3FC 40EF4424 */  addiu      $4, $2, %lo(local_world)
/* 8B500 0018B400 D401023C */  lui        $2, %hi(world_local)
/* 8B504 0018B404 00EF4524 */  addiu      $5, $2, %lo(world_local)
/* 8B508 0018B408 B285040C */  jal        sceVu0InversMatrix
/* 8B50C 0018B40C 00000000 */   nop
/* 8B510 0018B410 01000324 */  addiu      $3, $0, 0x1
/* 8B514 0018B414 449283AF */  sw         $3, -0x6DBC($gp)
/* 8B518 0018B418 1000BF7B */  lq         $31, 0x10($sp)
/* 8B51C 0018B41C 0000B07B */  lq         $16, 0x0($sp)
/* 8B520 0018B420 2000BD27 */  addiu      $sp, $sp, 0x20
/* 8B524 0018B424 0800E003 */  jr         $31
/* 8B528 0018B428 00000000 */   nop
/* 8B52C 0018B42C 00000000 */  nop
