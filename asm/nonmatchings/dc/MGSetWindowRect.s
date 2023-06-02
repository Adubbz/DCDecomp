.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MGSetWindowRect__Fv
/* 2DAA0 0012D9A0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 2DAA4 0012D9A4 1000BF7F */  sq         $31, 0x10($sp)
/* 2DAA8 0012D9A8 0000B07F */  sq         $16, 0x0($sp)
/* 2DAAC 0012D9AC C701013C */  lui        $at, (0x1C75510 >> 16)
/* 2DAB0 0012D9B0 105520AC */  sw         $0, (0x1C75510 & 0xFFFF)($at)
/* 2DAB4 0012D9B4 C701013C */  lui        $at, (0x1C75514 >> 16)
/* 2DAB8 0012D9B8 145520AC */  sw         $0, (0x1C75514 & 0xFFFF)($at)
/* 2DABC 0012D9BC 80020224 */  addiu      $2, $0, 0x280
/* 2DAC0 0012D9C0 C701013C */  lui        $at, (0x1C75518 >> 16)
/* 2DAC4 0012D9C4 185522AC */  sw         $2, (0x1C75518 & 0xFFFF)($at)
/* 2DAC8 0012D9C8 E0000224 */  addiu      $2, $0, 0xE0
/* 2DACC 0012D9CC C701013C */  lui        $at, (0x1C7551C >> 16)
/* 2DAD0 0012D9D0 1C5522AC */  sw         $2, (0x1C7551C & 0xFFFF)($at)
/* 2DAD4 0012D9D4 C701013C */  lui        $at, (0x1C75510 >> 16)
/* 2DAD8 0012D9D8 1055248C */  lw         $4, (0x1C75510 & 0xFFFF)($at)
/* 2DADC 0012D9DC 43180400 */  sra        $3, $4, 1
/* 2DAE0 0012D9E0 2800A297 */  lhu        $2, 0x28($sp)
/* 2DAE4 0012D9E4 FF076330 */  andi       $3, $3, 0x7FF
/* 2DAE8 0012D9E8 00F80524 */  addiu      $5, $0, -0x800
/* 2DAEC 0012D9EC 24104500 */  and        $2, $2, $5
/* 2DAF0 0012D9F0 25104300 */  or         $2, $2, $3
/* 2DAF4 0012D9F4 2800A2A7 */  sh         $2, 0x28($sp)
/* 2DAF8 0012D9F8 C701013C */  lui        $at, (0x1C75518 >> 16)
/* 2DAFC 0012D9FC 1855228C */  lw         $2, (0x1C75518 & 0xFFFF)($at)
/* 2DB00 0012DA00 21188200 */  addu       $3, $4, $2
/* 2DB04 0012DA04 2A00A297 */  lhu        $2, 0x2A($sp)
/* 2DB08 0012DA08 FF076330 */  andi       $3, $3, 0x7FF
/* 2DB0C 0012DA0C 24104500 */  and        $2, $2, $5
/* 2DB10 0012DA10 25104300 */  or         $2, $2, $3
/* 2DB14 0012DA14 2A00A2A7 */  sh         $2, 0x2A($sp)
/* 2DB18 0012DA18 C701013C */  lui        $at, (0x1C75514 >> 16)
/* 2DB1C 0012DA1C 1455248C */  lw         $4, (0x1C75514 & 0xFFFF)($at)
/* 2DB20 0012DA20 2C00A297 */  lhu        $2, 0x2C($sp)
/* 2DB24 0012DA24 FF078330 */  andi       $3, $4, 0x7FF
/* 2DB28 0012DA28 24104500 */  and        $2, $2, $5
/* 2DB2C 0012DA2C 25104300 */  or         $2, $2, $3
/* 2DB30 0012DA30 2C00A2A7 */  sh         $2, 0x2C($sp)
/* 2DB34 0012DA34 C701013C */  lui        $at, (0x1C7551C >> 16)
/* 2DB38 0012DA38 1C55228C */  lw         $2, (0x1C7551C & 0xFFFF)($at)
/* 2DB3C 0012DA3C 21188200 */  addu       $3, $4, $2
/* 2DB40 0012DA40 2E00A297 */  lhu        $2, 0x2E($sp)
/* 2DB44 0012DA44 FF076330 */  andi       $3, $3, 0x7FF
/* 2DB48 0012DA48 24104500 */  and        $2, $2, $5
/* 2DB4C 0012DA4C 25104300 */  or         $2, $2, $3
/* 2DB50 0012DA50 2E00A2A7 */  sh         $2, 0x2E($sp)
/* 2DB54 0012DA54 A0B8040C */  jal        GetVif1Packet__Fv
/* 2DB58 0012DA58 00000000 */   nop
/* 2DB5C 0012DA5C 28864070 */  paddub     $16, $2, $0
/* 2DB60 0012DA60 28260072 */  paddub     $4, $16, $0
/* 2DB64 0012DA64 282E0070 */  paddub     $5, $0, $0
/* 2DB68 0012DA68 2083040C */  jal        sceVif1PkCnt
/* 2DB6C 0012DA6C 00000000 */   nop
/* 2DB70 0012DA70 28260072 */  paddub     $4, $16, $0
/* 2DB74 0012DA74 282E0070 */  paddub     $5, $0, $0
/* 2DB78 0012DA78 8E83040C */  jal        sceVif1PkOpenDirectCode
/* 2DB7C 0012DA7C 00000000 */   nop
/* 2DB80 0012DA80 C701023C */  lui        $2, %hi(GiftagAD)
/* 2DB84 0012DA84 C0524224 */  addiu      $2, $2, %lo(GiftagAD)
/* 2DB88 0012DA88 28260072 */  paddub     $4, $16, $0
/* 2DB8C 0012DA8C 00004578 */  lq         $5, 0x0($2)
/* 2DB90 0012DA90 B083040C */  jal        sceVif1PkOpenGifTag
/* 2DB94 0012DA94 00000000 */   nop
/* 2DB98 0012DA98 2800A227 */  addiu      $2, $sp, 0x28
/* 2DB9C 0012DA9C 28260072 */  paddub     $4, $16, $0
/* 2DBA0 0012DAA0 40000524 */  addiu      $5, $0, 0x40
/* 2DBA4 0012DAA4 000046DC */  ld         $6, 0x0($2)
/* 2DBA8 0012DAA8 0A84040C */  jal        sceVif1PkAddGsAD
/* 2DBAC 0012DAAC 00000000 */   nop
/* 2DBB0 0012DAB0 28260072 */  paddub     $4, $16, $0
/* 2DBB4 0012DAB4 B683040C */  jal        sceVif1PkCloseGifTag
/* 2DBB8 0012DAB8 00000000 */   nop
/* 2DBBC 0012DABC 28260072 */  paddub     $4, $16, $0
/* 2DBC0 0012DAC0 A483040C */  jal        sceVif1PkCloseDirectCode
/* 2DBC4 0012DAC4 00000000 */   nop
/* 2DBC8 0012DAC8 1000BF7B */  lq         $31, 0x10($sp)
/* 2DBCC 0012DACC 0000B07B */  lq         $16, 0x0($sp)
/* 2DBD0 0012DAD0 3000BD27 */  addiu      $sp, $sp, 0x30
/* 2DBD4 0012DAD4 0800E003 */  jr         $31
/* 2DBD8 0012DAD8 00000000 */   nop
/* 2DBDC 0012DADC 00000000 */  nop
