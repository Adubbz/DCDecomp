.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __sinit
/* 1BF0 00101AF0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 1BF4 00101AF4 1000023C */  lui        $2, %hi(_cleanup_r)
/* 1BF8 00101AF8 0000B0FF */  sd         $16, 0x0($sp)
/* 1BFC 00101AFC D01A4224 */  addiu      $2, $2, %lo(_cleanup_r)
/* 1C00 00101B00 2D808000 */  daddu      $16, $4, $0
/* 1C04 00101B04 1000B1FF */  sd         $17, 0x10($sp)
/* 1C08 00101B08 E4011126 */  addiu      $17, $16, 0x1E4
/* 1C0C 00101B0C 2000BFFF */  sd         $31, 0x20($sp)
/* 1C10 00101B10 01000324 */  addiu      $3, $0, 0x1
/* 1C14 00101B14 3C0002AE */  sw         $2, 0x3C($16)
/* 1C18 00101B18 380003AE */  sw         $3, 0x38($16)
/* 1C1C 00101B1C 2D202002 */  daddu      $4, $17, $0
/* 1C20 00101B20 2D380002 */  daddu      $7, $16, $0
/* 1C24 00101B24 04000524 */  addiu      $5, $0, 0x4
/* 1C28 00101B28 4A06040C */  jal        std
/* 1C2C 00101B2C 2D300000 */   daddu     $6, $0, $0
/* 1C30 00101B30 3C020426 */  addiu      $4, $16, 0x23C
/* 1C34 00101B34 2D380002 */  daddu      $7, $16, $0
/* 1C38 00101B38 09000524 */  addiu      $5, $0, 0x9
/* 1C3C 00101B3C 4A06040C */  jal        std
/* 1C40 00101B40 01000624 */   addiu     $6, $0, 0x1
/* 1C44 00101B44 94020426 */  addiu      $4, $16, 0x294
/* 1C48 00101B48 2D380002 */  daddu      $7, $16, $0
/* 1C4C 00101B4C 0A000524 */  addiu      $5, $0, 0xA
/* 1C50 00101B50 4A06040C */  jal        std
/* 1C54 00101B54 02000624 */   addiu     $6, $0, 0x2
/* 1C58 00101B58 03000224 */  addiu      $2, $0, 0x3
/* 1C5C 00101B5C E00111AE */  sw         $17, 0x1E0($16)
/* 1C60 00101B60 DC0102AE */  sw         $2, 0x1DC($16)
/* 1C64 00101B64 D80100AE */  sw         $0, 0x1D8($16)
/* 1C68 00101B68 2000BFDF */  ld         $31, 0x20($sp)
/* 1C6C 00101B6C 1000B1DF */  ld         $17, 0x10($sp)
/* 1C70 00101B70 0000B0DF */  ld         $16, 0x0($sp)
/* 1C74 00101B74 0800E003 */  jr         $31
/* 1C78 00101B78 3000BD27 */   addiu     $sp, $sp, 0x30
/* 1C7C 00101B7C 00000000 */  nop
