.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawAtoraNothing__Fiii
/* 119DC0 00219CC0 A0FEBD27 */  addiu      $sp, $sp, -0x160
/* 119DC4 00219CC4 3000BF7F */  sq         $31, 0x30($sp)
/* 119DC8 00219CC8 2000B27F */  sq         $18, 0x20($sp)
/* 119DCC 00219CCC 1000B17F */  sq         $17, 0x10($sp)
/* 119DD0 00219CD0 0000B07F */  sq         $16, 0x0($sp)
/* 119DD4 00219CD4 28968070 */  paddub     $18, $4, $0
/* 119DD8 00219CD8 288EA070 */  paddub     $17, $5, $0
/* 119DDC 00219CDC 2886C070 */  paddub     $16, $6, $0
/* 119DE0 00219CE0 B8000224 */  addiu      $2, $0, 0xB8
/* 119DE4 00219CE4 5000A2AF */  sw         $2, 0x50($sp)
/* 119DE8 00219CE8 5A010224 */  addiu      $2, $0, 0x15A
/* 119DEC 00219CEC 5400A2AF */  sw         $2, 0x54($sp)
/* 119DF0 00219CF0 12000224 */  addiu      $2, $0, 0x12
/* 119DF4 00219CF4 5800A2AF */  sw         $2, 0x58($sp)
/* 119DF8 00219CF8 5C00A2AF */  sw         $2, 0x5C($sp)
/* 119DFC 00219CFC 4000B2AF */  sw         $18, 0x40($sp)
/* 119E00 00219D00 4400B1AF */  sw         $17, 0x44($sp)
/* 119E04 00219D04 4800A2AF */  sw         $2, 0x48($sp)
/* 119E08 00219D08 4C00A2AF */  sw         $2, 0x4C($sp)
/* 119E0C 00219D0C B496848F */  lw         $4, -0x694C($gp)
/* 119E10 00219D10 4000A527 */  addiu      $5, $sp, 0x40
/* 119E14 00219D14 5000A627 */  addiu      $6, $sp, 0x50
/* 119E18 00219D18 283E0072 */  paddub     $7, $16, $0
/* 119E1C 00219D1C C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 119E20 00219D20 00000000 */   nop
/* 119E24 00219D24 C8000224 */  addiu      $2, $0, 0xC8
/* 119E28 00219D28 7000A2AF */  sw         $2, 0x70($sp)
/* 119E2C 00219D2C 5A010224 */  addiu      $2, $0, 0x15A
/* 119E30 00219D30 7400A2AF */  sw         $2, 0x74($sp)
/* 119E34 00219D34 04000224 */  addiu      $2, $0, 0x4
/* 119E38 00219D38 7800A2AF */  sw         $2, 0x78($sp)
/* 119E3C 00219D3C 12000324 */  addiu      $3, $0, 0x12
/* 119E40 00219D40 7C00A3AF */  sw         $3, 0x7C($sp)
/* 119E44 00219D44 12004226 */  addiu      $2, $18, 0x12
/* 119E48 00219D48 6000A2AF */  sw         $2, 0x60($sp)
/* 119E4C 00219D4C 6400B1AF */  sw         $17, 0x64($sp)
/* 119E50 00219D50 DC000224 */  addiu      $2, $0, 0xDC
/* 119E54 00219D54 6800A2AF */  sw         $2, 0x68($sp)
/* 119E58 00219D58 6C00A3AF */  sw         $3, 0x6C($sp)
/* 119E5C 00219D5C B496848F */  lw         $4, -0x694C($gp)
/* 119E60 00219D60 6000A527 */  addiu      $5, $sp, 0x60
/* 119E64 00219D64 7000A627 */  addiu      $6, $sp, 0x70
/* 119E68 00219D68 283E0072 */  paddub     $7, $16, $0
/* 119E6C 00219D6C C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 119E70 00219D70 00000000 */   nop
/* 119E74 00219D74 CA000224 */  addiu      $2, $0, 0xCA
/* 119E78 00219D78 9000A2AF */  sw         $2, 0x90($sp)
/* 119E7C 00219D7C 5A010224 */  addiu      $2, $0, 0x15A
/* 119E80 00219D80 9400A2AF */  sw         $2, 0x94($sp)
/* 119E84 00219D84 12000324 */  addiu      $3, $0, 0x12
/* 119E88 00219D88 9800A3AF */  sw         $3, 0x98($sp)
/* 119E8C 00219D8C 9C00A3AF */  sw         $3, 0x9C($sp)
/* 119E90 00219D90 EE004226 */  addiu      $2, $18, 0xEE
/* 119E94 00219D94 8000A2AF */  sw         $2, 0x80($sp)
/* 119E98 00219D98 8400B1AF */  sw         $17, 0x84($sp)
/* 119E9C 00219D9C 8800A3AF */  sw         $3, 0x88($sp)
/* 119EA0 00219DA0 8C00A3AF */  sw         $3, 0x8C($sp)
/* 119EA4 00219DA4 B496848F */  lw         $4, -0x694C($gp)
/* 119EA8 00219DA8 8000A527 */  addiu      $5, $sp, 0x80
/* 119EAC 00219DAC 9000A627 */  addiu      $6, $sp, 0x90
/* 119EB0 00219DB0 283E0072 */  paddub     $7, $16, $0
/* 119EB4 00219DB4 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 119EB8 00219DB8 00000000 */   nop
/* 119EBC 00219DBC B8000224 */  addiu      $2, $0, 0xB8
/* 119EC0 00219DC0 B000A2AF */  sw         $2, 0xB0($sp)
/* 119EC4 00219DC4 68010224 */  addiu      $2, $0, 0x168
/* 119EC8 00219DC8 B400A2AF */  sw         $2, 0xB4($sp)
/* 119ECC 00219DCC 12000324 */  addiu      $3, $0, 0x12
/* 119ED0 00219DD0 B800A3AF */  sw         $3, 0xB8($sp)
/* 119ED4 00219DD4 04000224 */  addiu      $2, $0, 0x4
/* 119ED8 00219DD8 BC00A2AF */  sw         $2, 0xBC($sp)
/* 119EDC 00219DDC A000B2AF */  sw         $18, 0xA0($sp)
/* 119EE0 00219DE0 12002226 */  addiu      $2, $17, 0x12
/* 119EE4 00219DE4 A400A2AF */  sw         $2, 0xA4($sp)
/* 119EE8 00219DE8 A800A3AF */  sw         $3, 0xA8($sp)
/* 119EEC 00219DEC 54000224 */  addiu      $2, $0, 0x54
/* 119EF0 00219DF0 AC00A2AF */  sw         $2, 0xAC($sp)
/* 119EF4 00219DF4 B496848F */  lw         $4, -0x694C($gp)
/* 119EF8 00219DF8 A000A527 */  addiu      $5, $sp, 0xA0
/* 119EFC 00219DFC B000A627 */  addiu      $6, $sp, 0xB0
/* 119F00 00219E00 283E0072 */  paddub     $7, $16, $0
/* 119F04 00219E04 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 119F08 00219E08 00000000 */   nop
/* 119F0C 00219E0C CA000224 */  addiu      $2, $0, 0xCA
/* 119F10 00219E10 D000A2AF */  sw         $2, 0xD0($sp)
/* 119F14 00219E14 68010224 */  addiu      $2, $0, 0x168
/* 119F18 00219E18 D400A2AF */  sw         $2, 0xD4($sp)
/* 119F1C 00219E1C 12000324 */  addiu      $3, $0, 0x12
/* 119F20 00219E20 D800A3AF */  sw         $3, 0xD8($sp)
/* 119F24 00219E24 04000224 */  addiu      $2, $0, 0x4
/* 119F28 00219E28 DC00A2AF */  sw         $2, 0xDC($sp)
/* 119F2C 00219E2C EE004226 */  addiu      $2, $18, 0xEE
/* 119F30 00219E30 C000A2AF */  sw         $2, 0xC0($sp)
/* 119F34 00219E34 12002226 */  addiu      $2, $17, 0x12
/* 119F38 00219E38 C400A2AF */  sw         $2, 0xC4($sp)
/* 119F3C 00219E3C C800A3AF */  sw         $3, 0xC8($sp)
/* 119F40 00219E40 54000224 */  addiu      $2, $0, 0x54
/* 119F44 00219E44 CC00A2AF */  sw         $2, 0xCC($sp)
/* 119F48 00219E48 B496848F */  lw         $4, -0x694C($gp)
/* 119F4C 00219E4C C000A527 */  addiu      $5, $sp, 0xC0
/* 119F50 00219E50 D000A627 */  addiu      $6, $sp, 0xD0
/* 119F54 00219E54 283E0072 */  paddub     $7, $16, $0
/* 119F58 00219E58 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 119F5C 00219E5C 00000000 */   nop
/* 119F60 00219E60 B8000224 */  addiu      $2, $0, 0xB8
/* 119F64 00219E64 F000A2AF */  sw         $2, 0xF0($sp)
/* 119F68 00219E68 6C010224 */  addiu      $2, $0, 0x16C
/* 119F6C 00219E6C F400A2AF */  sw         $2, 0xF4($sp)
/* 119F70 00219E70 12000324 */  addiu      $3, $0, 0x12
/* 119F74 00219E74 F800A3AF */  sw         $3, 0xF8($sp)
/* 119F78 00219E78 FC00A3AF */  sw         $3, 0xFC($sp)
/* 119F7C 00219E7C E000B2AF */  sw         $18, 0xE0($sp)
/* 119F80 00219E80 66002226 */  addiu      $2, $17, 0x66
/* 119F84 00219E84 E400A2AF */  sw         $2, 0xE4($sp)
/* 119F88 00219E88 E800A3AF */  sw         $3, 0xE8($sp)
/* 119F8C 00219E8C EC00A3AF */  sw         $3, 0xEC($sp)
/* 119F90 00219E90 B496848F */  lw         $4, -0x694C($gp)
/* 119F94 00219E94 E000A527 */  addiu      $5, $sp, 0xE0
/* 119F98 00219E98 F000A627 */  addiu      $6, $sp, 0xF0
/* 119F9C 00219E9C 283E0072 */  paddub     $7, $16, $0
/* 119FA0 00219EA0 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 119FA4 00219EA4 00000000 */   nop
/* 119FA8 00219EA8 C8000224 */  addiu      $2, $0, 0xC8
/* 119FAC 00219EAC 1001A2AF */  sw         $2, 0x110($sp)
/* 119FB0 00219EB0 6C010224 */  addiu      $2, $0, 0x16C
/* 119FB4 00219EB4 1401A2AF */  sw         $2, 0x114($sp)
/* 119FB8 00219EB8 04000224 */  addiu      $2, $0, 0x4
/* 119FBC 00219EBC 1801A2AF */  sw         $2, 0x118($sp)
/* 119FC0 00219EC0 12000324 */  addiu      $3, $0, 0x12
/* 119FC4 00219EC4 1C01A3AF */  sw         $3, 0x11C($sp)
/* 119FC8 00219EC8 12004226 */  addiu      $2, $18, 0x12
/* 119FCC 00219ECC 0001A2AF */  sw         $2, 0x100($sp)
/* 119FD0 00219ED0 66002226 */  addiu      $2, $17, 0x66
/* 119FD4 00219ED4 0401A2AF */  sw         $2, 0x104($sp)
/* 119FD8 00219ED8 DC000224 */  addiu      $2, $0, 0xDC
/* 119FDC 00219EDC 0801A2AF */  sw         $2, 0x108($sp)
/* 119FE0 00219EE0 0C01A3AF */  sw         $3, 0x10C($sp)
/* 119FE4 00219EE4 B496848F */  lw         $4, -0x694C($gp)
/* 119FE8 00219EE8 0001A527 */  addiu      $5, $sp, 0x100
/* 119FEC 00219EEC 1001A627 */  addiu      $6, $sp, 0x110
/* 119FF0 00219EF0 283E0072 */  paddub     $7, $16, $0
/* 119FF4 00219EF4 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 119FF8 00219EF8 00000000 */   nop
/* 119FFC 00219EFC CA000224 */  addiu      $2, $0, 0xCA
/* 11A000 00219F00 3001A2AF */  sw         $2, 0x130($sp)
/* 11A004 00219F04 6C010224 */  addiu      $2, $0, 0x16C
/* 11A008 00219F08 3401A2AF */  sw         $2, 0x134($sp)
/* 11A00C 00219F0C 12000324 */  addiu      $3, $0, 0x12
/* 11A010 00219F10 3801A3AF */  sw         $3, 0x138($sp)
/* 11A014 00219F14 3C01A3AF */  sw         $3, 0x13C($sp)
/* 11A018 00219F18 EE004226 */  addiu      $2, $18, 0xEE
/* 11A01C 00219F1C 2001A2AF */  sw         $2, 0x120($sp)
/* 11A020 00219F20 66002226 */  addiu      $2, $17, 0x66
/* 11A024 00219F24 2401A2AF */  sw         $2, 0x124($sp)
/* 11A028 00219F28 2801A3AF */  sw         $3, 0x128($sp)
/* 11A02C 00219F2C 2C01A3AF */  sw         $3, 0x12C($sp)
/* 11A030 00219F30 B496848F */  lw         $4, -0x694C($gp)
/* 11A034 00219F34 2001A527 */  addiu      $5, $sp, 0x120
/* 11A038 00219F38 3001A627 */  addiu      $6, $sp, 0x130
/* 11A03C 00219F3C 283E0072 */  paddub     $7, $16, $0
/* 11A040 00219F40 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 11A044 00219F44 00000000 */   nop
/* 11A048 00219F48 7C000224 */  addiu      $2, $0, 0x7C
/* 11A04C 00219F4C 5001A2AF */  sw         $2, 0x150($sp)
/* 11A050 00219F50 A2010224 */  addiu      $2, $0, 0x1A2
/* 11A054 00219F54 5401A2AF */  sw         $2, 0x154($sp)
/* 11A058 00219F58 84000424 */  addiu      $4, $0, 0x84
/* 11A05C 00219F5C 5801A4AF */  sw         $4, 0x158($sp)
/* 11A060 00219F60 1E000324 */  addiu      $3, $0, 0x1E
/* 11A064 00219F64 5C01A3AF */  sw         $3, 0x15C($sp)
/* 11A068 00219F68 40004226 */  addiu      $2, $18, 0x40
/* 11A06C 00219F6C 4001A2AF */  sw         $2, 0x140($sp)
/* 11A070 00219F70 2C002226 */  addiu      $2, $17, 0x2C
/* 11A074 00219F74 4401A2AF */  sw         $2, 0x144($sp)
/* 11A078 00219F78 4801A4AF */  sw         $4, 0x148($sp)
/* 11A07C 00219F7C 4C01A3AF */  sw         $3, 0x14C($sp)
/* 11A080 00219F80 B496848F */  lw         $4, -0x694C($gp)
/* 11A084 00219F84 4001A527 */  addiu      $5, $sp, 0x140
/* 11A088 00219F88 5001A627 */  addiu      $6, $sp, 0x150
/* 11A08C 00219F8C 283E0072 */  paddub     $7, $16, $0
/* 11A090 00219F90 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 11A094 00219F94 00000000 */   nop
/* 11A098 00219F98 3000BF7B */  lq         $31, 0x30($sp)
/* 11A09C 00219F9C 2000B27B */  lq         $18, 0x20($sp)
/* 11A0A0 00219FA0 1000B17B */  lq         $17, 0x10($sp)
/* 11A0A4 00219FA4 0000B07B */  lq         $16, 0x0($sp)
/* 11A0A8 00219FA8 6001BD27 */  addiu      $sp, $sp, 0x160
/* 11A0AC 00219FAC 0800E003 */  jr         $31
/* 11A0B0 00219FB0 00000000 */   nop
/* 11A0B4 00219FB4 00000000 */  nop
/* 11A0B8 00219FB8 00000000 */  nop
/* 11A0BC 00219FBC 00000000 */  nop
