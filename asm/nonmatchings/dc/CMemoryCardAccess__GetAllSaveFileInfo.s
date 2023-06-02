.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetAllSaveFileInfo__17CMemoryCardAccessFv
/* 115B30 00215A30 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 115B34 00215A34 2000BF7F */  sq         $31, 0x20($sp)
/* 115B38 00215A38 1000B17F */  sq         $17, 0x10($sp)
/* 115B3C 00215A3C 0000B07F */  sq         $16, 0x0($sp)
/* 115B40 00215A40 288E8070 */  paddub     $17, $4, $0
/* 115B44 00215A44 C400828C */  lw         $2, 0xC4($4)
/* 115B48 00215A48 03004010 */  beqz       $2, .L00215A58
/* 115B4C 00215A4C 00000000 */   nop
/* 115B50 00215A50 10000010 */  b          .L00215A94
/* 115B54 00215A54 00000000 */   nop
.L00215A58:
/* 115B58 00215A58 01000424 */  addiu      $4, $0, 0x1
/* 115B5C 00215A5C 282E0070 */  paddub     $5, $0, $0
/* 115B60 00215A60 3C00A627 */  addiu      $6, $sp, 0x3C
/* 115B64 00215A64 C079040C */  jal        sceMcSync
/* 115B68 00215A68 00000000 */   nop
/* 115B6C 00215A6C 1F004010 */  beqz       $2, .L00215AEC
/* 115B70 00215A70 00000000 */   nop
/* 115B74 00215A74 C400228E */  lw         $2, 0xC4($17)
/* 115B78 00215A78 01004224 */  addiu      $2, $2, 0x1
/* 115B7C 00215A7C C40022AE */  sw         $2, 0xC4($17)
/* 115B80 00215A80 1C052426 */  addiu      $4, $17, 0x51C
/* 115B84 00215A84 282E0070 */  paddub     $5, $0, $0
/* 115B88 00215A88 A0020624 */  addiu      $6, $0, 0x2A0
/* 115B8C 00215A8C 5A0D040C */  jal        memset
/* 115B90 00215A90 00000000 */   nop
.L00215A94:
/* 115B94 00215A94 C400228E */  lw         $2, 0xC4($17)
/* 115B98 00215A98 FFFF4224 */  addiu      $2, $2, -0x1
/* 115B9C 00215A9C 83800200 */  sra        $16, $2, 2
/* 115BA0 00215AA0 28262072 */  paddub     $4, $17, $0
/* 115BA4 00215AA4 282E0072 */  paddub     $5, $16, $0
/* 115BA8 00215AA8 2855080C */  jal        GetSaveFileInfoFromMc__17CMemoryCardAccessFi
/* 115BAC 00215AAC 00000000 */   nop
/* 115BB0 00215AB0 01000424 */  addiu      $4, $0, 0x1
/* 115BB4 00215AB4 08004414 */  bne        $2, $4, .L00215AD8
/* 115BB8 00215AB8 00000000 */   nop
/* 115BBC 00215ABC 01000326 */  addiu      $3, $16, 0x1
/* 115BC0 00215AC0 0C006328 */  slti       $3, $3, 0xC
/* 115BC4 00215AC4 04006014 */  bnez       $3, .L00215AD8
/* 115BC8 00215AC8 00000000 */   nop
/* 115BCC 00215ACC 28168070 */  paddub     $2, $4, $0
/* 115BD0 00215AD0 07000010 */  b          .L00215AF0
/* 115BD4 00215AD4 00000000 */   nop
.L00215AD8:
/* 115BD8 00215AD8 04004104 */  bgez       $2, .L00215AEC
/* 115BDC 00215ADC 00000000 */   nop
/* 115BE0 00215AE0 FFFF0224 */  addiu      $2, $0, -0x1
/* 115BE4 00215AE4 02000010 */  b          .L00215AF0
/* 115BE8 00215AE8 00000000 */   nop
.L00215AEC:
/* 115BEC 00215AEC 28160070 */  paddub     $2, $0, $0
.L00215AF0:
/* 115BF0 00215AF0 2000BF7B */  lq         $31, 0x20($sp)
/* 115BF4 00215AF4 1000B17B */  lq         $17, 0x10($sp)
/* 115BF8 00215AF8 0000B07B */  lq         $16, 0x0($sp)
/* 115BFC 00215AFC 4000BD27 */  addiu      $sp, $sp, 0x40
/* 115C00 00215B00 0800E003 */  jr         $31
/* 115C04 00215B04 00000000 */   nop
/* 115C08 00215B08 00000000 */  nop
/* 115C0C 00215B0C 00000000 */  nop
