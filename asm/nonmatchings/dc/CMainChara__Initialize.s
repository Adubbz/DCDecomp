.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Initialize__10CMainCharaFv
/* 39DC0 00139CC0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 39DC4 00139CC4 1000BF7F */  sq         $31, 0x10($sp)
/* 39DC8 00139CC8 0000B07F */  sq         $16, 0x0($sp)
/* 39DCC 00139CCC 28868070 */  paddub     $16, $4, $0
/* 39DD0 00139CD0 74E6040C */  jal        Initialize__10CCharacterFv
/* 39DD4 00139CD4 00000000 */   nop
/* 39DD8 00139CD8 B01100AE */  sw         $0, 0x11B0($16)
/* 39DDC 00139CDC B41100AE */  sw         $0, 0x11B4($16)
/* 39DE0 00139CE0 B81100AE */  sw         $0, 0x11B8($16)
/* 39DE4 00139CE4 C01100AE */  sw         $0, 0x11C0($16)
/* 39DE8 00139CE8 C41100AE */  sw         $0, 0x11C4($16)
/* 39DEC 00139CEC C81100AE */  sw         $0, 0x11C8($16)
/* 39DF0 00139CF0 CC1100AE */  sw         $0, 0x11CC($16)
/* 39DF4 00139CF4 1000BF7B */  lq         $31, 0x10($sp)
/* 39DF8 00139CF8 0000B07B */  lq         $16, 0x0($sp)
/* 39DFC 00139CFC 2000BD27 */  addiu      $sp, $sp, 0x20
/* 39E00 00139D00 0800E003 */  jr         $31
/* 39E04 00139D04 00000000 */   nop
/* 39E08 00139D08 00000000 */  nop
/* 39E0C 00139D0C 00000000 */  nop
