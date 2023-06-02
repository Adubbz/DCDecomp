.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AnalyzeEdit__Fv
/* 113020 00212F20 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 113024 00212F24 0000BF7F */  sq         $31, 0x0($sp)
/* 113028 00212F28 CC01023C */  lui        $2, %hi(GamePad)
/* 11302C 00212F2C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 113030 00212F30 60000524 */  addiu      $5, $0, 0x60
/* 113034 00212F34 1CAE040C */  jal        Down__8CGamePadFi
/* 113038 00212F38 00000000 */   nop
/* 11303C 00212F3C 08004010 */  beqz       $2, .L00212F60
/* 113040 00212F40 00000000 */   nop
/* 113044 00212F44 02000424 */  addiu      $4, $0, 0x2
/* 113048 00212F48 BCB3080C */  jal        ComMenuSePlay__Fi
/* 11304C 00212F4C 00000000 */   nop
/* 113050 00212F50 12000224 */  addiu      $2, $0, 0x12
/* 113054 00212F54 549682AF */  sw         $2, -0x69AC($gp)
/* 113058 00212F58 02000224 */  addiu      $2, $0, 0x2
/* 11305C 00212F5C 649682A7 */  sh         $2, -0x699C($gp)
.L00212F60:
/* 113060 00212F60 28160070 */  paddub     $2, $0, $0
/* 113064 00212F64 0000BF7B */  lq         $31, 0x0($sp)
/* 113068 00212F68 1000BD27 */  addiu      $sp, $sp, 0x10
/* 11306C 00212F6C 0800E003 */  jr         $31
/* 113070 00212F70 00000000 */   nop
/* 113074 00212F74 00000000 */  nop
/* 113078 00212F78 00000000 */  nop
/* 11307C 00212F7C 00000000 */  nop
