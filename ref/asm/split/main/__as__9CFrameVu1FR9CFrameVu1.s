.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __as__9CFrameVu1FR9CFrameVu1
/* 02A3B0 0012A2B0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 02A3B4 0012A2B4 2000BF7F */  sq          $31, 0x20($29)
/* 02A3B8 0012A2B8 1000B17F */  sq          $17, 0x10($29)
/* 02A3BC 0012A2BC 0000B07F */  sq          $16, 0x0($29)
/* 02A3C0 0012A2C0 288E8070 */  paddub      $17, $4, $0
/* 02A3C4 0012A2C4 2886A070 */  paddub      $16, $5, $0
/* 02A3C8 0012A2C8 ACA3040C */  jal         __as__6CFrameFR6CFrame
/* 02A3CC 0012A2CC 00000000 */   nop
/* 02A3D0 0012A2D0 6002028E */  lw          $2, 0x260($16)
/* 02A3D4 0012A2D4 600222AE */  sw          $2, 0x260($17)
/* 02A3D8 0012A2D8 28162072 */  paddub      $2, $17, $0
/* 02A3DC 0012A2DC 2000BF7B */  lq          $31, 0x20($29)
/* 02A3E0 0012A2E0 1000B17B */  lq          $17, 0x10($29)
/* 02A3E4 0012A2E4 0000B07B */  lq          $16, 0x0($29)
/* 02A3E8 0012A2E8 3000BD27 */  addiu       $29, $29, 0x30
/* 02A3EC 0012A2EC 0800E003 */  jr          $31
/* 02A3F0 0012A2F0 00000000 */   nop
/* 02A3F4 0012A2F4 00000000 */  nop
/* 02A3F8 0012A2F8 00000000 */  nop
/* 02A3FC 0012A2FC 00000000 */  nop
