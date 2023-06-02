.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _lshift
/* 3F20 00103E20 80FFBD27 */  addiu      $sp, $sp, -0x80
/* 3F24 00103E24 6000B6FF */  sd         $22, 0x60($sp)
/* 3F28 00103E28 4000B4FF */  sd         $20, 0x40($sp)
/* 3F2C 00103E2C 2DB08000 */  daddu      $22, $4, $0
/* 3F30 00103E30 1000B1FF */  sd         $17, 0x10($sp)
/* 3F34 00103E34 43A10600 */  sra        $20, $6, 5
/* 3F38 00103E38 0000B0FF */  sd         $16, 0x0($sp)
/* 3F3C 00103E3C 2D88A000 */  daddu      $17, $5, $0
/* 3F40 00103E40 7000BFFF */  sd         $31, 0x70($sp)
/* 3F44 00103E44 5000B5FF */  sd         $21, 0x50($sp)
/* 3F48 00103E48 3000B3FF */  sd         $19, 0x30($sp)
/* 3F4C 00103E4C 2000B2FF */  sd         $18, 0x20($sp)
/* 3F50 00103E50 1000238E */  lw         $3, 0x10($17)
/* 3F54 00103E54 0800278E */  lw         $7, 0x8($17)
/* 3F58 00103E58 21188302 */  addu       $3, $20, $3
/* 3F5C 00103E5C 01007024 */  addiu      $16, $3, 0x1
/* 3F60 00103E60 2A10F000 */  slt        $2, $7, $16
/* 3F64 00103E64 0D004010 */  beqz       $2, .L00103E9C
/* 3F68 00103E68 0400258E */   lw        $5, 0x4($17)
/* 3F6C 00103E6C 1F00D330 */  andi       $19, $6, 0x1F
/* 3F70 00103E70 14003226 */  addiu      $18, $17, 0x14
/* 3F74 00103E74 00000000 */  nop
.L00103E78:
/* 3F78 00103E78 40380700 */  sll        $7, $7, 1
/* 3F7C 00103E7C 0100A524 */  addiu      $5, $5, 0x1
/* 3F80 00103E80 2A10F000 */  slt        $2, $7, $16
/* 3F84 00103E84 00000000 */  nop
/* 3F88 00103E88 00000000 */  nop
/* 3F8C 00103E8C FAFF4014 */  bnez       $2, .L00103E78
/* 3F90 00103E90 00000000 */   nop
/* 3F94 00103E94 03000010 */  b          .L00103EA4
/* 3F98 00103E98 00000000 */   nop
.L00103E9C:
/* 3F9C 00103E9C 1F00D330 */  andi       $19, $6, 0x1F
/* 3FA0 00103EA0 14003226 */  addiu      $18, $17, 0x14
.L00103EA4:
/* 3FA4 00103EA4 8E0D040C */  jal        _Balloc
/* 3FA8 00103EA8 2D20C002 */   daddu     $4, $22, $0
/* 3FAC 00103EAC 2DA84000 */  daddu      $21, $2, $0
/* 3FB0 00103EB0 0A00801A */  blez       $20, .L00103EDC
/* 3FB4 00103EB4 1400A626 */   addiu     $6, $21, 0x14
/* 3FB8 00103EB8 2D388002 */  daddu      $7, $20, $0
/* 3FBC 00103EBC 00000000 */  nop
.L00103EC0:
/* 3FC0 00103EC0 0000C0AC */  sw         $0, 0x0($6)
/* 3FC4 00103EC4 FFFFE724 */  addiu      $7, $7, -0x1
/* 3FC8 00103EC8 0400C624 */  addiu      $6, $6, 0x4
/* 3FCC 00103ECC 00000000 */  nop
/* 3FD0 00103ED0 00000000 */  nop
/* 3FD4 00103ED4 FAFFE014 */  bnez       $7, .L00103EC0
/* 3FD8 00103ED8 00000000 */   nop
.L00103EDC:
/* 3FDC 00103EDC 1000228E */  lw         $2, 0x10($17)
/* 3FE0 00103EE0 2D204002 */  daddu      $4, $18, $0
/* 3FE4 00103EE4 80100200 */  sll        $2, $2, 2
/* 3FE8 00103EE8 13006012 */  beqz       $19, .L00103F38
/* 3FEC 00103EEC 21388200 */   addu      $7, $4, $2
/* 3FF0 00103EF0 20000224 */  addiu      $2, $0, 0x20
/* 3FF4 00103EF4 2D180000 */  daddu      $3, $0, $0
/* 3FF8 00103EF8 23285300 */  subu       $5, $2, $19
/* 3FFC 00103EFC 01000826 */  addiu      $8, $16, 0x1
.L00103F00:
/* 4000 00103F00 0000828C */  lw         $2, 0x0($4)
/* 4004 00103F04 04106202 */  sllv       $2, $2, $19
/* 4008 00103F08 25104300 */  or         $2, $2, $3
/* 400C 00103F0C 0000C2AC */  sw         $2, 0x0($6)
/* 4010 00103F10 0400C624 */  addiu      $6, $6, 0x4
/* 4014 00103F14 0000838C */  lw         $3, 0x0($4)
/* 4018 00103F18 04008424 */  addiu      $4, $4, 0x4
/* 401C 00103F1C 2B108700 */  sltu       $2, $4, $7
/* 4020 00103F20 F7FF4014 */  bnez       $2, .L00103F00
/* 4024 00103F24 0618A300 */   srlv      $3, $3, $5
/* 4028 00103F28 0B800301 */  movn       $16, $8, $3
/* 402C 00103F2C 0000C3AC */  sw         $3, 0x0($6)
/* 4030 00103F30 0A000010 */  b          .L00103F5C
/* 4034 00103F34 FFFF0526 */   addiu     $5, $16, -0x1
.L00103F38:
/* 4038 00103F38 FFFF0526 */  addiu      $5, $16, -0x1
/* 403C 00103F3C 00000000 */  nop
.L00103F40:
/* 4040 00103F40 0000828C */  lw         $2, 0x0($4)
/* 4044 00103F44 04008424 */  addiu      $4, $4, 0x4
/* 4048 00103F48 0000C2AC */  sw         $2, 0x0($6)
/* 404C 00103F4C 2B188700 */  sltu       $3, $4, $7
/* 4050 00103F50 0400C624 */  addiu      $6, $6, 0x4
/* 4054 00103F54 FAFF6014 */  bnez       $3, .L00103F40
/* 4058 00103F58 00000000 */   nop
.L00103F5C:
/* 405C 00103F5C 1000A5AE */  sw         $5, 0x10($21)
/* 4060 00103F60 2D20C002 */  daddu      $4, $22, $0
/* 4064 00103F64 B80D040C */  jal        _Bfree
/* 4068 00103F68 2D282002 */   daddu     $5, $17, $0
/* 406C 00103F6C 2D10A002 */  daddu      $2, $21, $0
/* 4070 00103F70 7000BFDF */  ld         $31, 0x70($sp)
/* 4074 00103F74 6000B6DF */  ld         $22, 0x60($sp)
/* 4078 00103F78 5000B5DF */  ld         $21, 0x50($sp)
/* 407C 00103F7C 4000B4DF */  ld         $20, 0x40($sp)
/* 4080 00103F80 3000B3DF */  ld         $19, 0x30($sp)
/* 4084 00103F84 2000B2DF */  ld         $18, 0x20($sp)
/* 4088 00103F88 1000B1DF */  ld         $17, 0x10($sp)
/* 408C 00103F8C 0000B0DF */  ld         $16, 0x0($sp)
/* 4090 00103F90 0800E003 */  jr         $31
/* 4094 00103F94 8000BD27 */   addiu     $sp, $sp, 0x80