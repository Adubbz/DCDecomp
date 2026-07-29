.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel find_exception_handler
/* 00DC10 0010DB10 80FFBD27 */  addiu       $29, $29, -0x80
/* 00DC14 0010DB14 01000224 */  addiu       $2, $0, 0x1
/* 00DC18 0010DB18 6000B6FF */  sd          $22, 0x60($29)
/* 00DC1C 0010DB1C 5000B5FF */  sd          $21, 0x50($29)
/* 00DC20 0010DB20 2DB00001 */  daddu       $22, $8, $0
/* 00DC24 0010DB24 4000B4FF */  sd          $20, 0x40($29)
/* 00DC28 0010DB28 2DA8A000 */  daddu       $21, $5, $0
/* 00DC2C 0010DB2C 3000B3FF */  sd          $19, 0x30($29)
/* 00DC30 0010DB30 2DA0C000 */  daddu       $20, $6, $0
/* 00DC34 0010DB34 1000B1FF */  sd          $17, 0x10($29)
/* 00DC38 0010DB38 2D980000 */  daddu       $19, $0, $0
/* 00DC3C 0010DB3C 7000BFFF */  sd          $31, 0x70($29)
/* 00DC40 0010DB40 2D888000 */  daddu       $17, $4, $0
/* 00DC44 0010DB44 2000B2FF */  sd          $18, 0x20($29)
/* 00DC48 0010DB48 0000B0FF */  sd          $16, 0x0($29)
/* 00DC4C 0010DB4C 3600A012 */  beqz        $21, .L0010DC28
/* 00DC50 0010DB50 0000C2AE */   sw         $2, 0x0($22)
/* 00DC54 0010DB54 2D300000 */  daddu       $6, $0, $0
/* 00DC58 0010DB58 0C00E010 */  beqz        $7, .L0010DB8C
/* 00DC5C 0010DB5C 0800A826 */   addiu      $8, $21, 0x8
/* 00DC60 0010DB60 23102802 */  subu        $2, $17, $8
/* 00DC64 0010DB64 0400248E */  lw          $4, 0x4($17)
/* 00DC68 0010DB68 03310200 */  sra         $6, $2, 4
/* 00DC6C 0010DB6C 00190600 */  sll         $3, $6, 4
/* 00DC70 0010DB70 0100C524 */  addiu       $5, $6, 0x1
/* 00DC74 0010DB74 21186800 */  addu        $3, $3, $8
/* 00DC78 0010DB78 FFFF9124 */  addiu       $17, $4, -0x1
/* 00DC7C 0010DB7C 0000628C */  lw          $2, 0x0($3)
/* 00DC80 0010DB80 27100200 */  nor         $2, $0, $2
/* 00DC84 0010DB84 02000010 */  b           .L0010DB90
/* 00DC88 0010DB88 0B30A200 */   movn       $6, $5, $2
.L0010DB8C:
/* 00DC8C 0010DB8C FFFF3126 */  addiu       $17, $17, -0x1
.L0010DB90:
/* 00DC90 0010DB90 00110600 */  sll         $2, $6, 4
/* 00DC94 0010DB94 FFFF033C */  lui         $3, (0xFFFFFFFF >> 16)
/* 00DC98 0010DB98 21284800 */  addu        $5, $2, $8
/* 00DC9C 0010DB9C FFFF6334 */  ori         $3, $3, (0xFFFFFFFF & 0xFFFF)
/* 00DCA0 0010DBA0 0000A28C */  lw          $2, 0x0($5)
/* 00DCA4 0010DBA4 20004310 */  beq         $2, $3, .L0010DC28
/* 00DCA8 0010DBA8 2D80A000 */   daddu      $16, $5, $0
/* 00DCAC 0010DBAC FFFF123C */  lui         $18, (0xFFFFFFFF >> 16)
/* 00DCB0 0010DBB0 FFFF5236 */  ori         $18, $18, (0xFFFFFFFF & 0xFFFF)
/* 00DCB4 0010DBB4 0000028E */  lw          $2, 0x0($16)
/* 00DCB8 0010DBB8 2B102202 */  sltu        $2, $17, $2
/* 00DCBC 0010DBBC 00000000 */  nop
.L0010DBC0:
/* 00DCC0 0010DBC0 16004054 */  bnel        $2, $0, .L0010DC1C
/* 00DCC4 0010DBC4 10001026 */   addiu      $16, $16, 0x10
/* 00DCC8 0010DBC8 0400028E */  lw          $2, 0x4($16)
/* 00DCCC 0010DBCC 2B102202 */  sltu        $2, $17, $2
/* 00DCD0 0010DBD0 12004050 */  beql        $2, $0, .L0010DC1C
/* 00DCD4 0010DBD4 10001026 */   addiu      $16, $16, 0x10
/* 00DCD8 0010DBD8 0C00058E */  lw          $5, 0xC($16)
/* 00DCDC 0010DBDC 0C00A010 */  beqz        $5, .L0010DC10
/* 00DCE0 0010DBE0 00000000 */   nop
/* 00DCE4 0010DBE4 0000828E */  lw          $2, 0x0($20)
/* 00DCE8 0010DBE8 0B004010 */  beqz        $2, .L0010DC18
/* 00DCEC 0010DBEC 2D208002 */   daddu      $4, $20, $0
/* 00DCF0 0010DBF0 09F84000 */  jalr        $2
/* 00DCF4 0010DBF4 2D30A002 */   daddu      $6, $21, $0
/* 00DCF8 0010DBF8 08004050 */  beql        $2, $0, .L0010DC1C
/* 00DCFC 0010DBFC 10001026 */   addiu      $16, $16, 0x10
/* 00DD00 0010DC00 01006052 */  beql        $19, $0, .L0010DC08
/* 00DD04 0010DC04 0800138E */   lw         $19, 0x8($16)
.L0010DC08:
/* 00DD08 0010DC08 07000010 */  b           .L0010DC28
/* 00DD0C 0010DC0C 0000C0AE */   sw         $0, 0x0($22)
.L0010DC10:
/* 00DD10 0010DC10 01006052 */  beql        $19, $0, .L0010DC18
/* 00DD14 0010DC14 0800138E */   lw         $19, 0x8($16)
.L0010DC18:
/* 00DD18 0010DC18 10001026 */  addiu       $16, $16, 0x10
.L0010DC1C:
/* 00DD1C 0010DC1C 0000028E */  lw          $2, 0x0($16)
/* 00DD20 0010DC20 E7FF5214 */  bne         $2, $18, .L0010DBC0
/* 00DD24 0010DC24 2B102202 */   sltu       $2, $17, $2
.L0010DC28:
/* 00DD28 0010DC28 2D106002 */  daddu       $2, $19, $0
/* 00DD2C 0010DC2C 7000BFDF */  ld          $31, 0x70($29)
/* 00DD30 0010DC30 6000B6DF */  ld          $22, 0x60($29)
/* 00DD34 0010DC34 5000B5DF */  ld          $21, 0x50($29)
/* 00DD38 0010DC38 4000B4DF */  ld          $20, 0x40($29)
/* 00DD3C 0010DC3C 3000B3DF */  ld          $19, 0x30($29)
/* 00DD40 0010DC40 2000B2DF */  ld          $18, 0x20($29)
/* 00DD44 0010DC44 1000B1DF */  ld          $17, 0x10($29)
/* 00DD48 0010DC48 0000B0DF */  ld          $16, 0x0($29)
/* 00DD4C 0010DC4C 0800E003 */  jr          $31
/* 00DD50 0010DC50 8000BD27 */   addiu      $29, $29, 0x80
/* 00DD54 0010DC54 00000000 */  nop
