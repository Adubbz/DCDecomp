.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndGetAmbientDefaultVol__Fv
/* 5B3A0 0015B2A0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 5B3A4 0015B2A4 0000BF7F */  sq         $31, 0x0($sp)
/* 5B3A8 0015B2A8 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 5B3AC 0015B2AC D40E050C */  jal        GetMidiState__6CSoundFv
/* 5B3B0 0015B2B0 00000000 */   nop
/* 5B3B4 0015B2B4 208E838F */  lw         $3, -0x71E0($gp)
/* 5B3B8 0015B2B8 80180300 */  sll        $3, $3, 2
/* 5B3BC 0015B2BC 21104300 */  addu       $2, $2, $3
/* 5B3C0 0015B2C0 3001428C */  lw         $2, 0x130($2)
/* 5B3C4 0015B2C4 0B004010 */  beqz       $2, .L0015B2F4
/* 5B3C8 0015B2C8 00000000 */   nop
/* 5B3CC 0015B2CC 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 5B3D0 0015B2D0 D40E050C */  jal        GetMidiState__6CSoundFv
/* 5B3D4 0015B2D4 00000000 */   nop
/* 5B3D8 0015B2D8 208E838F */  lw         $3, -0x71E0($gp)
/* 5B3DC 0015B2DC 80180300 */  sll        $3, $3, 2
/* 5B3E0 0015B2E0 21104300 */  addu       $2, $2, $3
/* 5B3E4 0015B2E4 3001428C */  lw         $2, 0x130($2)
/* 5B3E8 0015B2E8 0C00428C */  lw         $2, 0xC($2)
/* 5B3EC 0015B2EC 02000010 */  b          .L0015B2F8
/* 5B3F0 0015B2F0 00000000 */   nop
.L0015B2F4:
/* 5B3F4 0015B2F4 40000224 */  addiu      $2, $0, 0x40
.L0015B2F8:
/* 5B3F8 0015B2F8 0000BF7B */  lq         $31, 0x0($sp)
/* 5B3FC 0015B2FC 1000BD27 */  addiu      $sp, $sp, 0x10
/* 5B400 0015B300 0800E003 */  jr         $31
/* 5B404 0015B304 00000000 */   nop
/* 5B408 0015B308 00000000 */  nop
/* 5B40C 0015B30C 00000000 */  nop
