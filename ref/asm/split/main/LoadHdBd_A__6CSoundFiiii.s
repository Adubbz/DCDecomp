.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadHdBd_A__6CSoundFiiii
/* 046AC0 001469C0 90FFBD27 */  addiu       $29, $29, -0x70
/* 046AC4 001469C4 6000BF7F */  sq          $31, 0x60($29)
/* 046AC8 001469C8 5000B57F */  sq          $21, 0x50($29)
/* 046ACC 001469CC 4000B47F */  sq          $20, 0x40($29)
/* 046AD0 001469D0 3000B37F */  sq          $19, 0x30($29)
/* 046AD4 001469D4 2000B27F */  sq          $18, 0x20($29)
/* 046AD8 001469D8 1000B17F */  sq          $17, 0x10($29)
/* 046ADC 001469DC 0000B07F */  sq          $16, 0x0($29)
/* 046AE0 001469E0 28A6A070 */  paddub      $20, $5, $0
/* 046AE4 001469E4 289EC070 */  paddub      $19, $6, $0
/* 046AE8 001469E8 2896E070 */  paddub      $18, $7, $0
/* 046AEC 001469EC 288E0071 */  paddub      $17, $8, $0
/* 046AF0 001469F0 CF01013C */  lui         $1, %hi(midi_state)
/* 046AF4 001469F4 4082228C */  lw          $2, %lo(midi_state)($1)
/* 046AF8 001469F8 2A004010 */  beqz        $2, .L00146AA4
/* 046AFC 001469FC 00000000 */   nop
/* 046B00 00146A00 90800434 */  ori         $4, $0, 0x8090
/* 046B04 00146A04 282E0070 */  paddub      $5, $0, $0
/* 046B08 00146A08 801E050C */  jal         ezMidi__Fii
/* 046B0C 00146A0C 00000000 */   nop
/* 046B10 00146A10 05004010 */  beqz        $2, .L00146A28
/* 046B14 00146A14 00000000 */   nop
/* 046B18 00146A18 20000424 */  addiu       $4, $0, 0x20
/* 046B1C 00146A1C 282E0070 */  paddub      $5, $0, $0
/* 046B20 00146A20 801E050C */  jal         ezMidi__Fii
/* 046B24 00146A24 00000000 */   nop
.L00146A28:
/* 046B28 00146A28 2262040C */  jal         sceSifInitIopHeap
/* 046B2C 00146A2C 00000000 */   nop
/* 046B30 00146A30 CF01013C */  lui         $1, %hi(midi_state)
/* 046B34 00146A34 4082248C */  lw          $4, %lo(midi_state)($1)
/* 046B38 00146A38 6062040C */  jal         sceSifFreeIopHeap
/* 046B3C 00146A3C 00000000 */   nop
/* 046B40 00146A40 CF01013C */  lui         $1, %hi(midi_state)
/* 046B44 00146A44 408220AC */  sw          $0, %lo(midi_state)($1)
/* 046B48 00146A48 28860070 */  paddub      $16, $0, $0
/* 046B4C 00146A4C 0E000010 */  b           .L00146A88
/* 046B50 00146A50 00000000 */   nop
.L00146A54:
/* 046B54 00146A54 80181000 */  sll         $3, $16, 2
/* 046B58 00146A58 CF01023C */  lui         $2, %hi(midi_state + 0x8)
/* 046B5C 00146A5C 48824224 */  addiu       $2, $2, %lo(midi_state + 0x8)
/* 046B60 00146A60 21A84300 */  addu        $21, $2, $3
/* 046B64 00146A64 0000A28E */  lw          $2, 0x0($21)
/* 046B68 00146A68 06004010 */  beqz        $2, .L00146A84
/* 046B6C 00146A6C 00000000 */   nop
/* 046B70 00146A70 2262040C */  jal         sceSifInitIopHeap
/* 046B74 00146A74 00000000 */   nop
/* 046B78 00146A78 0000A48E */  lw          $4, 0x0($21)
/* 046B7C 00146A7C 6062040C */  jal         sceSifFreeIopHeap
/* 046B80 00146A80 00000000 */   nop
.L00146A84:
/* 046B84 00146A84 01001026 */  addiu       $16, $16, 0x1
.L00146A88:
/* 046B88 00146A88 CF01013C */  lui         $1, %hi(midi_state + 0x58)
/* 046B8C 00146A8C 9882228C */  lw          $2, %lo(midi_state + 0x58)($1)
/* 046B90 00146A90 2A100202 */  slt         $2, $16, $2
/* 046B94 00146A94 EFFF4014 */  bnez        $2, .L00146A54
/* 046B98 00146A98 00000000 */   nop
/* 046B9C 00146A9C CF01013C */  lui         $1, %hi(midi_state + 0x58)
/* 046BA0 00146AA0 988220AC */  sw          $0, %lo(midi_state + 0x58)($1)
.L00146AA4:
/* 046BA4 00146AA4 CF01013C */  lui         $1, %hi(midi_state + 0x4)
/* 046BA8 00146AA8 4482228C */  lw          $2, %lo(midi_state + 0x4)($1)
/* 046BAC 00146AAC CF01013C */  lui         $1, %hi(gBank + 0xC)
/* 046BB0 00146AB0 0C8222AC */  sw          $2, %lo(gBank + 0xC)($1)
/* 046BB4 00146AB4 28268072 */  paddub      $4, $20, $0
/* 046BB8 00146AB8 282E6072 */  paddub      $5, $19, $0
/* 046BBC 00146ABC 28364072 */  paddub      $6, $18, $0
/* 046BC0 00146AC0 283E2072 */  paddub      $7, $17, $0
/* 046BC4 00146AC4 B80F050C */  jal         TransHdBd__Fiiii
/* 046BC8 00146AC8 00000000 */   nop
/* 046BCC 00146ACC CF01013C */  lui         $1, %hi(gBank)
/* 046BD0 00146AD0 0082228C */  lw          $2, %lo(gBank)($1)
/* 046BD4 00146AD4 CF01013C */  lui         $1, %hi(midi_state)
/* 046BD8 00146AD8 408222AC */  sw          $2, %lo(midi_state)($1)
/* 046BDC 00146ADC CF01023C */  lui         $2, %hi(gBank)
/* 046BE0 00146AE0 00824524 */  addiu       $5, $2, %lo(gBank)
/* 046BE4 00146AE4 50900434 */  ori         $4, $0, 0x9050
/* 046BE8 00146AE8 801E050C */  jal         ezMidi__Fii
/* 046BEC 00146AEC 00000000 */   nop
/* 046BF0 00146AF0 A0000424 */  addiu       $4, $0, 0xA0
/* 046BF4 00146AF4 20300524 */  addiu       $5, $0, 0x3020
/* 046BF8 00146AF8 801E050C */  jal         ezMidi__Fii
/* 046BFC 00146AFC 00000000 */   nop
/* 046C00 00146B00 B0000424 */  addiu       $4, $0, 0xB0
/* 046C04 00146B04 282E0070 */  paddub      $5, $0, $0
/* 046C08 00146B08 801E050C */  jal         ezMidi__Fii
/* 046C0C 00146B0C 00000000 */   nop
/* 046C10 00146B10 28160070 */  paddub      $2, $0, $0
/* 046C14 00146B14 6000BF7B */  lq          $31, 0x60($29)
/* 046C18 00146B18 5000B57B */  lq          $21, 0x50($29)
/* 046C1C 00146B1C 4000B47B */  lq          $20, 0x40($29)
/* 046C20 00146B20 3000B37B */  lq          $19, 0x30($29)
/* 046C24 00146B24 2000B27B */  lq          $18, 0x20($29)
/* 046C28 00146B28 1000B17B */  lq          $17, 0x10($29)
/* 046C2C 00146B2C 0000B07B */  lq          $16, 0x0($29)
/* 046C30 00146B30 7000BD27 */  addiu       $29, $29, 0x70
/* 046C34 00146B34 0800E003 */  jr          $31
/* 046C38 00146B38 00000000 */   nop
/* 046C3C 00146B3C 00000000 */  nop
