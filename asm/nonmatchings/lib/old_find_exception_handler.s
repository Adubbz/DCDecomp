.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel old_find_exception_handler
/* DB38 0010DA38 2D68A000 */  daddu      $13, $5, $0
/* DB3C 0010DA3C 3200A011 */  beqz       $13, .L0010DB08
/* DB40 0010DA40 FFFF0824 */   addiu     $8, $0, -0x1
/* DB44 0010DA44 FFFF023C */  lui        $2, (0xFFFFFFFF >> 16)
/* DB48 0010DA48 0000A38D */  lw         $3, 0x0($13)
/* DB4C 0010DA4C FFFF4234 */  ori        $2, $2, (0xFFFFFFFF & 0xFFFF)
/* DB50 0010DA50 26006210 */  beq        $3, $2, .L0010DAEC
/* DB54 0010DA54 2D500000 */   daddu     $10, $0, $0
/* DB58 0010DA58 FFFF093C */  lui        $9, (0xFFFFFFFF >> 16)
/* DB5C 0010DA5C 0C000C24 */  addiu      $12, $0, 0xC
/* DB60 0010DA60 FFFF0B24 */  addiu      $11, $0, -0x1
/* DB64 0010DA64 FFFF2935 */  ori        $9, $9, (0xFFFFFFFF & 0xFFFF)
/* DB68 0010DA68 2D30A001 */  daddu      $6, $13, $0
/* DB6C 0010DA6C 00000000 */  nop
.L0010DA70:
/* DB70 0010DA70 0000C78C */  lw         $7, 0x0($6)
/* DB74 0010DA74 2B108700 */  sltu       $2, $4, $7
/* DB78 0010DA78 12004014 */  bnez       $2, .L0010DAC4
/* DB7C 0010DA7C 00000000 */   nop
/* DB80 0010DA80 0400C58C */  lw         $5, 0x4($6)
/* DB84 0010DA84 2B108500 */  sltu       $2, $4, $5
/* DB88 0010DA88 0E004010 */  beqz       $2, .L0010DAC4
/* DB8C 0010DA8C 00000000 */   nop
/* DB90 0010DA90 0A000B11 */  beq        $8, $11, .L0010DABC
/* DB94 0010DA94 18100C01 */   mult      $2, $8, $12
/* DB98 0010DA98 21184D00 */  addu       $3, $2, $13
/* DB9C 0010DA9C 0400628C */  lw         $2, 0x4($3)
/* DBA0 0010DAA0 2B104500 */  sltu       $2, $2, $5
/* DBA4 0010DAA4 0E004054 */  bnel       $2, $0, .L0010DAE0
/* DBA8 0010DAA8 0C00C624 */   addiu     $6, $6, 0xC
/* DBAC 0010DAAC 0000628C */  lw         $2, 0x0($3)
/* DBB0 0010DAB0 2B10E200 */  sltu       $2, $7, $2
/* DBB4 0010DAB4 0A004054 */  bnel       $2, $0, .L0010DAE0
/* DBB8 0010DAB8 0C00C624 */   addiu     $6, $6, 0xC
.L0010DABC:
/* DBBC 0010DABC 07000010 */  b          .L0010DADC
/* DBC0 0010DAC0 2D404001 */   daddu     $8, $10, $0
.L0010DAC4:
/* DBC4 0010DAC4 06000205 */  bltzl      $8, .L0010DAE0
/* DBC8 0010DAC8 0C00C624 */   addiu     $6, $6, 0xC
/* DBCC 0010DACC 0000C28C */  lw         $2, 0x0($6)
/* DBD0 0010DAD0 2B108200 */  sltu       $2, $4, $2
/* DBD4 0010DAD4 06004014 */  bnez       $2, .L0010DAF0
/* DBD8 0010DAD8 FFFF0224 */   addiu     $2, $0, -0x1
.L0010DADC:
/* DBDC 0010DADC 0C00C624 */  addiu      $6, $6, 0xC
.L0010DAE0:
/* DBE0 0010DAE0 0000C28C */  lw         $2, 0x0($6)
/* DBE4 0010DAE4 E2FF4914 */  bne        $2, $9, .L0010DA70
/* DBE8 0010DAE8 01004A25 */   addiu     $10, $10, 0x1
.L0010DAEC:
/* DBEC 0010DAEC FFFF0224 */  addiu      $2, $0, -0x1
.L0010DAF0:
/* DBF0 0010DAF0 05000211 */  beq        $8, $2, .L0010DB08
/* DBF4 0010DAF4 0C000324 */   addiu     $3, $0, 0xC
/* DBF8 0010DAF8 18100301 */  mult       $2, $8, $3
/* DBFC 0010DAFC 21184D00 */  addu       $3, $2, $13
/* DC00 0010DB00 0800E003 */  jr         $31
/* DC04 0010DB04 0800628C */   lw        $2, 0x8($3)
.L0010DB08:
/* DC08 0010DB08 0800E003 */  jr         $31
/* DC0C 0010DB0C 2D100000 */   daddu     $2, $0, $0
