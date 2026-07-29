.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel UpDateDirPos__6CBoundFv
/* 03DAF0 0013D9F0 50FFBD27 */  addiu       $29, $29, -0xB0
/* 03DAF4 0013D9F4 1000BF7F */  sq          $31, 0x10($29)
/* 03DAF8 0013D9F8 0000B07F */  sq          $16, 0x0($29)
/* 03DAFC 0013D9FC 28868070 */  paddub      $16, $4, $0
/* 03DB00 0013DA00 E400828C */  lw          $2, 0xE4($4)
/* 03DB04 0013DA04 0E004010 */  beqz        $2, .L0013DA40
/* 03DB08 0013DA08 00000000 */   nop
/* 03DB0C 0013DA0C 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 03DB10 0013DA10 FC0002AE */  sw          $2, 0xFC($16)
/* 03DB14 0013DA14 E400048E */  lw          $4, 0xE4($16)
/* 03DB18 0013DA18 2000A527 */  addiu       $5, $29, 0x20
/* 03DB1C 0013DA1C 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 03DB20 0013DA20 00000000 */   nop
/* 03DB24 0013DA24 6000A427 */  addiu       $4, $29, 0x60
/* 03DB28 0013DA28 2000A527 */  addiu       $5, $29, 0x20
/* 03DB2C 0013DA2C F0000626 */  addiu       $6, $16, 0xF0
/* 03DB30 0013DA30 6285040C */  jal         sceVu0ApplyMatrix
/* 03DB34 0013DA34 00000000 */   nop
/* 03DB38 0013DA38 05000010 */  b           .L0013DA50
/* 03DB3C 0013DA3C 00000000 */   nop
.L0013DA40:
/* 03DB40 0013DA40 6000A427 */  addiu       $4, $29, 0x60
/* 03DB44 0013DA44 F0000526 */  addiu       $5, $16, 0xF0
/* 03DB48 0013DA48 0C86040C */  jal         sceVu0CopyVector
/* 03DB4C 0013DA4C 00000000 */   nop
.L0013DA50:
/* 03DB50 0013DA50 E800028E */  lw          $2, 0xE8($16)
/* 03DB54 0013DA54 0E004010 */  beqz        $2, .L0013DA90
/* 03DB58 0013DA58 00000000 */   nop
/* 03DB5C 0013DA5C 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 03DB60 0013DA60 0C0102AE */  sw          $2, 0x10C($16)
/* 03DB64 0013DA64 E800048E */  lw          $4, 0xE8($16)
/* 03DB68 0013DA68 2000A527 */  addiu       $5, $29, 0x20
/* 03DB6C 0013DA6C 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 03DB70 0013DA70 00000000 */   nop
/* 03DB74 0013DA74 7000A427 */  addiu       $4, $29, 0x70
/* 03DB78 0013DA78 2000A527 */  addiu       $5, $29, 0x20
/* 03DB7C 0013DA7C 00010626 */  addiu       $6, $16, 0x100
/* 03DB80 0013DA80 6285040C */  jal         sceVu0ApplyMatrix
/* 03DB84 0013DA84 00000000 */   nop
/* 03DB88 0013DA88 05000010 */  b           .L0013DAA0
/* 03DB8C 0013DA8C 00000000 */   nop
.L0013DA90:
/* 03DB90 0013DA90 7000A427 */  addiu       $4, $29, 0x70
/* 03DB94 0013DA94 00010526 */  addiu       $5, $16, 0x100
/* 03DB98 0013DA98 0C86040C */  jal         sceVu0CopyVector
/* 03DB9C 0013DA9C 00000000 */   nop
.L0013DAA0:
/* 03DBA0 0013DAA0 6000A1C7 */  lwc1        $f1, 0x60($29)
/* 03DBA4 0013DAA4 7000A0C7 */  lwc1        $f0, 0x70($29)
/* 03DBA8 0013DAA8 00080046 */  add.s       $f0, $f1, $f0
/* 03DBAC 0013DAAC 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 03DBB0 0013DAB0 00108244 */  mtc1        $2, $f2
/* 03DBB4 0013DAB4 00000000 */  nop
/* 03DBB8 0013DAB8 02100046 */  mul.s       $f0, $f2, $f0
/* 03DBBC 0013DABC C00000E6 */  swc1        $f0, 0xC0($16)
/* 03DBC0 0013DAC0 6400A1C7 */  lwc1        $f1, 0x64($29)
/* 03DBC4 0013DAC4 7400A0C7 */  lwc1        $f0, 0x74($29)
/* 03DBC8 0013DAC8 00080046 */  add.s       $f0, $f1, $f0
/* 03DBCC 0013DACC 02100046 */  mul.s       $f0, $f2, $f0
/* 03DBD0 0013DAD0 C40000E6 */  swc1        $f0, 0xC4($16)
/* 03DBD4 0013DAD4 6800A1C7 */  lwc1        $f1, 0x68($29)
/* 03DBD8 0013DAD8 7800A0C7 */  lwc1        $f0, 0x78($29)
/* 03DBDC 0013DADC 00080046 */  add.s       $f0, $f1, $f0
/* 03DBE0 0013DAE0 02100046 */  mul.s       $f0, $f2, $f0
/* 03DBE4 0013DAE4 C80000E6 */  swc1        $f0, 0xC8($16)
/* 03DBE8 0013DAE8 8000A427 */  addiu       $4, $29, 0x80
/* 03DBEC 0013DAEC 7000A527 */  addiu       $5, $29, 0x70
/* 03DBF0 0013DAF0 6000A627 */  addiu       $6, $29, 0x60
/* 03DBF4 0013DAF4 EE85040C */  jal         sceVu0SubVector
/* 03DBF8 0013DAF8 00000000 */   nop
/* 03DBFC 0013DAFC 200101C6 */  lwc1        $f1, 0x120($16)
/* 03DC00 0013DB00 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 03DC04 0013DB04 00008244 */  mtc1        $2, $f0
/* 03DC08 0013DB08 00000000 */  nop
/* 03DC0C 0013DB0C 41080046 */  sub.s       $f1, $f1, $f0
/* 03DC10 0013DB10 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 03DC14 0013DB14 00008244 */  mtc1        $2, $f0
/* 03DC18 0013DB18 00000000 */  nop
/* 03DC1C 0013DB1C 02030146 */  mul.s       $f12, $f0, $f1
/* 03DC20 0013DB20 9000A427 */  addiu       $4, $29, 0x90
/* 03DC24 0013DB24 8000A527 */  addiu       $5, $29, 0x80
/* 03DC28 0013DB28 FA85040C */  jal         sceVu0ScaleVector
/* 03DC2C 0013DB2C 00000000 */   nop
/* 03DC30 0013DB30 240101C6 */  lwc1        $f1, 0x124($16)
/* 03DC34 0013DB34 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 03DC38 0013DB38 00008244 */  mtc1        $2, $f0
/* 03DC3C 0013DB3C 00000000 */  nop
/* 03DC40 0013DB40 41080046 */  sub.s       $f1, $f1, $f0
/* 03DC44 0013DB44 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 03DC48 0013DB48 00008244 */  mtc1        $2, $f0
/* 03DC4C 0013DB4C 00000000 */  nop
/* 03DC50 0013DB50 02030146 */  mul.s       $f12, $f0, $f1
/* 03DC54 0013DB54 A000A427 */  addiu       $4, $29, 0xA0
/* 03DC58 0013DB58 8000A527 */  addiu       $5, $29, 0x80
/* 03DC5C 0013DB5C FA85040C */  jal         sceVu0ScaleVector
/* 03DC60 0013DB60 00000000 */   nop
/* 03DC64 0013DB64 7000A427 */  addiu       $4, $29, 0x70
/* 03DC68 0013DB68 282E8070 */  paddub      $5, $4, $0
/* 03DC6C 0013DB6C 9000A627 */  addiu       $6, $29, 0x90
/* 03DC70 0013DB70 E885040C */  jal         sceVu0AddVector
/* 03DC74 0013DB74 00000000 */   nop
/* 03DC78 0013DB78 6000A427 */  addiu       $4, $29, 0x60
/* 03DC7C 0013DB7C 282E8070 */  paddub      $5, $4, $0
/* 03DC80 0013DB80 A000A627 */  addiu       $6, $29, 0xA0
/* 03DC84 0013DB84 EE85040C */  jal         sceVu0SubVector
/* 03DC88 0013DB88 00000000 */   nop
/* 03DC8C 0013DB8C 8000A427 */  addiu       $4, $29, 0x80
/* 03DC90 0013DB90 7000A527 */  addiu       $5, $29, 0x70
/* 03DC94 0013DB94 6000A627 */  addiu       $6, $29, 0x60
/* 03DC98 0013DB98 EE85040C */  jal         sceVu0SubVector
/* 03DC9C 0013DB9C 00000000 */   nop
/* 03DCA0 0013DBA0 180004C6 */  lwc1        $f4, 0x18($16)
/* 03DCA4 0013DBA4 140003C6 */  lwc1        $f3, 0x14($16)
/* 03DCA8 0013DBA8 100002C6 */  lwc1        $f2, 0x10($16)
/* 03DCAC 0013DBAC 100002E6 */  swc1        $f2, 0x10($16)
/* 03DCB0 0013DBB0 140003E6 */  swc1        $f3, 0x14($16)
/* 03DCB4 0013DBB4 180004E6 */  swc1        $f4, 0x18($16)
/* 03DCB8 0013DBB8 100001C6 */  lwc1        $f1, 0x10($16)
/* 03DCBC 0013DBBC 00008044 */  mtc1        $0, $f0
/* 03DCC0 0013DBC0 00000000 */  nop
/* 03DCC4 0013DBC4 36080046 */  c.le.s      $f1, $f0
/* 03DCC8 0013DBC8 00000000 */  nop
/* 03DCCC 0013DBCC 06000145 */  bc1t        .L0013DBE8
/* 03DCD0 0013DBD0 00000000 */   nop
/* 03DCD4 0013DBD4 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 03DCD8 0013DBD8 00008244 */  mtc1        $2, $f0
/* 03DCDC 0013DBDC 00000000 */  nop
/* 03DCE0 0013DBE0 03000246 */  div.s       $f0, $f0, $f2
/* 03DCE4 0013DBE4 200000E6 */  swc1        $f0, 0x20($16)
.L0013DBE8:
/* 03DCE8 0013DBE8 140001C6 */  lwc1        $f1, 0x14($16)
/* 03DCEC 0013DBEC 00008044 */  mtc1        $0, $f0
/* 03DCF0 0013DBF0 00000000 */  nop
/* 03DCF4 0013DBF4 36080046 */  c.le.s      $f1, $f0
/* 03DCF8 0013DBF8 00000000 */  nop
/* 03DCFC 0013DBFC 06000145 */  bc1t        .L0013DC18
/* 03DD00 0013DC00 00000000 */   nop
/* 03DD04 0013DC04 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 03DD08 0013DC08 00008244 */  mtc1        $2, $f0
/* 03DD0C 0013DC0C 00000000 */  nop
/* 03DD10 0013DC10 03000346 */  div.s       $f0, $f0, $f3
/* 03DD14 0013DC14 240000E6 */  swc1        $f0, 0x24($16)
.L0013DC18:
/* 03DD18 0013DC18 180001C6 */  lwc1        $f1, 0x18($16)
/* 03DD1C 0013DC1C 00008044 */  mtc1        $0, $f0
/* 03DD20 0013DC20 00000000 */  nop
/* 03DD24 0013DC24 36080046 */  c.le.s      $f1, $f0
/* 03DD28 0013DC28 00000000 */  nop
/* 03DD2C 0013DC2C 06000145 */  bc1t        .L0013DC48
/* 03DD30 0013DC30 00000000 */   nop
/* 03DD34 0013DC34 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 03DD38 0013DC38 00008244 */  mtc1        $2, $f0
/* 03DD3C 0013DC3C 00000000 */  nop
/* 03DD40 0013DC40 03000446 */  div.s       $f0, $f0, $f4
/* 03DD44 0013DC44 280000E6 */  swc1        $f0, 0x28($16)
.L0013DC48:
/* 03DD48 0013DC48 28260072 */  paddub      $4, $16, $0
/* 03DD4C 0013DC4C 8000A527 */  addiu       $5, $29, 0x80
/* 03DD50 0013DC50 28F6040C */  jal         SetDir__6CBoundFPf
/* 03DD54 0013DC54 00000000 */   nop
/* 03DD58 0013DC58 1000BF7B */  lq          $31, 0x10($29)
/* 03DD5C 0013DC5C 0000B07B */  lq          $16, 0x0($29)
/* 03DD60 0013DC60 B000BD27 */  addiu       $29, $29, 0xB0
/* 03DD64 0013DC64 0800E003 */  jr          $31
/* 03DD68 0013DC68 00000000 */   nop
/* 03DD6C 0013DC6C 00000000 */  nop
