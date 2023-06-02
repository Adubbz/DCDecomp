.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawWeaponVsMonster__FiiP11WEAPON_HAVEiii
/* FADA0 001FACA0 B0FEBD27 */  addiu      $sp, $sp, -0x150
/* FADA4 001FACA4 A000BF7F */  sq         $31, 0xA0($sp)
/* FADA8 001FACA8 9000BE7F */  sq         $fp, 0x90($sp)
/* FADAC 001FACAC 8000B77F */  sq         $23, 0x80($sp)
/* FADB0 001FACB0 7000B67F */  sq         $22, 0x70($sp)
/* FADB4 001FACB4 6000B57F */  sq         $21, 0x60($sp)
/* FADB8 001FACB8 5000B47F */  sq         $20, 0x50($sp)
/* FADBC 001FACBC 4000B37F */  sq         $19, 0x40($sp)
/* FADC0 001FACC0 3000B27F */  sq         $18, 0x30($sp)
/* FADC4 001FACC4 2000B17F */  sq         $17, 0x20($sp)
/* FADC8 001FACC8 1000B07F */  sq         $16, 0x10($sp)
/* FADCC 001FACCC 0400B5E7 */  swc1       $f21, 0x4($sp)
/* FADD0 001FACD0 0000B4E7 */  swc1       $f20, 0x0($sp)
/* FADD4 001FACD4 28B68070 */  paddub     $22, $4, $0
/* FADD8 001FACD8 288EA070 */  paddub     $17, $5, $0
/* FADDC 001FACDC 28AEC070 */  paddub     $21, $6, $0
/* FADE0 001FACE0 28A6E070 */  paddub     $20, $7, $0
/* FADE4 001FACE4 CC00A9AF */  sw         $9, 0xCC($sp)
/* FADE8 001FACE8 28860070 */  paddub     $16, $0, $0
/* FADEC 001FACEC 01000224 */  addiu      $2, $0, 0x1
/* FADF0 001FACF0 05008216 */  bne        $20, $2, .L001FAD08
/* FADF4 001FACF4 00000000 */   nop
/* FADF8 001FACF8 28260071 */  paddub     $4, $8, $0
/* FADFC 001FACFC D443070C */  jal        GetWeaponData__Fi
/* FAE00 001FAD00 00000000 */   nop
/* FAE04 001FAD04 28864070 */  paddub     $16, $2, $0
.L001FAD08:
/* FAE08 001FAD08 30002226 */  addiu      $2, $17, 0x30
/* FAE0C 001FAD0C B000A2AF */  sw         $2, 0xB0($sp)
/* FAE10 001FAD10 2900023C */  lui        $2, %hi(_2056)
/* FAE14 001FAD14 60314224 */  addiu      $2, $2, %lo(_2056)
/* FAE18 001FAD18 D000A327 */  addiu      $3, $sp, 0xD0
/* FAE1C 001FAD1C 00004278 */  lq         $2, 0x0($2)
/* FAE20 001FAD20 0000627C */  sq         $2, 0x0($3)
/* FAE24 001FAD24 2200C226 */  addiu      $2, $22, 0x22
/* FAE28 001FAD28 D000A2AF */  sw         $2, 0xD0($sp)
/* FAE2C 001FAD2C D400B327 */  addiu      $19, $sp, 0xD4
/* FAE30 001FAD30 B000A28F */  lw         $2, 0xB0($sp)
/* FAE34 001FAD34 000062AE */  sw         $2, 0x0($19)
/* FAE38 001FAD38 2900023C */  lui        $2, %hi(_2057)
/* FAE3C 001FAD3C 70314424 */  addiu      $4, $2, %lo(_2057)
/* FAE40 001FAD40 4001A327 */  addiu      $3, $sp, 0x140
/* FAE44 001FAD44 000082DC */  ld         $2, 0x0($4)
/* FAE48 001FAD48 080080C4 */  lwc1       $f0, 0x8($4)
/* FAE4C 001FAD4C 000062FC */  sd         $2, 0x0($3)
/* FAE50 001FAD50 080060E4 */  swc1       $f0, 0x8($3)
/* FAE54 001FAD54 2900023C */  lui        $2, %hi(_2058)
/* FAE58 001FAD58 80314524 */  addiu      $5, $2, %lo(_2058)
/* FAE5C 001FAD5C E000A427 */  addiu      $4, $sp, 0xE0
/* FAE60 001FAD60 02000324 */  addiu      $3, $0, 0x2
.L001FAD64:
/* FAE64 001FAD64 0000A278 */  lq         $2, 0x0($5)
/* FAE68 001FAD68 1000A524 */  addiu      $5, $5, 0x10
/* FAE6C 001FAD6C FFFF6324 */  addiu      $3, $3, -0x1
/* FAE70 001FAD70 0000827C */  sq         $2, 0x0($4)
/* FAE74 001FAD74 10008424 */  addiu      $4, $4, 0x10
/* FAE78 001FAD78 FAFF601C */  bgtz       $3, .L001FAD64
/* FAE7C 001FAD7C 00000000 */   nop
/* FAE80 001FAD80 0000A2DC */  ld         $2, 0x0($5)
/* FAE84 001FAD84 000082FC */  sd         $2, 0x0($4)
/* FAE88 001FAD88 2900023C */  lui        $2, %hi(_2059)
/* FAE8C 001FAD8C B0314524 */  addiu      $5, $2, %lo(_2059)
/* FAE90 001FAD90 1001A427 */  addiu      $4, $sp, 0x110
/* FAE94 001FAD94 02000324 */  addiu      $3, $0, 0x2
.L001FAD98:
/* FAE98 001FAD98 0000A278 */  lq         $2, 0x0($5)
/* FAE9C 001FAD9C 1000A524 */  addiu      $5, $5, 0x10
/* FAEA0 001FADA0 FFFF6324 */  addiu      $3, $3, -0x1
/* FAEA4 001FADA4 0000827C */  sq         $2, 0x0($4)
/* FAEA8 001FADA8 10008424 */  addiu      $4, $4, 0x10
/* FAEAC 001FADAC FAFF601C */  bgtz       $3, .L001FAD98
/* FAEB0 001FADB0 00000000 */   nop
/* FAEB4 001FADB4 0000A2DC */  ld         $2, 0x0($5)
/* FAEB8 001FADB8 000082FC */  sd         $2, 0x0($4)
/* FAEBC 001FADBC 0F008016 */  bnez       $20, .L001FADFC
/* FAEC0 001FADC0 00000000 */   nop
/* FAEC4 001FADC4 288E0070 */  paddub     $17, $0, $0
/* FAEC8 001FADC8 09000010 */  b          .L001FADF0
/* FAECC 001FADCC 00000000 */   nop
.L001FADD0:
/* FAED0 001FADD0 0E002526 */  addiu      $5, $17, 0xE
/* FAED4 001FADD4 2826A072 */  paddub     $4, $21, $0
/* FAED8 001FADD8 5C96080C */  jal        GetWeaponAttachStatusUp__FP11WEAPON_HAVEi
/* FAEDC 001FADDC 00000000 */   nop
/* FAEE0 001FADE0 80181100 */  sll        $3, $17, 2
/* FAEE4 001FADE4 21187D00 */  addu       $3, $3, $sp
/* FAEE8 001FADE8 E00062AC */  sw         $2, 0xE0($3)
/* FAEEC 001FADEC 01003126 */  addiu      $17, $17, 0x1
.L001FADF0:
/* FAEF0 001FADF0 0A00222A */  slti       $2, $17, 0xA
/* FAEF4 001FADF4 F6FF4014 */  bnez       $2, .L001FADD0
/* FAEF8 001FADF8 00000000 */   nop
.L001FADFC:
/* FAEFC 001FADFC 01000224 */  addiu      $2, $0, 0x1
/* FAF00 001FAE00 0E008216 */  bne        $20, $2, .L001FAE3C
/* FAF04 001FAE04 00000000 */   nop
/* FAF08 001FAE08 28260070 */  paddub     $4, $0, $0
/* FAF0C 001FAE0C 08000010 */  b          .L001FAE30
/* FAF10 001FAE10 00000000 */   nop
.L001FAE14:
/* FAF14 001FAE14 40100400 */  sll        $2, $4, 1
/* FAF18 001FAE18 21105000 */  addu       $2, $2, $16
/* FAF1C 001FAE1C 1C004384 */  lh         $3, 0x1C($2)
/* FAF20 001FAE20 80100400 */  sll        $2, $4, 2
/* FAF24 001FAE24 21105D00 */  addu       $2, $2, $sp
/* FAF28 001FAE28 100143AC */  sw         $3, 0x110($2)
/* FAF2C 001FAE2C 01008424 */  addiu      $4, $4, 0x1
.L001FAE30:
/* FAF30 001FAE30 0A008228 */  slti       $2, $4, 0xA
/* FAF34 001FAE34 F7FF4014 */  bnez       $2, .L001FAE14
/* FAF38 001FAE38 00000000 */   nop
.L001FAE3C:
/* FAF3C 001FAE3C 2826A072 */  paddub     $4, $21, $0
/* FAF40 001FAE40 7433080C */  jal        GetNowWeaponRate__FP11WEAPON_HAVE
/* FAF44 001FAE44 00000000 */   nop
/* FAF48 001FAE48 06050046 */  mov.s      $f20, $f0
/* FAF4C 001FAE4C 28860070 */  paddub     $16, $0, $0
/* FAF50 001FAE50 55000010 */  b          .L001FAFA8
/* FAF54 001FAE54 00000000 */   nop
.L001FAE58:
/* FAF58 001FAE58 288E0070 */  paddub     $17, $0, $0
/* FAF5C 001FAE5C 21101502 */  addu       $2, $16, $21
/* FAF60 001FAE60 1C005E24 */  addiu      $fp, $2, 0x1C
/* FAF64 001FAE64 1C004380 */  lb         $3, 0x1C($2)
/* FAF68 001FAE68 80B81000 */  sll        $23, $16, 2
/* FAF6C 001FAE6C 2110FD02 */  addu       $2, $23, $sp
/* FAF70 001FAE70 E000428C */  lw         $2, 0xE0($2)
/* FAF74 001FAE74 21106200 */  addu       $2, $3, $2
/* FAF78 001FAE78 4401B227 */  addiu      $18, $sp, 0x144
/* FAF7C 001FAE7C 000042AE */  sw         $2, 0x0($18)
/* FAF80 001FAE80 000040C6 */  lwc1       $f0, 0x0($18)
/* FAF84 001FAE84 20008046 */  cvt.s.w    $f0, $f0
/* FAF88 001FAE88 02031446 */  mul.s      $f12, $f0, $f20
/* FAF8C 001FAE8C 2C44040C */  jal        fptosi
/* FAF90 001FAE90 00000000 */   nop
/* FAF94 001FAE94 000042AE */  sw         $2, 0x0($18)
/* FAF98 001FAE98 0000428E */  lw         $2, 0x0($18)
/* FAF9C 001FAE9C 63004228 */  slti       $2, $2, 0x63
/* FAFA0 001FAEA0 04004014 */  bnez       $2, .L001FAEB4
/* FAFA4 001FAEA4 00000000 */   nop
/* FAFA8 001FAEA8 01001124 */  addiu      $17, $0, 0x1
/* FAFAC 001FAEAC 63000224 */  addiu      $2, $0, 0x63
/* FAFB0 001FAEB0 000042AE */  sw         $2, 0x0($18)
.L001FAEB4:
/* FAFB4 001FAEB4 0000C283 */  lb         $2, 0x0($fp)
/* FAFB8 001FAEB8 4801A327 */  addiu      $3, $sp, 0x148
/* FAFBC 001FAEBC 000062AC */  sw         $2, 0x0($3)
/* FAFC0 001FAEC0 0000628C */  lw         $2, 0x0($3)
/* FAFC4 001FAEC4 63004228 */  slti       $2, $2, 0x63
/* FAFC8 001FAEC8 03004014 */  bnez       $2, .L001FAED8
/* FAFCC 001FAECC 00000000 */   nop
/* FAFD0 001FAED0 63000224 */  addiu      $2, $0, 0x63
/* FAFD4 001FAED4 000062AC */  sw         $2, 0x0($3)
.L001FAED8:
/* FAFD8 001FAED8 0000428E */  lw         $2, 0x0($18)
/* FAFDC 001FAEDC 80110200 */  sll        $2, $2, 6
/* FAFE0 001FAEE0 00008244 */  mtc1       $2, $f0
/* FAFE4 001FAEE4 00000000 */  nop
/* FAFE8 001FAEE8 60008046 */  cvt.s.w    $f1, $f0
/* FAFEC 001FAEEC 4001A0C7 */  lwc1       $f0, 0x140($sp)
/* FAFF0 001FAEF0 20008046 */  cvt.s.w    $f0, $f0
/* FAFF4 001FAEF4 430D0046 */  div.s      $f21, $f1, $f0
/* FAFF8 001FAEF8 06AB0046 */  mov.s      $f12, $f21
/* FAFFC 001FAEFC 2C44040C */  jal        fptosi
/* FB000 001FAF00 00000000 */   nop
/* FB004 001FAF04 06AB0046 */  mov.s      $f12, $f21
/* FB008 001FAF08 2C44040C */  jal        fptosi
/* FB00C 001FAF0C 00000000 */   nop
/* FB010 001FAF10 D000A48F */  lw         $4, 0xD0($sp)
/* FB014 001FAF14 0000658E */  lw         $5, 0x0($19)
/* FB018 001FAF18 28364070 */  paddub     $6, $2, $0
/* FB01C 001FAF1C 283E2072 */  paddub     $7, $17, $0
/* FB020 001FAF20 90E7070C */  jal        DrawWeaponStatusWaku__Fiiii
/* FB024 001FAF24 00000000 */   nop
/* FB028 001FAF28 2110FD02 */  addu       $2, $23, $sp
/* FB02C 001FAF2C 1001438C */  lw         $3, 0x110($2)
/* FB030 001FAF30 0000C283 */  lb         $2, 0x0($fp)
/* FB034 001FAF34 23506200 */  subu       $10, $3, $2
/* FB038 001FAF38 0C000726 */  addiu      $7, $16, 0xC
/* FB03C 001FAF3C D000A427 */  addiu      $4, $sp, 0xD0
/* FB040 001FAF40 40000524 */  addiu      $5, $0, 0x40
/* FB044 001FAF44 4001A627 */  addiu      $6, $sp, 0x140
/* FB048 001FAF48 CC00A88F */  lw         $8, 0xCC($sp)
/* FB04C 001FAF4C 284E8072 */  paddub     $9, $20, $0
/* FB050 001FAF50 08E7070C */  jal        WepStatusVolumeDraw__F4RECTiPiiiii
/* FB054 001FAF54 00000000 */   nop
/* FB058 001FAF58 08002012 */  beqz       $17, .L001FAF7C
/* FB05C 001FAF5C 00000000 */   nop
/* FB060 001FAF60 D000A28F */  lw         $2, 0xD0($sp)
/* FB064 001FAF64 1E004424 */  addiu      $4, $2, 0x1E
/* FB068 001FAF68 0000628E */  lw         $2, 0x0($19)
/* FB06C 001FAF6C 04004524 */  addiu      $5, $2, 0x4
/* FB070 001FAF70 80000624 */  addiu      $6, $0, 0x80
/* FB074 001FAF74 ACE7070C */  jal        DrawLimmitMax__Fiii
/* FB078 001FAF78 00000000 */   nop
.L001FAF7C:
/* FB07C 001FAF7C 0000638E */  lw         $3, 0x0($19)
/* FB080 001FAF80 18006324 */  addiu      $3, $3, 0x18
/* FB084 001FAF84 000063AE */  sw         $3, 0x0($19)
/* FB088 001FAF88 04000324 */  addiu      $3, $0, 0x4
/* FB08C 001FAF8C 05000316 */  bne        $16, $3, .L001FAFA4
/* FB090 001FAF90 00000000 */   nop
/* FB094 001FAF94 8A00C326 */  addiu      $3, $22, 0x8A
/* FB098 001FAF98 D000A3AF */  sw         $3, 0xD0($sp)
/* FB09C 001FAF9C B000A38F */  lw         $3, 0xB0($sp)
/* FB0A0 001FAFA0 000063AE */  sw         $3, 0x0($19)
.L001FAFA4:
/* FB0A4 001FAFA4 01001026 */  addiu      $16, $16, 0x1
.L001FAFA8:
/* FB0A8 001FAFA8 0A00032A */  slti       $3, $16, 0xA
/* FB0AC 001FAFAC AAFF6014 */  bnez       $3, .L001FAE58
/* FB0B0 001FAFB0 00000000 */   nop
/* FB0B4 001FAFB4 A000BF7B */  lq         $31, 0xA0($sp)
/* FB0B8 001FAFB8 9000BE7B */  lq         $fp, 0x90($sp)
/* FB0BC 001FAFBC 8000B77B */  lq         $23, 0x80($sp)
/* FB0C0 001FAFC0 7000B67B */  lq         $22, 0x70($sp)
/* FB0C4 001FAFC4 6000B57B */  lq         $21, 0x60($sp)
/* FB0C8 001FAFC8 5000B47B */  lq         $20, 0x50($sp)
/* FB0CC 001FAFCC 4000B37B */  lq         $19, 0x40($sp)
/* FB0D0 001FAFD0 3000B27B */  lq         $18, 0x30($sp)
/* FB0D4 001FAFD4 2000B17B */  lq         $17, 0x20($sp)
/* FB0D8 001FAFD8 1000B07B */  lq         $16, 0x10($sp)
/* FB0DC 001FAFDC 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* FB0E0 001FAFE0 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* FB0E4 001FAFE4 5001BD27 */  addiu      $sp, $sp, 0x150
/* FB0E8 001FAFE8 0800E003 */  jr         $31
/* FB0EC 001FAFEC 00000000 */   nop
