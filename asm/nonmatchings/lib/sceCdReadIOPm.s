.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceCdReadIOPm
/* A790 0010A690 90FFBD27 */  addiu      $sp, $sp, -0x70
/* A794 0010A694 5000B4FF */  sd         $20, 0x50($sp)
/* A798 0010A698 4000B3FF */  sd         $19, 0x40($sp)
/* A79C 0010A69C 2DA0C000 */  daddu      $20, $6, $0
/* A7A0 0010A6A0 3000B2FF */  sd         $18, 0x30($sp)
/* A7A4 0010A6A4 2D98A000 */  daddu      $19, $5, $0
/* A7A8 0010A6A8 2000B1FF */  sd         $17, 0x20($sp)
/* A7AC 0010A6AC 2D908000 */  daddu      $18, $4, $0
/* A7B0 0010A6B0 6000BFFF */  sd         $31, 0x60($sp)
/* A7B4 0010A6B4 2D88E000 */  daddu      $17, $7, $0
/* A7B8 0010A6B8 4228040C */  jal        sceCdNcmdDiskReady
/* A7BC 0010A6BC 1000B0FF */   sd        $16, 0x10($sp)
/* A7C0 0010A6C0 06000324 */  addiu      $3, $0, 0x6
/* A7C4 0010A6C4 3C004310 */  beq        $2, $3, .L0010A7B8
/* A7C8 0010A6C8 2D100000 */   daddu     $2, $0, $0
/* A7CC 0010A6CC E627040C */  jal        ncmd_prechk
/* A7D0 0010A6D0 05000424 */   addiu     $4, $0, 0x5
/* A7D4 0010A6D4 2D004010 */  beqz       $2, .L0010A78C
/* A7D8 0010A6D8 2A00023C */   lui       $2, (0x2A3D40 >> 16)
/* A7DC 0010A6DC 2A00073C */  lui        $7, %hi(D_002A3C80)
/* A7E0 0010A6E0 403D52AC */  sw         $18, (0x2A3D40 & 0xFFFF)($2)
/* A7E4 0010A6E4 403D5024 */  addiu      $16, $2, %lo(D_002A3D40)
/* A7E8 0010A6E8 040013AE */  sw         $19, 0x4($16)
/* A7EC 0010A6EC 2A00063C */  lui        $6, %hi(D_002A40C0)
/* A7F0 0010A6F0 080014AE */  sw         $20, 0x8($16)
/* A7F4 0010A6F4 803CE724 */  addiu      $7, $7, %lo(D_002A3C80)
/* A7F8 0010A6F8 C040C624 */  addiu      $6, $6, %lo(D_002A40C0)
/* A7FC 0010A6FC 2D200002 */  daddu      $4, $16, $0
/* A800 0010A700 00002392 */  lbu        $3, 0x0($17)
/* A804 0010A704 18000524 */  addiu      $5, $0, 0x18
/* A808 0010A708 2500123C */  lui        $18, (0x2502C0 >> 16)
/* A80C 0010A70C 2500133C */  lui        $19, (0x25028C >> 16)
/* A810 0010A710 0C0003A2 */  sb         $3, 0xC($16)
/* A814 0010A714 01002292 */  lbu        $2, 0x1($17)
/* A818 0010A718 0D0002A2 */  sb         $2, 0xD($16)
/* A81C 0010A71C 02002392 */  lbu        $3, 0x2($17)
/* A820 0010A720 100007AE */  sw         $7, 0x10($16)
/* A824 0010A724 0E0003A2 */  sb         $3, 0xE($16)
/* A828 0010A728 E65A040C */  jal        sceSifWriteBackDCache
/* A82C 0010A72C 140006AE */   sw        $6, 0x14($16)
/* A830 0010A730 01000224 */  addiu      $2, $0, 0x1
/* A834 0010A734 C0024326 */  addiu      $3, $18, %lo(sceCdCbfunc_num)
/* A838 0010A738 C00242AE */  sw         $2, (0x2502C0 & 0xFFFF)($18)
/* A83C 0010A73C 2A00043C */  lui        $4, %hi(D_002A3C00)
/* A840 0010A740 11000B3C */  lui        $11, %hi(cd_callback)
/* A844 0010A744 8C0262AE */  sw         $2, (0x25028C & 0xFFFF)($19)
/* A848 0010A748 0000A3AF */  sw         $3, 0x0($sp)
/* A84C 0010A74C 003C8424 */  addiu      $4, $4, %lo(D_002A3C00)
/* A850 0010A750 2D380002 */  daddu      $7, $16, $0
/* A854 0010A754 48966B25 */  addiu      $11, $11, %lo(cd_callback)
/* A858 0010A758 0D000524 */  addiu      $5, $0, 0xD
/* A85C 0010A75C 01000624 */  addiu      $6, $0, 0x1
/* A860 0010A760 18000824 */  addiu      $8, $0, 0x18
/* A864 0010A764 2D480000 */  daddu      $9, $0, $0
/* A868 0010A768 2A5D040C */  jal        sceSifCallRpc
/* A86C 0010A76C 2D500000 */   daddu     $10, $0, $0
/* A870 0010A770 08004304 */  bgezl      $2, .L0010A794
/* A874 0010A774 2500023C */   lui       $2, (0x250270 >> 16)
/* A878 0010A778 C00240AE */  sw         $0, (0x2502C0 & 0xFFFF)($18)
/* A87C 0010A77C 2500023C */  lui        $2, (0x250280 >> 16)
/* A880 0010A780 8C0260AE */  sw         $0, (0x25028C & 0xFFFF)($19)
/* A884 0010A784 D050040C */  jal        SignalSema
/* A888 0010A788 8002448C */   lw        $4, (0x250280 & 0xFFFF)($2)
.L0010A78C:
/* A88C 0010A78C 0A000010 */  b          .L0010A7B8
/* A890 0010A790 2D100000 */   daddu     $2, $0, $0
.L0010A794:
/* A894 0010A794 7002438C */  lw         $3, (0x250270 & 0xFFFF)($2)
/* A898 0010A798 03006018 */  blez       $3, .L0010A7A8
/* A89C 0010A79C 2900043C */   lui       $4, %hi(D_00297108)
/* A8A0 0010A7A0 A611040C */  jal        printf
/* A8A4 0010A7A4 08718424 */   addiu     $4, $4, %lo(D_00297108)
.L0010A7A8:
/* A8A8 0010A7A8 2500023C */  lui        $2, (0x250280 >> 16)
/* A8AC 0010A7AC D050040C */  jal        SignalSema
/* A8B0 0010A7B0 8002448C */   lw        $4, (0x250280 & 0xFFFF)($2)
/* A8B4 0010A7B4 01000224 */  addiu      $2, $0, 0x1
.L0010A7B8:
/* A8B8 0010A7B8 6000BFDF */  ld         $31, 0x60($sp)
/* A8BC 0010A7BC 5000B4DF */  ld         $20, 0x50($sp)
/* A8C0 0010A7C0 4000B3DF */  ld         $19, 0x40($sp)
/* A8C4 0010A7C4 3000B2DF */  ld         $18, 0x30($sp)
/* A8C8 0010A7C8 2000B1DF */  ld         $17, 0x20($sp)
/* A8CC 0010A7CC 1000B0DF */  ld         $16, 0x10($sp)
/* A8D0 0010A7D0 0800E003 */  jr         $31
/* A8D4 0010A7D4 7000BD27 */   addiu     $sp, $sp, 0x70
