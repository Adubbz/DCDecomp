.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Out__8CScFaderFv
/* 0294A0 01DD51A0 0000828C */  lw          $2, 0x0($4)
/* 0294A4 01DD51A4 FDFF4128 */  slti        $1, $2, -0x3
/* 0294A8 01DD51A8 0C002014 */  bnez        $1, .L01DD51DC_2DA9DC
/* 0294AC 01DD51AC 00000000 */   nop
/* 0294B0 01DD51B0 FEFF4224 */  addiu       $2, $2, -0x2
/* 0294B4 01DD51B4 000082AC */  sw          $2, 0x0($4)
/* 0294B8 01DD51B8 0000828C */  lw          $2, 0x0($4)
/* 0294BC 01DD51BC FCFF4128 */  slti        $1, $2, -0x4
/* 0294C0 01DD51C0 03002010 */  beqz        $1, .L01DD51D0_2DA9D0
/* 0294C4 01DD51C4 00000000 */   nop
/* 0294C8 01DD51C8 FCFF0224 */  addiu       $2, $0, -0x4
/* 0294CC 01DD51CC 000082AC */  sw          $2, 0x0($4)
.L01DD51D0_2DA9D0:
/* 0294D0 01DD51D0 28160070 */  paddub      $2, $0, $0
/* 0294D4 01DD51D4 02000010 */  b           .L01DD51E0_2DA9E0
/* 0294D8 01DD51D8 00000000 */   nop
.L01DD51DC_2DA9DC:
/* 0294DC 01DD51DC 01000224 */  addiu       $2, $0, 0x1
.L01DD51E0_2DA9E0:
/* 0294E0 01DD51E0 0800E003 */  jr          $31
/* 0294E4 01DD51E4 00000000 */   nop
/* 0294E8 01DD51E8 00000000 */  nop
/* 0294EC 01DD51EC 00000000 */  nop
