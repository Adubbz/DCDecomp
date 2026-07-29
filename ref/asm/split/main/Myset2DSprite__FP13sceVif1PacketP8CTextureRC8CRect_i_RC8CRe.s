.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Myset2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_UcUcUcUc
/* 04CE80 0014CD80 60FFBD27 */  addiu       $29, $29, -0xA0
/* 04CE84 0014CD84 8000BF7F */  sq          $31, 0x80($29)
/* 04CE88 0014CD88 7000B77F */  sq          $23, 0x70($29)
/* 04CE8C 0014CD8C 6000B67F */  sq          $22, 0x60($29)
/* 04CE90 0014CD90 5000B57F */  sq          $21, 0x50($29)
/* 04CE94 0014CD94 4000B47F */  sq          $20, 0x40($29)
/* 04CE98 0014CD98 3000B37F */  sq          $19, 0x30($29)
/* 04CE9C 0014CD9C 2000B27F */  sq          $18, 0x20($29)
/* 04CEA0 0014CDA0 1000B17F */  sq          $17, 0x10($29)
/* 04CEA4 0014CDA4 0000B07F */  sq          $16, 0x0($29)
/* 04CEA8 0014CDA8 28AE8070 */  paddub      $21, $4, $0
/* 04CEAC 0014CDAC 28A6A070 */  paddub      $20, $5, $0
/* 04CEB0 0014CDB0 289EC070 */  paddub      $19, $6, $0
/* 04CEB4 0014CDB4 2896E070 */  paddub      $18, $7, $0
/* 04CEB8 0014CDB8 288E0071 */  paddub      $17, $8, $0
/* 04CEBC 0014CDBC 28862071 */  paddub      $16, $9, $0
/* 04CEC0 0014CDC0 28B64071 */  paddub      $22, $10, $0
/* 04CEC4 0014CDC4 28BE6071 */  paddub      $23, $11, $0
/* 04CEC8 0014CDC8 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 04CECC 0014CDCC 9C00A2AF */  sw          $2, 0x9C($29)
/* 04CED0 0014CDD0 282E0070 */  paddub      $5, $0, $0
/* 04CED4 0014CDD4 2083040C */  jal         sceVif1PkCnt
/* 04CED8 0014CDD8 00000000 */   nop
/* 04CEDC 0014CDDC 2826A072 */  paddub      $4, $21, $0
/* 04CEE0 0014CDE0 282E0070 */  paddub      $5, $0, $0
/* 04CEE4 0014CDE4 8E83040C */  jal         sceVif1PkOpenDirectCode
/* 04CEE8 0014CDE8 00000000 */   nop
/* 04CEEC 0014CDEC C701023C */  lui         $2, %hi(GiftagAD)
/* 04CEF0 0014CDF0 C0524224 */  addiu       $2, $2, %lo(GiftagAD)
/* 04CEF4 0014CDF4 2826A072 */  paddub      $4, $21, $0
/* 04CEF8 0014CDF8 00004578 */  lq          $5, 0x0($2)
/* 04CEFC 0014CDFC B083040C */  jal         sceVif1PkOpenGifTag
/* 04CF00 0014CE00 00000000 */   nop
/* 04CF04 0014CE04 2826A072 */  paddub      $4, $21, $0
/* 04CF08 0014CE08 14000524 */  addiu       $5, $0, 0x14
/* 04CF0C 0014CE0C 61000624 */  addiu       $6, $0, 0x61
/* 04CF10 0014CE10 0A84040C */  jal         sceVif1PkAddGsAD
/* 04CF14 0014CE14 00000000 */   nop
/* 04CF18 0014CE18 2826A072 */  paddub      $4, $21, $0
/* 04CF1C 0014CE1C 282E0070 */  paddub      $5, $0, $0
/* 04CF20 0014CE20 D6010624 */  addiu       $6, $0, 0x1D6
/* 04CF24 0014CE24 0A84040C */  jal         sceVif1PkAddGsAD
/* 04CF28 0014CE28 00000000 */   nop
/* 04CF2C 0014CE2C 9000A327 */  addiu       $3, $29, 0x90
/* 04CF30 0014CE30 F08B82DF */  ld          $2, -0x7410($28)
/* 04CF34 0014CE34 000062FC */  sd          $2, 0x0($3)
/* 04CF38 0014CE38 2826A072 */  paddub      $4, $21, $0
/* 04CF3C 0014CE3C 4E000524 */  addiu       $5, $0, 0x4E
/* 04CF40 0014CE40 000066DC */  ld          $6, 0x0($3)
/* 04CF44 0014CE44 0A84040C */  jal         sceVif1PkAddGsAD
/* 04CF48 0014CE48 00000000 */   nop
/* 04CF4C 0014CE4C FF002332 */  andi        $3, $17, 0xFF
/* 04CF50 0014CE50 FF000232 */  andi        $2, $16, 0xFF
/* 04CF54 0014CE54 38120200 */  dsll        $2, $2, 8
/* 04CF58 0014CE58 25186200 */  or          $3, $3, $2
/* 04CF5C 0014CE5C FF00C232 */  andi        $2, $22, 0xFF
/* 04CF60 0014CE60 38140200 */  dsll        $2, $2, 16
/* 04CF64 0014CE64 25184300 */  or          $3, $2, $3
/* 04CF68 0014CE68 FF00E232 */  andi        $2, $23, 0xFF
/* 04CF6C 0014CE6C 38160200 */  dsll        $2, $2, 24
/* 04CF70 0014CE70 25184300 */  or          $3, $2, $3
/* 04CF74 0014CE74 9C00A227 */  addiu       $2, $29, 0x9C
/* 04CF78 0014CE78 0000429C */  lwu         $2, 0x0($2)
/* 04CF7C 0014CE7C 3C100200 */  dsll32      $2, $2, 0
/* 04CF80 0014CE80 25304300 */  or          $6, $2, $3
/* 04CF84 0014CE84 2826A072 */  paddub      $4, $21, $0
/* 04CF88 0014CE88 01000524 */  addiu       $5, $0, 0x1
/* 04CF8C 0014CE8C 0A84040C */  jal         sceVif1PkAddGsAD
/* 04CF90 0014CE90 00000000 */   nop
/* 04CF94 0014CE94 2826A072 */  paddub      $4, $21, $0
/* 04CF98 0014CE98 06000524 */  addiu       $5, $0, 0x6
/* 04CF9C 0014CE9C 280086DE */  ld          $6, 0x28($20)
/* 04CFA0 0014CEA0 0A84040C */  jal         sceVif1PkAddGsAD
/* 04CFA4 0014CEA4 00000000 */   nop
/* 04CFA8 0014CEA8 0400428E */  lw          $2, 0x4($18)
/* 04CFAC 0014CEAC 00110200 */  sll         $2, $2, 4
/* 04CFB0 0014CEB0 381C0200 */  dsll        $3, $2, 16
/* 04CFB4 0014CEB4 0000428E */  lw          $2, 0x0($18)
/* 04CFB8 0014CEB8 00110200 */  sll         $2, $2, 4
/* 04CFBC 0014CEBC 25304300 */  or          $6, $2, $3
/* 04CFC0 0014CEC0 2826A072 */  paddub      $4, $21, $0
/* 04CFC4 0014CEC4 03000524 */  addiu       $5, $0, 0x3
/* 04CFC8 0014CEC8 0A84040C */  jal         sceVif1PkAddGsAD
/* 04CFCC 0014CECC 00000000 */   nop
/* 04CFD0 0014CED0 0400628E */  lw          $2, 0x4($19)
/* 04CFD4 0014CED4 C0100200 */  sll         $2, $2, 3
/* 04CFD8 0014CED8 00794224 */  addiu       $2, $2, 0x7900
/* 04CFDC 0014CEDC 3C100200 */  dsll32      $2, $2, 0
/* 04CFE0 0014CEE0 3F100200 */  dsra32      $2, $2, 0
/* 04CFE4 0014CEE4 381C0200 */  dsll        $3, $2, 16
/* 04CFE8 0014CEE8 0000628E */  lw          $2, 0x0($19)
/* 04CFEC 0014CEEC 00110200 */  sll         $2, $2, 4
/* 04CFF0 0014CEF0 006C4224 */  addiu       $2, $2, 0x6C00
/* 04CFF4 0014CEF4 3C100200 */  dsll32      $2, $2, 0
/* 04CFF8 0014CEF8 3F100200 */  dsra32      $2, $2, 0
/* 04CFFC 0014CEFC 25304300 */  or          $6, $2, $3
/* 04D000 0014CF00 2826A072 */  paddub      $4, $21, $0
/* 04D004 0014CF04 04000524 */  addiu       $5, $0, 0x4
/* 04D008 0014CF08 0A84040C */  jal         sceVif1PkAddGsAD
/* 04D00C 0014CF0C 00000000 */   nop
/* 04D010 0014CF10 0400438E */  lw          $3, 0x4($18)
/* 04D014 0014CF14 0C00428E */  lw          $2, 0xC($18)
/* 04D018 0014CF18 21106200 */  addu        $2, $3, $2
/* 04D01C 0014CF1C 00110200 */  sll         $2, $2, 4
/* 04D020 0014CF20 38240200 */  dsll        $4, $2, 16
/* 04D024 0014CF24 0000438E */  lw          $3, 0x0($18)
/* 04D028 0014CF28 0800428E */  lw          $2, 0x8($18)
/* 04D02C 0014CF2C 21106200 */  addu        $2, $3, $2
/* 04D030 0014CF30 00110200 */  sll         $2, $2, 4
/* 04D034 0014CF34 25304400 */  or          $6, $2, $4
/* 04D038 0014CF38 2826A072 */  paddub      $4, $21, $0
/* 04D03C 0014CF3C 03000524 */  addiu       $5, $0, 0x3
/* 04D040 0014CF40 0A84040C */  jal         sceVif1PkAddGsAD
/* 04D044 0014CF44 00000000 */   nop
/* 04D048 0014CF48 0400638E */  lw          $3, 0x4($19)
/* 04D04C 0014CF4C 0C00628E */  lw          $2, 0xC($19)
/* 04D050 0014CF50 21106200 */  addu        $2, $3, $2
/* 04D054 0014CF54 C0100200 */  sll         $2, $2, 3
/* 04D058 0014CF58 00794224 */  addiu       $2, $2, 0x7900
/* 04D05C 0014CF5C 3C100200 */  dsll32      $2, $2, 0
/* 04D060 0014CF60 3F100200 */  dsra32      $2, $2, 0
/* 04D064 0014CF64 38240200 */  dsll        $4, $2, 16
/* 04D068 0014CF68 0000638E */  lw          $3, 0x0($19)
/* 04D06C 0014CF6C 0800628E */  lw          $2, 0x8($19)
/* 04D070 0014CF70 21106200 */  addu        $2, $3, $2
/* 04D074 0014CF74 00110200 */  sll         $2, $2, 4
/* 04D078 0014CF78 FF6B4224 */  addiu       $2, $2, 0x6BFF
/* 04D07C 0014CF7C 3C100200 */  dsll32      $2, $2, 0
/* 04D080 0014CF80 3F100200 */  dsra32      $2, $2, 0
/* 04D084 0014CF84 25304400 */  or          $6, $2, $4
/* 04D088 0014CF88 2826A072 */  paddub      $4, $21, $0
/* 04D08C 0014CF8C 04000524 */  addiu       $5, $0, 0x4
/* 04D090 0014CF90 0A84040C */  jal         sceVif1PkAddGsAD
/* 04D094 0014CF94 00000000 */   nop
/* 04D098 0014CF98 2826A072 */  paddub      $4, $21, $0
/* 04D09C 0014CF9C B683040C */  jal         sceVif1PkCloseGifTag
/* 04D0A0 0014CFA0 00000000 */   nop
/* 04D0A4 0014CFA4 2826A072 */  paddub      $4, $21, $0
/* 04D0A8 0014CFA8 A483040C */  jal         sceVif1PkCloseDirectCode
/* 04D0AC 0014CFAC 00000000 */   nop
/* 04D0B0 0014CFB0 8000BF7B */  lq          $31, 0x80($29)
/* 04D0B4 0014CFB4 7000B77B */  lq          $23, 0x70($29)
/* 04D0B8 0014CFB8 6000B67B */  lq          $22, 0x60($29)
/* 04D0BC 0014CFBC 5000B57B */  lq          $21, 0x50($29)
/* 04D0C0 0014CFC0 4000B47B */  lq          $20, 0x40($29)
/* 04D0C4 0014CFC4 3000B37B */  lq          $19, 0x30($29)
/* 04D0C8 0014CFC8 2000B27B */  lq          $18, 0x20($29)
/* 04D0CC 0014CFCC 1000B17B */  lq          $17, 0x10($29)
/* 04D0D0 0014CFD0 0000B07B */  lq          $16, 0x0($29)
/* 04D0D4 0014CFD4 A000BD27 */  addiu       $29, $29, 0xA0
/* 04D0D8 0014CFD8 0800E003 */  jr          $31
/* 04D0DC 0014CFDC 00000000 */   nop
