.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceMSIn_PutMsg
/* 1F390 0011F290 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 1F394 0011F294 F000C330 */  andi       $3, $6, 0xF0
/* 1F398 0011F298 1000BFFF */  sd         $31, 0x10($sp)
/* 1F39C 0011F29C B0000224 */  addiu      $2, $0, 0xB0
/* 1F3A0 0011F2A0 21006210 */  beq        $3, $2, .L0011F328
/* 1F3A4 0011F2A4 0000A6AF */   sw        $6, 0x0($sp)
/* 1F3A8 0011F2A8 B100622C */  sltiu      $2, $3, 0xB1
/* 1F3AC 0011F2AC 0E004010 */  beqz       $2, .L0011F2E8
/* 1F3B0 0011F2B0 90000224 */   addiu     $2, $0, 0x90
/* 1F3B4 0011F2B4 1C006210 */  beq        $3, $2, .L0011F328
/* 1F3B8 0011F2B8 9100622C */   sltiu     $2, $3, 0x91
/* 1F3BC 0011F2BC 05004010 */  beqz       $2, .L0011F2D4
/* 1F3C0 0011F2C0 80000224 */   addiu     $2, $0, 0x80
/* 1F3C4 0011F2C4 16006210 */  beq        $3, $2, .L0011F320
/* 1F3C8 0011F2C8 FFFF0224 */   addiu     $2, $0, -0x1
/* 1F3CC 0011F2CC 1A000010 */  b          .L0011F338
/* 1F3D0 0011F2D0 1000BFDF */   ld        $31, 0x10($sp)
.L0011F2D4:
/* 1F3D4 0011F2D4 A0000224 */  addiu      $2, $0, 0xA0
/* 1F3D8 0011F2D8 13006210 */  beq        $3, $2, .L0011F328
/* 1F3DC 0011F2DC FFFF0224 */   addiu     $2, $0, -0x1
/* 1F3E0 0011F2E0 15000010 */  b          .L0011F338
/* 1F3E4 0011F2E4 1000BFDF */   ld        $31, 0x10($sp)
.L0011F2E8:
/* 1F3E8 0011F2E8 D0000224 */  addiu      $2, $0, 0xD0
/* 1F3EC 0011F2EC 0C006210 */  beq        $3, $2, .L0011F320
/* 1F3F0 0011F2F0 D100622C */   sltiu     $2, $3, 0xD1
/* 1F3F4 0011F2F4 05004010 */  beqz       $2, .L0011F30C
/* 1F3F8 0011F2F8 C0000224 */   addiu     $2, $0, 0xC0
/* 1F3FC 0011F2FC 08006210 */  beq        $3, $2, .L0011F320
/* 1F400 0011F300 FFFF0224 */   addiu     $2, $0, -0x1
/* 1F404 0011F304 0C000010 */  b          .L0011F338
/* 1F408 0011F308 1000BFDF */   ld        $31, 0x10($sp)
.L0011F30C:
/* 1F40C 0011F30C E0000224 */  addiu      $2, $0, 0xE0
/* 1F410 0011F310 05006210 */  beq        $3, $2, .L0011F328
/* 1F414 0011F314 FFFF0224 */   addiu     $2, $0, -0x1
/* 1F418 0011F318 07000010 */  b          .L0011F338
/* 1F41C 0011F31C 1000BFDF */   ld        $31, 0x10($sp)
.L0011F320:
/* 1F420 0011F320 02000010 */  b          .L0011F32C
/* 1F424 0011F324 02000724 */   addiu     $7, $0, 0x2
.L0011F328:
/* 1F428 0011F328 03000724 */  addiu      $7, $0, 0x3
.L0011F32C:
/* 1F42C 0011F32C 7E7C040C */  jal        put_message
/* 1F430 0011F330 2D30A003 */   daddu     $6, $sp, $0
/* 1F434 0011F334 1000BFDF */  ld         $31, 0x10($sp)
.L0011F338:
/* 1F438 0011F338 0800E003 */  jr         $31
/* 1F43C 0011F33C 2000BD27 */   addiu     $sp, $sp, 0x20
