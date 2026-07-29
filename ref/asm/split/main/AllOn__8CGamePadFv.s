.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel AllOn__8CGamePadFv
/* 02B530 0012B430 D0FFBD27 */  addiu       $29, $29, -0x30
/* 02B534 0012B434 2000BF7F */  sq          $31, 0x20($29)
/* 02B538 0012B438 1000B17F */  sq          $17, 0x10($29)
/* 02B53C 0012B43C 0000B07F */  sq          $16, 0x0($29)
/* 02B540 0012B440 28868070 */  paddub      $16, $4, $0
/* 02B544 0012B444 5000838C */  lw          $3, 0x50($4)
/* 02B548 0012B448 0400828C */  lw          $2, 0x4($4)
/* 02B54C 0012B44C 25886200 */  or          $17, $3, $2
/* 02B550 0012B450 ACAC040C */  jal         GetRX__8CGamePadFv
/* 02B554 0012B454 00000000 */   nop
/* 02B558 0012B458 25882202 */  or          $17, $17, $2
/* 02B55C 0012B45C 28260072 */  paddub      $4, $16, $0
/* 02B560 0012B460 B8AC040C */  jal         GetRY__8CGamePadFv
/* 02B564 0012B464 00000000 */   nop
/* 02B568 0012B468 25882202 */  or          $17, $17, $2
/* 02B56C 0012B46C 28260072 */  paddub      $4, $16, $0
/* 02B570 0012B470 C4AC040C */  jal         GetLX__8CGamePadFv
/* 02B574 0012B474 00000000 */   nop
/* 02B578 0012B478 25885100 */  or          $17, $2, $17
/* 02B57C 0012B47C 28260072 */  paddub      $4, $16, $0
/* 02B580 0012B480 D0AC040C */  jal         GetLY__8CGamePadFv
/* 02B584 0012B484 00000000 */   nop
/* 02B588 0012B488 25885100 */  or          $17, $2, $17
/* 02B58C 0012B48C 28260072 */  paddub      $4, $16, $0
/* 02B590 0012B490 DCAC040C */  jal         GetRX2__8CGamePadFv
/* 02B594 0012B494 00000000 */   nop
/* 02B598 0012B498 25885100 */  or          $17, $2, $17
/* 02B59C 0012B49C 28260072 */  paddub      $4, $16, $0
/* 02B5A0 0012B4A0 E8AC040C */  jal         GetRY2__8CGamePadFv
/* 02B5A4 0012B4A4 00000000 */   nop
/* 02B5A8 0012B4A8 25885100 */  or          $17, $2, $17
/* 02B5AC 0012B4AC 28260072 */  paddub      $4, $16, $0
/* 02B5B0 0012B4B0 F4AC040C */  jal         GetLX2__8CGamePadFv
/* 02B5B4 0012B4B4 00000000 */   nop
/* 02B5B8 0012B4B8 25885100 */  or          $17, $2, $17
/* 02B5BC 0012B4BC 28260072 */  paddub      $4, $16, $0
/* 02B5C0 0012B4C0 00AD040C */  jal         GetLY2__8CGamePadFv
/* 02B5C4 0012B4C4 00000000 */   nop
/* 02B5C8 0012B4C8 25105100 */  or          $2, $2, $17
/* 02B5CC 0012B4CC 2000BF7B */  lq          $31, 0x20($29)
/* 02B5D0 0012B4D0 1000B17B */  lq          $17, 0x10($29)
/* 02B5D4 0012B4D4 0000B07B */  lq          $16, 0x0($29)
/* 02B5D8 0012B4D8 3000BD27 */  addiu       $29, $29, 0x30
/* 02B5DC 0012B4DC 0800E003 */  jr          $31
/* 02B5E0 0012B4E0 00000000 */   nop
/* 02B5E4 0012B4E4 00000000 */  nop
/* 02B5E8 0012B4E8 00000000 */  nop
/* 02B5EC 0012B4EC 00000000 */  nop
