.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel mwBload
/* 22F80 00122E80 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 22F84 00122E84 3000BF7F */  sq         $31, 0x30($sp)
/* 22F88 00122E88 2000B27F */  sq         $18, 0x20($sp)
/* 22F8C 00122E8C 1000B17F */  sq         $17, 0x10($sp)
/* 22F90 00122E90 0000B07F */  sq         $16, 0x0($sp)
/* 22F94 00122E94 2896A070 */  paddub     $18, $5, $0
/* 22F98 00122E98 288E0070 */  paddub     $17, $0, $0
/* 22F9C 00122E9C 01000524 */  addiu      $5, $0, 0x1
/* 22FA0 00122EA0 865F040C */  jal        sceOpen
/* 22FA4 00122EA4 00000000 */   nop
/* 22FA8 00122EA8 28864070 */  paddub     $16, $2, $0
/* 22FAC 00122EAC 0C000006 */  bltz       $16, .L00122EE0
/* 22FB0 00122EB0 00000000 */   nop
/* 22FB4 00122EB4 28260072 */  paddub     $4, $16, $0
/* 22FB8 00122EB8 282E0070 */  paddub     $5, $0, $0
/* 22FBC 00122EBC 02000624 */  addiu      $6, $0, 0x2
/* 22FC0 00122EC0 3460040C */  jal        sceLseek
/* 22FC4 00122EC4 00000000 */   nop
/* 22FC8 00122EC8 288E4070 */  paddub     $17, $2, $0
/* 22FCC 00122ECC 28260072 */  paddub     $4, $16, $0
/* 22FD0 00122ED0 282E0070 */  paddub     $5, $0, $0
/* 22FD4 00122ED4 28360070 */  paddub     $6, $0, $0
/* 22FD8 00122ED8 3460040C */  jal        sceLseek
/* 22FDC 00122EDC 00000000 */   nop
.L00122EE0:
/* 22FE0 00122EE0 0700201A */  blez       $17, .L00122F00
/* 22FE4 00122EE4 00000000 */   nop
/* 22FE8 00122EE8 28260072 */  paddub     $4, $16, $0
/* 22FEC 00122EEC 282E4072 */  paddub     $5, $18, $0
/* 22FF0 00122EF0 28362072 */  paddub     $6, $17, $0
/* 22FF4 00122EF4 AE60040C */  jal        sceRead
/* 22FF8 00122EF8 00000000 */   nop
/* 22FFC 00122EFC 288E4070 */  paddub     $17, $2, $0
.L00122F00:
/* 23000 00122F00 04000006 */  bltz       $16, .L00122F14
/* 23004 00122F04 00000000 */   nop
/* 23008 00122F08 28260072 */  paddub     $4, $16, $0
/* 2300C 00122F0C F65F040C */  jal        sceClose
/* 23010 00122F10 00000000 */   nop
.L00122F14:
/* 23014 00122F14 28162072 */  paddub     $2, $17, $0
/* 23018 00122F18 3000BF7B */  lq         $31, 0x30($sp)
/* 2301C 00122F1C 2000B27B */  lq         $18, 0x20($sp)
/* 23020 00122F20 1000B17B */  lq         $17, 0x10($sp)
/* 23024 00122F24 0000B07B */  lq         $16, 0x0($sp)
/* 23028 00122F28 4000BD27 */  addiu      $sp, $sp, 0x40
/* 2302C 00122F2C 0800E003 */  jr         $31
/* 23030 00122F30 00000000 */   nop
/* 23034 00122F34 00000000 */  nop
/* 23038 00122F38 00000000 */  nop
/* 2303C 00122F3C 00000000 */  nop
