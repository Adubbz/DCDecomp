.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_CAMERA_SPEED__FP12RS_STACKDATAi
/* 091EA0 00191DA0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 091EA4 00191DA4 1000BF7F */  sq          $31, 0x10($29)
/* 091EA8 00191DA8 0000B07F */  sq          $16, 0x0($29)
/* 091EAC 00191DAC D401013C */  lui         $1, %hi(EdEventInfo + 0x40)
/* 091EB0 00191DB0 10D2308C */  lw          $16, %lo(EdEventInfo + 0x40)($1)
/* 091EB4 00191DB4 04000016 */  bnez        $16, .L00191DC8
/* 091EB8 00191DB8 00000000 */   nop
/* 091EBC 00191DBC 28160070 */  paddub      $2, $0, $0
/* 091EC0 00191DC0 0A000010 */  b           .L00191DEC
/* 091EC4 00191DC4 00000000 */   nop
.L00191DC8:
/* 091EC8 00191DC8 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 091ECC 00191DCC 00000000 */   nop
/* 091ED0 00191DD0 00008244 */  mtc1        $2, $f0
/* 091ED4 00191DD4 00000000 */  nop
/* 091ED8 00191DD8 20038046 */  cvt.s.w     $f12, $f0
/* 091EDC 00191DDC 28260072 */  paddub      $4, $16, $0
/* 091EE0 00191DE0 9491040C */  jal         SetSpeed__7CCameraFf
/* 091EE4 00191DE4 00000000 */   nop
/* 091EE8 00191DE8 01000224 */  addiu       $2, $0, 0x1
.L00191DEC:
/* 091EEC 00191DEC 1000BF7B */  lq          $31, 0x10($29)
/* 091EF0 00191DF0 0000B07B */  lq          $16, 0x0($29)
/* 091EF4 00191DF4 2000BD27 */  addiu       $29, $29, 0x20
/* 091EF8 00191DF8 0800E003 */  jr          $31
/* 091EFC 00191DFC 00000000 */   nop
