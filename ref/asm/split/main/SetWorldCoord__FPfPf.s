.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetWorldCoord__FPfPf
/* 08B460 0018B360 E0FFBD27 */  addiu       $29, $29, -0x20
/* 08B464 0018B364 1000BF7F */  sq          $31, 0x10($29)
/* 08B468 0018B368 0000B07F */  sq          $16, 0x0($29)
/* 08B46C 0018B36C 281E8070 */  paddub      $3, $4, $0
/* 08B470 0018B370 2886A070 */  paddub      $16, $5, $0
/* 08B474 0018B374 D401023C */  lui         $2, %hi(world_pos)
/* 08B478 0018B378 E0EE4424 */  addiu       $4, $2, %lo(world_pos)
/* 08B47C 0018B37C 282E6070 */  paddub      $5, $3, $0
/* 08B480 0018B380 0C86040C */  jal         sceVu0CopyVector
/* 08B484 0018B384 00000000 */   nop
/* 08B488 0018B388 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 08B48C 0018B38C D401013C */  lui         $1, %hi(world_pos + 0xC)
/* 08B490 0018B390 ECEE22AC */  sw          $2, %lo(world_pos + 0xC)($1)
/* 08B494 0018B394 D401023C */  lui         $2, %hi(world_rot)
/* 08B498 0018B398 F0EE4424 */  addiu       $4, $2, %lo(world_rot)
/* 08B49C 0018B39C 282E0072 */  paddub      $5, $16, $0
/* 08B4A0 0018B3A0 0C86040C */  jal         sceVu0CopyVector
/* 08B4A4 0018B3A4 00000000 */   nop
/* 08B4A8 0018B3A8 D401013C */  lui         $1, %hi(world_rot + 0xC)
/* 08B4AC 0018B3AC FCEE20AC */  sw          $0, %lo(world_rot + 0xC)($1)
/* 08B4B0 0018B3B0 D401023C */  lui         $2, %hi(world_local)
/* 08B4B4 0018B3B4 00EF4424 */  addiu       $4, $2, %lo(world_local)
/* 08B4B8 0018B3B8 2A86040C */  jal         sceVu0UnitMatrix
/* 08B4BC 0018B3BC 00000000 */   nop
/* 08B4C0 0018B3C0 D401023C */  lui         $2, %hi(world_local)
/* 08B4C4 0018B3C4 00EF4424 */  addiu       $4, $2, %lo(world_local)
/* 08B4C8 0018B3C8 D401023C */  lui         $2, %hi(world_local)
/* 08B4CC 0018B3CC 00EF4524 */  addiu       $5, $2, %lo(world_local)
/* 08B4D0 0018B3D0 D401013C */  lui         $1, %hi(world_rot + 0x4)
/* 08B4D4 0018B3D4 F4EE2CC4 */  lwc1        $f12, %lo(world_rot + 0x4)($1)
/* 08B4D8 0018B3D8 A686040C */  jal         sceVu0RotMatrixY
/* 08B4DC 0018B3DC 00000000 */   nop
/* 08B4E0 0018B3E0 D401023C */  lui         $2, %hi(world_local + 0x30)
/* 08B4E4 0018B3E4 30EF4424 */  addiu       $4, $2, %lo(world_local + 0x30)
/* 08B4E8 0018B3E8 D401023C */  lui         $2, %hi(world_pos)
/* 08B4EC 0018B3EC E0EE4524 */  addiu       $5, $2, %lo(world_pos)
/* 08B4F0 0018B3F0 0C86040C */  jal         sceVu0CopyVector
/* 08B4F4 0018B3F4 00000000 */   nop
/* 08B4F8 0018B3F8 D401023C */  lui         $2, %hi(local_world)
/* 08B4FC 0018B3FC 40EF4424 */  addiu       $4, $2, %lo(local_world)
/* 08B500 0018B400 D401023C */  lui         $2, %hi(world_local)
/* 08B504 0018B404 00EF4524 */  addiu       $5, $2, %lo(world_local)
/* 08B508 0018B408 B285040C */  jal         sceVu0InversMatrix
/* 08B50C 0018B40C 00000000 */   nop
/* 08B510 0018B410 01000324 */  addiu       $3, $0, 0x1
/* 08B514 0018B414 449283AF */  sw          $3, -0x6DBC($28)
/* 08B518 0018B418 1000BF7B */  lq          $31, 0x10($29)
/* 08B51C 0018B41C 0000B07B */  lq          $16, 0x0($29)
/* 08B520 0018B420 2000BD27 */  addiu       $29, $29, 0x20
/* 08B524 0018B424 0800E003 */  jr          $31
/* 08B528 0018B428 00000000 */   nop
/* 08B52C 0018B42C 00000000 */  nop
