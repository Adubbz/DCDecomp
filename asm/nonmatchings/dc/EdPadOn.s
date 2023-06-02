.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdPadOn__Fii
/* 69A40 00169940 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 69A44 00169944 0000BF7F */  sq         $31, 0x0($sp)
/* 69A48 00169948 281E8070 */  paddub     $3, $4, $0
/* 69A4C 0016994C 2826A070 */  paddub     $4, $5, $0
/* 69A50 00169950 F0A5050C */  jal        check_key_mode__Fi
/* 69A54 00169954 00000000 */   nop
/* 69A58 00169958 08004010 */  beqz       $2, .L0016997C
/* 69A5C 0016995C 00000000 */   nop
/* 69A60 00169960 CC01023C */  lui        $2, %hi(GamePad)
/* 69A64 00169964 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 69A68 00169968 282E6070 */  paddub     $5, $3, $0
/* 69A6C 0016996C 04AE040C */  jal        On__8CGamePadFi
/* 69A70 00169970 00000000 */   nop
/* 69A74 00169974 02000010 */  b          .L00169980
/* 69A78 00169978 00000000 */   nop
.L0016997C:
/* 69A7C 0016997C 28160070 */  paddub     $2, $0, $0
.L00169980:
/* 69A80 00169980 0000BF7B */  lq         $31, 0x0($sp)
/* 69A84 00169984 1000BD27 */  addiu      $sp, $sp, 0x10
/* 69A88 00169988 0800E003 */  jr         $31
/* 69A8C 0016998C 00000000 */   nop
