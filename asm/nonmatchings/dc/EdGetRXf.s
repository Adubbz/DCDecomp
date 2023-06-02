.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdGetRXf__Fi
/* 69900 00169800 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 69904 00169804 0000BF7F */  sq         $31, 0x0($sp)
/* 69908 00169808 F0A5050C */  jal        check_key_mode__Fi
/* 6990C 0016980C 00000000 */   nop
/* 69910 00169810 07004010 */  beqz       $2, .L00169830
/* 69914 00169814 00000000 */   nop
/* 69918 00169818 CC01023C */  lui        $2, %hi(GamePad)
/* 6991C 0016981C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 69920 00169820 A4AD040C */  jal        GetRXf__8CGamePadFv
/* 69924 00169824 00000000 */   nop
/* 69928 00169828 02000010 */  b          .L00169834
/* 6992C 0016982C 00000000 */   nop
.L00169830:
/* 69930 00169830 00008044 */  mtc1       $0, $f0
.L00169834:
/* 69934 00169834 0000BF7B */  lq         $31, 0x0($sp)
/* 69938 00169838 1000BD27 */  addiu      $sp, $sp, 0x10
/* 6993C 0016983C 0800E003 */  jr         $31
/* 69940 00169840 00000000 */   nop
/* 69944 00169844 00000000 */  nop
/* 69948 00169848 00000000 */  nop
/* 6994C 0016984C 00000000 */  nop
