.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetPos__9CEditAreaFP11CVector3_i_fff
/* 6D980 0016D880 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 6D984 0016D884 3000BF7F */  sq         $31, 0x30($sp)
/* 6D988 0016D888 2000B17F */  sq         $17, 0x20($sp)
/* 6D98C 0016D88C 1000B07F */  sq         $16, 0x10($sp)
/* 6D990 0016D890 0400B5E7 */  swc1       $f21, 0x4($sp)
/* 6D994 0016D894 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 6D998 0016D898 288E8070 */  paddub     $17, $4, $0
/* 6D99C 0016D89C 2886A070 */  paddub     $16, $5, $0
/* 6D9A0 0016D8A0 100080C4 */  lwc1       $f0, 0x10($4)
/* 6D9A4 0016D8A4 01630046 */  sub.s      $f12, $f12, $f0
/* 6D9A8 0016D8A8 140080C4 */  lwc1       $f0, 0x14($4)
/* 6D9AC 0016D8AC 416D0046 */  sub.s      $f21, $f13, $f0
/* 6D9B0 0016D8B0 180080C4 */  lwc1       $f0, 0x18($4)
/* 6D9B4 0016D8B4 01750046 */  sub.s      $f20, $f14, $f0
/* 6D9B8 0016D8B8 808080C7 */  lwc1       $f0, -0x7F80($gp)
/* 6D9BC 0016D8BC 00630046 */  add.s      $f12, $f12, $f0
/* 6D9C0 0016D8C0 00A50046 */  add.s      $f20, $f20, $f0
/* 6D9C4 0016D8C4 200080C4 */  lwc1       $f0, 0x20($4)
/* 6D9C8 0016D8C8 03630046 */  div.s      $f12, $f12, $f0
/* 6D9CC 0016D8CC 2C44040C */  jal        fptosi
/* 6D9D0 0016D8D0 00000000 */   nop
/* 6D9D4 0016D8D4 000002AE */  sw         $2, 0x0($16)
/* 6D9D8 0016D8D8 240020C6 */  lwc1       $f0, 0x24($17)
/* 6D9DC 0016D8DC 03AB0046 */  div.s      $f12, $f21, $f0
/* 6D9E0 0016D8E0 2C44040C */  jal        fptosi
/* 6D9E4 0016D8E4 00000000 */   nop
/* 6D9E8 0016D8E8 040002AE */  sw         $2, 0x4($16)
/* 6D9EC 0016D8EC 200020C6 */  lwc1       $f0, 0x20($17)
/* 6D9F0 0016D8F0 03A30046 */  div.s      $f12, $f20, $f0
/* 6D9F4 0016D8F4 2C44040C */  jal        fptosi
/* 6D9F8 0016D8F8 00000000 */   nop
/* 6D9FC 0016D8FC 080002AE */  sw         $2, 0x8($16)
/* 6DA00 0016D900 3000BF7B */  lq         $31, 0x30($sp)
/* 6DA04 0016D904 2000B17B */  lq         $17, 0x20($sp)
/* 6DA08 0016D908 1000B07B */  lq         $16, 0x10($sp)
/* 6DA0C 0016D90C 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* 6DA10 0016D910 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 6DA14 0016D914 4000BD27 */  addiu      $sp, $sp, 0x40
/* 6DA18 0016D918 0800E003 */  jr         $31
/* 6DA1C 0016D91C 00000000 */   nop
