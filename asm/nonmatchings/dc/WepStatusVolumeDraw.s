.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WepStatusVolumeDraw__F4RECTiPiiiii
/* F9D20 001F9C20 30FFBD27 */  addiu      $sp, $sp, -0xD0
/* F9D24 001F9C24 9000BF7F */  sq         $31, 0x90($sp)
/* F9D28 001F9C28 8000B77F */  sq         $23, 0x80($sp)
/* F9D2C 001F9C2C 7000B67F */  sq         $22, 0x70($sp)
/* F9D30 001F9C30 6000B57F */  sq         $21, 0x60($sp)
/* F9D34 001F9C34 5000B47F */  sq         $20, 0x50($sp)
/* F9D38 001F9C38 4000B37F */  sq         $19, 0x40($sp)
/* F9D3C 001F9C3C 3000B27F */  sq         $18, 0x30($sp)
/* F9D40 001F9C40 2000B17F */  sq         $17, 0x20($sp)
/* F9D44 001F9C44 1000B07F */  sq         $16, 0x10($sp)
/* F9D48 001F9C48 28AEA070 */  paddub     $21, $5, $0
/* F9D4C 001F9C4C 28A6C070 */  paddub     $20, $6, $0
/* F9D50 001F9C50 289EE070 */  paddub     $19, $7, $0
/* F9D54 001F9C54 28960071 */  paddub     $18, $8, $0
/* F9D58 001F9C58 28B62071 */  paddub     $22, $9, $0
/* F9D5C 001F9C5C 28BE4071 */  paddub     $23, $10, $0
/* F9D60 001F9C60 A000A227 */  addiu      $2, $sp, 0xA0
/* F9D64 001F9C64 000083C4 */  lwc1       $f3, 0x0($4)
/* F9D68 001F9C68 040082C4 */  lwc1       $f2, 0x4($4)
/* F9D6C 001F9C6C 080081C4 */  lwc1       $f1, 0x8($4)
/* F9D70 001F9C70 0C0080C4 */  lwc1       $f0, 0xC($4)
/* F9D74 001F9C74 000043E4 */  swc1       $f3, 0x0($2)
/* F9D78 001F9C78 040042E4 */  swc1       $f2, 0x4($2)
/* F9D7C 001F9C7C 080041E4 */  swc1       $f1, 0x8($2)
/* F9D80 001F9C80 0C0040E4 */  swc1       $f0, 0xC($2)
/* F9D84 001F9C84 A400B08F */  lw         $16, 0xA4($sp)
/* F9D88 001F9C88 0400C28C */  lw         $2, 0x4($6)
/* F9D8C 001F9C8C 18105500 */  mult       $2, $2, $21
/* F9D90 001F9C90 00008244 */  mtc1       $2, $f0
/* F9D94 001F9C94 00000000 */  nop
/* F9D98 001F9C98 60008046 */  cvt.s.w    $f1, $f0
/* F9D9C 001F9C9C 0000C0C4 */  lwc1       $f0, 0x0($6)
/* F9DA0 001F9CA0 20008046 */  cvt.s.w    $f0, $f0
/* F9DA4 001F9CA4 030B0046 */  div.s      $f12, $f1, $f0
/* F9DA8 001F9CA8 2C44040C */  jal        fptosi
/* F9DAC 001F9CAC 00000000 */   nop
/* F9DB0 001F9CB0 288E4070 */  paddub     $17, $2, $0
/* F9DB4 001F9CB4 2A08B102 */  slt        $at, $21, $17
/* F9DB8 001F9CB8 02002010 */  beqz       $at, .L001F9CC4
/* F9DBC 001F9CBC 00000000 */   nop
/* F9DC0 001F9CC0 288EA072 */  paddub     $17, $21, $0
.L001F9CC4:
/* F9DC4 001F9CC4 28266072 */  paddub     $4, $19, $0
/* F9DC8 001F9CC8 B8CF070C */  jal        GetGradationColorInfo2__Fi
/* F9DCC 001F9CCC 00000000 */   nop
/* F9DD0 001F9CD0 B000A427 */  addiu      $4, $sp, 0xB0
/* F9DD4 001F9CD4 282E4070 */  paddub     $5, $2, $0
/* F9DD8 001F9CD8 10000624 */  addiu      $6, $0, 0x10
/* F9DDC 001F9CDC EC0C040C */  jal        memcpy
/* F9DE0 001F9CE0 00000000 */   nop
/* F9DE4 001F9CE4 BF00B2A3 */  sb         $18, 0xBF($sp)
/* F9DE8 001F9CE8 BB00B2A3 */  sb         $18, 0xBB($sp)
/* F9DEC 001F9CEC B700B2A3 */  sb         $18, 0xB7($sp)
/* F9DF0 001F9CF0 B300B2A3 */  sb         $18, 0xB3($sp)
/* F9DF4 001F9CF4 A000A28F */  lw         $2, 0xA0($sp)
/* F9DF8 001F9CF8 C000A2AF */  sw         $2, 0xC0($sp)
/* F9DFC 001F9CFC C400B0AF */  sw         $16, 0xC4($sp)
/* F9E00 001F9D00 C800B1AF */  sw         $17, 0xC8($sp)
/* F9E04 001F9D04 08000224 */  addiu      $2, $0, 0x8
/* F9E08 001F9D08 CC00A2AF */  sw         $2, 0xCC($sp)
/* F9E0C 001F9D0C C000A427 */  addiu      $4, $sp, 0xC0
/* F9E10 001F9D10 B000A527 */  addiu      $5, $sp, 0xB0
/* F9E14 001F9D14 B400A627 */  addiu      $6, $sp, 0xB4
/* F9E18 001F9D18 B800A727 */  addiu      $7, $sp, 0xB8
/* F9E1C 001F9D1C BC00A827 */  addiu      $8, $sp, 0xBC
/* F9E20 001F9D20 F4B4080C */  jal        DrawMenuColorGradation__FR8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBA
/* F9E24 001F9D24 00000000 */   nop
/* F9E28 001F9D28 0800828E */  lw         $2, 0x8($20)
/* F9E2C 001F9D2C 18105500 */  mult       $2, $2, $21
/* F9E30 001F9D30 00008244 */  mtc1       $2, $f0
/* F9E34 001F9D34 00000000 */  nop
/* F9E38 001F9D38 60008046 */  cvt.s.w    $f1, $f0
/* F9E3C 001F9D3C 000080C6 */  lwc1       $f0, 0x0($20)
/* F9E40 001F9D40 20008046 */  cvt.s.w    $f0, $f0
/* F9E44 001F9D44 030B0046 */  div.s      $f12, $f1, $f0
/* F9E48 001F9D48 2C44040C */  jal        fptosi
/* F9E4C 001F9D4C 00000000 */   nop
/* F9E50 001F9D50 288E4070 */  paddub     $17, $2, $0
/* F9E54 001F9D54 2A08B102 */  slt        $at, $21, $17
/* F9E58 001F9D58 01002010 */  beqz       $at, .L001F9D60
/* F9E5C 001F9D5C 00000000 */   nop
.L001F9D60:
/* F9E60 001F9D60 C03F023C */  lui        $2, (0x3FC00000 >> 16)
/* F9E64 001F9D64 00088244 */  mtc1       $2, $f1
/* F9E68 001F9D68 00009244 */  mtc1       $18, $f0
/* F9E6C 001F9D6C 00000000 */  nop
/* F9E70 001F9D70 20008046 */  cvt.s.w    $f0, $f0
/* F9E74 001F9D74 020B0046 */  mul.s      $f12, $f1, $f0
/* F9E78 001F9D78 2C44040C */  jal        fptosi
/* F9E7C 001F9D7C 00000000 */   nop
/* F9E80 001F9D80 01000224 */  addiu      $2, $0, 0x1
/* F9E84 001F9D84 1500C216 */  bne        $22, $2, .L001F9DDC
/* F9E88 001F9D88 00000000 */   nop
/* F9E8C 001F9D8C 1300E01A */  blez       $23, .L001F9DDC
/* F9E90 001F9D90 00000000 */   nop
/* F9E94 001F9D94 0000A0FF */  sd         $0, 0x0($sp)
/* F9E98 001F9D98 0800B2FF */  sd         $18, 0x8($sp)
/* F9E9C 001F9D9C A000A38F */  lw         $3, 0xA0($sp)
/* F9EA0 001F9DA0 A800A28F */  lw         $2, 0xA8($sp)
/* F9EA4 001F9DA4 21286200 */  addu       $5, $3, $2
/* F9EA8 001F9DA8 AC00A28F */  lw         $2, 0xAC($sp)
/* F9EAC 001F9DAC 21300202 */  addu       $6, $16, $2
/* F9EB0 001F9DB0 0400848E */  lw         $4, 0x4($20)
/* F9EB4 001F9DB4 2900023C */  lui        $2, %hi(WeaponVolumeNumberRect)
/* F9EB8 001F9DB8 70304724 */  addiu      $7, $2, %lo(WeaponVolumeNumberRect)
/* F9EBC 001F9DBC 2C95888F */  lw         $8, -0x6AD4($gp)
/* F9EC0 001F9DC0 02000924 */  addiu      $9, $0, 0x2
/* F9EC4 001F9DC4 DC000A24 */  addiu      $10, $0, 0xDC
/* F9EC8 001F9DC8 285E0070 */  paddub     $11, $0, $0
/* F9ECC 001F9DCC 885F080C */  jal        DrawMenuNumber__Fiii4RECTP8CTextureiUcUcUci
/* F9ED0 001F9DD0 00000000 */   nop
/* F9ED4 001F9DD4 0E000010 */  b          .L001F9E10
/* F9ED8 001F9DD8 00000000 */   nop
.L001F9DDC:
/* F9EDC 001F9DDC A000A38F */  lw         $3, 0xA0($sp)
/* F9EE0 001F9DE0 A800A28F */  lw         $2, 0xA8($sp)
/* F9EE4 001F9DE4 21286200 */  addu       $5, $3, $2
/* F9EE8 001F9DE8 AC00A28F */  lw         $2, 0xAC($sp)
/* F9EEC 001F9DEC 21300202 */  addu       $6, $16, $2
/* F9EF0 001F9DF0 0400848E */  lw         $4, 0x4($20)
/* F9EF4 001F9DF4 2C95878F */  lw         $7, -0x6AD4($gp)
/* F9EF8 001F9DF8 2900023C */  lui        $2, %hi(WeaponVolumeNumberRect)
/* F9EFC 001F9DFC 70304824 */  addiu      $8, $2, %lo(WeaponVolumeNumberRect)
/* F9F00 001F9E00 02000924 */  addiu      $9, $0, 0x2
/* F9F04 001F9E04 28564072 */  paddub     $10, $18, $0
/* F9F08 001F9E08 705F080C */  jal        DrawMenuNumber__FiiiP8CTexture4RECTii
/* F9F0C 001F9E0C 00000000 */   nop
.L001F9E10:
/* F9F10 001F9E10 9000BF7B */  lq         $31, 0x90($sp)
/* F9F14 001F9E14 8000B77B */  lq         $23, 0x80($sp)
/* F9F18 001F9E18 7000B67B */  lq         $22, 0x70($sp)
/* F9F1C 001F9E1C 6000B57B */  lq         $21, 0x60($sp)
/* F9F20 001F9E20 5000B47B */  lq         $20, 0x50($sp)
/* F9F24 001F9E24 4000B37B */  lq         $19, 0x40($sp)
/* F9F28 001F9E28 3000B27B */  lq         $18, 0x30($sp)
/* F9F2C 001F9E2C 2000B17B */  lq         $17, 0x20($sp)
/* F9F30 001F9E30 1000B07B */  lq         $16, 0x10($sp)
/* F9F34 001F9E34 D000BD27 */  addiu      $sp, $sp, 0xD0
/* F9F38 001F9E38 0800E003 */  jr         $31
/* F9F3C 001F9E3C 00000000 */   nop
