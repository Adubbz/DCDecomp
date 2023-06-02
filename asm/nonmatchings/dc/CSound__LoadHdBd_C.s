.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoadHdBd_C__6CSoundFiiii
/* 46C40 00146B40 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 46C44 00146B44 6000BF7F */  sq         $31, 0x60($sp)
/* 46C48 00146B48 5000B57F */  sq         $21, 0x50($sp)
/* 46C4C 00146B4C 4000B47F */  sq         $20, 0x40($sp)
/* 46C50 00146B50 3000B37F */  sq         $19, 0x30($sp)
/* 46C54 00146B54 2000B27F */  sq         $18, 0x20($sp)
/* 46C58 00146B58 1000B17F */  sq         $17, 0x10($sp)
/* 46C5C 00146B5C 0000B07F */  sq         $16, 0x0($sp)
/* 46C60 00146B60 28A6A070 */  paddub     $20, $5, $0
/* 46C64 00146B64 289EC070 */  paddub     $19, $6, $0
/* 46C68 00146B68 2896E070 */  paddub     $18, $7, $0
/* 46C6C 00146B6C 288E0071 */  paddub     $17, $8, $0
/* 46C70 00146B70 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46C74 00146B74 C082228C */  lw         $2, -0x7D40($at)
/* 46C78 00146B78 4D004010 */  beqz       $2, .L00146CB0
/* 46C7C 00146B7C 00000000 */   nop
/* 46C80 00146B80 2F000424 */  addiu      $4, $0, 0x2F
/* 46C84 00146B84 282E0070 */  paddub     $5, $0, $0
/* 46C88 00146B88 801E050C */  jal        ezMidi__Fii
/* 46C8C 00146B8C 00000000 */   nop
/* 46C90 00146B90 21000424 */  addiu      $4, $0, 0x21
/* 46C94 00146B94 282E0070 */  paddub     $5, $0, $0
/* 46C98 00146B98 801E050C */  jal        ezMidi__Fii
/* 46C9C 00146B9C 00000000 */   nop
/* 46CA0 00146BA0 2262040C */  jal        sceSifInitIopHeap
/* 46CA4 00146BA4 00000000 */   nop
/* 46CA8 00146BA8 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46CAC 00146BAC C082248C */  lw         $4, -0x7D40($at)
/* 46CB0 00146BB0 6062040C */  jal        sceSifFreeIopHeap
/* 46CB4 00146BB4 00000000 */   nop
/* 46CB8 00146BB8 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46CBC 00146BBC C08220AC */  sw         $0, -0x7D40($at)
/* 46CC0 00146BC0 2262040C */  jal        sceSifInitIopHeap
/* 46CC4 00146BC4 00000000 */   nop
/* 46CC8 00146BC8 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46CCC 00146BCC 4083248C */  lw         $4, -0x7CC0($at)
/* 46CD0 00146BD0 6062040C */  jal        sceSifFreeIopHeap
/* 46CD4 00146BD4 00000000 */   nop
/* 46CD8 00146BD8 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46CDC 00146BDC 408320AC */  sw         $0, -0x7CC0($at)
/* 46CE0 00146BE0 0700023C */  lui        $2, (0x7D010 >> 16)
/* 46CE4 00146BE4 10D04234 */  ori        $2, $2, (0x7D010 & 0xFFFF)
/* 46CE8 00146BE8 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46CEC 00146BEC C48222AC */  sw         $2, -0x7D3C($at)
/* 46CF0 00146BF0 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46CF4 00146BF4 448322AC */  sw         $2, -0x7CBC($at)
/* 46CF8 00146BF8 28860070 */  paddub     $16, $0, $0
/* 46CFC 00146BFC 0E000010 */  b          .L00146C38
/* 46D00 00146C00 00000000 */   nop
.L00146C04:
/* 46D04 00146C04 80181000 */  sll        $3, $16, 2
/* 46D08 00146C08 CF01023C */  lui        $2, %hi(D_1CE82C8)
/* 46D0C 00146C0C C8824224 */  addiu      $2, $2, %lo(D_1CE82C8)
/* 46D10 00146C10 21A84300 */  addu       $21, $2, $3
/* 46D14 00146C14 0000A28E */  lw         $2, 0x0($21)
/* 46D18 00146C18 06004010 */  beqz       $2, .L00146C34
/* 46D1C 00146C1C 00000000 */   nop
/* 46D20 00146C20 2262040C */  jal        sceSifInitIopHeap
/* 46D24 00146C24 00000000 */   nop
/* 46D28 00146C28 0000A48E */  lw         $4, 0x0($21)
/* 46D2C 00146C2C 6062040C */  jal        sceSifFreeIopHeap
/* 46D30 00146C30 00000000 */   nop
.L00146C34:
/* 46D34 00146C34 01001026 */  addiu      $16, $16, 0x1
.L00146C38:
/* 46D38 00146C38 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46D3C 00146C3C 1883228C */  lw         $2, -0x7CE8($at)
/* 46D40 00146C40 2A100202 */  slt        $2, $16, $2
/* 46D44 00146C44 EFFF4014 */  bnez       $2, .L00146C04
/* 46D48 00146C48 00000000 */   nop
/* 46D4C 00146C4C CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46D50 00146C50 188320AC */  sw         $0, -0x7CE8($at)
/* 46D54 00146C54 28860070 */  paddub     $16, $0, $0
/* 46D58 00146C58 0E000010 */  b          .L00146C94
/* 46D5C 00146C5C 00000000 */   nop
.L00146C60:
/* 46D60 00146C60 80181000 */  sll        $3, $16, 2
/* 46D64 00146C64 CF01023C */  lui        $2, %hi(D_1CE8348)
/* 46D68 00146C68 48834224 */  addiu      $2, $2, %lo(D_1CE8348)
/* 46D6C 00146C6C 21A84300 */  addu       $21, $2, $3
/* 46D70 00146C70 0000A28E */  lw         $2, 0x0($21)
/* 46D74 00146C74 06004010 */  beqz       $2, .L00146C90
/* 46D78 00146C78 00000000 */   nop
/* 46D7C 00146C7C 2262040C */  jal        sceSifInitIopHeap
/* 46D80 00146C80 00000000 */   nop
/* 46D84 00146C84 0000A48E */  lw         $4, 0x0($21)
/* 46D88 00146C88 6062040C */  jal        sceSifFreeIopHeap
/* 46D8C 00146C8C 00000000 */   nop
.L00146C90:
/* 46D90 00146C90 01001026 */  addiu      $16, $16, 0x1
.L00146C94:
/* 46D94 00146C94 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46D98 00146C98 9883228C */  lw         $2, -0x7C68($at)
/* 46D9C 00146C9C 2A100202 */  slt        $2, $16, $2
/* 46DA0 00146CA0 EFFF4014 */  bnez       $2, .L00146C60
/* 46DA4 00146CA4 00000000 */   nop
/* 46DA8 00146CA8 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46DAC 00146CAC 988320AC */  sw         $0, -0x7C68($at)
.L00146CB0:
/* 46DB0 00146CB0 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46DB4 00146CB4 C482228C */  lw         $2, -0x7D3C($at)
/* 46DB8 00146CB8 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46DBC 00146CBC 0C8222AC */  sw         $2, -0x7DF4($at)
/* 46DC0 00146CC0 28268072 */  paddub     $4, $20, $0
/* 46DC4 00146CC4 282E6072 */  paddub     $5, $19, $0
/* 46DC8 00146CC8 28364072 */  paddub     $6, $18, $0
/* 46DCC 00146CCC 283E2072 */  paddub     $7, $17, $0
/* 46DD0 00146CD0 B80F050C */  jal        TransHdBd__Fiiii
/* 46DD4 00146CD4 00000000 */   nop
/* 46DD8 00146CD8 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46DDC 00146CDC 0082228C */  lw         $2, -0x7E00($at)
/* 46DE0 00146CE0 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46DE4 00146CE4 C08222AC */  sw         $2, -0x7D40($at)
/* 46DE8 00146CE8 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46DEC 00146CEC C482238C */  lw         $3, -0x7D3C($at)
/* 46DF0 00146CF0 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46DF4 00146CF4 0882228C */  lw         $2, -0x7DF8($at)
/* 46DF8 00146CF8 21106200 */  addu       $2, $3, $2
/* 46DFC 00146CFC 10004224 */  addiu      $2, $2, 0x10
/* 46E00 00146D00 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46E04 00146D04 448322AC */  sw         $2, -0x7CBC($at)
/* 46E08 00146D08 CF01023C */  lui        $2, %hi(gBank)
/* 46E0C 00146D0C 00824524 */  addiu      $5, $2, %lo(gBank)
/* 46E10 00146D10 5F900434 */  ori        $4, $0, 0x905F
/* 46E14 00146D14 801E050C */  jal        ezMidi__Fii
/* 46E18 00146D18 00000000 */   nop
/* 46E1C 00146D1C AF000424 */  addiu      $4, $0, 0xAF
/* 46E20 00146D20 70300524 */  addiu      $5, $0, 0x3070
/* 46E24 00146D24 801E050C */  jal        ezMidi__Fii
/* 46E28 00146D28 00000000 */   nop
/* 46E2C 00146D2C BF000424 */  addiu      $4, $0, 0xBF
/* 46E30 00146D30 282E0070 */  paddub     $5, $0, $0
/* 46E34 00146D34 801E050C */  jal        ezMidi__Fii
/* 46E38 00146D38 00000000 */   nop
/* 46E3C 00146D3C 28160070 */  paddub     $2, $0, $0
/* 46E40 00146D40 6000BF7B */  lq         $31, 0x60($sp)
/* 46E44 00146D44 5000B57B */  lq         $21, 0x50($sp)
/* 46E48 00146D48 4000B47B */  lq         $20, 0x40($sp)
/* 46E4C 00146D4C 3000B37B */  lq         $19, 0x30($sp)
/* 46E50 00146D50 2000B27B */  lq         $18, 0x20($sp)
/* 46E54 00146D54 1000B17B */  lq         $17, 0x10($sp)
/* 46E58 00146D58 0000B07B */  lq         $16, 0x0($sp)
/* 46E5C 00146D5C 7000BD27 */  addiu      $sp, $sp, 0x70
/* 46E60 00146D60 0800E003 */  jr         $31
/* 46E64 00146D64 00000000 */   nop
/* 46E68 00146D68 00000000 */  nop
/* 46E6C 00146D6C 00000000 */  nop
