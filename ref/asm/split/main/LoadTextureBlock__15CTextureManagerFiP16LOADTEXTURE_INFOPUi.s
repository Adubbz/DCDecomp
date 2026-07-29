.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadTextureBlock__15CTextureManagerFiP16LOADTEXTURE_INFOPUi
/* 033E60 00133D60 10FFBD27 */  addiu       $29, $29, -0xF0
/* 033E64 00133D64 B000BF7F */  sq          $31, 0xB0($29)
/* 033E68 00133D68 A000B67F */  sq          $22, 0xA0($29)
/* 033E6C 00133D6C 9000B57F */  sq          $21, 0x90($29)
/* 033E70 00133D70 8000B47F */  sq          $20, 0x80($29)
/* 033E74 00133D74 7000B37F */  sq          $19, 0x70($29)
/* 033E78 00133D78 6000B27F */  sq          $18, 0x60($29)
/* 033E7C 00133D7C 5000B17F */  sq          $17, 0x50($29)
/* 033E80 00133D80 4000B07F */  sq          $16, 0x40($29)
/* 033E84 00133D84 28B68070 */  paddub      $22, $4, $0
/* 033E88 00133D88 28AEA070 */  paddub      $21, $5, $0
/* 033E8C 00133D8C 28A6C070 */  paddub      $20, $6, $0
/* 033E90 00133D90 289EE070 */  paddub      $19, $7, $0
/* 033E94 00133D94 288E0070 */  paddub      $17, $0, $0
/* 033E98 00133D98 52000010 */  b           .L00133EE4
/* 033E9C 00133D9C 00000000 */   nop
.L00133DA0:
/* 033EA0 00133DA0 0300A006 */  bltz        $21, .L00133DB0
/* 033EA4 00133DA4 00000000 */   nop
/* 033EA8 00133DA8 4D00B116 */  bne         $21, $17, .L00133EE0
/* 033EAC 00133DAC 00000000 */   nop
.L00133DB0:
/* 033EB0 00133DB0 28868072 */  paddub      $16, $20, $0
/* 033EB4 00133DB4 28960070 */  paddub      $18, $0, $0
.L00133DB8:
/* 033EB8 00133DB8 0000028E */  lw          $2, 0x0($16)
/* 033EBC 00133DBC 42004010 */  beqz        $2, .L00133EC8
/* 033EC0 00133DC0 00000000 */   nop
/* 033EC4 00133DC4 00004280 */  lb          $2, 0x0($2)
/* 033EC8 00133DC8 3F004010 */  beqz        $2, .L00133EC8
/* 033ECC 00133DCC 00000000 */   nop
/* 033ED0 00133DD0 0400028E */  lw          $2, 0x4($16)
/* 033ED4 00133DD4 39005114 */  bne         $2, $17, .L00133EBC
/* 033ED8 00133DD8 00000000 */   nop
/* 033EDC 00133DDC 05004016 */  bnez        $18, .L00133DF4
/* 033EE0 00133DE0 00000000 */   nop
/* 033EE4 00133DE4 2826C072 */  paddub      $4, $22, $0
/* 033EE8 00133DE8 282E2072 */  paddub      $5, $17, $0
/* 033EEC 00133DEC 60CD040C */  jal         BeginEnterTextureBlock__15CTextureManagerFi
/* 033EF0 00133DF0 00000000 */   nop
.L00133DF4:
/* 033EF4 00133DF4 01001224 */  addiu       $18, $0, 0x1
/* 033EF8 00133DF8 20000224 */  addiu       $2, $0, 0x20
/* 033EFC 00133DFC E400A2AF */  sw          $2, 0xE4($29)
/* 033F00 00133E00 E800A2AF */  sw          $2, 0xE8($29)
/* 033F04 00133E04 04000224 */  addiu       $2, $0, 0x4
/* 033F08 00133E08 EC00A2AF */  sw          $2, 0xEC($29)
/* 033F0C 00133E0C 0000048E */  lw          $4, 0x0($16)
/* 033F10 00133E10 C000A527 */  addiu       $5, $29, 0xC0
/* 033F14 00133E14 E400A627 */  addiu       $6, $29, 0xE4
/* 033F18 00133E18 E800A727 */  addiu       $7, $29, 0xE8
/* 033F1C 00133E1C EC00A827 */  addiu       $8, $29, 0xEC
/* 033F20 00133E20 ECCE040C */  jal         GetDummyInfo__FPcPcPiPiPi
/* 033F24 00133E24 00000000 */   nop
/* 033F28 00133E28 15004010 */  beqz        $2, .L00133E80
/* 033F2C 00133E2C 00000000 */   nop
/* 033F30 00133E30 0000A0FF */  sd          $0, 0x0($29)
/* 033F34 00133E34 0800A0FF */  sd          $0, 0x8($29)
/* 033F38 00133E38 1000A0FF */  sd          $0, 0x10($29)
/* 033F3C 00133E3C 1800A0FF */  sd          $0, 0x18($29)
/* 033F40 00133E40 2000A0FF */  sd          $0, 0x20($29)
/* 033F44 00133E44 2800A0FF */  sd          $0, 0x28($29)
/* 033F48 00133E48 3000A0FF */  sd          $0, 0x30($29)
/* 033F4C 00133E4C C701023C */  lui         $2, %hi(TexManager)
/* 033F50 00133E50 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 033F54 00133E54 0400058E */  lw          $5, 0x4($16)
/* 033F58 00133E58 C000A627 */  addiu       $6, $29, 0xC0
/* 033F5C 00133E5C 283E0070 */  paddub      $7, $0, $0
/* 033F60 00133E60 E400A88F */  lw          $8, 0xE4($29)
/* 033F64 00133E64 E800A98F */  lw          $9, 0xE8($29)
/* 033F68 00133E68 EC00AA8F */  lw          $10, 0xEC($29)
/* 033F6C 00133E6C 285E0070 */  paddub      $11, $0, $0
/* 033F70 00133E70 ECC4040C */  jal         EnterTexture__15CTextureManagerFiPcPUciiiPUciiPUcPUcPUcUli
/* 033F74 00133E74 00000000 */   nop
/* 033F78 00133E78 10000010 */  b           .L00133EBC
/* 033F7C 00133E7C 00000000 */   nop
.L00133E80:
/* 033F80 00133E80 0000048E */  lw          $4, 0x0($16)
/* 033F84 00133E84 282E6072 */  paddub      $5, $19, $0
/* 033F88 00133E88 28360070 */  paddub      $6, $0, $0
/* 033F8C 00133E8C 283E0070 */  paddub      $7, $0, $0
/* 033F90 00133E90 F4FC040C */  jal         LoadFile2__FPcPvPii
/* 033F94 00133E94 00000000 */   nop
/* 033F98 00133E98 08004010 */  beqz        $2, .L00133EBC
/* 033F9C 00133E9C 00000000 */   nop
/* 033FA0 00133EA0 2826C072 */  paddub      $4, $22, $0
/* 033FA4 00133EA4 282E6072 */  paddub      $5, $19, $0
/* 033FA8 00133EA8 0400068E */  lw          $6, 0x4($16)
/* 033FAC 00133EAC 0800078E */  lw          $7, 0x8($16)
/* 033FB0 00133EB0 28460070 */  paddub      $8, $0, $0
/* 033FB4 00133EB4 E8CA040C */  jal         EnterIMGFile__15CTextureManagerFPUciii
/* 033FB8 00133EB8 00000000 */   nop
.L00133EBC:
/* 033FBC 00133EBC 0C001026 */  addiu       $16, $16, 0xC
/* 033FC0 00133EC0 BDFF0010 */  b           .L00133DB8
/* 033FC4 00133EC4 00000000 */   nop
.L00133EC8:
/* 033FC8 00133EC8 05004012 */  beqz        $18, .L00133EE0
/* 033FCC 00133ECC 00000000 */   nop
/* 033FD0 00133ED0 2826C072 */  paddub      $4, $22, $0
/* 033FD4 00133ED4 282E2072 */  paddub      $5, $17, $0
/* 033FD8 00133ED8 88CD040C */  jal         EndEnterTextureBlock__15CTextureManagerFi
/* 033FDC 00133EDC 00000000 */   nop
.L00133EE0:
/* 033FE0 00133EE0 01003126 */  addiu       $17, $17, 0x1
.L00133EE4:
/* 033FE4 00133EE4 4800222A */  slti        $2, $17, 0x48
/* 033FE8 00133EE8 ADFF4014 */  bnez        $2, .L00133DA0
/* 033FEC 00133EEC 00000000 */   nop
/* 033FF0 00133EF0 28160070 */  paddub      $2, $0, $0
/* 033FF4 00133EF4 B000BF7B */  lq          $31, 0xB0($29)
/* 033FF8 00133EF8 A000B67B */  lq          $22, 0xA0($29)
/* 033FFC 00133EFC 9000B57B */  lq          $21, 0x90($29)
/* 034000 00133F00 8000B47B */  lq          $20, 0x80($29)
/* 034004 00133F04 7000B37B */  lq          $19, 0x70($29)
/* 034008 00133F08 6000B27B */  lq          $18, 0x60($29)
/* 03400C 00133F0C 5000B17B */  lq          $17, 0x50($29)
/* 034010 00133F10 4000B07B */  lq          $16, 0x40($29)
/* 034014 00133F14 F000BD27 */  addiu       $29, $29, 0xF0
/* 034018 00133F18 0800E003 */  jr          $31
/* 03401C 00133F1C 00000000 */   nop
