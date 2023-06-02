.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdGetRYf__Fi
/* 69950 00169850 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 69954 00169854 0000BF7F */  sq         $31, 0x0($sp)
/* 69958 00169858 F0A5050C */  jal        check_key_mode__Fi
/* 6995C 0016985C 00000000 */   nop
/* 69960 00169860 07004010 */  beqz       $2, .L00169880
/* 69964 00169864 00000000 */   nop
/* 69968 00169868 CC01023C */  lui        $2, %hi(GamePad)
/* 6996C 0016986C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 69970 00169870 B4AD040C */  jal        GetRYf__8CGamePadFv
/* 69974 00169874 00000000 */   nop
/* 69978 00169878 02000010 */  b          .L00169884
/* 6997C 0016987C 00000000 */   nop
.L00169880:
/* 69980 00169880 00008044 */  mtc1       $0, $f0
.L00169884:
/* 69984 00169884 0000BF7B */  lq         $31, 0x0($sp)
/* 69988 00169888 1000BD27 */  addiu      $sp, $sp, 0x10
/* 6998C 0016988C 0800E003 */  jr         $31
/* 69990 00169890 00000000 */   nop
/* 69994 00169894 00000000 */  nop
/* 69998 00169898 00000000 */  nop
/* 6999C 0016989C 00000000 */  nop
