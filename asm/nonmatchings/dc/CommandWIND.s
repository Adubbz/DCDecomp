.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandWIND__FPPv
/* 77530 00177430 0000838C */  lw         $3, 0x0($4)
/* 77534 00177434 000060C4 */  lwc1       $f0, 0x0($3)
/* 77538 00177438 C08F838F */  lw         $3, -0x7040($gp)
/* 7753C 0017743C 600060E4 */  swc1       $f0, 0x60($3)
/* 77540 00177440 0400838C */  lw         $3, 0x4($4)
/* 77544 00177444 000060C4 */  lwc1       $f0, 0x0($3)
/* 77548 00177448 C08F838F */  lw         $3, -0x7040($gp)
/* 7754C 0017744C 640060E4 */  swc1       $f0, 0x64($3)
/* 77550 00177450 0800838C */  lw         $3, 0x8($4)
/* 77554 00177454 000060C4 */  lwc1       $f0, 0x0($3)
/* 77558 00177458 C08F838F */  lw         $3, -0x7040($gp)
/* 7755C 0017745C 680060E4 */  swc1       $f0, 0x68($3)
/* 77560 00177460 0C00838C */  lw         $3, 0xC($4)
/* 77564 00177464 000060C4 */  lwc1       $f0, 0x0($3)
/* 77568 00177468 C08F838F */  lw         $3, -0x7040($gp)
/* 7756C 0017746C 6C0060E4 */  swc1       $f0, 0x6C($3)
/* 77570 00177470 0800E003 */  jr         $31
/* 77574 00177474 00000000 */   nop
/* 77578 00177478 00000000 */  nop
/* 7757C 0017747C 00000000 */  nop