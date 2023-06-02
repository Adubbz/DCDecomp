.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoadHdBd_A__6CSoundFiiii
/* 46AC0 001469C0 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 46AC4 001469C4 6000BF7F */  sq         $31, 0x60($sp)
/* 46AC8 001469C8 5000B57F */  sq         $21, 0x50($sp)
/* 46ACC 001469CC 4000B47F */  sq         $20, 0x40($sp)
/* 46AD0 001469D0 3000B37F */  sq         $19, 0x30($sp)
/* 46AD4 001469D4 2000B27F */  sq         $18, 0x20($sp)
/* 46AD8 001469D8 1000B17F */  sq         $17, 0x10($sp)
/* 46ADC 001469DC 0000B07F */  sq         $16, 0x0($sp)
/* 46AE0 001469E0 28A6A070 */  paddub     $20, $5, $0
/* 46AE4 001469E4 289EC070 */  paddub     $19, $6, $0
/* 46AE8 001469E8 2896E070 */  paddub     $18, $7, $0
/* 46AEC 001469EC 288E0071 */  paddub     $17, $8, $0
/* 46AF0 001469F0 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46AF4 001469F4 4082228C */  lw         $2, -0x7DC0($at)
/* 46AF8 001469F8 2A004010 */  beqz       $2, .L00146AA4
/* 46AFC 001469FC 00000000 */   nop
/* 46B00 00146A00 90800434 */  ori        $4, $0, 0x8090
/* 46B04 00146A04 282E0070 */  paddub     $5, $0, $0
/* 46B08 00146A08 801E050C */  jal        ezMidi__Fii
/* 46B0C 00146A0C 00000000 */   nop
/* 46B10 00146A10 05004010 */  beqz       $2, .L00146A28
/* 46B14 00146A14 00000000 */   nop
/* 46B18 00146A18 20000424 */  addiu      $4, $0, 0x20
/* 46B1C 00146A1C 282E0070 */  paddub     $5, $0, $0
/* 46B20 00146A20 801E050C */  jal        ezMidi__Fii
/* 46B24 00146A24 00000000 */   nop
.L00146A28:
/* 46B28 00146A28 2262040C */  jal        sceSifInitIopHeap
/* 46B2C 00146A2C 00000000 */   nop
/* 46B30 00146A30 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46B34 00146A34 4082248C */  lw         $4, -0x7DC0($at)
/* 46B38 00146A38 6062040C */  jal        sceSifFreeIopHeap
/* 46B3C 00146A3C 00000000 */   nop
/* 46B40 00146A40 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46B44 00146A44 408220AC */  sw         $0, -0x7DC0($at)
/* 46B48 00146A48 28860070 */  paddub     $16, $0, $0
/* 46B4C 00146A4C 0E000010 */  b          .L00146A88
/* 46B50 00146A50 00000000 */   nop
.L00146A54:
/* 46B54 00146A54 80181000 */  sll        $3, $16, 2
/* 46B58 00146A58 CF01023C */  lui        $2, %hi(D_1CE8248)
/* 46B5C 00146A5C 48824224 */  addiu      $2, $2, %lo(D_1CE8248)
/* 46B60 00146A60 21A84300 */  addu       $21, $2, $3
/* 46B64 00146A64 0000A28E */  lw         $2, 0x0($21)
/* 46B68 00146A68 06004010 */  beqz       $2, .L00146A84
/* 46B6C 00146A6C 00000000 */   nop
/* 46B70 00146A70 2262040C */  jal        sceSifInitIopHeap
/* 46B74 00146A74 00000000 */   nop
/* 46B78 00146A78 0000A48E */  lw         $4, 0x0($21)
/* 46B7C 00146A7C 6062040C */  jal        sceSifFreeIopHeap
/* 46B80 00146A80 00000000 */   nop
.L00146A84:
/* 46B84 00146A84 01001026 */  addiu      $16, $16, 0x1
.L00146A88:
/* 46B88 00146A88 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46B8C 00146A8C 9882228C */  lw         $2, -0x7D68($at)
/* 46B90 00146A90 2A100202 */  slt        $2, $16, $2
/* 46B94 00146A94 EFFF4014 */  bnez       $2, .L00146A54
/* 46B98 00146A98 00000000 */   nop
/* 46B9C 00146A9C CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46BA0 00146AA0 988220AC */  sw         $0, -0x7D68($at)
.L00146AA4:
/* 46BA4 00146AA4 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46BA8 00146AA8 4482228C */  lw         $2, -0x7DBC($at)
/* 46BAC 00146AAC CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46BB0 00146AB0 0C8222AC */  sw         $2, -0x7DF4($at)
/* 46BB4 00146AB4 28268072 */  paddub     $4, $20, $0
/* 46BB8 00146AB8 282E6072 */  paddub     $5, $19, $0
/* 46BBC 00146ABC 28364072 */  paddub     $6, $18, $0
/* 46BC0 00146AC0 283E2072 */  paddub     $7, $17, $0
/* 46BC4 00146AC4 B80F050C */  jal        TransHdBd__Fiiii
/* 46BC8 00146AC8 00000000 */   nop
/* 46BCC 00146ACC CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46BD0 00146AD0 0082228C */  lw         $2, -0x7E00($at)
/* 46BD4 00146AD4 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46BD8 00146AD8 408222AC */  sw         $2, -0x7DC0($at)
/* 46BDC 00146ADC CF01023C */  lui        $2, %hi(gBank)
/* 46BE0 00146AE0 00824524 */  addiu      $5, $2, %lo(gBank)
/* 46BE4 00146AE4 50900434 */  ori        $4, $0, 0x9050
/* 46BE8 00146AE8 801E050C */  jal        ezMidi__Fii
/* 46BEC 00146AEC 00000000 */   nop
/* 46BF0 00146AF0 A0000424 */  addiu      $4, $0, 0xA0
/* 46BF4 00146AF4 20300524 */  addiu      $5, $0, 0x3020
/* 46BF8 00146AF8 801E050C */  jal        ezMidi__Fii
/* 46BFC 00146AFC 00000000 */   nop
/* 46C00 00146B00 B0000424 */  addiu      $4, $0, 0xB0
/* 46C04 00146B04 282E0070 */  paddub     $5, $0, $0
/* 46C08 00146B08 801E050C */  jal        ezMidi__Fii
/* 46C0C 00146B0C 00000000 */   nop
/* 46C10 00146B10 28160070 */  paddub     $2, $0, $0
/* 46C14 00146B14 6000BF7B */  lq         $31, 0x60($sp)
/* 46C18 00146B18 5000B57B */  lq         $21, 0x50($sp)
/* 46C1C 00146B1C 4000B47B */  lq         $20, 0x40($sp)
/* 46C20 00146B20 3000B37B */  lq         $19, 0x30($sp)
/* 46C24 00146B24 2000B27B */  lq         $18, 0x20($sp)
/* 46C28 00146B28 1000B17B */  lq         $17, 0x10($sp)
/* 46C2C 00146B2C 0000B07B */  lq         $16, 0x0($sp)
/* 46C30 00146B30 7000BD27 */  addiu      $sp, $sp, 0x70
/* 46C34 00146B34 0800E003 */  jr         $31
/* 46C38 00146B38 00000000 */   nop
/* 46C3C 00146B3C 00000000 */  nop
