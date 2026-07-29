.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BtSetActiveItemModel__FPUi
/* 0D3FD0 001D3ED0 E0FEBD27 */  addiu       $29, $29, -0x120
/* 0D3FD4 001D3ED4 8000BF7F */  sq          $31, 0x80($29)
/* 0D3FD8 001D3ED8 7000B77F */  sq          $23, 0x70($29)
/* 0D3FDC 001D3EDC 6000B67F */  sq          $22, 0x60($29)
/* 0D3FE0 001D3EE0 5000B57F */  sq          $21, 0x50($29)
/* 0D3FE4 001D3EE4 4000B47F */  sq          $20, 0x40($29)
/* 0D3FE8 001D3EE8 3000B37F */  sq          $19, 0x30($29)
/* 0D3FEC 001D3EEC 2000B27F */  sq          $18, 0x20($29)
/* 0D3FF0 001D3EF0 1000B17F */  sq          $17, 0x10($29)
/* 0D3FF4 001D3EF4 0000B07F */  sq          $16, 0x0($29)
/* 0D3FF8 001D3EF8 28868070 */  paddub      $16, $4, $0
/* 0D3FFC 001D3EFC 789C838F */  lw          $3, -0x6388($28)
/* 0D4000 001D3F00 60437324 */  addiu       $19, $3, 0x4360
/* 0D4004 001D3F04 288E0070 */  paddub      $17, $0, $0
/* 0D4008 001D3F08 4E000010 */  b           .L001D4044
/* 0D400C 001D3F0C 00000000 */   nop
.L001D3F10:
/* 0D4010 001D3F10 40181100 */  sll         $3, $17, 1
/* 0D4014 001D3F14 21187300 */  addu        $3, $3, $19
/* 0D4018 001D3F18 02007484 */  lh          $20, 0x2($3)
/* 0D401C 001D3F1C FFFF0324 */  addiu       $3, $0, -0x1
/* 0D4020 001D3F20 47008312 */  beq         $20, $3, .L001D4040
/* 0D4024 001D3F24 00000000 */   nop
/* 0D4028 001D3F28 9000A427 */  addiu       $4, $29, 0x90
/* 0D402C 001D3F2C D000A527 */  addiu       $5, $29, 0xD0
/* 0D4030 001D3F30 28368072 */  paddub      $6, $20, $0
/* 0D4034 001D3F34 48DC060C */  jal         BtGetItemNamePath__FPcPci
/* 0D4038 001D3F38 00000000 */   nop
/* 0D403C 001D3F3C 9000A427 */  addiu       $4, $29, 0x90
/* 0D4040 001D3F40 282E0072 */  paddub      $5, $16, $0
/* 0D4044 001D3F44 1801A627 */  addiu       $6, $29, 0x118
/* 0D4048 001D3F48 D8FC040C */  jal         LoadFile__FPcPvPi
/* 0D404C 001D3F4C 00000000 */   nop
/* 0D4050 001D3F50 DC4F050C */  jal         wait_now_loading_vsync__Fv
/* 0D4054 001D3F54 00000000 */   nop
/* 0D4058 001D3F58 1801A28F */  lw          $2, 0x118($29)
/* 0D405C 001D3F5C 83110200 */  sra         $2, $2, 6
/* 0D4060 001D3F60 01004224 */  addiu       $2, $2, 0x1
/* 0D4064 001D3F64 80110200 */  sll         $2, $2, 6
/* 0D4068 001D3F68 82100200 */  srl         $2, $2, 2
/* 0D406C 001D3F6C 1801A2AF */  sw          $2, 0x118($29)
/* 0D4070 001D3F70 1801A28F */  lw          $2, 0x118($29)
/* 0D4074 001D3F74 80100200 */  sll         $2, $2, 2
/* 0D4078 001D3F78 21280202 */  addu        $5, $16, $2
/* 0D407C 001D3F7C D000A427 */  addiu       $4, $29, 0xD0
/* 0D4080 001D3F80 1C01A627 */  addiu       $6, $29, 0x11C
/* 0D4084 001D3F84 D8FC040C */  jal         LoadFile__FPcPvPi
/* 0D4088 001D3F88 00000000 */   nop
/* 0D408C 001D3F8C DC4F050C */  jal         wait_now_loading_vsync__Fv
/* 0D4090 001D3F90 00000000 */   nop
/* 0D4094 001D3F94 80B01100 */  sll         $22, $17, 2
/* 0D4098 001D3F98 EC01023C */  lui         $2, %hi(activeItem + 0x18)
/* 0D409C 001D3F9C 88784224 */  addiu       $2, $2, %lo(activeItem + 0x18)
/* 0D40A0 001D3FA0 21A85600 */  addu        $21, $2, $22
/* 0D40A4 001D3FA4 0000A58E */  lw          $5, 0x0($21)
/* 0D40A8 001D3FA8 FFFF0224 */  addiu       $2, $0, -0x1
/* 0D40AC 001D3FAC 0700A210 */  beq         $5, $2, .L001D3FCC
/* 0D40B0 001D3FB0 00000000 */   nop
/* 0D40B4 001D3FB4 EC01013C */  lui         $1, %hi(activeItem + 0x38)
/* 0D40B8 001D3FB8 A878248C */  lw          $4, %lo(activeItem + 0x38)($1)
/* 0D40BC 001D3FBC DC51070C */  jal         DeleteModel__14CMainItemModelFi
/* 0D40C0 001D3FC0 00000000 */   nop
/* 0D40C4 001D3FC4 FFFF0224 */  addiu       $2, $0, -0x1
/* 0D40C8 001D3FC8 0000A2AE */  sw          $2, 0x0($21)
.L001D3FCC:
/* 0D40CC 001D3FCC 1C01B28F */  lw          $18, 0x11C($29)
/* 0D40D0 001D3FD0 1801A28F */  lw          $2, 0x118($29)
/* 0D40D4 001D3FD4 80100200 */  sll         $2, $2, 2
/* 0D40D8 001D3FD8 21B80202 */  addu        $23, $16, $2
/* 0D40DC 001D3FDC 0000A58E */  lw          $5, 0x0($21)
/* 0D40E0 001D3FE0 FFFF0224 */  addiu       $2, $0, -0x1
/* 0D40E4 001D3FE4 0500A210 */  beq         $5, $2, .L001D3FFC
/* 0D40E8 001D3FE8 00000000 */   nop
/* 0D40EC 001D3FEC EC01013C */  lui         $1, %hi(activeItem + 0x38)
/* 0D40F0 001D3FF0 A878248C */  lw          $4, %lo(activeItem + 0x38)($1)
/* 0D40F4 001D3FF4 DC51070C */  jal         DeleteModel__14CMainItemModelFi
/* 0D40F8 001D3FF8 00000000 */   nop
.L001D3FFC:
/* 0D40FC 001D3FFC EC01013C */  lui         $1, %hi(activeItem + 0x38)
/* 0D4100 001D4000 A878248C */  lw          $4, %lo(activeItem + 0x38)($1)
/* 0D4104 001D4004 282E8072 */  paddub      $5, $20, $0
/* 0D4108 001D4008 28360072 */  paddub      $6, $16, $0
/* 0D410C 001D400C 283EE072 */  paddub      $7, $23, $0
/* 0D4110 001D4010 28464072 */  paddub      $8, $18, $0
/* 0D4114 001D4014 7851070C */  jal         SetCashModel__14CMainItemModelFiPUiPUii
/* 0D4118 001D4018 00000000 */   nop
/* 0D411C 001D401C 0000A2AE */  sw          $2, 0x0($21)
/* 0D4120 001D4020 EC01033C */  lui         $3, %hi(activeItem + 0x28)
/* 0D4124 001D4024 98786324 */  addiu       $3, $3, %lo(activeItem + 0x28)
/* 0D4128 001D4028 21187600 */  addu        $3, $3, $22
/* 0D412C 001D402C 000060AC */  sw          $0, 0x0($3)
/* 0D4130 001D4030 EC01033C */  lui         $3, %hi(activeItem + 0x8)
/* 0D4134 001D4034 78786324 */  addiu       $3, $3, %lo(activeItem + 0x8)
/* 0D4138 001D4038 21187600 */  addu        $3, $3, $22
/* 0D413C 001D403C 000074AC */  sw          $20, 0x0($3)
.L001D4040:
/* 0D4140 001D4040 01003126 */  addiu       $17, $17, 0x1
.L001D4044:
/* 0D4144 001D4044 0300232A */  slti        $3, $17, 0x3
/* 0D4148 001D4048 B1FF6014 */  bnez        $3, .L001D3F10
/* 0D414C 001D404C 00000000 */   nop
/* 0D4150 001D4050 8000BF7B */  lq          $31, 0x80($29)
/* 0D4154 001D4054 7000B77B */  lq          $23, 0x70($29)
/* 0D4158 001D4058 6000B67B */  lq          $22, 0x60($29)
/* 0D415C 001D405C 5000B57B */  lq          $21, 0x50($29)
/* 0D4160 001D4060 4000B47B */  lq          $20, 0x40($29)
/* 0D4164 001D4064 3000B37B */  lq          $19, 0x30($29)
/* 0D4168 001D4068 2000B27B */  lq          $18, 0x20($29)
/* 0D416C 001D406C 1000B17B */  lq          $17, 0x10($29)
/* 0D4170 001D4070 0000B07B */  lq          $16, 0x0($29)
/* 0D4174 001D4074 2001BD27 */  addiu       $29, $29, 0x120
/* 0D4178 001D4078 0800E003 */  jr          $31
/* 0D417C 001D407C 00000000 */   nop
