.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Preset__6ClsMesFi
/* 4DB60 0014DA60 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 4DB64 0014DA64 1000BF7F */  sq         $31, 0x10($sp)
/* 4DB68 0014DA68 0000B07F */  sq         $16, 0x0($sp)
/* 4DB6C 0014DA6C 28868070 */  paddub     $16, $4, $0
/* 4DB70 0014DA70 03000324 */  addiu      $3, $0, 0x3
/* 4DB74 0014DA74 4800A310 */  beq        $5, $3, .L0014DB98
/* 4DB78 0014DA78 00000000 */   nop
/* 4DB7C 0014DA7C 04000324 */  addiu      $3, $0, 0x4
/* 4DB80 0014DA80 3600A310 */  beq        $5, $3, .L0014DB5C
/* 4DB84 0014DA84 00000000 */   nop
/* 4DB88 0014DA88 02000324 */  addiu      $3, $0, 0x2
/* 4DB8C 0014DA8C 2C00A310 */  beq        $5, $3, .L0014DB40
/* 4DB90 0014DA90 00000000 */   nop
/* 4DB94 0014DA94 1900A010 */  beqz       $5, .L0014DAFC
/* 4DB98 0014DA98 00000000 */   nop
/* 4DB9C 0014DA9C 01000324 */  addiu      $3, $0, 0x1
/* 4DBA0 0014DAA0 0300A310 */  beq        $5, $3, .L0014DAB0
/* 4DBA4 0014DAA4 00000000 */   nop
/* 4DBA8 0014DAA8 3B000010 */  b          .L0014DB98
/* 4DBAC 0014DAAC 00000000 */   nop
.L0014DAB0:
/* 4DBB0 0014DAB0 340000AE */  sw         $0, 0x34($16)
/* 4DBB4 0014DAB4 A40000AE */  sw         $0, 0xA4($16)
/* 4DBB8 0014DAB8 A80000AE */  sw         $0, 0xA8($16)
/* 4DBBC 0014DABC BF80023C */  lui        $2, (0x80BFBFBF >> 16)
/* 4DBC0 0014DAC0 BFBF4434 */  ori        $4, $2, (0x80BFBFBF & 0xFFFF)
/* 4DBC4 0014DAC4 8432050C */  jal        Color2Clut__FUi
/* 4DBC8 0014DAC8 00000000 */   nop
/* 4DBCC 0014DACC FF004330 */  andi       $3, $2, 0xFF
/* 4DBD0 0014DAD0 A81603AE */  sw         $3, 0x16A8($16)
/* 4DBD4 0014DAD4 A816038E */  lw         $3, 0x16A8($16)
/* 4DBD8 0014DAD8 AC1603AE */  sw         $3, 0x16AC($16)
/* 4DBDC 0014DADC 02000324 */  addiu      $3, $0, 0x2
/* 4DBE0 0014DAE0 C01603AE */  sw         $3, 0x16C0($16)
/* 4DBE4 0014DAE4 C41600AE */  sw         $0, 0x16C4($16)
/* 4DBE8 0014DAE8 01000324 */  addiu      $3, $0, 0x1
/* 4DBEC 0014DAEC CC1603AE */  sw         $3, 0x16CC($16)
/* 4DBF0 0014DAF0 D01600AE */  sw         $0, 0x16D0($16)
/* 4DBF4 0014DAF4 28000010 */  b          .L0014DB98
/* 4DBF8 0014DAF8 00000000 */   nop
.L0014DAFC:
/* 4DBFC 0014DAFC 01000224 */  addiu      $2, $0, 0x1
/* 4DC00 0014DB00 340002AE */  sw         $2, 0x34($16)
/* 4DC04 0014DB04 3080023C */  lui        $2, (0x80304045 >> 16)
/* 4DC08 0014DB08 45404434 */  ori        $4, $2, (0x80304045 & 0xFFFF)
/* 4DC0C 0014DB0C 8432050C */  jal        Color2Clut__FUi
/* 4DC10 0014DB10 00000000 */   nop
/* 4DC14 0014DB14 FF004330 */  andi       $3, $2, 0xFF
/* 4DC18 0014DB18 A81603AE */  sw         $3, 0x16A8($16)
/* 4DC1C 0014DB1C A816038E */  lw         $3, 0x16A8($16)
/* 4DC20 0014DB20 AC1603AE */  sw         $3, 0x16AC($16)
/* 4DC24 0014DB24 01000324 */  addiu      $3, $0, 0x1
/* 4DC28 0014DB28 C01603AE */  sw         $3, 0x16C0($16)
/* 4DC2C 0014DB2C C41603AE */  sw         $3, 0x16C4($16)
/* 4DC30 0014DB30 CC1603AE */  sw         $3, 0x16CC($16)
/* 4DC34 0014DB34 D01603AE */  sw         $3, 0x16D0($16)
/* 4DC38 0014DB38 17000010 */  b          .L0014DB98
/* 4DC3C 0014DB3C 00000000 */   nop
.L0014DB40:
/* 4DC40 0014DB40 C01600AE */  sw         $0, 0x16C0($16)
/* 4DC44 0014DB44 C41600AE */  sw         $0, 0x16C4($16)
/* 4DC48 0014DB48 01000324 */  addiu      $3, $0, 0x1
/* 4DC4C 0014DB4C CC1603AE */  sw         $3, 0x16CC($16)
/* 4DC50 0014DB50 B00003AE */  sw         $3, 0xB0($16)
/* 4DC54 0014DB54 10000010 */  b          .L0014DB98
/* 4DC58 0014DB58 00000000 */   nop
.L0014DB5C:
/* 4DC5C 0014DB5C 340000AE */  sw         $0, 0x34($16)
/* 4DC60 0014DB60 A40000AE */  sw         $0, 0xA4($16)
/* 4DC64 0014DB64 A80000AE */  sw         $0, 0xA8($16)
/* 4DC68 0014DB68 6680023C */  lui        $2, (0x8066CEE7 >> 16)
/* 4DC6C 0014DB6C E7CE4434 */  ori        $4, $2, (0x8066CEE7 & 0xFFFF)
/* 4DC70 0014DB70 8432050C */  jal        Color2Clut__FUi
/* 4DC74 0014DB74 00000000 */   nop
/* 4DC78 0014DB78 FF004330 */  andi       $3, $2, 0xFF
/* 4DC7C 0014DB7C A81603AE */  sw         $3, 0x16A8($16)
/* 4DC80 0014DB80 A816038E */  lw         $3, 0x16A8($16)
/* 4DC84 0014DB84 AC1603AE */  sw         $3, 0x16AC($16)
/* 4DC88 0014DB88 03000324 */  addiu      $3, $0, 0x3
/* 4DC8C 0014DB8C C01603AE */  sw         $3, 0x16C0($16)
/* 4DC90 0014DB90 C41600AE */  sw         $0, 0x16C4($16)
/* 4DC94 0014DB94 D01600AE */  sw         $0, 0x16D0($16)
.L0014DB98:
/* 4DC98 0014DB98 1000BF7B */  lq         $31, 0x10($sp)
/* 4DC9C 0014DB9C 0000B07B */  lq         $16, 0x0($sp)
/* 4DCA0 0014DBA0 2000BD27 */  addiu      $sp, $sp, 0x20
/* 4DCA4 0014DBA4 0800E003 */  jr         $31
/* 4DCA8 0014DBA8 00000000 */   nop
/* 4DCAC 0014DBAC 00000000 */  nop
