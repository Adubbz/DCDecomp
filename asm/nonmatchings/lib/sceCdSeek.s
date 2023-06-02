.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceCdSeek
/* AB68 0010AA68 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* AB6C 0010AA6C 2000B1FF */  sd         $17, 0x20($sp)
/* AB70 0010AA70 4000BFFF */  sd         $31, 0x40($sp)
/* AB74 0010AA74 2D888000 */  daddu      $17, $4, $0
/* AB78 0010AA78 3000B2FF */  sd         $18, 0x30($sp)
/* AB7C 0010AA7C 4228040C */  jal        sceCdNcmdDiskReady
/* AB80 0010AA80 1000B0FF */   sd        $16, 0x10($sp)
/* AB84 0010AA84 06000324 */  addiu      $3, $0, 0x6
/* AB88 0010AA88 2A004310 */  beq        $2, $3, .L0010AB34
/* AB8C 0010AA8C 2D100000 */   daddu     $2, $0, $0
/* AB90 0010AA90 E627040C */  jal        ncmd_prechk
/* AB94 0010AA94 09000424 */   addiu     $4, $0, 0x9
/* AB98 0010AA98 20004010 */  beqz       $2, .L0010AB1C
/* AB9C 0010AA9C 2A00023C */   lui       $2, (0x2A4910 >> 16)
/* ABA0 0010AAA0 04000524 */  addiu      $5, $0, 0x4
/* ABA4 0010AAA4 10495024 */  addiu      $16, $2, %lo(D_002A4910)
/* ABA8 0010AAA8 104951AC */  sw         $17, (0x2A4910 & 0xFFFF)($2)
/* ABAC 0010AAAC 2D200002 */  daddu      $4, $16, $0
/* ABB0 0010AAB0 E65A040C */  jal        sceSifWriteBackDCache
/* ABB4 0010AAB4 2500113C */   lui       $17, (0x2502C0 >> 16)
/* ABB8 0010AAB8 2500123C */  lui        $18, (0x25028C >> 16)
/* ABBC 0010AABC C0022526 */  addiu      $5, $17, %lo(sceCdCbfunc_num)
/* ABC0 0010AAC0 04000224 */  addiu      $2, $0, 0x4
/* ABC4 0010AAC4 C00222AE */  sw         $2, (0x2502C0 & 0xFFFF)($17)
/* ABC8 0010AAC8 01000324 */  addiu      $3, $0, 0x1
/* ABCC 0010AACC 2A00043C */  lui        $4, %hi(D_002A3C00)
/* ABD0 0010AAD0 11000B3C */  lui        $11, %hi(cd_callback)
/* ABD4 0010AAD4 0000A5AF */  sw         $5, 0x0($sp)
/* ABD8 0010AAD8 003C8424 */  addiu      $4, $4, %lo(D_002A3C00)
/* ABDC 0010AADC 8C0243AE */  sw         $3, (0x25028C & 0xFFFF)($18)
/* ABE0 0010AAE0 2D380002 */  daddu      $7, $16, $0
/* ABE4 0010AAE4 48966B25 */  addiu      $11, $11, %lo(cd_callback)
/* ABE8 0010AAE8 05000524 */  addiu      $5, $0, 0x5
/* ABEC 0010AAEC 01000624 */  addiu      $6, $0, 0x1
/* ABF0 0010AAF0 04000824 */  addiu      $8, $0, 0x4
/* ABF4 0010AAF4 2D480000 */  daddu      $9, $0, $0
/* ABF8 0010AAF8 2A5D040C */  jal        sceSifCallRpc
/* ABFC 0010AAFC 2D500000 */   daddu     $10, $0, $0
/* AC00 0010AB00 08004304 */  bgezl      $2, .L0010AB24
/* AC04 0010AB04 2500023C */   lui       $2, (0x250280 >> 16)
/* AC08 0010AB08 C00220AE */  sw         $0, (0x2502C0 & 0xFFFF)($17)
/* AC0C 0010AB0C 2500023C */  lui        $2, (0x250280 >> 16)
/* AC10 0010AB10 8C0240AE */  sw         $0, (0x25028C & 0xFFFF)($18)
/* AC14 0010AB14 D050040C */  jal        SignalSema
/* AC18 0010AB18 8002448C */   lw        $4, (0x250280 & 0xFFFF)($2)
.L0010AB1C:
/* AC1C 0010AB1C 05000010 */  b          .L0010AB34
/* AC20 0010AB20 2D100000 */   daddu     $2, $0, $0
.L0010AB24:
/* AC24 0010AB24 8002448C */  lw         $4, (0x250280 & 0xFFFF)($2)
/* AC28 0010AB28 D050040C */  jal        SignalSema
/* AC2C 0010AB2C 00000000 */   nop
/* AC30 0010AB30 01000224 */  addiu      $2, $0, 0x1
.L0010AB34:
/* AC34 0010AB34 4000BFDF */  ld         $31, 0x40($sp)
/* AC38 0010AB38 3000B2DF */  ld         $18, 0x30($sp)
/* AC3C 0010AB3C 2000B1DF */  ld         $17, 0x20($sp)
/* AC40 0010AB40 1000B0DF */  ld         $16, 0x10($sp)
/* AC44 0010AB44 0800E003 */  jr         $31
/* AC48 0010AB48 5000BD27 */   addiu     $sp, $sp, 0x50
/* AC4C 0010AB4C 00000000 */  nop
