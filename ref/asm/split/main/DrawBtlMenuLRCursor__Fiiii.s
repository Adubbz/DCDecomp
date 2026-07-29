.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawBtlMenuLRCursor__Fiiii
/* 0FA010 001F9F10 60FFBD27 */  addiu       $29, $29, -0xA0
/* 0FA014 001F9F14 6000BF7F */  sq          $31, 0x60($29)
/* 0FA018 001F9F18 5000B57F */  sq          $21, 0x50($29)
/* 0FA01C 001F9F1C 4000B47F */  sq          $20, 0x40($29)
/* 0FA020 001F9F20 3000B37F */  sq          $19, 0x30($29)
/* 0FA024 001F9F24 2000B27F */  sq          $18, 0x20($29)
/* 0FA028 001F9F28 1000B17F */  sq          $17, 0x10($29)
/* 0FA02C 001F9F2C 0000B07F */  sq          $16, 0x0($29)
/* 0FA030 001F9F30 28868070 */  paddub      $16, $4, $0
/* 0FA034 001F9F34 288EA070 */  paddub      $17, $5, $0
/* 0FA038 001F9F38 28AEC070 */  paddub      $21, $6, $0
/* 0FA03C 001F9F3C 28A6E070 */  paddub      $20, $7, $0
/* 0FA040 001F9F40 F896838F */  lw          $3, -0x6908($28)
/* 0FA044 001F9F44 4F000224 */  addiu       $2, $0, 0x4F
/* 0FA048 001F9F48 1A006200 */  div         $0, $3, $2
/* 0FA04C 001F9F4C 00000000 */  nop
/* 0FA050 001F9F50 00000000 */  nop
/* 0FA054 001F9F54 10200000 */  mfhi        $4
/* 0FA058 001F9F58 308092DF */  ld          $18, -0x7FD0($28)
/* 0FA05C 001F9F5C FC40040C */  jal         litodp
/* 0FA060 001F9F60 00000000 */   nop
/* 0FA064 001F9F64 4440033C */  lui         $3, (0x40440000 >> 16)
/* 0FA068 001F9F68 3C280300 */  dsll32      $5, $3, 0
/* 0FA06C 001F9F6C 28264070 */  paddub      $4, $2, $0
/* 0FA070 001F9F70 843F040C */  jal         dpsub
/* 0FA074 001F9F74 00000000 */   nop
/* 0FA078 001F9F78 28264072 */  paddub      $4, $18, $0
/* 0FA07C 001F9F7C 282E4070 */  paddub      $5, $2, $0
/* 0FA080 001F9F80 9E3F040C */  jal         dpmul
/* 0FA084 001F9F84 00000000 */   nop
/* 0FA088 001F9F88 4440033C */  lui         $3, (0x40440000 >> 16)
/* 0FA08C 001F9F8C 3C280300 */  dsll32      $5, $3, 0
/* 0FA090 001F9F90 28264070 */  paddub      $4, $2, $0
/* 0FA094 001F9F94 4840040C */  jal         dpdiv
/* 0FA098 001F9F98 00000000 */   nop
/* 0FA09C 001F9F9C 28264070 */  paddub      $4, $2, $0
/* 0FA0A0 001F9FA0 9241040C */  jal         dptofp
/* 0FA0A4 001F9FA4 00000000 */   nop
/* 0FA0A8 001F9FA8 06030046 */  mov.s       $f12, $f0
/* 0FA0AC 001F9FAC 2876040C */  jal         sinf
/* 0FA0B0 001F9FB0 00000000 */   nop
/* 0FA0B4 001F9FB4 8040023C */  lui         $2, (0x40800000 >> 16)
/* 0FA0B8 001F9FB8 00088244 */  mtc1        $2, $f1
/* 0FA0BC 001F9FBC 00000000 */  nop
/* 0FA0C0 001F9FC0 42080046 */  mul.s       $f1, $f1, $f0
/* 0FA0C4 001F9FC4 00009144 */  mtc1        $17, $f0
/* 0FA0C8 001F9FC8 00000000 */  nop
/* 0FA0CC 001F9FCC 20008046 */  cvt.s.w     $f0, $f0
/* 0FA0D0 001F9FD0 00030146 */  add.s       $f12, $f0, $f1
/* 0FA0D4 001F9FD4 2C44040C */  jal         fptosi
/* 0FA0D8 001F9FD8 00000000 */   nop
/* 0FA0DC 001F9FDC 288E4070 */  paddub      $17, $2, $0
/* 0FA0E0 001F9FE0 62000224 */  addiu       $2, $0, 0x62
/* 0FA0E4 001F9FE4 7000A2AF */  sw          $2, 0x70($29)
/* 0FA0E8 001F9FE8 14000224 */  addiu       $2, $0, 0x14
/* 0FA0EC 001F9FEC 7400A2AF */  sw          $2, 0x74($29)
/* 0FA0F0 001F9FF0 1A000224 */  addiu       $2, $0, 0x1A
/* 0FA0F4 001F9FF4 7800B327 */  addiu       $19, $29, 0x78
/* 0FA0F8 001F9FF8 000062AE */  sw          $2, 0x0($19)
/* 0FA0FC 001F9FFC 18000224 */  addiu       $2, $0, 0x18
/* 0FA100 001FA000 7C00B227 */  addiu       $18, $29, 0x7C
/* 0FA104 001FA004 000042AE */  sw          $2, 0x0($18)
/* 0FA108 001FA008 0000438E */  lw          $3, 0x0($18)
/* 0FA10C 001FA00C 0000628E */  lw          $2, 0x0($19)
/* 0FA110 001FA010 8000B0AF */  sw          $16, 0x80($29)
/* 0FA114 001FA014 8400B1AF */  sw          $17, 0x84($29)
/* 0FA118 001FA018 8800A2AF */  sw          $2, 0x88($29)
/* 0FA11C 001FA01C 8C00A3AF */  sw          $3, 0x8C($29)
/* 0FA120 001FA020 A497848F */  lw          $4, -0x685C($28)
/* 0FA124 001FA024 8000A527 */  addiu       $5, $29, 0x80
/* 0FA128 001FA028 7000A627 */  addiu       $6, $29, 0x70
/* 0FA12C 001FA02C 283E8072 */  paddub      $7, $20, $0
/* 0FA130 001FA030 C8B3080C */  jal         DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 0FA134 001FA034 00000000 */   nop
/* 0FA138 001FA038 7000A38F */  lw          $3, 0x70($29)
/* 0FA13C 001FA03C 0000628E */  lw          $2, 0x0($19)
/* 0FA140 001FA040 21106200 */  addu        $2, $3, $2
/* 0FA144 001FA044 7000A2AF */  sw          $2, 0x70($29)
/* 0FA148 001FA048 0000448E */  lw          $4, 0x0($18)
/* 0FA14C 001FA04C 0000638E */  lw          $3, 0x0($19)
/* 0FA150 001FA050 21101502 */  addu        $2, $16, $21
/* 0FA154 001FA054 9000A2AF */  sw          $2, 0x90($29)
/* 0FA158 001FA058 9400B1AF */  sw          $17, 0x94($29)
/* 0FA15C 001FA05C 9800A3AF */  sw          $3, 0x98($29)
/* 0FA160 001FA060 9C00A4AF */  sw          $4, 0x9C($29)
/* 0FA164 001FA064 A497848F */  lw          $4, -0x685C($28)
/* 0FA168 001FA068 9000A527 */  addiu       $5, $29, 0x90
/* 0FA16C 001FA06C 7000A627 */  addiu       $6, $29, 0x70
/* 0FA170 001FA070 283E8072 */  paddub      $7, $20, $0
/* 0FA174 001FA074 C8B3080C */  jal         DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 0FA178 001FA078 00000000 */   nop
/* 0FA17C 001FA07C 6000BF7B */  lq          $31, 0x60($29)
/* 0FA180 001FA080 5000B57B */  lq          $21, 0x50($29)
/* 0FA184 001FA084 4000B47B */  lq          $20, 0x40($29)
/* 0FA188 001FA088 3000B37B */  lq          $19, 0x30($29)
/* 0FA18C 001FA08C 2000B27B */  lq          $18, 0x20($29)
/* 0FA190 001FA090 1000B17B */  lq          $17, 0x10($29)
/* 0FA194 001FA094 0000B07B */  lq          $16, 0x0($29)
/* 0FA198 001FA098 A000BD27 */  addiu       $29, $29, 0xA0
/* 0FA19C 001FA09C 0800E003 */  jr          $31
/* 0FA1A0 001FA0A0 00000000 */   nop
/* 0FA1A4 001FA0A4 00000000 */  nop
/* 0FA1A8 001FA0A8 00000000 */  nop
/* 0FA1AC 001FA0AC 00000000 */  nop
