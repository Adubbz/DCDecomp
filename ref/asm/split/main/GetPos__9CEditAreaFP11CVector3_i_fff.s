.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetPos__9CEditAreaFP11CVector3_i_fff
/* 06D980 0016D880 C0FFBD27 */  addiu       $29, $29, -0x40
/* 06D984 0016D884 3000BF7F */  sq          $31, 0x30($29)
/* 06D988 0016D888 2000B17F */  sq          $17, 0x20($29)
/* 06D98C 0016D88C 1000B07F */  sq          $16, 0x10($29)
/* 06D990 0016D890 0400B5E7 */  swc1        $f21, 0x4($29)
/* 06D994 0016D894 0000B4E7 */  swc1        $f20, 0x0($29)
/* 06D998 0016D898 288E8070 */  paddub      $17, $4, $0
/* 06D99C 0016D89C 2886A070 */  paddub      $16, $5, $0
/* 06D9A0 0016D8A0 100080C4 */  lwc1        $f0, 0x10($4)
/* 06D9A4 0016D8A4 01630046 */  sub.s       $f12, $f12, $f0
/* 06D9A8 0016D8A8 140080C4 */  lwc1        $f0, 0x14($4)
/* 06D9AC 0016D8AC 416D0046 */  sub.s       $f21, $f13, $f0
/* 06D9B0 0016D8B0 180080C4 */  lwc1        $f0, 0x18($4)
/* 06D9B4 0016D8B4 01750046 */  sub.s       $f20, $f14, $f0
/* 06D9B8 0016D8B8 808080C7 */  lwc1        $f0, -0x7F80($28)
/* 06D9BC 0016D8BC 00630046 */  add.s       $f12, $f12, $f0
/* 06D9C0 0016D8C0 00A50046 */  add.s       $f20, $f20, $f0
/* 06D9C4 0016D8C4 200080C4 */  lwc1        $f0, 0x20($4)
/* 06D9C8 0016D8C8 03630046 */  div.s       $f12, $f12, $f0
/* 06D9CC 0016D8CC 2C44040C */  jal         fptosi
/* 06D9D0 0016D8D0 00000000 */   nop
/* 06D9D4 0016D8D4 000002AE */  sw          $2, 0x0($16)
/* 06D9D8 0016D8D8 240020C6 */  lwc1        $f0, 0x24($17)
/* 06D9DC 0016D8DC 03AB0046 */  div.s       $f12, $f21, $f0
/* 06D9E0 0016D8E0 2C44040C */  jal         fptosi
/* 06D9E4 0016D8E4 00000000 */   nop
/* 06D9E8 0016D8E8 040002AE */  sw          $2, 0x4($16)
/* 06D9EC 0016D8EC 200020C6 */  lwc1        $f0, 0x20($17)
/* 06D9F0 0016D8F0 03A30046 */  div.s       $f12, $f20, $f0
/* 06D9F4 0016D8F4 2C44040C */  jal         fptosi
/* 06D9F8 0016D8F8 00000000 */   nop
/* 06D9FC 0016D8FC 080002AE */  sw          $2, 0x8($16)
/* 06DA00 0016D900 3000BF7B */  lq          $31, 0x30($29)
/* 06DA04 0016D904 2000B17B */  lq          $17, 0x20($29)
/* 06DA08 0016D908 1000B07B */  lq          $16, 0x10($29)
/* 06DA0C 0016D90C 0400B5C7 */  lwc1        $f21, 0x4($29)
/* 06DA10 0016D910 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 06DA14 0016D914 4000BD27 */  addiu       $29, $29, 0x40
/* 06DA18 0016D918 0800E003 */  jr          $31
/* 06DA1C 0016D91C 00000000 */   nop
