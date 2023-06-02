.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AtoraTipObjectOrPerson__Fiiiii
/* 1191E0 002190E0 80FFBD27 */  addiu      $sp, $sp, -0x80
/* 1191E4 002190E4 4000BF7F */  sq         $31, 0x40($sp)
/* 1191E8 002190E8 3000B37F */  sq         $19, 0x30($sp)
/* 1191EC 002190EC 2000B27F */  sq         $18, 0x20($sp)
/* 1191F0 002190F0 1000B17F */  sq         $17, 0x10($sp)
/* 1191F4 002190F4 0000B07F */  sq         $16, 0x0($sp)
/* 1191F8 002190F8 289E8070 */  paddub     $19, $4, $0
/* 1191FC 002190FC 2896A070 */  paddub     $18, $5, $0
/* 119200 00219100 288EE070 */  paddub     $17, $7, $0
/* 119204 00219104 28860071 */  paddub     $16, $8, $0
/* 119208 00219108 2826C070 */  paddub     $4, $6, $0
/* 11920C 0021910C 7800A527 */  addiu      $5, $sp, 0x78
/* 119210 00219110 7C00A627 */  addiu      $6, $sp, 0x7C
/* 119214 00219114 7860080C */  jal        RetCTexAtora__FiRiRi
/* 119218 00219118 00000000 */   nop
/* 11921C 0021911C 7C00A48F */  lw         $4, 0x7C($sp)
/* 119220 00219120 7800A38F */  lw         $3, 0x78($sp)
/* 119224 00219124 5000A3AF */  sw         $3, 0x50($sp)
/* 119228 00219128 5400A4AF */  sw         $4, 0x54($sp)
/* 11922C 0021912C 24000324 */  addiu      $3, $0, 0x24
/* 119230 00219130 5800A827 */  addiu      $8, $sp, 0x58
/* 119234 00219134 000003AD */  sw         $3, 0x0($8)
/* 119238 00219138 5C00A727 */  addiu      $7, $sp, 0x5C
/* 11923C 0021913C 0000E3AC */  sw         $3, 0x0($7)
/* 119240 00219140 80000424 */  addiu      $4, $0, 0x80
/* 119244 00219144 282E8070 */  paddub     $5, $4, $0
/* 119248 00219148 28368070 */  paddub     $6, $4, $0
/* 11924C 0021914C 03002012 */  beqz       $17, .L0021915C
/* 119250 00219150 00000000 */   nop
/* 119254 00219154 44000524 */  addiu      $5, $0, 0x44
/* 119258 00219158 28360070 */  paddub     $6, $0, $0
.L0021915C:
/* 11925C 0021915C 0000E38C */  lw         $3, 0x0($7)
/* 119260 00219160 FFFF6724 */  addiu      $7, $3, -0x1
/* 119264 00219164 0000038D */  lw         $3, 0x0($8)
/* 119268 00219168 6000B3AF */  sw         $19, 0x60($sp)
/* 11926C 0021916C 6400B2AF */  sw         $18, 0x64($sp)
/* 119270 00219170 6800A3AF */  sw         $3, 0x68($sp)
/* 119274 00219174 6C00A7AF */  sw         $7, 0x6C($sp)
/* 119278 00219178 FF008730 */  andi       $7, $4, 0xFF
/* 11927C 0021917C FF00A830 */  andi       $8, $5, 0xFF
/* 119280 00219180 FF00C930 */  andi       $9, $6, 0xFF
/* 119284 00219184 28264070 */  paddub     $4, $2, $0
/* 119288 00219188 6000A527 */  addiu      $5, $sp, 0x60
/* 11928C 0021918C 5000A627 */  addiu      $6, $sp, 0x50
/* 119290 00219190 28560072 */  paddub     $10, $16, $0
/* 119294 00219194 E4B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_UcUcUci
/* 119298 00219198 00000000 */   nop
/* 11929C 0021919C 4000BF7B */  lq         $31, 0x40($sp)
/* 1192A0 002191A0 3000B37B */  lq         $19, 0x30($sp)
/* 1192A4 002191A4 2000B27B */  lq         $18, 0x20($sp)
/* 1192A8 002191A8 1000B17B */  lq         $17, 0x10($sp)
/* 1192AC 002191AC 0000B07B */  lq         $16, 0x0($sp)
/* 1192B0 002191B0 8000BD27 */  addiu      $sp, $sp, 0x80
/* 1192B4 002191B4 0800E003 */  jr         $31
/* 1192B8 002191B8 00000000 */   nop
/* 1192BC 002191BC 00000000 */  nop
