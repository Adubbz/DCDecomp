.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MGSetWindowRect__F8CRect_i_
/* 2DBE0 0012DAE0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 2DBE4 0012DAE4 1000BF7F */  sq         $31, 0x10($sp)
/* 2DBE8 0012DAE8 0000B07F */  sq         $16, 0x0($sp)
/* 2DBEC 0012DAEC 3000A527 */  addiu      $5, $sp, 0x30
/* 2DBF0 0012DAF0 00008278 */  lq         $2, 0x0($4)
/* 2DBF4 0012DAF4 0000A27C */  sq         $2, 0x0($5)
/* 2DBF8 0012DAF8 2000A327 */  addiu      $3, $sp, 0x20
/* 2DBFC 0012DAFC 0000A278 */  lq         $2, 0x0($5)
/* 2DC00 0012DB00 0000627C */  sq         $2, 0x0($3)
/* 2DC04 0012DB04 C701023C */  lui        $2, %hi(mgWindowRect)
/* 2DC08 0012DB08 10554324 */  addiu      $3, $2, %lo(mgWindowRect)
/* 2DC0C 0012DB0C 0000A278 */  lq         $2, 0x0($5)
/* 2DC10 0012DB10 0000627C */  sq         $2, 0x0($3)
/* 2DC14 0012DB14 C701013C */  lui        $at, (0x1C75510 >> 16)
/* 2DC18 0012DB18 1055248C */  lw         $4, (0x1C75510 & 0xFFFF)($at)
/* 2DC1C 0012DB1C 43180400 */  sra        $3, $4, 1
/* 2DC20 0012DB20 4800A297 */  lhu        $2, 0x48($sp)
/* 2DC24 0012DB24 FF076330 */  andi       $3, $3, 0x7FF
/* 2DC28 0012DB28 00F80524 */  addiu      $5, $0, -0x800
/* 2DC2C 0012DB2C 24104500 */  and        $2, $2, $5
/* 2DC30 0012DB30 25104300 */  or         $2, $2, $3
/* 2DC34 0012DB34 4800A2A7 */  sh         $2, 0x48($sp)
/* 2DC38 0012DB38 C701013C */  lui        $at, (0x1C75518 >> 16)
/* 2DC3C 0012DB3C 1855228C */  lw         $2, (0x1C75518 & 0xFFFF)($at)
/* 2DC40 0012DB40 21188200 */  addu       $3, $4, $2
/* 2DC44 0012DB44 4A00A297 */  lhu        $2, 0x4A($sp)
/* 2DC48 0012DB48 FF076330 */  andi       $3, $3, 0x7FF
/* 2DC4C 0012DB4C 24104500 */  and        $2, $2, $5
/* 2DC50 0012DB50 25104300 */  or         $2, $2, $3
/* 2DC54 0012DB54 4A00A2A7 */  sh         $2, 0x4A($sp)
/* 2DC58 0012DB58 C701013C */  lui        $at, (0x1C75514 >> 16)
/* 2DC5C 0012DB5C 1455248C */  lw         $4, (0x1C75514 & 0xFFFF)($at)
/* 2DC60 0012DB60 4C00A297 */  lhu        $2, 0x4C($sp)
/* 2DC64 0012DB64 FF078330 */  andi       $3, $4, 0x7FF
/* 2DC68 0012DB68 24104500 */  and        $2, $2, $5
/* 2DC6C 0012DB6C 25104300 */  or         $2, $2, $3
/* 2DC70 0012DB70 4C00A2A7 */  sh         $2, 0x4C($sp)
/* 2DC74 0012DB74 C701013C */  lui        $at, (0x1C7551C >> 16)
/* 2DC78 0012DB78 1C55228C */  lw         $2, (0x1C7551C & 0xFFFF)($at)
/* 2DC7C 0012DB7C 21188200 */  addu       $3, $4, $2
/* 2DC80 0012DB80 4E00A297 */  lhu        $2, 0x4E($sp)
/* 2DC84 0012DB84 FF076330 */  andi       $3, $3, 0x7FF
/* 2DC88 0012DB88 24104500 */  and        $2, $2, $5
/* 2DC8C 0012DB8C 25104300 */  or         $2, $2, $3
/* 2DC90 0012DB90 4E00A2A7 */  sh         $2, 0x4E($sp)
/* 2DC94 0012DB94 A0B8040C */  jal        GetVif1Packet__Fv
/* 2DC98 0012DB98 00000000 */   nop
/* 2DC9C 0012DB9C 28864070 */  paddub     $16, $2, $0
/* 2DCA0 0012DBA0 28260072 */  paddub     $4, $16, $0
/* 2DCA4 0012DBA4 282E0070 */  paddub     $5, $0, $0
/* 2DCA8 0012DBA8 2083040C */  jal        sceVif1PkCnt
/* 2DCAC 0012DBAC 00000000 */   nop
/* 2DCB0 0012DBB0 28260072 */  paddub     $4, $16, $0
/* 2DCB4 0012DBB4 282E0070 */  paddub     $5, $0, $0
/* 2DCB8 0012DBB8 8E83040C */  jal        sceVif1PkOpenDirectCode
/* 2DCBC 0012DBBC 00000000 */   nop
/* 2DCC0 0012DBC0 C701023C */  lui        $2, %hi(GiftagAD)
/* 2DCC4 0012DBC4 C0524224 */  addiu      $2, $2, %lo(GiftagAD)
/* 2DCC8 0012DBC8 28260072 */  paddub     $4, $16, $0
/* 2DCCC 0012DBCC 00004578 */  lq         $5, 0x0($2)
/* 2DCD0 0012DBD0 B083040C */  jal        sceVif1PkOpenGifTag
/* 2DCD4 0012DBD4 00000000 */   nop
/* 2DCD8 0012DBD8 4800A227 */  addiu      $2, $sp, 0x48
/* 2DCDC 0012DBDC 28260072 */  paddub     $4, $16, $0
/* 2DCE0 0012DBE0 40000524 */  addiu      $5, $0, 0x40
/* 2DCE4 0012DBE4 000046DC */  ld         $6, 0x0($2)
/* 2DCE8 0012DBE8 0A84040C */  jal        sceVif1PkAddGsAD
/* 2DCEC 0012DBEC 00000000 */   nop
/* 2DCF0 0012DBF0 28260072 */  paddub     $4, $16, $0
/* 2DCF4 0012DBF4 B683040C */  jal        sceVif1PkCloseGifTag
/* 2DCF8 0012DBF8 00000000 */   nop
/* 2DCFC 0012DBFC 28260072 */  paddub     $4, $16, $0
/* 2DD00 0012DC00 A483040C */  jal        sceVif1PkCloseDirectCode
/* 2DD04 0012DC04 00000000 */   nop
/* 2DD08 0012DC08 1000BF7B */  lq         $31, 0x10($sp)
/* 2DD0C 0012DC0C 0000B07B */  lq         $16, 0x0($sp)
/* 2DD10 0012DC10 5000BD27 */  addiu      $sp, $sp, 0x50
/* 2DD14 0012DC14 0800E003 */  jr         $31
/* 2DD18 0012DC18 00000000 */   nop
/* 2DD1C 0012DC1C 00000000 */  nop
