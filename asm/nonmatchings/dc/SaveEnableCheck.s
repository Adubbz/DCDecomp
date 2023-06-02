.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SaveEnableCheck__Fv
/* 123BC0 00223AC0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 123BC4 00223AC4 4000BF7F */  sq         $31, 0x40($sp)
/* 123BC8 00223AC8 3000B37F */  sq         $19, 0x30($sp)
/* 123BCC 00223ACC 2000B27F */  sq         $18, 0x20($sp)
/* 123BD0 00223AD0 1000B17F */  sq         $17, 0x10($sp)
/* 123BD4 00223AD4 0000B07F */  sq         $16, 0x0($sp)
/* 123BD8 00223AD8 DB01023C */  lui        $2, %hi(McAccess)
/* 123BDC 00223ADC 80824424 */  addiu      $4, $2, %lo(McAccess)
/* 123BE0 00223AE0 D44D080C */  jal        InitForMC__17CMemoryCardAccessFv
/* 123BE4 00223AE4 00000000 */   nop
/* 123BE8 00223AE8 04004010 */  beqz       $2, .L00223AFC
/* 123BEC 00223AEC 00000000 */   nop
/* 123BF0 00223AF0 28160070 */  paddub     $2, $0, $0
/* 123BF4 00223AF4 52000010 */  b          .L00223C40
/* 123BF8 00223AF8 00000000 */   nop
.L00223AFC:
/* 123BFC 00223AFC 28860070 */  paddub     $16, $0, $0
/* 123C00 00223B00 288E0070 */  paddub     $17, $0, $0
/* 123C04 00223B04 28960070 */  paddub     $18, $0, $0
/* 123C08 00223B08 3E000010 */  b          .L00223C04
/* 123C0C 00223B0C 00000000 */   nop
.L00223B10:
/* 123C10 00223B10 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 123C14 00223B14 808232AC */  sw         $18, -0x7D80($at)
/* 123C18 00223B18 DB01023C */  lui        $2, %hi(McAccess)
/* 123C1C 00223B1C 80824424 */  addiu      $4, $2, %lo(McAccess)
/* 123C20 00223B20 282E0070 */  paddub     $5, $0, $0
/* 123C24 00223B24 E44E080C */  jal        SetFuncNo__17CMemoryCardAccessFi
/* 123C28 00223B28 00000000 */   nop
.L00223B2C:
/* 123C2C 00223B2C DB01023C */  lui        $2, %hi(McAccess)
/* 123C30 00223B30 80824424 */  addiu      $4, $2, %lo(McAccess)
/* 123C34 00223B34 FC4E080C */  jal        Step__17CMemoryCardAccessFv
/* 123C38 00223B38 00000000 */   nop
/* 123C3C 00223B3C FBFF4010 */  beqz       $2, .L00223B2C
/* 123C40 00223B40 00000000 */   nop
/* 123C44 00223B44 2E004004 */  bltz       $2, .L00223C00
/* 123C48 00223B48 00000000 */   nop
/* 123C4C 00223B4C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 123C50 00223B50 8082238C */  lw         $3, -0x7D80($at)
/* 123C54 00223B54 C0100300 */  sll        $2, $3, 3
/* 123C58 00223B58 21104300 */  addu       $2, $2, $3
/* 123C5C 00223B5C 80180200 */  sll        $3, $2, 2
/* 123C60 00223B60 DB01023C */  lui        $2, %hi(McAccess)
/* 123C64 00223B64 80824224 */  addiu      $2, $2, %lo(McAccess)
/* 123C68 00223B68 21104300 */  addu       $2, $2, $3
/* 123C6C 00223B6C D4045324 */  addiu      $19, $2, 0x4D4
/* 123C70 00223B70 28266072 */  paddub     $4, $19, $0
/* 123C74 00223B74 545B080C */  jal        McCheckMCPs2__FP12MC_CARD_INFO
/* 123C78 00223B78 00000000 */   nop
/* 123C7C 00223B7C 20004010 */  beqz       $2, .L00223C00
/* 123C80 00223B80 00000000 */   nop
/* 123C84 00223B84 01001024 */  addiu      $16, $0, 0x1
/* 123C88 00223B88 0800628E */  lw         $2, 0x8($19)
/* 123C8C 00223B8C 04004014 */  bnez       $2, .L00223BA0
/* 123C90 00223B90 00000000 */   nop
/* 123C94 00223B94 28160072 */  paddub     $2, $16, $0
/* 123C98 00223B98 29000010 */  b          .L00223C40
/* 123C9C 00223B9C 00000000 */   nop
.L00223BA0:
/* 123CA0 00223BA0 DB01023C */  lui        $2, %hi(McAccess)
/* 123CA4 00223BA4 80824424 */  addiu      $4, $2, %lo(McAccess)
/* 123CA8 00223BA8 02000524 */  addiu      $5, $0, 0x2
/* 123CAC 00223BAC E44E080C */  jal        SetFuncNo__17CMemoryCardAccessFi
/* 123CB0 00223BB0 00000000 */   nop
.L00223BB4:
/* 123CB4 00223BB4 DB01023C */  lui        $2, %hi(McAccess)
/* 123CB8 00223BB8 80824424 */  addiu      $4, $2, %lo(McAccess)
/* 123CBC 00223BBC FC4E080C */  jal        Step__17CMemoryCardAccessFv
/* 123CC0 00223BC0 00000000 */   nop
/* 123CC4 00223BC4 FBFF4010 */  beqz       $2, .L00223BB4
/* 123CC8 00223BC8 00000000 */   nop
/* 123CCC 00223BCC 0C004004 */  bltz       $2, .L00223C00
/* 123CD0 00223BD0 00000000 */   nop
/* 123CD4 00223BD4 1000628E */  lw         $2, 0x10($19)
/* 123CD8 00223BD8 04004010 */  beqz       $2, .L00223BEC
/* 123CDC 00223BDC 00000000 */   nop
/* 123CE0 00223BE0 01000224 */  addiu      $2, $0, 0x1
/* 123CE4 00223BE4 16000010 */  b          .L00223C40
/* 123CE8 00223BE8 00000000 */   nop
.L00223BEC:
/* 123CEC 00223BEC 1800628E */  lw         $2, 0x18($19)
/* 123CF0 00223BF0 2A082202 */  slt        $at, $17, $2
/* 123CF4 00223BF4 02002010 */  beqz       $at, .L00223C00
/* 123CF8 00223BF8 00000000 */   nop
/* 123CFC 00223BFC 288E4070 */  paddub     $17, $2, $0
.L00223C00:
/* 123D00 00223C00 01005226 */  addiu      $18, $18, 0x1
.L00223C04:
/* 123D04 00223C04 0200422A */  slti       $2, $18, 0x2
/* 123D08 00223C08 C1FF4014 */  bnez       $2, .L00223B10
/* 123D0C 00223C0C 00000000 */   nop
/* 123D10 00223C10 04000016 */  bnez       $16, .L00223C24
/* 123D14 00223C14 00000000 */   nop
/* 123D18 00223C18 28160070 */  paddub     $2, $0, $0
/* 123D1C 00223C1C 08000010 */  b          .L00223C40
/* 123D20 00223C20 00000000 */   nop
.L00223C24:
/* 123D24 00223C24 9001212A */  slti       $at, $17, 0x190
/* 123D28 00223C28 04002010 */  beqz       $at, .L00223C3C
/* 123D2C 00223C2C 00000000 */   nop
/* 123D30 00223C30 FFFF0224 */  addiu      $2, $0, -0x1
/* 123D34 00223C34 02000010 */  b          .L00223C40
/* 123D38 00223C38 00000000 */   nop
.L00223C3C:
/* 123D3C 00223C3C 01000224 */  addiu      $2, $0, 0x1
.L00223C40:
/* 123D40 00223C40 4000BF7B */  lq         $31, 0x40($sp)
/* 123D44 00223C44 3000B37B */  lq         $19, 0x30($sp)
/* 123D48 00223C48 2000B27B */  lq         $18, 0x20($sp)
/* 123D4C 00223C4C 1000B17B */  lq         $17, 0x10($sp)
/* 123D50 00223C50 0000B07B */  lq         $16, 0x0($sp)
/* 123D54 00223C54 5000BD27 */  addiu      $sp, $sp, 0x50
/* 123D58 00223C58 0800E003 */  jr         $31
/* 123D5C 00223C5C 00000000 */   nop
