.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdSetOpenItemBox__FPfPf
/* 073BC0 00173AC0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 073BC4 00173AC4 1000BF7F */  sq          $31, 0x10($29)
/* 073BC8 00173AC8 0000B07F */  sq          $16, 0x0($29)
/* 073BCC 00173ACC 28368070 */  paddub      $6, $4, $0
/* 073BD0 00173AD0 2886A070 */  paddub      $16, $5, $0
/* 073BD4 00173AD4 B48F838F */  lw          $3, -0x704C($28)
/* 073BD8 00173AD8 10006010 */  beqz        $3, .L00173B1C
/* 073BDC 00173ADC 00000000 */   nop
/* 073BE0 00173AE0 01000224 */  addiu       $2, $0, 0x1
/* 073BE4 00173AE4 A88F82AF */  sw          $2, -0x7058($28)
/* 073BE8 00173AE8 AC8F80AF */  sw          $0, -0x7054($28)
/* 073BEC 00173AEC 28000224 */  addiu       $2, $0, 0x28
/* 073BF0 00173AF0 B08F82AF */  sw          $2, -0x7050($28)
/* 073BF4 00173AF4 D201023C */  lui         $2, %hi(ibox_pos)
/* 073BF8 00173AF8 809A4424 */  addiu       $4, $2, %lo(ibox_pos)
/* 073BFC 00173AFC 282EC070 */  paddub      $5, $6, $0
/* 073C00 00173B00 0C86040C */  jal         sceVu0CopyVector
/* 073C04 00173B04 00000000 */   nop
/* 073C08 00173B08 D201023C */  lui         $2, %hi(ibox_rot)
/* 073C0C 00173B0C 909A4424 */  addiu       $4, $2, %lo(ibox_rot)
/* 073C10 00173B10 282E0072 */  paddub      $5, $16, $0
/* 073C14 00173B14 0C86040C */  jal         sceVu0CopyVector
/* 073C18 00173B18 00000000 */   nop
.L00173B1C:
/* 073C1C 00173B1C 1000BF7B */  lq          $31, 0x10($29)
/* 073C20 00173B20 0000B07B */  lq          $16, 0x0($29)
/* 073C24 00173B24 2000BD27 */  addiu       $29, $29, 0x20
/* 073C28 00173B28 0800E003 */  jr          $31
/* 073C2C 00173B2C 00000000 */   nop
