.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _fpadd_parts
/* FC78 0010FB78 2D408000 */  daddu      $8, $4, $0
/* FC7C 0010FB7C 0000048D */  lw         $4, 0x0($8)
/* FC80 0010FB80 0200822C */  sltiu      $2, $4, 0x2
/* FC84 0010FB84 03004050 */  beql       $2, $0, .L0010FB94
/* FC88 0010FB88 0000A38C */   lw        $3, 0x0($5)
.L0010FB8C:
/* FC8C 0010FB8C 0800E003 */  jr         $31
/* FC90 0010FB90 2D100001 */   daddu     $2, $8, $0
.L0010FB94:
/* FC94 0010FB94 0200622C */  sltiu      $2, $3, 0x2
/* FC98 0010FB98 03004010 */  beqz       $2, .L0010FBA8
/* FC9C 0010FB9C 04008238 */   xori      $2, $4, 0x4
.L0010FBA0:
/* FCA0 0010FBA0 0800E003 */  jr         $31
/* FCA4 0010FBA4 2D10A000 */   daddu     $2, $5, $0
.L0010FBA8:
/* FCA8 0010FBA8 09004014 */  bnez       $2, .L0010FBD0
/* FCAC 0010FBAC 04006238 */   xori      $2, $3, 0x4
/* FCB0 0010FBB0 F6FF4014 */  bnez       $2, .L0010FB8C
/* FCB4 0010FBB4 00000000 */   nop
/* FCB8 0010FBB8 0400A38C */  lw         $3, 0x4($5)
/* FCBC 0010FBBC 0400028D */  lw         $2, 0x4($8)
/* FCC0 0010FBC0 F2FF4310 */  beq        $2, $3, .L0010FB8C
/* FCC4 0010FBC4 2A00023C */   lui       $2, %hi(D_002A4F68)
/* FCC8 0010FBC8 0800E003 */  jr         $31
/* FCCC 0010FBCC 684F4224 */   addiu     $2, $2, %lo(D_002A4F68)
.L0010FBD0:
/* FCD0 0010FBD0 F3FF4010 */  beqz       $2, .L0010FBA0
/* FCD4 0010FBD4 02006238 */   xori      $2, $3, 0x2
/* FCD8 0010FBD8 0E004014 */  bnez       $2, .L0010FC14
/* FCDC 0010FBDC 02008238 */   xori      $2, $4, 0x2
/* FCE0 0010FBE0 EAFF4014 */  bnez       $2, .L0010FB8C
/* FCE4 0010FBE4 2D10C000 */   daddu     $2, $6, $0
/* FCE8 0010FBE8 000004DD */  ld         $4, 0x0($8)
/* FCEC 0010FBEC 0000C4FC */  sd         $4, 0x0($6)
/* FCF0 0010FBF0 080003DD */  ld         $3, 0x8($8)
/* FCF4 0010FBF4 0800C3FC */  sd         $3, 0x8($6)
/* FCF8 0010FBF8 100004DD */  ld         $4, 0x10($8)
/* FCFC 0010FBFC 1000C4FC */  sd         $4, 0x10($6)
/* FD00 0010FC00 0400038D */  lw         $3, 0x4($8)
/* FD04 0010FC04 0400A48C */  lw         $4, 0x4($5)
/* FD08 0010FC08 24186400 */  and        $3, $3, $4
/* FD0C 0010FC0C 0800E003 */  jr         $31
/* FD10 0010FC10 0400C3AC */   sw        $3, 0x4($6)
.L0010FC14:
/* FD14 0010FC14 E2FF4010 */  beqz       $2, .L0010FBA0
/* FD18 0010FC18 FFFF0224 */   addiu     $2, $0, -0x1
/* FD1C 0010FC1C 0800078D */  lw         $7, 0x8($8)
/* FD20 0010FC20 0800A98C */  lw         $9, 0x8($5)
/* FD24 0010FC24 10000BDD */  ld         $11, 0x10($8)
/* FD28 0010FC28 2318E900 */  subu       $3, $7, $9
/* FD2C 0010FC2C 2A104300 */  slt        $2, $2, $3
/* FD30 0010FC30 23200300 */  negu       $4, $3
/* FD34 0010FC34 0A188200 */  movz       $3, $4, $2
/* FD38 0010FC38 40006328 */  slti       $3, $3, 0x40
/* FD3C 0010FC3C 1D006010 */  beqz       $3, .L0010FCB4
/* FD40 0010FC40 1000AADC */   ld        $10, 0x10($5)
/* FD44 0010FC44 2A102701 */  slt        $2, $9, $7
/* FD48 0010FC48 0C004010 */  beqz       $2, .L0010FC7C
/* FD4C 0010FC4C 0400088D */   lw        $8, 0x4($8)
/* FD50 0010FC50 0400A58C */  lw         $5, 0x4($5)
/* FD54 0010FC54 00000000 */  nop
.L0010FC58:
/* FD58 0010FC58 7A100A00 */  dsrl       $2, $10, 1
/* FD5C 0010FC5C 01002925 */  addiu      $9, $9, 0x1
/* FD60 0010FC60 01004331 */  andi       $3, $10, 0x1
/* FD64 0010FC64 2A202701 */  slt        $4, $9, $7
/* FD68 0010FC68 25506200 */  or         $10, $3, $2
/* FD6C 0010FC6C FAFF8014 */  bnez       $4, .L0010FC58
/* FD70 0010FC70 00000000 */   nop
/* FD74 0010FC74 03000010 */  b          .L0010FC84
/* FD78 0010FC78 2A10E900 */   slt       $2, $7, $9
.L0010FC7C:
/* FD7C 0010FC7C 0400A58C */  lw         $5, 0x4($5)
/* FD80 0010FC80 2A10E900 */  slt        $2, $7, $9
.L0010FC84:
/* FD84 0010FC84 14004010 */  beqz       $2, .L0010FCD8
/* FD88 0010FC88 00000000 */   nop
/* FD8C 0010FC8C 23382701 */  subu       $7, $9, $7
.L0010FC90:
/* FD90 0010FC90 7A180B00 */  dsrl       $3, $11, 1
/* FD94 0010FC94 01006231 */  andi       $2, $11, 0x1
/* FD98 0010FC98 25584300 */  or         $11, $2, $3
/* FD9C 0010FC9C FFFFE724 */  addiu      $7, $7, -0x1
/* FDA0 0010FCA0 00000000 */  nop
/* FDA4 0010FCA4 FAFFE014 */  bnez       $7, .L0010FC90
/* FDA8 0010FCA8 00000000 */   nop
/* FDAC 0010FCAC 0A000010 */  b          .L0010FCD8
/* FDB0 0010FCB0 2D382001 */   daddu     $7, $9, $0
.L0010FCB4:
/* FDB4 0010FCB4 2A102701 */  slt        $2, $9, $7
/* FDB8 0010FCB8 04004010 */  beqz       $2, .L0010FCCC
/* FDBC 0010FCBC 0400088D */   lw        $8, 0x4($8)
/* FDC0 0010FCC0 2D500000 */  daddu      $10, $0, $0
/* FDC4 0010FCC4 04000010 */  b          .L0010FCD8
/* FDC8 0010FCC8 0400A58C */   lw        $5, 0x4($5)
.L0010FCCC:
/* FDCC 0010FCCC 2D382001 */  daddu      $7, $9, $0
/* FDD0 0010FCD0 0400A58C */  lw         $5, 0x4($5)
/* FDD4 0010FCD4 2D580000 */  daddu      $11, $0, $0
.L0010FCD8:
/* FDD8 0010FCD8 24000511 */  beq        $8, $5, .L0010FD6C
/* FDDC 0010FCDC 2D106A01 */   daddu     $2, $11, $10
/* FDE0 0010FCE0 02000015 */  bnez       $8, .L0010FCEC
/* FDE4 0010FCE4 2F104B01 */   dsubu     $2, $10, $11
/* FDE8 0010FCE8 2F106A01 */  dsubu      $2, $11, $10
.L0010FCEC:
/* FDEC 0010FCEC 05004004 */  bltz       $2, .L0010FD04
/* FDF0 0010FCF0 2F180200 */   dsubu     $3, $0, $2
/* FDF4 0010FCF4 0800C7AC */  sw         $7, 0x8($6)
/* FDF8 0010FCF8 1000C2FC */  sd         $2, 0x10($6)
/* FDFC 0010FCFC 05000010 */  b          .L0010FD14
/* FE00 0010FD00 0400C0AC */   sw        $0, 0x4($6)
.L0010FD04:
/* FE04 0010FD04 0800C7AC */  sw         $7, 0x8($6)
/* FE08 0010FD08 01000224 */  addiu      $2, $0, 0x1
/* FE0C 0010FD0C 1000C3FC */  sd         $3, 0x10($6)
/* FE10 0010FD10 0400C2AC */  sw         $2, 0x4($6)
.L0010FD14:
/* FE14 0010FD14 1000C5DC */  ld         $5, 0x10($6)
/* FE18 0010FD18 FFFF0224 */  addiu      $2, $0, -0x1
/* FE1C 0010FD1C 78110200 */  dsll       $2, $2, 5
/* FE20 0010FD20 3A110200 */  dsrl       $2, $2, 4
/* FE24 0010FD24 FFFFA364 */  daddiu     $3, $5, -0x1
/* FE28 0010FD28 2B104300 */  sltu       $2, $2, $3
/* FE2C 0010FD2C 13004014 */  bnez       $2, .L0010FD7C
/* FE30 0010FD30 2D38A000 */   daddu     $7, $5, $0
/* FE34 0010FD34 FFFF0524 */  addiu      $5, $0, -0x1
/* FE38 0010FD38 78290500 */  dsll       $5, $5, 5
/* FE3C 0010FD3C 3A290500 */  dsrl       $5, $5, 4
.L0010FD40:
/* FE40 0010FD40 0800C28C */  lw         $2, 0x8($6)
/* FE44 0010FD44 78200700 */  dsll       $4, $7, 1
/* FE48 0010FD48 FFFF8364 */  daddiu     $3, $4, -0x1
/* FE4C 0010FD4C 1000C4FC */  sd         $4, 0x10($6)
/* FE50 0010FD50 FFFF4224 */  addiu      $2, $2, -0x1
/* FE54 0010FD54 2B18A300 */  sltu       $3, $5, $3
/* FE58 0010FD58 0800C2AC */  sw         $2, 0x8($6)
/* FE5C 0010FD5C F8FF6010 */  beqz       $3, .L0010FD40
/* FE60 0010FD60 2D388000 */   daddu     $7, $4, $0
/* FE64 0010FD64 05000010 */  b          .L0010FD7C
/* FE68 0010FD68 2D288000 */   daddu     $5, $4, $0
.L0010FD6C:
/* FE6C 0010FD6C 0400C8AC */  sw         $8, 0x4($6)
/* FE70 0010FD70 0800C7AC */  sw         $7, 0x8($6)
/* FE74 0010FD74 2D284000 */  daddu      $5, $2, $0
/* FE78 0010FD78 1000C2FC */  sd         $2, 0x10($6)
.L0010FD7C:
/* FE7C 0010FD7C 03000324 */  addiu      $3, $0, 0x3
/* FE80 0010FD80 FFFF0224 */  addiu      $2, $0, -0x1
/* FE84 0010FD84 FA100200 */  dsrl       $2, $2, 3
/* FE88 0010FD88 2B104500 */  sltu       $2, $2, $5
/* FE8C 0010FD8C 08004010 */  beqz       $2, .L0010FDB0
/* FE90 0010FD90 0000C3AC */   sw        $3, 0x0($6)
/* FE94 0010FD94 0800C28C */  lw         $2, 0x8($6)
/* FE98 0010FD98 7A200500 */  dsrl       $4, $5, 1
/* FE9C 0010FD9C 0100A330 */  andi       $3, $5, 0x1
/* FEA0 0010FDA0 25186400 */  or         $3, $3, $4
/* FEA4 0010FDA4 01004224 */  addiu      $2, $2, 0x1
/* FEA8 0010FDA8 1000C3FC */  sd         $3, 0x10($6)
/* FEAC 0010FDAC 0800C2AC */  sw         $2, 0x8($6)
.L0010FDB0:
/* FEB0 0010FDB0 0800E003 */  jr         $31
/* FEB4 0010FDB4 2D10C000 */   daddu     $2, $6, $0
