.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdOutPutFile__Fv
/* 70450 00170350 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 70454 00170354 1000BF7F */  sq         $31, 0x10($sp)
/* 70458 00170358 0000B07F */  sq         $16, 0x0($sp)
/* 7045C 0017035C 3487838F */  lw         $3, -0x78CC($gp)
/* 70460 00170360 15006010 */  beqz       $3, .L001703B8
/* 70464 00170364 00000000 */   nop
/* 70468 00170368 508F838F */  lw         $3, -0x70B0($gp)
/* 7046C 0017036C 12006010 */  beqz       $3, .L001703B8
/* 70470 00170370 00000000 */   nop
/* 70474 00170374 2A00023C */  lui        $2, %hi(_369_2)
/* 70478 00170378 70A24424 */  addiu      $4, $2, %lo(_369_2)
/* 7047C 0017037C 02060524 */  addiu      $5, $0, 0x602
/* 70480 00170380 865F040C */  jal        sceOpen
/* 70484 00170384 00000000 */   nop
/* 70488 00170388 28864070 */  paddub     $16, $2, $0
/* 7048C 0017038C 0A000006 */  bltz       $16, .L001703B8
/* 70490 00170390 00000000 */   nop
/* 70494 00170394 508F828F */  lw         $2, -0x70B0($gp)
/* 70498 00170398 28260072 */  paddub     $4, $16, $0
/* 7049C 0017039C 1C004524 */  addiu      $5, $2, 0x1C
/* 704A0 001703A0 1800468C */  lw         $6, 0x18($2)
/* 704A4 001703A4 1861040C */  jal        sceWrite
/* 704A8 001703A8 00000000 */   nop
/* 704AC 001703AC 28260072 */  paddub     $4, $16, $0
/* 704B0 001703B0 F65F040C */  jal        sceClose
/* 704B4 001703B4 00000000 */   nop
.L001703B8:
/* 704B8 001703B8 1000BF7B */  lq         $31, 0x10($sp)
/* 704BC 001703BC 0000B07B */  lq         $16, 0x0($sp)
/* 704C0 001703C0 2000BD27 */  addiu      $sp, $sp, 0x20
/* 704C4 001703C4 0800E003 */  jr         $31
/* 704C8 001703C8 00000000 */   nop
/* 704CC 001703CC 00000000 */  nop