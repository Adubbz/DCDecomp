.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetFocusParts__11CEditGroundFfff
/* A1E00 001A1D00 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* A1E04 001A1D04 3000BF7F */  sq         $31, 0x30($sp)
/* A1E08 001A1D08 2000B17F */  sq         $17, 0x20($sp)
/* A1E0C 001A1D0C 1000B07F */  sq         $16, 0x10($sp)
/* A1E10 001A1D10 0800B6E7 */  swc1       $f22, 0x8($sp)
/* A1E14 001A1D14 0400B5E7 */  swc1       $f21, 0x4($sp)
/* A1E18 001A1D18 0000B4E7 */  swc1       $f20, 0x0($sp)
/* A1E1C 001A1D1C 28868070 */  paddub     $16, $4, $0
/* A1E20 001A1D20 86650046 */  mov.s      $f22, $f12
/* A1E24 001A1D24 466D0046 */  mov.s      $f21, $f13
/* A1E28 001A1D28 06750046 */  mov.s      $f20, $f14
/* A1E2C 001A1D2C FFFF0224 */  addiu      $2, $0, -0x1
/* A1E30 001A1D30 0100013C */  lui        $at, (0x15F14 >> 16)
/* A1E34 001A1D34 21088100 */  addu       $at, $4, $at
/* A1E38 001A1D38 145F22AC */  sw         $2, (0x15F14 & 0xFFFF)($at)
/* A1E3C 001A1D3C AC85060C */  jal        GetAreaCode__11CEditGroundFfff
/* A1E40 001A1D40 00000000 */   nop
/* A1E44 001A1D44 04004104 */  bgez       $2, .L001A1D58
/* A1E48 001A1D48 00000000 */   nop
/* A1E4C 001A1D4C FFFF0224 */  addiu      $2, $0, -0x1
/* A1E50 001A1D50 2E000010 */  b          .L001A1E0C
/* A1E54 001A1D54 00000000 */   nop
.L001A1D58:
/* A1E58 001A1D58 80100200 */  sll        $2, $2, 2
/* A1E5C 001A1D5C 21105000 */  addu       $2, $2, $16
/* A1E60 001A1D60 0400518C */  lw         $17, 0x4($2)
/* A1E64 001A1D64 28262072 */  paddub     $4, $17, $0
/* A1E68 001A1D68 06B30046 */  mov.s      $f12, $f22
/* A1E6C 001A1D6C 46AB0046 */  mov.s      $f13, $f21
/* A1E70 001A1D70 86A30046 */  mov.s      $f14, $f20
/* A1E74 001A1D74 F8BA050C */  jal        SearchPartsID__9CEditAreaFfff
/* A1E78 001A1D78 00000000 */   nop
/* A1E7C 001A1D7C 04004104 */  bgez       $2, .L001A1D90
/* A1E80 001A1D80 00000000 */   nop
/* A1E84 001A1D84 FFFF0224 */  addiu      $2, $0, -0x1
/* A1E88 001A1D88 20000010 */  b          .L001A1E0C
/* A1E8C 001A1D8C 00000000 */   nop
.L001A1D90:
/* A1E90 001A1D90 C0180200 */  sll        $3, $2, 3
/* A1E94 001A1D94 23186200 */  subu       $3, $3, $2
/* A1E98 001A1D98 80100300 */  sll        $2, $3, 2
/* A1E9C 001A1D9C 23104300 */  subu       $2, $2, $3
/* A1EA0 001A1DA0 40110200 */  sll        $2, $2, 5
/* A1EA4 001A1DA4 21100202 */  addu       $2, $16, $2
/* A1EA8 001A1DA8 30004524 */  addiu      $5, $2, 0x30
/* A1EAC 001A1DAC 28262072 */  paddub     $4, $17, $0
/* A1EB0 001A1DB0 06B30046 */  mov.s      $f12, $f22
/* A1EB4 001A1DB4 46AB0046 */  mov.s      $f13, $f21
/* A1EB8 001A1DB8 86A30046 */  mov.s      $f14, $f20
/* A1EBC 001A1DBC C896060C */  jal        CheckDelete__FP9CEditAreaP9CMapPartsfff
/* A1EC0 001A1DC0 00000000 */   nop
/* A1EC4 001A1DC4 04004010 */  beqz       $2, .L001A1DD8
/* A1EC8 001A1DC8 00000000 */   nop
/* A1ECC 001A1DCC FFFF0224 */  addiu      $2, $0, -0x1
/* A1ED0 001A1DD0 0E000010 */  b          .L001A1E0C
/* A1ED4 001A1DD4 00000000 */   nop
.L001A1DD8:
/* A1ED8 001A1DD8 28260072 */  paddub     $4, $16, $0
/* A1EDC 001A1DDC 06B30046 */  mov.s      $f12, $f22
/* A1EE0 001A1DE0 46AB0046 */  mov.s      $f13, $f21
/* A1EE4 001A1DE4 86A30046 */  mov.s      $f14, $f20
/* A1EE8 001A1DE8 3486060C */  jal        GetPartsID__11CEditGroundFfff
/* A1EEC 001A1DEC 00000000 */   nop
/* A1EF0 001A1DF0 0100013C */  lui        $at, (0x15F14 >> 16)
/* A1EF4 001A1DF4 21080102 */  addu       $at, $16, $at
/* A1EF8 001A1DF8 145F22AC */  sw         $2, (0x15F14 & 0xFFFF)($at)
/* A1EFC 001A1DFC 0100013C */  lui        $at, (0x15F14 >> 16)
/* A1F00 001A1E00 21080102 */  addu       $at, $16, $at
/* A1F04 001A1E04 145F228C */  lw         $2, (0x15F14 & 0xFFFF)($at)
/* A1F08 001A1E08 00000000 */  nop
.L001A1E0C:
/* A1F0C 001A1E0C 3000BF7B */  lq         $31, 0x30($sp)
/* A1F10 001A1E10 2000B17B */  lq         $17, 0x20($sp)
/* A1F14 001A1E14 1000B07B */  lq         $16, 0x10($sp)
/* A1F18 001A1E18 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* A1F1C 001A1E1C 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* A1F20 001A1E20 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* A1F24 001A1E24 4000BD27 */  addiu      $sp, $sp, 0x40
/* A1F28 001A1E28 0800E003 */  jr         $31
/* A1F2C 001A1E2C 00000000 */   nop
