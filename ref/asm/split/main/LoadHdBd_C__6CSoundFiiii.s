.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadHdBd_C__6CSoundFiiii
/* 046C40 00146B40 90FFBD27 */  addiu       $29, $29, -0x70
/* 046C44 00146B44 6000BF7F */  sq          $31, 0x60($29)
/* 046C48 00146B48 5000B57F */  sq          $21, 0x50($29)
/* 046C4C 00146B4C 4000B47F */  sq          $20, 0x40($29)
/* 046C50 00146B50 3000B37F */  sq          $19, 0x30($29)
/* 046C54 00146B54 2000B27F */  sq          $18, 0x20($29)
/* 046C58 00146B58 1000B17F */  sq          $17, 0x10($29)
/* 046C5C 00146B5C 0000B07F */  sq          $16, 0x0($29)
/* 046C60 00146B60 28A6A070 */  paddub      $20, $5, $0
/* 046C64 00146B64 289EC070 */  paddub      $19, $6, $0
/* 046C68 00146B68 2896E070 */  paddub      $18, $7, $0
/* 046C6C 00146B6C 288E0071 */  paddub      $17, $8, $0
/* 046C70 00146B70 CF01013C */  lui         $1, %hi(midi_state + 0x80)
/* 046C74 00146B74 C082228C */  lw          $2, %lo(midi_state + 0x80)($1)
/* 046C78 00146B78 4D004010 */  beqz        $2, .L00146CB0
/* 046C7C 00146B7C 00000000 */   nop
/* 046C80 00146B80 2F000424 */  addiu       $4, $0, 0x2F
/* 046C84 00146B84 282E0070 */  paddub      $5, $0, $0
/* 046C88 00146B88 801E050C */  jal         ezMidi__Fii
/* 046C8C 00146B8C 00000000 */   nop
/* 046C90 00146B90 21000424 */  addiu       $4, $0, 0x21
/* 046C94 00146B94 282E0070 */  paddub      $5, $0, $0
/* 046C98 00146B98 801E050C */  jal         ezMidi__Fii
/* 046C9C 00146B9C 00000000 */   nop
/* 046CA0 00146BA0 2262040C */  jal         sceSifInitIopHeap
/* 046CA4 00146BA4 00000000 */   nop
/* 046CA8 00146BA8 CF01013C */  lui         $1, %hi(midi_state + 0x80)
/* 046CAC 00146BAC C082248C */  lw          $4, %lo(midi_state + 0x80)($1)
/* 046CB0 00146BB0 6062040C */  jal         sceSifFreeIopHeap
/* 046CB4 00146BB4 00000000 */   nop
/* 046CB8 00146BB8 CF01013C */  lui         $1, %hi(midi_state + 0x80)
/* 046CBC 00146BBC C08220AC */  sw          $0, %lo(midi_state + 0x80)($1)
/* 046CC0 00146BC0 2262040C */  jal         sceSifInitIopHeap
/* 046CC4 00146BC4 00000000 */   nop
/* 046CC8 00146BC8 CF01013C */  lui         $1, %hi(midi_state + 0x100)
/* 046CCC 00146BCC 4083248C */  lw          $4, %lo(midi_state + 0x100)($1)
/* 046CD0 00146BD0 6062040C */  jal         sceSifFreeIopHeap
/* 046CD4 00146BD4 00000000 */   nop
/* 046CD8 00146BD8 CF01013C */  lui         $1, %hi(midi_state + 0x100)
/* 046CDC 00146BDC 408320AC */  sw          $0, %lo(midi_state + 0x100)($1)
/* 046CE0 00146BE0 0700023C */  lui         $2, (0x7D010 >> 16)
/* 046CE4 00146BE4 10D04234 */  ori         $2, $2, (0x7D010 & 0xFFFF)
/* 046CE8 00146BE8 CF01013C */  lui         $1, %hi(midi_state + 0x84)
/* 046CEC 00146BEC C48222AC */  sw          $2, %lo(midi_state + 0x84)($1)
/* 046CF0 00146BF0 CF01013C */  lui         $1, %hi(midi_state + 0x104)
/* 046CF4 00146BF4 448322AC */  sw          $2, %lo(midi_state + 0x104)($1)
/* 046CF8 00146BF8 28860070 */  paddub      $16, $0, $0
/* 046CFC 00146BFC 0E000010 */  b           .L00146C38
/* 046D00 00146C00 00000000 */   nop
.L00146C04:
/* 046D04 00146C04 80181000 */  sll         $3, $16, 2
/* 046D08 00146C08 CF01023C */  lui         $2, %hi(midi_state + 0x88)
/* 046D0C 00146C0C C8824224 */  addiu       $2, $2, %lo(midi_state + 0x88)
/* 046D10 00146C10 21A84300 */  addu        $21, $2, $3
/* 046D14 00146C14 0000A28E */  lw          $2, 0x0($21)
/* 046D18 00146C18 06004010 */  beqz        $2, .L00146C34
/* 046D1C 00146C1C 00000000 */   nop
/* 046D20 00146C20 2262040C */  jal         sceSifInitIopHeap
/* 046D24 00146C24 00000000 */   nop
/* 046D28 00146C28 0000A48E */  lw          $4, 0x0($21)
/* 046D2C 00146C2C 6062040C */  jal         sceSifFreeIopHeap
/* 046D30 00146C30 00000000 */   nop
.L00146C34:
/* 046D34 00146C34 01001026 */  addiu       $16, $16, 0x1
.L00146C38:
/* 046D38 00146C38 CF01013C */  lui         $1, %hi(midi_state + 0xD8)
/* 046D3C 00146C3C 1883228C */  lw          $2, %lo(midi_state + 0xD8)($1)
/* 046D40 00146C40 2A100202 */  slt         $2, $16, $2
/* 046D44 00146C44 EFFF4014 */  bnez        $2, .L00146C04
/* 046D48 00146C48 00000000 */   nop
/* 046D4C 00146C4C CF01013C */  lui         $1, %hi(midi_state + 0xD8)
/* 046D50 00146C50 188320AC */  sw          $0, %lo(midi_state + 0xD8)($1)
/* 046D54 00146C54 28860070 */  paddub      $16, $0, $0
/* 046D58 00146C58 0E000010 */  b           .L00146C94
/* 046D5C 00146C5C 00000000 */   nop
.L00146C60:
/* 046D60 00146C60 80181000 */  sll         $3, $16, 2
/* 046D64 00146C64 CF01023C */  lui         $2, %hi(midi_state + 0x108)
/* 046D68 00146C68 48834224 */  addiu       $2, $2, %lo(midi_state + 0x108)
/* 046D6C 00146C6C 21A84300 */  addu        $21, $2, $3
/* 046D70 00146C70 0000A28E */  lw          $2, 0x0($21)
/* 046D74 00146C74 06004010 */  beqz        $2, .L00146C90
/* 046D78 00146C78 00000000 */   nop
/* 046D7C 00146C7C 2262040C */  jal         sceSifInitIopHeap
/* 046D80 00146C80 00000000 */   nop
/* 046D84 00146C84 0000A48E */  lw          $4, 0x0($21)
/* 046D88 00146C88 6062040C */  jal         sceSifFreeIopHeap
/* 046D8C 00146C8C 00000000 */   nop
.L00146C90:
/* 046D90 00146C90 01001026 */  addiu       $16, $16, 0x1
.L00146C94:
/* 046D94 00146C94 CF01013C */  lui         $1, %hi(midi_state + 0x158)
/* 046D98 00146C98 9883228C */  lw          $2, %lo(midi_state + 0x158)($1)
/* 046D9C 00146C9C 2A100202 */  slt         $2, $16, $2
/* 046DA0 00146CA0 EFFF4014 */  bnez        $2, .L00146C60
/* 046DA4 00146CA4 00000000 */   nop
/* 046DA8 00146CA8 CF01013C */  lui         $1, %hi(midi_state + 0x158)
/* 046DAC 00146CAC 988320AC */  sw          $0, %lo(midi_state + 0x158)($1)
.L00146CB0:
/* 046DB0 00146CB0 CF01013C */  lui         $1, %hi(midi_state + 0x84)
/* 046DB4 00146CB4 C482228C */  lw          $2, %lo(midi_state + 0x84)($1)
/* 046DB8 00146CB8 CF01013C */  lui         $1, %hi(gBank + 0xC)
/* 046DBC 00146CBC 0C8222AC */  sw          $2, %lo(gBank + 0xC)($1)
/* 046DC0 00146CC0 28268072 */  paddub      $4, $20, $0
/* 046DC4 00146CC4 282E6072 */  paddub      $5, $19, $0
/* 046DC8 00146CC8 28364072 */  paddub      $6, $18, $0
/* 046DCC 00146CCC 283E2072 */  paddub      $7, $17, $0
/* 046DD0 00146CD0 B80F050C */  jal         TransHdBd__Fiiii
/* 046DD4 00146CD4 00000000 */   nop
/* 046DD8 00146CD8 CF01013C */  lui         $1, %hi(gBank)
/* 046DDC 00146CDC 0082228C */  lw          $2, %lo(gBank)($1)
/* 046DE0 00146CE0 CF01013C */  lui         $1, %hi(midi_state + 0x80)
/* 046DE4 00146CE4 C08222AC */  sw          $2, %lo(midi_state + 0x80)($1)
/* 046DE8 00146CE8 CF01013C */  lui         $1, %hi(midi_state + 0x84)
/* 046DEC 00146CEC C482238C */  lw          $3, %lo(midi_state + 0x84)($1)
/* 046DF0 00146CF0 CF01013C */  lui         $1, %hi(gBank + 0x8)
/* 046DF4 00146CF4 0882228C */  lw          $2, %lo(gBank + 0x8)($1)
/* 046DF8 00146CF8 21106200 */  addu        $2, $3, $2
/* 046DFC 00146CFC 10004224 */  addiu       $2, $2, 0x10
/* 046E00 00146D00 CF01013C */  lui         $1, %hi(midi_state + 0x104)
/* 046E04 00146D04 448322AC */  sw          $2, %lo(midi_state + 0x104)($1)
/* 046E08 00146D08 CF01023C */  lui         $2, %hi(gBank)
/* 046E0C 00146D0C 00824524 */  addiu       $5, $2, %lo(gBank)
/* 046E10 00146D10 5F900434 */  ori         $4, $0, 0x905F
/* 046E14 00146D14 801E050C */  jal         ezMidi__Fii
/* 046E18 00146D18 00000000 */   nop
/* 046E1C 00146D1C AF000424 */  addiu       $4, $0, 0xAF
/* 046E20 00146D20 70300524 */  addiu       $5, $0, 0x3070
/* 046E24 00146D24 801E050C */  jal         ezMidi__Fii
/* 046E28 00146D28 00000000 */   nop
/* 046E2C 00146D2C BF000424 */  addiu       $4, $0, 0xBF
/* 046E30 00146D30 282E0070 */  paddub      $5, $0, $0
/* 046E34 00146D34 801E050C */  jal         ezMidi__Fii
/* 046E38 00146D38 00000000 */   nop
/* 046E3C 00146D3C 28160070 */  paddub      $2, $0, $0
/* 046E40 00146D40 6000BF7B */  lq          $31, 0x60($29)
/* 046E44 00146D44 5000B57B */  lq          $21, 0x50($29)
/* 046E48 00146D48 4000B47B */  lq          $20, 0x40($29)
/* 046E4C 00146D4C 3000B37B */  lq          $19, 0x30($29)
/* 046E50 00146D50 2000B27B */  lq          $18, 0x20($29)
/* 046E54 00146D54 1000B17B */  lq          $17, 0x10($29)
/* 046E58 00146D58 0000B07B */  lq          $16, 0x0($29)
/* 046E5C 00146D5C 7000BD27 */  addiu       $29, $29, 0x70
/* 046E60 00146D60 0800E003 */  jr          $31
/* 046E64 00146D64 00000000 */   nop
/* 046E68 00146D68 00000000 */  nop
/* 046E6C 00146D6C 00000000 */  nop
