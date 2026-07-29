.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BtSystemScriptLoad__Fi
/* 0BB360 001BB260 C0FFBD27 */  addiu       $29, $29, -0x40
/* 0BB364 001BB264 0000BF7F */  sq          $31, 0x0($29)
/* 0BB368 001BB268 01008624 */  addiu       $6, $4, 0x1
/* 0BB36C 001BB26C 1000A427 */  addiu       $4, $29, 0x10
/* 0BB370 001BB270 2A00023C */  lui         $2, %hi(LIT_584)
/* 0BB374 001BB274 B0BC4524 */  addiu       $5, $2, %lo(LIT_584)
/* 0BB378 001BB278 1614040C */  jal         sprintf
/* 0BB37C 001BB27C 00000000 */   nop
/* 0BB380 001BB280 F001013C */  lui         $1, %hi(BtSystemScriptFileBuffer + 0x8)
/* 0BB384 001BB284 786820AC */  sw          $0, %lo(BtSystemScriptFileBuffer + 0x8)($1)
/* 0BB388 001BB288 F001013C */  lui         $1, %hi(BtSystemScriptFileBuffer + 0x8)
/* 0BB38C 001BB28C 7868228C */  lw          $2, %lo(BtSystemScriptFileBuffer + 0x8)($1)
/* 0BB390 001BB290 00190200 */  sll         $3, $2, 4
/* 0BB394 001BB294 F001013C */  lui         $1, %hi(BtSystemScriptFileBuffer)
/* 0BB398 001BB298 7068228C */  lw          $2, %lo(BtSystemScriptFileBuffer)($1)
/* 0BB39C 001BB29C 21104300 */  addu        $2, $2, $3
/* 0BB3A0 001BB2A0 109E82AF */  sw          $2, -0x61F0($28)
/* 0BB3A4 001BB2A4 109E858F */  lw          $5, -0x61F0($28)
/* 0BB3A8 001BB2A8 1000A427 */  addiu       $4, $29, 0x10
/* 0BB3AC 001BB2AC 3C00A627 */  addiu       $6, $29, 0x3C
/* 0BB3B0 001BB2B0 D8FC040C */  jal         LoadFile__FPcPvPi
/* 0BB3B4 001BB2B4 00000000 */   nop
/* 0BB3B8 001BB2B8 DC4F050C */  jal         wait_now_loading_vsync__Fv
/* 0BB3BC 001BB2BC 00000000 */   nop
/* 0BB3C0 001BB2C0 3C00A28F */  lw          $2, 0x3C($29)
/* 0BB3C4 001BB2C4 03110200 */  sra         $2, $2, 4
/* 0BB3C8 001BB2C8 01004524 */  addiu       $5, $2, 0x1
/* 0BB3CC 001BB2CC F001023C */  lui         $2, %hi(BtSystemScriptFileBuffer)
/* 0BB3D0 001BB2D0 70684424 */  addiu       $4, $2, %lo(BtSystemScriptFileBuffer)
/* 0BB3D4 001BB2D4 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 0BB3D8 001BB2D8 00000000 */   nop
/* 0BB3DC 001BB2DC 109E848F */  lw          $4, -0x61F0($28)
/* 0BB3E0 001BB2E0 282E0070 */  paddub      $5, $0, $0
/* 0BB3E4 001BB2E4 F001023C */  lui         $2, %hi(BtSystemScriptFileBuffer)
/* 0BB3E8 001BB2E8 70684624 */  addiu       $6, $2, %lo(BtSystemScriptFileBuffer)
/* 0BB3EC 001BB2EC 3C5B060C */  jal         EdSetEventScript__FPcPcP14CDataAlloc2_1_
/* 0BB3F0 001BB2F0 00000000 */   nop
/* 0BB3F4 001BB2F4 00F6060C */  jal         AddSystemEventScript__Fv
/* 0BB3F8 001BB2F8 00000000 */   nop
/* 0BB3FC 001BB2FC 0000BF7B */  lq          $31, 0x0($29)
/* 0BB400 001BB300 4000BD27 */  addiu       $29, $29, 0x40
/* 0BB404 001BB304 0800E003 */  jr          $31
/* 0BB408 001BB308 00000000 */   nop
/* 0BB40C 001BB30C 00000000 */  nop
