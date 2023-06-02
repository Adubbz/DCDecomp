.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ExitDunEnterMenu__Fv
/* 126620 00226520 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 126624 00226524 0000BF7F */  sq         $31, 0x0($sp)
/* 126628 00226528 CC01023C */  lui        $2, %hi(GamePad)
/* 12662C 0022652C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 126630 00226530 3CAE040C */  jal        AutoRepeatOff__8CGamePadFv
/* 126634 00226534 00000000 */   nop
/* 126638 00226538 CC01023C */  lui        $2, %hi(GamePad)
/* 12663C 0022653C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 126640 00226540 4CAE040C */  jal        MenuModeOff__8CGamePadFv
/* 126644 00226544 00000000 */   nop
/* 126648 00226548 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12664C 0022654C 8D8B2480 */  lb         $4, -0x7473($at)
/* 126650 00226550 38B4080C */  jal        MenuTextureReload__Fi
/* 126654 00226554 00000000 */   nop
/* 126658 00226558 68A9080C */  jal        DngActiveItemTextureCopy__Fv
/* 12665C 0022655C 00000000 */   nop
/* 126660 00226560 ACA9080C */  jal        DngActiveWeaponTextureCopy__Fv
/* 126664 00226564 00000000 */   nop
/* 126668 00226568 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12666C 0022656C 8D8B2580 */  lb         $5, -0x7473($at)
/* 126670 00226570 C701023C */  lui        $2, %hi(TexManager)
/* 126674 00226574 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 126678 00226578 C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* 12667C 0022657C 00000000 */   nop
/* 126680 00226580 0000BF7B */  lq         $31, 0x0($sp)
/* 126684 00226584 1000BD27 */  addiu      $sp, $sp, 0x10
/* 126688 00226588 0800E003 */  jr         $31
/* 12668C 0022658C 00000000 */   nop
