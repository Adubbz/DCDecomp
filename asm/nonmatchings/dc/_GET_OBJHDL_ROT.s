.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_OBJHDL_ROT__FP12RS_STACKDATAi
/* BC2F0 001BC1F0 80FFBD27 */  addiu      $sp, $sp, -0x80
/* BC2F4 001BC1F4 2000BF7F */  sq         $31, 0x20($sp)
/* BC2F8 001BC1F8 1000B17F */  sq         $17, 0x10($sp)
/* BC2FC 001BC1FC 0000B07F */  sq         $16, 0x0($sp)
/* BC300 001BC200 2700023C */  lui        $2, %hi(_749)
/* BC304 001BC204 F0B24224 */  addiu      $2, $2, %lo(_749)
/* BC308 001BC208 3000A327 */  addiu      $3, $sp, 0x30
/* BC30C 001BC20C 00004278 */  lq         $2, 0x0($2)
/* BC310 001BC210 0000627C */  sq         $2, 0x0($3)
/* BC314 001BC214 08009124 */  addiu      $17, $4, 0x8
/* BC318 001BC218 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BC31C 001BC21C 00000000 */   nop
/* BC320 001BC220 28264070 */  paddub     $4, $2, $0
/* BC324 001BC224 80EC060C */  jal        GetObjHDL__Fi
/* BC328 001BC228 00000000 */   nop
/* BC32C 001BC22C 28864070 */  paddub     $16, $2, $0
/* BC330 001BC230 0800428C */  lw         $2, 0x8($2)
/* BC334 001BC234 10004014 */  bnez       $2, .L001BC278
/* BC338 001BC238 00000000 */   nop
/* BC33C 001BC23C 0000048E */  lw         $4, 0x0($16)
/* BC340 001BC240 0D008010 */  beqz       $4, .L001BC278
/* BC344 001BC244 00000000 */   nop
/* BC348 001BC248 4000A527 */  addiu      $5, $sp, 0x40
/* BC34C 001BC24C 6CA0040C */  jal        GetLWMatrix__6CFrameFPA4_f
/* BC350 001BC250 00000000 */   nop
/* BC354 001BC254 3000A0AF */  sw         $0, 0x30($sp)
/* BC358 001BC258 6000ACC7 */  lwc1       $f12, 0x60($sp)
/* BC35C 001BC25C 6800ADC7 */  lwc1       $f13, 0x68($sp)
/* BC360 001BC260 5077040C */  jal        atan2f
/* BC364 001BC264 00000000 */   nop
/* BC368 001BC268 3400A0E7 */  swc1       $f0, 0x34($sp)
/* BC36C 001BC26C 3800A0AF */  sw         $0, 0x38($sp)
/* BC370 001BC270 803F023C */  lui        $2, (0x3F800000 >> 16)
/* BC374 001BC274 3C00A2AF */  sw         $2, 0x3C($sp)
.L001BC278:
/* BC378 001BC278 0800038E */  lw         $3, 0x8($16)
/* BC37C 001BC27C 01000224 */  addiu      $2, $0, 0x1
/* BC380 001BC280 09006214 */  bne        $3, $2, .L001BC2A8
/* BC384 001BC284 00000000 */   nop
/* BC388 001BC288 0400048E */  lw         $4, 0x4($16)
/* BC38C 001BC28C 06008010 */  beqz       $4, .L001BC2A8
/* BC390 001BC290 00000000 */   nop
/* BC394 001BC294 3000A527 */  addiu      $5, $sp, 0x30
/* BC398 001BC298 A000998C */  lw         $25, 0xA0($4)
/* BC39C 001BC29C 5800398F */  lw         $25, 0x58($25)
/* BC3A0 001BC2A0 09F82003 */  jalr       $25
/* BC3A4 001BC2A4 00000000 */   nop
.L001BC2A8:
/* BC3A8 001BC2A8 28262072 */  paddub     $4, $17, $0
/* BC3AC 001BC2AC 08009124 */  addiu      $17, $4, 0x8
/* BC3B0 001BC2B0 3000ACC7 */  lwc1       $f12, 0x30($sp)
/* BC3B4 001BC2B4 78EE060C */  jal        SetStack__FP12RS_STACKDATAf_2
/* BC3B8 001BC2B8 00000000 */   nop
/* BC3BC 001BC2BC 28262072 */  paddub     $4, $17, $0
/* BC3C0 001BC2C0 08009124 */  addiu      $17, $4, 0x8
/* BC3C4 001BC2C4 3400ACC7 */  lwc1       $f12, 0x34($sp)
/* BC3C8 001BC2C8 78EE060C */  jal        SetStack__FP12RS_STACKDATAf_2
/* BC3CC 001BC2CC 00000000 */   nop
/* BC3D0 001BC2D0 28262072 */  paddub     $4, $17, $0
/* BC3D4 001BC2D4 3800ACC7 */  lwc1       $f12, 0x38($sp)
/* BC3D8 001BC2D8 78EE060C */  jal        SetStack__FP12RS_STACKDATAf_2
/* BC3DC 001BC2DC 00000000 */   nop
/* BC3E0 001BC2E0 01000224 */  addiu      $2, $0, 0x1
/* BC3E4 001BC2E4 2000BF7B */  lq         $31, 0x20($sp)
/* BC3E8 001BC2E8 1000B17B */  lq         $17, 0x10($sp)
/* BC3EC 001BC2EC 0000B07B */  lq         $16, 0x0($sp)
/* BC3F0 001BC2F0 8000BD27 */  addiu      $sp, $sp, 0x80
/* BC3F4 001BC2F4 0800E003 */  jr         $31
/* BC3F8 001BC2F8 00000000 */   nop
/* BC3FC 001BC2FC 00000000 */  nop
