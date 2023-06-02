.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AllOn__8CGamePadFv
/* 2B530 0012B430 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 2B534 0012B434 2000BF7F */  sq         $31, 0x20($sp)
/* 2B538 0012B438 1000B17F */  sq         $17, 0x10($sp)
/* 2B53C 0012B43C 0000B07F */  sq         $16, 0x0($sp)
/* 2B540 0012B440 28868070 */  paddub     $16, $4, $0
/* 2B544 0012B444 5000838C */  lw         $3, 0x50($4)
/* 2B548 0012B448 0400828C */  lw         $2, 0x4($4)
/* 2B54C 0012B44C 25886200 */  or         $17, $3, $2
/* 2B550 0012B450 ACAC040C */  jal        GetRX__8CGamePadFv
/* 2B554 0012B454 00000000 */   nop
/* 2B558 0012B458 25882202 */  or         $17, $17, $2
/* 2B55C 0012B45C 28260072 */  paddub     $4, $16, $0
/* 2B560 0012B460 B8AC040C */  jal        GetRY__8CGamePadFv
/* 2B564 0012B464 00000000 */   nop
/* 2B568 0012B468 25882202 */  or         $17, $17, $2
/* 2B56C 0012B46C 28260072 */  paddub     $4, $16, $0
/* 2B570 0012B470 C4AC040C */  jal        GetLX__8CGamePadFv
/* 2B574 0012B474 00000000 */   nop
/* 2B578 0012B478 25885100 */  or         $17, $2, $17
/* 2B57C 0012B47C 28260072 */  paddub     $4, $16, $0
/* 2B580 0012B480 D0AC040C */  jal        GetLY__8CGamePadFv
/* 2B584 0012B484 00000000 */   nop
/* 2B588 0012B488 25885100 */  or         $17, $2, $17
/* 2B58C 0012B48C 28260072 */  paddub     $4, $16, $0
/* 2B590 0012B490 DCAC040C */  jal        GetRX2__8CGamePadFv
/* 2B594 0012B494 00000000 */   nop
/* 2B598 0012B498 25885100 */  or         $17, $2, $17
/* 2B59C 0012B49C 28260072 */  paddub     $4, $16, $0
/* 2B5A0 0012B4A0 E8AC040C */  jal        GetRY2__8CGamePadFv
/* 2B5A4 0012B4A4 00000000 */   nop
/* 2B5A8 0012B4A8 25885100 */  or         $17, $2, $17
/* 2B5AC 0012B4AC 28260072 */  paddub     $4, $16, $0
/* 2B5B0 0012B4B0 F4AC040C */  jal        GetLX2__8CGamePadFv
/* 2B5B4 0012B4B4 00000000 */   nop
/* 2B5B8 0012B4B8 25885100 */  or         $17, $2, $17
/* 2B5BC 0012B4BC 28260072 */  paddub     $4, $16, $0
/* 2B5C0 0012B4C0 00AD040C */  jal        GetLY2__8CGamePadFv
/* 2B5C4 0012B4C4 00000000 */   nop
/* 2B5C8 0012B4C8 25105100 */  or         $2, $2, $17
/* 2B5CC 0012B4CC 2000BF7B */  lq         $31, 0x20($sp)
/* 2B5D0 0012B4D0 1000B17B */  lq         $17, 0x10($sp)
/* 2B5D4 0012B4D4 0000B07B */  lq         $16, 0x0($sp)
/* 2B5D8 0012B4D8 3000BD27 */  addiu      $sp, $sp, 0x30
/* 2B5DC 0012B4DC 0800E003 */  jr         $31
/* 2B5E0 0012B4E0 00000000 */   nop
/* 2B5E4 0012B4E4 00000000 */  nop
/* 2B5E8 0012B4E8 00000000 */  nop
/* 2B5EC 0012B4EC 00000000 */  nop
