.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceCdGetDiskType
/* B6A8 0010B5A8 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* B6AC 0010B5AC 01000424 */  addiu      $4, $0, 0x1
/* B6B0 0010B5B0 2000BFFF */  sd         $31, 0x20($sp)
/* B6B4 0010B5B4 A82B040C */  jal        scmd_prechk
/* B6B8 0010B5B8 1000B0FF */   sd        $16, 0x10($sp)
/* B6BC 0010B5BC 03004014 */  bnez       $2, .L0010B5CC
/* B6C0 0010B5C0 2A00023C */   lui       $2, %hi(D_002A4940)
/* B6C4 0010B5C4 1A000010 */  b          .L0010B630
/* B6C8 0010B5C8 2D100000 */   daddu     $2, $0, $0
.L0010B5CC:
/* B6CC 0010B5CC 2A00043C */  lui        $4, %hi(D_002A4D60)
/* B6D0 0010B5D0 40495024 */  addiu      $16, $2, %lo(D_002A4940)
/* B6D4 0010B5D4 604D8424 */  addiu      $4, $4, %lo(D_002A4D60)
/* B6D8 0010B5D8 0000A0AF */  sw         $0, 0x0($sp)
/* B6DC 0010B5DC 03000524 */  addiu      $5, $0, 0x3
/* B6E0 0010B5E0 2D300000 */  daddu      $6, $0, $0
/* B6E4 0010B5E4 2D380000 */  daddu      $7, $0, $0
/* B6E8 0010B5E8 2D400000 */  daddu      $8, $0, $0
/* B6EC 0010B5EC 2D480002 */  daddu      $9, $16, $0
/* B6F0 0010B5F0 04000A24 */  addiu      $10, $0, 0x4
/* B6F4 0010B5F4 2A5D040C */  jal        sceSifCallRpc
/* B6F8 0010B5F8 2D580000 */   daddu     $11, $0, $0
/* B6FC 0010B5FC 06004104 */  bgez       $2, .L0010B618
/* B700 0010B600 2500023C */   lui       $2, (0x250284 >> 16)
/* B704 0010B604 8402448C */  lw         $4, (0x250284 & 0xFFFF)($2)
/* B708 0010B608 D050040C */  jal        SignalSema
/* B70C 0010B60C 00000000 */   nop
/* B710 0010B610 07000010 */  b          .L0010B630
/* B714 0010B614 2D100000 */   daddu     $2, $0, $0
.L0010B618:
/* B718 0010B618 8402448C */  lw         $4, (0x250284 & 0xFFFF)($2)
/* B71C 0010B61C D050040C */  jal        SignalSema
/* B720 0010B620 00000000 */   nop
/* B724 0010B624 0020033C */  lui        $3, (0x20000000 >> 16)
/* B728 0010B628 25180302 */  or         $3, $16, $3
/* B72C 0010B62C 0000628C */  lw         $2, (0x20000000 & 0xFFFF)($3)
.L0010B630:
/* B730 0010B630 2000BFDF */  ld         $31, 0x20($sp)
/* B734 0010B634 1000B0DF */  ld         $16, 0x10($sp)
/* B738 0010B638 0800E003 */  jr         $31
/* B73C 0010B63C 3000BD27 */   addiu     $sp, $sp, 0x30
