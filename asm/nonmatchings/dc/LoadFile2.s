.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoadFile2__FPcPvPii
/* 3F4D0 0013F3D0 A0FDBD27 */  addiu      $sp, $sp, -0x260
/* 3F4D4 0013F3D4 3000BF7F */  sq         $31, 0x30($sp)
/* 3F4D8 0013F3D8 2000B27F */  sq         $18, 0x20($sp)
/* 3F4DC 0013F3DC 1000B17F */  sq         $17, 0x10($sp)
/* 3F4E0 0013F3E0 0000B07F */  sq         $16, 0x0($sp)
/* 3F4E4 0013F3E4 2896A070 */  paddub     $18, $5, $0
/* 3F4E8 0013F3E8 288EC070 */  paddub     $17, $6, $0
/* 3F4EC 0013F3EC 02002012 */  beqz       $17, .L0013F3F8
/* 3F4F0 0013F3F0 00000000 */   nop
/* 3F4F4 0013F3F4 000020AE */  sw         $0, 0x0($17)
.L0013F3F8:
/* 3F4F8 0013F3F8 2500023C */  lui        $2, %hi(_442)
/* 3F4FC 0013F3FC 80164224 */  addiu      $2, $2, %lo(_442)
/* 3F500 0013F400 4001A327 */  addiu      $3, $sp, 0x140
/* 3F504 0013F404 00004278 */  lq         $2, 0x0($2)
/* 3F508 0013F408 0000627C */  sq         $2, 0x0($3)
/* 3F50C 0013F40C 2500023C */  lui        $2, %hi(_443)
/* 3F510 0013F410 90164224 */  addiu      $2, $2, %lo(_443)
/* 3F514 0013F414 5001A327 */  addiu      $3, $sp, 0x150
/* 3F518 0013F418 00004278 */  lq         $2, 0x0($2)
/* 3F51C 0013F41C 0000627C */  sq         $2, 0x0($3)
/* 3F520 0013F420 282E8070 */  paddub     $5, $4, $0
/* 3F524 0013F424 4000A627 */  addiu      $6, $sp, 0x40
/* 3F528 0013F428 09000010 */  b          .L0013F450
/* 3F52C 0013F42C 00000000 */   nop
.L0013F430:
/* 3F530 0013F430 3C1E0700 */  dsll32     $3, $7, 24
/* 3F534 0013F434 3F1E0300 */  dsra32     $3, $3, 24
/* 3F538 0013F438 3A000224 */  addiu      $2, $0, 0x3A
/* 3F53C 0013F43C 07006210 */  beq        $3, $2, .L0013F45C
/* 3F540 0013F440 00000000 */   nop
/* 3F544 0013F444 0000C7A0 */  sb         $7, 0x0($6)
/* 3F548 0013F448 0100C624 */  addiu      $6, $6, 0x1
/* 3F54C 0013F44C 0100A524 */  addiu      $5, $5, 0x1
.L0013F450:
/* 3F550 0013F450 0000A780 */  lb         $7, 0x0($5)
/* 3F554 0013F454 F6FFE014 */  bnez       $7, .L0013F430
/* 3F558 0013F458 00000000 */   nop
.L0013F45C:
/* 3F55C 0013F45C 0400E010 */  beqz       $7, .L0013F470
/* 3F560 0013F460 00000000 */   nop
/* 3F564 0013F464 0100A424 */  addiu      $4, $5, 0x1
/* 3F568 0013F468 01000010 */  b          .L0013F470
/* 3F56C 0013F46C 00000000 */   nop
.L0013F470:
/* 3F570 0013F470 28868070 */  paddub     $16, $4, $0
/* 3F574 0013F474 4000A427 */  addiu      $4, $sp, 0x40
/* 3F578 0013F478 2A00023C */  lui        $2, %hi(_467)
/* 3F57C 0013F47C 70914524 */  addiu      $5, $2, %lo(_467)
/* 3F580 0013F480 04000624 */  addiu      $6, $0, 0x4
/* 3F584 0013F484 C60C040C */  jal        memcmp
/* 3F588 0013F488 00000000 */   nop
/* 3F58C 0013F48C 0A004010 */  beqz       $2, .L0013F4B8
/* 3F590 0013F490 00000000 */   nop
/* 3F594 0013F494 2500023C */  lui        $2, %hi(CurrentDir)
/* 3F598 0013F498 80154424 */  addiu      $4, $2, %lo(CurrentDir)
/* 3F59C 0013F49C 2A00023C */  lui        $2, %hi(_468)
/* 3F5A0 0013F4A0 78914524 */  addiu      $5, $2, %lo(_468)
/* 3F5A4 0013F4A4 04000624 */  addiu      $6, $0, 0x4
/* 3F5A8 0013F4A8 C60C040C */  jal        memcmp
/* 3F5AC 0013F4AC 00000000 */   nop
/* 3F5B0 0013F4B0 01004014 */  bnez       $2, .L0013F4B8
/* 3F5B4 0013F4B4 00000000 */   nop
.L0013F4B8:
/* 3F5B8 0013F4B8 0002013C */  lui        $at, (0x2000001 >> 16)
/* 3F5BC 0013F4BC 01002134 */  ori        $at, $at, (0x2000001 & 0xFFFF)
/* 3F5C0 0013F4C0 2A084102 */  slt        $at, $18, $at
/* 3F5C4 0013F4C4 07002014 */  bnez       $at, .L0013F4E4
/* 3F5C8 0013F4C8 00000000 */   nop
/* 3F5CC 0013F4CC 2A00023C */  lui        $2, %hi(_234)
/* 3F5D0 0013F4D0 78904424 */  addiu      $4, $2, %lo(_234)
/* 3F5D4 0013F4D4 A611040C */  jal        printf
/* 3F5D8 0013F4D8 00000000 */   nop
.L0013F4DC:
/* 3F5DC 0013F4DC FFFF0010 */  b          .L0013F4DC
/* 3F5E0 0013F4E0 00000000 */   nop
.L0013F4E4:
/* 3F5E4 0013F4E4 2500023C */  lui        $2, %hi(_464)
/* 3F5E8 0013F4E8 A0164624 */  addiu      $6, $2, %lo(_464)
/* 3F5EC 0013F4EC 6001A527 */  addiu      $5, $sp, 0x160
/* 3F5F0 0013F4F0 08000424 */  addiu      $4, $0, 0x8
.L0013F4F4:
/* 3F5F4 0013F4F4 0000C378 */  lq         $3, 0x0($6)
/* 3F5F8 0013F4F8 1000C278 */  lq         $2, 0x10($6)
/* 3F5FC 0013F4FC 2000C624 */  addiu      $6, $6, 0x20
/* 3F600 0013F500 FFFF8424 */  addiu      $4, $4, -0x1
/* 3F604 0013F504 0000A37C */  sq         $3, 0x0($5)
/* 3F608 0013F508 1000A27C */  sq         $2, 0x10($5)
/* 3F60C 0013F50C 2000A524 */  addiu      $5, $5, 0x20
/* 3F610 0013F510 F8FF801C */  bgtz       $4, .L0013F4F4
/* 3F614 0013F514 00000000 */   nop
/* 3F618 0013F518 6001A427 */  addiu      $4, $sp, 0x160
/* 3F61C 0013F51C 282E0072 */  paddub     $5, $16, $0
/* 3F620 0013F520 BC14040C */  jal        strcat
/* 3F624 0013F524 00000000 */   nop
/* 3F628 0013F528 6001A427 */  addiu      $4, $sp, 0x160
/* 3F62C 0013F52C 282E4072 */  paddub     $5, $18, $0
/* 3F630 0013F530 28362072 */  paddub     $6, $17, $0
/* 3F634 0013F534 58FD040C */  jal        CDRead__FPcPUiPi
/* 3F638 0013F538 00000000 */   nop
/* 3F63C 0013F53C 3000BF7B */  lq         $31, 0x30($sp)
/* 3F640 0013F540 2000B27B */  lq         $18, 0x20($sp)
/* 3F644 0013F544 1000B17B */  lq         $17, 0x10($sp)
/* 3F648 0013F548 0000B07B */  lq         $16, 0x0($sp)
/* 3F64C 0013F54C 6002BD27 */  addiu      $sp, $sp, 0x260
/* 3F650 0013F550 0800E003 */  jr         $31
/* 3F654 0013F554 00000000 */   nop
/* 3F658 0013F558 00000000 */  nop
/* 3F65C 0013F55C 00000000 */  nop
