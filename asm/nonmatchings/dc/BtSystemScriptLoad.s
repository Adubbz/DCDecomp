.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BtSystemScriptLoad__Fi
/* BB360 001BB260 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* BB364 001BB264 0000BF7F */  sq         $31, 0x0($sp)
/* BB368 001BB268 01008624 */  addiu      $6, $4, 0x1
/* BB36C 001BB26C 1000A427 */  addiu      $4, $sp, 0x10
/* BB370 001BB270 2A00023C */  lui        $2, %hi(_584)
/* BB374 001BB274 B0BC4524 */  addiu      $5, $2, %lo(_584)
/* BB378 001BB278 1614040C */  jal        sprintf
/* BB37C 001BB27C 00000000 */   nop
/* BB380 001BB280 F001013C */  lui        $at, (0x1F06878 >> 16)
/* BB384 001BB284 786820AC */  sw         $0, (0x1F06878 & 0xFFFF)($at)
/* BB388 001BB288 F001013C */  lui        $at, (0x1F06878 >> 16)
/* BB38C 001BB28C 7868228C */  lw         $2, (0x1F06878 & 0xFFFF)($at)
/* BB390 001BB290 00190200 */  sll        $3, $2, 4
/* BB394 001BB294 F001013C */  lui        $at, (0x1F06870 >> 16)
/* BB398 001BB298 7068228C */  lw         $2, (0x1F06870 & 0xFFFF)($at)
/* BB39C 001BB29C 21104300 */  addu       $2, $2, $3
/* BB3A0 001BB2A0 109E82AF */  sw         $2, -0x61F0($gp)
/* BB3A4 001BB2A4 109E858F */  lw         $5, -0x61F0($gp)
/* BB3A8 001BB2A8 1000A427 */  addiu      $4, $sp, 0x10
/* BB3AC 001BB2AC 3C00A627 */  addiu      $6, $sp, 0x3C
/* BB3B0 001BB2B0 D8FC040C */  jal        LoadFile__FPcPvPi
/* BB3B4 001BB2B4 00000000 */   nop
/* BB3B8 001BB2B8 DC4F050C */  jal        wait_now_loading_vsync__Fv
/* BB3BC 001BB2BC 00000000 */   nop
/* BB3C0 001BB2C0 3C00A28F */  lw         $2, 0x3C($sp)
/* BB3C4 001BB2C4 03110200 */  sra        $2, $2, 4
/* BB3C8 001BB2C8 01004524 */  addiu      $5, $2, 0x1
/* BB3CC 001BB2CC F001023C */  lui        $2, %hi(D_1F06870)
/* BB3D0 001BB2D0 70684424 */  addiu      $4, $2, %lo(D_1F06870)
/* BB3D4 001BB2D4 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* BB3D8 001BB2D8 00000000 */   nop
/* BB3DC 001BB2DC 109E848F */  lw         $4, -0x61F0($gp)
/* BB3E0 001BB2E0 282E0070 */  paddub     $5, $0, $0
/* BB3E4 001BB2E4 F001023C */  lui        $2, %hi(D_1F06870)
/* BB3E8 001BB2E8 70684624 */  addiu      $6, $2, %lo(D_1F06870)
/* BB3EC 001BB2EC 3C5B060C */  jal        EdSetEventScript__FPcPcP14CDataAlloc2_1_
/* BB3F0 001BB2F0 00000000 */   nop
/* BB3F4 001BB2F4 00F6060C */  jal        AddSystemEventScript__Fv
/* BB3F8 001BB2F8 00000000 */   nop
/* BB3FC 001BB2FC 0000BF7B */  lq         $31, 0x0($sp)
/* BB400 001BB300 4000BD27 */  addiu      $sp, $sp, 0x40
/* BB404 001BB304 0800E003 */  jr         $31
/* BB408 001BB308 00000000 */   nop
/* BB40C 001BB30C 00000000 */  nop
