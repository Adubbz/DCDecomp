.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceMcRead
/* 1E5E8 0011E4E8 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 1E5EC 0011E4EC 2D38A000 */  daddu      $7, $5, $0
/* 1E5F0 0011E4F0 4000B3FF */  sd         $19, 0x40($sp)
/* 1E5F4 0011E4F4 2500133C */  lui        $19, (0x250A38 >> 16)
/* 1E5F8 0011E4F8 5000BFFF */  sd         $31, 0x50($sp)
/* 1E5FC 0011E4FC 380A628E */  lw         $2, (0x250A38 & 0xFFFF)($19)
/* 1E600 0011E500 3000B2FF */  sd         $18, 0x30($sp)
/* 1E604 0011E504 2000B1FF */  sd         $17, 0x20($sp)
/* 1E608 0011E508 26004014 */  bnez       $2, .L0011E5A4
/* 1E60C 0011E50C 1000B0FF */   sd        $16, 0x10($sp)
/* 1E610 0011E510 2B00023C */  lui        $2, %hi(D_002A8640)
/* 1E614 0011E514 40865224 */  addiu      $18, $2, %lo(D_002A8640)
/* 1E618 0011E518 2400438E */  lw         $3, 0x24($18)
/* 1E61C 0011E51C 21006010 */  beqz       $3, .L0011E5A4
/* 1E620 0011E520 9CFF0224 */   addiu     $2, $0, -0x64
/* 1E624 0011E524 2B00023C */  lui        $2, %hi(D_002A86C0)
/* 1E628 0011E528 2B00103C */  lui        $16, %hi(D_002A8B40)
/* 1E62C 0011E52C C0865124 */  addiu      $17, $2, %lo(D_002A86C0)
/* 1E630 0011E530 408B1026 */  addiu      $16, $16, %lo(D_002A8B40)
/* 1E634 0011E534 C08644AC */  sw         $4, -0x7940($2)
/* 1E638 0011E538 2D28C000 */  daddu      $5, $6, $0
/* 1E63C 0011E53C 2D20E000 */  daddu      $4, $7, $0
/* 1E640 0011E540 180027AE */  sw         $7, 0x18($17)
/* 1E644 0011E544 0C0026AE */  sw         $6, 0xC($17)
/* 1E648 0011E548 E65A040C */  jal        sceSifWriteBackDCache
/* 1E64C 0011E54C 1C0030AE */   sw        $16, 0x1C($17)
/* 1E650 0011E550 2D200002 */  daddu      $4, $16, $0
/* 1E654 0011E554 E65A040C */  jal        sceSifWriteBackDCache
/* 1E658 0011E558 C0000524 */   addiu     $5, $0, 0xC0
/* 1E65C 0011E55C 2B00093C */  lui        $9, %hi(D_002A9C00)
/* 1E660 0011E560 12000B3C */  lui        $11, %hi(mceIntrReadFixAlign)
/* 1E664 0011E564 0000B0AF */  sw         $16, 0x0($sp)
/* 1E668 0011E568 2D204002 */  daddu      $4, $18, $0
/* 1E66C 0011E56C 2D382002 */  daddu      $7, $17, $0
/* 1E670 0011E570 009C2925 */  addiu      $9, $9, %lo(D_002A9C00)
/* 1E674 0011E574 58E46B25 */  addiu      $11, $11, %lo(mceIntrReadFixAlign)
/* 1E678 0011E578 05000524 */  addiu      $5, $0, 0x5
/* 1E67C 0011E57C 01000624 */  addiu      $6, $0, 0x1
/* 1E680 0011E580 30000824 */  addiu      $8, $0, 0x30
/* 1E684 0011E584 2A5D040C */  jal        sceSifCallRpc
/* 1E688 0011E588 04000A24 */   addiu     $10, $0, 0x4
/* 1E68C 0011E58C 2D184000 */  daddu      $3, $2, $0
/* 1E690 0011E590 04006014 */  bnez       $3, .L0011E5A4
/* 1E694 0011E594 2D106000 */   daddu     $2, $3, $0
/* 1E698 0011E598 05000224 */  addiu      $2, $0, 0x5
/* 1E69C 0011E59C 380A62AE */  sw         $2, (0x250A38 & 0xFFFF)($19)
/* 1E6A0 0011E5A0 2D106000 */  daddu      $2, $3, $0
.L0011E5A4:
/* 1E6A4 0011E5A4 5000BFDF */  ld         $31, 0x50($sp)
/* 1E6A8 0011E5A8 4000B3DF */  ld         $19, 0x40($sp)
/* 1E6AC 0011E5AC 3000B2DF */  ld         $18, 0x30($sp)
/* 1E6B0 0011E5B0 2000B1DF */  ld         $17, 0x20($sp)
/* 1E6B4 0011E5B4 1000B0DF */  ld         $16, 0x10($sp)
/* 1E6B8 0011E5B8 0800E003 */  jr         $31
/* 1E6BC 0011E5BC 6000BD27 */   addiu     $sp, $sp, 0x60
