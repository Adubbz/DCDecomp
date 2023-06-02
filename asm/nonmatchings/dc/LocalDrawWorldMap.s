.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LocalDrawWorldMap__Fv
/* 10A470 0020A370 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 10A474 0020A374 0000BF7F */  sq         $31, 0x0($sp)
/* 10A478 0020A378 D901023C */  lui        $2, %hi(MenuCharaFrame)
/* 10A47C 0020A37C 80044424 */  addiu      $4, $2, %lo(MenuCharaFrame)
/* 10A480 0020A380 DC828CC7 */  lwc1       $f12, -0x7D24($gp)
/* 10A484 0020A384 46630046 */  mov.s      $f13, $f12
/* 10A488 0020A388 86630046 */  mov.s      $f14, $f12
/* 10A48C 0020A38C 94E4040C */  jal        SetScale__10CCharacterFfff
/* 10A490 0020A390 00000000 */   nop
/* 10A494 0020A394 D901023C */  lui        $2, %hi(MenuCharaFrame)
/* 10A498 0020A398 80044424 */  addiu      $4, $2, %lo(MenuCharaFrame)
/* 10A49C 0020A39C 2900023C */  lui        $2, %hi(mapo)
/* 10A4A0 0020A3A0 C0364524 */  addiu      $5, $2, %lo(mapo)
/* 10A4A4 0020A3A4 38E4040C */  jal        SetPosition__10CCharacterFPf
/* 10A4A8 0020A3A8 00000000 */   nop
/* 10A4AC 0020A3AC D901023C */  lui        $2, %hi(MenuCharaFrame)
/* 10A4B0 0020A3B0 80044424 */  addiu      $4, $2, %lo(MenuCharaFrame)
/* 10A4B4 0020A3B4 4CE1040C */  jal        Step__10CCharacterFv
/* 10A4B8 0020A3B8 00000000 */   nop
/* 10A4BC 0020A3BC D901023C */  lui        $2, %hi(MenuCharaFrame)
/* 10A4C0 0020A3C0 80044424 */  addiu      $4, $2, %lo(MenuCharaFrame)
/* 10A4C4 0020A3C4 C4E4040C */  jal        Draw__10CCharacterFv
/* 10A4C8 0020A3C8 00000000 */   nop
/* 10A4CC 0020A3CC 0000BF7B */  lq         $31, 0x0($sp)
/* 10A4D0 0020A3D0 1000BD27 */  addiu      $sp, $sp, 0x10
/* 10A4D4 0020A3D4 0800E003 */  jr         $31
/* 10A4D8 0020A3D8 00000000 */   nop
/* 10A4DC 0020A3DC 00000000 */  nop
