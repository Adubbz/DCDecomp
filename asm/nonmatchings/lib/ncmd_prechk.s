.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ncmd_prechk
/* A098 00109F98 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* A09C 00109F9C 1000B1FF */  sd         $17, 0x10($sp)
/* A0A0 00109FA0 0000B0FF */  sd         $16, 0x0($sp)
/* A0A4 00109FA4 2D888000 */  daddu      $17, $4, $0
/* A0A8 00109FA8 3000BFFF */  sd         $31, 0x30($sp)
/* A0AC 00109FAC 2500103C */  lui        $16, (0x250280 >> 16)
/* A0B0 00109FB0 4E26040C */  jal        cmd_sem_init
/* A0B4 00109FB4 2000B2FF */   sd        $18, 0x20($sp)
/* A0B8 00109FB8 8002048E */  lw         $4, (0x250280 & 0xFFFF)($16)
/* A0BC 00109FBC DC50040C */  jal        PollSema
/* A0C0 00109FC0 00000000 */   nop
/* A0C4 00109FC4 8002038E */  lw         $3, (0x250280 & 0xFFFF)($16)
/* A0C8 00109FC8 0B006210 */  beq        $3, $2, .L00109FF8
/* A0CC 00109FCC 2500023C */   lui       $2, (0x250270 >> 16)
/* A0D0 00109FD0 7002438C */  lw         $3, (0x250270 & 0xFFFF)($2)
/* A0D4 00109FD4 16006018 */  blez       $3, .L0010A030
/* A0D8 00109FD8 2500023C */   lui       $2, (0x250278 >> 16)
/* A0DC 00109FDC 2900043C */  lui        $4, %hi(D_00297050)
/* A0E0 00109FE0 7802468C */  lw         $6, (0x250278 & 0xFFFF)($2)
/* A0E4 00109FE4 50708424 */  addiu      $4, $4, %lo(D_00297050)
/* A0E8 00109FE8 A611040C */  jal        printf
/* A0EC 00109FEC 2D282002 */   daddu     $5, $17, $0
/* A0F0 00109FF0 3F000010 */  b          .L0010A0F0
/* A0F4 00109FF4 2D100000 */   daddu     $2, $0, $0
.L00109FF8:
/* A0F8 00109FF8 2A00023C */  lui        $2, (0x2A3900 >> 16)
/* A0FC 00109FFC 2500033C */  lui        $3, (0x250278 >> 16)
/* A100 0010A000 0039448C */  lw         $4, (0x2A3900 & 0xFFFF)($2)
/* A104 0010A004 2A00053C */  lui        $5, %hi(D_002A3908)
/* A108 0010A008 780271AC */  sw         $17, (0x250278 & 0xFFFF)($3)
/* A10C 0010A00C 8850040C */  jal        ReferThreadStatus
/* A110 0010A010 0839A524 */   addiu     $5, $5, %lo(D_002A3908)
/* A114 0010A014 662B040C */  jal        sceCdSync
/* A118 0010A018 01000424 */   addiu     $4, $0, 0x1
/* A11C 0010A01C 06004010 */  beqz       $2, .L0010A038
/* A120 0010A020 2D200000 */   daddu     $4, $0, $0
/* A124 0010A024 8002048E */  lw         $4, (0x250280 & 0xFFFF)($16)
/* A128 0010A028 D050040C */  jal        SignalSema
/* A12C 0010A02C 00000000 */   nop
.L0010A030:
/* A130 0010A030 2F000010 */  b          .L0010A0F0
/* A134 0010A034 2D100000 */   daddu     $2, $0, $0
.L0010A038:
/* A138 0010A038 125B040C */  jal        sceSifInitRpc
/* A13C 0010A03C 2500123C */   lui       $18, (0x25029C >> 16)
/* A140 0010A040 9C02428E */  lw         $2, (0x25029C & 0xFFFF)($18)
/* A144 0010A044 2A004104 */  bgez       $2, .L0010A0F0
/* A148 0010A048 01000224 */   addiu     $2, $0, 0x1
/* A14C 0010A04C 0B000010 */  b          .L0010A07C
/* A150 0010A050 2A00113C */   lui       $17, %hi(D_002A3C00)
/* A154 0010A054 00000000 */  nop
.L0010A058:
/* A158 0010A058 1000023C */  lui        $2, %hi(D_FFFFF)
/* A15C 0010A05C FFFF0324 */  addiu      $3, $0, -0x1
.L0010A060:
/* A160 0010A060 FFFF4224 */  addiu      $2, $2, %lo(D_FFFFF)
/* A164 0010A064 00000000 */  nop
/* A168 0010A068 00000000 */  nop
/* A16C 0010A06C 00000000 */  nop
/* A170 0010A070 00000000 */  nop
/* A174 0010A074 FAFF4314 */  bne        $2, $3, .L0010A060
/* A178 0010A078 00000000 */   nop
.L0010A07C:
/* A17C 0010A07C 003C3026 */  addiu      $16, $17, %lo(D_002A3C00)
.L0010A080:
/* A180 0010A080 0080053C */  lui        $5, (0x80000595 >> 16)
/* A184 0010A084 2D200002 */  daddu      $4, $16, $0
/* A188 0010A088 9505A534 */  ori        $5, $5, (0x80000595 & 0xFFFF)
/* A18C 0010A08C B65C040C */  jal        sceSifBindRpc
/* A190 0010A090 2D300000 */   daddu     $6, $0, $0
/* A194 0010A094 13004304 */  bgezl      $2, .L0010A0E4
/* A198 0010A098 2400028E */   lw        $2, 0x24($16)
/* A19C 0010A09C 2500023C */  lui        $2, (0x250270 >> 16)
/* A1A0 0010A0A0 7002438C */  lw         $3, (0x250270 & 0xFFFF)($2)
/* A1A4 0010A0A4 05006018 */  blez       $3, .L0010A0BC
/* A1A8 0010A0A8 1000023C */   lui       $2, %hi(D_FFFFF)
/* A1AC 0010A0AC 2900043C */  lui        $4, %hi(D_00297078)
/* A1B0 0010A0B0 A611040C */  jal        printf
/* A1B4 0010A0B4 78708424 */   addiu     $4, $4, %lo(D_00297078)
/* A1B8 0010A0B8 1000023C */  lui        $2, %hi(D_FFFFF)
.L0010A0BC:
/* A1BC 0010A0BC FFFF0324 */  addiu      $3, $0, -0x1
.L0010A0C0:
/* A1C0 0010A0C0 FFFF4224 */  addiu      $2, $2, %lo(D_FFFFF)
/* A1C4 0010A0C4 00000000 */  nop
/* A1C8 0010A0C8 00000000 */  nop
/* A1CC 0010A0CC 00000000 */  nop
/* A1D0 0010A0D0 00000000 */  nop
/* A1D4 0010A0D4 FAFF4314 */  bne        $2, $3, .L0010A0C0
/* A1D8 0010A0D8 00000000 */   nop
/* A1DC 0010A0DC E8FF0010 */  b          .L0010A080
/* A1E0 0010A0E0 003C3026 */   addiu     $16, $17, %lo(D_002A3C00)
.L0010A0E4:
/* A1E4 0010A0E4 DCFF4010 */  beqz       $2, .L0010A058
/* A1E8 0010A0E8 01000224 */   addiu     $2, $0, 0x1
/* A1EC 0010A0EC 9C0240AE */  sw         $0, (0x25029C & 0xFFFF)($18)
.L0010A0F0:
/* A1F0 0010A0F0 3000BFDF */  ld         $31, 0x30($sp)
/* A1F4 0010A0F4 2000B2DF */  ld         $18, 0x20($sp)
/* A1F8 0010A0F8 1000B1DF */  ld         $17, 0x10($sp)
/* A1FC 0010A0FC 0000B0DF */  ld         $16, 0x0($sp)
/* A200 0010A100 0800E003 */  jr         $31
/* A204 0010A104 4000BD27 */   addiu     $sp, $sp, 0x40
