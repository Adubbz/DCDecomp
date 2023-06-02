.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetWait__12CNPCharacterFi
/* 56510 00156410 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 56514 00156414 1000BF7F */  sq         $31, 0x10($sp)
/* 56518 00156418 0000B07F */  sq         $16, 0x0($sp)
/* 5651C 0015641C 2886A070 */  paddub     $16, $5, $0
/* 56520 00156420 1C59050C */  jal        GetNextSeq__12CNPCharacterFv
/* 56524 00156424 00000000 */   nop
/* 56528 00156428 02000324 */  addiu      $3, $0, 0x2
/* 5652C 0015642C 000043AC */  sw         $3, 0x0($2)
/* 56530 00156430 040050AC */  sw         $16, 0x4($2)
/* 56534 00156434 01000224 */  addiu      $2, $0, 0x1
/* 56538 00156438 1000BF7B */  lq         $31, 0x10($sp)
/* 5653C 0015643C 0000B07B */  lq         $16, 0x0($sp)
/* 56540 00156440 2000BD27 */  addiu      $sp, $sp, 0x20
/* 56544 00156444 0800E003 */  jr         $31
/* 56548 00156448 00000000 */   nop
/* 5654C 0015644C 00000000 */  nop
