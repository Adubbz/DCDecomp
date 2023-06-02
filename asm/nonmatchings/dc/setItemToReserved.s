.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel setItemToReserved__FPciiPcii
/* B1FF0 001B1EF0 60FFBD27 */  addiu      $sp, $sp, -0xA0
/* B1FF4 001B1EF4 8000BF7F */  sq         $31, 0x80($sp)
/* B1FF8 001B1EF8 7000B57F */  sq         $21, 0x70($sp)
/* B1FFC 001B1EFC 6000B47F */  sq         $20, 0x60($sp)
/* B2000 001B1F00 5000B37F */  sq         $19, 0x50($sp)
/* B2004 001B1F04 4000B27F */  sq         $18, 0x40($sp)
/* B2008 001B1F08 3000B17F */  sq         $17, 0x30($sp)
/* B200C 001B1F0C 2000B07F */  sq         $16, 0x20($sp)
/* B2010 001B1F10 28868070 */  paddub     $16, $4, $0
/* B2014 001B1F14 28AEA070 */  paddub     $21, $5, $0
/* B2018 001B1F18 28A6C070 */  paddub     $20, $6, $0
/* B201C 001B1F1C 289EE070 */  paddub     $19, $7, $0
/* B2020 001B1F20 28960071 */  paddub     $18, $8, $0
/* B2024 001B1F24 288E2071 */  paddub     $17, $9, $0
/* B2028 001B1F28 D48B848F */  lw         $4, -0x742C($gp)
/* B202C 001B1F2C 282E0070 */  paddub     $5, $0, $0
/* B2030 001B1F30 2083040C */  jal        sceVif1PkCnt
/* B2034 001B1F34 00000000 */   nop
/* B2038 001B1F38 D48B848F */  lw         $4, -0x742C($gp)
/* B203C 001B1F3C 282E0070 */  paddub     $5, $0, $0
/* B2040 001B1F40 8E83040C */  jal        sceVif1PkOpenDirectCode
/* B2044 001B1F44 00000000 */   nop
/* B2048 001B1F48 C701023C */  lui        $2, %hi(GiftagAD)
/* B204C 001B1F4C C0524224 */  addiu      $2, $2, %lo(GiftagAD)
/* B2050 001B1F50 D48B848F */  lw         $4, -0x742C($gp)
/* B2054 001B1F54 00004578 */  lq         $5, 0x0($2)
/* B2058 001B1F58 B083040C */  jal        sceVif1PkOpenGifTag
/* B205C 001B1F5C 00000000 */   nop
/* B2060 001B1F60 D48B848F */  lw         $4, -0x742C($gp)
/* B2064 001B1F64 3F000524 */  addiu      $5, $0, 0x3F
/* B2068 001B1F68 28360070 */  paddub     $6, $0, $0
/* B206C 001B1F6C 0A84040C */  jal        sceVif1PkAddGsAD
/* B2070 001B1F70 00000000 */   nop
/* B2074 001B1F74 D48B848F */  lw         $4, -0x742C($gp)
/* B2078 001B1F78 B683040C */  jal        sceVif1PkCloseGifTag
/* B207C 001B1F7C 00000000 */   nop
/* B2080 001B1F80 D48B848F */  lw         $4, -0x742C($gp)
/* B2084 001B1F84 A483040C */  jal        sceVif1PkCloseDirectCode
/* B2088 001B1F88 00000000 */   nop
/* B208C 001B1F8C C701023C */  lui        $2, %hi(TexManager)
/* B2090 001B1F90 70584424 */  addiu      $4, $2, %lo(TexManager)
/* B2094 001B1F94 282E0072 */  paddub     $5, $16, $0
/* B2098 001B1F98 FFFF0624 */  addiu      $6, $0, -0x1
/* B209C 001B1F9C B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* B20A0 001B1FA0 00000000 */   nop
/* B20A4 001B1FA4 28864070 */  paddub     $16, $2, $0
/* B20A8 001B1FA8 C701023C */  lui        $2, %hi(TexManager)
/* B20AC 001B1FAC 70584424 */  addiu      $4, $2, %lo(TexManager)
/* B20B0 001B1FB0 282E6072 */  paddub     $5, $19, $0
/* B20B4 001B1FB4 FFFF0624 */  addiu      $6, $0, -0x1
/* B20B8 001B1FB8 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* B20BC 001B1FBC 00000000 */   nop
/* B20C0 001B1FC0 2800038E */  lw         $3, 0x28($16)
/* B20C4 001B1FC4 FF3F6530 */  andi       $5, $3, 0x3FFF
/* B20C8 001B1FC8 2800438C */  lw         $3, 0x28($2)
/* B20CC 001B1FCC FF3F6930 */  andi       $9, $3, 0x3FFF
/* B20D0 001B1FD0 280003DE */  ld         $3, 0x28($16)
/* B20D4 001B1FD4 BA1B0300 */  dsrl       $3, $3, 14
/* B20D8 001B1FD8 3F006330 */  andi       $3, $3, 0x3F
/* B20DC 001B1FDC 3C300300 */  dsll32     $6, $3, 0
/* B20E0 001B1FE0 3F300600 */  dsra32     $6, $6, 0
/* B20E4 001B1FE4 280042DC */  ld         $2, 0x28($2)
/* B20E8 001B1FE8 BA130200 */  dsrl       $2, $2, 14
/* B20EC 001B1FEC 3F004230 */  andi       $2, $2, 0x3F
/* B20F0 001B1FF0 3C500200 */  dsll32     $10, $2, 0
/* B20F4 001B1FF4 3F500A00 */  dsra32     $10, $10, 0
/* B20F8 001B1FF8 9000B5AF */  sw         $21, 0x90($sp)
/* B20FC 001B1FFC 9400B4AF */  sw         $20, 0x94($sp)
/* B2100 001B2000 20000224 */  addiu      $2, $0, 0x20
/* B2104 001B2004 9800A2AF */  sw         $2, 0x98($sp)
/* B2108 001B2008 9C00A2AF */  sw         $2, 0x9C($sp)
/* B210C 001B200C 0000B2FF */  sd         $18, 0x0($sp)
/* B2110 001B2010 0800B1FF */  sd         $17, 0x8($sp)
/* B2114 001B2014 1000A0FF */  sd         $0, 0x10($sp)
/* B2118 001B2018 D48B848F */  lw         $4, -0x742C($gp)
/* B211C 001B201C 13000724 */  addiu      $7, $0, 0x13
/* B2120 001B2020 9000A827 */  addiu      $8, $sp, 0x90
/* B2124 001B2024 285EE070 */  paddub     $11, $7, $0
/* B2128 001B2028 9801050C */  jal        MoveImageTest__FP13sceVif1PacketiiiRC8CRect_i_iiiiii
/* B212C 001B202C 00000000 */   nop
/* B2130 001B2030 D48B848F */  lw         $4, -0x742C($gp)
/* B2134 001B2034 282E0070 */  paddub     $5, $0, $0
/* B2138 001B2038 2083040C */  jal        sceVif1PkCnt
/* B213C 001B203C 00000000 */   nop
/* B2140 001B2040 D48B848F */  lw         $4, -0x742C($gp)
/* B2144 001B2044 282E0070 */  paddub     $5, $0, $0
/* B2148 001B2048 8E83040C */  jal        sceVif1PkOpenDirectCode
/* B214C 001B204C 00000000 */   nop
/* B2150 001B2050 C701023C */  lui        $2, %hi(GiftagAD)
/* B2154 001B2054 C0524224 */  addiu      $2, $2, %lo(GiftagAD)
/* B2158 001B2058 D48B848F */  lw         $4, -0x742C($gp)
/* B215C 001B205C 00004578 */  lq         $5, 0x0($2)
/* B2160 001B2060 B083040C */  jal        sceVif1PkOpenGifTag
/* B2164 001B2064 00000000 */   nop
/* B2168 001B2068 D48B848F */  lw         $4, -0x742C($gp)
/* B216C 001B206C 3F000524 */  addiu      $5, $0, 0x3F
/* B2170 001B2070 28360070 */  paddub     $6, $0, $0
/* B2174 001B2074 0A84040C */  jal        sceVif1PkAddGsAD
/* B2178 001B2078 00000000 */   nop
/* B217C 001B207C D48B848F */  lw         $4, -0x742C($gp)
/* B2180 001B2080 B683040C */  jal        sceVif1PkCloseGifTag
/* B2184 001B2084 00000000 */   nop
/* B2188 001B2088 D48B848F */  lw         $4, -0x742C($gp)
/* B218C 001B208C A483040C */  jal        sceVif1PkCloseDirectCode
/* B2190 001B2090 00000000 */   nop
/* B2194 001B2094 8000BF7B */  lq         $31, 0x80($sp)
/* B2198 001B2098 7000B57B */  lq         $21, 0x70($sp)
/* B219C 001B209C 6000B47B */  lq         $20, 0x60($sp)
/* B21A0 001B20A0 5000B37B */  lq         $19, 0x50($sp)
/* B21A4 001B20A4 4000B27B */  lq         $18, 0x40($sp)
/* B21A8 001B20A8 3000B17B */  lq         $17, 0x30($sp)
/* B21AC 001B20AC 2000B07B */  lq         $16, 0x20($sp)
/* B21B0 001B20B0 A000BD27 */  addiu      $sp, $sp, 0xA0
/* B21B4 001B20B4 0800E003 */  jr         $31
/* B21B8 001B20B8 00000000 */   nop
/* B21BC 001B20BC 00000000 */  nop
