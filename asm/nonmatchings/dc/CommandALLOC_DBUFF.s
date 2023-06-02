.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandALLOC_DBUFF__FPPv
/* 3AA60 0013A960 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 3AA64 0013A964 0000BF7F */  sq         $31, 0x0($sp)
/* 3AA68 0013A968 D88C838F */  lw         $3, -0x7328($gp)
/* 3AA6C 0013A96C 08006128 */  slti       $at, $3, 0x8
/* 3AA70 0013A970 0B002010 */  beqz       $at, .L0013A9A0
/* 3AA74 0013A974 00000000 */   nop
/* 3AA78 0013A978 01006224 */  addiu      $2, $3, 0x1
/* 3AA7C 0013A97C D88C82AF */  sw         $2, -0x7328($gp)
/* 3AA80 0013A980 00190300 */  sll        $3, $3, 4
/* 3AA84 0013A984 C801023C */  lui        $2, %hi(alloc_dbuff)
/* 3AA88 0013A988 00AF4224 */  addiu      $2, $2, %lo(alloc_dbuff)
/* 3AA8C 0013A98C 21104300 */  addu       $2, $2, $3
/* 3AA90 0013A990 0000858C */  lw         $5, 0x0($4)
/* 3AA94 0013A994 28264070 */  paddub     $4, $2, $0
/* 3AA98 0013A998 5A15040C */  jal        strcpy
/* 3AA9C 0013A99C 00000000 */   nop
.L0013A9A0:
/* 3AAA0 0013A9A0 0000BF7B */  lq         $31, 0x0($sp)
/* 3AAA4 0013A9A4 1000BD27 */  addiu      $sp, $sp, 0x10
/* 3AAA8 0013A9A8 0800E003 */  jr         $31
/* 3AAAC 0013A9AC 00000000 */   nop
