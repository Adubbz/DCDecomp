.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WeaponLevelUpValueCalc__FP11WEAPON_HAVEP11WEAPON_HAVEii
/* 135D00 00235C00 40FFBD27 */  addiu      $sp, $sp, -0xC0
/* 135D04 00235C04 9000BF7F */  sq         $31, 0x90($sp)
/* 135D08 00235C08 8000BE7F */  sq         $fp, 0x80($sp)
/* 135D0C 00235C0C 7000B77F */  sq         $23, 0x70($sp)
/* 135D10 00235C10 6000B67F */  sq         $22, 0x60($sp)
/* 135D14 00235C14 5000B57F */  sq         $21, 0x50($sp)
/* 135D18 00235C18 4000B47F */  sq         $20, 0x40($sp)
/* 135D1C 00235C1C 3000B37F */  sq         $19, 0x30($sp)
/* 135D20 00235C20 2000B27F */  sq         $18, 0x20($sp)
/* 135D24 00235C24 1000B17F */  sq         $17, 0x10($sp)
/* 135D28 00235C28 0000B07F */  sq         $16, 0x0($sp)
/* 135D2C 00235C2C 28B68070 */  paddub     $22, $4, $0
/* 135D30 00235C30 28AEA070 */  paddub     $21, $5, $0
/* 135D34 00235C34 28F6C070 */  paddub     $fp, $6, $0
/* 135D38 00235C38 E300C012 */  beqz       $22, .L00235FC8
/* 135D3C 00235C3C 00000000 */   nop
/* 135D40 00235C40 A000A427 */  addiu      $4, $sp, 0xA0
/* 135D44 00235C44 282E0070 */  paddub     $5, $0, $0
/* 135D48 00235C48 20000624 */  addiu      $6, $0, 0x20
/* 135D4C 00235C4C 5A0D040C */  jal        memset
/* 135D50 00235C50 00000000 */   nop
/* 135D54 00235C54 2826A072 */  paddub     $4, $21, $0
/* 135D58 00235C58 282E0070 */  paddub     $5, $0, $0
/* 135D5C 00235C5C F8000624 */  addiu      $6, $0, 0xF8
/* 135D60 00235C60 5A0D040C */  jal        memset
/* 135D64 00235C64 00000000 */   nop
/* 135D68 00235C68 288E0070 */  paddub     $17, $0, $0
/* 135D6C 00235C6C 01001224 */  addiu      $18, $0, 0x1
/* 135D70 00235C70 EE00C286 */  lh         $2, 0xEE($22)
/* 135D74 00235C74 25904202 */  or         $18, $18, $2
/* 135D78 00235C78 0000C486 */  lh         $4, 0x0($22)
/* 135D7C 00235C7C D443070C */  jal        GetWeaponData__Fi
/* 135D80 00235C80 00000000 */   nop
/* 135D84 00235C84 289E4070 */  paddub     $19, $2, $0
/* 135D88 00235C88 28860070 */  paddub     $16, $0, $0
/* 135D8C 00235C8C C5000010 */  b          .L00235FA4
/* 135D90 00235C90 00000000 */   nop
.L00235C94:
/* 135D94 00235C94 28860070 */  paddub     $16, $0, $0
/* 135D98 00235C98 26000010 */  b          .L00235D34
/* 135D9C 00235C9C 00000000 */   nop
.L00235CA0:
/* 135DA0 00235CA0 21101302 */  addu       $2, $16, $19
/* 135DA4 00235CA4 0B004280 */  lb         $2, 0xB($2)
/* 135DA8 00235CA8 21004018 */  blez       $2, .L00235D30
/* 135DAC 00235CAC 00000000 */   nop
/* 135DB0 00235CB0 40111000 */  sll        $2, $16, 5
/* 135DB4 00235CB4 2110C202 */  addu       $2, $22, $2
/* 135DB8 00235CB8 28005424 */  addiu      $20, $2, 0x28
/* 135DBC 00235CBC 28004284 */  lh         $2, 0x28($2)
/* 135DC0 00235CC0 51004228 */  slti       $2, $2, 0x51
/* 135DC4 00235CC4 1A004014 */  bnez       $2, .L00235D30
/* 135DC8 00235CC8 00000000 */   nop
/* 135DCC 00235CCC 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 135DD0 00235CD0 00608244 */  mtc1       $2, $f12
/* 135DD4 00235CD4 21101602 */  addu       $2, $16, $22
/* 135DD8 00235CD8 E8004380 */  lb         $3, 0xE8($2)
/* 135DDC 00235CDC 03000224 */  addiu      $2, $0, 0x3
/* 135DE0 00235CE0 03006214 */  bne        $3, $2, .L00235CF0
/* 135DE4 00235CE4 00000000 */   nop
/* 135DE8 00235CE8 0040023C */  lui        $2, (0x40000000 >> 16)
/* 135DEC 00235CEC 00608244 */  mtc1       $2, $f12
.L00235CF0:
/* 135DF0 00235CF0 A000A427 */  addiu      $4, $sp, 0xA0
/* 135DF4 00235CF4 282E8072 */  paddub     $5, $20, $0
/* 135DF8 00235CF8 84D6080C */  jal        AttachMentValuePlus__FP11ATTACH_LISTP11ATTACH_LISTf
/* 135DFC 00235CFC 00000000 */   nop
/* 135E00 00235D00 00008386 */  lh         $3, 0x0($20)
/* 135E04 00235D04 5A000224 */  addiu      $2, $0, 0x5A
/* 135E08 00235D08 09006214 */  bne        $3, $2, .L00235D30
/* 135E0C 00235D0C 00000000 */   nop
/* 135E10 00235D10 01003126 */  addiu      $17, $17, 0x1
/* 135E14 00235D14 04008386 */  lh         $3, 0x4($20)
/* 135E18 00235D18 05006010 */  beqz       $3, .L00235D30
/* 135E1C 00235D1C 00000000 */   nop
/* 135E20 00235D20 01000224 */  addiu      $2, $0, 0x1
/* 135E24 00235D24 02006210 */  beq        $3, $2, .L00235D30
/* 135E28 00235D28 00000000 */   nop
/* 135E2C 00235D2C 25904302 */  or         $18, $18, $3
.L00235D30:
/* 135E30 00235D30 01001026 */  addiu      $16, $16, 0x1
.L00235D34:
/* 135E34 00235D34 0600022A */  slti       $2, $16, 0x6
/* 135E38 00235D38 D9FF4014 */  bnez       $2, .L00235CA0
/* 135E3C 00235D3C 00000000 */   nop
/* 135E40 00235D40 2800A426 */  addiu      $4, $21, 0x28
/* 135E44 00235D44 282E0070 */  paddub     $5, $0, $0
/* 135E48 00235D48 C0000624 */  addiu      $6, $0, 0xC0
/* 135E4C 00235D4C 5A0D040C */  jal        memset
/* 135E50 00235D50 00000000 */   nop
/* 135E54 00235D54 2826A072 */  paddub     $4, $21, $0
/* 135E58 00235D58 282EC072 */  paddub     $5, $22, $0
/* 135E5C 00235D5C F8000624 */  addiu      $6, $0, 0xF8
/* 135E60 00235D60 EC0C040C */  jal        memcpy
/* 135E64 00235D64 00000000 */   nop
/* 135E68 00235D68 A800A287 */  lh         $2, 0xA8($sp)
/* 135E6C 00235D6C 01004324 */  addiu      $3, $2, 0x1
/* 135E70 00235D70 0400A286 */  lh         $2, 0x4($21)
/* 135E74 00235D74 21104300 */  addu       $2, $2, $3
/* 135E78 00235D78 0400A2A6 */  sh         $2, 0x4($21)
/* 135E7C 00235D7C 0400A386 */  lh         $3, 0x4($21)
/* 135E80 00235D80 44006286 */  lh         $2, 0x44($19)
/* 135E84 00235D84 2A084300 */  slt        $at, $2, $3
/* 135E88 00235D88 02002010 */  beqz       $at, .L00235D94
/* 135E8C 00235D8C 00000000 */   nop
/* 135E90 00235D90 0400A2A6 */  sh         $2, 0x4($21)
.L00235D94:
/* 135E94 00235D94 AA00A287 */  lh         $2, 0xAA($sp)
/* 135E98 00235D98 01004324 */  addiu      $3, $2, 0x1
/* 135E9C 00235D9C 0600A286 */  lh         $2, 0x6($21)
/* 135EA0 00235DA0 21104300 */  addu       $2, $2, $3
/* 135EA4 00235DA4 0600A2A6 */  sh         $2, 0x6($21)
/* 135EA8 00235DA8 0600A286 */  lh         $2, 0x6($21)
/* 135EAC 00235DAC 63004228 */  slti       $2, $2, 0x63
/* 135EB0 00235DB0 03004014 */  bnez       $2, .L00235DC0
/* 135EB4 00235DB4 00000000 */   nop
/* 135EB8 00235DB8 63000224 */  addiu      $2, $0, 0x63
/* 135EBC 00235DBC 0600A2A6 */  sh         $2, 0x6($21)
.L00235DC0:
/* 135EC0 00235DC0 AC00A287 */  lh         $2, 0xAC($sp)
/* 135EC4 00235DC4 01004324 */  addiu      $3, $2, 0x1
/* 135EC8 00235DC8 0800A286 */  lh         $2, 0x8($21)
/* 135ECC 00235DCC 21104300 */  addu       $2, $2, $3
/* 135ED0 00235DD0 0800A2A6 */  sh         $2, 0x8($21)
/* 135ED4 00235DD4 0800A286 */  lh         $2, 0x8($21)
/* 135ED8 00235DD8 63004228 */  slti       $2, $2, 0x63
/* 135EDC 00235DDC 03004014 */  bnez       $2, .L00235DEC
/* 135EE0 00235DE0 00000000 */   nop
/* 135EE4 00235DE4 63000224 */  addiu      $2, $0, 0x63
/* 135EE8 00235DE8 0800A2A6 */  sh         $2, 0x8($21)
.L00235DEC:
/* 135EEC 00235DEC AE00A287 */  lh         $2, 0xAE($sp)
/* 135EF0 00235DF0 01004324 */  addiu      $3, $2, 0x1
/* 135EF4 00235DF4 0A00A286 */  lh         $2, 0xA($21)
/* 135EF8 00235DF8 21104300 */  addu       $2, $2, $3
/* 135EFC 00235DFC 0A00A2A6 */  sh         $2, 0xA($21)
/* 135F00 00235E00 0A00A286 */  lh         $2, 0xA($21)
/* 135F04 00235E04 46006386 */  lh         $3, 0x46($19)
/* 135F08 00235E08 2A104300 */  slt        $2, $2, $3
/* 135F0C 00235E0C 02004014 */  bnez       $2, .L00235E18
/* 135F10 00235E10 00000000 */   nop
/* 135F14 00235E14 0A00A3A6 */  sh         $3, 0xA($21)
.L00235E18:
/* 135F18 00235E18 28860070 */  paddub     $16, $0, $0
/* 135F1C 00235E1C 10000010 */  b          .L00235E60
/* 135F20 00235E20 00000000 */   nop
.L00235E24:
/* 135F24 00235E24 21101502 */  addu       $2, $16, $21
/* 135F28 00235E28 17004424 */  addiu      $4, $2, 0x17
/* 135F2C 00235E2C 17004380 */  lb         $3, 0x17($2)
/* 135F30 00235E30 21101D02 */  addu       $2, $16, $sp
/* 135F34 00235E34 B0004280 */  lb         $2, 0xB0($2)
/* 135F38 00235E38 21186200 */  addu       $3, $3, $2
/* 135F3C 00235E3C 63006228 */  slti       $2, $3, 0x63
/* 135F40 00235E40 05004014 */  bnez       $2, .L00235E58
/* 135F44 00235E44 00000000 */   nop
/* 135F48 00235E48 63000224 */  addiu      $2, $0, 0x63
/* 135F4C 00235E4C 000082A0 */  sb         $2, 0x0($4)
/* 135F50 00235E50 02000010 */  b          .L00235E5C
/* 135F54 00235E54 00000000 */   nop
.L00235E58:
/* 135F58 00235E58 000083A0 */  sb         $3, 0x0($4)
.L00235E5C:
/* 135F5C 00235E5C 01001026 */  addiu      $16, $16, 0x1
.L00235E60:
/* 135F60 00235E60 0500022A */  slti       $2, $16, 0x5
/* 135F64 00235E64 EFFF4014 */  bnez       $2, .L00235E24
/* 135F68 00235E68 00000000 */   nop
/* 135F6C 00235E6C 28860070 */  paddub     $16, $0, $0
/* 135F70 00235E70 10000010 */  b          .L00235EB4
/* 135F74 00235E74 00000000 */   nop
.L00235E78:
/* 135F78 00235E78 21101502 */  addu       $2, $16, $21
/* 135F7C 00235E7C 1C004424 */  addiu      $4, $2, 0x1C
/* 135F80 00235E80 1C004380 */  lb         $3, 0x1C($2)
/* 135F84 00235E84 21101D02 */  addu       $2, $16, $sp
/* 135F88 00235E88 B5004280 */  lb         $2, 0xB5($2)
/* 135F8C 00235E8C 21186200 */  addu       $3, $3, $2
/* 135F90 00235E90 63006228 */  slti       $2, $3, 0x63
/* 135F94 00235E94 05004014 */  bnez       $2, .L00235EAC
/* 135F98 00235E98 00000000 */   nop
/* 135F9C 00235E9C 63000224 */  addiu      $2, $0, 0x63
/* 135FA0 00235EA0 000082A0 */  sb         $2, 0x0($4)
/* 135FA4 00235EA4 02000010 */  b          .L00235EB0
/* 135FA8 00235EA8 00000000 */   nop
.L00235EAC:
/* 135FAC 00235EAC 000083A0 */  sb         $3, 0x0($4)
.L00235EB0:
/* 135FB0 00235EB0 01001026 */  addiu      $16, $16, 0x1
.L00235EB4:
/* 135FB4 00235EB4 0A00022A */  slti       $2, $16, 0xA
/* 135FB8 00235EB8 EFFF4014 */  bnez       $2, .L00235E78
/* 135FBC 00235EBC 00000000 */   nop
/* 135FC0 00235EC0 BE11040C */  jal        rand
/* 135FC4 00235EC4 00000000 */   nop
/* 135FC8 00235EC8 03000324 */  addiu      $3, $0, 0x3
/* 135FCC 00235ECC 1A004300 */  div        $0, $2, $3
/* 135FD0 00235ED0 00000000 */  nop
/* 135FD4 00235ED4 00000000 */  nop
/* 135FD8 00235ED8 10200000 */  mfhi       $4
/* 135FDC 00235EDC 0C00C386 */  lh         $3, 0xC($22)
/* 135FE0 00235EE0 01006324 */  addiu      $3, $3, 0x1
/* 135FE4 00235EE4 21186400 */  addu       $3, $3, $4
/* 135FE8 00235EE8 0C00A3A6 */  sh         $3, 0xC($21)
/* 135FEC 00235EEC 0C00A386 */  lh         $3, 0xC($21)
/* 135FF0 00235EF0 64006128 */  slti       $at, $3, 0x64
/* 135FF4 00235EF4 03002014 */  bnez       $at, .L00235F04
/* 135FF8 00235EF8 00000000 */   nop
/* 135FFC 00235EFC 63000324 */  addiu      $3, $0, 0x63
/* 136000 00235F00 0C00A3A6 */  sh         $3, 0xC($21)
.L00235F04:
/* 136004 00235F04 28BE0070 */  paddub     $23, $0, $0
/* 136008 00235F08 28A60070 */  paddub     $20, $0, $0
/* 13600C 00235F0C 21000010 */  b          .L00235F94
/* 136010 00235F10 00000000 */   nop
.L00235F14:
/* 136014 00235F14 21189302 */  addu       $3, $20, $19
/* 136018 00235F18 0B006480 */  lb         $4, 0xB($3)
/* 13601C 00235F1C 1C008018 */  blez       $4, .L00235F90
/* 136020 00235F20 00000000 */   nop
/* 136024 00235F24 02000324 */  addiu      $3, $0, 0x2
/* 136028 00235F28 19008310 */  beq        $4, $3, .L00235F90
/* 13602C 00235F2C 00000000 */   nop
/* 136030 00235F30 0500E012 */  beqz       $23, .L00235F48
/* 136034 00235F34 00000000 */   nop
/* 136038 00235F38 21189502 */  addu       $3, $20, $21
/* 13603C 00235F3C E80060A0 */  sb         $0, 0xE8($3)
/* 136040 00235F40 13000010 */  b          .L00235F90
/* 136044 00235F44 00000000 */   nop
.L00235F48:
/* 136048 00235F48 BE11040C */  jal        rand
/* 13604C 00235F4C 00000000 */   nop
/* 136050 00235F50 32000324 */  addiu      $3, $0, 0x32
/* 136054 00235F54 1A004300 */  div        $0, $2, $3
/* 136058 00235F58 00000000 */  nop
/* 13605C 00235F5C 00000000 */  nop
/* 136060 00235F60 10200000 */  mfhi       $4
/* 136064 00235F64 05000324 */  addiu      $3, $0, 0x5
/* 136068 00235F68 07008314 */  bne        $4, $3, .L00235F88
/* 13606C 00235F6C 00000000 */   nop
/* 136070 00235F70 03000424 */  addiu      $4, $0, 0x3
/* 136074 00235F74 21189502 */  addu       $3, $20, $21
/* 136078 00235F78 E80064A0 */  sb         $4, 0xE8($3)
/* 13607C 00235F7C 01001724 */  addiu      $23, $0, 0x1
/* 136080 00235F80 03000010 */  b          .L00235F90
/* 136084 00235F84 00000000 */   nop
.L00235F88:
/* 136088 00235F88 21189502 */  addu       $3, $20, $21
/* 13608C 00235F8C E80060A0 */  sb         $0, 0xE8($3)
.L00235F90:
/* 136090 00235F90 01009426 */  addiu      $20, $20, 0x1
.L00235F94:
/* 136094 00235F94 0600832A */  slti       $3, $20, 0x6
/* 136098 00235F98 DEFF6014 */  bnez       $3, .L00235F14
/* 13609C 00235F9C 00000000 */   nop
/* 1360A0 00235FA0 01001026 */  addiu      $16, $16, 0x1
.L00235FA4:
/* 1360A4 00235FA4 2A181E02 */  slt        $3, $16, $fp
/* 1360A8 00235FA8 3AFF6014 */  bnez       $3, .L00235C94
/* 1360AC 00235FAC 00000000 */   nop
/* 1360B0 00235FB0 EE00A386 */  lh         $3, 0xEE($21)
/* 1360B4 00235FB4 25187200 */  or         $3, $3, $18
/* 1360B8 00235FB8 EE00A3A6 */  sh         $3, 0xEE($21)
/* 1360BC 00235FBC F000A38E */  lw         $3, 0xF0($21)
/* 1360C0 00235FC0 21187100 */  addu       $3, $3, $17
/* 1360C4 00235FC4 F000A3AE */  sw         $3, 0xF0($21)
.L00235FC8:
/* 1360C8 00235FC8 9000BF7B */  lq         $31, 0x90($sp)
/* 1360CC 00235FCC 8000BE7B */  lq         $fp, 0x80($sp)
/* 1360D0 00235FD0 7000B77B */  lq         $23, 0x70($sp)
/* 1360D4 00235FD4 6000B67B */  lq         $22, 0x60($sp)
/* 1360D8 00235FD8 5000B57B */  lq         $21, 0x50($sp)
/* 1360DC 00235FDC 4000B47B */  lq         $20, 0x40($sp)
/* 1360E0 00235FE0 3000B37B */  lq         $19, 0x30($sp)
/* 1360E4 00235FE4 2000B27B */  lq         $18, 0x20($sp)
/* 1360E8 00235FE8 1000B17B */  lq         $17, 0x10($sp)
/* 1360EC 00235FEC 0000B07B */  lq         $16, 0x0($sp)
/* 1360F0 00235FF0 C000BD27 */  addiu      $sp, $sp, 0xC0
/* 1360F4 00235FF4 0800E003 */  jr         $31
/* 1360F8 00235FF8 00000000 */   nop
/* 1360FC 00235FFC 00000000 */  nop
