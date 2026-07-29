.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel ReleaseAlarm
/* 0150B0 00114FB0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0150B4 00114FB4 1000BFFF */  sd          $31, 0x10($29)
/* 0150B8 00114FB8 0000B0FF */  sd          $16, 0x0($29)
/* 0150BC 00114FBC 00601040 */  mfc0        $16, $12 /* handwritten instruction */
/* 0150C0 00114FC0 0100023C */  lui         $2, (0x10000 >> 16)
/* 0150C4 00114FC4 24800202 */  and         $16, $16, $2
/* 0150C8 00114FC8 08000012 */  beqz        $16, .L00114FEC
/* 0150CC 00114FCC 0100033C */   lui        $3, (0x10000 >> 16)
.L00114FD0:
/* 0150D0 00114FD0 39000042 */  di /* handwritten instruction */
/* 0150D4 00114FD4 0F040000 */  sync.p
/* 0150D8 00114FD8 00600240 */  mfc0        $2, $12 /* handwritten instruction */
/* 0150DC 00114FDC 24104300 */  and         $2, $2, $3
/* 0150E0 00114FE0 00000000 */  nop
/* 0150E4 00114FE4 FAFF4014 */  bnez        $2, .L00114FD0
/* 0150E8 00114FE8 00000000 */   nop
.L00114FEC:
/* 0150EC 00114FEC 2C50040C */  jal         _ReleaseAlarm
/* 0150F0 00114FF0 00000000 */   nop
/* 0150F4 00114FF4 0F000000 */  sync
/* 0150F8 00114FF8 03000012 */  beqz        $16, .L00115008
/* 0150FC 00114FFC 1000BFDF */   ld         $31, 0x10($29)
/* 015100 00115000 38000042 */  ei /* handwritten instruction */
/* 015104 00115004 1000BFDF */  ld          $31, 0x10($29)
.L00115008:
/* 015108 00115008 0000B0DF */  ld          $16, 0x0($29)
/* 01510C 0011500C 0800E003 */  jr          $31
/* 015110 00115010 2000BD27 */   addiu      $29, $29, 0x20
/* 015114 00115014 00000000 */  nop
