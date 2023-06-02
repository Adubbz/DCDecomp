.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_I_ARG__FP12RS_STACKDATAi
/* 96620 00196520 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 96624 00196524 1000BF7F */  sq         $31, 0x10($sp)
/* 96628 00196528 0000B07F */  sq         $16, 0x0($sp)
/* 9662C 0019652C 08009024 */  addiu      $16, $4, 0x8
/* 96630 00196530 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 96634 00196534 00000000 */   nop
/* 96638 00196538 04004004 */  bltz       $2, .L0019654C
/* 9663C 0019653C 00000000 */   nop
/* 96640 00196540 08004328 */  slti       $3, $2, 0x8
/* 96644 00196544 04006014 */  bnez       $3, .L00196558
/* 96648 00196548 00000000 */   nop
.L0019654C:
/* 9664C 0019654C 28160070 */  paddub     $2, $0, $0
/* 96650 00196550 0A000010 */  b          .L0019657C
/* 96654 00196554 00000000 */   nop
.L00196558:
/* 96658 00196558 28260072 */  paddub     $4, $16, $0
/* 9665C 0019655C 80180200 */  sll        $3, $2, 2
/* 96660 00196560 D401023C */  lui        $2, %hi(D_1D3D5D0)
/* 96664 00196564 D0D54224 */  addiu      $2, $2, %lo(D_1D3D5D0)
/* 96668 00196568 21104300 */  addu       $2, $2, $3
/* 9666C 0019656C 0000458C */  lw         $5, 0x0($2)
/* 96670 00196570 F828060C */  jal        SetStack__FP12RS_STACKDATAi
/* 96674 00196574 00000000 */   nop
/* 96678 00196578 01000224 */  addiu      $2, $0, 0x1
.L0019657C:
/* 9667C 0019657C 1000BF7B */  lq         $31, 0x10($sp)
/* 96680 00196580 0000B07B */  lq         $16, 0x0($sp)
/* 96684 00196584 2000BD27 */  addiu      $sp, $sp, 0x20
/* 96688 00196588 0800E003 */  jr         $31
/* 9668C 0019658C 00000000 */   nop