.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawWeaponVsMonster__FiiP11WEAPON_HAVEiii
/* 0FADA0 001FACA0 B0FEBD27 */  addiu       $29, $29, -0x150
/* 0FADA4 001FACA4 A000BF7F */  sq          $31, 0xA0($29)
/* 0FADA8 001FACA8 9000BE7F */  sq          $30, 0x90($29)
/* 0FADAC 001FACAC 8000B77F */  sq          $23, 0x80($29)
/* 0FADB0 001FACB0 7000B67F */  sq          $22, 0x70($29)
/* 0FADB4 001FACB4 6000B57F */  sq          $21, 0x60($29)
/* 0FADB8 001FACB8 5000B47F */  sq          $20, 0x50($29)
/* 0FADBC 001FACBC 4000B37F */  sq          $19, 0x40($29)
/* 0FADC0 001FACC0 3000B27F */  sq          $18, 0x30($29)
/* 0FADC4 001FACC4 2000B17F */  sq          $17, 0x20($29)
/* 0FADC8 001FACC8 1000B07F */  sq          $16, 0x10($29)
/* 0FADCC 001FACCC 0400B5E7 */  swc1        $f21, 0x4($29)
/* 0FADD0 001FACD0 0000B4E7 */  swc1        $f20, 0x0($29)
/* 0FADD4 001FACD4 28B68070 */  paddub      $22, $4, $0
/* 0FADD8 001FACD8 288EA070 */  paddub      $17, $5, $0
/* 0FADDC 001FACDC 28AEC070 */  paddub      $21, $6, $0
/* 0FADE0 001FACE0 28A6E070 */  paddub      $20, $7, $0
/* 0FADE4 001FACE4 CC00A9AF */  sw          $9, 0xCC($29)
/* 0FADE8 001FACE8 28860070 */  paddub      $16, $0, $0
/* 0FADEC 001FACEC 01000224 */  addiu       $2, $0, 0x1
/* 0FADF0 001FACF0 05008216 */  bne         $20, $2, .L001FAD08
/* 0FADF4 001FACF4 00000000 */   nop
/* 0FADF8 001FACF8 28260071 */  paddub      $4, $8, $0
/* 0FADFC 001FACFC D443070C */  jal         GetWeaponData__Fi
/* 0FAE00 001FAD00 00000000 */   nop
/* 0FAE04 001FAD04 28864070 */  paddub      $16, $2, $0
.L001FAD08:
/* 0FAE08 001FAD08 30002226 */  addiu       $2, $17, 0x30
/* 0FAE0C 001FAD0C B000A2AF */  sw          $2, 0xB0($29)
/* 0FAE10 001FAD10 2900023C */  lui         $2, %hi(LIT_2056)
/* 0FAE14 001FAD14 60314224 */  addiu       $2, $2, %lo(LIT_2056)
/* 0FAE18 001FAD18 D000A327 */  addiu       $3, $29, 0xD0
/* 0FAE1C 001FAD1C 00004278 */  lq          $2, 0x0($2)
/* 0FAE20 001FAD20 0000627C */  sq          $2, 0x0($3)
/* 0FAE24 001FAD24 2200C226 */  addiu       $2, $22, 0x22
/* 0FAE28 001FAD28 D000A2AF */  sw          $2, 0xD0($29)
/* 0FAE2C 001FAD2C D400B327 */  addiu       $19, $29, 0xD4
/* 0FAE30 001FAD30 B000A28F */  lw          $2, 0xB0($29)
/* 0FAE34 001FAD34 000062AE */  sw          $2, 0x0($19)
/* 0FAE38 001FAD38 2900023C */  lui         $2, %hi(LIT_2057)
/* 0FAE3C 001FAD3C 70314424 */  addiu       $4, $2, %lo(LIT_2057)
/* 0FAE40 001FAD40 4001A327 */  addiu       $3, $29, 0x140
/* 0FAE44 001FAD44 000082DC */  ld          $2, 0x0($4)
/* 0FAE48 001FAD48 080080C4 */  lwc1        $f0, 0x8($4)
/* 0FAE4C 001FAD4C 000062FC */  sd          $2, 0x0($3)
/* 0FAE50 001FAD50 080060E4 */  swc1        $f0, 0x8($3)
/* 0FAE54 001FAD54 2900023C */  lui         $2, %hi(LIT_2058)
/* 0FAE58 001FAD58 80314524 */  addiu       $5, $2, %lo(LIT_2058)
/* 0FAE5C 001FAD5C E000A427 */  addiu       $4, $29, 0xE0
/* 0FAE60 001FAD60 02000324 */  addiu       $3, $0, 0x2
.L001FAD64:
/* 0FAE64 001FAD64 0000A278 */  lq          $2, 0x0($5)
/* 0FAE68 001FAD68 1000A524 */  addiu       $5, $5, 0x10
/* 0FAE6C 001FAD6C FFFF6324 */  addiu       $3, $3, -0x1
/* 0FAE70 001FAD70 0000827C */  sq          $2, 0x0($4)
/* 0FAE74 001FAD74 10008424 */  addiu       $4, $4, 0x10
/* 0FAE78 001FAD78 FAFF601C */  bgtz        $3, .L001FAD64
/* 0FAE7C 001FAD7C 00000000 */   nop
/* 0FAE80 001FAD80 0000A2DC */  ld          $2, 0x0($5)
/* 0FAE84 001FAD84 000082FC */  sd          $2, 0x0($4)
/* 0FAE88 001FAD88 2900023C */  lui         $2, %hi(LIT_2059)
/* 0FAE8C 001FAD8C B0314524 */  addiu       $5, $2, %lo(LIT_2059)
/* 0FAE90 001FAD90 1001A427 */  addiu       $4, $29, 0x110
/* 0FAE94 001FAD94 02000324 */  addiu       $3, $0, 0x2
.L001FAD98:
/* 0FAE98 001FAD98 0000A278 */  lq          $2, 0x0($5)
/* 0FAE9C 001FAD9C 1000A524 */  addiu       $5, $5, 0x10
/* 0FAEA0 001FADA0 FFFF6324 */  addiu       $3, $3, -0x1
/* 0FAEA4 001FADA4 0000827C */  sq          $2, 0x0($4)
/* 0FAEA8 001FADA8 10008424 */  addiu       $4, $4, 0x10
/* 0FAEAC 001FADAC FAFF601C */  bgtz        $3, .L001FAD98
/* 0FAEB0 001FADB0 00000000 */   nop
/* 0FAEB4 001FADB4 0000A2DC */  ld          $2, 0x0($5)
/* 0FAEB8 001FADB8 000082FC */  sd          $2, 0x0($4)
/* 0FAEBC 001FADBC 0F008016 */  bnez        $20, .L001FADFC
/* 0FAEC0 001FADC0 00000000 */   nop
/* 0FAEC4 001FADC4 288E0070 */  paddub      $17, $0, $0
/* 0FAEC8 001FADC8 09000010 */  b           .L001FADF0
/* 0FAECC 001FADCC 00000000 */   nop
.L001FADD0:
/* 0FAED0 001FADD0 0E002526 */  addiu       $5, $17, 0xE
/* 0FAED4 001FADD4 2826A072 */  paddub      $4, $21, $0
/* 0FAED8 001FADD8 5C96080C */  jal         GetWeaponAttachStatusUp__FP11WEAPON_HAVEi
/* 0FAEDC 001FADDC 00000000 */   nop
/* 0FAEE0 001FADE0 80181100 */  sll         $3, $17, 2
/* 0FAEE4 001FADE4 21187D00 */  addu        $3, $3, $29
/* 0FAEE8 001FADE8 E00062AC */  sw          $2, 0xE0($3)
/* 0FAEEC 001FADEC 01003126 */  addiu       $17, $17, 0x1
.L001FADF0:
/* 0FAEF0 001FADF0 0A00222A */  slti        $2, $17, 0xA
/* 0FAEF4 001FADF4 F6FF4014 */  bnez        $2, .L001FADD0
/* 0FAEF8 001FADF8 00000000 */   nop
.L001FADFC:
/* 0FAEFC 001FADFC 01000224 */  addiu       $2, $0, 0x1
/* 0FAF00 001FAE00 0E008216 */  bne         $20, $2, .L001FAE3C
/* 0FAF04 001FAE04 00000000 */   nop
/* 0FAF08 001FAE08 28260070 */  paddub      $4, $0, $0
/* 0FAF0C 001FAE0C 08000010 */  b           .L001FAE30
/* 0FAF10 001FAE10 00000000 */   nop
.L001FAE14:
/* 0FAF14 001FAE14 40100400 */  sll         $2, $4, 1
/* 0FAF18 001FAE18 21105000 */  addu        $2, $2, $16
/* 0FAF1C 001FAE1C 1C004384 */  lh          $3, 0x1C($2)
/* 0FAF20 001FAE20 80100400 */  sll         $2, $4, 2
/* 0FAF24 001FAE24 21105D00 */  addu        $2, $2, $29
/* 0FAF28 001FAE28 100143AC */  sw          $3, 0x110($2)
/* 0FAF2C 001FAE2C 01008424 */  addiu       $4, $4, 0x1
.L001FAE30:
/* 0FAF30 001FAE30 0A008228 */  slti        $2, $4, 0xA
/* 0FAF34 001FAE34 F7FF4014 */  bnez        $2, .L001FAE14
/* 0FAF38 001FAE38 00000000 */   nop
.L001FAE3C:
/* 0FAF3C 001FAE3C 2826A072 */  paddub      $4, $21, $0
/* 0FAF40 001FAE40 7433080C */  jal         GetNowWeaponRate__FP11WEAPON_HAVE
/* 0FAF44 001FAE44 00000000 */   nop
/* 0FAF48 001FAE48 06050046 */  mov.s       $f20, $f0
/* 0FAF4C 001FAE4C 28860070 */  paddub      $16, $0, $0
/* 0FAF50 001FAE50 55000010 */  b           .L001FAFA8
/* 0FAF54 001FAE54 00000000 */   nop
.L001FAE58:
/* 0FAF58 001FAE58 288E0070 */  paddub      $17, $0, $0
/* 0FAF5C 001FAE5C 21101502 */  addu        $2, $16, $21
/* 0FAF60 001FAE60 1C005E24 */  addiu       $30, $2, 0x1C
/* 0FAF64 001FAE64 1C004380 */  lb          $3, 0x1C($2)
/* 0FAF68 001FAE68 80B81000 */  sll         $23, $16, 2
/* 0FAF6C 001FAE6C 2110FD02 */  addu        $2, $23, $29
/* 0FAF70 001FAE70 E000428C */  lw          $2, 0xE0($2)
/* 0FAF74 001FAE74 21106200 */  addu        $2, $3, $2
/* 0FAF78 001FAE78 4401B227 */  addiu       $18, $29, 0x144
/* 0FAF7C 001FAE7C 000042AE */  sw          $2, 0x0($18)
/* 0FAF80 001FAE80 000040C6 */  lwc1        $f0, 0x0($18)
/* 0FAF84 001FAE84 20008046 */  cvt.s.w     $f0, $f0
/* 0FAF88 001FAE88 02031446 */  mul.s       $f12, $f0, $f20
/* 0FAF8C 001FAE8C 2C44040C */  jal         fptosi
/* 0FAF90 001FAE90 00000000 */   nop
/* 0FAF94 001FAE94 000042AE */  sw          $2, 0x0($18)
/* 0FAF98 001FAE98 0000428E */  lw          $2, 0x0($18)
/* 0FAF9C 001FAE9C 63004228 */  slti        $2, $2, 0x63
/* 0FAFA0 001FAEA0 04004014 */  bnez        $2, .L001FAEB4
/* 0FAFA4 001FAEA4 00000000 */   nop
/* 0FAFA8 001FAEA8 01001124 */  addiu       $17, $0, 0x1
/* 0FAFAC 001FAEAC 63000224 */  addiu       $2, $0, 0x63
/* 0FAFB0 001FAEB0 000042AE */  sw          $2, 0x0($18)
.L001FAEB4:
/* 0FAFB4 001FAEB4 0000C283 */  lb          $2, 0x0($30)
/* 0FAFB8 001FAEB8 4801A327 */  addiu       $3, $29, 0x148
/* 0FAFBC 001FAEBC 000062AC */  sw          $2, 0x0($3)
/* 0FAFC0 001FAEC0 0000628C */  lw          $2, 0x0($3)
/* 0FAFC4 001FAEC4 63004228 */  slti        $2, $2, 0x63
/* 0FAFC8 001FAEC8 03004014 */  bnez        $2, .L001FAED8
/* 0FAFCC 001FAECC 00000000 */   nop
/* 0FAFD0 001FAED0 63000224 */  addiu       $2, $0, 0x63
/* 0FAFD4 001FAED4 000062AC */  sw          $2, 0x0($3)
.L001FAED8:
/* 0FAFD8 001FAED8 0000428E */  lw          $2, 0x0($18)
/* 0FAFDC 001FAEDC 80110200 */  sll         $2, $2, 6
/* 0FAFE0 001FAEE0 00008244 */  mtc1        $2, $f0
/* 0FAFE4 001FAEE4 00000000 */  nop
/* 0FAFE8 001FAEE8 60008046 */  cvt.s.w     $f1, $f0
/* 0FAFEC 001FAEEC 4001A0C7 */  lwc1        $f0, 0x140($29)
/* 0FAFF0 001FAEF0 20008046 */  cvt.s.w     $f0, $f0
/* 0FAFF4 001FAEF4 430D0046 */  div.s       $f21, $f1, $f0
/* 0FAFF8 001FAEF8 06AB0046 */  mov.s       $f12, $f21
/* 0FAFFC 001FAEFC 2C44040C */  jal         fptosi
/* 0FB000 001FAF00 00000000 */   nop
/* 0FB004 001FAF04 06AB0046 */  mov.s       $f12, $f21
/* 0FB008 001FAF08 2C44040C */  jal         fptosi
/* 0FB00C 001FAF0C 00000000 */   nop
/* 0FB010 001FAF10 D000A48F */  lw          $4, 0xD0($29)
/* 0FB014 001FAF14 0000658E */  lw          $5, 0x0($19)
/* 0FB018 001FAF18 28364070 */  paddub      $6, $2, $0
/* 0FB01C 001FAF1C 283E2072 */  paddub      $7, $17, $0
/* 0FB020 001FAF20 90E7070C */  jal         DrawWeaponStatusWaku__Fiiii
/* 0FB024 001FAF24 00000000 */   nop
/* 0FB028 001FAF28 2110FD02 */  addu        $2, $23, $29
/* 0FB02C 001FAF2C 1001438C */  lw          $3, 0x110($2)
/* 0FB030 001FAF30 0000C283 */  lb          $2, 0x0($30)
/* 0FB034 001FAF34 23506200 */  subu        $10, $3, $2
/* 0FB038 001FAF38 0C000726 */  addiu       $7, $16, 0xC
/* 0FB03C 001FAF3C D000A427 */  addiu       $4, $29, 0xD0
/* 0FB040 001FAF40 40000524 */  addiu       $5, $0, 0x40
/* 0FB044 001FAF44 4001A627 */  addiu       $6, $29, 0x140
/* 0FB048 001FAF48 CC00A88F */  lw          $8, 0xCC($29)
/* 0FB04C 001FAF4C 284E8072 */  paddub      $9, $20, $0
/* 0FB050 001FAF50 08E7070C */  jal         WepStatusVolumeDraw__F4RECTiPiiiii
/* 0FB054 001FAF54 00000000 */   nop
/* 0FB058 001FAF58 08002012 */  beqz        $17, .L001FAF7C
/* 0FB05C 001FAF5C 00000000 */   nop
/* 0FB060 001FAF60 D000A28F */  lw          $2, 0xD0($29)
/* 0FB064 001FAF64 1E004424 */  addiu       $4, $2, 0x1E
/* 0FB068 001FAF68 0000628E */  lw          $2, 0x0($19)
/* 0FB06C 001FAF6C 04004524 */  addiu       $5, $2, 0x4
/* 0FB070 001FAF70 80000624 */  addiu       $6, $0, 0x80
/* 0FB074 001FAF74 ACE7070C */  jal         DrawLimmitMax__Fiii
/* 0FB078 001FAF78 00000000 */   nop
.L001FAF7C:
/* 0FB07C 001FAF7C 0000638E */  lw          $3, 0x0($19)
/* 0FB080 001FAF80 18006324 */  addiu       $3, $3, 0x18
/* 0FB084 001FAF84 000063AE */  sw          $3, 0x0($19)
/* 0FB088 001FAF88 04000324 */  addiu       $3, $0, 0x4
/* 0FB08C 001FAF8C 05000316 */  bne         $16, $3, .L001FAFA4
/* 0FB090 001FAF90 00000000 */   nop
/* 0FB094 001FAF94 8A00C326 */  addiu       $3, $22, 0x8A
/* 0FB098 001FAF98 D000A3AF */  sw          $3, 0xD0($29)
/* 0FB09C 001FAF9C B000A38F */  lw          $3, 0xB0($29)
/* 0FB0A0 001FAFA0 000063AE */  sw          $3, 0x0($19)
.L001FAFA4:
/* 0FB0A4 001FAFA4 01001026 */  addiu       $16, $16, 0x1
.L001FAFA8:
/* 0FB0A8 001FAFA8 0A00032A */  slti        $3, $16, 0xA
/* 0FB0AC 001FAFAC AAFF6014 */  bnez        $3, .L001FAE58
/* 0FB0B0 001FAFB0 00000000 */   nop
/* 0FB0B4 001FAFB4 A000BF7B */  lq          $31, 0xA0($29)
/* 0FB0B8 001FAFB8 9000BE7B */  lq          $30, 0x90($29)
/* 0FB0BC 001FAFBC 8000B77B */  lq          $23, 0x80($29)
/* 0FB0C0 001FAFC0 7000B67B */  lq          $22, 0x70($29)
/* 0FB0C4 001FAFC4 6000B57B */  lq          $21, 0x60($29)
/* 0FB0C8 001FAFC8 5000B47B */  lq          $20, 0x50($29)
/* 0FB0CC 001FAFCC 4000B37B */  lq          $19, 0x40($29)
/* 0FB0D0 001FAFD0 3000B27B */  lq          $18, 0x30($29)
/* 0FB0D4 001FAFD4 2000B17B */  lq          $17, 0x20($29)
/* 0FB0D8 001FAFD8 1000B07B */  lq          $16, 0x10($29)
/* 0FB0DC 001FAFDC 0400B5C7 */  lwc1        $f21, 0x4($29)
/* 0FB0E0 001FAFE0 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 0FB0E4 001FAFE4 5001BD27 */  addiu       $29, $29, 0x150
/* 0FB0E8 001FAFE8 0800E003 */  jr          $31
/* 0FB0EC 001FAFEC 00000000 */   nop
