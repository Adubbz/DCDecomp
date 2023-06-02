.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel mceIntrReadFixAlign
/* 1E558 0011E458 0020023C */  lui        $2, (0x20000004 >> 16)
/* 1E55C 0011E45C 25208200 */  or         $4, $4, $2
/* 1E560 0011E460 0000828C */  lw         $2, (0x20000000 & 0xFFFF)($4)
/* 1E564 0011E464 0F004050 */  beql       $2, $0, .L0011E4A4
/* 1E568 0011E468 0400828C */   lw        $2, (0x20000004 & 0xFFFF)($4)
/* 1E56C 0011E46C 0800868C */  lw         $6, (0x20000008 & 0xFFFF)($4)
/* 1E570 0011E470 0B004018 */  blez       $2, .L0011E4A0
/* 1E574 0011E474 2D280000 */   daddu     $5, $0, $0
/* 1E578 0011E478 10008724 */  addiu      $7, $4, %lo(D_20000010)
/* 1E57C 0011E47C 00000000 */  nop
.L0011E480:
/* 1E580 0011E480 2110E500 */  addu       $2, $7, $5
/* 1E584 0011E484 00004390 */  lbu        $3, 0x0($2)
/* 1E588 0011E488 0100A524 */  addiu      $5, $5, 0x1
/* 1E58C 0011E48C 0000C3A0 */  sb         $3, 0x0($6)
/* 1E590 0011E490 0000828C */  lw         $2, (0x20000000 & 0xFFFF)($4)
/* 1E594 0011E494 2A10A200 */  slt        $2, $5, $2
/* 1E598 0011E498 F9FF4014 */  bnez       $2, .L0011E480
/* 1E59C 0011E49C 0100C624 */   addiu     $6, $6, 0x1
.L0011E4A0:
/* 1E5A0 0011E4A0 0400828C */  lw         $2, (0x20000004 & 0xFFFF)($4)
.L0011E4A4:
/* 1E5A4 0011E4A4 0E004010 */  beqz       $2, .L0011E4E0
/* 1E5A8 0011E4A8 00000000 */   nop
/* 1E5AC 0011E4AC 0C00868C */  lw         $6, (0x2000000C & 0xFFFF)($4)
/* 1E5B0 0011E4B0 0B004018 */  blez       $2, .L0011E4E0
/* 1E5B4 0011E4B4 2D280000 */   daddu     $5, $0, $0
/* 1E5B8 0011E4B8 50008724 */  addiu      $7, $4, %lo(D_20000050)
/* 1E5BC 0011E4BC 00000000 */  nop
.L0011E4C0:
/* 1E5C0 0011E4C0 2110E500 */  addu       $2, $7, $5
/* 1E5C4 0011E4C4 00004390 */  lbu        $3, 0x0($2)
/* 1E5C8 0011E4C8 0100A524 */  addiu      $5, $5, 0x1
/* 1E5CC 0011E4CC 0000C3A0 */  sb         $3, 0x0($6)
/* 1E5D0 0011E4D0 0400828C */  lw         $2, (0x20000004 & 0xFFFF)($4)
/* 1E5D4 0011E4D4 2A10A200 */  slt        $2, $5, $2
/* 1E5D8 0011E4D8 F9FF4014 */  bnez       $2, .L0011E4C0
/* 1E5DC 0011E4DC 0100C624 */   addiu     $6, $6, 0x1
.L0011E4E0:
/* 1E5E0 0011E4E0 0800E003 */  jr         $31
/* 1E5E4 0011E4E4 00000000 */   nop
