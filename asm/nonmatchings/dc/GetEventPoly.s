.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetEventPoly__FPfPfP6CCPolyPiPfP6CCPolyii
/* 4AE90 0014AD90 B0FCBD27 */  addiu      $sp, $sp, -0x350
/* 4AE94 0014AD94 9000BF7F */  sq         $31, 0x90($sp)
/* 4AE98 0014AD98 8000B77F */  sq         $23, 0x80($sp)
/* 4AE9C 0014AD9C 7000B67F */  sq         $22, 0x70($sp)
/* 4AEA0 0014ADA0 6000B57F */  sq         $21, 0x60($sp)
/* 4AEA4 0014ADA4 5000B47F */  sq         $20, 0x50($sp)
/* 4AEA8 0014ADA8 4000B37F */  sq         $19, 0x40($sp)
/* 4AEAC 0014ADAC 3000B27F */  sq         $18, 0x30($sp)
/* 4AEB0 0014ADB0 2000B17F */  sq         $17, 0x20($sp)
/* 4AEB4 0014ADB4 1000B07F */  sq         $16, 0x10($sp)
/* 4AEB8 0014ADB8 28B68070 */  paddub     $22, $4, $0
/* 4AEBC 0014ADBC 28AEA070 */  paddub     $21, $5, $0
/* 4AEC0 0014ADC0 28A6C070 */  paddub     $20, $6, $0
/* 4AEC4 0014ADC4 289EE070 */  paddub     $19, $7, $0
/* 4AEC8 0014ADC8 28960071 */  paddub     $18, $8, $0
/* 4AECC 0014ADCC 288E2071 */  paddub     $17, $9, $0
/* 4AED0 0014ADD0 28864071 */  paddub     $16, $10, $0
/* 4AED4 0014ADD4 28BE6071 */  paddub     $23, $11, $0
/* 4AED8 0014ADD8 2001A427 */  addiu      $4, $sp, 0x120
/* 4AEDC 0014ADDC 282EC072 */  paddub     $5, $22, $0
/* 4AEE0 0014ADE0 0C86040C */  jal        sceVu0CopyVector
/* 4AEE4 0014ADE4 00000000 */   nop
/* 4AEE8 0014ADE8 3001A427 */  addiu      $4, $sp, 0x130
/* 4AEEC 0014ADEC 282EC072 */  paddub     $5, $22, $0
/* 4AEF0 0014ADF0 2836A072 */  paddub     $6, $21, $0
/* 4AEF4 0014ADF4 E885040C */  jal        sceVu0AddVector
/* 4AEF8 0014ADF8 00000000 */   nop
/* 4AEFC 0014ADFC 0000B7FF */  sd         $23, 0x0($sp)
/* 4AF00 0014AE00 28262072 */  paddub     $4, $17, $0
/* 4AF04 0014AE04 282E0072 */  paddub     $5, $16, $0
/* 4AF08 0014AE08 2001A627 */  addiu      $6, $sp, 0x120
/* 4AF0C 0014AE0C 3001A727 */  addiu      $7, $sp, 0x130
/* 4AF10 0014AE10 20000824 */  addiu      $8, $0, 0x20
/* 4AF14 0014AE14 A000A927 */  addiu      $9, $sp, 0xA0
/* 4AF18 0014AE18 4001AA27 */  addiu      $10, $sp, 0x140
/* 4AF1C 0014AE1C 01000B24 */  addiu      $11, $0, 0x1
/* 4AF20 0014AE20 8C28050C */  jal        CheckHits__FP6CCPolyiPfPfiPiPA4_fii
/* 4AF24 0014AE24 00000000 */   nop
/* 4AF28 0014AE28 28864070 */  paddub     $16, $2, $0
/* 4AF2C 0014AE2C 4003A0A7 */  sh         $0, 0x340($sp)
/* 4AF30 0014AE30 4203B527 */  addiu      $21, $sp, 0x342
/* 4AF34 0014AE34 0000A0A6 */  sh         $0, 0x0($21)
/* 4AF38 0014AE38 4403B627 */  addiu      $22, $sp, 0x344
/* 4AF3C 0014AE3C 0000C0A6 */  sh         $0, 0x0($22)
/* 4AF40 0014AE40 FFFF0224 */  addiu      $2, $0, -0x1
/* 4AF44 0014AE44 000062AE */  sw         $2, 0x0($19)
/* 4AF48 0014AE48 1500001A */  blez       $16, .L0014AEA0
/* 4AF4C 0014AE4C 00000000 */   nop
/* 4AF50 0014AE50 A000A38F */  lw         $3, 0xA0($sp)
/* 4AF54 0014AE54 80100300 */  sll        $2, $3, 2
/* 4AF58 0014AE58 21104300 */  addu       $2, $2, $3
/* 4AF5C 0014AE5C 00110200 */  sll        $2, $2, 4
/* 4AF60 0014AE60 21282202 */  addu       $5, $17, $2
/* 4AF64 0014AE64 05000324 */  addiu      $3, $0, 0x5
/* 4AF68 0014AE68 28268072 */  paddub     $4, $20, $0
.L0014AE6C:
/* 4AF6C 0014AE6C 0000A278 */  lq         $2, 0x0($5)
/* 4AF70 0014AE70 1000A524 */  addiu      $5, $5, 0x10
/* 4AF74 0014AE74 FFFF6324 */  addiu      $3, $3, -0x1
/* 4AF78 0014AE78 0000827C */  sq         $2, 0x0($4)
/* 4AF7C 0014AE7C 10008424 */  addiu      $4, $4, 0x10
/* 4AF80 0014AE80 FAFF601C */  bgtz       $3, .L0014AE6C
/* 4AF84 0014AE84 00000000 */   nop
/* 4AF88 0014AE88 A000A28F */  lw         $2, 0xA0($sp)
/* 4AF8C 0014AE8C 000062AE */  sw         $2, 0x0($19)
/* 4AF90 0014AE90 28264072 */  paddub     $4, $18, $0
/* 4AF94 0014AE94 4001A527 */  addiu      $5, $sp, 0x140
/* 4AF98 0014AE98 0C86040C */  jal        sceVu0CopyVector
/* 4AF9C 0014AE9C 00000000 */   nop
.L0014AEA0:
/* 4AFA0 0014AEA0 28260070 */  paddub     $4, $0, $0
/* 4AFA4 0014AEA4 19000010 */  b          .L0014AF0C
/* 4AFA8 0014AEA8 00000000 */   nop
.L0014AEAC:
/* 4AFAC 0014AEAC 80100400 */  sll        $2, $4, 2
/* 4AFB0 0014AEB0 21105D00 */  addu       $2, $2, $sp
/* 4AFB4 0014AEB4 A000438C */  lw         $3, 0xA0($2)
/* 4AFB8 0014AEB8 80100300 */  sll        $2, $3, 2
/* 4AFBC 0014AEBC 21104300 */  addu       $2, $2, $3
/* 4AFC0 0014AEC0 00110200 */  sll        $2, $2, 4
/* 4AFC4 0014AEC4 21102202 */  addu       $2, $17, $2
/* 4AFC8 0014AEC8 40004324 */  addiu      $3, $2, 0x40
/* 4AFCC 0014AECC 4003A287 */  lh         $2, 0x340($sp)
/* 4AFD0 0014AED0 03004014 */  bnez       $2, .L0014AEE0
/* 4AFD4 0014AED4 00000000 */   nop
/* 4AFD8 0014AED8 00006284 */  lh         $2, 0x0($3)
/* 4AFDC 0014AEDC 4003A2A7 */  sh         $2, 0x340($sp)
.L0014AEE0:
/* 4AFE0 0014AEE0 0000A286 */  lh         $2, 0x0($21)
/* 4AFE4 0014AEE4 03004014 */  bnez       $2, .L0014AEF4
/* 4AFE8 0014AEE8 00000000 */   nop
/* 4AFEC 0014AEEC 02006284 */  lh         $2, 0x2($3)
/* 4AFF0 0014AEF0 0000A2A6 */  sh         $2, 0x0($21)
.L0014AEF4:
/* 4AFF4 0014AEF4 0000C286 */  lh         $2, 0x0($22)
/* 4AFF8 0014AEF8 03004014 */  bnez       $2, .L0014AF08
/* 4AFFC 0014AEFC 00000000 */   nop
/* 4B000 0014AF00 04006284 */  lh         $2, 0x4($3)
/* 4B004 0014AF04 0000C2A6 */  sh         $2, 0x0($22)
.L0014AF08:
/* 4B008 0014AF08 01008424 */  addiu      $4, $4, 0x1
.L0014AF0C:
/* 4B00C 0014AF0C 2A109000 */  slt        $2, $4, $16
/* 4B010 0014AF10 E6FF4014 */  bnez       $2, .L0014AEAC
/* 4B014 0014AF14 00000000 */   nop
/* 4B018 0014AF18 4003A227 */  addiu      $2, $sp, 0x340
/* 4B01C 0014AF1C 000043C4 */  lwc1       $f3, 0x0($2)
/* 4B020 0014AF20 040042C4 */  lwc1       $f2, 0x4($2)
/* 4B024 0014AF24 080041C4 */  lwc1       $f1, 0x8($2)
/* 4B028 0014AF28 0C0040C4 */  lwc1       $f0, 0xC($2)
/* 4B02C 0014AF2C 400083E6 */  swc1       $f3, 0x40($20)
/* 4B030 0014AF30 440082E6 */  swc1       $f2, 0x44($20)
/* 4B034 0014AF34 480081E6 */  swc1       $f1, 0x48($20)
/* 4B038 0014AF38 4C0080E6 */  swc1       $f0, 0x4C($20)
/* 4B03C 0014AF3C 4003A287 */  lh         $2, 0x340($sp)
/* 4B040 0014AF40 9000BF7B */  lq         $31, 0x90($sp)
/* 4B044 0014AF44 8000B77B */  lq         $23, 0x80($sp)
/* 4B048 0014AF48 7000B67B */  lq         $22, 0x70($sp)
/* 4B04C 0014AF4C 6000B57B */  lq         $21, 0x60($sp)
/* 4B050 0014AF50 5000B47B */  lq         $20, 0x50($sp)
/* 4B054 0014AF54 4000B37B */  lq         $19, 0x40($sp)
/* 4B058 0014AF58 3000B27B */  lq         $18, 0x30($sp)
/* 4B05C 0014AF5C 2000B17B */  lq         $17, 0x20($sp)
/* 4B060 0014AF60 1000B07B */  lq         $16, 0x10($sp)
/* 4B064 0014AF64 5003BD27 */  addiu      $sp, $sp, 0x350
/* 4B068 0014AF68 0800E003 */  jr         $31
/* 4B06C 0014AF6C 00000000 */   nop
