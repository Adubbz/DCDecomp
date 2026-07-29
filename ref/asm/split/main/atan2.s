.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel atan2
/* 01DB18 0011DA18 70FFBD27 */  addiu       $29, $29, -0x90
/* 01DB1C 0011DA1C 4000B1FF */  sd          $17, 0x40($29)
/* 01DB20 0011DA20 3000B0FF */  sd          $16, 0x30($29)
/* 01DB24 0011DA24 2D88A000 */  daddu       $17, $5, $0
/* 01DB28 0011DA28 2D808000 */  daddu       $16, $4, $0
/* 01DB2C 0011DA2C 7000B4FF */  sd          $20, 0x70($29)
/* 01DB30 0011DA30 6000B3FF */  sd          $19, 0x60($29)
/* 01DB34 0011DA34 8000BFFF */  sd          $31, 0x80($29)
/* 01DB38 0011DA38 9665040C */  jal         __ieee754_atan2
/* 01DB3C 0011DA3C 5000B2FF */   sd         $18, 0x50($29)
/* 01DB40 0011DA40 2D984000 */  daddu       $19, $2, $0
/* 01DB44 0011DA44 FFFF0324 */  addiu       $3, $0, -0x1
/* 01DB48 0011DA48 2A00023C */  lui         $2, %hi(__fdlib_version)
/* 01DB4C 0011DA4C 308A548C */  lw          $20, %lo(__fdlib_version)($2)
/* 01DB50 0011DA50 2F008312 */  beq         $20, $3, .L0011DB10
/* 01DB54 0011DA54 2D106002 */   daddu      $2, $19, $0
/* 01DB58 0011DA58 0612040C */  jal         isnan
/* 01DB5C 0011DA5C 2D202002 */   daddu      $4, $17, $0
/* 01DB60 0011DA60 2B004014 */  bnez        $2, .L0011DB10
/* 01DB64 0011DA64 2D106002 */   daddu      $2, $19, $0
/* 01DB68 0011DA68 0612040C */  jal         isnan
/* 01DB6C 0011DA6C 2D200002 */   daddu      $4, $16, $0
/* 01DB70 0011DA70 27004014 */  bnez        $2, .L0011DB10
/* 01DB74 0011DA74 2D106002 */   daddu      $2, $19, $0
/* 01DB78 0011DA78 2D900000 */  daddu       $18, $0, $0
/* 01DB7C 0011DA7C 2D202002 */  daddu       $4, $17, $0
/* 01DB80 0011DA80 E840040C */  jal         dpcmp
/* 01DB84 0011DA84 2D284002 */   daddu      $5, $18, $0
/* 01DB88 0011DA88 21004014 */  bnez        $2, .L0011DB10
/* 01DB8C 0011DA8C 2D106002 */   daddu      $2, $19, $0
/* 01DB90 0011DA90 2D200002 */  daddu       $4, $16, $0
/* 01DB94 0011DA94 E840040C */  jal         dpcmp
/* 01DB98 0011DA98 2D284002 */   daddu      $5, $18, $0
/* 01DB9C 0011DA9C 1C004014 */  bnez        $2, .L0011DB10
/* 01DBA0 0011DAA0 2D106002 */   daddu      $2, $19, $0
/* 01DBA4 0011DAA4 2A00023C */  lui         $2, %hi(RO_00298A90)
/* 01DBA8 0011DAA8 01000324 */  addiu       $3, $0, 0x1
/* 01DBAC 0011DAAC 908A4224 */  addiu       $2, $2, %lo(RO_00298A90)
/* 01DBB0 0011DAB0 0800B0FF */  sd          $16, 0x8($29)
/* 01DBB4 0011DAB4 1000B1FF */  sd          $17, 0x10($29)
/* 01DBB8 0011DAB8 02000424 */  addiu       $4, $0, 0x2
/* 01DBBC 0011DABC 0000A3AF */  sw          $3, 0x0($29)
/* 01DBC0 0011DAC0 0400A2AF */  sw          $2, 0x4($29)
/* 01DBC4 0011DAC4 1800B2FF */  sd          $18, 0x18($29)
/* 01DBC8 0011DAC8 05008412 */  beq         $20, $4, .L0011DAE0
/* 01DBCC 0011DACC 2000A0AF */   sw         $0, 0x20($29)
/* 01DBD0 0011DAD0 BA74040C */  jal         matherr
/* 01DBD4 0011DAD4 2D20A003 */   daddu      $4, $29, $0
/* 01DBD8 0011DAD8 06004014 */  bnez        $2, .L0011DAF4
/* 01DBDC 0011DADC 2000A28F */   lw         $2, 0x20($29)
.L0011DAE0:
/* 01DBE0 0011DAE0 D805040C */  jal         __errno
/* 01DBE4 0011DAE4 00000000 */   nop
/* 01DBE8 0011DAE8 21000324 */  addiu       $3, $0, 0x21
/* 01DBEC 0011DAEC 000043AC */  sw          $3, 0x0($2)
/* 01DBF0 0011DAF0 2000A28F */  lw          $2, 0x20($29)
.L0011DAF4:
/* 01DBF4 0011DAF4 06004050 */  beql        $2, $0, .L0011DB10
/* 01DBF8 0011DAF8 1800A2DF */   ld         $2, 0x18($29)
/* 01DBFC 0011DAFC D805040C */  jal         __errno
/* 01DC00 0011DB00 00000000 */   nop
/* 01DC04 0011DB04 2000A38F */  lw          $3, 0x20($29)
/* 01DC08 0011DB08 000043AC */  sw          $3, 0x0($2)
/* 01DC0C 0011DB0C 1800A2DF */  ld          $2, 0x18($29)
.L0011DB10:
/* 01DC10 0011DB10 8000BFDF */  ld          $31, 0x80($29)
/* 01DC14 0011DB14 7000B4DF */  ld          $20, 0x70($29)
/* 01DC18 0011DB18 6000B3DF */  ld          $19, 0x60($29)
/* 01DC1C 0011DB1C 5000B2DF */  ld          $18, 0x50($29)
/* 01DC20 0011DB20 4000B1DF */  ld          $17, 0x40($29)
/* 01DC24 0011DB24 3000B0DF */  ld          $16, 0x30($29)
/* 01DC28 0011DB28 0800E003 */  jr          $31
/* 01DC2C 0011DB2C 9000BD27 */   addiu      $29, $29, 0x90
