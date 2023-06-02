.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdDDrawFont__Fv
/* 70370 00170270 80FFBD27 */  addiu      $sp, $sp, -0x80
/* 70374 00170274 0000BF7F */  sq         $31, 0x0($sp)
/* 70378 00170278 588F8383 */  lb         $3, -0x70A8($gp)
/* 7037C 0017027C 04006014 */  bnez       $3, .L00170290
/* 70380 00170280 00000000 */   nop
/* 70384 00170284 548F80AF */  sw         $0, -0x70AC($gp)
/* 70388 00170288 01000324 */  addiu      $3, $0, 0x1
/* 7038C 0017028C 588F83A3 */  sb         $3, -0x70A8($gp)
.L00170290:
/* 70390 00170290 508F838F */  lw         $3, -0x70B0($gp)
/* 70394 00170294 1E006010 */  beqz       $3, .L00170310
/* 70398 00170298 00000000 */   nop
/* 7039C 0017029C 548F868F */  lw         $6, -0x70AC($gp)
/* 703A0 001702A0 0100C224 */  addiu      $2, $6, 0x1
/* 703A4 001702A4 548F82AF */  sw         $2, -0x70AC($gp)
/* 703A8 001702A8 1000A427 */  addiu      $4, $sp, 0x10
/* 703AC 001702AC 2A00023C */  lui        $2, %hi(_353_2)
/* 703B0 001702B0 68A24524 */  addiu      $5, $2, %lo(_353_2)
/* 703B4 001702B4 1614040C */  jal        sprintf
/* 703B8 001702B8 00000000 */   nop
/* 703BC 001702BC 1000A427 */  addiu      $4, $sp, 0x10
/* 703C0 001702C0 44C1050C */  jal        EdDPrint__FPc
/* 703C4 001702C4 00000000 */   nop
/* 703C8 001702C8 3487838F */  lw         $3, -0x78CC($gp)
/* 703CC 001702CC 05006014 */  bnez       $3, .L001702E4
/* 703D0 001702D0 00000000 */   nop
/* 703D4 001702D4 508F838F */  lw         $3, -0x70B0($gp)
/* 703D8 001702D8 180060AC */  sw         $0, 0x18($3)
/* 703DC 001702DC 0C000010 */  b          .L00170310
/* 703E0 001702E0 00000000 */   nop
.L001702E4:
/* 703E4 001702E4 A0B8040C */  jal        GetVif1Packet__Fv
/* 703E8 001702E8 00000000 */   nop
/* 703EC 001702EC C701033C */  lui        $3, %hi(TexManager)
/* 703F0 001702F0 70586424 */  addiu      $4, $3, %lo(TexManager)
/* 703F4 001702F4 282E4070 */  paddub     $5, $2, $0
/* 703F8 001702F8 1F000624 */  addiu      $6, $0, 0x1F
/* 703FC 001702FC 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 70400 00170300 00000000 */   nop
/* 70404 00170304 508F848F */  lw         $4, -0x70B0($gp)
/* 70408 00170308 D0F7040C */  jal        Draw__10CDebugFontFv
/* 7040C 0017030C 00000000 */   nop
.L00170310:
/* 70410 00170310 0000BF7B */  lq         $31, 0x0($sp)
/* 70414 00170314 8000BD27 */  addiu      $sp, $sp, 0x80
/* 70418 00170318 0800E003 */  jr         $31
/* 7041C 0017031C 00000000 */   nop
