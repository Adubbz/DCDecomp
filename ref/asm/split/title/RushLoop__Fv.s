.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel RushLoop__Fv
/* 01D1B0 01DC8EB0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 01D1B4 01DC8EB4 0000BF7F */  sq          $31, 0x0($29)
/* 01D1B8 01DC8EB8 38FB040C */  jal         ReadBG__Fv
/* 01D1BC 01DC8EBC 00000000 */   nop
/* 01D1C0 01DC8EC0 E301023C */  lui         $2, %hi(CScript)
/* 01D1C4 01DC8EC4 C0E94424 */  addiu       $4, $2, %lo(CScript)
/* 01D1C8 01DC8EC8 B8AF760C */  jal         Step__7CScriptFv
/* 01D1CC 01DC8ECC 00000000 */   nop
/* 01D1D0 01DC8ED0 AC2C770C */  jal         DataLoad__Fv
/* 01D1D4 01DC8ED4 00000000 */   nop
/* 01D1D8 01DC8ED8 2824770C */  jal         MotionProcess__Fv__2
/* 01D1DC 01DC8EDC 00000000 */   nop
/* 01D1E0 01DC8EE0 9C27770C */  jal         DrawProcess__Fv__2
/* 01D1E4 01DC8EE4 00000000 */   nop
/* 01D1E8 01DC8EE8 E301023C */  lui         $2, %hi(DispFade__2)
/* 01D1EC 01DC8EEC 70E94424 */  addiu       $4, $2, %lo(DispFade__2)
/* 01D1F0 01DC8EF0 D48B858F */  lw          $5, -0x742C($28)
/* 01D1F4 01DC8EF4 0CB5760C */  jal         FadeIn__9CDispFadeFP13sceVif1Packet
/* 01D1F8 01DC8EF8 00000000 */   nop
/* 01D1FC 01DC8EFC E301023C */  lui         $2, %hi(DispFade__2)
/* 01D200 01DC8F00 70E94424 */  addiu       $4, $2, %lo(DispFade__2)
/* 01D204 01DC8F04 D48B858F */  lw          $5, -0x742C($28)
/* 01D208 01DC8F08 94B4760C */  jal         FadeOut__9CDispFadeFP13sceVif1Packet
/* 01D20C 01DC8F0C 00000000 */   nop
/* 01D210 01DC8F10 7028770C */  jal         SoundProcess__Fv__2
/* 01D214 01DC8F14 00000000 */   nop
/* 01D218 01DC8F18 B49B8293 */  lbu         $2, -0x644C($28)
/* 01D21C 01DC8F1C 19004014 */  bnez        $2, .L01DC8F84_2CE784
/* 01D220 01DC8F20 00000000 */   nop
/* 01D224 01DC8F24 CC01023C */  lui         $2, %hi(GamePad)
/* 01D228 01DC8F28 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 01D22C 01DC8F2C 00080524 */  addiu       $5, $0, 0x800
/* 01D230 01DC8F30 1CAE040C */  jal         Down__8CGamePadFi
/* 01D234 01DC8F34 00000000 */   nop
/* 01D238 01DC8F38 12004010 */  beqz        $2, .L01DC8F84_2CE784
/* 01D23C 01DC8F3C 00000000 */   nop
.L01DC8F40_2CE740:
/* 01D240 01DC8F40 8CFB040C */  jal         ReadBGSync__Fv
/* 01D244 01DC8F44 00000000 */   nop
/* 01D248 01DC8F48 FDFF4014 */  bnez        $2, .L01DC8F40_2CE740
/* 01D24C 01DC8F4C 00000000 */   nop
/* 01D250 01DC8F50 0041023C */  lui         $2, (0x41000000 >> 16)
/* 01D254 01DC8F54 00608244 */  mtc1        $2, $f12
/* 01D258 01DC8F58 E301023C */  lui         $2, %hi(DispFade__2)
/* 01D25C 01DC8F5C 70E94424 */  addiu       $4, $2, %lo(DispFade__2)
/* 01D260 01DC8F60 282E0070 */  paddub      $5, $0, $0
/* 01D264 01DC8F64 78B4760C */  jal         FadeOutStart__9CDispFadeFfi
/* 01D268 01DC8F68 00000000 */   nop
/* 01D26C 01DC8F6C 01000224 */  addiu       $2, $0, 0x1
/* 01D270 01DC8F70 B49B82A3 */  sb          $2, -0x644C($28)
/* 01D274 01DC8F74 20000424 */  addiu       $4, $0, 0x20
/* 01D278 01DC8F78 282E0070 */  paddub      $5, $0, $0
/* 01D27C 01DC8F7C C467050C */  jal         SndBgmFadeOut__Fii
/* 01D280 01DC8F80 00000000 */   nop
.L01DC8F84_2CE784:
/* 01D284 01DC8F84 B49B8293 */  lbu         $2, -0x644C($28)
/* 01D288 01DC8F88 20004010 */  beqz        $2, .L01DC900C_2CE80C
/* 01D28C 01DC8F8C 00000000 */   nop
/* 01D290 01DC8F90 B89B828F */  lw          $2, -0x6448($28)
/* 01D294 01DC8F94 80004128 */  slti        $1, $2, 0x80
/* 01D298 01DC8F98 05002010 */  beqz        $1, .L01DC8FB0_2CE7B0
/* 01D29C 01DC8F9C 00000000 */   nop
/* 01D2A0 01DC8FA0 08004224 */  addiu       $2, $2, 0x8
/* 01D2A4 01DC8FA4 B89B82AF */  sw          $2, -0x6448($28)
/* 01D2A8 01DC8FA8 18000010 */  b           .L01DC900C_2CE80C
/* 01D2AC 01DC8FAC 00000000 */   nop
.L01DC8FB0_2CE7B0:
/* 01D2B0 01DC8FB0 8CFB040C */  jal         ReadBGSync__Fv
/* 01D2B4 01DC8FB4 00000000 */   nop
/* 01D2B8 01DC8FB8 FDFF4014 */  bnez        $2, .L01DC8FB0_2CE7B0
/* 01D2BC 01DC8FBC 00000000 */   nop
/* 01D2C0 01DC8FC0 00608044 */  mtc1        $0, $f12
/* 01D2C4 01DC8FC4 00000000 */  nop
/* 01D2C8 01DC8FC8 46630046 */  mov.s       $f13, $f12
/* 01D2CC 01DC8FCC 86630046 */  mov.s       $f14, $f12
/* 01D2D0 01DC8FD0 0043023C */  lui         $2, (0x43000000 >> 16)
/* 01D2D4 01DC8FD4 00788244 */  mtc1        $2, $f15
/* 01D2D8 01DC8FD8 24B8040C */  jal         MGSetBGColor__Fffff
/* 01D2DC 01DC8FDC 00000000 */   nop
/* 01D2E0 01DC8FE0 1469050C */  jal         SndStopAllSe__Fv
/* 01D2E4 01DC8FE4 00000000 */   nop
/* 01D2E8 01DC8FE8 E866050C */  jal         SndBgmStop__Fv
/* 01D2EC 01DC8FEC 00000000 */   nop
/* 01D2F0 01DC8FF0 646C050C */  jal         SndAmbientStop__Fv
/* 01D2F4 01DC8FF4 00000000 */   nop
/* 01D2F8 01DC8FF8 D464050C */  jal         SndStep__Fv
/* 01D2FC 01DC8FFC 00000000 */   nop
/* 01D300 01DC9000 01000224 */  addiu       $2, $0, 0x1
/* 01D304 01DC9004 1F000010 */  b           .L01DC9084_2CE884
/* 01D308 01DC9008 00000000 */   nop
.L01DC900C_2CE80C:
/* 01D30C 01DC900C E301013C */  lui         $1, %hi(CScript + 0x10)
/* 01D310 01DC9010 D0E92290 */  lbu         $2, %lo(CScript + 0x10)($1)
/* 01D314 01DC9014 18004010 */  beqz        $2, .L01DC9078_2CE878
/* 01D318 01DC9018 00000000 */   nop
.L01DC901C_2CE81C:
/* 01D31C 01DC901C 8CFB040C */  jal         ReadBGSync__Fv
/* 01D320 01DC9020 00000000 */   nop
/* 01D324 01DC9024 FDFF4014 */  bnez        $2, .L01DC901C_2CE81C
/* 01D328 01DC9028 00000000 */   nop
/* 01D32C 01DC902C 00608044 */  mtc1        $0, $f12
/* 01D330 01DC9030 00000000 */  nop
/* 01D334 01DC9034 46630046 */  mov.s       $f13, $f12
/* 01D338 01DC9038 86630046 */  mov.s       $f14, $f12
/* 01D33C 01DC903C 0043023C */  lui         $2, (0x43000000 >> 16)
/* 01D340 01DC9040 00788244 */  mtc1        $2, $f15
/* 01D344 01DC9044 24B8040C */  jal         MGSetBGColor__Fffff
/* 01D348 01DC9048 00000000 */   nop
/* 01D34C 01DC904C 1469050C */  jal         SndStopAllSe__Fv
/* 01D350 01DC9050 00000000 */   nop
/* 01D354 01DC9054 E866050C */  jal         SndBgmStop__Fv
/* 01D358 01DC9058 00000000 */   nop
/* 01D35C 01DC905C 646C050C */  jal         SndAmbientStop__Fv
/* 01D360 01DC9060 00000000 */   nop
/* 01D364 01DC9064 D464050C */  jal         SndStep__Fv
/* 01D368 01DC9068 00000000 */   nop
/* 01D36C 01DC906C 01000224 */  addiu       $2, $0, 0x1
/* 01D370 01DC9070 04000010 */  b           .L01DC9084_2CE884
/* 01D374 01DC9074 00000000 */   nop
.L01DC9078_2CE878:
/* 01D378 01DC9078 D464050C */  jal         SndStep__Fv
/* 01D37C 01DC907C 00000000 */   nop
/* 01D380 01DC9080 28160070 */  paddub      $2, $0, $0
.L01DC9084_2CE884:
/* 01D384 01DC9084 0000BF7B */  lq          $31, 0x0($29)
/* 01D388 01DC9088 1000BD27 */  addiu       $29, $29, 0x10
/* 01D38C 01DC908C 0800E003 */  jr          $31
/* 01D390 01DC9090 00000000 */   nop
/* 01D394 01DC9094 00000000 */  nop
/* 01D398 01DC9098 00000000 */  nop
/* 01D39C 01DC909C 00000000 */  nop
