.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetMainMenuRightHelpMsgLangOffset__FRiRi
/* 12E4C0 0022E3C0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 12E4C4 0022E3C4 2000BF7F */  sq         $31, 0x20($sp)
/* 12E4C8 0022E3C8 1000B17F */  sq         $17, 0x10($sp)
/* 12E4CC 0022E3CC 0000B07F */  sq         $16, 0x0($sp)
/* 12E4D0 0022E3D0 288E8070 */  paddub     $17, $4, $0
/* 12E4D4 0022E3D4 2886A070 */  paddub     $16, $5, $0
/* 12E4D8 0022E3D8 2900023C */  lui        $2, %hi(_998_2)
/* 12E4DC 0022E3DC 60554224 */  addiu      $2, $2, %lo(_998_2)
/* 12E4E0 0022E3E0 3000A427 */  addiu      $4, $sp, 0x30
/* 12E4E4 0022E3E4 000043DC */  ld         $3, 0x0($2)
/* 12E4E8 0022E3E8 080040C4 */  lwc1       $f0, 0x8($2)
/* 12E4EC 0022E3EC 0C004284 */  lh         $2, 0xC($2)
/* 12E4F0 0022E3F0 000083FC */  sd         $3, 0x0($4)
/* 12E4F4 0022E3F4 080080E4 */  swc1       $f0, 0x8($4)
/* 12E4F8 0022E3F8 0C0082A4 */  sh         $2, 0xC($4)
/* 12E4FC 0022E3FC 80AE080C */  jal        GetMenuLangFlag__Fv
/* 12E500 0022E400 00000000 */   nop
/* 12E504 0022E404 40100200 */  sll        $2, $2, 1
/* 12E508 0022E408 21185D00 */  addu       $3, $2, $sp
/* 12E50C 0022E40C 30006280 */  lb         $2, 0x30($3)
/* 12E510 0022E410 000022AE */  sw         $2, 0x0($17)
/* 12E514 0022E414 31006280 */  lb         $2, 0x31($3)
/* 12E518 0022E418 000002AE */  sw         $2, 0x0($16)
/* 12E51C 0022E41C 01000224 */  addiu      $2, $0, 0x1
/* 12E520 0022E420 2000BF7B */  lq         $31, 0x20($sp)
/* 12E524 0022E424 1000B17B */  lq         $17, 0x10($sp)
/* 12E528 0022E428 0000B07B */  lq         $16, 0x0($sp)
/* 12E52C 0022E42C 4000BD27 */  addiu      $sp, $sp, 0x40
/* 12E530 0022E430 0800E003 */  jr         $31
/* 12E534 0022E434 00000000 */   nop
/* 12E538 0022E438 00000000 */  nop
/* 12E53C 0022E43C 00000000 */  nop
