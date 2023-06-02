.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetStatus_Dry__14CDngMessageManFfff
/* B5D30 001B5C30 808080C7 */  lwc1       $f0, -0x7F80($gp)
/* B5D34 001B5C34 82000C46 */  mul.s      $f2, $f0, $f12
/* B5D38 001B5C38 34100E46 */  c.lt.s     $f2, $f14
/* B5D3C 001B5C3C 00000000 */  nop
/* B5D40 001B5C40 07000045 */  bc1f       .L001B5C60
/* B5D44 001B5C44 00000000 */   nop
/* B5D48 001B5C48 2400858C */  lw         $5, 0x24($4)
/* B5D4C 001B5C4C AA000324 */  addiu      $3, $0, 0xAA
/* B5D50 001B5C50 0300A314 */  bne        $5, $3, .L001B5C60
/* B5D54 001B5C54 00000000 */   nop
/* B5D58 001B5C58 FFFF0324 */  addiu      $3, $0, -0x1
/* B5D5C 001B5C5C 240083AC */  sw         $3, 0x24($4)
.L001B5C60:
/* B5D60 001B5C60 00008044 */  mtc1       $0, $f0
/* B5D64 001B5C64 00000000 */  nop
/* B5D68 001B5C68 34000E46 */  c.lt.s     $f0, $f14
/* B5D6C 001B5C6C 00000000 */  nop
/* B5D70 001B5C70 07000045 */  bc1f       .L001B5C90
/* B5D74 001B5C74 00000000 */   nop
/* B5D78 001B5C78 2400858C */  lw         $5, 0x24($4)
/* B5D7C 001B5C7C AB000324 */  addiu      $3, $0, 0xAB
/* B5D80 001B5C80 0300A314 */  bne        $5, $3, .L001B5C90
/* B5D84 001B5C84 00000000 */   nop
/* B5D88 001B5C88 FFFF0324 */  addiu      $3, $0, -0x1
/* B5D8C 001B5C8C 240083AC */  sw         $3, 0x24($4)
.L001B5C90:
/* B5D90 001B5C90 003F033C */  lui        $3, (0x3F000000 >> 16)
/* B5D94 001B5C94 00088344 */  mtc1       $3, $f1
/* B5D98 001B5C98 00000000 */  nop
/* B5D9C 001B5C9C 00080D46 */  add.s      $f0, $f1, $f13
/* B5DA0 001B5CA0 36100046 */  c.le.s     $f2, $f0
/* B5DA4 001B5CA4 00000000 */  nop
/* B5DA8 001B5CA8 0F000045 */  bc1f       .L001B5CE8
/* B5DAC 001B5CAC 00000000 */   nop
/* B5DB0 001B5CB0 01700146 */  sub.s      $f0, $f14, $f1
/* B5DB4 001B5CB4 36100046 */  c.le.s     $f2, $f0
/* B5DB8 001B5CB8 00000000 */  nop
/* B5DBC 001B5CBC 0A000145 */  bc1t       .L001B5CE8
/* B5DC0 001B5CC0 00000000 */   nop
/* B5DC4 001B5CC4 2400858C */  lw         $5, 0x24($4)
/* B5DC8 001B5CC8 FFFF0324 */  addiu      $3, $0, -0x1
/* B5DCC 001B5CCC 0600A314 */  bne        $5, $3, .L001B5CE8
/* B5DD0 001B5CD0 00000000 */   nop
/* B5DD4 001B5CD4 AA000324 */  addiu      $3, $0, 0xAA
/* B5DD8 001B5CD8 240083AC */  sw         $3, 0x24($4)
/* B5DDC 001B5CDC F0000324 */  addiu      $3, $0, 0xF0
/* B5DE0 001B5CE0 040083AC */  sw         $3, 0x4($4)
/* B5DE4 001B5CE4 1C0080AC */  sw         $0, 0x1C($4)
.L001B5CE8:
/* B5DE8 001B5CE8 00008044 */  mtc1       $0, $f0
/* B5DEC 001B5CEC 00000000 */  nop
/* B5DF0 001B5CF0 36700046 */  c.le.s     $f14, $f0
/* B5DF4 001B5CF4 00000000 */  nop
/* B5DF8 001B5CF8 0E000045 */  bc1f       .L001B5D34
/* B5DFC 001B5CFC 00000000 */   nop
/* B5E00 001B5D00 2400858C */  lw         $5, 0x24($4)
/* B5E04 001B5D04 FFFF0324 */  addiu      $3, $0, -0x1
/* B5E08 001B5D08 0400A310 */  beq        $5, $3, .L001B5D1C
/* B5E0C 001B5D0C 00000000 */   nop
/* B5E10 001B5D10 AB000324 */  addiu      $3, $0, 0xAB
/* B5E14 001B5D14 0700A314 */  bne        $5, $3, .L001B5D34
/* B5E18 001B5D18 00000000 */   nop
.L001B5D1C:
/* B5E1C 001B5D1C AB000324 */  addiu      $3, $0, 0xAB
/* B5E20 001B5D20 240083AC */  sw         $3, 0x24($4)
/* B5E24 001B5D24 0900033C */  lui        $3, (0x9FFF6 >> 16)
/* B5E28 001B5D28 F6FF6334 */  ori        $3, $3, (0x9FFF6 & 0xFFFF)
/* B5E2C 001B5D2C 040083AC */  sw         $3, 0x4($4)
/* B5E30 001B5D30 1C0080AC */  sw         $0, 0x1C($4)
.L001B5D34:
/* B5E34 001B5D34 0800E003 */  jr         $31
/* B5E38 001B5D38 00000000 */   nop
/* B5E3C 001B5D3C 00000000 */  nop
