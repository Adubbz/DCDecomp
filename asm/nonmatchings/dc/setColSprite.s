.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel setColSprite__FP13sceVif1PacketPiPiPiPiUcUcUcUc
/* 5DFD0 0015DED0 60FFBD27 */  addiu      $sp, $sp, -0xA0
/* 5DFD4 0015DED4 8000BF7F */  sq         $31, 0x80($sp)
/* 5DFD8 0015DED8 7000B77F */  sq         $23, 0x70($sp)
/* 5DFDC 0015DEDC 6000B67F */  sq         $22, 0x60($sp)
/* 5DFE0 0015DEE0 5000B57F */  sq         $21, 0x50($sp)
/* 5DFE4 0015DEE4 4000B47F */  sq         $20, 0x40($sp)
/* 5DFE8 0015DEE8 3000B37F */  sq         $19, 0x30($sp)
/* 5DFEC 0015DEEC 2000B27F */  sq         $18, 0x20($sp)
/* 5DFF0 0015DEF0 1000B17F */  sq         $17, 0x10($sp)
/* 5DFF4 0015DEF4 0000B07F */  sq         $16, 0x0($sp)
/* 5DFF8 0015DEF8 28B68070 */  paddub     $22, $4, $0
/* 5DFFC 0015DEFC 28AEA070 */  paddub     $21, $5, $0
/* 5E000 0015DF00 28A6C070 */  paddub     $20, $6, $0
/* 5E004 0015DF04 289EE070 */  paddub     $19, $7, $0
/* 5E008 0015DF08 28960071 */  paddub     $18, $8, $0
/* 5E00C 0015DF0C 288E2071 */  paddub     $17, $9, $0
/* 5E010 0015DF10 28864071 */  paddub     $16, $10, $0
/* 5E014 0015DF14 28BE6071 */  paddub     $23, $11, $0
/* 5E018 0015DF18 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 5E01C 0015DF1C 9C00A2AF */  sw         $2, 0x9C($sp)
/* 5E020 0015DF20 282E0070 */  paddub     $5, $0, $0
/* 5E024 0015DF24 2083040C */  jal        sceVif1PkCnt
/* 5E028 0015DF28 00000000 */   nop
/* 5E02C 0015DF2C 2826C072 */  paddub     $4, $22, $0
/* 5E030 0015DF30 282E0070 */  paddub     $5, $0, $0
/* 5E034 0015DF34 8E83040C */  jal        sceVif1PkOpenDirectCode
/* 5E038 0015DF38 00000000 */   nop
/* 5E03C 0015DF3C C701023C */  lui        $2, %hi(GiftagAD)
/* 5E040 0015DF40 C0524224 */  addiu      $2, $2, %lo(GiftagAD)
/* 5E044 0015DF44 2826C072 */  paddub     $4, $22, $0
/* 5E048 0015DF48 00004578 */  lq         $5, 0x0($2)
/* 5E04C 0015DF4C B083040C */  jal        sceVif1PkOpenGifTag
/* 5E050 0015DF50 00000000 */   nop
/* 5E054 0015DF54 2826C072 */  paddub     $4, $22, $0
/* 5E058 0015DF58 14000524 */  addiu      $5, $0, 0x14
/* 5E05C 0015DF5C 61000624 */  addiu      $6, $0, 0x61
/* 5E060 0015DF60 0A84040C */  jal        sceVif1PkAddGsAD
/* 5E064 0015DF64 00000000 */   nop
/* 5E068 0015DF68 2826C072 */  paddub     $4, $22, $0
/* 5E06C 0015DF6C 282E0070 */  paddub     $5, $0, $0
/* 5E070 0015DF70 44000624 */  addiu      $6, $0, 0x44
/* 5E074 0015DF74 0A84040C */  jal        sceVif1PkAddGsAD
/* 5E078 0015DF78 00000000 */   nop
/* 5E07C 0015DF7C FF002332 */  andi       $3, $17, 0xFF
/* 5E080 0015DF80 FF000232 */  andi       $2, $16, 0xFF
/* 5E084 0015DF84 38120200 */  dsll       $2, $2, 8
/* 5E088 0015DF88 25186200 */  or         $3, $3, $2
/* 5E08C 0015DF8C FF00E232 */  andi       $2, $23, 0xFF
/* 5E090 0015DF90 38140200 */  dsll       $2, $2, 16
/* 5E094 0015DF94 25184300 */  or         $3, $2, $3
/* 5E098 0015DF98 A000A293 */  lbu        $2, 0xA0($sp)
/* 5E09C 0015DF9C 38160200 */  dsll       $2, $2, 24
/* 5E0A0 0015DFA0 25184300 */  or         $3, $2, $3
/* 5E0A4 0015DFA4 9C00A227 */  addiu      $2, $sp, 0x9C
/* 5E0A8 0015DFA8 0000429C */  lwu        $2, 0x0($2)
/* 5E0AC 0015DFAC 3C100200 */  dsll32     $2, $2, 0
/* 5E0B0 0015DFB0 25304300 */  or         $6, $2, $3
/* 5E0B4 0015DFB4 2826C072 */  paddub     $4, $22, $0
/* 5E0B8 0015DFB8 01000524 */  addiu      $5, $0, 0x1
/* 5E0BC 0015DFBC 0A84040C */  jal        sceVif1PkAddGsAD
/* 5E0C0 0015DFC0 00000000 */   nop
/* 5E0C4 0015DFC4 0400A28E */  lw         $2, 0x4($21)
/* 5E0C8 0015DFC8 381C0200 */  dsll       $3, $2, 16
/* 5E0CC 0015DFCC 0000A28E */  lw         $2, 0x0($21)
/* 5E0D0 0015DFD0 25184300 */  or         $3, $2, $3
/* 5E0D4 0015DFD4 0800A28E */  lw         $2, 0x8($21)
/* 5E0D8 0015DFD8 3C100200 */  dsll32     $2, $2, 0
/* 5E0DC 0015DFDC 25304300 */  or         $6, $2, $3
/* 5E0E0 0015DFE0 2826C072 */  paddub     $4, $22, $0
/* 5E0E4 0015DFE4 05000524 */  addiu      $5, $0, 0x5
/* 5E0E8 0015DFE8 0A84040C */  jal        sceVif1PkAddGsAD
/* 5E0EC 0015DFEC 00000000 */   nop
/* 5E0F0 0015DFF0 0400828E */  lw         $2, 0x4($20)
/* 5E0F4 0015DFF4 381C0200 */  dsll       $3, $2, 16
/* 5E0F8 0015DFF8 0000828E */  lw         $2, 0x0($20)
/* 5E0FC 0015DFFC 25184300 */  or         $3, $2, $3
/* 5E100 0015E000 0800828E */  lw         $2, 0x8($20)
/* 5E104 0015E004 3C100200 */  dsll32     $2, $2, 0
/* 5E108 0015E008 25304300 */  or         $6, $2, $3
/* 5E10C 0015E00C 2826C072 */  paddub     $4, $22, $0
/* 5E110 0015E010 05000524 */  addiu      $5, $0, 0x5
/* 5E114 0015E014 0A84040C */  jal        sceVif1PkAddGsAD
/* 5E118 0015E018 00000000 */   nop
/* 5E11C 0015E01C 0400628E */  lw         $2, 0x4($19)
/* 5E120 0015E020 381C0200 */  dsll       $3, $2, 16
/* 5E124 0015E024 0000628E */  lw         $2, 0x0($19)
/* 5E128 0015E028 25184300 */  or         $3, $2, $3
/* 5E12C 0015E02C 0800628E */  lw         $2, 0x8($19)
/* 5E130 0015E030 3C100200 */  dsll32     $2, $2, 0
/* 5E134 0015E034 25304300 */  or         $6, $2, $3
/* 5E138 0015E038 2826C072 */  paddub     $4, $22, $0
/* 5E13C 0015E03C 05000524 */  addiu      $5, $0, 0x5
/* 5E140 0015E040 0A84040C */  jal        sceVif1PkAddGsAD
/* 5E144 0015E044 00000000 */   nop
/* 5E148 0015E048 0400428E */  lw         $2, 0x4($18)
/* 5E14C 0015E04C 381C0200 */  dsll       $3, $2, 16
/* 5E150 0015E050 0000428E */  lw         $2, 0x0($18)
/* 5E154 0015E054 25184300 */  or         $3, $2, $3
/* 5E158 0015E058 0800428E */  lw         $2, 0x8($18)
/* 5E15C 0015E05C 3C100200 */  dsll32     $2, $2, 0
/* 5E160 0015E060 25304300 */  or         $6, $2, $3
/* 5E164 0015E064 2826C072 */  paddub     $4, $22, $0
/* 5E168 0015E068 05000524 */  addiu      $5, $0, 0x5
/* 5E16C 0015E06C 0A84040C */  jal        sceVif1PkAddGsAD
/* 5E170 0015E070 00000000 */   nop
/* 5E174 0015E074 2826C072 */  paddub     $4, $22, $0
/* 5E178 0015E078 B683040C */  jal        sceVif1PkCloseGifTag
/* 5E17C 0015E07C 00000000 */   nop
/* 5E180 0015E080 2826C072 */  paddub     $4, $22, $0
/* 5E184 0015E084 A483040C */  jal        sceVif1PkCloseDirectCode
/* 5E188 0015E088 00000000 */   nop
/* 5E18C 0015E08C 2826C072 */  paddub     $4, $22, $0
/* 5E190 0015E090 282E0070 */  paddub     $5, $0, $0
/* 5E194 0015E094 2083040C */  jal        sceVif1PkCnt
/* 5E198 0015E098 00000000 */   nop
/* 5E19C 0015E09C 2826C072 */  paddub     $4, $22, $0
/* 5E1A0 0015E0A0 282E0070 */  paddub     $5, $0, $0
/* 5E1A4 0015E0A4 8E83040C */  jal        sceVif1PkOpenDirectCode
/* 5E1A8 0015E0A8 00000000 */   nop
/* 5E1AC 0015E0AC C701023C */  lui        $2, %hi(GiftagAD)
/* 5E1B0 0015E0B0 C0524224 */  addiu      $2, $2, %lo(GiftagAD)
/* 5E1B4 0015E0B4 2826C072 */  paddub     $4, $22, $0
/* 5E1B8 0015E0B8 00004578 */  lq         $5, 0x0($2)
/* 5E1BC 0015E0BC B083040C */  jal        sceVif1PkOpenGifTag
/* 5E1C0 0015E0C0 00000000 */   nop
/* 5E1C4 0015E0C4 2826C072 */  paddub     $4, $22, $0
/* 5E1C8 0015E0C8 3F000524 */  addiu      $5, $0, 0x3F
/* 5E1CC 0015E0CC 28360070 */  paddub     $6, $0, $0
/* 5E1D0 0015E0D0 0A84040C */  jal        sceVif1PkAddGsAD
/* 5E1D4 0015E0D4 00000000 */   nop
/* 5E1D8 0015E0D8 2826C072 */  paddub     $4, $22, $0
/* 5E1DC 0015E0DC B683040C */  jal        sceVif1PkCloseGifTag
/* 5E1E0 0015E0E0 00000000 */   nop
/* 5E1E4 0015E0E4 2826C072 */  paddub     $4, $22, $0
/* 5E1E8 0015E0E8 A483040C */  jal        sceVif1PkCloseDirectCode
/* 5E1EC 0015E0EC 00000000 */   nop
/* 5E1F0 0015E0F0 8000BF7B */  lq         $31, 0x80($sp)
/* 5E1F4 0015E0F4 7000B77B */  lq         $23, 0x70($sp)
/* 5E1F8 0015E0F8 6000B67B */  lq         $22, 0x60($sp)
/* 5E1FC 0015E0FC 5000B57B */  lq         $21, 0x50($sp)
/* 5E200 0015E100 4000B47B */  lq         $20, 0x40($sp)
/* 5E204 0015E104 3000B37B */  lq         $19, 0x30($sp)
/* 5E208 0015E108 2000B27B */  lq         $18, 0x20($sp)
/* 5E20C 0015E10C 1000B17B */  lq         $17, 0x10($sp)
/* 5E210 0015E110 0000B07B */  lq         $16, 0x0($sp)
/* 5E214 0015E114 A000BD27 */  addiu      $sp, $sp, 0xA0
/* 5E218 0015E118 0800E003 */  jr         $31
/* 5E21C 0015E11C 00000000 */   nop
