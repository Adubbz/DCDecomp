.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetClut__FP13sceVif1PacketP8CTextureP1
/* 4C6A0 0014C5A0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 4C6A4 0014C5A4 1000BF7F */  sq         $31, 0x10($sp)
/* 4C6A8 0014C5A8 2846C070 */  paddub     $8, $6, $0
/* 4C6AC 0014C5AC 2800A327 */  addiu      $3, $sp, 0x28
/* 4C6B0 0014C5B0 2800A2DC */  ld         $2, 0x28($5)
/* 4C6B4 0014C5B4 000062FC */  sd         $2, 0x0($3)
/* 4C6B8 0014C5B8 10000224 */  addiu      $2, $0, 0x10
/* 4C6BC 0014C5BC 0000A2FF */  sd         $2, 0x0($sp)
/* 4C6C0 0014C5C0 0800A2FF */  sd         $2, 0x8($sp)
/* 4C6C4 0014C5C4 2800A2DF */  ld         $2, 0x28($sp)
/* 4C6C8 0014C5C8 78130200 */  dsll       $2, $2, 13
/* 4C6CC 0014C5CC BE140200 */  dsrl32     $2, $2, 18
/* 4C6D0 0014C5D0 FFFF4530 */  andi       $5, $2, 0xFFFF
/* 4C6D4 0014C5D4 28360070 */  paddub     $6, $0, $0
/* 4C6D8 0014C5D8 01000724 */  addiu      $7, $0, 0x1
/* 4C6DC 0014C5DC 40000924 */  addiu      $9, $0, 0x40
/* 4C6E0 0014C5E0 28560070 */  paddub     $10, $0, $0
/* 4C6E4 0014C5E4 285E0070 */  paddub     $11, $0, $0
/* 4C6E8 0014C5E8 1684040C */  jal        sceVif1PkRefLoadImage
/* 4C6EC 0014C5EC 00000000 */   nop
/* 4C6F0 0014C5F0 1000BF7B */  lq         $31, 0x10($sp)
/* 4C6F4 0014C5F4 3000BD27 */  addiu      $sp, $sp, 0x30
/* 4C6F8 0014C5F8 0800E003 */  jr         $31
/* 4C6FC 0014C5FC 00000000 */   nop
