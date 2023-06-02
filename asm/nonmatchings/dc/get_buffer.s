.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel get_buffer__Fv
/* 8C3C0 0018C2C0 6092838F */  lw         $3, -0x6DA0($gp)
/* 8C3C4 0018C2C4 01000224 */  addiu      $2, $0, 0x1
/* 8C3C8 0018C2C8 05006214 */  bne        $3, $2, .L0018C2E0
/* 8C3CC 0018C2CC 00000000 */   nop
/* 8C3D0 0018C2D0 D201023C */  lui        $2, %hi(EdEventExBuffer)
/* 8C3D4 0018C2D4 80B34224 */  addiu      $2, $2, %lo(EdEventExBuffer)
/* 8C3D8 0018C2D8 03000010 */  b          .L0018C2E8
/* 8C3DC 0018C2DC 00000000 */   nop
.L0018C2E0:
/* 8C3E0 0018C2E0 D201023C */  lui        $2, %hi(EdEventBuffer)
/* 8C3E4 0018C2E4 70B34224 */  addiu      $2, $2, %lo(EdEventBuffer)
.L0018C2E8:
/* 8C3E8 0018C2E8 0800E003 */  jr         $31
/* 8C3EC 0018C2EC 00000000 */   nop
