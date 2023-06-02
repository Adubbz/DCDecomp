.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel scePadInit
/* 1F630 0011F530 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 1F634 0011F534 2500033C */  lui        $3, (0x250A50 >> 16)
/* 1F638 0011F538 2000B2FF */  sd         $18, 0x20($sp)
/* 1F63C 0011F53C 01000224 */  addiu      $2, $0, 0x1
/* 1F640 0011F540 3000BFFF */  sd         $31, 0x30($sp)
/* 1F644 0011F544 2D908000 */  daddu      $18, $4, $0
/* 1F648 0011F548 1000B1FF */  sd         $17, 0x10($sp)
/* 1F64C 0011F54C 0000B0FF */  sd         $16, 0x0($sp)
/* 1F650 0011F550 500A62AC */  sw         $2, (0x250A50 & 0xFFFF)($3)
/* 1F654 0011F554 0B000010 */  b          .L0011F584
/* 1F658 0011F558 2B00113C */   lui       $17, %hi(D_002A9C40)
/* 1F65C 0011F55C 00000000 */  nop
.L0011F560:
/* 1F660 0011F560 FFFF0324 */  addiu      $3, $0, -0x1
/* 1F664 0011F564 00000000 */  nop
.L0011F568:
/* 1F668 0011F568 FFFF4224 */  addiu      $2, $2, %lo(D_FFFF)
/* 1F66C 0011F56C 00000000 */  nop
/* 1F670 0011F570 00000000 */  nop
/* 1F674 0011F574 00000000 */  nop
/* 1F678 0011F578 00000000 */  nop
/* 1F67C 0011F57C FAFF4314 */  bne        $2, $3, .L0011F568
/* 1F680 0011F580 00000000 */   nop
.L0011F584:
/* 1F684 0011F584 409C3026 */  addiu      $16, $17, %lo(D_002A9C40)
/* 1F688 0011F588 0080053C */  lui        $5, (0x80000100 >> 16)
/* 1F68C 0011F58C 2D200002 */  daddu      $4, $16, $0
/* 1F690 0011F590 0001A534 */  ori        $5, $5, (0x80000100 & 0xFFFF)
/* 1F694 0011F594 B65C040C */  jal        sceSifBindRpc
/* 1F698 0011F598 2D300000 */   daddu     $6, $0, $0
/* 1F69C 0011F59C 2400038E */  lw         $3, 0x24($16)
/* 1F6A0 0011F5A0 EFFF6010 */  beqz       $3, .L0011F560
/* 1F6A4 0011F5A4 0100023C */   lui       $2, %hi(D_FFFF)
/* 1F6A8 0011F5A8 2D880002 */  daddu      $17, $16, $0
/* 1F6AC 0011F5AC 0B000010 */  b          .L0011F5DC
/* 1F6B0 0011F5B0 28001026 */   addiu     $16, $16, 0x28
/* 1F6B4 0011F5B4 00000000 */  nop
.L0011F5B8:
/* 1F6B8 0011F5B8 FFFF0324 */  addiu      $3, $0, -0x1
/* 1F6BC 0011F5BC 00000000 */  nop
.L0011F5C0:
/* 1F6C0 0011F5C0 FFFF4224 */  addiu      $2, $2, %lo(D_FFFF)
/* 1F6C4 0011F5C4 00000000 */  nop
/* 1F6C8 0011F5C8 00000000 */  nop
/* 1F6CC 0011F5CC 00000000 */  nop
/* 1F6D0 0011F5D0 00000000 */  nop
/* 1F6D4 0011F5D4 FAFF4314 */  bne        $2, $3, .L0011F5C0
/* 1F6D8 0011F5D8 00000000 */   nop
.L0011F5DC:
/* 1F6DC 0011F5DC 0080053C */  lui        $5, (0x80000101 >> 16)
/* 1F6E0 0011F5E0 2D200002 */  daddu      $4, $16, $0
/* 1F6E4 0011F5E4 0101A534 */  ori        $5, $5, (0x80000101 & 0xFFFF)
/* 1F6E8 0011F5E8 B65C040C */  jal        sceSifBindRpc
/* 1F6EC 0011F5EC 2D300000 */   daddu     $6, $0, $0
/* 1F6F0 0011F5F0 4C00238E */  lw         $3, 0x4C($17)
/* 1F6F4 0011F5F4 F0FF6010 */  beqz       $3, .L0011F5B8
/* 1F6F8 0011F5F8 0100023C */   lui       $2, (0x10000 >> 16)
/* 1F6FC 0011F5FC A081040C */  jal        scePadGetModVersion
/* 1F700 0011F600 00000000 */   nop
/* 1F704 0011F604 2D884000 */  daddu      $17, $2, $0
/* 1F708 0011F608 04000224 */  addiu      $2, $0, 0x4
/* 1F70C 0011F60C 03821100 */  sra        $16, $17, 8
/* 1F710 0011F610 0F000212 */  beq        $16, $2, .L0011F650
/* 1F714 0011F614 2500023C */   lui       $2, (0x250A54 >> 16)
/* 1F718 0011F618 540A438C */  lw         $3, (0x250A54 & 0xFFFF)($2)
/* 1F71C 0011F61C 0A006010 */  beqz       $3, .L0011F648
/* 1F720 0011F620 2A00043C */   lui       $4, %hi(D_00298B78)
/* 1F724 0011F624 A611040C */  jal        printf
/* 1F728 0011F628 788B8424 */   addiu     $4, $4, %lo(D_00298B78)
/* 1F72C 0011F62C 2A00043C */  lui        $4, %hi(D_00298BA0)
/* 1F730 0011F630 2D380002 */  daddu      $7, $16, $0
/* 1F734 0011F634 A08B8424 */  addiu      $4, $4, %lo(D_00298BA0)
/* 1F738 0011F638 FF002832 */  andi       $8, $17, 0xFF
/* 1F73C 0011F63C 04000524 */  addiu      $5, $0, 0x4
/* 1F740 0011F640 A611040C */  jal        printf
/* 1F744 0011F644 2D300000 */   daddu     $6, $0, $0
.L0011F648:
/* 1F748 0011F648 03000010 */  b          .L0011F658
/* 1F74C 0011F64C 2D100000 */   daddu     $2, $0, $0
.L0011F650:
/* 1F750 0011F650 9C7D040C */  jal        scePadInit2
/* 1F754 0011F654 2D204002 */   daddu     $4, $18, $0
.L0011F658:
/* 1F758 0011F658 3000BFDF */  ld         $31, 0x30($sp)
/* 1F75C 0011F65C 2000B2DF */  ld         $18, 0x20($sp)
/* 1F760 0011F660 1000B1DF */  ld         $17, 0x10($sp)
/* 1F764 0011F664 0000B0DF */  ld         $16, 0x0($sp)
/* 1F768 0011F668 0800E003 */  jr         $31
/* 1F76C 0011F66C 4000BD27 */   addiu     $sp, $sp, 0x40