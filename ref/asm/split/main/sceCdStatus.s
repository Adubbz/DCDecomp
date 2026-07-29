.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceCdStatus
/* 00B740 0010B640 D0FFBD27 */  addiu       $29, $29, -0x30
/* 00B744 0010B644 02000424 */  addiu       $4, $0, 0x2
/* 00B748 0010B648 2000BFFF */  sd          $31, 0x20($29)
/* 00B74C 0010B64C A82B040C */  jal         scmd_prechk
/* 00B750 0010B650 1000B0FF */   sd         $16, 0x10($29)
/* 00B754 0010B654 03004014 */  bnez        $2, .L0010B664
/* 00B758 0010B658 2A00023C */   lui        $2, %hi(scmdrdata)
/* 00B75C 0010B65C 22000010 */  b           .L0010B6E8
/* 00B760 0010B660 FFFF0224 */   addiu      $2, $0, -0x1
.L0010B664:
/* 00B764 0010B664 2A00043C */  lui         $4, %hi(cdrc)
/* 00B768 0010B668 40495024 */  addiu       $16, $2, %lo(scmdrdata)
/* 00B76C 0010B66C 604D8424 */  addiu       $4, $4, %lo(cdrc)
/* 00B770 0010B670 0000A0AF */  sw          $0, 0x0($29)
/* 00B774 0010B674 0C000524 */  addiu       $5, $0, 0xC
/* 00B778 0010B678 2D300000 */  daddu       $6, $0, $0
/* 00B77C 0010B67C 2D380000 */  daddu       $7, $0, $0
/* 00B780 0010B680 2D400000 */  daddu       $8, $0, $0
/* 00B784 0010B684 2D480002 */  daddu       $9, $16, $0
/* 00B788 0010B688 04000A24 */  addiu       $10, $0, 0x4
/* 00B78C 0010B68C 2A5D040C */  jal         sceSifCallRpc
/* 00B790 0010B690 2D580000 */   daddu      $11, $0, $0
/* 00B794 0010B694 06004104 */  bgez        $2, .L0010B6B0
/* 00B798 0010B698 2500033C */   lui        $3, %hi(scmd_semid)
/* 00B79C 0010B69C 2500023C */  lui         $2, %hi(scmd_semid)
/* 00B7A0 0010B6A0 D050040C */  jal         SignalSema
/* 00B7A4 0010B6A4 8402448C */   lw         $4, %lo(scmd_semid)($2)
/* 00B7A8 0010B6A8 0F000010 */  b           .L0010B6E8
/* 00B7AC 0010B6AC FFFF0224 */   addiu      $2, $0, -0x1
.L0010B6B0:
/* 00B7B0 0010B6B0 0020023C */  lui         $2, (0x20000000 >> 16)
/* 00B7B4 0010B6B4 25100202 */  or          $2, $16, $2
/* 00B7B8 0010B6B8 8402648C */  lw          $4, %lo(scmd_semid)($3)
/* 00B7BC 0010B6BC D050040C */  jal         SignalSema
/* 00B7C0 0010B6C0 0000508C */   lw         $16, (0x20000000 & 0xFFFF)($2)
/* 00B7C4 0010B6C4 2500033C */  lui         $3, %hi(CD_debug)
/* 00B7C8 0010B6C8 7002628C */  lw          $2, %lo(CD_debug)($3)
/* 00B7CC 0010B6CC 02004228 */  slti        $2, $2, 0x2
/* 00B7D0 0010B6D0 05004014 */  bnez        $2, .L0010B6E8
/* 00B7D4 0010B6D4 2D100002 */   daddu      $2, $16, $0
/* 00B7D8 0010B6D8 2900043C */  lui         $4, %hi(RO_00297208)
/* 00B7DC 0010B6DC A611040C */  jal         printf
/* 00B7E0 0010B6E0 08728424 */   addiu      $4, $4, %lo(RO_00297208)
/* 00B7E4 0010B6E4 2D100002 */  daddu       $2, $16, $0
.L0010B6E8:
/* 00B7E8 0010B6E8 2000BFDF */  ld          $31, 0x20($29)
/* 00B7EC 0010B6EC 1000B0DF */  ld          $16, 0x10($29)
/* 00B7F0 0010B6F0 0800E003 */  jr          $31
/* 00B7F4 0010B6F4 3000BD27 */   addiu      $29, $29, 0x30
