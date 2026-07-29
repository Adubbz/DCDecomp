.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetClut__FP13sceVif1PacketP8CTextureP1
/* 04C6A0 0014C5A0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 04C6A4 0014C5A4 1000BF7F */  sq          $31, 0x10($29)
/* 04C6A8 0014C5A8 2846C070 */  paddub      $8, $6, $0
/* 04C6AC 0014C5AC 2800A327 */  addiu       $3, $29, 0x28
/* 04C6B0 0014C5B0 2800A2DC */  ld          $2, 0x28($5)
/* 04C6B4 0014C5B4 000062FC */  sd          $2, 0x0($3)
/* 04C6B8 0014C5B8 10000224 */  addiu       $2, $0, 0x10
/* 04C6BC 0014C5BC 0000A2FF */  sd          $2, 0x0($29)
/* 04C6C0 0014C5C0 0800A2FF */  sd          $2, 0x8($29)
/* 04C6C4 0014C5C4 2800A2DF */  ld          $2, 0x28($29)
/* 04C6C8 0014C5C8 78130200 */  dsll        $2, $2, 13
/* 04C6CC 0014C5CC BE140200 */  dsrl32      $2, $2, 18
/* 04C6D0 0014C5D0 FFFF4530 */  andi        $5, $2, 0xFFFF
/* 04C6D4 0014C5D4 28360070 */  paddub      $6, $0, $0
/* 04C6D8 0014C5D8 01000724 */  addiu       $7, $0, 0x1
/* 04C6DC 0014C5DC 40000924 */  addiu       $9, $0, 0x40
/* 04C6E0 0014C5E0 28560070 */  paddub      $10, $0, $0
/* 04C6E4 0014C5E4 285E0070 */  paddub      $11, $0, $0
/* 04C6E8 0014C5E8 1684040C */  jal         sceVif1PkRefLoadImage
/* 04C6EC 0014C5EC 00000000 */   nop
/* 04C6F0 0014C5F0 1000BF7B */  lq          $31, 0x10($29)
/* 04C6F4 0014C5F4 3000BD27 */  addiu       $29, $29, 0x30
/* 04C6F8 0014C5F8 0800E003 */  jr          $31
/* 04C6FC 0014C5FC 00000000 */   nop
