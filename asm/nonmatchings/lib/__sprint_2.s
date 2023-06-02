.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __sprint_2
/* 7C08 00107B08 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7C0C 00107B0C 0000B0FF */  sd         $16, 0x0($sp)
/* 7C10 00107B10 1000BFFF */  sd         $31, 0x10($sp)
/* 7C14 00107B14 2D80A000 */  daddu      $16, $5, $0
/* 7C18 00107B18 0800028E */  lw         $2, 0x8($16)
/* 7C1C 00107B1C 03004014 */  bnez       $2, .L00107B2C
/* 7C20 00107B20 2D100000 */   daddu     $2, $0, $0
/* 7C24 00107B24 05000010 */  b          .L00107B3C
/* 7C28 00107B28 040000AE */   sw        $0, 0x4($16)
.L00107B2C:
/* 7C2C 00107B2C 3808040C */  jal        __sfvwrite
/* 7C30 00107B30 2D280002 */   daddu     $5, $16, $0
/* 7C34 00107B34 040000AE */  sw         $0, 0x4($16)
/* 7C38 00107B38 080000AE */  sw         $0, 0x8($16)
.L00107B3C:
/* 7C3C 00107B3C 1000BFDF */  ld         $31, 0x10($sp)
/* 7C40 00107B40 0000B0DF */  ld         $16, 0x0($sp)
/* 7C44 00107B44 0800E003 */  jr         $31
/* 7C48 00107B48 2000BD27 */   addiu     $sp, $sp, 0x20
/* 7C4C 00107B4C 00000000 */  nop
