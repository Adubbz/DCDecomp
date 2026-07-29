.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MGSetWindowRect__F8CRect_i_
/* 02DBE0 0012DAE0 B0FFBD27 */  addiu       $29, $29, -0x50
/* 02DBE4 0012DAE4 1000BF7F */  sq          $31, 0x10($29)
/* 02DBE8 0012DAE8 0000B07F */  sq          $16, 0x0($29)
/* 02DBEC 0012DAEC 3000A527 */  addiu       $5, $29, 0x30
/* 02DBF0 0012DAF0 00008278 */  lq          $2, 0x0($4)
/* 02DBF4 0012DAF4 0000A27C */  sq          $2, 0x0($5)
/* 02DBF8 0012DAF8 2000A327 */  addiu       $3, $29, 0x20
/* 02DBFC 0012DAFC 0000A278 */  lq          $2, 0x0($5)
/* 02DC00 0012DB00 0000627C */  sq          $2, 0x0($3)
/* 02DC04 0012DB04 C701023C */  lui         $2, %hi(mgWindowRect)
/* 02DC08 0012DB08 10554324 */  addiu       $3, $2, %lo(mgWindowRect)
/* 02DC0C 0012DB0C 0000A278 */  lq          $2, 0x0($5)
/* 02DC10 0012DB10 0000627C */  sq          $2, 0x0($3)
/* 02DC14 0012DB14 C701013C */  lui         $1, %hi(mgWindowRect)
/* 02DC18 0012DB18 1055248C */  lw          $4, %lo(mgWindowRect)($1)
/* 02DC1C 0012DB1C 43180400 */  sra         $3, $4, 1
/* 02DC20 0012DB20 4800A297 */  lhu         $2, 0x48($29)
/* 02DC24 0012DB24 FF076330 */  andi        $3, $3, 0x7FF
/* 02DC28 0012DB28 00F80524 */  addiu       $5, $0, -0x800
/* 02DC2C 0012DB2C 24104500 */  and         $2, $2, $5
/* 02DC30 0012DB30 25104300 */  or          $2, $2, $3
/* 02DC34 0012DB34 4800A2A7 */  sh          $2, 0x48($29)
/* 02DC38 0012DB38 C701013C */  lui         $1, %hi(mgWindowRect + 0x8)
/* 02DC3C 0012DB3C 1855228C */  lw          $2, %lo(mgWindowRect + 0x8)($1)
/* 02DC40 0012DB40 21188200 */  addu        $3, $4, $2
/* 02DC44 0012DB44 4A00A297 */  lhu         $2, 0x4A($29)
/* 02DC48 0012DB48 FF076330 */  andi        $3, $3, 0x7FF
/* 02DC4C 0012DB4C 24104500 */  and         $2, $2, $5
/* 02DC50 0012DB50 25104300 */  or          $2, $2, $3
/* 02DC54 0012DB54 4A00A2A7 */  sh          $2, 0x4A($29)
/* 02DC58 0012DB58 C701013C */  lui         $1, %hi(mgWindowRect + 0x4)
/* 02DC5C 0012DB5C 1455248C */  lw          $4, %lo(mgWindowRect + 0x4)($1)
/* 02DC60 0012DB60 4C00A297 */  lhu         $2, 0x4C($29)
/* 02DC64 0012DB64 FF078330 */  andi        $3, $4, 0x7FF
/* 02DC68 0012DB68 24104500 */  and         $2, $2, $5
/* 02DC6C 0012DB6C 25104300 */  or          $2, $2, $3
/* 02DC70 0012DB70 4C00A2A7 */  sh          $2, 0x4C($29)
/* 02DC74 0012DB74 C701013C */  lui         $1, %hi(mgWindowRect + 0xC)
/* 02DC78 0012DB78 1C55228C */  lw          $2, %lo(mgWindowRect + 0xC)($1)
/* 02DC7C 0012DB7C 21188200 */  addu        $3, $4, $2
/* 02DC80 0012DB80 4E00A297 */  lhu         $2, 0x4E($29)
/* 02DC84 0012DB84 FF076330 */  andi        $3, $3, 0x7FF
/* 02DC88 0012DB88 24104500 */  and         $2, $2, $5
/* 02DC8C 0012DB8C 25104300 */  or          $2, $2, $3
/* 02DC90 0012DB90 4E00A2A7 */  sh          $2, 0x4E($29)
/* 02DC94 0012DB94 A0B8040C */  jal         GetVif1Packet__Fv
/* 02DC98 0012DB98 00000000 */   nop
/* 02DC9C 0012DB9C 28864070 */  paddub      $16, $2, $0
/* 02DCA0 0012DBA0 28260072 */  paddub      $4, $16, $0
/* 02DCA4 0012DBA4 282E0070 */  paddub      $5, $0, $0
/* 02DCA8 0012DBA8 2083040C */  jal         sceVif1PkCnt
/* 02DCAC 0012DBAC 00000000 */   nop
/* 02DCB0 0012DBB0 28260072 */  paddub      $4, $16, $0
/* 02DCB4 0012DBB4 282E0070 */  paddub      $5, $0, $0
/* 02DCB8 0012DBB8 8E83040C */  jal         sceVif1PkOpenDirectCode
/* 02DCBC 0012DBBC 00000000 */   nop
/* 02DCC0 0012DBC0 C701023C */  lui         $2, %hi(GiftagAD)
/* 02DCC4 0012DBC4 C0524224 */  addiu       $2, $2, %lo(GiftagAD)
/* 02DCC8 0012DBC8 28260072 */  paddub      $4, $16, $0
/* 02DCCC 0012DBCC 00004578 */  lq          $5, 0x0($2)
/* 02DCD0 0012DBD0 B083040C */  jal         sceVif1PkOpenGifTag
/* 02DCD4 0012DBD4 00000000 */   nop
/* 02DCD8 0012DBD8 4800A227 */  addiu       $2, $29, 0x48
/* 02DCDC 0012DBDC 28260072 */  paddub      $4, $16, $0
/* 02DCE0 0012DBE0 40000524 */  addiu       $5, $0, 0x40
/* 02DCE4 0012DBE4 000046DC */  ld          $6, 0x0($2)
/* 02DCE8 0012DBE8 0A84040C */  jal         sceVif1PkAddGsAD
/* 02DCEC 0012DBEC 00000000 */   nop
/* 02DCF0 0012DBF0 28260072 */  paddub      $4, $16, $0
/* 02DCF4 0012DBF4 B683040C */  jal         sceVif1PkCloseGifTag
/* 02DCF8 0012DBF8 00000000 */   nop
/* 02DCFC 0012DBFC 28260072 */  paddub      $4, $16, $0
/* 02DD00 0012DC00 A483040C */  jal         sceVif1PkCloseDirectCode
/* 02DD04 0012DC04 00000000 */   nop
/* 02DD08 0012DC08 1000BF7B */  lq          $31, 0x10($29)
/* 02DD0C 0012DC0C 0000B07B */  lq          $16, 0x0($29)
/* 02DD10 0012DC10 5000BD27 */  addiu       $29, $29, 0x50
/* 02DD14 0012DC14 0800E003 */  jr          $31
/* 02DD18 0012DC18 00000000 */   nop
/* 02DD1C 0012DC1C 00000000 */  nop
