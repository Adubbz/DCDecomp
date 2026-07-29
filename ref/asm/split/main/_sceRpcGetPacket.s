.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel _sceRpcGetPacket
/* 016F30 00116E30 0400838C */  lw          $3, 0x4($4)
/* 016F34 00116E34 0100053C */  lui         $5, (0x10000 >> 16)
/* 016F38 00116E38 0800868C */  lw          $6, 0x8($4)
/* 016F3C 00116E3C 00000000 */  nop
.L00116E40:
/* 016F40 00116E40 39000042 */  di /* handwritten instruction */
/* 016F44 00116E44 0F040000 */  sync.p
/* 016F48 00116E48 00600240 */  mfc0        $2, $12 /* handwritten instruction */
/* 016F4C 00116E4C 24104500 */  and         $2, $2, $5
/* 016F50 00116E50 00000000 */  nop
/* 016F54 00116E54 FAFF4014 */  bnez        $2, .L00116E40
/* 016F58 00116E58 00000000 */   nop
/* 016F5C 00116E5C 2D286000 */  daddu       $5, $3, $0
/* 016F60 00116E60 1900C018 */  blez        $6, .L00116EC8
/* 016F64 00116E64 2D180000 */   daddu      $3, $0, $0
/* 016F68 00116E68 01000724 */  addiu       $7, $0, 0x1
/* 016F6C 00116E6C 00000000 */  nop
.L00116E70:
/* 016F70 00116E70 1000A28C */  lw          $2, 0x10($5)
/* 016F74 00116E74 01004230 */  andi        $2, $2, 0x1
/* 016F78 00116E78 10004054 */  bnel        $2, $0, .L00116EBC
/* 016F7C 00116E7C 01006324 */   addiu      $3, $3, 0x1
/* 016F80 00116E80 00140300 */  sll         $2, $3, 16
/* 016F84 00116E84 05004234 */  ori         $2, $2, 0x5
/* 016F88 00116E88 1000A2AC */  sw          $2, 0x10($5)
/* 016F8C 00116E8C 0000828C */  lw          $2, 0x0($4)
/* 016F90 00116E90 01004324 */  addiu       $3, $2, 0x1
/* 016F94 00116E94 04006714 */  bne         $3, $7, .L00116EA8
/* 016F98 00116E98 000083AC */   sw         $3, 0x0($4)
/* 016F9C 00116E9C 02004224 */  addiu       $2, $2, 0x2
/* 016FA0 00116EA0 01000324 */  addiu       $3, $0, 0x1
/* 016FA4 00116EA4 000082AC */  sw          $2, 0x0($4)
.L00116EA8:
/* 016FA8 00116EA8 1800A3AC */  sw          $3, 0x18($5)
/* 016FAC 00116EAC 1400A5AC */  sw          $5, 0x14($5)
/* 016FB0 00116EB0 38000042 */  ei /* handwritten instruction */
/* 016FB4 00116EB4 0800E003 */  jr          $31
/* 016FB8 00116EB8 2D10A000 */   daddu      $2, $5, $0
.L00116EBC:
/* 016FBC 00116EBC 2A106600 */  slt         $2, $3, $6
/* 016FC0 00116EC0 EBFF4014 */  bnez        $2, .L00116E70
/* 016FC4 00116EC4 4000A524 */   addiu      $5, $5, 0x40
.L00116EC8:
/* 016FC8 00116EC8 38000042 */  ei /* handwritten instruction */
/* 016FCC 00116ECC 0800E003 */  jr          $31
/* 016FD0 00116ED0 2D100000 */   daddu      $2, $0, $0
/* 016FD4 00116ED4 00000000 */  nop
