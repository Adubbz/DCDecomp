.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BtEscape_Loop__Fv
/* 0D3E40 001D3D40 C0FFBD27 */  addiu       $29, $29, -0x40
/* 0D3E44 001D3D44 1000BF7F */  sq          $31, 0x10($29)
/* 0D3E48 001D3D48 0000B07F */  sq          $16, 0x0($29)
/* 0D3E4C 001D3D4C 28860070 */  paddub      $16, $0, $0
/* 0D3E50 001D3D50 7094838F */  lw          $3, -0x6B90($28)
/* 0D3E54 001D3D54 01000224 */  addiu       $2, $0, 0x1
/* 0D3E58 001D3D58 4F006210 */  beq         $3, $2, .L001D3E98
/* 0D3E5C 001D3D5C 00000000 */   nop
/* 0D3E60 001D3D60 03006010 */  beqz        $3, .L001D3D70
/* 0D3E64 001D3D64 00000000 */   nop
/* 0D3E68 001D3D68 52000010 */  b           .L001D3EB4
/* 0D3E6C 001D3D6C 00000000 */   nop
.L001D3D70:
/* 0D3E70 001D3D70 006E050C */  jal         SndSPSeSyncBG__Fv
/* 0D3E74 001D3D74 00000000 */   nop
/* 0D3E78 001D3D78 43004014 */  bnez        $2, .L001D3E88
/* 0D3E7C 001D3D7C 00000000 */   nop
/* 0D3E80 001D3D80 8CFB040C */  jal         ReadBGSync__Fv
/* 0D3E84 001D3D84 00000000 */   nop
/* 0D3E88 001D3D88 3F004014 */  bnez        $2, .L001D3E88
/* 0D3E8C 001D3D8C 00000000 */   nop
/* 0D3E90 001D3D90 6C94858F */  lw          $5, -0x6B94($28)
/* 0D3E94 001D3D94 EB01023C */  lui         $2, %hi(EscapeEffect)
/* 0D3E98 001D3D98 00294424 */  addiu       $4, $2, %lo(EscapeEffect)
/* 0D3E9C 001D3D9C 2A00023C */  lui         $2, %hi(LIT_902)
/* 0D3EA0 001D3DA0 F8C64624 */  addiu       $6, $2, %lo(LIT_902)
/* 0D3EA4 001D3DA4 F001023C */  lui         $2, %hi(BtCashBuffer)
/* 0D3EA8 001D3DA8 50684724 */  addiu       $7, $2, %lo(BtCashBuffer)
/* 0D3EAC 001D3DAC 1C000824 */  addiu       $8, $0, 0x1C
/* 0D3EB0 001D3DB0 F001023C */  lui         $2, %hi(BtCashBuffer)
/* 0D3EB4 001D3DB4 50684924 */  addiu       $9, $2, %lo(BtCashBuffer)
/* 0D3EB8 001D3DB8 28560070 */  paddub      $10, $0, $0
/* 0D3EBC 001D3DBC 14E6040C */  jal         LoadPackData2__10CCharacterFPUiPcP14CDataAlloc2_1_iP14CDataAlloc2_1_i
/* 0D3EC0 001D3DC0 00000000 */   nop
/* 0D3EC4 001D3DC4 EB01013C */  lui         $1, %hi(EscapeEffect + 0xC68)
/* 0D3EC8 001D3DC8 683520AC */  sw          $0, %lo(EscapeEffect + 0xC68)($1)
/* 0D3ECC 001D3DCC 06000224 */  addiu       $2, $0, 0x6
/* 0D3ED0 001D3DD0 EB01013C */  lui         $1, %hi(EscapeEffect + 0xC64)
/* 0D3ED4 001D3DD4 643522AC */  sw          $2, %lo(EscapeEffect + 0xC64)($1)
/* 0D3ED8 001D3DD8 80BF023C */  lui         $2, (0xBF800000 >> 16)
/* 0D3EDC 001D3DDC EB01013C */  lui         $1, %hi(EscapeEffect + 0xC60)
/* 0D3EE0 001D3DE0 603522AC */  sw          $2, %lo(EscapeEffect + 0xC60)($1)
/* 0D3EE4 001D3DE4 2041023C */  lui         $2, (0x41200000 >> 16)
/* 0D3EE8 001D3DE8 EB01013C */  lui         $1, %hi(EscapeEffect + 0x2F0)
/* 0D3EEC 001D3DEC F02B22AC */  sw          $2, %lo(EscapeEffect + 0x2F0)($1)
/* 0D3EF0 001D3DF0 01000224 */  addiu       $2, $0, 0x1
/* 0D3EF4 001D3DF4 189D82AF */  sw          $2, -0x62E8($28)
/* 0D3EF8 001D3DF8 2000A427 */  addiu       $4, $29, 0x20
/* 0D3EFC 001D3DFC EA01023C */  lui         $2, %hi(CharaMain + 0x10)
/* 0D3F00 001D3E00 301D4524 */  addiu       $5, $2, %lo(CharaMain + 0x10)
/* 0D3F04 001D3E04 0C86040C */  jal         sceVu0CopyVector
/* 0D3F08 001D3E08 00000000 */   nop
/* 0D3F0C 001D3E0C EA01023C */  lui         $2, %hi(CharaMain)
/* 0D3F10 001D3E10 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 0D3F14 001D3E14 3000A527 */  addiu       $5, $29, 0x30
/* 0D3F18 001D3E18 BC5B050C */  jal         GetRotation__7CObjectFPf
/* 0D3F1C 001D3E1C 00000000 */   nop
/* 0D3F20 001D3E20 EB01023C */  lui         $2, %hi(EscapeEffect)
/* 0D3F24 001D3E24 00294424 */  addiu       $4, $2, %lo(EscapeEffect)
/* 0D3F28 001D3E28 2000A527 */  addiu       $5, $29, 0x20
/* 0D3F2C 001D3E2C 38E4040C */  jal         SetPosition__10CCharacterFPf
/* 0D3F30 001D3E30 00000000 */   nop
/* 0D3F34 001D3E34 EB01023C */  lui         $2, %hi(EscapeEffect)
/* 0D3F38 001D3E38 00294424 */  addiu       $4, $2, %lo(EscapeEffect)
/* 0D3F3C 001D3E3C 3000A527 */  addiu       $5, $29, 0x30
/* 0D3F40 001D3E40 78E4040C */  jal         SetRotation__10CCharacterFPf
/* 0D3F44 001D3E44 00000000 */   nop
/* 0D3F48 001D3E48 B425060C */  jal         EdFadeInit__Fv
/* 0D3F4C 001D3E4C 00000000 */   nop
/* 0D3F50 001D3E50 00688044 */  mtc1        $0, $f13
/* 0D3F54 001D3E54 00000000 */  nop
/* 0D3F58 001D3E58 866B0046 */  mov.s       $f14, $f13
/* 0D3F5C 001D3E5C 066B0046 */  mov.s       $f12, $f13
/* 0D3F60 001D3E60 78000424 */  addiu       $4, $0, 0x78
/* 0D3F64 001D3E64 E425060C */  jal         EdFadeOut__Fifff
/* 0D3F68 001D3E68 00000000 */   nop
/* 0D3F6C 001D3E6C 08000424 */  addiu       $4, $0, 0x8
/* 0D3F70 001D3E70 FFFF0524 */  addiu       $5, $0, -0x1
/* 0D3F74 001D3E74 206E050C */  jal         SndSPSePlay__Fii
/* 0D3F78 001D3E78 00000000 */   nop
/* 0D3F7C 001D3E7C 7094828F */  lw          $2, -0x6B90($28)
/* 0D3F80 001D3E80 01004224 */  addiu       $2, $2, 0x1
/* 0D3F84 001D3E84 709482AF */  sw          $2, -0x6B90($28)
.L001D3E88:
/* 0D3F88 001D3E88 5CFA760C */  jal         autoCamTrial__Fv
/* 0D3F8C 001D3E8C 00000000 */   nop
/* 0D3F90 001D3E90 08000010 */  b           .L001D3EB4
/* 0D3F94 001D3E94 00000000 */   nop
.L001D3E98:
/* 0D3F98 001D3E98 0426060C */  jal         EdFadeOutCheck__Fv
/* 0D3F9C 001D3E9C 00000000 */   nop
/* 0D3FA0 001D3EA0 02004010 */  beqz        $2, .L001D3EAC
/* 0D3FA4 001D3EA4 00000000 */   nop
/* 0D3FA8 001D3EA8 01001024 */  addiu       $16, $0, 0x1
.L001D3EAC:
/* 0D3FAC 001D3EAC 5CFA760C */  jal         autoCamTrial__Fv
/* 0D3FB0 001D3EB0 00000000 */   nop
.L001D3EB4:
/* 0D3FB4 001D3EB4 28160072 */  paddub      $2, $16, $0
/* 0D3FB8 001D3EB8 1000BF7B */  lq          $31, 0x10($29)
/* 0D3FBC 001D3EBC 0000B07B */  lq          $16, 0x0($29)
/* 0D3FC0 001D3EC0 4000BD27 */  addiu       $29, $29, 0x40
/* 0D3FC4 001D3EC4 0800E003 */  jr          $31
/* 0D3FC8 001D3EC8 00000000 */   nop
/* 0D3FCC 001D3ECC 00000000 */  nop
