.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetupEvent__16CDungeonEventManFP11CDungeonMapi
/* CD040 001CCF40 C0FEBD27 */  addiu      $sp, $sp, -0x140
/* CD044 001CCF44 9000BF7F */  sq         $31, 0x90($sp)
/* CD048 001CCF48 8000BE7F */  sq         $fp, 0x80($sp)
/* CD04C 001CCF4C 7000B77F */  sq         $23, 0x70($sp)
/* CD050 001CCF50 6000B67F */  sq         $22, 0x60($sp)
/* CD054 001CCF54 5000B57F */  sq         $21, 0x50($sp)
/* CD058 001CCF58 4000B47F */  sq         $20, 0x40($sp)
/* CD05C 001CCF5C 3000B37F */  sq         $19, 0x30($sp)
/* CD060 001CCF60 2000B27F */  sq         $18, 0x20($sp)
/* CD064 001CCF64 1000B17F */  sq         $17, 0x10($sp)
/* CD068 001CCF68 0000B07F */  sq         $16, 0x0($sp)
/* CD06C 001CCF6C 28AE8070 */  paddub     $21, $4, $0
/* CD070 001CCF70 28A6A070 */  paddub     $20, $5, $0
/* CD074 001CCF74 2800033C */  lui        $3, %hi(_3530)
/* CD078 001CCF78 A0A06324 */  addiu      $3, $3, %lo(_3530)
/* CD07C 001CCF7C B000A427 */  addiu      $4, $sp, 0xB0
/* CD080 001CCF80 00006378 */  lq         $3, 0x0($3)
/* CD084 001CCF84 0000837C */  sq         $3, 0x0($4)
/* CD088 001CCF88 01000324 */  addiu      $3, $0, 0x1
/* CD08C 001CCF8C 9700C314 */  bne        $6, $3, .L001CD1EC
/* CD090 001CCF90 00000000 */   nop
/* CD094 001CCF94 289E0070 */  paddub     $19, $0, $0
/* CD098 001CCF98 8F000010 */  b          .L001CD1D8
/* CD09C 001CCF9C 00000000 */   nop
.L001CCFA0:
/* CD0A0 001CCFA0 28960070 */  paddub     $18, $0, $0
/* CD0A4 001CCFA4 88000010 */  b          .L001CD1C8
/* CD0A8 001CCFA8 00000000 */   nop
.L001CCFAC:
/* CD0AC 001CCFAC 80181300 */  sll        $3, $19, 2
/* CD0B0 001CCFB0 21187300 */  addu       $3, $3, $19
/* CD0B4 001CCFB4 80180300 */  sll        $3, $3, 2
/* CD0B8 001CCFB8 21184302 */  addu       $3, $18, $3
/* CD0BC 001CCFBC 00F10300 */  sll        $fp, $3, 4
/* CD0C0 001CCFC0 2118D403 */  addu       $3, $fp, $20
/* CD0C4 001CCFC4 581C7724 */  addiu      $23, $3, 0x1C58
/* CD0C8 001CCFC8 F87FF726 */  addiu      $23, $23, 0x7FF8
/* CD0CC 001CCFCC 0000E38E */  lw         $3, 0x0($23)
/* CD0D0 001CCFD0 A000A3AF */  sw         $3, 0xA0($sp)
/* CD0D4 001CCFD4 FFFF0424 */  addiu      $4, $0, -0x1
/* CD0D8 001CCFD8 A000A38F */  lw         $3, 0xA0($sp)
/* CD0DC 001CCFDC 79006410 */  beq        $3, $4, .L001CD1C4
/* CD0E0 001CCFE0 00000000 */   nop
/* CD0E4 001CCFE4 28B60070 */  paddub     $22, $0, $0
/* CD0E8 001CCFE8 73000010 */  b          .L001CD1B8
/* CD0EC 001CCFEC 00000000 */   nop
.L001CCFF0:
/* CD0F0 001CCFF0 2826A072 */  paddub     $4, $21, $0
/* CD0F4 001CCFF4 282EC072 */  paddub     $5, $22, $0
/* CD0F8 001CCFF8 A000A68F */  lw         $6, 0xA0($sp)
/* CD0FC 001CCFFC 3C32070C */  jal        SearchPartsID__16CDungeonEventManFii
/* CD100 001CD000 00000000 */   nop
/* CD104 001CD004 28864070 */  paddub     $16, $2, $0
/* CD108 001CD008 6A004010 */  beqz       $2, .L001CD1B4
/* CD10C 001CD00C 00000000 */   nop
/* CD110 001CD010 2826A072 */  paddub     $4, $21, $0
/* CD114 001CD014 CC32070C */  jal        SearchDataSlot__16CDungeonEventManFv
/* CD118 001CD018 00000000 */   nop
/* CD11C 001CD01C 288E4070 */  paddub     $17, $2, $0
/* CD120 001CD020 07002016 */  bnez       $17, .L001CD040
/* CD124 001CD024 00000000 */   nop
/* CD128 001CD028 2A00023C */  lui        $2, %hi(_3600)
/* CD12C 001CD02C B0BF4424 */  addiu      $4, $2, %lo(_3600)
/* CD130 001CD030 A611040C */  jal        printf
/* CD134 001CD034 00000000 */   nop
.L001CD038:
/* CD138 001CD038 FFFF0010 */  b          .L001CD038
/* CD13C 001CD03C 00000000 */   nop
.L001CD040:
/* CD140 001CD040 28262072 */  paddub     $4, $17, $0
/* CD144 001CD044 282E0072 */  paddub     $5, $16, $0
/* CD148 001CD048 0832070C */  jal        Set__17CDungeonEventDataFP13CDungeonEvent
/* CD14C 001CD04C 00000000 */   nop
/* CD150 001CD050 2110D403 */  addu       $2, $fp, $20
/* CD154 001CD054 0100013C */  lui        $at, (0x10000 >> 16)
/* CD158 001CD058 21084100 */  addu       $at, $2, $at
/* CD15C 001CD05C 549C20C4 */  lwc1       $f0, -0x63AC($at)
/* CD160 001CD060 60038046 */  cvt.s.w    $f13, $f0
/* CD164 001CD064 0000E38E */  lw         $3, 0x0($23)
/* CD168 001CD068 FFFF0224 */  addiu      $2, $0, -0x1
/* CD16C 001CD06C 04006214 */  bne        $3, $2, .L001CD080
/* CD170 001CD070 00000000 */   nop
/* CD174 001CD074 28160070 */  paddub     $2, $0, $0
/* CD178 001CD078 09000010 */  b          .L001CD0A0
/* CD17C 001CD07C 00000000 */   nop
.L001CD080:
/* CD180 001CD080 C0100300 */  sll        $2, $3, 3
/* CD184 001CD084 23104300 */  subu       $2, $2, $3
/* CD188 001CD088 80100200 */  sll        $2, $2, 2
/* CD18C 001CD08C 21104300 */  addu       $2, $2, $3
/* CD190 001CD090 00110200 */  sll        $2, $2, 4
/* CD194 001CD094 21105400 */  addu       $2, $2, $20
/* CD198 001CD098 A0044284 */  lh         $2, 0x4A0($2)
/* CD19C 001CD09C 00000000 */  nop
.L001CD0A0:
/* CD1A0 001CD0A0 00008244 */  mtc1       $2, $f0
/* CD1A4 001CD0A4 00000000 */  nop
/* CD1A8 001CD0A8 20008046 */  cvt.s.w    $f0, $f0
/* CD1AC 001CD0AC 406B0046 */  add.s      $f13, $f13, $f0
/* CD1B0 001CD0B0 4040023C */  lui        $2, (0x40400000 >> 16)
/* CD1B4 001CD0B4 00008244 */  mtc1       $2, $f0
/* CD1B8 001CD0B8 00000000 */  nop
/* CD1BC 001CD0BC 36680046 */  c.le.s     $f13, $f0
/* CD1C0 001CD0C0 00000000 */  nop
/* CD1C4 001CD0C4 02000145 */  bc1t       .L001CD0D0
/* CD1C8 001CD0C8 00000000 */   nop
/* CD1CC 001CD0CC 416B0046 */  sub.s      $f13, $f13, $f0
.L001CD0D0:
/* CD1D0 001CD0D0 4040023C */  lui        $2, (0x40400000 >> 16)
/* CD1D4 001CD0D4 00008244 */  mtc1       $2, $f0
/* CD1D8 001CD0D8 00000000 */  nop
/* CD1DC 001CD0DC 32000D46 */  c.eq.s     $f0, $f13
/* CD1E0 001CD0E0 00000000 */  nop
/* CD1E4 001CD0E4 03000045 */  bc1f       .L001CD0F4
/* CD1E8 001CD0E8 00000000 */   nop
/* CD1EC 001CD0EC 80BF023C */  lui        $2, (0xBF800000 >> 16)
/* CD1F0 001CD0F0 00688244 */  mtc1       $2, $f13
.L001CD0F4:
/* CD1F4 001CD0F4 B4C2023C */  lui        $2, (0xC2B40000 >> 16)
/* CD1F8 001CD0F8 00008244 */  mtc1       $2, $f0
/* CD1FC 001CD0FC 00000000 */  nop
/* CD200 001CD100 42000D46 */  mul.s      $f1, $f0, $f13
/* CD204 001CD104 B08080C7 */  lwc1       $f0, -0x7F50($gp)
/* CD208 001CD108 42000146 */  mul.s      $f1, $f0, $f1
/* CD20C 001CD10C 3443023C */  lui        $2, (0x43340000 >> 16)
/* CD210 001CD110 00008244 */  mtc1       $2, $f0
/* CD214 001CD114 00000000 */  nop
/* CD218 001CD118 430B0046 */  div.s      $f13, $f1, $f0
/* CD21C 001CD11C 00608044 */  mtc1       $0, $f12
/* CD220 001CD120 00000000 */  nop
/* CD224 001CD124 86630046 */  mov.s      $f14, $f12
/* CD228 001CD128 1000048E */  lw         $4, 0x10($16)
/* CD22C 001CD12C 70A3040C */  jal        SetRotation__6CFrameFfff
/* CD230 001CD130 00000000 */   nop
/* CD234 001CD134 1400048E */  lw         $4, 0x14($16)
/* CD238 001CD138 C000A527 */  addiu      $5, $sp, 0xC0
/* CD23C 001CD13C 6CA0040C */  jal        GetLWMatrix__6CFrameFPA4_f
/* CD240 001CD140 00000000 */   nop
/* CD244 001CD144 200020AE */  sw         $0, 0x20($17)
/* CD248 001CD148 E000ACC7 */  lwc1       $f12, 0xE0($sp)
/* CD24C 001CD14C E800ADC7 */  lwc1       $f13, 0xE8($sp)
/* CD250 001CD150 5077040C */  jal        atan2f
/* CD254 001CD154 00000000 */   nop
/* CD258 001CD158 240020E6 */  swc1       $f0, 0x24($17)
/* CD25C 001CD15C 280020AE */  sw         $0, 0x28($17)
/* CD260 001CD160 803F023C */  lui        $2, (0x3F800000 >> 16)
/* CD264 001CD164 2C0022AE */  sw         $2, 0x2C($17)
/* CD268 001CD168 2043023C */  lui        $2, (0x43200000 >> 16)
/* CD26C 001CD16C 00088244 */  mtc1       $2, $f1
/* CD270 001CD170 00009244 */  mtc1       $18, $f0
/* CD274 001CD174 00000000 */  nop
/* CD278 001CD178 20008046 */  cvt.s.w    $f0, $f0
/* CD27C 001CD17C 020B0046 */  mul.s      $f12, $f1, $f0
/* CD280 001CD180 00688044 */  mtc1       $0, $f13
/* CD284 001CD184 00009344 */  mtc1       $19, $f0
/* CD288 001CD188 00000000 */  nop
/* CD28C 001CD18C 20008046 */  cvt.s.w    $f0, $f0
/* CD290 001CD190 820B0046 */  mul.s      $f14, $f1, $f0
/* CD294 001CD194 1000048E */  lw         $4, 0x10($16)
/* CD298 001CD198 A09F040C */  jal        SetPosition__6CFrameFfff
/* CD29C 001CD19C 00000000 */   nop
/* CD2A0 001CD1A0 1400048E */  lw         $4, 0x14($16)
/* CD2A4 001CD1A4 10002526 */  addiu      $5, $17, 0x10
/* CD2A8 001CD1A8 B000A627 */  addiu      $6, $sp, 0xB0
/* CD2AC 001CD1AC 58A3040C */  jal        GetWorldPosition__6CFrameFPfPf
/* CD2B0 001CD1B0 00000000 */   nop
.L001CD1B4:
/* CD2B4 001CD1B4 0100D626 */  addiu      $22, $22, 0x1
.L001CD1B8:
/* CD2B8 001CD1B8 4000C32A */  slti       $3, $22, 0x40
/* CD2BC 001CD1BC 8CFF6014 */  bnez       $3, .L001CCFF0
/* CD2C0 001CD1C0 00000000 */   nop
.L001CD1C4:
/* CD2C4 001CD1C4 01005226 */  addiu      $18, $18, 0x1
.L001CD1C8:
/* CD2C8 001CD1C8 1000432A */  slti       $3, $18, 0x10
/* CD2CC 001CD1CC 77FF6014 */  bnez       $3, .L001CCFAC
/* CD2D0 001CD1D0 00000000 */   nop
/* CD2D4 001CD1D4 01007326 */  addiu      $19, $19, 0x1
.L001CD1D8:
/* CD2D8 001CD1D8 1000632A */  slti       $3, $19, 0x10
/* CD2DC 001CD1DC 70FF6014 */  bnez       $3, .L001CCFA0
/* CD2E0 001CD1E0 00000000 */   nop
/* CD2E4 001CD1E4 66000010 */  b          .L001CD380
/* CD2E8 001CD1E8 00000000 */   nop
.L001CD1EC:
/* CD2EC 001CD1EC 28960070 */  paddub     $18, $0, $0
/* CD2F0 001CD1F0 5A000010 */  b          .L001CD35C
/* CD2F4 001CD1F4 00000000 */   nop
.L001CD1F8:
/* CD2F8 001CD1F8 289E0070 */  paddub     $19, $0, $0
/* CD2FC 001CD1FC 53000010 */  b          .L001CD34C
/* CD300 001CD200 00000000 */   nop
.L001CD204:
/* CD304 001CD204 2826A072 */  paddub     $4, $21, $0
/* CD308 001CD208 282E6072 */  paddub     $5, $19, $0
/* CD30C 001CD20C 28364072 */  paddub     $6, $18, $0
/* CD310 001CD210 3C32070C */  jal        SearchPartsID__16CDungeonEventManFii
/* CD314 001CD214 00000000 */   nop
/* CD318 001CD218 28864070 */  paddub     $16, $2, $0
/* CD31C 001CD21C 4A004010 */  beqz       $2, .L001CD348
/* CD320 001CD220 00000000 */   nop
/* CD324 001CD224 2826A072 */  paddub     $4, $21, $0
/* CD328 001CD228 CC32070C */  jal        SearchDataSlot__16CDungeonEventManFv
/* CD32C 001CD22C 00000000 */   nop
/* CD330 001CD230 288E4070 */  paddub     $17, $2, $0
/* CD334 001CD234 28262072 */  paddub     $4, $17, $0
/* CD338 001CD238 282E0072 */  paddub     $5, $16, $0
/* CD33C 001CD23C 0832070C */  jal        Set__17CDungeonEventDataFP13CDungeonEvent
/* CD340 001CD240 00000000 */   nop
/* CD344 001CD244 2118D402 */  addu       $3, $22, $20
/* CD348 001CD248 000661C4 */  lwc1       $f1, 0x600($3)
/* CD34C 001CD24C FFFF0224 */  addiu      $2, $0, -0x1
/* CD350 001CD250 04004216 */  bne        $18, $2, .L001CD264
/* CD354 001CD254 00000000 */   nop
/* CD358 001CD258 28160070 */  paddub     $2, $0, $0
/* CD35C 001CD25C 03000010 */  b          .L001CD26C
/* CD360 001CD260 00000000 */   nop
.L001CD264:
/* CD364 001CD264 A0046284 */  lh         $2, 0x4A0($3)
/* CD368 001CD268 00000000 */  nop
.L001CD26C:
/* CD36C 001CD26C 00008244 */  mtc1       $2, $f0
/* CD370 001CD270 00000000 */  nop
/* CD374 001CD274 20008046 */  cvt.s.w    $f0, $f0
/* CD378 001CD278 40080046 */  add.s      $f1, $f1, $f0
/* CD37C 001CD27C 4040023C */  lui        $2, (0x40400000 >> 16)
/* CD380 001CD280 00008244 */  mtc1       $2, $f0
/* CD384 001CD284 00000000 */  nop
/* CD388 001CD288 36080046 */  c.le.s     $f1, $f0
/* CD38C 001CD28C 00000000 */  nop
/* CD390 001CD290 02000145 */  bc1t       .L001CD29C
/* CD394 001CD294 00000000 */   nop
/* CD398 001CD298 41080046 */  sub.s      $f1, $f1, $f0
.L001CD29C:
/* CD39C 001CD29C 4040023C */  lui        $2, (0x40400000 >> 16)
/* CD3A0 001CD2A0 00008244 */  mtc1       $2, $f0
/* CD3A4 001CD2A4 00000000 */  nop
/* CD3A8 001CD2A8 32000146 */  c.eq.s     $f0, $f1
/* CD3AC 001CD2AC 00000000 */  nop
/* CD3B0 001CD2B0 03000045 */  bc1f       .L001CD2C0
/* CD3B4 001CD2B4 00000000 */   nop
/* CD3B8 001CD2B8 80BF023C */  lui        $2, (0xBF800000 >> 16)
/* CD3BC 001CD2BC 00088244 */  mtc1       $2, $f1
.L001CD2C0:
/* CD3C0 001CD2C0 B4C2023C */  lui        $2, (0xC2B40000 >> 16)
/* CD3C4 001CD2C4 00008244 */  mtc1       $2, $f0
/* CD3C8 001CD2C8 00000000 */  nop
/* CD3CC 001CD2CC 42000146 */  mul.s      $f1, $f0, $f1
/* CD3D0 001CD2D0 B08080C7 */  lwc1       $f0, -0x7F50($gp)
/* CD3D4 001CD2D4 42000146 */  mul.s      $f1, $f0, $f1
/* CD3D8 001CD2D8 3443023C */  lui        $2, (0x43340000 >> 16)
/* CD3DC 001CD2DC 00008244 */  mtc1       $2, $f0
/* CD3E0 001CD2E0 00000000 */  nop
/* CD3E4 001CD2E4 430B0046 */  div.s      $f13, $f1, $f0
/* CD3E8 001CD2E8 00608044 */  mtc1       $0, $f12
/* CD3EC 001CD2EC 00000000 */  nop
/* CD3F0 001CD2F0 86630046 */  mov.s      $f14, $f12
/* CD3F4 001CD2F4 1000048E */  lw         $4, 0x10($16)
/* CD3F8 001CD2F8 70A3040C */  jal        SetRotation__6CFrameFfff
/* CD3FC 001CD2FC 00000000 */   nop
/* CD400 001CD300 1400048E */  lw         $4, 0x14($16)
/* CD404 001CD304 0001A527 */  addiu      $5, $sp, 0x100
/* CD408 001CD308 6CA0040C */  jal        GetLWMatrix__6CFrameFPA4_f
/* CD40C 001CD30C 00000000 */   nop
/* CD410 001CD310 200020AE */  sw         $0, 0x20($17)
/* CD414 001CD314 2001ACC7 */  lwc1       $f12, 0x120($sp)
/* CD418 001CD318 2801ADC7 */  lwc1       $f13, 0x128($sp)
/* CD41C 001CD31C 5077040C */  jal        atan2f
/* CD420 001CD320 00000000 */   nop
/* CD424 001CD324 240020E6 */  swc1       $f0, 0x24($17)
/* CD428 001CD328 280020AE */  sw         $0, 0x28($17)
/* CD42C 001CD32C 803F023C */  lui        $2, (0x3F800000 >> 16)
/* CD430 001CD330 2C0022AE */  sw         $2, 0x2C($17)
/* CD434 001CD334 1400048E */  lw         $4, 0x14($16)
/* CD438 001CD338 10002526 */  addiu      $5, $17, 0x10
/* CD43C 001CD33C B000A627 */  addiu      $6, $sp, 0xB0
/* CD440 001CD340 58A3040C */  jal        GetWorldPosition__6CFrameFPfPf
/* CD444 001CD344 00000000 */   nop
.L001CD348:
/* CD448 001CD348 01007326 */  addiu      $19, $19, 0x1
.L001CD34C:
/* CD44C 001CD34C 4000632A */  slti       $3, $19, 0x40
/* CD450 001CD350 ACFF6014 */  bnez       $3, .L001CD204
/* CD454 001CD354 00000000 */   nop
/* CD458 001CD358 01005226 */  addiu      $18, $18, 0x1
.L001CD35C:
/* CD45C 001CD35C C0181200 */  sll        $3, $18, 3
/* CD460 001CD360 23187200 */  subu       $3, $3, $18
/* CD464 001CD364 80180300 */  sll        $3, $3, 2
/* CD468 001CD368 21187200 */  addu       $3, $3, $18
/* CD46C 001CD36C 00B10300 */  sll        $22, $3, 4
/* CD470 001CD370 2118D402 */  addu       $3, $22, $20
/* CD474 001CD374 4006638C */  lw         $3, 0x640($3)
/* CD478 001CD378 9FFF6014 */  bnez       $3, .L001CD1F8
/* CD47C 001CD37C 00000000 */   nop
.L001CD380:
/* CD480 001CD380 9000BF7B */  lq         $31, 0x90($sp)
/* CD484 001CD384 8000BE7B */  lq         $fp, 0x80($sp)
/* CD488 001CD388 7000B77B */  lq         $23, 0x70($sp)
/* CD48C 001CD38C 6000B67B */  lq         $22, 0x60($sp)
/* CD490 001CD390 5000B57B */  lq         $21, 0x50($sp)
/* CD494 001CD394 4000B47B */  lq         $20, 0x40($sp)
/* CD498 001CD398 3000B37B */  lq         $19, 0x30($sp)
/* CD49C 001CD39C 2000B27B */  lq         $18, 0x20($sp)
/* CD4A0 001CD3A0 1000B17B */  lq         $17, 0x10($sp)
/* CD4A4 001CD3A4 0000B07B */  lq         $16, 0x0($sp)
/* CD4A8 001CD3A8 4001BD27 */  addiu      $sp, $sp, 0x140
/* CD4AC 001CD3AC 0800E003 */  jr         $31
/* CD4B0 001CD3B0 00000000 */   nop
/* CD4B4 001CD3B4 00000000 */  nop
/* CD4B8 001CD3B8 00000000 */  nop
/* CD4BC 001CD3BC 00000000 */  nop
