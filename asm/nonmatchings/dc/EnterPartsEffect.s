.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EnterPartsEffect__FP9CMapPartsP16EPARTS_FUNC_DATAP16EDIT_EFFECT_INFOi
/* 72BC0 00172AC0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 72BC4 00172AC4 2000BF7F */  sq         $31, 0x20($sp)
/* 72BC8 00172AC8 1000B17F */  sq         $17, 0x10($sp)
/* 72BCC 00172ACC 0000B07F */  sq         $16, 0x0($sp)
/* 72BD0 00172AD0 288E8070 */  paddub     $17, $4, $0
/* 72BD4 00172AD4 2886C070 */  paddub     $16, $6, $0
/* 72BD8 00172AD8 01000424 */  addiu      $4, $0, 0x1
/* 72BDC 00172ADC 08000010 */  b          .L00172B00
/* 72BE0 00172AE0 00000000 */   nop
.L00172AE4:
/* 72BE4 00172AE4 21008710 */  beq        $4, $7, .L00172B6C
/* 72BE8 00172AE8 00000000 */   nop
/* 72BEC 00172AEC 1000038E */  lw         $3, 0x10($16)
/* 72BF0 00172AF0 06006018 */  blez       $3, .L00172B0C
/* 72BF4 00172AF4 00000000 */   nop
/* 72BF8 00172AF8 01008424 */  addiu      $4, $4, 0x1
/* 72BFC 00172AFC 70001026 */  addiu      $16, $16, 0x70
.L00172B00:
/* 72C00 00172B00 2A08E400 */  slt        $at, $7, $4
/* 72C04 00172B04 F7FF2010 */  beqz       $at, .L00172AE4
/* 72C08 00172B08 00000000 */   nop
.L00172B0C:
/* 72C0C 00172B0C B000248E */  lw         $4, 0xB0($17)
/* 72C10 00172B10 28360072 */  paddub     $6, $16, $0
/* 72C14 00172B14 749A050C */  jal        InitEditEffect__FP6CFrameP16EPARTS_FUNC_DATAP16EDIT_EFFECT_INFO
/* 72C18 00172B18 00000000 */   nop
/* 72C1C 00172B1C 13004010 */  beqz       $2, .L00172B6C
/* 72C20 00172B20 00000000 */   nop
/* 72C24 00172B24 282E0070 */  paddub     $5, $0, $0
/* 72C28 00172B28 0D000010 */  b          .L00172B60
/* 72C2C 00172B2C 00000000 */   nop
.L00172B30:
/* 72C30 00172B30 80180500 */  sll        $3, $5, 2
/* 72C34 00172B34 21207100 */  addu       $4, $3, $17
/* 72C38 00172B38 D8018624 */  addiu      $6, $4, 0x1D8
/* 72C3C 00172B3C D801838C */  lw         $3, 0x1D8($4)
/* 72C40 00172B40 06006014 */  bnez       $3, .L00172B5C
/* 72C44 00172B44 00000000 */   nop
/* 72C48 00172B48 01000324 */  addiu      $3, $0, 0x1
/* 72C4C 00172B4C 0000C3AC */  sw         $3, 0x0($6)
/* 72C50 00172B50 380290AC */  sw         $16, 0x238($4)
/* 72C54 00172B54 05000010 */  b          .L00172B6C
/* 72C58 00172B58 00000000 */   nop
.L00172B5C:
/* 72C5C 00172B5C 0100A524 */  addiu      $5, $5, 0x1
.L00172B60:
/* 72C60 00172B60 1800A328 */  slti       $3, $5, 0x18
/* 72C64 00172B64 F2FF6014 */  bnez       $3, .L00172B30
/* 72C68 00172B68 00000000 */   nop
.L00172B6C:
/* 72C6C 00172B6C 2000BF7B */  lq         $31, 0x20($sp)
/* 72C70 00172B70 1000B17B */  lq         $17, 0x10($sp)
/* 72C74 00172B74 0000B07B */  lq         $16, 0x0($sp)
/* 72C78 00172B78 3000BD27 */  addiu      $sp, $sp, 0x30
/* 72C7C 00172B7C 0800E003 */  jr         $31
/* 72C80 00172B80 00000000 */   nop
/* 72C84 00172B84 00000000 */  nop
/* 72C88 00172B88 00000000 */  nop
/* 72C8C 00172B8C 00000000 */  nop
