.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BtEscape_Loop__Fv
/* D3E40 001D3D40 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* D3E44 001D3D44 1000BF7F */  sq         $31, 0x10($sp)
/* D3E48 001D3D48 0000B07F */  sq         $16, 0x0($sp)
/* D3E4C 001D3D4C 28860070 */  paddub     $16, $0, $0
/* D3E50 001D3D50 7094838F */  lw         $3, -0x6B90($gp)
/* D3E54 001D3D54 01000224 */  addiu      $2, $0, 0x1
/* D3E58 001D3D58 4F006210 */  beq        $3, $2, .L001D3E98
/* D3E5C 001D3D5C 00000000 */   nop
/* D3E60 001D3D60 03006010 */  beqz       $3, .L001D3D70
/* D3E64 001D3D64 00000000 */   nop
/* D3E68 001D3D68 52000010 */  b          .L001D3EB4
/* D3E6C 001D3D6C 00000000 */   nop
.L001D3D70:
/* D3E70 001D3D70 006E050C */  jal        SndSPSeSyncBG__Fv
/* D3E74 001D3D74 00000000 */   nop
/* D3E78 001D3D78 43004014 */  bnez       $2, .L001D3E88
/* D3E7C 001D3D7C 00000000 */   nop
/* D3E80 001D3D80 8CFB040C */  jal        ReadBGSync__Fv
/* D3E84 001D3D84 00000000 */   nop
/* D3E88 001D3D88 3F004014 */  bnez       $2, .L001D3E88
/* D3E8C 001D3D8C 00000000 */   nop
/* D3E90 001D3D90 6C94858F */  lw         $5, -0x6B94($gp)
/* D3E94 001D3D94 EB01023C */  lui        $2, %hi(D_1EB2900)
/* D3E98 001D3D98 00294424 */  addiu      $4, $2, %lo(D_1EB2900)
/* D3E9C 001D3D9C 2A00023C */  lui        $2, %hi(_902)
/* D3EA0 001D3DA0 F8C64624 */  addiu      $6, $2, %lo(_902)
/* D3EA4 001D3DA4 F001023C */  lui        $2, %hi(D_1F06850)
/* D3EA8 001D3DA8 50684724 */  addiu      $7, $2, %lo(D_1F06850)
/* D3EAC 001D3DAC 1C000824 */  addiu      $8, $0, 0x1C
/* D3EB0 001D3DB0 F001023C */  lui        $2, %hi(D_1F06850)
/* D3EB4 001D3DB4 50684924 */  addiu      $9, $2, %lo(D_1F06850)
/* D3EB8 001D3DB8 28560070 */  paddub     $10, $0, $0
/* D3EBC 001D3DBC 14E6040C */  jal        LoadPackData2__10CCharacterFPUiPcP14CDataAlloc2_1_iP14CDataAlloc2_1_i
/* D3EC0 001D3DC0 00000000 */   nop
/* D3EC4 001D3DC4 EB01013C */  lui        $at, (0x1EB3568 >> 16)
/* D3EC8 001D3DC8 683520AC */  sw         $0, (0x1EB3568 & 0xFFFF)($at)
/* D3ECC 001D3DCC 06000224 */  addiu      $2, $0, 0x6
/* D3ED0 001D3DD0 EB01013C */  lui        $at, (0x1EB3564 >> 16)
/* D3ED4 001D3DD4 643522AC */  sw         $2, (0x1EB3564 & 0xFFFF)($at)
/* D3ED8 001D3DD8 80BF023C */  lui        $2, (0xBF800000 >> 16)
/* D3EDC 001D3DDC EB01013C */  lui        $at, (0x1EB3560 >> 16)
/* D3EE0 001D3DE0 603522AC */  sw         $2, (0x1EB3560 & 0xFFFF)($at)
/* D3EE4 001D3DE4 2041023C */  lui        $2, (0x41200000 >> 16)
/* D3EE8 001D3DE8 EB01013C */  lui        $at, (0x1EB2BF0 >> 16)
/* D3EEC 001D3DEC F02B22AC */  sw         $2, (0x1EB2BF0 & 0xFFFF)($at)
/* D3EF0 001D3DF0 01000224 */  addiu      $2, $0, 0x1
/* D3EF4 001D3DF4 189D82AF */  sw         $2, -0x62E8($gp)
/* D3EF8 001D3DF8 2000A427 */  addiu      $4, $sp, 0x20
/* D3EFC 001D3DFC EA01023C */  lui        $2, %hi(D_1EA1D30)
/* D3F00 001D3E00 301D4524 */  addiu      $5, $2, %lo(D_1EA1D30)
/* D3F04 001D3E04 0C86040C */  jal        sceVu0CopyVector
/* D3F08 001D3E08 00000000 */   nop
/* D3F0C 001D3E0C EA01023C */  lui        $2, %hi(D_1EA1D20)
/* D3F10 001D3E10 201D4424 */  addiu      $4, $2, %lo(D_1EA1D20)
/* D3F14 001D3E14 3000A527 */  addiu      $5, $sp, 0x30
/* D3F18 001D3E18 BC5B050C */  jal        GetRotation__7CObjectFPf
/* D3F1C 001D3E1C 00000000 */   nop
/* D3F20 001D3E20 EB01023C */  lui        $2, %hi(D_1EB2900)
/* D3F24 001D3E24 00294424 */  addiu      $4, $2, %lo(D_1EB2900)
/* D3F28 001D3E28 2000A527 */  addiu      $5, $sp, 0x20
/* D3F2C 001D3E2C 38E4040C */  jal        SetPosition__10CCharacterFPf
/* D3F30 001D3E30 00000000 */   nop
/* D3F34 001D3E34 EB01023C */  lui        $2, %hi(D_1EB2900)
/* D3F38 001D3E38 00294424 */  addiu      $4, $2, %lo(D_1EB2900)
/* D3F3C 001D3E3C 3000A527 */  addiu      $5, $sp, 0x30
/* D3F40 001D3E40 78E4040C */  jal        SetRotation__10CCharacterFPf
/* D3F44 001D3E44 00000000 */   nop
/* D3F48 001D3E48 B425060C */  jal        EdFadeInit__Fv
/* D3F4C 001D3E4C 00000000 */   nop
/* D3F50 001D3E50 00688044 */  mtc1       $0, $f13
/* D3F54 001D3E54 00000000 */  nop
/* D3F58 001D3E58 866B0046 */  mov.s      $f14, $f13
/* D3F5C 001D3E5C 066B0046 */  mov.s      $f12, $f13
/* D3F60 001D3E60 78000424 */  addiu      $4, $0, 0x78
/* D3F64 001D3E64 E425060C */  jal        EdFadeOut__Fifff
/* D3F68 001D3E68 00000000 */   nop
/* D3F6C 001D3E6C 08000424 */  addiu      $4, $0, 0x8
/* D3F70 001D3E70 FFFF0524 */  addiu      $5, $0, -0x1
/* D3F74 001D3E74 206E050C */  jal        SndSPSePlay__Fii
/* D3F78 001D3E78 00000000 */   nop
/* D3F7C 001D3E7C 7094828F */  lw         $2, -0x6B90($gp)
/* D3F80 001D3E80 01004224 */  addiu      $2, $2, 0x1
/* D3F84 001D3E84 709482AF */  sw         $2, -0x6B90($gp)
.L001D3E88:
/* D3F88 001D3E88 5CFA760C */  jal        func_1DBE970
/* D3F8C 001D3E8C 00000000 */   nop
/* D3F90 001D3E90 08000010 */  b          .L001D3EB4
/* D3F94 001D3E94 00000000 */   nop
.L001D3E98:
/* D3F98 001D3E98 0426060C */  jal        EdFadeOutCheck__Fv
/* D3F9C 001D3E9C 00000000 */   nop
/* D3FA0 001D3EA0 02004010 */  beqz       $2, .L001D3EAC
/* D3FA4 001D3EA4 00000000 */   nop
/* D3FA8 001D3EA8 01001024 */  addiu      $16, $0, 0x1
.L001D3EAC:
/* D3FAC 001D3EAC 5CFA760C */  jal        func_1DBE970
/* D3FB0 001D3EB0 00000000 */   nop
.L001D3EB4:
/* D3FB4 001D3EB4 28160072 */  paddub     $2, $16, $0
/* D3FB8 001D3EB8 1000BF7B */  lq         $31, 0x10($sp)
/* D3FBC 001D3EBC 0000B07B */  lq         $16, 0x0($sp)
/* D3FC0 001D3EC0 4000BD27 */  addiu      $sp, $sp, 0x40
/* D3FC4 001D3EC4 0800E003 */  jr         $31
/* D3FC8 001D3EC8 00000000 */   nop
/* D3FCC 001D3ECC 00000000 */  nop
