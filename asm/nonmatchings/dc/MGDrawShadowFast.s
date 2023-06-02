.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MGDrawShadowFast__FP6CFramePfPf
/* 304B0 001303B0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 304B4 001303B4 2000BF7F */  sq         $31, 0x20($sp)
/* 304B8 001303B8 1000B17F */  sq         $17, 0x10($sp)
/* 304BC 001303BC 0000B07F */  sq         $16, 0x0($sp)
/* 304C0 001303C0 28868070 */  paddub     $16, $4, $0
/* 304C4 001303C4 288EC070 */  paddub     $17, $6, $0
/* 304C8 001303C8 3B000012 */  beqz       $16, .L001304B8
/* 304CC 001303CC 00000000 */   nop
/* 304D0 001303D0 C701023C */  lui        $2, %hi(D_1C757D0)
/* 304D4 001303D4 D0574424 */  addiu      $4, $2, %lo(D_1C757D0)
/* 304D8 001303D8 0C86040C */  jal        sceVu0CopyVector
/* 304DC 001303DC 00000000 */   nop
/* 304E0 001303E0 C701023C */  lui        $2, %hi(D_1C757E0)
/* 304E4 001303E4 E0574424 */  addiu      $4, $2, %lo(D_1C757E0)
/* 304E8 001303E8 282E2072 */  paddub     $5, $17, $0
/* 304EC 001303EC 0C86040C */  jal        sceVu0CopyVector
/* 304F0 001303F0 00000000 */   nop
/* 304F4 001303F4 3000A427 */  addiu      $4, $sp, 0x30
/* 304F8 001303F8 F08B82DF */  ld         $2, -0x7410($gp)
/* 304FC 001303FC 000082FC */  sd         $2, 0x0($4)
/* 30500 00130400 3800A327 */  addiu      $3, $sp, 0x38
/* 30504 00130404 E88B82DF */  ld         $2, -0x7418($gp)
/* 30508 00130408 000062FC */  sd         $2, 0x0($3)
/* 3050C 0013040C 3400A593 */  lbu        $5, 0x34($sp)
/* 30510 00130410 01000364 */  daddiu     $3, $0, 0x1
/* 30514 00130414 FEFF0224 */  addiu      $2, $0, -0x2
/* 30518 00130418 2410A200 */  and        $2, $5, $2
/* 3051C 0013041C 25104300 */  or         $2, $2, $3
/* 30520 00130420 3400A2A3 */  sb         $2, 0x34($sp)
/* 30524 00130424 B0BB040C */  jal        MGSetGsZBUF__FP9sceGsZbuf
/* 30528 00130428 00000000 */   nop
/* 3052C 0013042C 3800A493 */  lbu        $4, 0x38($sp)
/* 30530 00130430 01000330 */  andi       $3, $0, 0x1
/* 30534 00130434 FEFF0224 */  addiu      $2, $0, -0x2
/* 30538 00130438 24108200 */  and        $2, $4, $2
/* 3053C 0013043C 25104300 */  or         $2, $2, $3
/* 30540 00130440 3800A2A3 */  sb         $2, 0x38($sp)
/* 30544 00130444 3900A493 */  lbu        $4, 0x39($sp)
/* 30548 00130448 80190300 */  sll        $3, $3, 6
/* 3054C 0013044C BFFF0224 */  addiu      $2, $0, -0x41
/* 30550 00130450 24108200 */  and        $2, $4, $2
/* 30554 00130454 25104300 */  or         $2, $2, $3
/* 30558 00130458 3900A2A3 */  sb         $2, 0x39($sp)
/* 3055C 0013045C 3800A427 */  addiu      $4, $sp, 0x38
/* 30560 00130460 7CBB040C */  jal        MGSetGsTEST__FP9sceGsTest
/* 30564 00130464 00000000 */   nop
/* 30568 00130468 2500023C */  lui        $2, %hi(D_00249900)
/* 3056C 0013046C 00994524 */  addiu      $5, $2, %lo(D_00249900)
/* 30570 00130470 D48B848F */  lw         $4, -0x742C($gp)
/* 30574 00130474 28360070 */  paddub     $6, $0, $0
/* 30578 00130478 5C83040C */  jal        sceVif1PkCall
/* 3057C 0013047C 00000000 */   nop
/* 30580 00130480 01000224 */  addiu      $2, $0, 0x1
/* 30584 00130484 C701013C */  lui        $at, (0x1C75840 >> 16)
/* 30588 00130488 405822AC */  sw         $2, (0x1C75840 & 0xFFFF)($at)
/* 3058C 0013048C 28260072 */  paddub     $4, $16, $0
/* 30590 00130490 60BB040C */  jal        MGDraw__FP6CFrame
/* 30594 00130494 00000000 */   nop
/* 30598 00130498 C701013C */  lui        $at, (0x1C75840 >> 16)
/* 3059C 0013049C 405820AC */  sw         $0, (0x1C75840 & 0xFFFF)($at)
/* 305A0 001304A0 2400023C */  lui        $2, %hi(D_00246100)
/* 305A4 001304A4 00614524 */  addiu      $5, $2, %lo(D_00246100)
/* 305A8 001304A8 D48B848F */  lw         $4, -0x742C($gp)
/* 305AC 001304AC 28360070 */  paddub     $6, $0, $0
/* 305B0 001304B0 5C83040C */  jal        sceVif1PkCall
/* 305B4 001304B4 00000000 */   nop
.L001304B8:
/* 305B8 001304B8 2000BF7B */  lq         $31, 0x20($sp)
/* 305BC 001304BC 1000B17B */  lq         $17, 0x10($sp)
/* 305C0 001304C0 0000B07B */  lq         $16, 0x0($sp)
/* 305C4 001304C4 4000BD27 */  addiu      $sp, $sp, 0x40
/* 305C8 001304C8 0800E003 */  jr         $31
/* 305CC 001304CC 00000000 */   nop
