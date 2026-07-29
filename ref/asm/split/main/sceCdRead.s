.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceCdRead
/* 00A5C0 0010A4C0 80FFBD27 */  addiu       $29, $29, -0x80
/* 00A5C4 0010A4C4 5000B4FF */  sd          $20, 0x50($29)
/* 00A5C8 0010A4C8 3000B2FF */  sd          $18, 0x30($29)
/* 00A5CC 0010A4CC 2DA0C000 */  daddu       $20, $6, $0
/* 00A5D0 0010A4D0 2000B1FF */  sd          $17, 0x20($29)
/* 00A5D4 0010A4D4 2D908000 */  daddu       $18, $4, $0
/* 00A5D8 0010A4D8 1000B0FF */  sd          $16, 0x10($29)
/* 00A5DC 0010A4DC 2D88A000 */  daddu       $17, $5, $0
/* 00A5E0 0010A4E0 7000BFFF */  sd          $31, 0x70($29)
/* 00A5E4 0010A4E4 2D80E000 */  daddu       $16, $7, $0
/* 00A5E8 0010A4E8 6000B5FF */  sd          $21, 0x60($29)
/* 00A5EC 0010A4EC 4228040C */  jal         sceCdNcmdDiskReady
/* 00A5F0 0010A4F0 4000B3FF */   sd         $19, 0x40($29)
/* 00A5F4 0010A4F4 06000324 */  addiu       $3, $0, 0x6
/* 00A5F8 0010A4F8 5B004310 */  beq         $2, $3, .L0010A668
/* 00A5FC 0010A4FC 2D100000 */   daddu      $2, $0, $0
/* 00A600 0010A500 E627040C */  jal         ncmd_prechk
/* 00A604 0010A504 04000424 */   addiu      $4, $0, 0x4
/* 00A608 0010A508 4D004010 */  beqz        $2, .L0010A640
/* 00A60C 0010A50C 2A00133C */   lui        $19, %hi(_rd_data)
/* 00A610 0010A510 2A00153C */  lui         $21, %hi(_rd_intr_data)
/* 00A614 0010A514 403D72AE */  sw          $18, %lo(_rd_data)($19)
/* 00A618 0010A518 403D6426 */  addiu       $4, $19, %lo(_rd_data)
/* 00A61C 0010A51C 040091AC */  sw          $17, 0x4($4)
/* 00A620 0010A520 2A00083C */  lui         $8, %hi(_Read_cur_pos)
/* 00A624 0010A524 080094AC */  sw          $20, 0x8($4)
/* 00A628 0010A528 803CA626 */  addiu       $6, $21, %lo(_rd_intr_data)
/* 00A62C 0010A52C C0400525 */  addiu       $5, $8, %lo(_Read_cur_pos)
/* 00A630 0010A530 01000724 */  addiu       $7, $0, 0x1
/* 00A634 0010A534 00000292 */  lbu         $2, 0x0($16)
/* 00A638 0010A538 0C0082A0 */  sb          $2, 0xC($4)
/* 00A63C 0010A53C 01000392 */  lbu         $3, 0x1($16)
/* 00A640 0010A540 0D0083A0 */  sb          $3, 0xD($4)
/* 00A644 0010A544 02000292 */  lbu         $2, 0x2($16)
/* 00A648 0010A548 140085AC */  sw          $5, 0x14($4)
/* 00A64C 0010A54C 0E0082A0 */  sb          $2, 0xE($4)
/* 00A650 0010A550 100086AC */  sw          $6, 0x10($4)
/* 00A654 0010A554 02000392 */  lbu         $3, 0x2($16)
/* 00A658 0010A558 08006710 */  beq         $3, $7, .L0010A57C
/* 00A65C 0010A55C 02006228 */   slti       $2, $3, 0x2
/* 00A660 0010A560 0A004054 */  bnel        $2, $0, .L0010A58C
/* 00A664 0010A564 C02A1100 */   sll        $5, $17, 11
/* 00A668 0010A568 02000224 */  addiu       $2, $0, 0x2
/* 00A66C 0010A56C 06006210 */  beq         $3, $2, .L0010A588
/* 00A670 0010A570 24090224 */   addiu      $2, $0, 0x924
/* 00A674 0010A574 05000010 */  b           .L0010A58C
/* 00A678 0010A578 C02A1100 */   sll        $5, $17, 11
.L0010A57C:
/* 00A67C 0010A57C 18090224 */  addiu       $2, $0, 0x918
/* 00A680 0010A580 02000010 */  b           .L0010A58C
/* 00A684 0010A584 18282202 */   mult       $5, $17, $2
.L0010A588:
/* 00A688 0010A588 18282202 */  mult        $5, $17, $2
.L0010A58C:
/* 00A68C 0010A58C 2D208002 */  daddu       $4, $20, $0
/* 00A690 0010A590 C0401025 */  addiu       $16, $8, %lo(_Read_cur_pos)
/* 00A694 0010A594 C04000AD */  sw          $0, %lo(_Read_cur_pos)($8)
/* 00A698 0010A598 E65A040C */  jal         sceSifWriteBackDCache
/* 00A69C 0010A59C 803CB426 */   addiu      $20, $21, %lo(_rd_intr_data)
/* 00A6A0 0010A5A0 403D7226 */  addiu       $18, $19, %lo(_rd_data)
/* 00A6A4 0010A5A4 2D208002 */  daddu       $4, $20, $0
/* 00A6A8 0010A5A8 E65A040C */  jal         sceSifWriteBackDCache
/* 00A6AC 0010A5AC 90000524 */   addiu      $5, $0, 0x90
/* 00A6B0 0010A5B0 2500133C */  lui         $19, %hi(CD_debug)
/* 00A6B4 0010A5B4 2D204002 */  daddu       $4, $18, $0
/* 00A6B8 0010A5B8 E65A040C */  jal         sceSifWriteBackDCache
/* 00A6BC 0010A5BC 18000524 */   addiu      $5, $0, 0x18
/* 00A6C0 0010A5C0 2D200002 */  daddu       $4, $16, $0
/* 00A6C4 0010A5C4 E65A040C */  jal         sceSifWriteBackDCache
/* 00A6C8 0010A5C8 04000524 */   addiu      $5, $0, 0x4
/* 00A6CC 0010A5CC 7002628E */  lw          $2, %lo(CD_debug)($19)
/* 00A6D0 0010A5D0 03004018 */  blez        $2, .L0010A5E0
/* 00A6D4 0010A5D4 2900043C */   lui        $4, %hi(RO_00297118)
/* 00A6D8 0010A5D8 A611040C */  jal         printf
/* 00A6DC 0010A5DC 18718424 */   addiu      $4, $4, %lo(RO_00297118)
.L0010A5E0:
/* 00A6E0 0010A5E0 01000224 */  addiu       $2, $0, 0x1
/* 00A6E4 0010A5E4 2500103C */  lui         $16, %hi(sceCdCbfunc_num)
/* 00A6E8 0010A5E8 C00202AE */  sw          $2, %lo(sceCdCbfunc_num)($16)
/* 00A6EC 0010A5EC 2500113C */  lui         $17, %hi(c_cb_sem)
/* 00A6F0 0010A5F0 2A00043C */  lui         $4, %hi(cdrd)
/* 00A6F4 0010A5F4 11000B3C */  lui         $11, %hi(cd_read_intr)
/* 00A6F8 0010A5F8 8C0222AE */  sw          $2, %lo(c_cb_sem)($17)
/* 00A6FC 0010A5FC 003C8424 */  addiu       $4, $4, %lo(cdrd)
/* 00A700 0010A600 0000B4AF */  sw          $20, 0x0($29)
/* 00A704 0010A604 2D384002 */  daddu       $7, $18, $0
/* 00A708 0010A608 98986B25 */  addiu       $11, $11, %lo(cd_read_intr)
/* 00A70C 0010A60C 01000524 */  addiu       $5, $0, 0x1
/* 00A710 0010A610 01000624 */  addiu       $6, $0, 0x1
/* 00A714 0010A614 18000824 */  addiu       $8, $0, 0x18
/* 00A718 0010A618 2D480000 */  daddu       $9, $0, $0
/* 00A71C 0010A61C 2A5D040C */  jal         sceSifCallRpc
/* 00A720 0010A620 2D500000 */   daddu      $10, $0, $0
/* 00A724 0010A624 08004304 */  bgezl       $2, .L0010A648
/* 00A728 0010A628 7002628E */   lw         $2, %lo(CD_debug)($19)
/* 00A72C 0010A62C C00200AE */  sw          $0, %lo(sceCdCbfunc_num)($16)
/* 00A730 0010A630 2500023C */  lui         $2, %hi(ncmd_semid)
/* 00A734 0010A634 8C0220AE */  sw          $0, %lo(c_cb_sem)($17)
/* 00A738 0010A638 D050040C */  jal         SignalSema
/* 00A73C 0010A63C 8002448C */   lw         $4, %lo(ncmd_semid)($2)
.L0010A640:
/* 00A740 0010A640 09000010 */  b           .L0010A668
/* 00A744 0010A644 2D100000 */   daddu      $2, $0, $0
.L0010A648:
/* 00A748 0010A648 03004018 */  blez        $2, .L0010A658
/* 00A74C 0010A64C 2900043C */   lui        $4, %hi(RO_00297108)
/* 00A750 0010A650 A611040C */  jal         printf
/* 00A754 0010A654 08718424 */   addiu      $4, $4, %lo(RO_00297108)
.L0010A658:
/* 00A758 0010A658 2500023C */  lui         $2, %hi(ncmd_semid)
/* 00A75C 0010A65C D050040C */  jal         SignalSema
/* 00A760 0010A660 8002448C */   lw         $4, %lo(ncmd_semid)($2)
/* 00A764 0010A664 01000224 */  addiu       $2, $0, 0x1
.L0010A668:
/* 00A768 0010A668 7000BFDF */  ld          $31, 0x70($29)
/* 00A76C 0010A66C 6000B5DF */  ld          $21, 0x60($29)
/* 00A770 0010A670 5000B4DF */  ld          $20, 0x50($29)
/* 00A774 0010A674 4000B3DF */  ld          $19, 0x40($29)
/* 00A778 0010A678 3000B2DF */  ld          $18, 0x30($29)
/* 00A77C 0010A67C 2000B1DF */  ld          $17, 0x20($29)
/* 00A780 0010A680 1000B0DF */  ld          $16, 0x10($29)
/* 00A784 0010A684 0800E003 */  jr          $31
/* 00A788 0010A688 8000BD27 */   addiu      $29, $29, 0x80
/* 00A78C 0010A68C 00000000 */  nop
