.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceMSIn_PutHsMsg
/* 1F4B8 0011F3B8 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 1F4BC 0011F3BC 0000C390 */  lbu        $3, 0x0($6)
/* 1F4C0 0011F3C0 F9000224 */  addiu      $2, $0, 0xF9
/* 1F4C4 0011F3C4 06006210 */  beq        $3, $2, .L0011F3E0
/* 1F4C8 0011F3C8 0000BFFF */   sd        $31, 0x0($sp)
/* 1F4CC 0011F3CC FD000224 */  addiu      $2, $0, 0xFD
/* 1F4D0 0011F3D0 05006210 */  beq        $3, $2, .L0011F3E8
/* 1F4D4 0011F3D4 FFFF0224 */   addiu     $2, $0, -0x1
/* 1F4D8 0011F3D8 07000010 */  b          .L0011F3F8
/* 1F4DC 0011F3DC 0000BFDF */   ld        $31, 0x0($sp)
.L0011F3E0:
/* 1F4E0 0011F3E0 02000010 */  b          .L0011F3EC
/* 1F4E4 0011F3E4 05000724 */   addiu     $7, $0, 0x5
.L0011F3E8:
/* 1F4E8 0011F3E8 07000724 */  addiu      $7, $0, 0x7
.L0011F3EC:
/* 1F4EC 0011F3EC 7E7C040C */  jal        put_message
/* 1F4F0 0011F3F0 00000000 */   nop
/* 1F4F4 0011F3F4 0000BFDF */  ld         $31, 0x0($sp)
.L0011F3F8:
/* 1F4F8 0011F3F8 0800E003 */  jr         $31
/* 1F4FC 0011F3FC 1000BD27 */   addiu     $sp, $sp, 0x10
