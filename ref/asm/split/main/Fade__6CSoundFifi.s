.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Fade__6CSoundFifi
/* 045CF0 00145BF0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 045CF4 00145BF4 0000BF7F */  sq          $31, 0x0($29)
/* 045CF8 00145BF8 0B000324 */  addiu       $3, $0, 0xB
/* 045CFC 00145BFC B000A310 */  beq         $5, $3, .L00145EC0
/* 045D00 00145C00 00000000 */   nop
/* 045D04 00145C04 0C000324 */  addiu       $3, $0, 0xC
/* 045D08 00145C08 9A00A310 */  beq         $5, $3, .L00145E74
/* 045D0C 00145C0C 00000000 */   nop
/* 045D10 00145C10 0D000324 */  addiu       $3, $0, 0xD
/* 045D14 00145C14 8400A310 */  beq         $5, $3, .L00145E28
/* 045D18 00145C18 00000000 */   nop
/* 045D1C 00145C1C 0A000324 */  addiu       $3, $0, 0xA
/* 045D20 00145C20 6E00A310 */  beq         $5, $3, .L00145DDC
/* 045D24 00145C24 00000000 */   nop
/* 045D28 00145C28 0E000324 */  addiu       $3, $0, 0xE
/* 045D2C 00145C2C 5800A310 */  beq         $5, $3, .L00145D90
/* 045D30 00145C30 00000000 */   nop
/* 045D34 00145C34 0F000324 */  addiu       $3, $0, 0xF
/* 045D38 00145C38 4200A310 */  beq         $5, $3, .L00145D44
/* 045D3C 00145C3C 00000000 */   nop
/* 045D40 00145C40 02000324 */  addiu       $3, $0, 0x2
/* 045D44 00145C44 2C00A310 */  beq         $5, $3, .L00145CF8
/* 045D48 00145C48 00000000 */   nop
/* 045D4C 00145C4C 01000324 */  addiu       $3, $0, 0x1
/* 045D50 00145C50 1700A310 */  beq         $5, $3, .L00145CB0
/* 045D54 00145C54 00000000 */   nop
/* 045D58 00145C58 0300A010 */  beqz        $5, .L00145C68
/* 045D5C 00145C5C 00000000 */   nop
/* 045D60 00145C60 A8000010 */  b           .L00145F04
/* 045D64 00145C64 00000000 */   nop
.L00145C68:
/* 045D68 00145C68 CF01013C */  lui         $1, %hi(midi_state + 0x5C)
/* 045D6C 00145C6C 9C8223AC */  sw          $3, %lo(midi_state + 0x5C)($1)
/* 045D70 00145C70 CF01013C */  lui         $1, %hi(midi_state + 0x60)
/* 045D74 00145C74 A08226AC */  sw          $6, %lo(midi_state + 0x60)($1)
/* 045D78 00145C78 CF01013C */  lui         $1, %hi(midi_state + 0x68)
/* 045D7C 00145C7C A8822CE4 */  swc1        $f12, %lo(midi_state + 0x68)($1)
/* 045D80 00145C80 FF7FA224 */  addiu       $2, $5, 0x7FFF
/* 045D84 00145C84 E1004424 */  addiu       $4, $2, 0xE1
/* 045D88 00145C88 282E0070 */  paddub      $5, $0, $0
/* 045D8C 00145C8C 801E050C */  jal         ezMidi__Fii
/* 045D90 00145C90 00000000 */   nop
/* 045D94 00145C94 00008244 */  mtc1        $2, $f0
/* 045D98 00145C98 00000000 */  nop
/* 045D9C 00145C9C 20008046 */  cvt.s.w     $f0, $f0
/* 045DA0 00145CA0 CF01013C */  lui         $1, %hi(midi_state + 0x64)
/* 045DA4 00145CA4 A48220E4 */  swc1        $f0, %lo(midi_state + 0x64)($1)
/* 045DA8 00145CA8 96000010 */  b           .L00145F04
/* 045DAC 00145CAC 00000000 */   nop
.L00145CB0:
/* 045DB0 00145CB0 CF01013C */  lui         $1, %hi(midi_state + 0x15C)
/* 045DB4 00145CB4 9C8323AC */  sw          $3, %lo(midi_state + 0x15C)($1)
/* 045DB8 00145CB8 CF01013C */  lui         $1, %hi(midi_state + 0x160)
/* 045DBC 00145CBC A08326AC */  sw          $6, %lo(midi_state + 0x160)($1)
/* 045DC0 00145CC0 CF01013C */  lui         $1, %hi(midi_state + 0x168)
/* 045DC4 00145CC4 A8832CE4 */  swc1        $f12, %lo(midi_state + 0x168)($1)
/* 045DC8 00145CC8 FF7FA224 */  addiu       $2, $5, 0x7FFF
/* 045DCC 00145CCC E1004424 */  addiu       $4, $2, 0xE1
/* 045DD0 00145CD0 282E0070 */  paddub      $5, $0, $0
/* 045DD4 00145CD4 801E050C */  jal         ezMidi__Fii
/* 045DD8 00145CD8 00000000 */   nop
/* 045DDC 00145CDC 00008244 */  mtc1        $2, $f0
/* 045DE0 00145CE0 00000000 */  nop
/* 045DE4 00145CE4 20008046 */  cvt.s.w     $f0, $f0
/* 045DE8 00145CE8 CF01013C */  lui         $1, %hi(midi_state + 0x164)
/* 045DEC 00145CEC A48320E4 */  swc1        $f0, %lo(midi_state + 0x164)($1)
/* 045DF0 00145CF0 84000010 */  b           .L00145F04
/* 045DF4 00145CF4 00000000 */   nop
.L00145CF8:
/* 045DF8 00145CF8 01000224 */  addiu       $2, $0, 0x1
/* 045DFC 00145CFC CF01013C */  lui         $1, %hi(midi_state + 0x25C)
/* 045E00 00145D00 9C8422AC */  sw          $2, %lo(midi_state + 0x25C)($1)
/* 045E04 00145D04 CF01013C */  lui         $1, %hi(midi_state + 0x260)
/* 045E08 00145D08 A08426AC */  sw          $6, %lo(midi_state + 0x260)($1)
/* 045E0C 00145D0C CF01013C */  lui         $1, %hi(midi_state + 0x268)
/* 045E10 00145D10 A8842CE4 */  swc1        $f12, %lo(midi_state + 0x268)($1)
/* 045E14 00145D14 FF7FA224 */  addiu       $2, $5, 0x7FFF
/* 045E18 00145D18 E1004424 */  addiu       $4, $2, 0xE1
/* 045E1C 00145D1C 282E0070 */  paddub      $5, $0, $0
/* 045E20 00145D20 801E050C */  jal         ezMidi__Fii
/* 045E24 00145D24 00000000 */   nop
/* 045E28 00145D28 00008244 */  mtc1        $2, $f0
/* 045E2C 00145D2C 00000000 */  nop
/* 045E30 00145D30 20008046 */  cvt.s.w     $f0, $f0
/* 045E34 00145D34 CF01013C */  lui         $1, %hi(midi_state + 0x264)
/* 045E38 00145D38 A48420E4 */  swc1        $f0, %lo(midi_state + 0x264)($1)
/* 045E3C 00145D3C 71000010 */  b           .L00145F04
/* 045E40 00145D40 00000000 */   nop
.L00145D44:
/* 045E44 00145D44 01000224 */  addiu       $2, $0, 0x1
/* 045E48 00145D48 CF01013C */  lui         $1, %hi(midi_state + 0xEC)
/* 045E4C 00145D4C 2C8322AC */  sw          $2, %lo(midi_state + 0xEC)($1)
/* 045E50 00145D50 CF01013C */  lui         $1, %hi(midi_state + 0xF0)
/* 045E54 00145D54 308326AC */  sw          $6, %lo(midi_state + 0xF0)($1)
/* 045E58 00145D58 CF01013C */  lui         $1, %hi(midi_state + 0xF8)
/* 045E5C 00145D5C 38832CE4 */  swc1        $f12, %lo(midi_state + 0xF8)($1)
/* 045E60 00145D60 FF7FA224 */  addiu       $2, $5, 0x7FFF
/* 045E64 00145D64 E1004424 */  addiu       $4, $2, 0xE1
/* 045E68 00145D68 282E0070 */  paddub      $5, $0, $0
/* 045E6C 00145D6C 801E050C */  jal         ezMidi__Fii
/* 045E70 00145D70 00000000 */   nop
/* 045E74 00145D74 00008244 */  mtc1        $2, $f0
/* 045E78 00145D78 00000000 */  nop
/* 045E7C 00145D7C 20008046 */  cvt.s.w     $f0, $f0
/* 045E80 00145D80 CF01013C */  lui         $1, %hi(midi_state + 0xF4)
/* 045E84 00145D84 348320E4 */  swc1        $f0, %lo(midi_state + 0xF4)($1)
/* 045E88 00145D88 5E000010 */  b           .L00145F04
/* 045E8C 00145D8C 00000000 */   nop
.L00145D90:
/* 045E90 00145D90 01000224 */  addiu       $2, $0, 0x1
/* 045E94 00145D94 CF01013C */  lui         $1, %hi(midi_state + 0x26C)
/* 045E98 00145D98 AC8422AC */  sw          $2, %lo(midi_state + 0x26C)($1)
/* 045E9C 00145D9C CF01013C */  lui         $1, %hi(midi_state + 0x270)
/* 045EA0 00145DA0 B08426AC */  sw          $6, %lo(midi_state + 0x270)($1)
/* 045EA4 00145DA4 CF01013C */  lui         $1, %hi(midi_state + 0x278)
/* 045EA8 00145DA8 B8842CE4 */  swc1        $f12, %lo(midi_state + 0x278)($1)
/* 045EAC 00145DAC FF7FA224 */  addiu       $2, $5, 0x7FFF
/* 045EB0 00145DB0 E1004424 */  addiu       $4, $2, 0xE1
/* 045EB4 00145DB4 282E0070 */  paddub      $5, $0, $0
/* 045EB8 00145DB8 801E050C */  jal         ezMidi__Fii
/* 045EBC 00145DBC 00000000 */   nop
/* 045EC0 00145DC0 00008244 */  mtc1        $2, $f0
/* 045EC4 00145DC4 00000000 */  nop
/* 045EC8 00145DC8 20008046 */  cvt.s.w     $f0, $f0
/* 045ECC 00145DCC CF01013C */  lui         $1, %hi(midi_state + 0x274)
/* 045ED0 00145DD0 B48420E4 */  swc1        $f0, %lo(midi_state + 0x274)($1)
/* 045ED4 00145DD4 4B000010 */  b           .L00145F04
/* 045ED8 00145DD8 00000000 */   nop
.L00145DDC:
/* 045EDC 00145DDC 01000224 */  addiu       $2, $0, 0x1
/* 045EE0 00145DE0 CF01013C */  lui         $1, %hi(midi_state + 0x1EC)
/* 045EE4 00145DE4 2C8422AC */  sw          $2, %lo(midi_state + 0x1EC)($1)
/* 045EE8 00145DE8 CF01013C */  lui         $1, %hi(midi_state + 0x1F0)
/* 045EEC 00145DEC 308426AC */  sw          $6, %lo(midi_state + 0x1F0)($1)
/* 045EF0 00145DF0 CF01013C */  lui         $1, %hi(midi_state + 0x1F8)
/* 045EF4 00145DF4 38842CE4 */  swc1        $f12, %lo(midi_state + 0x1F8)($1)
/* 045EF8 00145DF8 FF7FA224 */  addiu       $2, $5, 0x7FFF
/* 045EFC 00145DFC E1004424 */  addiu       $4, $2, 0xE1
/* 045F00 00145E00 282E0070 */  paddub      $5, $0, $0
/* 045F04 00145E04 801E050C */  jal         ezMidi__Fii
/* 045F08 00145E08 00000000 */   nop
/* 045F0C 00145E0C 00008244 */  mtc1        $2, $f0
/* 045F10 00145E10 00000000 */  nop
/* 045F14 00145E14 20008046 */  cvt.s.w     $f0, $f0
/* 045F18 00145E18 CF01013C */  lui         $1, %hi(midi_state + 0x1F4)
/* 045F1C 00145E1C 348420E4 */  swc1        $f0, %lo(midi_state + 0x1F4)($1)
/* 045F20 00145E20 38000010 */  b           .L00145F04
/* 045F24 00145E24 00000000 */   nop
.L00145E28:
/* 045F28 00145E28 01000224 */  addiu       $2, $0, 0x1
/* 045F2C 00145E2C CF01013C */  lui         $1, %hi(midi_state + 0x2EC)
/* 045F30 00145E30 2C8522AC */  sw          $2, %lo(midi_state + 0x2EC)($1)
/* 045F34 00145E34 CF01013C */  lui         $1, %hi(midi_state + 0x2F0)
/* 045F38 00145E38 308526AC */  sw          $6, %lo(midi_state + 0x2F0)($1)
/* 045F3C 00145E3C CF01013C */  lui         $1, %hi(midi_state + 0x2F8)
/* 045F40 00145E40 38852CE4 */  swc1        $f12, %lo(midi_state + 0x2F8)($1)
/* 045F44 00145E44 FF7FA224 */  addiu       $2, $5, 0x7FFF
/* 045F48 00145E48 E1004424 */  addiu       $4, $2, 0xE1
/* 045F4C 00145E4C 282E0070 */  paddub      $5, $0, $0
/* 045F50 00145E50 801E050C */  jal         ezMidi__Fii
/* 045F54 00145E54 00000000 */   nop
/* 045F58 00145E58 00008244 */  mtc1        $2, $f0
/* 045F5C 00145E5C 00000000 */  nop
/* 045F60 00145E60 20008046 */  cvt.s.w     $f0, $f0
/* 045F64 00145E64 CF01013C */  lui         $1, %hi(midi_state + 0x2F4)
/* 045F68 00145E68 348520E4 */  swc1        $f0, %lo(midi_state + 0x2F4)($1)
/* 045F6C 00145E6C 25000010 */  b           .L00145F04
/* 045F70 00145E70 00000000 */   nop
.L00145E74:
/* 045F74 00145E74 01000224 */  addiu       $2, $0, 0x1
/* 045F78 00145E78 CF01013C */  lui         $1, %hi(midi_state + 0x36C)
/* 045F7C 00145E7C AC8522AC */  sw          $2, %lo(midi_state + 0x36C)($1)
/* 045F80 00145E80 CF01013C */  lui         $1, %hi(midi_state + 0x370)
/* 045F84 00145E84 B08526AC */  sw          $6, %lo(midi_state + 0x370)($1)
/* 045F88 00145E88 CF01013C */  lui         $1, %hi(midi_state + 0x378)
/* 045F8C 00145E8C B8852CE4 */  swc1        $f12, %lo(midi_state + 0x378)($1)
/* 045F90 00145E90 FF7FA224 */  addiu       $2, $5, 0x7FFF
/* 045F94 00145E94 E1004424 */  addiu       $4, $2, 0xE1
/* 045F98 00145E98 282E0070 */  paddub      $5, $0, $0
/* 045F9C 00145E9C 801E050C */  jal         ezMidi__Fii
/* 045FA0 00145EA0 00000000 */   nop
/* 045FA4 00145EA4 00008244 */  mtc1        $2, $f0
/* 045FA8 00145EA8 00000000 */  nop
/* 045FAC 00145EAC 20008046 */  cvt.s.w     $f0, $f0
/* 045FB0 00145EB0 CF01013C */  lui         $1, %hi(midi_state + 0x374)
/* 045FB4 00145EB4 B48520E4 */  swc1        $f0, %lo(midi_state + 0x374)($1)
/* 045FB8 00145EB8 12000010 */  b           .L00145F04
/* 045FBC 00145EBC 00000000 */   nop
.L00145EC0:
/* 045FC0 00145EC0 01000224 */  addiu       $2, $0, 0x1
/* 045FC4 00145EC4 CF01013C */  lui         $1, %hi(midi_state + 0x3EC)
/* 045FC8 00145EC8 2C8622AC */  sw          $2, %lo(midi_state + 0x3EC)($1)
/* 045FCC 00145ECC CF01013C */  lui         $1, %hi(midi_state + 0x3F0)
/* 045FD0 00145ED0 308626AC */  sw          $6, %lo(midi_state + 0x3F0)($1)
/* 045FD4 00145ED4 CF01013C */  lui         $1, %hi(midi_state + 0x3F8)
/* 045FD8 00145ED8 38862CE4 */  swc1        $f12, %lo(midi_state + 0x3F8)($1)
/* 045FDC 00145EDC FF7FA224 */  addiu       $2, $5, 0x7FFF
/* 045FE0 00145EE0 E1004424 */  addiu       $4, $2, 0xE1
/* 045FE4 00145EE4 282E0070 */  paddub      $5, $0, $0
/* 045FE8 00145EE8 801E050C */  jal         ezMidi__Fii
/* 045FEC 00145EEC 00000000 */   nop
/* 045FF0 00145EF0 00008244 */  mtc1        $2, $f0
/* 045FF4 00145EF4 00000000 */  nop
/* 045FF8 00145EF8 20008046 */  cvt.s.w     $f0, $f0
/* 045FFC 00145EFC CF01013C */  lui         $1, %hi(midi_state + 0x3F4)
/* 046000 00145F00 348620E4 */  swc1        $f0, %lo(midi_state + 0x3F4)($1)
.L00145F04:
/* 046004 00145F04 0000BF7B */  lq          $31, 0x0($29)
/* 046008 00145F08 1000BD27 */  addiu       $29, $29, 0x10
/* 04600C 00145F0C 0800E003 */  jr          $31
/* 046010 00145F10 00000000 */   nop
/* 046014 00145F14 00000000 */  nop
/* 046018 00145F18 00000000 */  nop
/* 04601C 00145F1C 00000000 */  nop
