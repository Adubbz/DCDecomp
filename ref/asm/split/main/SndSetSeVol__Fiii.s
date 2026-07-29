.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SndSetSeVol__Fiii
/* 05AA00 0015A900 F0FFBD27 */  addiu       $29, $29, -0x10
/* 05AA04 0015A904 0000BF7F */  sq          $31, 0x0($29)
/* 05AA08 0015A908 2846A070 */  paddub      $8, $5, $0
/* 05AA0C 0015A90C 284EC070 */  paddub      $9, $6, $0
/* 05AA10 0015A910 04000005 */  bltz        $8, .L0015A924
/* 05AA14 0015A914 00000000 */   nop
/* 05AA18 0015A918 80000129 */  slti        $1, $8, 0x80
/* 05AA1C 0015A91C 03002014 */  bnez        $1, .L0015A92C
/* 05AA20 0015A920 00000000 */   nop
.L0015A924:
/* 05AA24 0015A924 0E000010 */  b           .L0015A960
/* 05AA28 0015A928 00000000 */   nop
.L0015A92C:
/* 05AA2C 0015A92C 2C68050C */  jal         GetSeInfo__Fi
/* 05AA30 0015A930 00000000 */   nop
/* 05AA34 0015A934 283E4070 */  paddub      $7, $2, $0
/* 05AA38 0015A938 0900E010 */  beqz        $7, .L0015A960
/* 05AA3C 0015A93C 00000000 */   nop
/* 05AA40 0015A940 8068050C */  jal         GetPortNo__Fi
/* 05AA44 0015A944 00000000 */   nop
/* 05AA48 0015A948 0000E680 */  lb          $6, 0x0($7)
/* 05AA4C 0015A94C 0100E780 */  lb          $7, 0x1($7)
/* 05AA50 0015A950 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 05AA54 0015A954 282E4070 */  paddub      $5, $2, $0
/* 05AA58 0015A958 2016050C */  jal         SE_SetVol__6CSoundFiiiii
/* 05AA5C 0015A95C 00000000 */   nop
.L0015A960:
/* 05AA60 0015A960 0000BF7B */  lq          $31, 0x0($29)
/* 05AA64 0015A964 1000BD27 */  addiu       $29, $29, 0x10
/* 05AA68 0015A968 0800E003 */  jr          $31
/* 05AA6C 0015A96C 00000000 */   nop
