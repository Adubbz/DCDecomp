.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MGSetWindowRect__Fv
/* 02DAA0 0012D9A0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 02DAA4 0012D9A4 1000BF7F */  sq          $31, 0x10($29)
/* 02DAA8 0012D9A8 0000B07F */  sq          $16, 0x0($29)
/* 02DAAC 0012D9AC C701013C */  lui         $1, %hi(mgWindowRect)
/* 02DAB0 0012D9B0 105520AC */  sw          $0, %lo(mgWindowRect)($1)
/* 02DAB4 0012D9B4 C701013C */  lui         $1, %hi(mgWindowRect + 0x4)
/* 02DAB8 0012D9B8 145520AC */  sw          $0, %lo(mgWindowRect + 0x4)($1)
/* 02DABC 0012D9BC 80020224 */  addiu       $2, $0, 0x280
/* 02DAC0 0012D9C0 C701013C */  lui         $1, %hi(mgWindowRect + 0x8)
/* 02DAC4 0012D9C4 185522AC */  sw          $2, %lo(mgWindowRect + 0x8)($1)
/* 02DAC8 0012D9C8 E0000224 */  addiu       $2, $0, 0xE0
/* 02DACC 0012D9CC C701013C */  lui         $1, %hi(mgWindowRect + 0xC)
/* 02DAD0 0012D9D0 1C5522AC */  sw          $2, %lo(mgWindowRect + 0xC)($1)
/* 02DAD4 0012D9D4 C701013C */  lui         $1, %hi(mgWindowRect)
/* 02DAD8 0012D9D8 1055248C */  lw          $4, %lo(mgWindowRect)($1)
/* 02DADC 0012D9DC 43180400 */  sra         $3, $4, 1
/* 02DAE0 0012D9E0 2800A297 */  lhu         $2, 0x28($29)
/* 02DAE4 0012D9E4 FF076330 */  andi        $3, $3, 0x7FF
/* 02DAE8 0012D9E8 00F80524 */  addiu       $5, $0, -0x800
/* 02DAEC 0012D9EC 24104500 */  and         $2, $2, $5
/* 02DAF0 0012D9F0 25104300 */  or          $2, $2, $3
/* 02DAF4 0012D9F4 2800A2A7 */  sh          $2, 0x28($29)
/* 02DAF8 0012D9F8 C701013C */  lui         $1, %hi(mgWindowRect + 0x8)
/* 02DAFC 0012D9FC 1855228C */  lw          $2, %lo(mgWindowRect + 0x8)($1)
/* 02DB00 0012DA00 21188200 */  addu        $3, $4, $2
/* 02DB04 0012DA04 2A00A297 */  lhu         $2, 0x2A($29)
/* 02DB08 0012DA08 FF076330 */  andi        $3, $3, 0x7FF
/* 02DB0C 0012DA0C 24104500 */  and         $2, $2, $5
/* 02DB10 0012DA10 25104300 */  or          $2, $2, $3
/* 02DB14 0012DA14 2A00A2A7 */  sh          $2, 0x2A($29)
/* 02DB18 0012DA18 C701013C */  lui         $1, %hi(mgWindowRect + 0x4)
/* 02DB1C 0012DA1C 1455248C */  lw          $4, %lo(mgWindowRect + 0x4)($1)
/* 02DB20 0012DA20 2C00A297 */  lhu         $2, 0x2C($29)
/* 02DB24 0012DA24 FF078330 */  andi        $3, $4, 0x7FF
/* 02DB28 0012DA28 24104500 */  and         $2, $2, $5
/* 02DB2C 0012DA2C 25104300 */  or          $2, $2, $3
/* 02DB30 0012DA30 2C00A2A7 */  sh          $2, 0x2C($29)
/* 02DB34 0012DA34 C701013C */  lui         $1, %hi(mgWindowRect + 0xC)
/* 02DB38 0012DA38 1C55228C */  lw          $2, %lo(mgWindowRect + 0xC)($1)
/* 02DB3C 0012DA3C 21188200 */  addu        $3, $4, $2
/* 02DB40 0012DA40 2E00A297 */  lhu         $2, 0x2E($29)
/* 02DB44 0012DA44 FF076330 */  andi        $3, $3, 0x7FF
/* 02DB48 0012DA48 24104500 */  and         $2, $2, $5
/* 02DB4C 0012DA4C 25104300 */  or          $2, $2, $3
/* 02DB50 0012DA50 2E00A2A7 */  sh          $2, 0x2E($29)
/* 02DB54 0012DA54 A0B8040C */  jal         GetVif1Packet__Fv
/* 02DB58 0012DA58 00000000 */   nop
/* 02DB5C 0012DA5C 28864070 */  paddub      $16, $2, $0
/* 02DB60 0012DA60 28260072 */  paddub      $4, $16, $0
/* 02DB64 0012DA64 282E0070 */  paddub      $5, $0, $0
/* 02DB68 0012DA68 2083040C */  jal         sceVif1PkCnt
/* 02DB6C 0012DA6C 00000000 */   nop
/* 02DB70 0012DA70 28260072 */  paddub      $4, $16, $0
/* 02DB74 0012DA74 282E0070 */  paddub      $5, $0, $0
/* 02DB78 0012DA78 8E83040C */  jal         sceVif1PkOpenDirectCode
/* 02DB7C 0012DA7C 00000000 */   nop
/* 02DB80 0012DA80 C701023C */  lui         $2, %hi(GiftagAD)
/* 02DB84 0012DA84 C0524224 */  addiu       $2, $2, %lo(GiftagAD)
/* 02DB88 0012DA88 28260072 */  paddub      $4, $16, $0
/* 02DB8C 0012DA8C 00004578 */  lq          $5, 0x0($2)
/* 02DB90 0012DA90 B083040C */  jal         sceVif1PkOpenGifTag
/* 02DB94 0012DA94 00000000 */   nop
/* 02DB98 0012DA98 2800A227 */  addiu       $2, $29, 0x28
/* 02DB9C 0012DA9C 28260072 */  paddub      $4, $16, $0
/* 02DBA0 0012DAA0 40000524 */  addiu       $5, $0, 0x40
/* 02DBA4 0012DAA4 000046DC */  ld          $6, 0x0($2)
/* 02DBA8 0012DAA8 0A84040C */  jal         sceVif1PkAddGsAD
/* 02DBAC 0012DAAC 00000000 */   nop
/* 02DBB0 0012DAB0 28260072 */  paddub      $4, $16, $0
/* 02DBB4 0012DAB4 B683040C */  jal         sceVif1PkCloseGifTag
/* 02DBB8 0012DAB8 00000000 */   nop
/* 02DBBC 0012DABC 28260072 */  paddub      $4, $16, $0
/* 02DBC0 0012DAC0 A483040C */  jal         sceVif1PkCloseDirectCode
/* 02DBC4 0012DAC4 00000000 */   nop
/* 02DBC8 0012DAC8 1000BF7B */  lq          $31, 0x10($29)
/* 02DBCC 0012DACC 0000B07B */  lq          $16, 0x0($29)
/* 02DBD0 0012DAD0 3000BD27 */  addiu       $29, $29, 0x30
/* 02DBD4 0012DAD4 0800E003 */  jr          $31
/* 02DBD8 0012DAD8 00000000 */   nop
/* 02DBDC 0012DADC 00000000 */  nop
