.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceCdNcmdDiskReady
/* 00A208 0010A108 D0FFBD27 */  addiu       $29, $29, -0x30
/* 00A20C 0010A10C 02000424 */  addiu       $4, $0, 0x2
/* 00A210 0010A110 2000BFFF */  sd          $31, 0x20($29)
/* 00A214 0010A114 E627040C */  jal         ncmd_prechk
/* 00A218 0010A118 1000B0FF */   sd         $16, 0x10($29)
/* 00A21C 0010A11C 03004014 */  bnez        $2, .L0010A12C
/* 00A220 0010A120 2A00023C */   lui        $2, %hi(ncmdrdata)
/* 00A224 0010A124 1A000010 */  b           .L0010A190
/* 00A228 0010A128 2D100000 */   daddu      $2, $0, $0
.L0010A12C:
/* 00A22C 0010A12C 2A00043C */  lui         $4, %hi(cdrd)
/* 00A230 0010A130 80395024 */  addiu       $16, $2, %lo(ncmdrdata)
/* 00A234 0010A134 003C8424 */  addiu       $4, $4, %lo(cdrd)
/* 00A238 0010A138 0000A0AF */  sw          $0, 0x0($29)
/* 00A23C 0010A13C 0E000524 */  addiu       $5, $0, 0xE
/* 00A240 0010A140 2D300000 */  daddu       $6, $0, $0
/* 00A244 0010A144 2D380000 */  daddu       $7, $0, $0
/* 00A248 0010A148 2D400000 */  daddu       $8, $0, $0
/* 00A24C 0010A14C 2D480002 */  daddu       $9, $16, $0
/* 00A250 0010A150 04000A24 */  addiu       $10, $0, 0x4
/* 00A254 0010A154 2A5D040C */  jal         sceSifCallRpc
/* 00A258 0010A158 2D580000 */   daddu      $11, $0, $0
/* 00A25C 0010A15C 06004104 */  bgez        $2, .L0010A178
/* 00A260 0010A160 2500023C */   lui        $2, %hi(ncmd_semid)
/* 00A264 0010A164 8002448C */  lw          $4, %lo(ncmd_semid)($2)
/* 00A268 0010A168 D050040C */  jal         SignalSema
/* 00A26C 0010A16C 00000000 */   nop
/* 00A270 0010A170 07000010 */  b           .L0010A190
/* 00A274 0010A174 2D100000 */   daddu      $2, $0, $0
.L0010A178:
/* 00A278 0010A178 8002448C */  lw          $4, %lo(ncmd_semid)($2)
/* 00A27C 0010A17C D050040C */  jal         SignalSema
/* 00A280 0010A180 00000000 */   nop
/* 00A284 0010A184 0020033C */  lui         $3, (0x20000000 >> 16)
/* 00A288 0010A188 25180302 */  or          $3, $16, $3
/* 00A28C 0010A18C 0000628C */  lw          $2, (0x20000000 & 0xFFFF)($3)
.L0010A190:
/* 00A290 0010A190 2000BFDF */  ld          $31, 0x20($29)
/* 00A294 0010A194 1000B0DF */  ld          $16, 0x10($29)
/* 00A298 0010A198 0800E003 */  jr          $31
/* 00A29C 0010A19C 3000BD27 */   addiu      $29, $29, 0x30
