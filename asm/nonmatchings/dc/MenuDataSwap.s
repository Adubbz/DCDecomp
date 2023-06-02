.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MenuDataSwap__FP16MAP_JUMP_COMPAREP16MAP_JUMP_COMPARE
/* 10A530 0020A430 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 10A534 0020A434 2000BF7F */  sq         $31, 0x20($sp)
/* 10A538 0020A438 1000B17F */  sq         $17, 0x10($sp)
/* 10A53C 0020A43C 0000B07F */  sq         $16, 0x0($sp)
/* 10A540 0020A440 288E8070 */  paddub     $17, $4, $0
/* 10A544 0020A444 2886A070 */  paddub     $16, $5, $0
/* 10A548 0020A448 3000A427 */  addiu      $4, $sp, 0x30
/* 10A54C 0020A44C 282E2072 */  paddub     $5, $17, $0
/* 10A550 0020A450 14000624 */  addiu      $6, $0, 0x14
/* 10A554 0020A454 EC0C040C */  jal        memcpy
/* 10A558 0020A458 00000000 */   nop
/* 10A55C 0020A45C 28262072 */  paddub     $4, $17, $0
/* 10A560 0020A460 282E0072 */  paddub     $5, $16, $0
/* 10A564 0020A464 14000624 */  addiu      $6, $0, 0x14
/* 10A568 0020A468 EC0C040C */  jal        memcpy
/* 10A56C 0020A46C 00000000 */   nop
/* 10A570 0020A470 28260072 */  paddub     $4, $16, $0
/* 10A574 0020A474 3000A527 */  addiu      $5, $sp, 0x30
/* 10A578 0020A478 14000624 */  addiu      $6, $0, 0x14
/* 10A57C 0020A47C EC0C040C */  jal        memcpy
/* 10A580 0020A480 00000000 */   nop
/* 10A584 0020A484 2000BF7B */  lq         $31, 0x20($sp)
/* 10A588 0020A488 1000B17B */  lq         $17, 0x10($sp)
/* 10A58C 0020A48C 0000B07B */  lq         $16, 0x0($sp)
/* 10A590 0020A490 5000BD27 */  addiu      $sp, $sp, 0x50
/* 10A594 0020A494 0800E003 */  jr         $31
/* 10A598 0020A498 00000000 */   nop
/* 10A59C 0020A49C 00000000 */  nop
