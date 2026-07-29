.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawWaterSurface__FP7CCamera
/* 09DA80 0019D980 90FFBD27 */  addiu       $29, $29, -0x70
/* 09DA84 0019D984 3000BF7F */  sq          $31, 0x30($29)
/* 09DA88 0019D988 2000B27F */  sq          $18, 0x20($29)
/* 09DA8C 0019D98C 1000B17F */  sq          $17, 0x10($29)
/* 09DA90 0019D990 0000B07F */  sq          $16, 0x0($29)
/* 09DA94 0019D994 28868070 */  paddub      $16, $4, $0
/* 09DA98 0019D998 D501023C */  lui         $2, %hi(Water__3)
/* 09DA9C 0019D99C F0365124 */  addiu       $17, $2, %lo(Water__3)
/* 09DAA0 0019D9A0 4000A527 */  addiu       $5, $29, 0x40
/* 09DAA4 0019D9A4 9C91040C */  jal         GetPos__7CCameraFPf
/* 09DAA8 0019D9A8 00000000 */   nop
/* 09DAAC 0019D9AC 28260072 */  paddub      $4, $16, $0
/* 09DAB0 0019D9B0 6000A527 */  addiu       $5, $29, 0x60
/* 09DAB4 0019D9B4 E890040C */  jal         GetDir__7CCameraFPf
/* 09DAB8 0019D9B8 00000000 */   nop
/* 09DABC 0019D9BC 6400A0AF */  sw          $0, 0x64($29)
/* 09DAC0 0019D9C0 6000A427 */  addiu       $4, $29, 0x60
/* 09DAC4 0019D9C4 282E8070 */  paddub      $5, $4, $0
/* 09DAC8 0019D9C8 9285040C */  jal         sceVu0Normalize
/* 09DACC 0019D9CC 00000000 */   nop
/* 09DAD0 0019D9D0 28860070 */  paddub      $16, $0, $0
/* 09DAD4 0019D9D4 38000010 */  b           .L0019DAB8
/* 09DAD8 0019D9D8 00000000 */   nop
.L0019D9DC:
/* 09DADC 0019D9DC 2000238E */  lw          $3, 0x20($17)
/* 09DAE0 0019D9E0 33006010 */  beqz        $3, .L0019DAB0
/* 09DAE4 0019D9E4 00000000 */   nop
/* 09DAE8 0019D9E8 90003226 */  addiu       $18, $17, 0x90
/* 09DAEC 0019D9EC 5000A427 */  addiu       $4, $29, 0x50
/* 09DAF0 0019D9F0 40002526 */  addiu       $5, $17, 0x40
/* 09DAF4 0019D9F4 0C86040C */  jal         sceVu0CopyVector
/* 09DAF8 0019D9F8 00000000 */   nop
/* 09DAFC 0019D9FC 2400228E */  lw          $2, 0x24($17)
/* 09DB00 0019DA00 08004010 */  beqz        $2, .L0019DA24
/* 09DB04 0019DA04 00000000 */   nop
/* 09DB08 0019DA08 4000A2C7 */  lwc1        $f2, 0x40($29)
/* 09DB0C 0019DA0C 4842023C */  lui         $2, (0x42480000 >> 16)
/* 09DB10 0019DA10 00088244 */  mtc1        $2, $f1
/* 09DB14 0019DA14 6000A0C7 */  lwc1        $f0, 0x60($29)
/* 09DB18 0019DA18 02080046 */  mul.s       $f0, $f1, $f0
/* 09DB1C 0019DA1C 00100046 */  add.s       $f0, $f2, $f0
/* 09DB20 0019DA20 5000A0E7 */  swc1        $f0, 0x50($29)
.L0019DA24:
/* 09DB24 0019DA24 2800228E */  lw          $2, 0x28($17)
/* 09DB28 0019DA28 03004010 */  beqz        $2, .L0019DA38
/* 09DB2C 0019DA2C 00000000 */   nop
/* 09DB30 0019DA30 4400A0C7 */  lwc1        $f0, 0x44($29)
/* 09DB34 0019DA34 5400A0E7 */  swc1        $f0, 0x54($29)
.L0019DA38:
/* 09DB38 0019DA38 2C00228E */  lw          $2, 0x2C($17)
/* 09DB3C 0019DA3C 08004010 */  beqz        $2, .L0019DA60
/* 09DB40 0019DA40 00000000 */   nop
/* 09DB44 0019DA44 4800A2C7 */  lwc1        $f2, 0x48($29)
/* 09DB48 0019DA48 4842023C */  lui         $2, (0x42480000 >> 16)
/* 09DB4C 0019DA4C 00088244 */  mtc1        $2, $f1
/* 09DB50 0019DA50 6800A0C7 */  lwc1        $f0, 0x68($29)
/* 09DB54 0019DA54 02080046 */  mul.s       $f0, $f1, $f0
/* 09DB58 0019DA58 00100046 */  add.s       $f0, $f2, $f0
/* 09DB5C 0019DA5C 5800A0E7 */  swc1        $f0, 0x58($29)
.L0019DA60:
/* 09DB60 0019DA60 00688044 */  mtc1        $0, $f13
/* 09DB64 0019DA64 00000000 */  nop
/* 09DB68 0019DA68 066B0046 */  mov.s       $f12, $f13
/* 09DB6C 0019DA6C 866B0046 */  mov.s       $f14, $f13
/* 09DB70 0019DA70 B0004426 */  addiu       $4, $18, 0xB0
/* 09DB74 0019DA74 70A3040C */  jal         SetRotation__6CFrameFfff
/* 09DB78 0019DA78 00000000 */   nop
/* 09DB7C 0019DA7C B0004426 */  addiu       $4, $18, 0xB0
/* 09DB80 0019DA80 5000A527 */  addiu       $5, $29, 0x50
/* 09DB84 0019DA84 B89F040C */  jal         SetPosition__6CFrameFPf
/* 09DB88 0019DA88 00000000 */   nop
/* 09DB8C 0019DA8C A0B8040C */  jal         GetVif1Packet__Fv
/* 09DB90 0019DA90 00000000 */   nop
/* 09DB94 0019DA94 28264072 */  paddub      $4, $18, $0
/* 09DB98 0019DA98 C701033C */  lui         $3, %hi(mgRenderInfo)
/* 09DB9C 0019DA9C 20556524 */  addiu       $5, $3, %lo(mgRenderInfo)
/* 09DBA0 0019DAA0 28364070 */  paddub      $6, $2, $0
/* 09DBA4 0019DAA4 283E0070 */  paddub      $7, $0, $0
/* 09DBA8 0019DAA8 C883050C */  jal         DrawVu1__6CWaterFP10RenderInfoP13sceVif1PacketP1
/* 09DBAC 0019DAAC 00000000 */   nop
.L0019DAB0:
/* 09DBB0 0019DAB0 01001026 */  addiu       $16, $16, 0x1
/* 09DBB4 0019DAB4 B0033126 */  addiu       $17, $17, 0x3B0
.L0019DAB8:
/* 09DBB8 0019DAB8 C8FF001A */  blez        $16, .L0019D9DC
/* 09DBBC 0019DABC 00000000 */   nop
/* 09DBC0 0019DAC0 3000BF7B */  lq          $31, 0x30($29)
/* 09DBC4 0019DAC4 2000B27B */  lq          $18, 0x20($29)
/* 09DBC8 0019DAC8 1000B17B */  lq          $17, 0x10($29)
/* 09DBCC 0019DACC 0000B07B */  lq          $16, 0x0($29)
/* 09DBD0 0019DAD0 7000BD27 */  addiu       $29, $29, 0x70
/* 09DBD4 0019DAD4 0800E003 */  jr          $31
/* 09DBD8 0019DAD8 00000000 */   nop
/* 09DBDC 0019DADC 00000000 */  nop
