.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __pack_d
/* FAA8 0010F9A8 0000838C */  lw         $3, 0x0($4)
/* FAAC 0010F9AC 2D380000 */  daddu      $7, $0, $0
/* FAB0 0010F9B0 0400888C */  lw         $8, 0x4($4)
/* FAB4 0010F9B4 0200622C */  sltiu      $2, $3, 0x2
/* FAB8 0010F9B8 06004010 */  beqz       $2, .L0010F9D4
/* FABC 0010F9BC 100085DC */   ld        $5, 0x10($4)
/* FAC0 0010F9C0 00800234 */  ori        $2, $0, 0x8000
/* FAC4 0010F9C4 3C110200 */  dsll32     $2, $2, 4
/* FAC8 0010F9C8 FF070724 */  addiu      $7, $0, 0x7FF
/* FACC 0010F9CC 2A000010 */  b          .L0010FA78
/* FAD0 0010F9D0 2528A200 */   or        $5, $5, $2
.L0010F9D4:
/* FAD4 0010F9D4 04006238 */  xori       $2, $3, 0x4
/* FAD8 0010F9D8 16004050 */  beql       $2, $0, .L0010FA34
/* FADC 0010F9DC FF070724 */   addiu     $7, $0, 0x7FF
/* FAE0 0010F9E0 02006238 */  xori       $2, $3, 0x2
/* FAE4 0010F9E4 03004014 */  bnez       $2, .L0010F9F4
/* FAE8 0010F9E8 00000000 */   nop
/* FAEC 0010F9EC 22000010 */  b          .L0010FA78
/* FAF0 0010F9F0 2D280000 */   daddu     $5, $0, $0
.L0010F9F4:
/* FAF4 0010F9F4 2000A010 */  beqz       $5, .L0010FA78
/* FAF8 0010F9F8 00000000 */   nop
/* FAFC 0010F9FC 0800838C */  lw         $3, 0x8($4)
/* FB00 0010FA00 02FC6228 */  slti       $2, $3, -0x3FE
/* FB04 0010FA04 07004010 */  beqz       $2, .L0010FA24
/* FB08 0010FA08 02FC0224 */   addiu     $2, $0, -0x3FE
/* FB0C 0010FA0C 23104300 */  subu       $2, $2, $3
/* FB10 0010FA10 39004328 */  slti       $3, $2, 0x39
/* FB14 0010FA14 17006014 */  bnez       $3, .L0010FA74
/* FB18 0010FA18 16284500 */   dsrlv     $5, $5, $2
/* FB1C 0010FA1C 15000010 */  b          .L0010FA74
/* FB20 0010FA20 2D280000 */   daddu     $5, $0, $0
.L0010FA24:
/* FB24 0010FA24 00046228 */  slti       $2, $3, 0x400
/* FB28 0010FA28 04004014 */  bnez       $2, .L0010FA3C
/* FB2C 0010FA2C FF036724 */   addiu     $7, $3, 0x3FF
/* FB30 0010FA30 FF070724 */  addiu      $7, $0, 0x7FF
.L0010FA34:
/* FB34 0010FA34 10000010 */  b          .L0010FA78
/* FB38 0010FA38 2D280000 */   daddu     $5, $0, $0
.L0010FA3C:
/* FB3C 0010FA3C 80000224 */  addiu      $2, $0, 0x80
/* FB40 0010FA40 FF00A330 */  andi       $3, $5, 0xFF
/* FB44 0010FA44 04006254 */  bnel       $3, $2, .L0010FA58
/* FB48 0010FA48 7F00A564 */   daddiu    $5, $5, 0x7F
/* FB4C 0010FA4C 0001A330 */  andi       $3, $5, 0x100
/* FB50 0010FA50 8000A264 */  daddiu     $2, $5, 0x80
/* FB54 0010FA54 0B284300 */  movn       $5, $2, $3
.L0010FA58:
/* FB58 0010FA58 FFFF0224 */  addiu      $2, $0, -0x1
/* FB5C 0010FA5C FA100200 */  dsrl       $2, $2, 3
/* FB60 0010FA60 2B104500 */  sltu       $2, $2, $5
/* FB64 0010FA64 04004050 */  beql       $2, $0, .L0010FA78
/* FB68 0010FA68 3A2A0500 */   dsrl      $5, $5, 8
/* FB6C 0010FA6C 7A280500 */  dsrl       $5, $5, 1
/* FB70 0010FA70 0100E724 */  addiu      $7, $7, 0x1
.L0010FA74:
/* FB74 0010FA74 3A2A0500 */  dsrl       $5, $5, 8
.L0010FA78:
/* FB78 0010FA78 F0FF0334 */  ori        $3, $0, 0xFFF0
/* FB7C 0010FA7C 3C1C0300 */  dsll32     $3, $3, 16
/* FB80 0010FA80 FFFF0224 */  addiu      $2, $0, -0x1
/* FB84 0010FA84 3A130200 */  dsrl       $2, $2, 12
/* FB88 0010FA88 2410A200 */  and        $2, $5, $2
/* FB8C 0010FA8C 2430C300 */  and        $6, $6, $3
/* FB90 0010FA90 2530C200 */  or         $6, $6, $2
/* FB94 0010FA94 FF07E330 */  andi       $3, $7, 0x7FF
/* FB98 0010FA98 0F80023C */  lui        $2, (0x800FFFFF >> 16)
/* FB9C 0010FA9C FFFF4234 */  ori        $2, $2, (0x800FFFFF & 0xFFFF)
/* FBA0 0010FAA0 38140200 */  dsll       $2, $2, 16
/* FBA4 0010FAA4 FFFF4234 */  ori        $2, $2, 0xFFFF
/* FBA8 0010FAA8 38140200 */  dsll       $2, $2, 16
/* FBAC 0010FAAC FFFF4234 */  ori        $2, $2, 0xFFFF
/* FBB0 0010FAB0 3C1D0300 */  dsll32     $3, $3, 20
/* FBB4 0010FAB4 2430C200 */  and        $6, $6, $2
/* FBB8 0010FAB8 FFFF0424 */  addiu      $4, $0, -0x1
/* FBBC 0010FABC 7A200400 */  dsrl       $4, $4, 1
/* FBC0 0010FAC0 2530C300 */  or         $6, $6, $3
/* FBC4 0010FAC4 FC170800 */  dsll32     $2, $8, 31
/* FBC8 0010FAC8 2430C400 */  and        $6, $6, $4
/* FBCC 0010FACC 0800E003 */  jr         $31
/* FBD0 0010FAD0 2510C200 */   or        $2, $6, $2
/* FBD4 0010FAD4 00000000 */  nop
