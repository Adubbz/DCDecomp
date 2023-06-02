.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CDRead__FPcPUiPi
/* 3F660 0013F560 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 3F664 0013F564 3000BF7F */  sq         $31, 0x30($sp)
/* 3F668 0013F568 2000B27F */  sq         $18, 0x20($sp)
/* 3F66C 0013F56C 1000B17F */  sq         $17, 0x10($sp)
/* 3F670 0013F570 0000B07F */  sq         $16, 0x0($sp)
/* 3F674 0013F574 2896A070 */  paddub     $18, $5, $0
/* 3F678 0013F578 288EC070 */  paddub     $17, $6, $0
/* 3F67C 0013F57C 60FA040C */  jal        SearchFile__FPc
/* 3F680 0013F580 00000000 */   nop
/* 3F684 0013F584 28864070 */  paddub     $16, $2, $0
/* 3F688 0013F588 04000016 */  bnez       $16, .L0013F59C
/* 3F68C 0013F58C 00000000 */   nop
/* 3F690 0013F590 28160070 */  paddub     $2, $0, $0
/* 3F694 0013F594 1B000010 */  b          .L0013F604
/* 3F698 0013F598 00000000 */   nop
.L0013F59C:
/* 3F69C 0013F59C 4C00A0A3 */  sb         $0, 0x4C($sp)
/* 3F6A0 0013F5A0 01000224 */  addiu      $2, $0, 0x1
/* 3F6A4 0013F5A4 4D00A2A3 */  sb         $2, 0x4D($sp)
/* 3F6A8 0013F5A8 4E00A0A3 */  sb         $0, 0x4E($sp)
.L0013F5AC:
/* 3F6AC 0013F5AC 0C00038E */  lw         $3, 0xC($16)
/* 3F6B0 0013F5B0 008D828F */  lw         $2, -0x7300($gp)
/* 3F6B4 0013F5B4 21206200 */  addu       $4, $3, $2
/* 3F6B8 0013F5B8 1000058E */  lw         $5, 0x10($16)
/* 3F6BC 0013F5BC 28364072 */  paddub     $6, $18, $0
/* 3F6C0 0013F5C0 4C00A727 */  addiu      $7, $sp, 0x4C
/* 3F6C4 0013F5C4 3029040C */  jal        sceCdRead
/* 3F6C8 0013F5C8 00000000 */   nop
/* 3F6CC 0013F5CC F7FF4010 */  beqz       $2, .L0013F5AC
/* 3F6D0 0013F5D0 00000000 */   nop
/* 3F6D4 0013F5D4 28260070 */  paddub     $4, $0, $0
/* 3F6D8 0013F5D8 662B040C */  jal        sceCdSync
/* 3F6DC 0013F5DC 00000000 */   nop
/* 3F6E0 0013F5E0 BE2D040C */  jal        sceCdGetError
/* 3F6E4 0013F5E4 00000000 */   nop
/* 3F6E8 0013F5E8 F0FF4014 */  bnez       $2, .L0013F5AC
/* 3F6EC 0013F5EC 00000000 */   nop
/* 3F6F0 0013F5F0 03002012 */  beqz       $17, .L0013F600
/* 3F6F4 0013F5F4 00000000 */   nop
/* 3F6F8 0013F5F8 0800028E */  lw         $2, 0x8($16)
/* 3F6FC 0013F5FC 000022AE */  sw         $2, 0x0($17)
.L0013F600:
/* 3F700 0013F600 01000224 */  addiu      $2, $0, 0x1
.L0013F604:
/* 3F704 0013F604 3000BF7B */  lq         $31, 0x30($sp)
/* 3F708 0013F608 2000B27B */  lq         $18, 0x20($sp)
/* 3F70C 0013F60C 1000B17B */  lq         $17, 0x10($sp)
/* 3F710 0013F610 0000B07B */  lq         $16, 0x0($sp)
/* 3F714 0013F614 5000BD27 */  addiu      $sp, $sp, 0x50
/* 3F718 0013F618 0800E003 */  jr         $31
/* 3F71C 0013F61C 00000000 */   nop
