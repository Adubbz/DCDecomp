.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetupEvent__16CDungeonEventManFP11CDungeonMapi
/* 0CD040 001CCF40 C0FEBD27 */  addiu       $29, $29, -0x140
/* 0CD044 001CCF44 9000BF7F */  sq          $31, 0x90($29)
/* 0CD048 001CCF48 8000BE7F */  sq          $30, 0x80($29)
/* 0CD04C 001CCF4C 7000B77F */  sq          $23, 0x70($29)
/* 0CD050 001CCF50 6000B67F */  sq          $22, 0x60($29)
/* 0CD054 001CCF54 5000B57F */  sq          $21, 0x50($29)
/* 0CD058 001CCF58 4000B47F */  sq          $20, 0x40($29)
/* 0CD05C 001CCF5C 3000B37F */  sq          $19, 0x30($29)
/* 0CD060 001CCF60 2000B27F */  sq          $18, 0x20($29)
/* 0CD064 001CCF64 1000B17F */  sq          $17, 0x10($29)
/* 0CD068 001CCF68 0000B07F */  sq          $16, 0x0($29)
/* 0CD06C 001CCF6C 28AE8070 */  paddub      $21, $4, $0
/* 0CD070 001CCF70 28A6A070 */  paddub      $20, $5, $0
/* 0CD074 001CCF74 2800033C */  lui         $3, %hi(LIT_3530)
/* 0CD078 001CCF78 A0A06324 */  addiu       $3, $3, %lo(LIT_3530)
/* 0CD07C 001CCF7C B000A427 */  addiu       $4, $29, 0xB0
/* 0CD080 001CCF80 00006378 */  lq          $3, 0x0($3)
/* 0CD084 001CCF84 0000837C */  sq          $3, 0x0($4)
/* 0CD088 001CCF88 01000324 */  addiu       $3, $0, 0x1
/* 0CD08C 001CCF8C 9700C314 */  bne         $6, $3, .L001CD1EC
/* 0CD090 001CCF90 00000000 */   nop
/* 0CD094 001CCF94 289E0070 */  paddub      $19, $0, $0
/* 0CD098 001CCF98 8F000010 */  b           .L001CD1D8
/* 0CD09C 001CCF9C 00000000 */   nop
.L001CCFA0:
/* 0CD0A0 001CCFA0 28960070 */  paddub      $18, $0, $0
/* 0CD0A4 001CCFA4 88000010 */  b           .L001CD1C8
/* 0CD0A8 001CCFA8 00000000 */   nop
.L001CCFAC:
/* 0CD0AC 001CCFAC 80181300 */  sll         $3, $19, 2
/* 0CD0B0 001CCFB0 21187300 */  addu        $3, $3, $19
/* 0CD0B4 001CCFB4 80180300 */  sll         $3, $3, 2
/* 0CD0B8 001CCFB8 21184302 */  addu        $3, $18, $3
/* 0CD0BC 001CCFBC 00F10300 */  sll         $30, $3, 4
/* 0CD0C0 001CCFC0 2118D403 */  addu        $3, $30, $20
/* 0CD0C4 001CCFC4 581C7724 */  addiu       $23, $3, 0x1C58
/* 0CD0C8 001CCFC8 F87FF726 */  addiu       $23, $23, 0x7FF8
/* 0CD0CC 001CCFCC 0000E38E */  lw          $3, 0x0($23)
/* 0CD0D0 001CCFD0 A000A3AF */  sw          $3, 0xA0($29)
/* 0CD0D4 001CCFD4 FFFF0424 */  addiu       $4, $0, -0x1
/* 0CD0D8 001CCFD8 A000A38F */  lw          $3, 0xA0($29)
/* 0CD0DC 001CCFDC 79006410 */  beq         $3, $4, .L001CD1C4
/* 0CD0E0 001CCFE0 00000000 */   nop
/* 0CD0E4 001CCFE4 28B60070 */  paddub      $22, $0, $0
/* 0CD0E8 001CCFE8 73000010 */  b           .L001CD1B8
/* 0CD0EC 001CCFEC 00000000 */   nop
.L001CCFF0:
/* 0CD0F0 001CCFF0 2826A072 */  paddub      $4, $21, $0
/* 0CD0F4 001CCFF4 282EC072 */  paddub      $5, $22, $0
/* 0CD0F8 001CCFF8 A000A68F */  lw          $6, 0xA0($29)
/* 0CD0FC 001CCFFC 3C32070C */  jal         SearchPartsID__16CDungeonEventManFii
/* 0CD100 001CD000 00000000 */   nop
/* 0CD104 001CD004 28864070 */  paddub      $16, $2, $0
/* 0CD108 001CD008 6A004010 */  beqz        $2, .L001CD1B4
/* 0CD10C 001CD00C 00000000 */   nop
/* 0CD110 001CD010 2826A072 */  paddub      $4, $21, $0
/* 0CD114 001CD014 CC32070C */  jal         SearchDataSlot__16CDungeonEventManFv
/* 0CD118 001CD018 00000000 */   nop
/* 0CD11C 001CD01C 288E4070 */  paddub      $17, $2, $0
/* 0CD120 001CD020 07002016 */  bnez        $17, .L001CD040
/* 0CD124 001CD024 00000000 */   nop
/* 0CD128 001CD028 2A00023C */  lui         $2, %hi(LIT_3600)
/* 0CD12C 001CD02C B0BF4424 */  addiu       $4, $2, %lo(LIT_3600)
/* 0CD130 001CD030 A611040C */  jal         printf
/* 0CD134 001CD034 00000000 */   nop
.L001CD038:
/* 0CD138 001CD038 FFFF0010 */  b           .L001CD038
/* 0CD13C 001CD03C 00000000 */   nop
.L001CD040:
/* 0CD140 001CD040 28262072 */  paddub      $4, $17, $0
/* 0CD144 001CD044 282E0072 */  paddub      $5, $16, $0
/* 0CD148 001CD048 0832070C */  jal         Set__17CDungeonEventDataFP13CDungeonEvent
/* 0CD14C 001CD04C 00000000 */   nop
/* 0CD150 001CD050 2110D403 */  addu        $2, $30, $20
/* 0CD154 001CD054 0100013C */  lui         $1, (0x10000 >> 16)
/* 0CD158 001CD058 21084100 */  addu        $1, $2, $1
/* 0CD15C 001CD05C 549C20C4 */  lwc1        $f0, -0x63AC($1)
/* 0CD160 001CD060 60038046 */  cvt.s.w     $f13, $f0
/* 0CD164 001CD064 0000E38E */  lw          $3, 0x0($23)
/* 0CD168 001CD068 FFFF0224 */  addiu       $2, $0, -0x1
/* 0CD16C 001CD06C 04006214 */  bne         $3, $2, .L001CD080
/* 0CD170 001CD070 00000000 */   nop
/* 0CD174 001CD074 28160070 */  paddub      $2, $0, $0
/* 0CD178 001CD078 09000010 */  b           .L001CD0A0
/* 0CD17C 001CD07C 00000000 */   nop
.L001CD080:
/* 0CD180 001CD080 C0100300 */  sll         $2, $3, 3
/* 0CD184 001CD084 23104300 */  subu        $2, $2, $3
/* 0CD188 001CD088 80100200 */  sll         $2, $2, 2
/* 0CD18C 001CD08C 21104300 */  addu        $2, $2, $3
/* 0CD190 001CD090 00110200 */  sll         $2, $2, 4
/* 0CD194 001CD094 21105400 */  addu        $2, $2, $20
/* 0CD198 001CD098 A0044284 */  lh          $2, 0x4A0($2)
/* 0CD19C 001CD09C 00000000 */  nop
.L001CD0A0:
/* 0CD1A0 001CD0A0 00008244 */  mtc1        $2, $f0
/* 0CD1A4 001CD0A4 00000000 */  nop
/* 0CD1A8 001CD0A8 20008046 */  cvt.s.w     $f0, $f0
/* 0CD1AC 001CD0AC 406B0046 */  add.s       $f13, $f13, $f0
/* 0CD1B0 001CD0B0 4040023C */  lui         $2, (0x40400000 >> 16)
/* 0CD1B4 001CD0B4 00008244 */  mtc1        $2, $f0
/* 0CD1B8 001CD0B8 00000000 */  nop
/* 0CD1BC 001CD0BC 36680046 */  c.le.s      $f13, $f0
/* 0CD1C0 001CD0C0 00000000 */  nop
/* 0CD1C4 001CD0C4 02000145 */  bc1t        .L001CD0D0
/* 0CD1C8 001CD0C8 00000000 */   nop
/* 0CD1CC 001CD0CC 416B0046 */  sub.s       $f13, $f13, $f0
.L001CD0D0:
/* 0CD1D0 001CD0D0 4040023C */  lui         $2, (0x40400000 >> 16)
/* 0CD1D4 001CD0D4 00008244 */  mtc1        $2, $f0
/* 0CD1D8 001CD0D8 00000000 */  nop
/* 0CD1DC 001CD0DC 32000D46 */  c.eq.s      $f0, $f13
/* 0CD1E0 001CD0E0 00000000 */  nop
/* 0CD1E4 001CD0E4 03000045 */  bc1f        .L001CD0F4
/* 0CD1E8 001CD0E8 00000000 */   nop
/* 0CD1EC 001CD0EC 80BF023C */  lui         $2, (0xBF800000 >> 16)
/* 0CD1F0 001CD0F0 00688244 */  mtc1        $2, $f13
.L001CD0F4:
/* 0CD1F4 001CD0F4 B4C2023C */  lui         $2, (0xC2B40000 >> 16)
/* 0CD1F8 001CD0F8 00008244 */  mtc1        $2, $f0
/* 0CD1FC 001CD0FC 00000000 */  nop
/* 0CD200 001CD100 42000D46 */  mul.s       $f1, $f0, $f13
/* 0CD204 001CD104 B08080C7 */  lwc1        $f0, -0x7F50($28)
/* 0CD208 001CD108 42000146 */  mul.s       $f1, $f0, $f1
/* 0CD20C 001CD10C 3443023C */  lui         $2, (0x43340000 >> 16)
/* 0CD210 001CD110 00008244 */  mtc1        $2, $f0
/* 0CD214 001CD114 00000000 */  nop
/* 0CD218 001CD118 430B0046 */  div.s       $f13, $f1, $f0
/* 0CD21C 001CD11C 00608044 */  mtc1        $0, $f12
/* 0CD220 001CD120 00000000 */  nop
/* 0CD224 001CD124 86630046 */  mov.s       $f14, $f12
/* 0CD228 001CD128 1000048E */  lw          $4, 0x10($16)
/* 0CD22C 001CD12C 70A3040C */  jal         SetRotation__6CFrameFfff
/* 0CD230 001CD130 00000000 */   nop
/* 0CD234 001CD134 1400048E */  lw          $4, 0x14($16)
/* 0CD238 001CD138 C000A527 */  addiu       $5, $29, 0xC0
/* 0CD23C 001CD13C 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 0CD240 001CD140 00000000 */   nop
/* 0CD244 001CD144 200020AE */  sw          $0, 0x20($17)
/* 0CD248 001CD148 E000ACC7 */  lwc1        $f12, 0xE0($29)
/* 0CD24C 001CD14C E800ADC7 */  lwc1        $f13, 0xE8($29)
/* 0CD250 001CD150 5077040C */  jal         atan2f
/* 0CD254 001CD154 00000000 */   nop
/* 0CD258 001CD158 240020E6 */  swc1        $f0, 0x24($17)
/* 0CD25C 001CD15C 280020AE */  sw          $0, 0x28($17)
/* 0CD260 001CD160 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0CD264 001CD164 2C0022AE */  sw          $2, 0x2C($17)
/* 0CD268 001CD168 2043023C */  lui         $2, (0x43200000 >> 16)
/* 0CD26C 001CD16C 00088244 */  mtc1        $2, $f1
/* 0CD270 001CD170 00009244 */  mtc1        $18, $f0
/* 0CD274 001CD174 00000000 */  nop
/* 0CD278 001CD178 20008046 */  cvt.s.w     $f0, $f0
/* 0CD27C 001CD17C 020B0046 */  mul.s       $f12, $f1, $f0
/* 0CD280 001CD180 00688044 */  mtc1        $0, $f13
/* 0CD284 001CD184 00009344 */  mtc1        $19, $f0
/* 0CD288 001CD188 00000000 */  nop
/* 0CD28C 001CD18C 20008046 */  cvt.s.w     $f0, $f0
/* 0CD290 001CD190 820B0046 */  mul.s       $f14, $f1, $f0
/* 0CD294 001CD194 1000048E */  lw          $4, 0x10($16)
/* 0CD298 001CD198 A09F040C */  jal         SetPosition__6CFrameFfff
/* 0CD29C 001CD19C 00000000 */   nop
/* 0CD2A0 001CD1A0 1400048E */  lw          $4, 0x14($16)
/* 0CD2A4 001CD1A4 10002526 */  addiu       $5, $17, 0x10
/* 0CD2A8 001CD1A8 B000A627 */  addiu       $6, $29, 0xB0
/* 0CD2AC 001CD1AC 58A3040C */  jal         GetWorldPosition__6CFrameFPfPf
/* 0CD2B0 001CD1B0 00000000 */   nop
.L001CD1B4:
/* 0CD2B4 001CD1B4 0100D626 */  addiu       $22, $22, 0x1
.L001CD1B8:
/* 0CD2B8 001CD1B8 4000C32A */  slti        $3, $22, 0x40
/* 0CD2BC 001CD1BC 8CFF6014 */  bnez        $3, .L001CCFF0
/* 0CD2C0 001CD1C0 00000000 */   nop
.L001CD1C4:
/* 0CD2C4 001CD1C4 01005226 */  addiu       $18, $18, 0x1
.L001CD1C8:
/* 0CD2C8 001CD1C8 1000432A */  slti        $3, $18, 0x10
/* 0CD2CC 001CD1CC 77FF6014 */  bnez        $3, .L001CCFAC
/* 0CD2D0 001CD1D0 00000000 */   nop
/* 0CD2D4 001CD1D4 01007326 */  addiu       $19, $19, 0x1
.L001CD1D8:
/* 0CD2D8 001CD1D8 1000632A */  slti        $3, $19, 0x10
/* 0CD2DC 001CD1DC 70FF6014 */  bnez        $3, .L001CCFA0
/* 0CD2E0 001CD1E0 00000000 */   nop
/* 0CD2E4 001CD1E4 66000010 */  b           .L001CD380
/* 0CD2E8 001CD1E8 00000000 */   nop
.L001CD1EC:
/* 0CD2EC 001CD1EC 28960070 */  paddub      $18, $0, $0
/* 0CD2F0 001CD1F0 5A000010 */  b           .L001CD35C
/* 0CD2F4 001CD1F4 00000000 */   nop
.L001CD1F8:
/* 0CD2F8 001CD1F8 289E0070 */  paddub      $19, $0, $0
/* 0CD2FC 001CD1FC 53000010 */  b           .L001CD34C
/* 0CD300 001CD200 00000000 */   nop
.L001CD204:
/* 0CD304 001CD204 2826A072 */  paddub      $4, $21, $0
/* 0CD308 001CD208 282E6072 */  paddub      $5, $19, $0
/* 0CD30C 001CD20C 28364072 */  paddub      $6, $18, $0
/* 0CD310 001CD210 3C32070C */  jal         SearchPartsID__16CDungeonEventManFii
/* 0CD314 001CD214 00000000 */   nop
/* 0CD318 001CD218 28864070 */  paddub      $16, $2, $0
/* 0CD31C 001CD21C 4A004010 */  beqz        $2, .L001CD348
/* 0CD320 001CD220 00000000 */   nop
/* 0CD324 001CD224 2826A072 */  paddub      $4, $21, $0
/* 0CD328 001CD228 CC32070C */  jal         SearchDataSlot__16CDungeonEventManFv
/* 0CD32C 001CD22C 00000000 */   nop
/* 0CD330 001CD230 288E4070 */  paddub      $17, $2, $0
/* 0CD334 001CD234 28262072 */  paddub      $4, $17, $0
/* 0CD338 001CD238 282E0072 */  paddub      $5, $16, $0
/* 0CD33C 001CD23C 0832070C */  jal         Set__17CDungeonEventDataFP13CDungeonEvent
/* 0CD340 001CD240 00000000 */   nop
/* 0CD344 001CD244 2118D402 */  addu        $3, $22, $20
/* 0CD348 001CD248 000661C4 */  lwc1        $f1, 0x600($3)
/* 0CD34C 001CD24C FFFF0224 */  addiu       $2, $0, -0x1
/* 0CD350 001CD250 04004216 */  bne         $18, $2, .L001CD264
/* 0CD354 001CD254 00000000 */   nop
/* 0CD358 001CD258 28160070 */  paddub      $2, $0, $0
/* 0CD35C 001CD25C 03000010 */  b           .L001CD26C
/* 0CD360 001CD260 00000000 */   nop
.L001CD264:
/* 0CD364 001CD264 A0046284 */  lh          $2, 0x4A0($3)
/* 0CD368 001CD268 00000000 */  nop
.L001CD26C:
/* 0CD36C 001CD26C 00008244 */  mtc1        $2, $f0
/* 0CD370 001CD270 00000000 */  nop
/* 0CD374 001CD274 20008046 */  cvt.s.w     $f0, $f0
/* 0CD378 001CD278 40080046 */  add.s       $f1, $f1, $f0
/* 0CD37C 001CD27C 4040023C */  lui         $2, (0x40400000 >> 16)
/* 0CD380 001CD280 00008244 */  mtc1        $2, $f0
/* 0CD384 001CD284 00000000 */  nop
/* 0CD388 001CD288 36080046 */  c.le.s      $f1, $f0
/* 0CD38C 001CD28C 00000000 */  nop
/* 0CD390 001CD290 02000145 */  bc1t        .L001CD29C
/* 0CD394 001CD294 00000000 */   nop
/* 0CD398 001CD298 41080046 */  sub.s       $f1, $f1, $f0
.L001CD29C:
/* 0CD39C 001CD29C 4040023C */  lui         $2, (0x40400000 >> 16)
/* 0CD3A0 001CD2A0 00008244 */  mtc1        $2, $f0
/* 0CD3A4 001CD2A4 00000000 */  nop
/* 0CD3A8 001CD2A8 32000146 */  c.eq.s      $f0, $f1
/* 0CD3AC 001CD2AC 00000000 */  nop
/* 0CD3B0 001CD2B0 03000045 */  bc1f        .L001CD2C0
/* 0CD3B4 001CD2B4 00000000 */   nop
/* 0CD3B8 001CD2B8 80BF023C */  lui         $2, (0xBF800000 >> 16)
/* 0CD3BC 001CD2BC 00088244 */  mtc1        $2, $f1
.L001CD2C0:
/* 0CD3C0 001CD2C0 B4C2023C */  lui         $2, (0xC2B40000 >> 16)
/* 0CD3C4 001CD2C4 00008244 */  mtc1        $2, $f0
/* 0CD3C8 001CD2C8 00000000 */  nop
/* 0CD3CC 001CD2CC 42000146 */  mul.s       $f1, $f0, $f1
/* 0CD3D0 001CD2D0 B08080C7 */  lwc1        $f0, -0x7F50($28)
/* 0CD3D4 001CD2D4 42000146 */  mul.s       $f1, $f0, $f1
/* 0CD3D8 001CD2D8 3443023C */  lui         $2, (0x43340000 >> 16)
/* 0CD3DC 001CD2DC 00008244 */  mtc1        $2, $f0
/* 0CD3E0 001CD2E0 00000000 */  nop
/* 0CD3E4 001CD2E4 430B0046 */  div.s       $f13, $f1, $f0
/* 0CD3E8 001CD2E8 00608044 */  mtc1        $0, $f12
/* 0CD3EC 001CD2EC 00000000 */  nop
/* 0CD3F0 001CD2F0 86630046 */  mov.s       $f14, $f12
/* 0CD3F4 001CD2F4 1000048E */  lw          $4, 0x10($16)
/* 0CD3F8 001CD2F8 70A3040C */  jal         SetRotation__6CFrameFfff
/* 0CD3FC 001CD2FC 00000000 */   nop
/* 0CD400 001CD300 1400048E */  lw          $4, 0x14($16)
/* 0CD404 001CD304 0001A527 */  addiu       $5, $29, 0x100
/* 0CD408 001CD308 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 0CD40C 001CD30C 00000000 */   nop
/* 0CD410 001CD310 200020AE */  sw          $0, 0x20($17)
/* 0CD414 001CD314 2001ACC7 */  lwc1        $f12, 0x120($29)
/* 0CD418 001CD318 2801ADC7 */  lwc1        $f13, 0x128($29)
/* 0CD41C 001CD31C 5077040C */  jal         atan2f
/* 0CD420 001CD320 00000000 */   nop
/* 0CD424 001CD324 240020E6 */  swc1        $f0, 0x24($17)
/* 0CD428 001CD328 280020AE */  sw          $0, 0x28($17)
/* 0CD42C 001CD32C 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0CD430 001CD330 2C0022AE */  sw          $2, 0x2C($17)
/* 0CD434 001CD334 1400048E */  lw          $4, 0x14($16)
/* 0CD438 001CD338 10002526 */  addiu       $5, $17, 0x10
/* 0CD43C 001CD33C B000A627 */  addiu       $6, $29, 0xB0
/* 0CD440 001CD340 58A3040C */  jal         GetWorldPosition__6CFrameFPfPf
/* 0CD444 001CD344 00000000 */   nop
.L001CD348:
/* 0CD448 001CD348 01007326 */  addiu       $19, $19, 0x1
.L001CD34C:
/* 0CD44C 001CD34C 4000632A */  slti        $3, $19, 0x40
/* 0CD450 001CD350 ACFF6014 */  bnez        $3, .L001CD204
/* 0CD454 001CD354 00000000 */   nop
/* 0CD458 001CD358 01005226 */  addiu       $18, $18, 0x1
.L001CD35C:
/* 0CD45C 001CD35C C0181200 */  sll         $3, $18, 3
/* 0CD460 001CD360 23187200 */  subu        $3, $3, $18
/* 0CD464 001CD364 80180300 */  sll         $3, $3, 2
/* 0CD468 001CD368 21187200 */  addu        $3, $3, $18
/* 0CD46C 001CD36C 00B10300 */  sll         $22, $3, 4
/* 0CD470 001CD370 2118D402 */  addu        $3, $22, $20
/* 0CD474 001CD374 4006638C */  lw          $3, 0x640($3)
/* 0CD478 001CD378 9FFF6014 */  bnez        $3, .L001CD1F8
/* 0CD47C 001CD37C 00000000 */   nop
.L001CD380:
/* 0CD480 001CD380 9000BF7B */  lq          $31, 0x90($29)
/* 0CD484 001CD384 8000BE7B */  lq          $30, 0x80($29)
/* 0CD488 001CD388 7000B77B */  lq          $23, 0x70($29)
/* 0CD48C 001CD38C 6000B67B */  lq          $22, 0x60($29)
/* 0CD490 001CD390 5000B57B */  lq          $21, 0x50($29)
/* 0CD494 001CD394 4000B47B */  lq          $20, 0x40($29)
/* 0CD498 001CD398 3000B37B */  lq          $19, 0x30($29)
/* 0CD49C 001CD39C 2000B27B */  lq          $18, 0x20($29)
/* 0CD4A0 001CD3A0 1000B17B */  lq          $17, 0x10($29)
/* 0CD4A4 001CD3A4 0000B07B */  lq          $16, 0x0($29)
/* 0CD4A8 001CD3A8 4001BD27 */  addiu       $29, $29, 0x140
/* 0CD4AC 001CD3AC 0800E003 */  jr          $31
/* 0CD4B0 001CD3B0 00000000 */   nop
/* 0CD4B4 001CD3B4 00000000 */  nop
/* 0CD4B8 001CD3B8 00000000 */  nop
/* 0CD4BC 001CD3BC 00000000 */  nop
