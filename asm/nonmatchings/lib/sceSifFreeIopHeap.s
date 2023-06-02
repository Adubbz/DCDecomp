.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceSifFreeIopHeap
/* 18A80 00118980 2500033C */  lui        $3, (0x250A18 >> 16)
/* 18A84 00118984 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 18A88 00118988 180A628C */  lw         $2, (0x250A18 & 0xFFFF)($3)
/* 18A8C 0011898C 2D288000 */  daddu      $5, $4, $0
/* 18A90 00118990 2000BFFF */  sd         $31, 0x20($sp)
/* 18A94 00118994 03004104 */  bgez       $2, .L001189A4
/* 18A98 00118998 1000B0FF */   sd        $16, 0x10($sp)
/* 18A9C 0011899C 12000010 */  b          .L001189E8
/* 18AA0 001189A0 2D100000 */   daddu     $2, $0, $0
.L001189A4:
/* 18AA4 001189A4 2B00073C */  lui        $7, %hi(D_002A8240)
/* 18AA8 001189A8 2B00043C */  lui        $4, %hi(D_002A8180)
/* 18AAC 001189AC 4082E5AC */  sw         $5, -0x7DC0($7)
/* 18AB0 001189B0 2B00103C */  lui        $16, %hi(D_002A81C0)
/* 18AB4 001189B4 80818424 */  addiu      $4, $4, %lo(D_002A8180)
/* 18AB8 001189B8 4082E724 */  addiu      $7, $7, %lo(D_002A8240)
/* 18ABC 001189BC 0000A0AF */  sw         $0, 0x0($sp)
/* 18AC0 001189C0 02000524 */  addiu      $5, $0, 0x2
/* 18AC4 001189C4 2D300000 */  daddu      $6, $0, $0
/* 18AC8 001189C8 04000824 */  addiu      $8, $0, 0x4
/* 18ACC 001189CC C0810926 */  addiu      $9, $16, %lo(D_002A81C0)
/* 18AD0 001189D0 04000A24 */  addiu      $10, $0, 0x4
/* 18AD4 001189D4 2A5D040C */  jal        sceSifCallRpc
/* 18AD8 001189D8 2D580000 */   daddu     $11, $0, $0
/* 18ADC 001189DC 02004104 */  bgez       $2, .L001189E8
/* 18AE0 001189E0 C081028E */   lw        $2, -0x7E40($16)
/* 18AE4 001189E4 FFFF0224 */  addiu      $2, $0, -0x1
.L001189E8:
/* 18AE8 001189E8 2000BFDF */  ld         $31, 0x20($sp)
/* 18AEC 001189EC 1000B0DF */  ld         $16, 0x10($sp)
/* 18AF0 001189F0 0800E003 */  jr         $31
/* 18AF4 001189F4 3000BD27 */   addiu     $sp, $sp, 0x30
