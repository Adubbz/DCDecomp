.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Preset__6ClsMesFi
/* 04DB60 0014DA60 E0FFBD27 */  addiu       $29, $29, -0x20
/* 04DB64 0014DA64 1000BF7F */  sq          $31, 0x10($29)
/* 04DB68 0014DA68 0000B07F */  sq          $16, 0x0($29)
/* 04DB6C 0014DA6C 28868070 */  paddub      $16, $4, $0
/* 04DB70 0014DA70 03000324 */  addiu       $3, $0, 0x3
/* 04DB74 0014DA74 4800A310 */  beq         $5, $3, .L0014DB98
/* 04DB78 0014DA78 00000000 */   nop
/* 04DB7C 0014DA7C 04000324 */  addiu       $3, $0, 0x4
/* 04DB80 0014DA80 3600A310 */  beq         $5, $3, .L0014DB5C
/* 04DB84 0014DA84 00000000 */   nop
/* 04DB88 0014DA88 02000324 */  addiu       $3, $0, 0x2
/* 04DB8C 0014DA8C 2C00A310 */  beq         $5, $3, .L0014DB40
/* 04DB90 0014DA90 00000000 */   nop
/* 04DB94 0014DA94 1900A010 */  beqz        $5, .L0014DAFC
/* 04DB98 0014DA98 00000000 */   nop
/* 04DB9C 0014DA9C 01000324 */  addiu       $3, $0, 0x1
/* 04DBA0 0014DAA0 0300A310 */  beq         $5, $3, .L0014DAB0
/* 04DBA4 0014DAA4 00000000 */   nop
/* 04DBA8 0014DAA8 3B000010 */  b           .L0014DB98
/* 04DBAC 0014DAAC 00000000 */   nop
.L0014DAB0:
/* 04DBB0 0014DAB0 340000AE */  sw          $0, 0x34($16)
/* 04DBB4 0014DAB4 A40000AE */  sw          $0, 0xA4($16)
/* 04DBB8 0014DAB8 A80000AE */  sw          $0, 0xA8($16)
/* 04DBBC 0014DABC BF80023C */  lui         $2, (0x80BFBFBF >> 16)
/* 04DBC0 0014DAC0 BFBF4434 */  ori         $4, $2, (0x80BFBFBF & 0xFFFF)
/* 04DBC4 0014DAC4 8432050C */  jal         Color2Clut__FUi
/* 04DBC8 0014DAC8 00000000 */   nop
/* 04DBCC 0014DACC FF004330 */  andi        $3, $2, 0xFF
/* 04DBD0 0014DAD0 A81603AE */  sw          $3, 0x16A8($16)
/* 04DBD4 0014DAD4 A816038E */  lw          $3, 0x16A8($16)
/* 04DBD8 0014DAD8 AC1603AE */  sw          $3, 0x16AC($16)
/* 04DBDC 0014DADC 02000324 */  addiu       $3, $0, 0x2
/* 04DBE0 0014DAE0 C01603AE */  sw          $3, 0x16C0($16)
/* 04DBE4 0014DAE4 C41600AE */  sw          $0, 0x16C4($16)
/* 04DBE8 0014DAE8 01000324 */  addiu       $3, $0, 0x1
/* 04DBEC 0014DAEC CC1603AE */  sw          $3, 0x16CC($16)
/* 04DBF0 0014DAF0 D01600AE */  sw          $0, 0x16D0($16)
/* 04DBF4 0014DAF4 28000010 */  b           .L0014DB98
/* 04DBF8 0014DAF8 00000000 */   nop
.L0014DAFC:
/* 04DBFC 0014DAFC 01000224 */  addiu       $2, $0, 0x1
/* 04DC00 0014DB00 340002AE */  sw          $2, 0x34($16)
/* 04DC04 0014DB04 3080023C */  lui         $2, (0x80304045 >> 16)
/* 04DC08 0014DB08 45404434 */  ori         $4, $2, (0x80304045 & 0xFFFF)
/* 04DC0C 0014DB0C 8432050C */  jal         Color2Clut__FUi
/* 04DC10 0014DB10 00000000 */   nop
/* 04DC14 0014DB14 FF004330 */  andi        $3, $2, 0xFF
/* 04DC18 0014DB18 A81603AE */  sw          $3, 0x16A8($16)
/* 04DC1C 0014DB1C A816038E */  lw          $3, 0x16A8($16)
/* 04DC20 0014DB20 AC1603AE */  sw          $3, 0x16AC($16)
/* 04DC24 0014DB24 01000324 */  addiu       $3, $0, 0x1
/* 04DC28 0014DB28 C01603AE */  sw          $3, 0x16C0($16)
/* 04DC2C 0014DB2C C41603AE */  sw          $3, 0x16C4($16)
/* 04DC30 0014DB30 CC1603AE */  sw          $3, 0x16CC($16)
/* 04DC34 0014DB34 D01603AE */  sw          $3, 0x16D0($16)
/* 04DC38 0014DB38 17000010 */  b           .L0014DB98
/* 04DC3C 0014DB3C 00000000 */   nop
.L0014DB40:
/* 04DC40 0014DB40 C01600AE */  sw          $0, 0x16C0($16)
/* 04DC44 0014DB44 C41600AE */  sw          $0, 0x16C4($16)
/* 04DC48 0014DB48 01000324 */  addiu       $3, $0, 0x1
/* 04DC4C 0014DB4C CC1603AE */  sw          $3, 0x16CC($16)
/* 04DC50 0014DB50 B00003AE */  sw          $3, 0xB0($16)
/* 04DC54 0014DB54 10000010 */  b           .L0014DB98
/* 04DC58 0014DB58 00000000 */   nop
.L0014DB5C:
/* 04DC5C 0014DB5C 340000AE */  sw          $0, 0x34($16)
/* 04DC60 0014DB60 A40000AE */  sw          $0, 0xA4($16)
/* 04DC64 0014DB64 A80000AE */  sw          $0, 0xA8($16)
/* 04DC68 0014DB68 6680023C */  lui         $2, (0x8066CEE7 >> 16)
/* 04DC6C 0014DB6C E7CE4434 */  ori         $4, $2, (0x8066CEE7 & 0xFFFF)
/* 04DC70 0014DB70 8432050C */  jal         Color2Clut__FUi
/* 04DC74 0014DB74 00000000 */   nop
/* 04DC78 0014DB78 FF004330 */  andi        $3, $2, 0xFF
/* 04DC7C 0014DB7C A81603AE */  sw          $3, 0x16A8($16)
/* 04DC80 0014DB80 A816038E */  lw          $3, 0x16A8($16)
/* 04DC84 0014DB84 AC1603AE */  sw          $3, 0x16AC($16)
/* 04DC88 0014DB88 03000324 */  addiu       $3, $0, 0x3
/* 04DC8C 0014DB8C C01603AE */  sw          $3, 0x16C0($16)
/* 04DC90 0014DB90 C41600AE */  sw          $0, 0x16C4($16)
/* 04DC94 0014DB94 D01600AE */  sw          $0, 0x16D0($16)
.L0014DB98:
/* 04DC98 0014DB98 1000BF7B */  lq          $31, 0x10($29)
/* 04DC9C 0014DB9C 0000B07B */  lq          $16, 0x0($29)
/* 04DCA0 0014DBA0 2000BD27 */  addiu       $29, $29, 0x20
/* 04DCA4 0014DBA4 0800E003 */  jr          $31
/* 04DCA8 0014DBA8 00000000 */   nop
/* 04DCAC 0014DBAC 00000000 */  nop
