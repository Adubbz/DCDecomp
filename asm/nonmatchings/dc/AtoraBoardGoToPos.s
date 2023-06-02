.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AtoraBoardGoToPos__FPiii
/* 118D70 00218C70 0A000010 */  b          .L00218C9C
/* 118D74 00218C74 00000000 */   nop
.L00218C78:
/* 118D78 00218C78 80100500 */  sll        $2, $5, 2
/* 118D7C 00218C7C 21108200 */  addu       $2, $4, $2
/* 118D80 00218C80 0000428C */  lw         $2, 0x0($2)
/* 118D84 00218C84 04004010 */  beqz       $2, .L00218C98
/* 118D88 00218C88 00000000 */   nop
/* 118D8C 00218C8C 2816A070 */  paddub     $2, $5, $0
/* 118D90 00218C90 06000010 */  b          .L00218CAC
/* 118D94 00218C94 00000000 */   nop
.L00218C98:
/* 118D98 00218C98 FFFFA524 */  addiu      $5, $5, -0x1
.L00218C9C:
/* 118D9C 00218C9C 2A10C500 */  slt        $2, $6, $5
/* 118DA0 00218CA0 F5FF4014 */  bnez       $2, .L00218C78
/* 118DA4 00218CA4 00000000 */   nop
/* 118DA8 00218CA8 2816A070 */  paddub     $2, $5, $0
.L00218CAC:
/* 118DAC 00218CAC 0800E003 */  jr         $31
/* 118DB0 00218CB0 00000000 */   nop
/* 118DB4 00218CB4 00000000 */  nop
/* 118DB8 00218CB8 00000000 */  nop
/* 118DBC 00218CBC 00000000 */  nop
