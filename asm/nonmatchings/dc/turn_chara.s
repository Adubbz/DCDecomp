.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel turn_chara__FP10CCharacterPff
/* 8B1E0 0018B0E0 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 8B1E4 0018B0E4 3000BF7F */  sq         $31, 0x30($sp)
/* 8B1E8 0018B0E8 2000B17F */  sq         $17, 0x20($sp)
/* 8B1EC 0018B0EC 1000B07F */  sq         $16, 0x10($sp)
/* 8B1F0 0018B0F0 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 8B1F4 0018B0F4 288E8070 */  paddub     $17, $4, $0
/* 8B1F8 0018B0F8 2886A070 */  paddub     $16, $5, $0
/* 8B1FC 0018B0FC 06650046 */  mov.s      $f20, $f12
/* 8B200 0018B100 4000A527 */  addiu      $5, $sp, 0x40
/* 8B204 0018B104 A000398E */  lw         $25, 0xA0($17)
/* 8B208 0018B108 A000398F */  lw         $25, 0xA0($25)
/* 8B20C 0018B10C 09F82003 */  jalr       $25
/* 8B210 0018B110 00000000 */   nop
/* 8B214 0018B114 28262072 */  paddub     $4, $17, $0
/* 8B218 0018B118 5000A527 */  addiu      $5, $sp, 0x50
/* 8B21C 0018B11C A000398E */  lw         $25, 0xA0($17)
/* 8B220 0018B120 5800398F */  lw         $25, 0x58($25)
/* 8B224 0018B124 09F82003 */  jalr       $25
/* 8B228 0018B128 00000000 */   nop
/* 8B22C 0018B12C 6000A427 */  addiu      $4, $sp, 0x60
/* 8B230 0018B130 282E0072 */  paddub     $5, $16, $0
/* 8B234 0018B134 4000A627 */  addiu      $6, $sp, 0x40
/* 8B238 0018B138 EE85040C */  jal        sceVu0SubVector
/* 8B23C 0018B13C 00000000 */   nop
/* 8B240 0018B140 6000ACC7 */  lwc1       $f12, 0x60($sp)
/* 8B244 0018B144 6800ADC7 */  lwc1       $f13, 0x68($sp)
/* 8B248 0018B148 5077040C */  jal        atan2f
/* 8B24C 0018B14C 00000000 */   nop
/* 8B250 0018B150 5400B027 */  addiu      $16, $sp, 0x54
/* 8B254 0018B154 00000CC6 */  lwc1       $f12, 0x0($16)
/* 8B258 0018B158 46030046 */  mov.s      $f13, $f0
/* 8B25C 0018B15C 86A30046 */  mov.s      $f14, $f20
/* 8B260 0018B160 28260070 */  paddub     $4, $0, $0
/* 8B264 0018B164 748E040C */  jal        AngleInterpolate__Ffffi
/* 8B268 0018B168 00000000 */   nop
/* 8B26C 0018B16C 000000E6 */  swc1       $f0, 0x0($16)
/* 8B270 0018B170 28262072 */  paddub     $4, $17, $0
/* 8B274 0018B174 5000A527 */  addiu      $5, $sp, 0x50
/* 8B278 0018B178 A000398E */  lw         $25, 0xA0($17)
/* 8B27C 0018B17C 3400398F */  lw         $25, 0x34($25)
/* 8B280 0018B180 09F82003 */  jalr       $25
/* 8B284 0018B184 00000000 */   nop
/* 8B288 0018B188 3000BF7B */  lq         $31, 0x30($sp)
/* 8B28C 0018B18C 2000B17B */  lq         $17, 0x20($sp)
/* 8B290 0018B190 1000B07B */  lq         $16, 0x10($sp)
/* 8B294 0018B194 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 8B298 0018B198 7000BD27 */  addiu      $sp, $sp, 0x70
/* 8B29C 0018B19C 0800E003 */  jr         $31
/* 8B2A0 0018B1A0 00000000 */   nop
/* 8B2A4 0018B1A4 00000000 */  nop
/* 8B2A8 0018B1A8 00000000 */  nop
/* 8B2AC 0018B1AC 00000000 */  nop
