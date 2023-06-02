.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_NEAR_MONSTER__FP12RS_STACKDATAi
/* E5F20 001E5E20 70FFBD27 */  addiu      $sp, $sp, -0x90
/* E5F24 001E5E24 5000BF7F */  sq         $31, 0x50($sp)
/* E5F28 001E5E28 4000B37F */  sq         $19, 0x40($sp)
/* E5F2C 001E5E2C 3000B27F */  sq         $18, 0x30($sp)
/* E5F30 001E5E30 2000B17F */  sq         $17, 0x20($sp)
/* E5F34 001E5E34 1000B07F */  sq         $16, 0x10($sp)
/* E5F38 001E5E38 0400B5E7 */  swc1       $f21, 0x4($sp)
/* E5F3C 001E5E3C 0000B4E7 */  swc1       $f20, 0x0($sp)
/* E5F40 001E5E40 289E8070 */  paddub     $19, $4, $0
/* E5F44 001E5E44 E09C838F */  lw         $3, -0x6320($gp)
/* E5F48 001E5E48 9000728C */  lw         $18, 0x90($3)
/* E5F4C 001E5E4C 7043023C */  lui        $2, (0x43700000 >> 16)
/* E5F50 001E5E50 00A08244 */  mtc1       $2, $f20
/* E5F54 001E5E54 FFFF1024 */  addiu      $16, $0, -0x1
/* E5F58 001E5E58 10350224 */  addiu      $2, $0, 0x3510
/* E5F5C 001E5E5C 18104202 */  mult       $2, $18, $2
/* E5F60 001E5E60 21106200 */  addu       $2, $3, $2
/* E5F64 001E5E64 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* E5F68 001E5E68 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* E5F6C 001E5E6C 21204100 */  addu       $4, $2, $at
/* E5F70 001E5E70 6000A527 */  addiu      $5, $sp, 0x60
/* E5F74 001E5E74 A000998C */  lw         $25, 0xA0($4)
/* E5F78 001E5E78 A000398F */  lw         $25, 0xA0($25)
/* E5F7C 001E5E7C 09F82003 */  jalr       $25
/* E5F80 001E5E80 00000000 */   nop
/* E5F84 001E5E84 288E0070 */  paddub     $17, $0, $0
/* E5F88 001E5E88 2B000010 */  b          .L001E5F38
/* E5F8C 001E5E8C 00000000 */   nop
.L001E5E90:
/* E5F90 001E5E90 28003212 */  beq        $17, $18, .L001E5F34
/* E5F94 001E5E94 00000000 */   nop
/* E5F98 001E5E98 E09C858F */  lw         $5, -0x6320($gp)
/* E5F9C 001E5E9C 80181100 */  sll        $3, $17, 2
/* E5FA0 001E5EA0 21207100 */  addu       $4, $3, $17
/* E5FA4 001E5EA4 80180400 */  sll        $3, $4, 2
/* E5FA8 001E5EA8 21188300 */  addu       $3, $4, $3
/* E5FAC 001E5EAC 00190300 */  sll        $3, $3, 4
/* E5FB0 001E5EB0 21186500 */  addu       $3, $3, $5
/* E5FB4 001E5EB4 0200013C */  lui        $at, (0x20000 >> 16)
/* E5FB8 001E5EB8 21086100 */  addu       $at, $3, $at
/* E5FBC 001E5EBC D0E3248C */  lw         $4, -0x1C30($at)
/* E5FC0 001E5EC0 02000324 */  addiu      $3, $0, 0x2
/* E5FC4 001E5EC4 1B008314 */  bne        $4, $3, .L001E5F34
/* E5FC8 001E5EC8 00000000 */   nop
/* E5FCC 001E5ECC 10350224 */  addiu      $2, $0, 0x3510
/* E5FD0 001E5ED0 18102202 */  mult       $2, $17, $2
/* E5FD4 001E5ED4 2110A200 */  addu       $2, $5, $2
/* E5FD8 001E5ED8 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* E5FDC 001E5EDC D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* E5FE0 001E5EE0 21204100 */  addu       $4, $2, $at
/* E5FE4 001E5EE4 7000A527 */  addiu      $5, $sp, 0x70
/* E5FE8 001E5EE8 A000998C */  lw         $25, 0xA0($4)
/* E5FEC 001E5EEC A000398F */  lw         $25, 0xA0($25)
/* E5FF0 001E5EF0 09F82003 */  jalr       $25
/* E5FF4 001E5EF4 00000000 */   nop
/* E5FF8 001E5EF8 6000A427 */  addiu      $4, $sp, 0x60
/* E5FFC 001E5EFC 7000A527 */  addiu      $5, $sp, 0x70
/* E6000 001E5F00 648D040C */  jal        DistVector__FPfPf
/* E6004 001E5F04 00000000 */   nop
/* E6008 001E5F08 46050046 */  mov.s      $f21, $f0
/* E600C 001E5F0C 34A81446 */  c.lt.s     $f21, $f20
/* E6010 001E5F10 00000000 */  nop
/* E6014 001E5F14 07000045 */  bc1f       .L001E5F34
/* E6018 001E5F18 00000000 */   nop
/* E601C 001E5F1C 8000A427 */  addiu      $4, $sp, 0x80
/* E6020 001E5F20 7000A527 */  addiu      $5, $sp, 0x70
/* E6024 001E5F24 0C86040C */  jal        sceVu0CopyVector
/* E6028 001E5F28 00000000 */   nop
/* E602C 001E5F2C 06AD0046 */  mov.s      $f20, $f21
/* E6030 001E5F30 28862072 */  paddub     $16, $17, $0
.L001E5F34:
/* E6034 001E5F34 01003126 */  addiu      $17, $17, 0x1
.L001E5F38:
/* E6038 001E5F38 1000232A */  slti       $3, $17, 0x10
/* E603C 001E5F3C D4FF6014 */  bnez       $3, .L001E5E90
/* E6040 001E5F40 00000000 */   nop
/* E6044 001E5F44 28266072 */  paddub     $4, $19, $0
/* E6048 001E5F48 08009324 */  addiu      $19, $4, 0x8
/* E604C 001E5F4C 8000ACC7 */  lwc1       $f12, 0x80($sp)
/* E6050 001E5F50 BC85070C */  jal        SetStack__FP12RS_STACKDATAf_3
/* E6054 001E5F54 00000000 */   nop
/* E6058 001E5F58 28266072 */  paddub     $4, $19, $0
/* E605C 001E5F5C 08009324 */  addiu      $19, $4, 0x8
/* E6060 001E5F60 8400ACC7 */  lwc1       $f12, 0x84($sp)
/* E6064 001E5F64 BC85070C */  jal        SetStack__FP12RS_STACKDATAf_3
/* E6068 001E5F68 00000000 */   nop
/* E606C 001E5F6C 28266072 */  paddub     $4, $19, $0
/* E6070 001E5F70 08009324 */  addiu      $19, $4, 0x8
/* E6074 001E5F74 8800ACC7 */  lwc1       $f12, 0x88($sp)
/* E6078 001E5F78 BC85070C */  jal        SetStack__FP12RS_STACKDATAf_3
/* E607C 001E5F7C 00000000 */   nop
/* E6080 001E5F80 28266072 */  paddub     $4, $19, $0
/* E6084 001E5F84 282E0072 */  paddub     $5, $16, $0
/* E6088 001E5F88 B485070C */  jal        SetStack__FP12RS_STACKDATAi_3
/* E608C 001E5F8C 00000000 */   nop
/* E6090 001E5F90 5000BF7B */  lq         $31, 0x50($sp)
/* E6094 001E5F94 4000B37B */  lq         $19, 0x40($sp)
/* E6098 001E5F98 3000B27B */  lq         $18, 0x30($sp)
/* E609C 001E5F9C 2000B17B */  lq         $17, 0x20($sp)
/* E60A0 001E5FA0 1000B07B */  lq         $16, 0x10($sp)
/* E60A4 001E5FA4 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* E60A8 001E5FA8 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* E60AC 001E5FAC 9000BD27 */  addiu      $sp, $sp, 0x90
/* E60B0 001E5FB0 0800E003 */  jr         $31
/* E60B4 001E5FB4 00000000 */   nop
/* E60B8 001E5FB8 00000000 */  nop
/* E60BC 001E5FBC 00000000 */  nop
