.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoadTextureBlock__15CTextureManagerFiP16LOADTEXTURE_INFOPUi
/* 33E60 00133D60 10FFBD27 */  addiu      $sp, $sp, -0xF0
/* 33E64 00133D64 B000BF7F */  sq         $31, 0xB0($sp)
/* 33E68 00133D68 A000B67F */  sq         $22, 0xA0($sp)
/* 33E6C 00133D6C 9000B57F */  sq         $21, 0x90($sp)
/* 33E70 00133D70 8000B47F */  sq         $20, 0x80($sp)
/* 33E74 00133D74 7000B37F */  sq         $19, 0x70($sp)
/* 33E78 00133D78 6000B27F */  sq         $18, 0x60($sp)
/* 33E7C 00133D7C 5000B17F */  sq         $17, 0x50($sp)
/* 33E80 00133D80 4000B07F */  sq         $16, 0x40($sp)
/* 33E84 00133D84 28B68070 */  paddub     $22, $4, $0
/* 33E88 00133D88 28AEA070 */  paddub     $21, $5, $0
/* 33E8C 00133D8C 28A6C070 */  paddub     $20, $6, $0
/* 33E90 00133D90 289EE070 */  paddub     $19, $7, $0
/* 33E94 00133D94 288E0070 */  paddub     $17, $0, $0
/* 33E98 00133D98 52000010 */  b          .L00133EE4
/* 33E9C 00133D9C 00000000 */   nop
.L00133DA0:
/* 33EA0 00133DA0 0300A006 */  bltz       $21, .L00133DB0
/* 33EA4 00133DA4 00000000 */   nop
/* 33EA8 00133DA8 4D00B116 */  bne        $21, $17, .L00133EE0
/* 33EAC 00133DAC 00000000 */   nop
.L00133DB0:
/* 33EB0 00133DB0 28868072 */  paddub     $16, $20, $0
/* 33EB4 00133DB4 28960070 */  paddub     $18, $0, $0
.L00133DB8:
/* 33EB8 00133DB8 0000028E */  lw         $2, 0x0($16)
/* 33EBC 00133DBC 42004010 */  beqz       $2, .L00133EC8
/* 33EC0 00133DC0 00000000 */   nop
/* 33EC4 00133DC4 00004280 */  lb         $2, 0x0($2)
/* 33EC8 00133DC8 3F004010 */  beqz       $2, .L00133EC8
/* 33ECC 00133DCC 00000000 */   nop
/* 33ED0 00133DD0 0400028E */  lw         $2, 0x4($16)
/* 33ED4 00133DD4 39005114 */  bne        $2, $17, .L00133EBC
/* 33ED8 00133DD8 00000000 */   nop
/* 33EDC 00133DDC 05004016 */  bnez       $18, .L00133DF4
/* 33EE0 00133DE0 00000000 */   nop
/* 33EE4 00133DE4 2826C072 */  paddub     $4, $22, $0
/* 33EE8 00133DE8 282E2072 */  paddub     $5, $17, $0
/* 33EEC 00133DEC 60CD040C */  jal        BeginEnterTextureBlock__15CTextureManagerFi
/* 33EF0 00133DF0 00000000 */   nop
.L00133DF4:
/* 33EF4 00133DF4 01001224 */  addiu      $18, $0, 0x1
/* 33EF8 00133DF8 20000224 */  addiu      $2, $0, 0x20
/* 33EFC 00133DFC E400A2AF */  sw         $2, 0xE4($sp)
/* 33F00 00133E00 E800A2AF */  sw         $2, 0xE8($sp)
/* 33F04 00133E04 04000224 */  addiu      $2, $0, 0x4
/* 33F08 00133E08 EC00A2AF */  sw         $2, 0xEC($sp)
/* 33F0C 00133E0C 0000048E */  lw         $4, 0x0($16)
/* 33F10 00133E10 C000A527 */  addiu      $5, $sp, 0xC0
/* 33F14 00133E14 E400A627 */  addiu      $6, $sp, 0xE4
/* 33F18 00133E18 E800A727 */  addiu      $7, $sp, 0xE8
/* 33F1C 00133E1C EC00A827 */  addiu      $8, $sp, 0xEC
/* 33F20 00133E20 ECCE040C */  jal        GetDummyInfo__FPcPcPiPiPi
/* 33F24 00133E24 00000000 */   nop
/* 33F28 00133E28 15004010 */  beqz       $2, .L00133E80
/* 33F2C 00133E2C 00000000 */   nop
/* 33F30 00133E30 0000A0FF */  sd         $0, 0x0($sp)
/* 33F34 00133E34 0800A0FF */  sd         $0, 0x8($sp)
/* 33F38 00133E38 1000A0FF */  sd         $0, 0x10($sp)
/* 33F3C 00133E3C 1800A0FF */  sd         $0, 0x18($sp)
/* 33F40 00133E40 2000A0FF */  sd         $0, 0x20($sp)
/* 33F44 00133E44 2800A0FF */  sd         $0, 0x28($sp)
/* 33F48 00133E48 3000A0FF */  sd         $0, 0x30($sp)
/* 33F4C 00133E4C C701023C */  lui        $2, %hi(TexManager)
/* 33F50 00133E50 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 33F54 00133E54 0400058E */  lw         $5, 0x4($16)
/* 33F58 00133E58 C000A627 */  addiu      $6, $sp, 0xC0
/* 33F5C 00133E5C 283E0070 */  paddub     $7, $0, $0
/* 33F60 00133E60 E400A88F */  lw         $8, 0xE4($sp)
/* 33F64 00133E64 E800A98F */  lw         $9, 0xE8($sp)
/* 33F68 00133E68 EC00AA8F */  lw         $10, 0xEC($sp)
/* 33F6C 00133E6C 285E0070 */  paddub     $11, $0, $0
/* 33F70 00133E70 ECC4040C */  jal        EnterTexture__15CTextureManagerFiPcPUciiiPUciiPUcPUcPUcUli
/* 33F74 00133E74 00000000 */   nop
/* 33F78 00133E78 10000010 */  b          .L00133EBC
/* 33F7C 00133E7C 00000000 */   nop
.L00133E80:
/* 33F80 00133E80 0000048E */  lw         $4, 0x0($16)
/* 33F84 00133E84 282E6072 */  paddub     $5, $19, $0
/* 33F88 00133E88 28360070 */  paddub     $6, $0, $0
/* 33F8C 00133E8C 283E0070 */  paddub     $7, $0, $0
/* 33F90 00133E90 F4FC040C */  jal        LoadFile2__FPcPvPii
/* 33F94 00133E94 00000000 */   nop
/* 33F98 00133E98 08004010 */  beqz       $2, .L00133EBC
/* 33F9C 00133E9C 00000000 */   nop
/* 33FA0 00133EA0 2826C072 */  paddub     $4, $22, $0
/* 33FA4 00133EA4 282E6072 */  paddub     $5, $19, $0
/* 33FA8 00133EA8 0400068E */  lw         $6, 0x4($16)
/* 33FAC 00133EAC 0800078E */  lw         $7, 0x8($16)
/* 33FB0 00133EB0 28460070 */  paddub     $8, $0, $0
/* 33FB4 00133EB4 E8CA040C */  jal        EnterIMGFile__15CTextureManagerFPUciii
/* 33FB8 00133EB8 00000000 */   nop
.L00133EBC:
/* 33FBC 00133EBC 0C001026 */  addiu      $16, $16, 0xC
/* 33FC0 00133EC0 BDFF0010 */  b          .L00133DB8
/* 33FC4 00133EC4 00000000 */   nop
.L00133EC8:
/* 33FC8 00133EC8 05004012 */  beqz       $18, .L00133EE0
/* 33FCC 00133ECC 00000000 */   nop
/* 33FD0 00133ED0 2826C072 */  paddub     $4, $22, $0
/* 33FD4 00133ED4 282E2072 */  paddub     $5, $17, $0
/* 33FD8 00133ED8 88CD040C */  jal        EndEnterTextureBlock__15CTextureManagerFi
/* 33FDC 00133EDC 00000000 */   nop
.L00133EE0:
/* 33FE0 00133EE0 01003126 */  addiu      $17, $17, 0x1
.L00133EE4:
/* 33FE4 00133EE4 4800222A */  slti       $2, $17, 0x48
/* 33FE8 00133EE8 ADFF4014 */  bnez       $2, .L00133DA0
/* 33FEC 00133EEC 00000000 */   nop
/* 33FF0 00133EF0 28160070 */  paddub     $2, $0, $0
/* 33FF4 00133EF4 B000BF7B */  lq         $31, 0xB0($sp)
/* 33FF8 00133EF8 A000B67B */  lq         $22, 0xA0($sp)
/* 33FFC 00133EFC 9000B57B */  lq         $21, 0x90($sp)
/* 34000 00133F00 8000B47B */  lq         $20, 0x80($sp)
/* 34004 00133F04 7000B37B */  lq         $19, 0x70($sp)
/* 34008 00133F08 6000B27B */  lq         $18, 0x60($sp)
/* 3400C 00133F0C 5000B17B */  lq         $17, 0x50($sp)
/* 34010 00133F10 4000B07B */  lq         $16, 0x40($sp)
/* 34014 00133F14 F000BD27 */  addiu      $sp, $sp, 0xF0
/* 34018 00133F18 0800E003 */  jr         $31
/* 3401C 00133F1C 00000000 */   nop
