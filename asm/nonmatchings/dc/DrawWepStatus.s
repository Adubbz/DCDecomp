.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawWepStatus__FiiP11WEAPON_HAVEii
/* F92F0 001F91F0 80FFBD27 */  addiu      $sp, $sp, -0x80
/* F92F4 001F91F4 4000BF7F */  sq         $31, 0x40($sp)
/* F92F8 001F91F8 3000B37F */  sq         $19, 0x30($sp)
/* F92FC 001F91FC 2000B27F */  sq         $18, 0x20($sp)
/* F9300 001F9200 1000B17F */  sq         $17, 0x10($sp)
/* F9304 001F9204 0000B07F */  sq         $16, 0x0($sp)
/* F9308 001F9208 289E8070 */  paddub     $19, $4, $0
/* F930C 001F920C 2896A070 */  paddub     $18, $5, $0
/* F9310 001F9210 288EC070 */  paddub     $17, $6, $0
/* F9314 001F9214 28860071 */  paddub     $16, $8, $0
/* F9318 001F9218 281E0070 */  paddub     $3, $0, $0
/* F931C 001F921C 0200E010 */  beqz       $7, .L001F9228
/* F9320 001F9220 00000000 */   nop
/* F9324 001F9224 34006324 */  addiu      $3, $3, 0x34
.L001F9228:
/* F9328 001F9228 D4000224 */  addiu      $2, $0, 0xD4
/* F932C 001F922C 7000A2AF */  sw         $2, 0x70($sp)
/* F9330 001F9230 7400A3AF */  sw         $3, 0x74($sp)
/* F9334 001F9234 AC000324 */  addiu      $3, $0, 0xAC
/* F9338 001F9238 7800A3AF */  sw         $3, 0x78($sp)
/* F933C 001F923C 34000224 */  addiu      $2, $0, 0x34
/* F9340 001F9240 7C00A2AF */  sw         $2, 0x7C($sp)
/* F9344 001F9244 6000B3AF */  sw         $19, 0x60($sp)
/* F9348 001F9248 01004226 */  addiu      $2, $18, 0x1
/* F934C 001F924C 6400A2AF */  sw         $2, 0x64($sp)
/* F9350 001F9250 6800A3AF */  sw         $3, 0x68($sp)
/* F9354 001F9254 33000224 */  addiu      $2, $0, 0x33
/* F9358 001F9258 6C00A2AF */  sw         $2, 0x6C($sp)
/* F935C 001F925C 2C95848F */  lw         $4, -0x6AD4($gp)
/* F9360 001F9260 6000A527 */  addiu      $5, $sp, 0x60
/* F9364 001F9264 7000A627 */  addiu      $6, $sp, 0x70
/* F9368 001F9268 283E0072 */  paddub     $7, $16, $0
/* F936C 001F926C C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* F9370 001F9270 00000000 */   nop
/* F9374 001F9274 2900023C */  lui        $2, %hi(_1717)
/* F9378 001F9278 30304224 */  addiu      $2, $2, %lo(_1717)
/* F937C 001F927C 5000A427 */  addiu      $4, $sp, 0x50
/* F9380 001F9280 00004278 */  lq         $2, 0x0($2)
/* F9384 001F9284 0000827C */  sq         $2, 0x0($4)
/* F9388 001F9288 3E006226 */  addiu      $2, $19, 0x3E
/* F938C 001F928C 5000A2AF */  sw         $2, 0x50($sp)
/* F9390 001F9290 0F004226 */  addiu      $2, $18, 0xF
/* F9394 001F9294 5400A2AF */  sw         $2, 0x54($sp)
/* F9398 001F9298 282E2072 */  paddub     $5, $17, $0
/* F939C 001F929C 28360072 */  paddub     $6, $16, $0
/* F93A0 001F92A0 4CE3070C */  jal        DrawWepDamageDraw__F4RECTP11WEAPON_HAVEi
/* F93A4 001F92A4 00000000 */   nop
/* F93A8 001F92A8 4000BF7B */  lq         $31, 0x40($sp)
/* F93AC 001F92AC 3000B37B */  lq         $19, 0x30($sp)
/* F93B0 001F92B0 2000B27B */  lq         $18, 0x20($sp)
/* F93B4 001F92B4 1000B17B */  lq         $17, 0x10($sp)
/* F93B8 001F92B8 0000B07B */  lq         $16, 0x0($sp)
/* F93BC 001F92BC 8000BD27 */  addiu      $sp, $sp, 0x80
/* F93C0 001F92C0 0800E003 */  jr         $31
/* F93C4 001F92C4 00000000 */   nop
/* F93C8 001F92C8 00000000 */  nop
/* F93CC 001F92CC 00000000 */  nop
