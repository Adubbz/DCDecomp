.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceDeci2ExSend
/* 155A8 001154A8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 155AC 001154AC 2D10A000 */  daddu      $2, $5, $0
/* 155B0 001154B0 FFFFC630 */  andi       $6, $6, 0xFFFF
/* 155B4 001154B4 0000A4AF */  sw         $4, 0x0($sp)
/* 155B8 001154B8 1000BFFF */  sd         $31, 0x10($sp)
/* 155BC 001154BC 2D28A003 */  daddu      $5, $sp, $0
/* 155C0 001154C0 0400A2AF */  sw         $2, 0x4($sp)
/* 155C4 001154C4 FAFF0424 */  addiu      $4, $0, -0x6
/* 155C8 001154C8 D451040C */  jal        Deci2Call
/* 155CC 001154CC 0800A6AF */   sw        $6, 0x8($sp)
/* 155D0 001154D0 1000BFDF */  ld         $31, 0x10($sp)
/* 155D4 001154D4 0800E003 */  jr         $31
/* 155D8 001154D8 2000BD27 */   addiu     $sp, $sp, 0x20
/* 155DC 001154DC 00000000 */  nop
