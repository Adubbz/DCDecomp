.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ExitNameEnterFunc__Fv
/* 138730 00238630 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 138734 00238634 0000BF7F */  sq         $31, 0x0($sp)
/* 138738 00238638 1800A427 */  addiu      $4, $sp, 0x18
/* 13873C 0023863C 088A82DF */  ld         $2, -0x75F8($gp)
/* 138740 00238640 000082FC */  sd         $2, 0x0($4)
/* 138744 00238644 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 138748 00238648 66BC2284 */  lh         $2, -0x439A($at)
/* 13874C 0023864C 1800A2AF */  sw         $2, 0x18($sp)
/* 138750 00238650 4CB4080C */  jal        MenuTextureDelete__FPi
/* 138754 00238654 00000000 */   nop
/* 138758 00238658 C701023C */  lui        $2, %hi(TexManager)
/* 13875C 0023865C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 138760 00238660 98CE040C */  jal        CleanUpTextureList__15CTextureManagerFv
/* 138764 00238664 00000000 */   nop
/* 138768 00238668 CC01023C */  lui        $2, %hi(GamePad)
/* 13876C 0023866C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 138770 00238670 3CAE040C */  jal        AutoRepeatOff__8CGamePadFv
/* 138774 00238674 00000000 */   nop
/* 138778 00238678 CC01023C */  lui        $2, %hi(GamePad)
/* 13877C 0023867C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 138780 00238680 4CAE040C */  jal        MenuModeOff__8CGamePadFv
/* 138784 00238684 00000000 */   nop
/* 138788 00238688 0000BF7B */  lq         $31, 0x0($sp)
/* 13878C 0023868C 2000BD27 */  addiu      $sp, $sp, 0x20
/* 138790 00238690 0800E003 */  jr         $31
/* 138794 00238694 00000000 */   nop
/* 138798 00238698 00000000 */  nop
/* 13879C 0023869C 00000000 */  nop
