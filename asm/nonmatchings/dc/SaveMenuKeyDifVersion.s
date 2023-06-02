.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SaveMenuKeyDifVersion__Fv
/* 1222F0 002221F0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 1222F4 002221F4 0000BF7F */  sq         $31, 0x0($sp)
/* 1222F8 002221F8 CC01023C */  lui        $2, %hi(GamePad)
/* 1222FC 002221FC 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 122300 00222200 F0000524 */  addiu      $5, $0, 0xF0
/* 122304 00222204 1CAE040C */  jal        Down__8CGamePadFi
/* 122308 00222208 00000000 */   nop
/* 12230C 0022220C 0A004010 */  beqz       $2, .L00222238
/* 122310 00222210 00000000 */   nop
/* 122314 00222214 DB01023C */  lui        $2, %hi(McAccess)
/* 122318 00222218 80824424 */  addiu      $4, $2, %lo(McAccess)
/* 12231C 0022221C 07000524 */  addiu      $5, $0, 0x7
/* 122320 00222220 E44E080C */  jal        SetFuncNo__17CMemoryCardAccessFi
/* 122324 00222224 00000000 */   nop
/* 122328 00222228 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12232C 0022222C 8482228C */  lw         $2, -0x7D7C($at)
/* 122330 00222230 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 122334 00222234 848222AC */  sw         $2, -0x7D7C($at)
.L00222238:
/* 122338 00222238 01000224 */  addiu      $2, $0, 0x1
/* 12233C 0022223C 0000BF7B */  lq         $31, 0x0($sp)
/* 122340 00222240 1000BD27 */  addiu      $sp, $sp, 0x10
/* 122344 00222244 0800E003 */  jr         $31
/* 122348 00222248 00000000 */   nop
/* 12234C 0022224C 00000000 */  nop
