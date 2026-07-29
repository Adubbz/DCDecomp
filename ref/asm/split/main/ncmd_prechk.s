.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ncmd_prechk
/* 00A098 00109F98 C0FFBD27 */  addiu       $29, $29, -0x40
/* 00A09C 00109F9C 1000B1FF */  sd          $17, 0x10($29)
/* 00A0A0 00109FA0 0000B0FF */  sd          $16, 0x0($29)
/* 00A0A4 00109FA4 2D888000 */  daddu       $17, $4, $0
/* 00A0A8 00109FA8 3000BFFF */  sd          $31, 0x30($29)
/* 00A0AC 00109FAC 2500103C */  lui         $16, %hi(ncmd_semid)
/* 00A0B0 00109FB0 4E26040C */  jal         cmd_sem_init
/* 00A0B4 00109FB4 2000B2FF */   sd         $18, 0x20($29)
/* 00A0B8 00109FB8 8002048E */  lw          $4, %lo(ncmd_semid)($16)
/* 00A0BC 00109FBC DC50040C */  jal         PollSema
/* 00A0C0 00109FC0 00000000 */   nop
/* 00A0C4 00109FC4 8002038E */  lw          $3, %lo(ncmd_semid)($16)
/* 00A0C8 00109FC8 0B006210 */  beq         $3, $2, .L00109FF8
/* 00A0CC 00109FCC 2500023C */   lui        $2, %hi(CD_debug)
/* 00A0D0 00109FD0 7002438C */  lw          $3, %lo(CD_debug)($2)
/* 00A0D4 00109FD4 16006018 */  blez        $3, .L0010A030
/* 00A0D8 00109FD8 2500023C */   lui        $2, %hi(ncmd_sema_keep_cmd)
/* 00A0DC 00109FDC 2900043C */  lui         $4, %hi(RO_00297050)
/* 00A0E0 00109FE0 7802468C */  lw          $6, %lo(ncmd_sema_keep_cmd)($2)
/* 00A0E4 00109FE4 50708424 */  addiu       $4, $4, %lo(RO_00297050)
/* 00A0E8 00109FE8 A611040C */  jal         printf
/* 00A0EC 00109FEC 2D282002 */   daddu      $5, $17, $0
/* 00A0F0 00109FF0 3F000010 */  b           .L0010A0F0
/* 00A0F4 00109FF4 2D100000 */   daddu      $2, $0, $0
.L00109FF8:
/* 00A0F8 00109FF8 2A00023C */  lui         $2, %hi(my_thid)
/* 00A0FC 00109FFC 2500033C */  lui         $3, %hi(ncmd_sema_keep_cmd)
/* 00A100 0010A000 0039448C */  lw          $4, %lo(my_thid)($2)
/* 00A104 0010A004 2A00053C */  lui         $5, %hi(my_th_info)
/* 00A108 0010A008 780271AC */  sw          $17, %lo(ncmd_sema_keep_cmd)($3)
/* 00A10C 0010A00C 8850040C */  jal         ReferThreadStatus
/* 00A110 0010A010 0839A524 */   addiu      $5, $5, %lo(my_th_info)
/* 00A114 0010A014 662B040C */  jal         sceCdSync
/* 00A118 0010A018 01000424 */   addiu      $4, $0, 0x1
/* 00A11C 0010A01C 06004010 */  beqz        $2, .L0010A038
/* 00A120 0010A020 2D200000 */   daddu      $4, $0, $0
/* 00A124 0010A024 8002048E */  lw          $4, %lo(ncmd_semid)($16)
/* 00A128 0010A028 D050040C */  jal         SignalSema
/* 00A12C 0010A02C 00000000 */   nop
.L0010A030:
/* 00A130 0010A030 2F000010 */  b           .L0010A0F0
/* 00A134 0010A034 2D100000 */   daddu      $2, $0, $0
.L0010A038:
/* 00A138 0010A038 125B040C */  jal         sceSifInitRpc
/* 00A13C 0010A03C 2500123C */   lui        $18, %hi(_rd_bind)
/* 00A140 0010A040 9C02428E */  lw          $2, %lo(_rd_bind)($18)
/* 00A144 0010A044 2A004104 */  bgez        $2, .L0010A0F0
/* 00A148 0010A048 01000224 */   addiu      $2, $0, 0x1
/* 00A14C 0010A04C 0B000010 */  b           .L0010A07C
/* 00A150 0010A050 2A00113C */   lui        $17, %hi(cdrd)
/* 00A154 0010A054 00000000 */  nop
.L0010A058:
/* 00A158 0010A058 1000023C */  lui         $2, 0x10
/* 00A15C 0010A05C FFFF0324 */  addiu       $3, $0, -0x1
.L0010A060:
/* 00A160 0010A060 FFFF4224 */  addiu       $2, $2, -0x1
/* 00A164 0010A064 00000000 */  nop
/* 00A168 0010A068 00000000 */  nop
/* 00A16C 0010A06C 00000000 */  nop
/* 00A170 0010A070 00000000 */  nop
/* 00A174 0010A074 FAFF4314 */  bne         $2, $3, .L0010A060
/* 00A178 0010A078 00000000 */   nop
.L0010A07C:
/* 00A17C 0010A07C 003C3026 */  addiu       $16, $17, %lo(cdrd)
.L0010A080:
/* 00A180 0010A080 0080053C */  lui         $5, (0x80000595 >> 16)
/* 00A184 0010A084 2D200002 */  daddu       $4, $16, $0
/* 00A188 0010A088 9505A534 */  ori         $5, $5, (0x80000595 & 0xFFFF)
/* 00A18C 0010A08C B65C040C */  jal         sceSifBindRpc
/* 00A190 0010A090 2D300000 */   daddu      $6, $0, $0
/* 00A194 0010A094 13004304 */  bgezl       $2, .L0010A0E4
/* 00A198 0010A098 2400028E */   lw         $2, 0x24($16)
/* 00A19C 0010A09C 2500023C */  lui         $2, %hi(CD_debug)
/* 00A1A0 0010A0A0 7002438C */  lw          $3, %lo(CD_debug)($2)
/* 00A1A4 0010A0A4 05006018 */  blez        $3, .L0010A0BC
/* 00A1A8 0010A0A8 1000023C */   lui        $2, 0x10
/* 00A1AC 0010A0AC 2900043C */  lui         $4, %hi(RO_00297078)
/* 00A1B0 0010A0B0 A611040C */  jal         printf
/* 00A1B4 0010A0B4 78708424 */   addiu      $4, $4, %lo(RO_00297078)
/* 00A1B8 0010A0B8 1000023C */  lui         $2, (0x100000 >> 16)
.L0010A0BC:
/* 00A1BC 0010A0BC FFFF0324 */  addiu       $3, $0, -0x1
.L0010A0C0:
/* 00A1C0 0010A0C0 FFFF4224 */  addiu       $2, $2, -0x1
/* 00A1C4 0010A0C4 00000000 */  nop
/* 00A1C8 0010A0C8 00000000 */  nop
/* 00A1CC 0010A0CC 00000000 */  nop
/* 00A1D0 0010A0D0 00000000 */  nop
/* 00A1D4 0010A0D4 FAFF4314 */  bne         $2, $3, .L0010A0C0
/* 00A1D8 0010A0D8 00000000 */   nop
/* 00A1DC 0010A0DC E8FF0010 */  b           .L0010A080
/* 00A1E0 0010A0E0 003C3026 */   addiu      $16, $17, %lo(cdrd)
.L0010A0E4:
/* 00A1E4 0010A0E4 DCFF4010 */  beqz        $2, .L0010A058
/* 00A1E8 0010A0E8 01000224 */   addiu      $2, $0, 0x1
/* 00A1EC 0010A0EC 9C0240AE */  sw          $0, %lo(_rd_bind)($18)
.L0010A0F0:
/* 00A1F0 0010A0F0 3000BFDF */  ld          $31, 0x30($29)
/* 00A1F4 0010A0F4 2000B2DF */  ld          $18, 0x20($29)
/* 00A1F8 0010A0F8 1000B1DF */  ld          $17, 0x10($29)
/* 00A1FC 0010A0FC 0000B0DF */  ld          $16, 0x0($29)
/* 00A200 0010A100 0800E003 */  jr          $31
/* 00A204 0010A104 4000BD27 */   addiu      $29, $29, 0x40
