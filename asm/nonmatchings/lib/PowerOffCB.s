.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PowerOffCB
/* 9C60 00109B60 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 9C64 00109B64 2D200000 */  daddu      $4, $0, $0
/* 9C68 00109B68 3000B2FF */  sd         $18, 0x30($sp)
/* 9C6C 00109B6C 5000BFFF */  sd         $31, 0x50($sp)
/* 9C70 00109B70 2500123C */  lui        $18, (0x250294 >> 16)
/* 9C74 00109B74 4000B3FF */  sd         $19, 0x40($sp)
/* 9C78 00109B78 2000B1FF */  sd         $17, 0x20($sp)
/* 9C7C 00109B7C 125B040C */  jal        sceSifInitRpc
/* 9C80 00109B80 1000B0FF */   sd        $16, 0x10($sp)
/* 9C84 00109B84 9402428E */  lw         $2, (0x250294 & 0xFFFF)($18)
/* 9C88 00109B88 2F004104 */  bgez       $2, .L00109C48
/* 9C8C 00109B8C 2A00133C */   lui       $19, %hi(D_002A39E0)
/* 9C90 00109B90 10000010 */  b          .L00109BD4
/* 9C94 00109B94 2D880000 */   daddu     $17, $0, $0
.L00109B98:
/* 9C98 00109B98 01002426 */  addiu      $4, $17, 0x1
/* 9C9C 00109B9C FFFF0324 */  addiu      $3, $0, -0x1
.L00109BA0:
/* 9CA0 00109BA0 FFFF4224 */  addiu      $2, $2, %lo(D_FFFFF)
/* 9CA4 00109BA4 00000000 */  nop
/* 9CA8 00109BA8 00000000 */  nop
/* 9CAC 00109BAC 00000000 */  nop
/* 9CB0 00109BB0 00000000 */  nop
/* 9CB4 00109BB4 FAFF4314 */  bne        $2, $3, .L00109BA0
/* 9CB8 00109BB8 00000000 */   nop
/* 9CBC 00109BBC 2D102002 */  daddu      $2, $17, $0
/* 9CC0 00109BC0 11004228 */  slti       $2, $2, 0x11
/* 9CC4 00109BC4 03004014 */  bnez       $2, .L00109BD4
/* 9CC8 00109BC8 2D888000 */   daddu     $17, $4, $0
/* 9CCC 00109BCC 2F000010 */  b          .L00109C8C
/* 9CD0 00109BD0 2D100000 */   daddu     $2, $0, $0
.L00109BD4:
/* 9CD4 00109BD4 E0397026 */  addiu      $16, $19, %lo(D_002A39E0)
.L00109BD8:
/* 9CD8 00109BD8 0080053C */  lui        $5, (0x80000596 >> 16)
/* 9CDC 00109BDC 2D200002 */  daddu      $4, $16, $0
/* 9CE0 00109BE0 9605A534 */  ori        $5, $5, (0x80000596 & 0xFFFF)
/* 9CE4 00109BE4 B65C040C */  jal        sceSifBindRpc
/* 9CE8 00109BE8 2D300000 */   daddu     $6, $0, $0
/* 9CEC 00109BEC 13004304 */  bgezl      $2, .L00109C3C
/* 9CF0 00109BF0 2400028E */   lw        $2, 0x24($16)
/* 9CF4 00109BF4 2500023C */  lui        $2, (0x250270 >> 16)
/* 9CF8 00109BF8 7002438C */  lw         $3, (0x250270 & 0xFFFF)($2)
/* 9CFC 00109BFC 05006018 */  blez       $3, .L00109C14
/* 9D00 00109C00 1000023C */   lui       $2, %hi(D_FFFFF)
/* 9D04 00109C04 2900043C */  lui        $4, %hi(D_00296FC0)
/* 9D08 00109C08 A611040C */  jal        printf
/* 9D0C 00109C0C C06F8424 */   addiu     $4, $4, %lo(D_00296FC0)
/* 9D10 00109C10 1000023C */  lui        $2, %hi(D_FFFFF)
.L00109C14:
/* 9D14 00109C14 FFFF0324 */  addiu      $3, $0, -0x1
.L00109C18:
/* 9D18 00109C18 FFFF4224 */  addiu      $2, $2, %lo(D_FFFFF)
/* 9D1C 00109C1C 00000000 */  nop
/* 9D20 00109C20 00000000 */  nop
/* 9D24 00109C24 00000000 */  nop
/* 9D28 00109C28 00000000 */  nop
/* 9D2C 00109C2C FAFF4314 */  bne        $2, $3, .L00109C18
/* 9D30 00109C30 00000000 */   nop
/* 9D34 00109C34 E8FF0010 */  b          .L00109BD8
/* 9D38 00109C38 E0397026 */   addiu     $16, $19, %lo(D_002A39E0)
.L00109C3C:
/* 9D3C 00109C3C D6FF4010 */  beqz       $2, .L00109B98
/* 9D40 00109C40 1000023C */   lui       $2, %hi(D_FFFFF)
/* 9D44 00109C44 940240AE */  sw         $0, (0x250294 & 0xFFFF)($18)
.L00109C48:
/* 9D48 00109C48 2A00023C */  lui        $2, (0x2A3A08 >> 16)
/* 9D4C 00109C4C 0B000324 */  addiu      $3, $0, 0xB
/* 9D50 00109C50 083A4524 */  addiu      $5, $2, %lo(D_002A3A08)
/* 9D54 00109C54 11000B3C */  lui        $11, %hi(cd_callback)
/* 9D58 00109C58 0000A5AF */  sw         $5, 0x0($sp)
/* 9D5C 00109C5C E0396426 */  addiu      $4, $19, %lo(D_002A39E0)
/* 9D60 00109C60 083A43AC */  sw         $3, (0x2A3A08 & 0xFFFF)($2)
/* 9D64 00109C64 48966B25 */  addiu      $11, $11, %lo(cd_callback)
/* 9D68 00109C68 01000524 */  addiu      $5, $0, 0x1
/* 9D6C 00109C6C 01000624 */  addiu      $6, $0, 0x1
/* 9D70 00109C70 2D380000 */  daddu      $7, $0, $0
/* 9D74 00109C74 2D400000 */  daddu      $8, $0, $0
/* 9D78 00109C78 2D480000 */  daddu      $9, $0, $0
/* 9D7C 00109C7C 2A5D040C */  jal        sceSifCallRpc
/* 9D80 00109C80 2D500000 */   daddu     $10, $0, $0
/* 9D84 00109C84 FFFF0324 */  addiu      $3, $0, -0x1
/* 9D88 00109C88 2A106200 */  slt        $2, $3, $2
.L00109C8C:
/* 9D8C 00109C8C 5000BFDF */  ld         $31, 0x50($sp)
/* 9D90 00109C90 4000B3DF */  ld         $19, 0x40($sp)
/* 9D94 00109C94 3000B2DF */  ld         $18, 0x30($sp)
/* 9D98 00109C98 2000B1DF */  ld         $17, 0x20($sp)
/* 9D9C 00109C9C 1000B0DF */  ld         $16, 0x10($sp)
/* 9DA0 00109CA0 0800E003 */  jr         $31
/* 9DA4 00109CA4 6000BD27 */   addiu     $sp, $sp, 0x60
