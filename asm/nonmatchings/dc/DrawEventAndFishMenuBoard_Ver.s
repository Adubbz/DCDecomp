.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawEventAndFishMenuBoard_Ver__FP8CTexture8CRect_i_iiii
/* 124A10 00224910 10FFBD27 */  addiu      $sp, $sp, -0xF0
/* 124A14 00224914 7000BF7F */  sq         $31, 0x70($sp)
/* 124A18 00224918 6000B67F */  sq         $22, 0x60($sp)
/* 124A1C 0022491C 5000B57F */  sq         $21, 0x50($sp)
/* 124A20 00224920 4000B47F */  sq         $20, 0x40($sp)
/* 124A24 00224924 3000B37F */  sq         $19, 0x30($sp)
/* 124A28 00224928 2000B27F */  sq         $18, 0x20($sp)
/* 124A2C 0022492C 1000B17F */  sq         $17, 0x10($sp)
/* 124A30 00224930 0000B07F */  sq         $16, 0x0($sp)
/* 124A34 00224934 28B68070 */  paddub     $22, $4, $0
/* 124A38 00224938 28AEC070 */  paddub     $21, $6, $0
/* 124A3C 0022493C 28A6E070 */  paddub     $20, $7, $0
/* 124A40 00224940 289E2071 */  paddub     $19, $9, $0
/* 124A44 00224944 8000A327 */  addiu      $3, $sp, 0x80
/* 124A48 00224948 0000A278 */  lq         $2, 0x0($5)
/* 124A4C 0022494C 0000627C */  sq         $2, 0x0($3)
/* 124A50 00224950 8400B08F */  lw         $16, 0x84($sp)
/* 124A54 00224954 A000B5AF */  sw         $21, 0xA0($sp)
/* 124A58 00224958 A400A0AF */  sw         $0, 0xA4($sp)
/* 124A5C 0022495C A800B4AF */  sw         $20, 0xA8($sp)
/* 124A60 00224960 94000324 */  addiu      $3, $0, 0x94
/* 124A64 00224964 AC00A3AF */  sw         $3, 0xAC($sp)
/* 124A68 00224968 8800B18F */  lw         $17, 0x88($sp)
/* 124A6C 0022496C 8000A28F */  lw         $2, 0x80($sp)
/* 124A70 00224970 9000A2AF */  sw         $2, 0x90($sp)
/* 124A74 00224974 9400B0AF */  sw         $16, 0x94($sp)
/* 124A78 00224978 9800B1AF */  sw         $17, 0x98($sp)
/* 124A7C 0022497C 9C00A3AF */  sw         $3, 0x9C($sp)
/* 124A80 00224980 9000A527 */  addiu      $5, $sp, 0x90
/* 124A84 00224984 A000A627 */  addiu      $6, $sp, 0xA0
/* 124A88 00224988 283E6072 */  paddub     $7, $19, $0
/* 124A8C 0022498C C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 124A90 00224990 00000000 */   nop
/* 124A94 00224994 94001026 */  addiu      $16, $16, 0x94
/* 124A98 00224998 C000B5AF */  sw         $21, 0xC0($sp)
/* 124A9C 0022499C 94000224 */  addiu      $2, $0, 0x94
/* 124AA0 002249A0 C400A2AF */  sw         $2, 0xC4($sp)
/* 124AA4 002249A4 C800B4AF */  sw         $20, 0xC8($sp)
/* 124AA8 002249A8 14000224 */  addiu      $2, $0, 0x14
/* 124AAC 002249AC CC00A2AF */  sw         $2, 0xCC($sp)
/* 124AB0 002249B0 8C00A28F */  lw         $2, 0x8C($sp)
/* 124AB4 002249B4 32005224 */  addiu      $18, $2, 0x32
/* 124AB8 002249B8 8000A28F */  lw         $2, 0x80($sp)
/* 124ABC 002249BC B000A2AF */  sw         $2, 0xB0($sp)
/* 124AC0 002249C0 B400B0AF */  sw         $16, 0xB4($sp)
/* 124AC4 002249C4 B800B1AF */  sw         $17, 0xB8($sp)
/* 124AC8 002249C8 BC00B2AF */  sw         $18, 0xBC($sp)
/* 124ACC 002249CC 2826C072 */  paddub     $4, $22, $0
/* 124AD0 002249D0 B000A527 */  addiu      $5, $sp, 0xB0
/* 124AD4 002249D4 C000A627 */  addiu      $6, $sp, 0xC0
/* 124AD8 002249D8 283E6072 */  paddub     $7, $19, $0
/* 124ADC 002249DC C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 124AE0 002249E0 00000000 */   nop
/* 124AE4 002249E4 21801202 */  addu       $16, $16, $18
/* 124AE8 002249E8 E000B5AF */  sw         $21, 0xE0($sp)
/* 124AEC 002249EC C6000224 */  addiu      $2, $0, 0xC6
/* 124AF0 002249F0 E400A2AF */  sw         $2, 0xE4($sp)
/* 124AF4 002249F4 E800B4AF */  sw         $20, 0xE8($sp)
/* 124AF8 002249F8 1E000324 */  addiu      $3, $0, 0x1E
/* 124AFC 002249FC EC00A3AF */  sw         $3, 0xEC($sp)
/* 124B00 00224A00 8000A28F */  lw         $2, 0x80($sp)
/* 124B04 00224A04 D000A2AF */  sw         $2, 0xD0($sp)
/* 124B08 00224A08 D400B0AF */  sw         $16, 0xD4($sp)
/* 124B0C 00224A0C D800B1AF */  sw         $17, 0xD8($sp)
/* 124B10 00224A10 DC00A3AF */  sw         $3, 0xDC($sp)
/* 124B14 00224A14 2826C072 */  paddub     $4, $22, $0
/* 124B18 00224A18 D000A527 */  addiu      $5, $sp, 0xD0
/* 124B1C 00224A1C E000A627 */  addiu      $6, $sp, 0xE0
/* 124B20 00224A20 283E6072 */  paddub     $7, $19, $0
/* 124B24 00224A24 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 124B28 00224A28 00000000 */   nop
/* 124B2C 00224A2C 7000BF7B */  lq         $31, 0x70($sp)
/* 124B30 00224A30 6000B67B */  lq         $22, 0x60($sp)
/* 124B34 00224A34 5000B57B */  lq         $21, 0x50($sp)
/* 124B38 00224A38 4000B47B */  lq         $20, 0x40($sp)
/* 124B3C 00224A3C 3000B37B */  lq         $19, 0x30($sp)
/* 124B40 00224A40 2000B27B */  lq         $18, 0x20($sp)
/* 124B44 00224A44 1000B17B */  lq         $17, 0x10($sp)
/* 124B48 00224A48 0000B07B */  lq         $16, 0x0($sp)
/* 124B4C 00224A4C F000BD27 */  addiu      $sp, $sp, 0xF0
/* 124B50 00224A50 0800E003 */  jr         $31
/* 124B54 00224A54 00000000 */   nop
/* 124B58 00224A58 00000000 */  nop
/* 124B5C 00224A5C 00000000 */  nop
