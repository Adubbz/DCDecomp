.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel OpeningLoop__Fv
/* 003C70 01DAF970 F0FFBD27 */  addiu       $29, $29, -0x10
/* 003C74 01DAF974 0000BF7F */  sq          $31, 0x0($29)
/* 003C78 01DAF978 38FB040C */  jal         ReadBG__Fv
/* 003C7C 01DAF97C 00000000 */   nop
/* 003C80 01DAF980 14BF760C */  jal         PauseProcess__Fv
/* 003C84 01DAF984 00000000 */   nop
/* 003C88 01DAF988 0898828F */  lw          $2, -0x67F8($28)
/* 003C8C 01DAF98C 09004014 */  bnez        $2, .L01DAF9B4_2B51B4
/* 003C90 01DAF990 00000000 */   nop
/* 003C94 01DAF994 DE01023C */  lui         $2, %hi(CScript__2)
/* 003C98 01DAF998 001B4424 */  addiu       $4, $2, %lo(CScript__2)
/* 003C9C 01DAF99C B8AF760C */  jal         Step__7CScriptFv
/* 003CA0 01DAF9A0 00000000 */   nop
/* 003CA4 01DAF9A4 C4BF760C */  jal         WaitKeyProcess__Fv
/* 003CA8 01DAF9A8 00000000 */   nop
/* 003CAC 01DAF9AC A8BE760C */  jal         SceneChange__Fv
/* 003CB0 01DAF9B0 00000000 */   nop
.L01DAF9B4_2B51B4:
/* 003CB4 01DAF9B4 24C0760C */  jal         MotionProcess__Fv
/* 003CB8 01DAF9B8 00000000 */   nop
/* 003CBC 01DAF9BC 14C1760C */  jal         SoundProcess__Fv
/* 003CC0 01DAF9C0 00000000 */   nop
/* 003CC4 01DAF9C4 E0C1760C */  jal         DrawProcess__Fv
/* 003CC8 01DAF9C8 00000000 */   nop
/* 003CCC 01DAF9CC 24988293 */  lbu         $2, -0x67DC($28)
/* 003CD0 01DAF9D0 18004010 */  beqz        $2, .L01DAFA34_2B5234
/* 003CD4 01DAF9D4 00000000 */   nop
/* 003CD8 01DAF9D8 2898828F */  lw          $2, -0x67D8($28)
/* 003CDC 01DAF9DC 80004128 */  slti        $1, $2, 0x80
/* 003CE0 01DAF9E0 05002010 */  beqz        $1, .L01DAF9F8_2B51F8
/* 003CE4 01DAF9E4 00000000 */   nop
/* 003CE8 01DAF9E8 01004224 */  addiu       $2, $2, 0x1
/* 003CEC 01DAF9EC 289882AF */  sw          $2, -0x67D8($28)
/* 003CF0 01DAF9F0 10000010 */  b           .L01DAFA34_2B5234
/* 003CF4 01DAF9F4 00000000 */   nop
.L01DAF9F8_2B51F8:
/* 003CF8 01DAF9F8 B4BF760C */  jal         SoundStop__Fv
/* 003CFC 01DAF9FC 00000000 */   nop
/* 003D00 01DAFA00 00608044 */  mtc1        $0, $f12
/* 003D04 01DAFA04 00000000 */  nop
/* 003D08 01DAFA08 46630046 */  mov.s       $f13, $f12
/* 003D0C 01DAFA0C 0043023C */  lui         $2, (0x43000000 >> 16)
/* 003D10 01DAFA10 00788244 */  mtc1        $2, $f15
/* 003D14 01DAFA14 86630046 */  mov.s       $f14, $f12
/* 003D18 01DAFA18 24B8040C */  jal         MGSetBGColor__Fffff
/* 003D1C 01DAFA1C 00000000 */   nop
/* 003D20 01DAFA20 D8C4760C */  jal         FadeCansel__Fv
/* 003D24 01DAFA24 00000000 */   nop
/* 003D28 01DAFA28 01000224 */  addiu       $2, $0, 0x1
/* 003D2C 01DAFA2C 16000010 */  b           .L01DAFA88_2B5288
/* 003D30 01DAFA30 00000000 */   nop
.L01DAFA34_2B5234:
/* 003D34 01DAFA34 DE01013C */  lui         $1, %hi(CScript__2 + 0x10)
/* 003D38 01DAFA38 101B2290 */  lbu         $2, %lo(CScript__2 + 0x10)($1)
/* 003D3C 01DAFA3C 0E004010 */  beqz        $2, .L01DAFA78_2B5278
/* 003D40 01DAFA40 00000000 */   nop
/* 003D44 01DAFA44 0043023C */  lui         $2, (0x43000000 >> 16)
/* 003D48 01DAFA48 00788244 */  mtc1        $2, $f15
/* 003D4C 01DAFA4C 00608044 */  mtc1        $0, $f12
/* 003D50 01DAFA50 00000000 */  nop
/* 003D54 01DAFA54 46630046 */  mov.s       $f13, $f12
/* 003D58 01DAFA58 86630046 */  mov.s       $f14, $f12
/* 003D5C 01DAFA5C 24B8040C */  jal         MGSetBGColor__Fffff
/* 003D60 01DAFA60 00000000 */   nop
/* 003D64 01DAFA64 D8C4760C */  jal         FadeCansel__Fv
/* 003D68 01DAFA68 00000000 */   nop
/* 003D6C 01DAFA6C 01000224 */  addiu       $2, $0, 0x1
/* 003D70 01DAFA70 05000010 */  b           .L01DAFA88_2B5288
/* 003D74 01DAFA74 00000000 */   nop
.L01DAFA78_2B5278:
/* 003D78 01DAFA78 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 003D7C 01DAFA7C C817050C */  jal         Step__6CSoundFv
/* 003D80 01DAFA80 00000000 */   nop
/* 003D84 01DAFA84 28160070 */  paddub      $2, $0, $0
.L01DAFA88_2B5288:
/* 003D88 01DAFA88 0000BF7B */  lq          $31, 0x0($29)
/* 003D8C 01DAFA8C 1000BD27 */  addiu       $29, $29, 0x10
/* 003D90 01DAFA90 0800E003 */  jr          $31
/* 003D94 01DAFA94 00000000 */   nop
/* 003D98 01DAFA98 00000000 */  nop
/* 003D9C 01DAFA9C 00000000 */  nop
