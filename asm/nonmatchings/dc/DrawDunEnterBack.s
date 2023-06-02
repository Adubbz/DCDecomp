.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawDunEnterBack__Fi
/* 128450 00228350 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 128454 00228354 1000BF7F */  sq         $31, 0x10($sp)
/* 128458 00228358 0000B07F */  sq         $16, 0x0($sp)
/* 12845C 0022835C 28868070 */  paddub     $16, $4, $0
/* 128460 00228360 C701023C */  lui        $2, %hi(TexManager)
/* 128464 00228364 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 128468 00228368 2A00023C */  lui        $2, %hi(_1255_2)
/* 12846C 0022836C 60EF4524 */  addiu      $5, $2, %lo(_1255_2)
/* 128470 00228370 FFFF0624 */  addiu      $6, $0, -0x1
/* 128474 00228374 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 128478 00228378 00000000 */   nop
/* 12847C 0022837C 28264070 */  paddub     $4, $2, $0
/* 128480 00228380 DA01023C */  lui        $2, %hi(MenuDispRc)
/* 128484 00228384 906A4524 */  addiu      $5, $2, %lo(MenuDispRc)
/* 128488 00228388 DA01023C */  lui        $2, %hi(MenuDispRc)
/* 12848C 0022838C 906A4624 */  addiu      $6, $2, %lo(MenuDispRc)
/* 128490 00228390 80000724 */  addiu      $7, $0, 0x80
/* 128494 00228394 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 128498 00228398 00000000 */   nop
/* 12849C 0022839C 2000A0AF */  sw         $0, 0x20($sp)
/* 1284A0 002283A0 2400A0AF */  sw         $0, 0x24($sp)
/* 1284A4 002283A4 00280224 */  addiu      $2, $0, 0x2800
/* 1284A8 002283A8 2800A2AF */  sw         $2, 0x28($sp)
/* 1284AC 002283AC 001C0224 */  addiu      $2, $0, 0x1C00
/* 1284B0 002283B0 2C00A2AF */  sw         $2, 0x2C($sp)
/* 1284B4 002283B4 80101000 */  sll        $2, $16, 2
/* 1284B8 002283B8 C3110200 */  sra        $2, $2, 7
/* 1284BC 002283BC FF004830 */  andi       $8, $2, 0xFF
/* 1284C0 002283C0 2000A427 */  addiu      $4, $sp, 0x20
/* 1284C4 002283C4 0A000524 */  addiu      $5, $0, 0xA
/* 1284C8 002283C8 2836A070 */  paddub     $6, $5, $0
/* 1284CC 002283CC 283EA070 */  paddub     $7, $5, $0
/* 1284D0 002283D0 9CBE040C */  jal        MGFillBox__FRC8CRect_i_UcUcUcUc
/* 1284D4 002283D4 00000000 */   nop
/* 1284D8 002283D8 1000BF7B */  lq         $31, 0x10($sp)
/* 1284DC 002283DC 0000B07B */  lq         $16, 0x0($sp)
/* 1284E0 002283E0 3000BD27 */  addiu      $sp, $sp, 0x30
/* 1284E4 002283E4 0800E003 */  jr         $31
/* 1284E8 002283E8 00000000 */   nop
/* 1284EC 002283EC 00000000 */  nop
