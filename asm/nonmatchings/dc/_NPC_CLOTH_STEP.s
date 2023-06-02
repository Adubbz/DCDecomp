.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _NPC_CLOTH_STEP__FP12RS_STACKDATAi
/* 8F4B0 0018F3B0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 8F4B4 0018F3B4 4000BF7F */  sq         $31, 0x40($sp)
/* 8F4B8 0018F3B8 3000B37F */  sq         $19, 0x30($sp)
/* 8F4BC 0018F3BC 2000B27F */  sq         $18, 0x20($sp)
/* 8F4C0 0018F3C0 1000B17F */  sq         $17, 0x10($sp)
/* 8F4C4 0018F3C4 0000B07F */  sq         $16, 0x0($sp)
/* 8F4C8 0018F3C8 2896A070 */  paddub     $18, $5, $0
/* 8F4CC 0018F3CC 08009324 */  addiu      $19, $4, 0x8
/* 8F4D0 0018F3D0 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8F4D4 0018F3D4 00000000 */   nop
/* 8F4D8 0018F3D8 28264070 */  paddub     $4, $2, $0
/* 8F4DC 0018F3DC 842C060C */  jal        GetChara__Fi
/* 8F4E0 0018F3E0 00000000 */   nop
/* 8F4E4 0018F3E4 28864070 */  paddub     $16, $2, $0
/* 8F4E8 0018F3E8 04000016 */  bnez       $16, .L0018F3FC
/* 8F4EC 0018F3EC 00000000 */   nop
/* 8F4F0 0018F3F0 28160070 */  paddub     $2, $0, $0
/* 8F4F4 0018F3F4 17000010 */  b          .L0018F454
/* 8F4F8 0018F3F8 00000000 */   nop
.L0018F3FC:
/* 8F4FC 0018F3FC 01001124 */  addiu      $17, $0, 0x1
/* 8F500 0018F400 0200412A */  slti       $at, $18, 0x2
/* 8F504 0018F404 05002014 */  bnez       $at, .L0018F41C
/* 8F508 0018F408 00000000 */   nop
/* 8F50C 0018F40C 28266072 */  paddub     $4, $19, $0
/* 8F510 0018F410 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8F514 0018F414 00000000 */   nop
/* 8F518 0018F418 288E4070 */  paddub     $17, $2, $0
.L0018F41C:
/* 8F51C 0018F41C 28960070 */  paddub     $18, $0, $0
/* 8F520 0018F420 08000010 */  b          .L0018F444
/* 8F524 0018F424 00000000 */   nop
.L0018F428:
/* 8F528 0018F428 28260072 */  paddub     $4, $16, $0
/* 8F52C 0018F42C 282E0070 */  paddub     $5, $0, $0
/* 8F530 0018F430 A000198E */  lw         $25, 0xA0($16)
/* 8F534 0018F434 9400398F */  lw         $25, 0x94($25)
/* 8F538 0018F438 09F82003 */  jalr       $25
/* 8F53C 0018F43C 00000000 */   nop
/* 8F540 0018F440 01005226 */  addiu      $18, $18, 0x1
.L0018F444:
/* 8F544 0018F444 2A105102 */  slt        $2, $18, $17
/* 8F548 0018F448 F7FF4014 */  bnez       $2, .L0018F428
/* 8F54C 0018F44C 00000000 */   nop
/* 8F550 0018F450 01000224 */  addiu      $2, $0, 0x1
.L0018F454:
/* 8F554 0018F454 4000BF7B */  lq         $31, 0x40($sp)
/* 8F558 0018F458 3000B37B */  lq         $19, 0x30($sp)
/* 8F55C 0018F45C 2000B27B */  lq         $18, 0x20($sp)
/* 8F560 0018F460 1000B17B */  lq         $17, 0x10($sp)
/* 8F564 0018F464 0000B07B */  lq         $16, 0x0($sp)
/* 8F568 0018F468 5000BD27 */  addiu      $sp, $sp, 0x50
/* 8F56C 0018F46C 0800E003 */  jr         $31
/* 8F570 0018F470 00000000 */   nop
/* 8F574 0018F474 00000000 */  nop
/* 8F578 0018F478 00000000 */  nop
/* 8F57C 0018F47C 00000000 */  nop
