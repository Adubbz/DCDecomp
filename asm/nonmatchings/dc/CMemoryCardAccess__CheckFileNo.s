.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckFileNo__17CMemoryCardAccessFi
/* 115C10 00215B10 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 115C14 00215B14 1000BF7F */  sq         $31, 0x10($sp)
/* 115C18 00215B18 0000B07F */  sq         $16, 0x0($sp)
/* 115C1C 00215B1C 28168070 */  paddub     $2, $4, $0
/* 115C20 00215B20 2886A070 */  paddub     $16, $5, $0
/* 115C24 00215B24 04000106 */  bgez       $16, .L00215B38
/* 115C28 00215B28 00000000 */   nop
/* 115C2C 00215B2C 28160070 */  paddub     $2, $0, $0
/* 115C30 00215B30 12000010 */  b          .L00215B7C
/* 115C34 00215B34 00000000 */   nop
.L00215B38:
/* 115C38 00215B38 2000A427 */  addiu      $4, $sp, 0x20
/* 115C3C 00215B3C 5C004524 */  addiu      $5, $2, 0x5C
/* 115C40 00215B40 5A15040C */  jal        strcpy
/* 115C44 00215B44 00000000 */   nop
/* 115C48 00215B48 2000A427 */  addiu      $4, $sp, 0x20
/* 115C4C 00215B4C 2A00023C */  lui        $2, %hi(_672_2)
/* 115C50 00215B50 A8E64524 */  addiu      $5, $2, %lo(_672_2)
/* 115C54 00215B54 BC14040C */  jal        strcat
/* 115C58 00215B58 00000000 */   nop
/* 115C5C 00215B5C 2000A427 */  addiu      $4, $sp, 0x20
/* 115C60 00215B60 282E8070 */  paddub     $5, $4, $0
/* 115C64 00215B64 28360072 */  paddub     $6, $16, $0
/* 115C68 00215B68 1614040C */  jal        sprintf
/* 115C6C 00215B6C 00000000 */   nop
/* 115C70 00215B70 2000A427 */  addiu      $4, $sp, 0x20
/* 115C74 00215B74 504D080C */  jal        GetOpenAttribute__FPc
/* 115C78 00215B78 00000000 */   nop
.L00215B7C:
/* 115C7C 00215B7C 1000BF7B */  lq         $31, 0x10($sp)
/* 115C80 00215B80 0000B07B */  lq         $16, 0x0($sp)
/* 115C84 00215B84 4000BD27 */  addiu      $sp, $sp, 0x40
/* 115C88 00215B88 0800E003 */  jr         $31
/* 115C8C 00215B8C 00000000 */   nop
