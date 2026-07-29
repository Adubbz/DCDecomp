.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_NEAR_MONSTER__FP12RS_STACKDATAi
/* 0E5F20 001E5E20 70FFBD27 */  addiu       $29, $29, -0x90
/* 0E5F24 001E5E24 5000BF7F */  sq          $31, 0x50($29)
/* 0E5F28 001E5E28 4000B37F */  sq          $19, 0x40($29)
/* 0E5F2C 001E5E2C 3000B27F */  sq          $18, 0x30($29)
/* 0E5F30 001E5E30 2000B17F */  sq          $17, 0x20($29)
/* 0E5F34 001E5E34 1000B07F */  sq          $16, 0x10($29)
/* 0E5F38 001E5E38 0400B5E7 */  swc1        $f21, 0x4($29)
/* 0E5F3C 001E5E3C 0000B4E7 */  swc1        $f20, 0x0($29)
/* 0E5F40 001E5E40 289E8070 */  paddub      $19, $4, $0
/* 0E5F44 001E5E44 E09C838F */  lw          $3, -0x6320($28)
/* 0E5F48 001E5E48 9000728C */  lw          $18, 0x90($3)
/* 0E5F4C 001E5E4C 7043023C */  lui         $2, (0x43700000 >> 16)
/* 0E5F50 001E5E50 00A08244 */  mtc1        $2, $f20
/* 0E5F54 001E5E54 FFFF1024 */  addiu       $16, $0, -0x1
/* 0E5F58 001E5E58 10350224 */  addiu       $2, $0, 0x3510
/* 0E5F5C 001E5E5C 18104202 */  mult        $2, $18, $2
/* 0E5F60 001E5E60 21106200 */  addu        $2, $3, $2
/* 0E5F64 001E5E64 0100013C */  lui         $1, (0x1FCD0 >> 16)
/* 0E5F68 001E5E68 D0FC2134 */  ori         $1, $1, (0x1FCD0 & 0xFFFF)
/* 0E5F6C 001E5E6C 21204100 */  addu        $4, $2, $1
/* 0E5F70 001E5E70 6000A527 */  addiu       $5, $29, 0x60
/* 0E5F74 001E5E74 A000998C */  lw          $25, 0xA0($4)
/* 0E5F78 001E5E78 A000398F */  lw          $25, 0xA0($25)
/* 0E5F7C 001E5E7C 09F82003 */  jalr        $25
/* 0E5F80 001E5E80 00000000 */   nop
/* 0E5F84 001E5E84 288E0070 */  paddub      $17, $0, $0
/* 0E5F88 001E5E88 2B000010 */  b           .L001E5F38
/* 0E5F8C 001E5E8C 00000000 */   nop
.L001E5E90:
/* 0E5F90 001E5E90 28003212 */  beq         $17, $18, .L001E5F34
/* 0E5F94 001E5E94 00000000 */   nop
/* 0E5F98 001E5E98 E09C858F */  lw          $5, -0x6320($28)
/* 0E5F9C 001E5E9C 80181100 */  sll         $3, $17, 2
/* 0E5FA0 001E5EA0 21207100 */  addu        $4, $3, $17
/* 0E5FA4 001E5EA4 80180400 */  sll         $3, $4, 2
/* 0E5FA8 001E5EA8 21188300 */  addu        $3, $4, $3
/* 0E5FAC 001E5EAC 00190300 */  sll         $3, $3, 4
/* 0E5FB0 001E5EB0 21186500 */  addu        $3, $3, $5
/* 0E5FB4 001E5EB4 0200013C */  lui         $1, (0x20000 >> 16)
/* 0E5FB8 001E5EB8 21086100 */  addu        $1, $3, $1
/* 0E5FBC 001E5EBC D0E3248C */  lw          $4, -0x1C30($1)
/* 0E5FC0 001E5EC0 02000324 */  addiu       $3, $0, 0x2
/* 0E5FC4 001E5EC4 1B008314 */  bne         $4, $3, .L001E5F34
/* 0E5FC8 001E5EC8 00000000 */   nop
/* 0E5FCC 001E5ECC 10350224 */  addiu       $2, $0, 0x3510
/* 0E5FD0 001E5ED0 18102202 */  mult        $2, $17, $2
/* 0E5FD4 001E5ED4 2110A200 */  addu        $2, $5, $2
/* 0E5FD8 001E5ED8 0100013C */  lui         $1, (0x1FCD0 >> 16)
/* 0E5FDC 001E5EDC D0FC2134 */  ori         $1, $1, (0x1FCD0 & 0xFFFF)
/* 0E5FE0 001E5EE0 21204100 */  addu        $4, $2, $1
/* 0E5FE4 001E5EE4 7000A527 */  addiu       $5, $29, 0x70
/* 0E5FE8 001E5EE8 A000998C */  lw          $25, 0xA0($4)
/* 0E5FEC 001E5EEC A000398F */  lw          $25, 0xA0($25)
/* 0E5FF0 001E5EF0 09F82003 */  jalr        $25
/* 0E5FF4 001E5EF4 00000000 */   nop
/* 0E5FF8 001E5EF8 6000A427 */  addiu       $4, $29, 0x60
/* 0E5FFC 001E5EFC 7000A527 */  addiu       $5, $29, 0x70
/* 0E6000 001E5F00 648D040C */  jal         DistVector__FPfPf
/* 0E6004 001E5F04 00000000 */   nop
/* 0E6008 001E5F08 46050046 */  mov.s       $f21, $f0
/* 0E600C 001E5F0C 34A81446 */  c.lt.s      $f21, $f20
/* 0E6010 001E5F10 00000000 */  nop
/* 0E6014 001E5F14 07000045 */  bc1f        .L001E5F34
/* 0E6018 001E5F18 00000000 */   nop
/* 0E601C 001E5F1C 8000A427 */  addiu       $4, $29, 0x80
/* 0E6020 001E5F20 7000A527 */  addiu       $5, $29, 0x70
/* 0E6024 001E5F24 0C86040C */  jal         sceVu0CopyVector
/* 0E6028 001E5F28 00000000 */   nop
/* 0E602C 001E5F2C 06AD0046 */  mov.s       $f20, $f21
/* 0E6030 001E5F30 28862072 */  paddub      $16, $17, $0
.L001E5F34:
/* 0E6034 001E5F34 01003126 */  addiu       $17, $17, 0x1
.L001E5F38:
/* 0E6038 001E5F38 1000232A */  slti        $3, $17, 0x10
/* 0E603C 001E5F3C D4FF6014 */  bnez        $3, .L001E5E90
/* 0E6040 001E5F40 00000000 */   nop
/* 0E6044 001E5F44 28266072 */  paddub      $4, $19, $0
/* 0E6048 001E5F48 08009324 */  addiu       $19, $4, 0x8
/* 0E604C 001E5F4C 8000ACC7 */  lwc1        $f12, 0x80($29)
/* 0E6050 001E5F50 BC85070C */  jal         SetStack__FP12RS_STACKDATAf__3
/* 0E6054 001E5F54 00000000 */   nop
/* 0E6058 001E5F58 28266072 */  paddub      $4, $19, $0
/* 0E605C 001E5F5C 08009324 */  addiu       $19, $4, 0x8
/* 0E6060 001E5F60 8400ACC7 */  lwc1        $f12, 0x84($29)
/* 0E6064 001E5F64 BC85070C */  jal         SetStack__FP12RS_STACKDATAf__3
/* 0E6068 001E5F68 00000000 */   nop
/* 0E606C 001E5F6C 28266072 */  paddub      $4, $19, $0
/* 0E6070 001E5F70 08009324 */  addiu       $19, $4, 0x8
/* 0E6074 001E5F74 8800ACC7 */  lwc1        $f12, 0x88($29)
/* 0E6078 001E5F78 BC85070C */  jal         SetStack__FP12RS_STACKDATAf__3
/* 0E607C 001E5F7C 00000000 */   nop
/* 0E6080 001E5F80 28266072 */  paddub      $4, $19, $0
/* 0E6084 001E5F84 282E0072 */  paddub      $5, $16, $0
/* 0E6088 001E5F88 B485070C */  jal         SetStack__FP12RS_STACKDATAi__3
/* 0E608C 001E5F8C 00000000 */   nop
/* 0E6090 001E5F90 5000BF7B */  lq          $31, 0x50($29)
/* 0E6094 001E5F94 4000B37B */  lq          $19, 0x40($29)
/* 0E6098 001E5F98 3000B27B */  lq          $18, 0x30($29)
/* 0E609C 001E5F9C 2000B17B */  lq          $17, 0x20($29)
/* 0E60A0 001E5FA0 1000B07B */  lq          $16, 0x10($29)
/* 0E60A4 001E5FA4 0400B5C7 */  lwc1        $f21, 0x4($29)
/* 0E60A8 001E5FA8 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 0E60AC 001E5FAC 9000BD27 */  addiu       $29, $29, 0x90
/* 0E60B0 001E5FB0 0800E003 */  jr          $31
/* 0E60B4 001E5FB4 00000000 */   nop
/* 0E60B8 001E5FB8 00000000 */  nop
/* 0E60BC 001E5FBC 00000000 */  nop
