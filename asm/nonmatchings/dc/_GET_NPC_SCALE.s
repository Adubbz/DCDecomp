.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_NPC_SCALE__FP12RS_STACKDATAi
/* 8E980 0018E880 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 8E984 0018E884 1000BF7F */  sq         $31, 0x10($sp)
/* 8E988 0018E888 0000B07F */  sq         $16, 0x0($sp)
/* 8E98C 0018E88C 08009024 */  addiu      $16, $4, 0x8
/* 8E990 0018E890 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8E994 0018E894 00000000 */   nop
/* 8E998 0018E898 28264070 */  paddub     $4, $2, $0
/* 8E99C 0018E89C 842C060C */  jal        GetChara__Fi
/* 8E9A0 0018E8A0 00000000 */   nop
/* 8E9A4 0018E8A4 04004014 */  bnez       $2, .L0018E8B8
/* 8E9A8 0018E8A8 00000000 */   nop
/* 8E9AC 0018E8AC 28160070 */  paddub     $2, $0, $0
/* 8E9B0 0018E8B0 16000010 */  b          .L0018E90C
/* 8E9B4 0018E8B4 00000000 */   nop
.L0018E8B8:
/* 8E9B8 0018E8B8 28264070 */  paddub     $4, $2, $0
/* 8E9BC 0018E8BC 2000A527 */  addiu      $5, $sp, 0x20
/* 8E9C0 0018E8C0 A000598C */  lw         $25, 0xA0($2)
/* 8E9C4 0018E8C4 8C00398F */  lw         $25, 0x8C($25)
/* 8E9C8 0018E8C8 09F82003 */  jalr       $25
/* 8E9CC 0018E8CC 00000000 */   nop
/* 8E9D0 0018E8D0 28260072 */  paddub     $4, $16, $0
/* 8E9D4 0018E8D4 08009024 */  addiu      $16, $4, 0x8
/* 8E9D8 0018E8D8 2000ACC7 */  lwc1       $f12, 0x20($sp)
/* 8E9DC 0018E8DC 0029060C */  jal        SetStack__FP12RS_STACKDATAf
/* 8E9E0 0018E8E0 00000000 */   nop
/* 8E9E4 0018E8E4 28260072 */  paddub     $4, $16, $0
/* 8E9E8 0018E8E8 08009024 */  addiu      $16, $4, 0x8
/* 8E9EC 0018E8EC 2400ACC7 */  lwc1       $f12, 0x24($sp)
/* 8E9F0 0018E8F0 0029060C */  jal        SetStack__FP12RS_STACKDATAf
/* 8E9F4 0018E8F4 00000000 */   nop
/* 8E9F8 0018E8F8 28260072 */  paddub     $4, $16, $0
/* 8E9FC 0018E8FC 2800ACC7 */  lwc1       $f12, 0x28($sp)
/* 8EA00 0018E900 0029060C */  jal        SetStack__FP12RS_STACKDATAf
/* 8EA04 0018E904 00000000 */   nop
/* 8EA08 0018E908 01000224 */  addiu      $2, $0, 0x1
.L0018E90C:
/* 8EA0C 0018E90C 1000BF7B */  lq         $31, 0x10($sp)
/* 8EA10 0018E910 0000B07B */  lq         $16, 0x0($sp)
/* 8EA14 0018E914 3000BD27 */  addiu      $sp, $sp, 0x30
/* 8EA18 0018E918 0800E003 */  jr         $31
/* 8EA1C 0018E91C 00000000 */   nop
