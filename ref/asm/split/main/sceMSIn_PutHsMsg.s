.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceMSIn_PutHsMsg
/* 01F4B8 0011F3B8 F0FFBD27 */  addiu       $29, $29, -0x10
/* 01F4BC 0011F3BC 0000C390 */  lbu         $3, 0x0($6)
/* 01F4C0 0011F3C0 F9000224 */  addiu       $2, $0, 0xF9
/* 01F4C4 0011F3C4 06006210 */  beq         $3, $2, .L0011F3E0
/* 01F4C8 0011F3C8 0000BFFF */   sd         $31, 0x0($29)
/* 01F4CC 0011F3CC FD000224 */  addiu       $2, $0, 0xFD
/* 01F4D0 0011F3D0 05006210 */  beq         $3, $2, .L0011F3E8
/* 01F4D4 0011F3D4 FFFF0224 */   addiu      $2, $0, -0x1
/* 01F4D8 0011F3D8 07000010 */  b           .L0011F3F8
/* 01F4DC 0011F3DC 0000BFDF */   ld         $31, 0x0($29)
.L0011F3E0:
/* 01F4E0 0011F3E0 02000010 */  b           .L0011F3EC
/* 01F4E4 0011F3E4 05000724 */   addiu      $7, $0, 0x5
.L0011F3E8:
/* 01F4E8 0011F3E8 07000724 */  addiu       $7, $0, 0x7
.L0011F3EC:
/* 01F4EC 0011F3EC 7E7C040C */  jal         put_message
/* 01F4F0 0011F3F0 00000000 */   nop
/* 01F4F4 0011F3F4 0000BFDF */  ld          $31, 0x0($29)
.L0011F3F8:
/* 01F4F8 0011F3F8 0800E003 */  jr          $31
/* 01F4FC 0011F3FC 1000BD27 */   addiu      $29, $29, 0x10
