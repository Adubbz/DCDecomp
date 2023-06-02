.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitExistData__Fv
/* 123A40 00223940 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 123A44 00223944 2000BF7F */  sq         $31, 0x20($sp)
/* 123A48 00223948 1000B17F */  sq         $17, 0x10($sp)
/* 123A4C 0022394C 0000B07F */  sq         $16, 0x0($sp)
/* 123A50 00223950 DB01023C */  lui        $2, %hi(McAccess)
/* 123A54 00223954 80824424 */  addiu      $4, $2, %lo(McAccess)
/* 123A58 00223958 D44D080C */  jal        InitForMC__17CMemoryCardAccessFv
/* 123A5C 0022395C 00000000 */   nop
/* 123A60 00223960 08004010 */  beqz       $2, .L00223984
/* 123A64 00223964 00000000 */   nop
/* 123A68 00223968 2A00023C */  lui        $2, %hi(_3336)
/* 123A6C 0022396C 00ED4424 */  addiu      $4, $2, %lo(_3336)
/* 123A70 00223970 A611040C */  jal        printf
/* 123A74 00223974 00000000 */   nop
/* 123A78 00223978 28160070 */  paddub     $2, $0, $0
/* 123A7C 0022397C 47000010 */  b          .L00223A9C
/* 123A80 00223980 00000000 */   nop
.L00223984:
/* 123A84 00223984 28860070 */  paddub     $16, $0, $0
/* 123A88 00223988 40000010 */  b          .L00223A8C
/* 123A8C 0022398C 00000000 */   nop
.L00223990:
/* 123A90 00223990 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 123A94 00223994 808230AC */  sw         $16, -0x7D80($at)
/* 123A98 00223998 DB01023C */  lui        $2, %hi(McAccess)
/* 123A9C 0022399C 80824424 */  addiu      $4, $2, %lo(McAccess)
/* 123AA0 002239A0 282E0070 */  paddub     $5, $0, $0
/* 123AA4 002239A4 E44E080C */  jal        SetFuncNo__17CMemoryCardAccessFi
/* 123AA8 002239A8 00000000 */   nop
.L002239AC:
/* 123AAC 002239AC DB01023C */  lui        $2, %hi(McAccess)
/* 123AB0 002239B0 80824424 */  addiu      $4, $2, %lo(McAccess)
/* 123AB4 002239B4 FC4E080C */  jal        Step__17CMemoryCardAccessFv
/* 123AB8 002239B8 00000000 */   nop
/* 123ABC 002239BC FBFF4010 */  beqz       $2, .L002239AC
/* 123AC0 002239C0 00000000 */   nop
/* 123AC4 002239C4 30004004 */  bltz       $2, .L00223A88
/* 123AC8 002239C8 00000000 */   nop
/* 123ACC 002239CC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 123AD0 002239D0 8082238C */  lw         $3, -0x7D80($at)
/* 123AD4 002239D4 C0100300 */  sll        $2, $3, 3
/* 123AD8 002239D8 21104300 */  addu       $2, $2, $3
/* 123ADC 002239DC 80180200 */  sll        $3, $2, 2
/* 123AE0 002239E0 DB01023C */  lui        $2, %hi(McAccess)
/* 123AE4 002239E4 80824224 */  addiu      $2, $2, %lo(McAccess)
/* 123AE8 002239E8 21104300 */  addu       $2, $2, $3
/* 123AEC 002239EC D4045124 */  addiu      $17, $2, 0x4D4
/* 123AF0 002239F0 28262072 */  paddub     $4, $17, $0
/* 123AF4 002239F4 545B080C */  jal        McCheckMCPs2__FP12MC_CARD_INFO
/* 123AF8 002239F8 00000000 */   nop
/* 123AFC 002239FC 22004010 */  beqz       $2, .L00223A88
/* 123B00 00223A00 00000000 */   nop
/* 123B04 00223A04 0800228E */  lw         $2, 0x8($17)
/* 123B08 00223A08 1F004010 */  beqz       $2, .L00223A88
/* 123B0C 00223A0C 00000000 */   nop
/* 123B10 00223A10 DB01023C */  lui        $2, %hi(McAccess)
/* 123B14 00223A14 80824424 */  addiu      $4, $2, %lo(McAccess)
/* 123B18 00223A18 02000524 */  addiu      $5, $0, 0x2
/* 123B1C 00223A1C E44E080C */  jal        SetFuncNo__17CMemoryCardAccessFi
/* 123B20 00223A20 00000000 */   nop
.L00223A24:
/* 123B24 00223A24 DB01023C */  lui        $2, %hi(McAccess)
/* 123B28 00223A28 80824424 */  addiu      $4, $2, %lo(McAccess)
/* 123B2C 00223A2C FC4E080C */  jal        Step__17CMemoryCardAccessFv
/* 123B30 00223A30 00000000 */   nop
/* 123B34 00223A34 FBFF4010 */  beqz       $2, .L00223A24
/* 123B38 00223A38 00000000 */   nop
/* 123B3C 00223A3C DB01023C */  lui        $2, %hi(McAccess)
/* 123B40 00223A40 80824424 */  addiu      $4, $2, %lo(McAccess)
/* 123B44 00223A44 0D000524 */  addiu      $5, $0, 0xD
/* 123B48 00223A48 E44E080C */  jal        SetFuncNo__17CMemoryCardAccessFi
/* 123B4C 00223A4C 00000000 */   nop
.L00223A50:
/* 123B50 00223A50 DB01023C */  lui        $2, %hi(McAccess)
/* 123B54 00223A54 80824424 */  addiu      $4, $2, %lo(McAccess)
/* 123B58 00223A58 FC4E080C */  jal        Step__17CMemoryCardAccessFv
/* 123B5C 00223A5C 00000000 */   nop
/* 123B60 00223A60 FBFF4010 */  beqz       $2, .L00223A50
/* 123B64 00223A64 00000000 */   nop
/* 123B68 00223A68 07004004 */  bltz       $2, .L00223A88
/* 123B6C 00223A6C 00000000 */   nop
/* 123B70 00223A70 1000228E */  lw         $2, 0x10($17)
/* 123B74 00223A74 04004010 */  beqz       $2, .L00223A88
/* 123B78 00223A78 00000000 */   nop
/* 123B7C 00223A7C 01000224 */  addiu      $2, $0, 0x1
/* 123B80 00223A80 06000010 */  b          .L00223A9C
/* 123B84 00223A84 00000000 */   nop
.L00223A88:
/* 123B88 00223A88 01001026 */  addiu      $16, $16, 0x1
.L00223A8C:
/* 123B8C 00223A8C 0200022A */  slti       $2, $16, 0x2
/* 123B90 00223A90 BFFF4014 */  bnez       $2, .L00223990
/* 123B94 00223A94 00000000 */   nop
/* 123B98 00223A98 28160070 */  paddub     $2, $0, $0
.L00223A9C:
/* 123B9C 00223A9C 2000BF7B */  lq         $31, 0x20($sp)
/* 123BA0 00223AA0 1000B17B */  lq         $17, 0x10($sp)
/* 123BA4 00223AA4 0000B07B */  lq         $16, 0x0($sp)
/* 123BA8 00223AA8 3000BD27 */  addiu      $sp, $sp, 0x30
/* 123BAC 00223AAC 0800E003 */  jr         $31
/* 123BB0 00223AB0 00000000 */   nop
/* 123BB4 00223AB4 00000000 */  nop
/* 123BB8 00223AB8 00000000 */  nop
/* 123BBC 00223ABC 00000000 */  nop
