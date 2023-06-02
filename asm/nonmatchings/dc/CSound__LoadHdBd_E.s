.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoadHdBd_E__6CSoundFiiii
/* 46E70 00146D70 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 46E74 00146D74 6000BF7F */  sq         $31, 0x60($sp)
/* 46E78 00146D78 5000B57F */  sq         $21, 0x50($sp)
/* 46E7C 00146D7C 4000B47F */  sq         $20, 0x40($sp)
/* 46E80 00146D80 3000B37F */  sq         $19, 0x30($sp)
/* 46E84 00146D84 2000B27F */  sq         $18, 0x20($sp)
/* 46E88 00146D88 1000B17F */  sq         $17, 0x10($sp)
/* 46E8C 00146D8C 0000B07F */  sq         $16, 0x0($sp)
/* 46E90 00146D90 28A6A070 */  paddub     $20, $5, $0
/* 46E94 00146D94 289EC070 */  paddub     $19, $6, $0
/* 46E98 00146D98 2896E070 */  paddub     $18, $7, $0
/* 46E9C 00146D9C 288E0071 */  paddub     $17, $8, $0
/* 46EA0 00146DA0 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46EA4 00146DA4 4083228C */  lw         $2, -0x7CC0($at)
/* 46EA8 00146DA8 2A004010 */  beqz       $2, .L00146E54
/* 46EAC 00146DAC 00000000 */   nop
/* 46EB0 00146DB0 91800434 */  ori        $4, $0, 0x8091
/* 46EB4 00146DB4 282E0070 */  paddub     $5, $0, $0
/* 46EB8 00146DB8 801E050C */  jal        ezMidi__Fii
/* 46EBC 00146DBC 00000000 */   nop
/* 46EC0 00146DC0 05004010 */  beqz       $2, .L00146DD8
/* 46EC4 00146DC4 00000000 */   nop
/* 46EC8 00146DC8 21000424 */  addiu      $4, $0, 0x21
/* 46ECC 00146DCC 282E0070 */  paddub     $5, $0, $0
/* 46ED0 00146DD0 801E050C */  jal        ezMidi__Fii
/* 46ED4 00146DD4 00000000 */   nop
.L00146DD8:
/* 46ED8 00146DD8 2262040C */  jal        sceSifInitIopHeap
/* 46EDC 00146DDC 00000000 */   nop
/* 46EE0 00146DE0 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46EE4 00146DE4 4083248C */  lw         $4, -0x7CC0($at)
/* 46EE8 00146DE8 6062040C */  jal        sceSifFreeIopHeap
/* 46EEC 00146DEC 00000000 */   nop
/* 46EF0 00146DF0 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46EF4 00146DF4 408320AC */  sw         $0, -0x7CC0($at)
/* 46EF8 00146DF8 28860070 */  paddub     $16, $0, $0
/* 46EFC 00146DFC 0E000010 */  b          .L00146E38
/* 46F00 00146E00 00000000 */   nop
.L00146E04:
/* 46F04 00146E04 80181000 */  sll        $3, $16, 2
/* 46F08 00146E08 CF01023C */  lui        $2, %hi(D_1CE8348)
/* 46F0C 00146E0C 48834224 */  addiu      $2, $2, %lo(D_1CE8348)
/* 46F10 00146E10 21A84300 */  addu       $21, $2, $3
/* 46F14 00146E14 0000A28E */  lw         $2, 0x0($21)
/* 46F18 00146E18 06004010 */  beqz       $2, .L00146E34
/* 46F1C 00146E1C 00000000 */   nop
/* 46F20 00146E20 2262040C */  jal        sceSifInitIopHeap
/* 46F24 00146E24 00000000 */   nop
/* 46F28 00146E28 0000A48E */  lw         $4, 0x0($21)
/* 46F2C 00146E2C 6062040C */  jal        sceSifFreeIopHeap
/* 46F30 00146E30 00000000 */   nop
.L00146E34:
/* 46F34 00146E34 01001026 */  addiu      $16, $16, 0x1
.L00146E38:
/* 46F38 00146E38 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46F3C 00146E3C 9883228C */  lw         $2, -0x7C68($at)
/* 46F40 00146E40 2A100202 */  slt        $2, $16, $2
/* 46F44 00146E44 EFFF4014 */  bnez       $2, .L00146E04
/* 46F48 00146E48 00000000 */   nop
/* 46F4C 00146E4C CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46F50 00146E50 988320AC */  sw         $0, -0x7C68($at)
.L00146E54:
/* 46F54 00146E54 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46F58 00146E58 4483228C */  lw         $2, -0x7CBC($at)
/* 46F5C 00146E5C CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46F60 00146E60 0C8222AC */  sw         $2, -0x7DF4($at)
/* 46F64 00146E64 28268072 */  paddub     $4, $20, $0
/* 46F68 00146E68 282E6072 */  paddub     $5, $19, $0
/* 46F6C 00146E6C 28364072 */  paddub     $6, $18, $0
/* 46F70 00146E70 283E2072 */  paddub     $7, $17, $0
/* 46F74 00146E74 B80F050C */  jal        TransHdBd__Fiiii
/* 46F78 00146E78 00000000 */   nop
/* 46F7C 00146E7C CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46F80 00146E80 0082228C */  lw         $2, -0x7E00($at)
/* 46F84 00146E84 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46F88 00146E88 408322AC */  sw         $2, -0x7CC0($at)
/* 46F8C 00146E8C CF01023C */  lui        $2, %hi(gBank)
/* 46F90 00146E90 00824524 */  addiu      $5, $2, %lo(gBank)
/* 46F94 00146E94 51900434 */  ori        $4, $0, 0x9051
/* 46F98 00146E98 801E050C */  jal        ezMidi__Fii
/* 46F9C 00146E9C 00000000 */   nop
/* 46FA0 00146EA0 A1000424 */  addiu      $4, $0, 0xA1
/* 46FA4 00146EA4 60300524 */  addiu      $5, $0, 0x3060
/* 46FA8 00146EA8 801E050C */  jal        ezMidi__Fii
/* 46FAC 00146EAC 00000000 */   nop
/* 46FB0 00146EB0 B1000424 */  addiu      $4, $0, 0xB1
/* 46FB4 00146EB4 282E0070 */  paddub     $5, $0, $0
/* 46FB8 00146EB8 801E050C */  jal        ezMidi__Fii
/* 46FBC 00146EBC 00000000 */   nop
/* 46FC0 00146EC0 28160070 */  paddub     $2, $0, $0
/* 46FC4 00146EC4 6000BF7B */  lq         $31, 0x60($sp)
/* 46FC8 00146EC8 5000B57B */  lq         $21, 0x50($sp)
/* 46FCC 00146ECC 4000B47B */  lq         $20, 0x40($sp)
/* 46FD0 00146ED0 3000B37B */  lq         $19, 0x30($sp)
/* 46FD4 00146ED4 2000B27B */  lq         $18, 0x20($sp)
/* 46FD8 00146ED8 1000B17B */  lq         $17, 0x10($sp)
/* 46FDC 00146EDC 0000B07B */  lq         $16, 0x0($sp)
/* 46FE0 00146EE0 7000BD27 */  addiu      $sp, $sp, 0x70
/* 46FE4 00146EE4 0800E003 */  jr         $31
/* 46FE8 00146EE8 00000000 */   nop
/* 46FEC 00146EEC 00000000 */  nop
