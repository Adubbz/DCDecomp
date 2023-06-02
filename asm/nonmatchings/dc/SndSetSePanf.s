.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndSetSePanf__Fifi
/* 5AC10 0015AB10 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 5AC14 0015AB14 3000BF7F */  sq         $31, 0x30($sp)
/* 5AC18 0015AB18 2000B27F */  sq         $18, 0x20($sp)
/* 5AC1C 0015AB1C 1000B17F */  sq         $17, 0x10($sp)
/* 5AC20 0015AB20 0000B07F */  sq         $16, 0x0($sp)
/* 5AC24 0015AB24 28968070 */  paddub     $18, $4, $0
/* 5AC28 0015AB28 288EA070 */  paddub     $17, $5, $0
/* 5AC2C 0015AB2C 2C68050C */  jal        GetSeInfo__Fi
/* 5AC30 0015AB30 00000000 */   nop
/* 5AC34 0015AB34 28864070 */  paddub     $16, $2, $0
/* 5AC38 0015AB38 0E000012 */  beqz       $16, .L0015AB74
/* 5AC3C 0015AB3C 00000000 */   nop
/* 5AC40 0015AB40 8C6A050C */  jal        SndGetPanf__Ff
/* 5AC44 0015AB44 00000000 */   nop
/* 5AC48 0015AB48 28464070 */  paddub     $8, $2, $0
/* 5AC4C 0015AB4C 28264072 */  paddub     $4, $18, $0
/* 5AC50 0015AB50 8068050C */  jal        GetPortNo__Fi
/* 5AC54 0015AB54 00000000 */   nop
/* 5AC58 0015AB58 00000682 */  lb         $6, 0x0($16)
/* 5AC5C 0015AB5C 01000782 */  lb         $7, 0x1($16)
/* 5AC60 0015AB60 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 5AC64 0015AB64 282E4070 */  paddub     $5, $2, $0
/* 5AC68 0015AB68 284E2072 */  paddub     $9, $17, $0
/* 5AC6C 0015AB6C 6416050C */  jal        SE_SetPan__6CSoundFiiiii
/* 5AC70 0015AB70 00000000 */   nop
.L0015AB74:
/* 5AC74 0015AB74 3000BF7B */  lq         $31, 0x30($sp)
/* 5AC78 0015AB78 2000B27B */  lq         $18, 0x20($sp)
/* 5AC7C 0015AB7C 1000B17B */  lq         $17, 0x10($sp)
/* 5AC80 0015AB80 0000B07B */  lq         $16, 0x0($sp)
/* 5AC84 0015AB84 4000BD27 */  addiu      $sp, $sp, 0x40
/* 5AC88 0015AB88 0800E003 */  jr         $31
/* 5AC8C 0015AB8C 00000000 */   nop
