.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetPosition__5CFishFPf
/* 1410D0 00240FD0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 1410D4 00240FD4 0000BF7F */  sq         $31, 0x0($sp)
/* 1410D8 00240FD8 50128424 */  addiu      $4, $4, 0x1250
/* 1410DC 00240FDC A000998C */  lw         $25, 0xA0($4)
/* 1410E0 00240FE0 A000398F */  lw         $25, 0xA0($25)
/* 1410E4 00240FE4 09F82003 */  jalr       $25
/* 1410E8 00240FE8 00000000 */   nop
/* 1410EC 00240FEC 0000BF7B */  lq         $31, 0x0($sp)
/* 1410F0 00240FF0 1000BD27 */  addiu      $sp, $sp, 0x10
/* 1410F4 00240FF4 0800E003 */  jr         $31
/* 1410F8 00240FF8 00000000 */   nop
/* 1410FC 00240FFC 00000000 */  nop
