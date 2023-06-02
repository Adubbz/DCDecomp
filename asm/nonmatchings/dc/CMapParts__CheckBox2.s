.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckBox2__9CMapPartsFP7CBoxVu0
/* 9AFC0 0019AEC0 00FFBD27 */  addiu      $sp, $sp, -0x100
/* 9AFC4 0019AEC4 5000BF7F */  sq         $31, 0x50($sp)
/* 9AFC8 0019AEC8 4000B47F */  sq         $20, 0x40($sp)
/* 9AFCC 0019AECC 3000B37F */  sq         $19, 0x30($sp)
/* 9AFD0 0019AED0 2000B27F */  sq         $18, 0x20($sp)
/* 9AFD4 0019AED4 1000B17F */  sq         $17, 0x10($sp)
/* 9AFD8 0019AED8 0000B07F */  sq         $16, 0x0($sp)
/* 9AFDC 0019AEDC 28A68070 */  paddub     $20, $4, $0
/* 9AFE0 0019AEE0 289EA070 */  paddub     $19, $5, $0
/* 9AFE4 0019AEE4 6000A427 */  addiu      $4, $sp, 0x60
/* 9AFE8 0019AEE8 64008CC6 */  lwc1       $f12, 0x64($20)
/* 9AFEC 0019AEEC 948D040C */  jal        RotMatrixY__FPA4_ff
/* 9AFF0 0019AEF0 00000000 */   nop
/* 9AFF4 0019AEF4 A000A427 */  addiu      $4, $sp, 0xA0
/* 9AFF8 0019AEF8 40018526 */  addiu      $5, $20, 0x140
/* 9AFFC 0019AEFC 0C86040C */  jal        sceVu0CopyVector
/* 9B000 0019AF00 00000000 */   nop
/* 9B004 0019AF04 B000B027 */  addiu      $16, $sp, 0xB0
/* 9B008 0019AF08 28260072 */  paddub     $4, $16, $0
/* 9B00C 0019AF0C 40018526 */  addiu      $5, $20, 0x140
/* 9B010 0019AF10 0C86040C */  jal        sceVu0CopyVector
/* 9B014 0019AF14 00000000 */   nop
/* 9B018 0019AF18 C000B127 */  addiu      $17, $sp, 0xC0
/* 9B01C 0019AF1C 28262072 */  paddub     $4, $17, $0
/* 9B020 0019AF20 30018526 */  addiu      $5, $20, 0x130
/* 9B024 0019AF24 0C86040C */  jal        sceVu0CopyVector
/* 9B028 0019AF28 00000000 */   nop
/* 9B02C 0019AF2C D000B227 */  addiu      $18, $sp, 0xD0
/* 9B030 0019AF30 28264072 */  paddub     $4, $18, $0
/* 9B034 0019AF34 30018526 */  addiu      $5, $20, 0x130
/* 9B038 0019AF38 0C86040C */  jal        sceVu0CopyVector
/* 9B03C 0019AF3C 00000000 */   nop
/* 9B040 0019AF40 380180C6 */  lwc1       $f0, 0x138($20)
/* 9B044 0019AF44 B800A0E7 */  swc1       $f0, 0xB8($sp)
/* 9B048 0019AF48 480180C6 */  lwc1       $f0, 0x148($20)
/* 9B04C 0019AF4C C800A0E7 */  swc1       $f0, 0xC8($sp)
/* 9B050 0019AF50 9000A427 */  addiu      $4, $sp, 0x90
/* 9B054 0019AF54 10008526 */  addiu      $5, $20, 0x10
/* 9B058 0019AF58 0C86040C */  jal        sceVu0CopyVector
/* 9B05C 0019AF5C 00000000 */   nop
/* 9B060 0019AF60 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 9B064 0019AF64 9C00A2AF */  sw         $2, 0x9C($sp)
/* 9B068 0019AF68 4C0182AE */  sw         $2, 0x14C($20)
/* 9B06C 0019AF6C 3C0182AE */  sw         $2, 0x13C($20)
/* 9B070 0019AF70 A000A427 */  addiu      $4, $sp, 0xA0
/* 9B074 0019AF74 6000A527 */  addiu      $5, $sp, 0x60
/* 9B078 0019AF78 28368070 */  paddub     $6, $4, $0
/* 9B07C 0019AF7C 6285040C */  jal        sceVu0ApplyMatrix
/* 9B080 0019AF80 00000000 */   nop
/* 9B084 0019AF84 28260072 */  paddub     $4, $16, $0
/* 9B088 0019AF88 6000A527 */  addiu      $5, $sp, 0x60
/* 9B08C 0019AF8C 28360072 */  paddub     $6, $16, $0
/* 9B090 0019AF90 6285040C */  jal        sceVu0ApplyMatrix
/* 9B094 0019AF94 00000000 */   nop
/* 9B098 0019AF98 28262072 */  paddub     $4, $17, $0
/* 9B09C 0019AF9C 6000A527 */  addiu      $5, $sp, 0x60
/* 9B0A0 0019AFA0 28362072 */  paddub     $6, $17, $0
/* 9B0A4 0019AFA4 6285040C */  jal        sceVu0ApplyMatrix
/* 9B0A8 0019AFA8 00000000 */   nop
/* 9B0AC 0019AFAC 28264072 */  paddub     $4, $18, $0
/* 9B0B0 0019AFB0 6000A527 */  addiu      $5, $sp, 0x60
/* 9B0B4 0019AFB4 28364072 */  paddub     $6, $18, $0
/* 9B0B8 0019AFB8 6285040C */  jal        sceVu0ApplyMatrix
/* 9B0BC 0019AFBC 00000000 */   nop
/* 9B0C0 0019AFC0 E000A427 */  addiu      $4, $sp, 0xE0
/* 9B0C4 0019AFC4 F000A527 */  addiu      $5, $sp, 0xF0
/* 9B0C8 0019AFC8 A000A627 */  addiu      $6, $sp, 0xA0
/* 9B0CC 0019AFCC 283E0072 */  paddub     $7, $16, $0
/* 9B0D0 0019AFD0 28462072 */  paddub     $8, $17, $0
/* 9B0D4 0019AFD4 284E4072 */  paddub     $9, $18, $0
/* 9B0D8 0019AFD8 308C040C */  jal        VectorMaxMin__FPfPfPfPfPfPf
/* 9B0DC 0019AFDC 00000000 */   nop
/* 9B0E0 0019AFE0 100061C6 */  lwc1       $f1, 0x10($19)
/* 9B0E4 0019AFE4 E000A0C7 */  lwc1       $f0, 0xE0($sp)
/* 9B0E8 0019AFE8 34000146 */  c.lt.s     $f0, $f1
/* 9B0EC 0019AFEC 00000000 */  nop
/* 9B0F0 0019AFF0 04000045 */  bc1f       .L0019B004
/* 9B0F4 0019AFF4 00000000 */   nop
/* 9B0F8 0019AFF8 28160070 */  paddub     $2, $0, $0
/* 9B0FC 0019AFFC 1D000010 */  b          .L0019B074
/* 9B100 0019B000 00000000 */   nop
.L0019B004:
/* 9B104 0019B004 180061C6 */  lwc1       $f1, 0x18($19)
/* 9B108 0019B008 E800A0C7 */  lwc1       $f0, 0xE8($sp)
/* 9B10C 0019B00C 34000146 */  c.lt.s     $f0, $f1
/* 9B110 0019B010 00000000 */  nop
/* 9B114 0019B014 04000045 */  bc1f       .L0019B028
/* 9B118 0019B018 00000000 */   nop
/* 9B11C 0019B01C 28160070 */  paddub     $2, $0, $0
/* 9B120 0019B020 14000010 */  b          .L0019B074
/* 9B124 0019B024 00000000 */   nop
.L0019B028:
/* 9B128 0019B028 F000A1C7 */  lwc1       $f1, 0xF0($sp)
/* 9B12C 0019B02C 000060C6 */  lwc1       $f0, 0x0($19)
/* 9B130 0019B030 36080046 */  c.le.s     $f1, $f0
/* 9B134 0019B034 00000000 */  nop
/* 9B138 0019B038 04000145 */  bc1t       .L0019B04C
/* 9B13C 0019B03C 00000000 */   nop
/* 9B140 0019B040 28160070 */  paddub     $2, $0, $0
/* 9B144 0019B044 0B000010 */  b          .L0019B074
/* 9B148 0019B048 00000000 */   nop
.L0019B04C:
/* 9B14C 0019B04C 080061C6 */  lwc1       $f1, 0x8($19)
/* 9B150 0019B050 F800A0C7 */  lwc1       $f0, 0xF8($sp)
/* 9B154 0019B054 36000146 */  c.le.s     $f0, $f1
/* 9B158 0019B058 00000000 */  nop
/* 9B15C 0019B05C 04000145 */  bc1t       .L0019B070
/* 9B160 0019B060 00000000 */   nop
/* 9B164 0019B064 28160070 */  paddub     $2, $0, $0
/* 9B168 0019B068 02000010 */  b          .L0019B074
/* 9B16C 0019B06C 00000000 */   nop
.L0019B070:
/* 9B170 0019B070 01000224 */  addiu      $2, $0, 0x1
.L0019B074:
/* 9B174 0019B074 5000BF7B */  lq         $31, 0x50($sp)
/* 9B178 0019B078 4000B47B */  lq         $20, 0x40($sp)
/* 9B17C 0019B07C 3000B37B */  lq         $19, 0x30($sp)
/* 9B180 0019B080 2000B27B */  lq         $18, 0x20($sp)
/* 9B184 0019B084 1000B17B */  lq         $17, 0x10($sp)
/* 9B188 0019B088 0000B07B */  lq         $16, 0x0($sp)
/* 9B18C 0019B08C 0001BD27 */  addiu      $sp, $sp, 0x100
/* 9B190 0019B090 0800E003 */  jr         $31
/* 9B194 0019B094 00000000 */   nop
/* 9B198 0019B098 00000000 */  nop
/* 9B19C 0019B09C 00000000 */  nop
