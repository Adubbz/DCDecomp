.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_NPC_SCALE__FP12RS_STACKDATAi
/* 8E8A0 0018E7A0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 8E8A4 0018E7A4 2000BF7F */  sq         $31, 0x20($sp)
/* 8E8A8 0018E7A8 1000B17F */  sq         $17, 0x10($sp)
/* 8E8AC 0018E7AC 0000B07F */  sq         $16, 0x0($sp)
/* 8E8B0 0018E7B0 2886A070 */  paddub     $16, $5, $0
/* 8E8B4 0018E7B4 08009124 */  addiu      $17, $4, 0x8
/* 8E8B8 0018E7B8 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8E8BC 0018E7BC 00000000 */   nop
/* 8E8C0 0018E7C0 28264070 */  paddub     $4, $2, $0
/* 8E8C4 0018E7C4 842C060C */  jal        GetChara__Fi
/* 8E8C8 0018E7C8 00000000 */   nop
/* 8E8CC 0018E7CC 281E4070 */  paddub     $3, $2, $0
/* 8E8D0 0018E7D0 04006014 */  bnez       $3, .L0018E7E4
/* 8E8D4 0018E7D4 00000000 */   nop
/* 8E8D8 0018E7D8 28160070 */  paddub     $2, $0, $0
/* 8E8DC 0018E7DC 21000010 */  b          .L0018E864
/* 8E8E0 0018E7E0 00000000 */   nop
.L0018E7E4:
/* 8E8E4 0018E7E4 28262072 */  paddub     $4, $17, $0
/* 8E8E8 0018E7E8 08009124 */  addiu      $17, $4, 0x8
/* 8E8EC 0018E7EC E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 8E8F0 0018E7F0 00000000 */   nop
/* 8E8F4 0018E7F4 06030046 */  mov.s      $f12, $f0
/* 8E8F8 0018E7F8 02000224 */  addiu      $2, $0, 0x2
/* 8E8FC 0018E7FC 0A000216 */  bne        $16, $2, .L0018E828
/* 8E900 0018E800 00000000 */   nop
/* 8E904 0018E804 28266070 */  paddub     $4, $3, $0
/* 8E908 0018E808 46630046 */  mov.s      $f13, $f12
/* 8E90C 0018E80C 86630046 */  mov.s      $f14, $f12
/* 8E910 0018E810 A000798C */  lw         $25, 0xA0($3)
/* 8E914 0018E814 8400398F */  lw         $25, 0x84($25)
/* 8E918 0018E818 09F82003 */  jalr       $25
/* 8E91C 0018E81C 00000000 */   nop
/* 8E920 0018E820 0F000010 */  b          .L0018E860
/* 8E924 0018E824 00000000 */   nop
.L0018E828:
/* 8E928 0018E828 28262072 */  paddub     $4, $17, $0
/* 8E92C 0018E82C 08009124 */  addiu      $17, $4, 0x8
/* 8E930 0018E830 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 8E934 0018E834 00000000 */   nop
/* 8E938 0018E838 46030046 */  mov.s      $f13, $f0
/* 8E93C 0018E83C 28262072 */  paddub     $4, $17, $0
/* 8E940 0018E840 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 8E944 0018E844 00000000 */   nop
/* 8E948 0018E848 28266070 */  paddub     $4, $3, $0
/* 8E94C 0018E84C 86030046 */  mov.s      $f14, $f0
/* 8E950 0018E850 A000798C */  lw         $25, 0xA0($3)
/* 8E954 0018E854 8400398F */  lw         $25, 0x84($25)
/* 8E958 0018E858 09F82003 */  jalr       $25
/* 8E95C 0018E85C 00000000 */   nop
.L0018E860:
/* 8E960 0018E860 01000224 */  addiu      $2, $0, 0x1
.L0018E864:
/* 8E964 0018E864 2000BF7B */  lq         $31, 0x20($sp)
/* 8E968 0018E868 1000B17B */  lq         $17, 0x10($sp)
/* 8E96C 0018E86C 0000B07B */  lq         $16, 0x0($sp)
/* 8E970 0018E870 3000BD27 */  addiu      $sp, $sp, 0x30
/* 8E974 0018E874 0800E003 */  jr         $31
/* 8E978 0018E878 00000000 */   nop
/* 8E97C 0018E87C 00000000 */  nop
