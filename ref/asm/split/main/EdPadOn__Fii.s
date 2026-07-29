.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdPadOn__Fii
/* 069A40 00169940 F0FFBD27 */  addiu       $29, $29, -0x10
/* 069A44 00169944 0000BF7F */  sq          $31, 0x0($29)
/* 069A48 00169948 281E8070 */  paddub      $3, $4, $0
/* 069A4C 0016994C 2826A070 */  paddub      $4, $5, $0
/* 069A50 00169950 F0A5050C */  jal         check_key_mode__Fi
/* 069A54 00169954 00000000 */   nop
/* 069A58 00169958 08004010 */  beqz        $2, .L0016997C
/* 069A5C 0016995C 00000000 */   nop
/* 069A60 00169960 CC01023C */  lui         $2, %hi(GamePad)
/* 069A64 00169964 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 069A68 00169968 282E6070 */  paddub      $5, $3, $0
/* 069A6C 0016996C 04AE040C */  jal         On__8CGamePadFi
/* 069A70 00169970 00000000 */   nop
/* 069A74 00169974 02000010 */  b           .L00169980
/* 069A78 00169978 00000000 */   nop
.L0016997C:
/* 069A7C 0016997C 28160070 */  paddub      $2, $0, $0
.L00169980:
/* 069A80 00169980 0000BF7B */  lq          $31, 0x0($29)
/* 069A84 00169984 1000BD27 */  addiu       $29, $29, 0x10
/* 069A88 00169988 0800E003 */  jr          $31
/* 069A8C 0016998C 00000000 */   nop
