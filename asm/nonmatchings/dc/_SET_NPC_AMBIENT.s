.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_NPC_AMBIENT__FP12RS_STACKDATAi
/* 8F580 0018F480 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 8F584 0018F484 3000BF7F */  sq         $31, 0x30($sp)
/* 8F588 0018F488 2000B27F */  sq         $18, 0x20($sp)
/* 8F58C 0018F48C 1000B17F */  sq         $17, 0x10($sp)
/* 8F590 0018F490 0000B07F */  sq         $16, 0x0($sp)
/* 8F594 0018F494 288EA070 */  paddub     $17, $5, $0
/* 8F598 0018F498 08009224 */  addiu      $18, $4, 0x8
/* 8F59C 0018F49C D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8F5A0 0018F4A0 00000000 */   nop
/* 8F5A4 0018F4A4 28264070 */  paddub     $4, $2, $0
/* 8F5A8 0018F4A8 842C060C */  jal        GetChara__Fi
/* 8F5AC 0018F4AC 00000000 */   nop
/* 8F5B0 0018F4B0 28864070 */  paddub     $16, $2, $0
/* 8F5B4 0018F4B4 04000016 */  bnez       $16, .L0018F4C8
/* 8F5B8 0018F4B8 00000000 */   nop
/* 8F5BC 0018F4BC 28160070 */  paddub     $2, $0, $0
/* 8F5C0 0018F4C0 43000010 */  b          .L0018F5D0
/* 8F5C4 0018F4C4 00000000 */   nop
.L0018F4C8:
/* 8F5C8 0018F4C8 2700023C */  lui        $2, %hi(_1347)
/* 8F5CC 0018F4CC B09B4224 */  addiu      $2, $2, %lo(_1347)
/* 8F5D0 0018F4D0 4000A527 */  addiu      $5, $sp, 0x40
/* 8F5D4 0018F4D4 00004278 */  lq         $2, 0x0($2)
/* 8F5D8 0018F4D8 0000A27C */  sq         $2, 0x0($5)
/* 8F5DC 0018F4DC 01000224 */  addiu      $2, $0, 0x1
/* 8F5E0 0018F4E0 07002216 */  bne        $17, $2, .L0018F500
/* 8F5E4 0018F4E4 00000000 */   nop
/* 8F5E8 0018F4E8 E00C0426 */  addiu      $4, $16, 0xCE0
/* 8F5EC 0018F4EC 0C86040C */  jal        sceVu0CopyVector
/* 8F5F0 0018F4F0 00000000 */   nop
/* 8F5F4 0018F4F4 01000224 */  addiu      $2, $0, 0x1
/* 8F5F8 0018F4F8 35000010 */  b          .L0018F5D0
/* 8F5FC 0018F4FC 00000000 */   nop
.L0018F500:
/* 8F600 0018F500 FEFF2226 */  addiu      $2, $17, -0x2
/* 8F604 0018F504 0200412C */  sltiu      $at, $2, 0x2
/* 8F608 0018F508 0B002010 */  beqz       $at, .L0018F538
/* 8F60C 0018F50C 00000000 */   nop
/* 8F610 0018F510 28264072 */  paddub     $4, $18, $0
/* 8F614 0018F514 08009224 */  addiu      $18, $4, 0x8
/* 8F618 0018F518 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8F61C 0018F51C 00000000 */   nop
/* 8F620 0018F520 00008244 */  mtc1       $2, $f0
/* 8F624 0018F524 00000000 */  nop
/* 8F628 0018F528 20008046 */  cvt.s.w    $f0, $f0
/* 8F62C 0018F52C E00C00E6 */  swc1       $f0, 0xCE0($16)
/* 8F630 0018F530 E40C00E6 */  swc1       $f0, 0xCE4($16)
/* 8F634 0018F534 E80C00E6 */  swc1       $f0, 0xCE8($16)
.L0018F538:
/* 8F638 0018F538 0400222A */  slti       $2, $17, 0x4
/* 8F63C 0018F53C 19004014 */  bnez       $2, .L0018F5A4
/* 8F640 0018F540 00000000 */   nop
/* 8F644 0018F544 28264072 */  paddub     $4, $18, $0
/* 8F648 0018F548 08009224 */  addiu      $18, $4, 0x8
/* 8F64C 0018F54C D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8F650 0018F550 00000000 */   nop
/* 8F654 0018F554 00008244 */  mtc1       $2, $f0
/* 8F658 0018F558 00000000 */  nop
/* 8F65C 0018F55C 20008046 */  cvt.s.w    $f0, $f0
/* 8F660 0018F560 E00C00E6 */  swc1       $f0, 0xCE0($16)
/* 8F664 0018F564 28264072 */  paddub     $4, $18, $0
/* 8F668 0018F568 08009224 */  addiu      $18, $4, 0x8
/* 8F66C 0018F56C D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8F670 0018F570 00000000 */   nop
/* 8F674 0018F574 00008244 */  mtc1       $2, $f0
/* 8F678 0018F578 00000000 */  nop
/* 8F67C 0018F57C 20008046 */  cvt.s.w    $f0, $f0
/* 8F680 0018F580 E40C00E6 */  swc1       $f0, 0xCE4($16)
/* 8F684 0018F584 28264072 */  paddub     $4, $18, $0
/* 8F688 0018F588 08009224 */  addiu      $18, $4, 0x8
/* 8F68C 0018F58C D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8F690 0018F590 00000000 */   nop
/* 8F694 0018F594 00008244 */  mtc1       $2, $f0
/* 8F698 0018F598 00000000 */  nop
/* 8F69C 0018F59C 20008046 */  cvt.s.w    $f0, $f0
/* 8F6A0 0018F5A0 E80C00E6 */  swc1       $f0, 0xCE8($16)
.L0018F5A4:
/* 8F6A4 0018F5A4 0500222A */  slti       $2, $17, 0x5
/* 8F6A8 0018F5A8 08004014 */  bnez       $2, .L0018F5CC
/* 8F6AC 0018F5AC 00000000 */   nop
/* 8F6B0 0018F5B0 28264072 */  paddub     $4, $18, $0
/* 8F6B4 0018F5B4 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8F6B8 0018F5B8 00000000 */   nop
/* 8F6BC 0018F5BC 00008244 */  mtc1       $2, $f0
/* 8F6C0 0018F5C0 00000000 */  nop
/* 8F6C4 0018F5C4 20008046 */  cvt.s.w    $f0, $f0
/* 8F6C8 0018F5C8 EC0C00E6 */  swc1       $f0, 0xCEC($16)
.L0018F5CC:
/* 8F6CC 0018F5CC 01000224 */  addiu      $2, $0, 0x1
.L0018F5D0:
/* 8F6D0 0018F5D0 3000BF7B */  lq         $31, 0x30($sp)
/* 8F6D4 0018F5D4 2000B27B */  lq         $18, 0x20($sp)
/* 8F6D8 0018F5D8 1000B17B */  lq         $17, 0x10($sp)
/* 8F6DC 0018F5DC 0000B07B */  lq         $16, 0x0($sp)
/* 8F6E0 0018F5E0 5000BD27 */  addiu      $sp, $sp, 0x50
/* 8F6E4 0018F5E4 0800E003 */  jr         $31
/* 8F6E8 0018F5E8 00000000 */   nop
/* 8F6EC 0018F5EC 00000000 */  nop
