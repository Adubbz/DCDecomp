.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetMenuCommonPutXY__FP6ClsMesi
/* 12C1D0 0022C0D0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 12C1D4 0022C0D4 2000BF7F */  sq         $31, 0x20($sp)
/* 12C1D8 0022C0D8 1000B17F */  sq         $17, 0x10($sp)
/* 12C1DC 0022C0DC 0000B07F */  sq         $16, 0x0($sp)
/* 12C1E0 0022C0E0 288E8070 */  paddub     $17, $4, $0
/* 12C1E4 0022C0E4 04002016 */  bnez       $17, .L0022C0F8
/* 12C1E8 0022C0E8 00000000 */   nop
/* 12C1EC 0022C0EC 28160070 */  paddub     $2, $0, $0
/* 12C1F0 0022C0F0 0A000010 */  b          .L0022C11C
/* 12C1F4 0022C0F4 00000000 */   nop
.L0022C0F8:
/* 12C1F8 0022C0F8 2886A070 */  paddub     $16, $5, $0
/* 12C1FC 0022C0FC BC16258E */  lw         $5, 0x16BC($17)
/* 12C200 0022C100 3000A627 */  addiu      $6, $sp, 0x30
/* 12C204 0022C104 583F050C */  jal        NeedMesWinWH__6ClsMesFiPi
/* 12C208 0022C108 00000000 */   nop
/* 12C20C 0022C10C 3800A38F */  lw         $3, 0x38($sp)
/* 12C210 0022C110 43180300 */  sra        $3, $3, 1
/* 12C214 0022C114 23800302 */  subu       $16, $16, $3
/* 12C218 0022C118 000030AE */  sw         $16, 0x0($17)
.L0022C11C:
/* 12C21C 0022C11C 2000BF7B */  lq         $31, 0x20($sp)
/* 12C220 0022C120 1000B17B */  lq         $17, 0x10($sp)
/* 12C224 0022C124 0000B07B */  lq         $16, 0x0($sp)
/* 12C228 0022C128 4000BD27 */  addiu      $sp, $sp, 0x40
/* 12C22C 0022C12C 0800E003 */  jr         $31
/* 12C230 0022C130 00000000 */   nop
/* 12C234 0022C134 00000000 */  nop
/* 12C238 0022C138 00000000 */  nop
/* 12C23C 0022C13C 00000000 */  nop
