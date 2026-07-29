.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceCdReadIOPm
/* 00A790 0010A690 90FFBD27 */  addiu       $29, $29, -0x70
/* 00A794 0010A694 5000B4FF */  sd          $20, 0x50($29)
/* 00A798 0010A698 4000B3FF */  sd          $19, 0x40($29)
/* 00A79C 0010A69C 2DA0C000 */  daddu       $20, $6, $0
/* 00A7A0 0010A6A0 3000B2FF */  sd          $18, 0x30($29)
/* 00A7A4 0010A6A4 2D98A000 */  daddu       $19, $5, $0
/* 00A7A8 0010A6A8 2000B1FF */  sd          $17, 0x20($29)
/* 00A7AC 0010A6AC 2D908000 */  daddu       $18, $4, $0
/* 00A7B0 0010A6B0 6000BFFF */  sd          $31, 0x60($29)
/* 00A7B4 0010A6B4 2D88E000 */  daddu       $17, $7, $0
/* 00A7B8 0010A6B8 4228040C */  jal         sceCdNcmdDiskReady
/* 00A7BC 0010A6BC 1000B0FF */   sd         $16, 0x10($29)
/* 00A7C0 0010A6C0 06000324 */  addiu       $3, $0, 0x6
/* 00A7C4 0010A6C4 3C004310 */  beq         $2, $3, .L0010A7B8
/* 00A7C8 0010A6C8 2D100000 */   daddu      $2, $0, $0
/* 00A7CC 0010A6CC E627040C */  jal         ncmd_prechk
/* 00A7D0 0010A6D0 05000424 */   addiu      $4, $0, 0x5
/* 00A7D4 0010A6D4 2D004010 */  beqz        $2, .L0010A78C
/* 00A7D8 0010A6D8 2A00023C */   lui        $2, %hi(_rd_data)
/* 00A7DC 0010A6DC 2A00073C */  lui         $7, %hi(_rd_intr_data)
/* 00A7E0 0010A6E0 403D52AC */  sw          $18, %lo(_rd_data)($2)
/* 00A7E4 0010A6E4 403D5024 */  addiu       $16, $2, %lo(_rd_data)
/* 00A7E8 0010A6E8 040013AE */  sw          $19, 0x4($16)
/* 00A7EC 0010A6EC 2A00063C */  lui         $6, %hi(_Read_cur_pos)
/* 00A7F0 0010A6F0 080014AE */  sw          $20, 0x8($16)
/* 00A7F4 0010A6F4 803CE724 */  addiu       $7, $7, %lo(_rd_intr_data)
/* 00A7F8 0010A6F8 C040C624 */  addiu       $6, $6, %lo(_Read_cur_pos)
/* 00A7FC 0010A6FC 2D200002 */  daddu       $4, $16, $0
/* 00A800 0010A700 00002392 */  lbu         $3, 0x0($17)
/* 00A804 0010A704 18000524 */  addiu       $5, $0, 0x18
/* 00A808 0010A708 2500123C */  lui         $18, %hi(sceCdCbfunc_num)
/* 00A80C 0010A70C 2500133C */  lui         $19, %hi(c_cb_sem)
/* 00A810 0010A710 0C0003A2 */  sb          $3, 0xC($16)
/* 00A814 0010A714 01002292 */  lbu         $2, 0x1($17)
/* 00A818 0010A718 0D0002A2 */  sb          $2, 0xD($16)
/* 00A81C 0010A71C 02002392 */  lbu         $3, 0x2($17)
/* 00A820 0010A720 100007AE */  sw          $7, 0x10($16)
/* 00A824 0010A724 0E0003A2 */  sb          $3, 0xE($16)
/* 00A828 0010A728 E65A040C */  jal         sceSifWriteBackDCache
/* 00A82C 0010A72C 140006AE */   sw         $6, 0x14($16)
/* 00A830 0010A730 01000224 */  addiu       $2, $0, 0x1
/* 00A834 0010A734 C0024326 */  addiu       $3, $18, %lo(sceCdCbfunc_num)
/* 00A838 0010A738 C00242AE */  sw          $2, %lo(sceCdCbfunc_num)($18)
/* 00A83C 0010A73C 2A00043C */  lui         $4, %hi(cdrd)
/* 00A840 0010A740 11000B3C */  lui         $11, %hi(cd_callback)
/* 00A844 0010A744 8C0262AE */  sw          $2, %lo(c_cb_sem)($19)
/* 00A848 0010A748 0000A3AF */  sw          $3, 0x0($29)
/* 00A84C 0010A74C 003C8424 */  addiu       $4, $4, %lo(cdrd)
/* 00A850 0010A750 2D380002 */  daddu       $7, $16, $0
/* 00A854 0010A754 48966B25 */  addiu       $11, $11, %lo(cd_callback)
/* 00A858 0010A758 0D000524 */  addiu       $5, $0, 0xD
/* 00A85C 0010A75C 01000624 */  addiu       $6, $0, 0x1
/* 00A860 0010A760 18000824 */  addiu       $8, $0, 0x18
/* 00A864 0010A764 2D480000 */  daddu       $9, $0, $0
/* 00A868 0010A768 2A5D040C */  jal         sceSifCallRpc
/* 00A86C 0010A76C 2D500000 */   daddu      $10, $0, $0
/* 00A870 0010A770 08004304 */  bgezl       $2, .L0010A794
/* 00A874 0010A774 2500023C */   lui        $2, %hi(CD_debug)
/* 00A878 0010A778 C00240AE */  sw          $0, %lo(sceCdCbfunc_num)($18)
/* 00A87C 0010A77C 2500023C */  lui         $2, %hi(ncmd_semid)
/* 00A880 0010A780 8C0260AE */  sw          $0, %lo(c_cb_sem)($19)
/* 00A884 0010A784 D050040C */  jal         SignalSema
/* 00A888 0010A788 8002448C */   lw         $4, %lo(ncmd_semid)($2)
.L0010A78C:
/* 00A88C 0010A78C 0A000010 */  b           .L0010A7B8
/* 00A890 0010A790 2D100000 */   daddu      $2, $0, $0
.L0010A794:
/* 00A894 0010A794 7002438C */  lw          $3, %lo(CD_debug)($2)
/* 00A898 0010A798 03006018 */  blez        $3, .L0010A7A8
/* 00A89C 0010A79C 2900043C */   lui        $4, %hi(RO_00297108)
/* 00A8A0 0010A7A0 A611040C */  jal         printf
/* 00A8A4 0010A7A4 08718424 */   addiu      $4, $4, %lo(RO_00297108)
.L0010A7A8:
/* 00A8A8 0010A7A8 2500023C */  lui         $2, %hi(ncmd_semid)
/* 00A8AC 0010A7AC D050040C */  jal         SignalSema
/* 00A8B0 0010A7B0 8002448C */   lw         $4, %lo(ncmd_semid)($2)
/* 00A8B4 0010A7B4 01000224 */  addiu       $2, $0, 0x1
.L0010A7B8:
/* 00A8B8 0010A7B8 6000BFDF */  ld          $31, 0x60($29)
/* 00A8BC 0010A7BC 5000B4DF */  ld          $20, 0x50($29)
/* 00A8C0 0010A7C0 4000B3DF */  ld          $19, 0x40($29)
/* 00A8C4 0010A7C4 3000B2DF */  ld          $18, 0x30($29)
/* 00A8C8 0010A7C8 2000B1DF */  ld          $17, 0x20($29)
/* 00A8CC 0010A7CC 1000B0DF */  ld          $16, 0x10($29)
/* 00A8D0 0010A7D0 0800E003 */  jr          $31
/* 00A8D4 0010A7D4 7000BD27 */   addiu      $29, $29, 0x70
