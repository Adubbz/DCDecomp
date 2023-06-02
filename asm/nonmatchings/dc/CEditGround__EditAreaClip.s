.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EditAreaClip__11CEditGroundFP7CCameraf
/* A1F30 001A1E30 90FEBD27 */  addiu      $sp, $sp, -0x170
/* A1F34 001A1E34 8000BF7F */  sq         $31, 0x80($sp)
/* A1F38 001A1E38 7000B67F */  sq         $22, 0x70($sp)
/* A1F3C 001A1E3C 6000B57F */  sq         $21, 0x60($sp)
/* A1F40 001A1E40 5000B47F */  sq         $20, 0x50($sp)
/* A1F44 001A1E44 4000B37F */  sq         $19, 0x40($sp)
/* A1F48 001A1E48 3000B27F */  sq         $18, 0x30($sp)
/* A1F4C 001A1E4C 2000B17F */  sq         $17, 0x20($sp)
/* A1F50 001A1E50 1000B07F */  sq         $16, 0x10($sp)
/* A1F54 001A1E54 0800B6E7 */  swc1       $f22, 0x8($sp)
/* A1F58 001A1E58 0400B5E7 */  swc1       $f21, 0x4($sp)
/* A1F5C 001A1E5C 0000B4E7 */  swc1       $f20, 0x0($sp)
/* A1F60 001A1E60 28868070 */  paddub     $16, $4, $0
/* A1F64 001A1E64 288EA070 */  paddub     $17, $5, $0
/* A1F68 001A1E68 46650046 */  mov.s      $f21, $f12
/* A1F6C 001A1E6C 2700023C */  lui        $2, %hi(_575_2)
/* A1F70 001A1E70 50AE4224 */  addiu      $2, $2, %lo(_575_2)
/* A1F74 001A1E74 B000A527 */  addiu      $5, $sp, 0xB0
/* A1F78 001A1E78 00004278 */  lq         $2, 0x0($2)
/* A1F7C 001A1E7C 0000A27C */  sq         $2, 0x0($5)
/* A1F80 001A1E80 2C002012 */  beqz       $17, .L001A1F34
/* A1F84 001A1E84 00000000 */   nop
/* A1F88 001A1E88 28262072 */  paddub     $4, $17, $0
/* A1F8C 001A1E8C 9C91040C */  jal        GetPos__7CCameraFPf
/* A1F90 001A1E90 00000000 */   nop
/* A1F94 001A1E94 28262072 */  paddub     $4, $17, $0
/* A1F98 001A1E98 C000A527 */  addiu      $5, $sp, 0xC0
/* A1F9C 001A1E9C A891040C */  jal        GetRef__7CCameraFPf
/* A1FA0 001A1EA0 00000000 */   nop
/* A1FA4 001A1EA4 D000A427 */  addiu      $4, $sp, 0xD0
/* A1FA8 001A1EA8 C000A527 */  addiu      $5, $sp, 0xC0
/* A1FAC 001A1EAC B000A627 */  addiu      $6, $sp, 0xB0
/* A1FB0 001A1EB0 EE85040C */  jal        sceVu0SubVector
/* A1FB4 001A1EB4 00000000 */   nop
/* A1FB8 001A1EB8 28260072 */  paddub     $4, $16, $0
/* A1FBC 001A1EBC B000ACC7 */  lwc1       $f12, 0xB0($sp)
/* A1FC0 001A1EC0 B400ADC7 */  lwc1       $f13, 0xB4($sp)
/* A1FC4 001A1EC4 B800AEC7 */  lwc1       $f14, 0xB8($sp)
/* A1FC8 001A1EC8 AC85060C */  jal        GetAreaCode__11CEditGroundFfff
/* A1FCC 001A1ECC 00000000 */   nop
/* A1FD0 001A1ED0 20004104 */  bgez       $2, .L001A1F54
/* A1FD4 001A1ED4 00000000 */   nop
/* A1FD8 001A1ED8 E000A427 */  addiu      $4, $sp, 0xE0
/* A1FDC 001A1EDC C000A527 */  addiu      $5, $sp, 0xC0
/* A1FE0 001A1EE0 B000A627 */  addiu      $6, $sp, 0xB0
/* A1FE4 001A1EE4 EE85040C */  jal        sceVu0SubVector
/* A1FE8 001A1EE8 00000000 */   nop
/* A1FEC 001A1EEC E400A0AF */  sw         $0, 0xE4($sp)
/* A1FF0 001A1EF0 E000A427 */  addiu      $4, $sp, 0xE0
/* A1FF4 001A1EF4 282E8070 */  paddub     $5, $4, $0
/* A1FF8 001A1EF8 9285040C */  jal        sceVu0Normalize
/* A1FFC 001A1EFC 00000000 */   nop
/* A2000 001A1F00 FA43023C */  lui        $2, (0x43FA0000 >> 16)
/* A2004 001A1F04 00608244 */  mtc1       $2, $f12
/* A2008 001A1F08 E000A427 */  addiu      $4, $sp, 0xE0
/* A200C 001A1F0C 282E8070 */  paddub     $5, $4, $0
/* A2010 001A1F10 FA85040C */  jal        sceVu0ScaleVector
/* A2014 001A1F14 00000000 */   nop
/* A2018 001A1F18 C000A427 */  addiu      $4, $sp, 0xC0
/* A201C 001A1F1C B000A527 */  addiu      $5, $sp, 0xB0
/* A2020 001A1F20 E000A627 */  addiu      $6, $sp, 0xE0
/* A2024 001A1F24 E885040C */  jal        sceVu0AddVector
/* A2028 001A1F28 00000000 */   nop
/* A202C 001A1F2C 09000010 */  b          .L001A1F54
/* A2030 001A1F30 00000000 */   nop
.L001A1F34:
/* A2034 001A1F34 2826A070 */  paddub     $4, $5, $0
/* A2038 001A1F38 C000A527 */  addiu      $5, $sp, 0xC0
/* A203C 001A1F3C 0C86040C */  jal        sceVu0CopyVector
/* A2040 001A1F40 00000000 */   nop
/* A2044 001A1F44 D000A427 */  addiu      $4, $sp, 0xD0
/* A2048 001A1F48 C000A527 */  addiu      $5, $sp, 0xC0
/* A204C 001A1F4C 0C86040C */  jal        sceVu0CopyVector
/* A2050 001A1F50 00000000 */   nop
.L001A1F54:
/* A2054 001A1F54 00A08044 */  mtc1       $0, $f20
/* A2058 001A1F58 288E0070 */  paddub     $17, $0, $0
/* A205C 001A1F5C 26010010 */  b          .L001A23F8
/* A2060 001A1F60 00000000 */   nop
.L001A1F64:
/* A2064 001A1F64 80A01100 */  sll        $20, $17, 2
/* A2068 001A1F68 21189002 */  addu       $3, $20, $16
/* A206C 001A1F6C 0400728C */  lw         $18, 0x4($3)
/* A2070 001A1F70 24014012 */  beqz       $18, .L001A2404
/* A2074 001A1F74 00000000 */   nop
/* A2078 001A1F78 A000B327 */  addiu      $19, $sp, 0xA0
/* A207C 001A1F7C 28264072 */  paddub     $4, $18, $0
/* A2080 001A1F80 282E6072 */  paddub     $5, $19, $0
/* A2084 001A1F84 54C0050C */  jal        GetOffset__9CEditAreaFPf
/* A2088 001A1F88 00000000 */   nop
/* A208C 001A1F8C 28264072 */  paddub     $4, $18, $0
/* A2090 001A1F90 84C0050C */  jal        GetUnitAlt__9CEditAreaFv
/* A2094 001A1F94 00000000 */   nop
/* A2098 001A1F98 0040023C */  lui        $2, (0x40000000 >> 16)
/* A209C 001A1F9C 00088244 */  mtc1       $2, $f1
/* A20A0 001A1FA0 00000000 */  nop
/* A20A4 001A1FA4 42080046 */  mul.s      $f1, $f1, $f0
/* A20A8 001A1FA8 A400A0C7 */  lwc1       $f0, 0xA4($sp)
/* A20AC 001A1FAC 01000146 */  sub.s      $f0, $f0, $f1
/* A20B0 001A1FB0 A400A0E7 */  swc1       $f0, 0xA4($sp)
/* A20B4 001A1FB4 803F023C */  lui        $2, (0x3F800000 >> 16)
/* A20B8 001A1FB8 AC00A2AF */  sw         $2, 0xAC($sp)
/* A20BC 001A1FBC 9000A427 */  addiu      $4, $sp, 0x90
/* A20C0 001A1FC0 282E6072 */  paddub     $5, $19, $0
/* A20C4 001A1FC4 0C86040C */  jal        sceVu0CopyVector
/* A20C8 001A1FC8 00000000 */   nop
/* A20CC 001A1FCC 28264072 */  paddub     $4, $18, $0
/* A20D0 001A1FD0 80C0050C */  jal        GetUnitSize__9CEditAreaFv
/* A20D4 001A1FD4 00000000 */   nop
/* A20D8 001A1FD8 86050046 */  mov.s      $f22, $f0
/* A20DC 001A1FDC 28264072 */  paddub     $4, $18, $0
/* A20E0 001A1FE0 5CC0050C */  jal        GetWidth__9CEditAreaFv
/* A20E4 001A1FE4 00000000 */   nop
/* A20E8 001A1FE8 00008244 */  mtc1       $2, $f0
/* A20EC 001A1FEC 00000000 */  nop
/* A20F0 001A1FF0 20008046 */  cvt.s.w    $f0, $f0
/* A20F4 001A1FF4 42B00046 */  mul.s      $f1, $f22, $f0
/* A20F8 001A1FF8 9000A0C7 */  lwc1       $f0, 0x90($sp)
/* A20FC 001A1FFC 00000146 */  add.s      $f0, $f0, $f1
/* A2100 001A2000 9000A0E7 */  swc1       $f0, 0x90($sp)
/* A2104 001A2004 28264072 */  paddub     $4, $18, $0
/* A2108 001A2008 84C0050C */  jal        GetUnitAlt__9CEditAreaFv
/* A210C 001A200C 00000000 */   nop
/* A2110 001A2010 0042023C */  lui        $2, (0x42000000 >> 16)
/* A2114 001A2014 00088244 */  mtc1       $2, $f1
/* A2118 001A2018 00000000 */  nop
/* A211C 001A201C 42080046 */  mul.s      $f1, $f1, $f0
/* A2120 001A2020 9400A0C7 */  lwc1       $f0, 0x94($sp)
/* A2124 001A2024 00000146 */  add.s      $f0, $f0, $f1
/* A2128 001A2028 9400A0E7 */  swc1       $f0, 0x94($sp)
/* A212C 001A202C 28264072 */  paddub     $4, $18, $0
/* A2130 001A2030 80C0050C */  jal        GetUnitSize__9CEditAreaFv
/* A2134 001A2034 00000000 */   nop
/* A2138 001A2038 86050046 */  mov.s      $f22, $f0
/* A213C 001A203C 28264072 */  paddub     $4, $18, $0
/* A2140 001A2040 60C0050C */  jal        GetHeight__9CEditAreaFv
/* A2144 001A2044 00000000 */   nop
/* A2148 001A2048 00008244 */  mtc1       $2, $f0
/* A214C 001A204C 00000000 */  nop
/* A2150 001A2050 20008046 */  cvt.s.w    $f0, $f0
/* A2154 001A2054 42B00046 */  mul.s      $f1, $f22, $f0
/* A2158 001A2058 9800B527 */  addiu      $21, $sp, 0x98
/* A215C 001A205C 0000A0C6 */  lwc1       $f0, 0x0($21)
/* A2160 001A2060 00000146 */  add.s      $f0, $f0, $f1
/* A2164 001A2064 0000A0E6 */  swc1       $f0, 0x0($21)
/* A2168 001A2068 80BF033C */  lui        $3, (0xBF800000 >> 16)
/* A216C 001A206C 21109D02 */  addu       $2, $20, $sp
/* A2170 001A2070 F0005624 */  addiu      $22, $2, 0xF0
/* A2174 001A2074 0000C3AE */  sw         $3, 0x0($22)
/* A2178 001A2078 00015224 */  addiu      $18, $2, 0x100
/* A217C 001A207C 000043AE */  sw         $3, 0x0($18)
/* A2180 001A2080 9000A427 */  addiu      $4, $sp, 0x90
/* A2184 001A2084 20BB040C */  jal        MGClipBox__FP7CBoxVu0
/* A2188 001A2088 00000000 */   nop
/* A218C 001A208C 05004010 */  beqz       $2, .L001A20A4
/* A2190 001A2090 00000000 */   nop
/* A2194 001A2094 21189002 */  addu       $3, $20, $16
/* A2198 001A2098 140060AC */  sw         $0, 0x14($3)
/* A219C 001A209C D5000010 */  b          .L001A23F4
/* A21A0 001A20A0 00000000 */   nop
.L001A20A4:
/* A21A4 001A20A4 01000324 */  addiu      $3, $0, 0x1
/* A21A8 001A20A8 21109002 */  addu       $2, $20, $16
/* A21AC 001A20AC 14005424 */  addiu      $20, $2, 0x14
/* A21B0 001A20B0 140043AC */  sw         $3, 0x14($2)
/* A21B4 001A20B4 2001A427 */  addiu      $4, $sp, 0x120
/* A21B8 001A20B8 9000A527 */  addiu      $5, $sp, 0x90
/* A21BC 001A20BC 28366072 */  paddub     $6, $19, $0
/* A21C0 001A20C0 E885040C */  jal        sceVu0AddVector
/* A21C4 001A20C4 00000000 */   nop
/* A21C8 001A20C8 003F023C */  lui        $2, (0x3F000000 >> 16)
/* A21CC 001A20CC 00608244 */  mtc1       $2, $f12
/* A21D0 001A20D0 2001A427 */  addiu      $4, $sp, 0x120
/* A21D4 001A20D4 282E8070 */  paddub     $5, $4, $0
/* A21D8 001A20D8 FA85040C */  jal        sceVu0ScaleVector
/* A21DC 001A20DC 00000000 */   nop
/* A21E0 001A20E0 1001A427 */  addiu      $4, $sp, 0x110
/* A21E4 001A20E4 2001A527 */  addiu      $5, $sp, 0x120
/* A21E8 001A20E8 B000A627 */  addiu      $6, $sp, 0xB0
/* A21EC 001A20EC EE85040C */  jal        sceVu0SubVector
/* A21F0 001A20F0 00000000 */   nop
/* A21F4 001A20F4 1001A427 */  addiu      $4, $sp, 0x110
/* A21F8 001A20F8 D000A527 */  addiu      $5, $sp, 0xD0
/* A21FC 001A20FC 8885040C */  jal        sceVu0InnerProduct
/* A2200 001A2100 00000000 */   nop
/* A2204 001A2104 000040E6 */  swc1       $f0, 0x0($18)
/* A2208 001A2108 00088044 */  mtc1       $0, $f1
/* A220C 001A210C 00000000 */  nop
/* A2210 001A2110 36000146 */  c.le.s     $f0, $f1
/* A2214 001A2114 00000000 */  nop
/* A2218 001A2118 05000145 */  bc1t       .L001A2130
/* A221C 001A211C 00000000 */   nop
/* A2220 001A2120 803F023C */  lui        $2, (0x3F800000 >> 16)
/* A2224 001A2124 00008244 */  mtc1       $2, $f0
/* A2228 001A2128 00000000 */  nop
/* A222C 001A212C 00A50046 */  add.s      $f20, $f20, $f0
.L001A2130:
/* A2230 001A2130 5001A427 */  addiu      $4, $sp, 0x150
/* A2234 001A2134 9000A527 */  addiu      $5, $sp, 0x90
/* A2238 001A2138 0C86040C */  jal        sceVu0CopyVector
/* A223C 001A213C 00000000 */   nop
/* A2240 001A2140 5401A0AF */  sw         $0, 0x154($sp)
/* A2244 001A2144 6001A427 */  addiu      $4, $sp, 0x160
/* A2248 001A2148 282E6072 */  paddub     $5, $19, $0
/* A224C 001A214C 0C86040C */  jal        sceVu0CopyVector
/* A2250 001A2150 00000000 */   nop
/* A2254 001A2154 6401A0AF */  sw         $0, 0x164($sp)
/* A2258 001A2158 9000A1C7 */  lwc1       $f1, 0x90($sp)
/* A225C 001A215C 3001A1E7 */  swc1       $f1, 0x130($sp)
/* A2260 001A2160 3401A0AF */  sw         $0, 0x134($sp)
/* A2264 001A2164 A800A3C7 */  lwc1       $f3, 0xA8($sp)
/* A2268 001A2168 3801A3E7 */  swc1       $f3, 0x138($sp)
/* A226C 001A216C 000060C6 */  lwc1       $f0, 0x0($19)
/* A2270 001A2170 4001A0E7 */  swc1       $f0, 0x140($sp)
/* A2274 001A2174 4401A0AF */  sw         $0, 0x144($sp)
/* A2278 001A2178 0000A4C6 */  lwc1       $f4, 0x0($21)
/* A227C 001A217C 4801A4E7 */  swc1       $f4, 0x148($sp)
/* A2280 001A2180 281E0070 */  paddub     $3, $0, $0
/* A2284 001A2184 28360070 */  paddub     $6, $0, $0
/* A2288 001A2188 C000A2C7 */  lwc1       $f2, 0xC0($sp)
/* A228C 001A218C 34100046 */  c.lt.s     $f2, $f0
/* A2290 001A2190 00000000 */  nop
/* A2294 001A2194 02000045 */  bc1f       .L001A21A0
/* A2298 001A2198 00000000 */   nop
/* A229C 001A219C FFFF0324 */  addiu      $3, $0, -0x1
.L001A21A0:
/* A22A0 001A21A0 36100146 */  c.le.s     $f2, $f1
/* A22A4 001A21A4 00000000 */  nop
/* A22A8 001A21A8 02000145 */  bc1t       .L001A21B4
/* A22AC 001A21AC 00000000 */   nop
/* A22B0 001A21B0 01000324 */  addiu      $3, $0, 0x1
.L001A21B4:
/* A22B4 001A21B4 C800A1C7 */  lwc1       $f1, 0xC8($sp)
/* A22B8 001A21B8 34080346 */  c.lt.s     $f1, $f3
/* A22BC 001A21BC 00000000 */  nop
/* A22C0 001A21C0 02000045 */  bc1f       .L001A21CC
/* A22C4 001A21C4 00000000 */   nop
/* A22C8 001A21C8 FFFF0624 */  addiu      $6, $0, -0x1
.L001A21CC:
/* A22CC 001A21CC 36080446 */  c.le.s     $f1, $f4
/* A22D0 001A21D0 00000000 */  nop
/* A22D4 001A21D4 02000145 */  bc1t       .L001A21E0
/* A22D8 001A21D8 00000000 */   nop
/* A22DC 001A21DC 01000624 */  addiu      $6, $0, 0x1
.L001A21E0:
/* A22E0 001A21E0 0A006104 */  bgez       $3, .L001A220C
/* A22E4 001A21E4 00000000 */   nop
/* A22E8 001A21E8 0800C104 */  bgez       $6, .L001A220C
/* A22EC 001A21EC 00000000 */   nop
/* A22F0 001A21F0 C000A427 */  addiu      $4, $sp, 0xC0
/* A22F4 001A21F4 6001A527 */  addiu      $5, $sp, 0x160
/* A22F8 001A21F8 648D040C */  jal        DistVector__FPfPf
/* A22FC 001A21FC 00000000 */   nop
/* A2300 001A2200 0000C0E6 */  swc1       $f0, 0x0($22)
/* A2304 001A2204 6F000010 */  b          .L001A23C4
/* A2308 001A2208 00000000 */   nop
.L001A220C:
/* A230C 001A220C 11006014 */  bnez       $3, .L001A2254
/* A2310 001A2210 00000000 */   nop
/* A2314 001A2214 0F00C104 */  bgez       $6, .L001A2254
/* A2318 001A2218 00000000 */   nop
/* A231C 001A221C 6801A0C7 */  lwc1       $f0, 0x168($sp)
/* A2320 001A2220 41080046 */  sub.s      $f1, $f1, $f0
/* A2324 001A2224 00008044 */  mtc1       $0, $f0
/* A2328 001A2228 00000000 */  nop
/* A232C 001A222C 34080046 */  c.lt.s     $f1, $f0
/* A2330 001A2230 00000000 */  nop
/* A2334 001A2234 04000045 */  bc1f       .L001A2248
/* A2338 001A2238 00000000 */   nop
/* A233C 001A223C 47080046 */  neg.s      $f1, $f1
/* A2340 001A2240 01000010 */  b          .L001A2248
/* A2344 001A2244 00000000 */   nop
.L001A2248:
/* A2348 001A2248 0000C1E6 */  swc1       $f1, 0x0($22)
/* A234C 001A224C 5D000010 */  b          .L001A23C4
/* A2350 001A2250 00000000 */   nop
.L001A2254:
/* A2354 001A2254 0A006018 */  blez       $3, .L001A2280
/* A2358 001A2258 00000000 */   nop
/* A235C 001A225C 0800C104 */  bgez       $6, .L001A2280
/* A2360 001A2260 00000000 */   nop
/* A2364 001A2264 C000A427 */  addiu      $4, $sp, 0xC0
/* A2368 001A2268 3001A527 */  addiu      $5, $sp, 0x130
/* A236C 001A226C 648D040C */  jal        DistVector__FPfPf
/* A2370 001A2270 00000000 */   nop
/* A2374 001A2274 0000C0E6 */  swc1       $f0, 0x0($22)
/* A2378 001A2278 52000010 */  b          .L001A23C4
/* A237C 001A227C 00000000 */   nop
.L001A2280:
/* A2380 001A2280 11006104 */  bgez       $3, .L001A22C8
/* A2384 001A2284 00000000 */   nop
/* A2388 001A2288 0F00C014 */  bnez       $6, .L001A22C8
/* A238C 001A228C 00000000 */   nop
/* A2390 001A2290 6001A0C7 */  lwc1       $f0, 0x160($sp)
/* A2394 001A2294 41100046 */  sub.s      $f1, $f2, $f0
/* A2398 001A2298 00008044 */  mtc1       $0, $f0
/* A239C 001A229C 00000000 */  nop
/* A23A0 001A22A0 34080046 */  c.lt.s     $f1, $f0
/* A23A4 001A22A4 00000000 */  nop
/* A23A8 001A22A8 04000045 */  bc1f       .L001A22BC
/* A23AC 001A22AC 00000000 */   nop
/* A23B0 001A22B0 47080046 */  neg.s      $f1, $f1
/* A23B4 001A22B4 01000010 */  b          .L001A22BC
/* A23B8 001A22B8 00000000 */   nop
.L001A22BC:
/* A23BC 001A22BC 0000C1E6 */  swc1       $f1, 0x0($22)
/* A23C0 001A22C0 40000010 */  b          .L001A23C4
/* A23C4 001A22C4 00000000 */   nop
.L001A22C8:
/* A23C8 001A22C8 06006014 */  bnez       $3, .L001A22E4
/* A23CC 001A22CC 00000000 */   nop
/* A23D0 001A22D0 0400C014 */  bnez       $6, .L001A22E4
/* A23D4 001A22D4 00000000 */   nop
/* A23D8 001A22D8 0000C0AE */  sw         $0, 0x0($22)
/* A23DC 001A22DC 39000010 */  b          .L001A23C4
/* A23E0 001A22E0 00000000 */   nop
.L001A22E4:
/* A23E4 001A22E4 11006018 */  blez       $3, .L001A232C
/* A23E8 001A22E8 00000000 */   nop
/* A23EC 001A22EC 0F00C014 */  bnez       $6, .L001A232C
/* A23F0 001A22F0 00000000 */   nop
/* A23F4 001A22F4 5001A0C7 */  lwc1       $f0, 0x150($sp)
/* A23F8 001A22F8 41100046 */  sub.s      $f1, $f2, $f0
/* A23FC 001A22FC 00008044 */  mtc1       $0, $f0
/* A2400 001A2300 00000000 */  nop
/* A2404 001A2304 34080046 */  c.lt.s     $f1, $f0
/* A2408 001A2308 00000000 */  nop
/* A240C 001A230C 04000045 */  bc1f       .L001A2320
/* A2410 001A2310 00000000 */   nop
/* A2414 001A2314 47080046 */  neg.s      $f1, $f1
/* A2418 001A2318 01000010 */  b          .L001A2320
/* A241C 001A231C 00000000 */   nop
.L001A2320:
/* A2420 001A2320 0000C1E6 */  swc1       $f1, 0x0($22)
/* A2424 001A2324 27000010 */  b          .L001A23C4
/* A2428 001A2328 00000000 */   nop
.L001A232C:
/* A242C 001A232C 0A006104 */  bgez       $3, .L001A2358
/* A2430 001A2330 00000000 */   nop
/* A2434 001A2334 0800C018 */  blez       $6, .L001A2358
/* A2438 001A2338 00000000 */   nop
/* A243C 001A233C C000A427 */  addiu      $4, $sp, 0xC0
/* A2440 001A2340 4001A527 */  addiu      $5, $sp, 0x140
/* A2444 001A2344 648D040C */  jal        DistVector__FPfPf
/* A2448 001A2348 00000000 */   nop
/* A244C 001A234C 0000C0E6 */  swc1       $f0, 0x0($22)
/* A2450 001A2350 1C000010 */  b          .L001A23C4
/* A2454 001A2354 00000000 */   nop
.L001A2358:
/* A2458 001A2358 11006014 */  bnez       $3, .L001A23A0
/* A245C 001A235C 00000000 */   nop
/* A2460 001A2360 0F00C018 */  blez       $6, .L001A23A0
/* A2464 001A2364 00000000 */   nop
/* A2468 001A2368 5801A0C7 */  lwc1       $f0, 0x158($sp)
/* A246C 001A236C 41080046 */  sub.s      $f1, $f1, $f0
/* A2470 001A2370 00008044 */  mtc1       $0, $f0
/* A2474 001A2374 00000000 */  nop
/* A2478 001A2378 34080046 */  c.lt.s     $f1, $f0
/* A247C 001A237C 00000000 */  nop
/* A2480 001A2380 04000045 */  bc1f       .L001A2394
/* A2484 001A2384 00000000 */   nop
/* A2488 001A2388 47080046 */  neg.s      $f1, $f1
/* A248C 001A238C 01000010 */  b          .L001A2394
/* A2490 001A2390 00000000 */   nop
.L001A2394:
/* A2494 001A2394 0000C1E6 */  swc1       $f1, 0x0($22)
/* A2498 001A2398 0A000010 */  b          .L001A23C4
/* A249C 001A239C 00000000 */   nop
.L001A23A0:
/* A24A0 001A23A0 08006018 */  blez       $3, .L001A23C4
/* A24A4 001A23A4 00000000 */   nop
/* A24A8 001A23A8 0600C018 */  blez       $6, .L001A23C4
/* A24AC 001A23AC 00000000 */   nop
/* A24B0 001A23B0 C000A427 */  addiu      $4, $sp, 0xC0
/* A24B4 001A23B4 5001A527 */  addiu      $5, $sp, 0x150
/* A24B8 001A23B8 648D040C */  jal        DistVector__FPfPf
/* A24BC 001A23BC 00000000 */   nop
/* A24C0 001A23C0 0000C0E6 */  swc1       $f0, 0x0($22)
.L001A23C4:
/* A24C4 001A23C4 00008044 */  mtc1       $0, $f0
/* A24C8 001A23C8 00000000 */  nop
/* A24CC 001A23CC 36A80046 */  c.le.s     $f21, $f0
/* A24D0 001A23D0 00000000 */  nop
/* A24D4 001A23D4 07000145 */  bc1t       .L001A23F4
/* A24D8 001A23D8 00000000 */   nop
/* A24DC 001A23DC 0000C0C6 */  lwc1       $f0, 0x0($22)
/* A24E0 001A23E0 36001546 */  c.le.s     $f0, $f21
/* A24E4 001A23E4 00000000 */  nop
/* A24E8 001A23E8 02000145 */  bc1t       .L001A23F4
/* A24EC 001A23EC 00000000 */   nop
/* A24F0 001A23F0 000080AE */  sw         $0, 0x0($20)
.L001A23F4:
/* A24F4 001A23F4 01003126 */  addiu      $17, $17, 0x1
.L001A23F8:
/* A24F8 001A23F8 0400232A */  slti       $3, $17, 0x4
/* A24FC 001A23FC D9FE6014 */  bnez       $3, .L001A1F64
/* A2500 001A2400 00000000 */   nop
.L001A2404:
/* A2504 001A2404 00008044 */  mtc1       $0, $f0
/* A2508 001A2408 00000000 */  nop
/* A250C 001A240C 34A80046 */  c.lt.s     $f21, $f0
/* A2510 001A2410 00000000 */  nop
/* A2514 001A2414 07000045 */  bc1f       .L001A2434
/* A2518 001A2418 00000000 */   nop
/* A251C 001A241C 80BF033C */  lui        $3, (0xBF800000 >> 16)
/* A2520 001A2420 0100013C */  lui        $at, (0x15F2C >> 16)
/* A2524 001A2424 21080102 */  addu       $at, $16, $at
/* A2528 001A2428 2C5F23AC */  sw         $3, (0x15F2C & 0xFFFF)($at)
/* A252C 001A242C 99000010 */  b          .L001A2694
/* A2530 001A2430 00000000 */   nop
.L001A2434:
/* A2534 001A2434 FFFF1124 */  addiu      $17, $0, -0x1
/* A2538 001A2438 283E2072 */  paddub     $7, $17, $0
/* A253C 001A243C 28960070 */  paddub     $18, $0, $0
/* A2540 001A2440 25000010 */  b          .L001A24D8
/* A2544 001A2444 00000000 */   nop
.L001A2448:
/* A2548 001A2448 80401200 */  sll        $8, $18, 2
/* A254C 001A244C 21301001 */  addu       $6, $8, $16
/* A2550 001A2450 0400C38C */  lw         $3, 0x4($6)
/* A2554 001A2454 23006010 */  beqz       $3, .L001A24E4
/* A2558 001A2458 00000000 */   nop
/* A255C 001A245C 1400C38C */  lw         $3, 0x14($6)
/* A2560 001A2460 1C006010 */  beqz       $3, .L001A24D4
/* A2564 001A2464 00000000 */   nop
/* A2568 001A2468 21181D01 */  addu       $3, $8, $sp
/* A256C 001A246C F0006CC4 */  lwc1       $f12, 0xF0($3)
/* A2570 001A2470 00008044 */  mtc1       $0, $f0
/* A2574 001A2474 00000000 */  nop
/* A2578 001A2478 34600046 */  c.lt.s     $f12, $f0
/* A257C 001A247C 00000000 */  nop
/* A2580 001A2480 14000145 */  bc1t       .L001A24D4
/* A2584 001A2484 00000000 */   nop
/* A2588 001A2488 07002106 */  bgez       $17, .L001A24A8
/* A258C 001A248C 00000000 */   nop
/* A2590 001A2490 288E4072 */  paddub     $17, $18, $0
/* A2594 001A2494 2C44040C */  jal        fptosi
/* A2598 001A2498 00000000 */   nop
/* A259C 001A249C 283E4070 */  paddub     $7, $2, $0
/* A25A0 001A24A0 0C000010 */  b          .L001A24D4
/* A25A4 001A24A4 00000000 */   nop
.L001A24A8:
/* A25A8 001A24A8 00008744 */  mtc1       $7, $f0
/* A25AC 001A24AC 00000000 */  nop
/* A25B0 001A24B0 20008046 */  cvt.s.w    $f0, $f0
/* A25B4 001A24B4 36000C46 */  c.le.s     $f0, $f12
/* A25B8 001A24B8 00000000 */  nop
/* A25BC 001A24BC 05000145 */  bc1t       .L001A24D4
/* A25C0 001A24C0 00000000 */   nop
/* A25C4 001A24C4 288E4072 */  paddub     $17, $18, $0
/* A25C8 001A24C8 2C44040C */  jal        fptosi
/* A25CC 001A24CC 00000000 */   nop
/* A25D0 001A24D0 283E4070 */  paddub     $7, $2, $0
.L001A24D4:
/* A25D4 001A24D4 01005226 */  addiu      $18, $18, 0x1
.L001A24D8:
/* A25D8 001A24D8 0400432A */  slti       $3, $18, 0x4
/* A25DC 001A24DC DAFF6014 */  bnez       $3, .L001A2448
/* A25E0 001A24E0 00000000 */   nop
.L001A24E4:
/* A25E4 001A24E4 0000058E */  lw         $5, 0x0($16)
/* A25E8 001A24E8 02000324 */  addiu      $3, $0, 0x2
/* A25EC 001A24EC 4400A310 */  beq        $5, $3, .L001A2600
/* A25F0 001A24F0 00000000 */   nop
/* A25F4 001A24F4 01000424 */  addiu      $4, $0, 0x1
/* A25F8 001A24F8 0300A410 */  beq        $5, $4, .L001A2508
/* A25FC 001A24FC 00000000 */   nop
/* A2600 001A2500 64000010 */  b          .L001A2694
/* A2604 001A2504 00000000 */   nop
.L001A2508:
/* A2608 001A2508 F000A1C7 */  lwc1       $f1, 0xF0($sp)
/* A260C 001A250C F800A0C7 */  lwc1       $f0, 0xF8($sp)
/* A2610 001A2510 36080046 */  c.le.s     $f1, $f0
/* A2614 001A2514 00000000 */  nop
/* A2618 001A2518 08000145 */  bc1t       .L001A253C
/* A261C 001A251C 00000000 */   nop
/* A2620 001A2520 1C00038E */  lw         $3, 0x1C($16)
/* A2624 001A2524 0A006010 */  beqz       $3, .L001A2550
/* A2628 001A2528 00000000 */   nop
/* A262C 001A252C 140000AE */  sw         $0, 0x14($16)
/* A2630 001A2530 1C0004AE */  sw         $4, 0x1C($16)
/* A2634 001A2534 06000010 */  b          .L001A2550
/* A2638 001A2538 00000000 */   nop
.L001A253C:
/* A263C 001A253C 1400038E */  lw         $3, 0x14($16)
/* A2640 001A2540 03006010 */  beqz       $3, .L001A2550
/* A2644 001A2544 00000000 */   nop
/* A2648 001A2548 140004AE */  sw         $4, 0x14($16)
/* A264C 001A254C 1C0000AE */  sw         $0, 0x1C($16)
.L001A2550:
/* A2650 001A2550 00008044 */  mtc1       $0, $f0
/* A2654 001A2554 00000000 */  nop
/* A2658 001A2558 36A80046 */  c.le.s     $f21, $f0
/* A265C 001A255C 00000000 */  nop
/* A2660 001A2560 21000145 */  bc1t       .L001A25E8
/* A2664 001A2564 00000000 */   nop
/* A2668 001A2568 0100013C */  lui        $at, (0x15F2C >> 16)
/* A266C 001A256C 21080102 */  addu       $at, $16, $at
/* A2670 001A2570 2C5F21C4 */  lwc1       $f1, (0x15F2C & 0xFFFF)($at)
/* A2674 001A2574 34080046 */  c.lt.s     $f1, $f0
/* A2678 001A2578 00000000 */  nop
/* A267C 001A257C 08000145 */  bc1t       .L001A25A0
/* A2680 001A2580 00000000 */   nop
/* A2684 001A2584 9644033C */  lui        $3, (0x44960000 >> 16)
/* A2688 001A2588 00008344 */  mtc1       $3, $f0
/* A268C 001A258C 00000000 */  nop
/* A2690 001A2590 34080046 */  c.lt.s     $f1, $f0
/* A2694 001A2594 00000000 */  nop
/* A2698 001A2598 3E000145 */  bc1t       .L001A2694
/* A269C 001A259C 00000000 */   nop
.L001A25A0:
/* A26A0 001A25A0 B000A0C7 */  lwc1       $f0, 0xB0($sp)
/* A26A4 001A25A4 0100013C */  lui        $at, (0x15F20 >> 16)
/* A26A8 001A25A8 21080102 */  addu       $at, $16, $at
/* A26AC 001A25AC 205F20E4 */  swc1       $f0, (0x15F20 & 0xFFFF)($at)
/* A26B0 001A25B0 B400A0C7 */  lwc1       $f0, 0xB4($sp)
/* A26B4 001A25B4 0100013C */  lui        $at, (0x15F24 >> 16)
/* A26B8 001A25B8 21080102 */  addu       $at, $16, $at
/* A26BC 001A25BC 245F20E4 */  swc1       $f0, (0x15F24 & 0xFFFF)($at)
/* A26C0 001A25C0 B800A0C7 */  lwc1       $f0, 0xB8($sp)
/* A26C4 001A25C4 0100013C */  lui        $at, (0x15F28 >> 16)
/* A26C8 001A25C8 21080102 */  addu       $at, $16, $at
/* A26CC 001A25CC 285F20E4 */  swc1       $f0, (0x15F28 & 0xFFFF)($at)
/* A26D0 001A25D0 9644033C */  lui        $3, (0x44960000 >> 16)
/* A26D4 001A25D4 0100013C */  lui        $at, (0x15F2C >> 16)
/* A26D8 001A25D8 21080102 */  addu       $at, $16, $at
/* A26DC 001A25DC 2C5F23AC */  sw         $3, (0x15F2C & 0xFFFF)($at)
/* A26E0 001A25E0 2C000010 */  b          .L001A2694
/* A26E4 001A25E4 00000000 */   nop
.L001A25E8:
/* A26E8 001A25E8 80BF033C */  lui        $3, (0xBF800000 >> 16)
/* A26EC 001A25EC 0100013C */  lui        $at, (0x15F2C >> 16)
/* A26F0 001A25F0 21080102 */  addu       $at, $16, $at
/* A26F4 001A25F4 2C5F23AC */  sw         $3, (0x15F2C & 0xFFFF)($at)
/* A26F8 001A25F8 26000010 */  b          .L001A2694
/* A26FC 001A25FC 00000000 */   nop
.L001A2600:
/* A2700 001A2600 282E0070 */  paddub     $5, $0, $0
/* A2704 001A2604 20000010 */  b          .L001A2688
/* A2708 001A2608 00000000 */   nop
.L001A260C:
/* A270C 001A260C 80300500 */  sll        $6, $5, 2
/* A2710 001A2610 2120D000 */  addu       $4, $6, $16
/* A2714 001A2614 0400838C */  lw         $3, 0x4($4)
/* A2718 001A2618 1E006010 */  beqz       $3, .L001A2694
/* A271C 001A261C 00000000 */   nop
/* A2720 001A2620 0500B114 */  bne        $5, $17, .L001A2638
/* A2724 001A2624 00000000 */   nop
/* A2728 001A2628 01000324 */  addiu      $3, $0, 0x1
/* A272C 001A262C 140083AC */  sw         $3, 0x14($4)
/* A2730 001A2630 02000010 */  b          .L001A263C
/* A2734 001A2634 00000000 */   nop
.L001A2638:
/* A2738 001A2638 140080AC */  sw         $0, 0x14($4)
.L001A263C:
/* A273C 001A263C 2118DD00 */  addu       $3, $6, $sp
/* A2740 001A2640 F00061C4 */  lwc1       $f1, 0xF0($3)
/* A2744 001A2644 00008044 */  mtc1       $0, $f0
/* A2748 001A2648 00000000 */  nop
/* A274C 001A264C 36080046 */  c.le.s     $f1, $f0
/* A2750 001A2650 00000000 */  nop
/* A2754 001A2654 0B000145 */  bc1t       .L001A2684
/* A2758 001A2658 00000000 */   nop
/* A275C 001A265C 1644033C */  lui        $3, (0x44160000 >> 16)
/* A2760 001A2660 00008344 */  mtc1       $3, $f0
/* A2764 001A2664 00000000 */  nop
/* A2768 001A2668 34080046 */  c.lt.s     $f1, $f0
/* A276C 001A266C 00000000 */  nop
/* A2770 001A2670 04000045 */  bc1f       .L001A2684
/* A2774 001A2674 00000000 */   nop
/* A2778 001A2678 01000424 */  addiu      $4, $0, 0x1
/* A277C 001A267C 2118D000 */  addu       $3, $6, $16
/* A2780 001A2680 140064AC */  sw         $4, 0x14($3)
.L001A2684:
/* A2784 001A2684 0100A524 */  addiu      $5, $5, 0x1
.L001A2688:
/* A2788 001A2688 0400A328 */  slti       $3, $5, 0x4
/* A278C 001A268C DFFF6014 */  bnez       $3, .L001A260C
/* A2790 001A2690 00000000 */   nop
.L001A2694:
/* A2794 001A2694 8000BF7B */  lq         $31, 0x80($sp)
/* A2798 001A2698 7000B67B */  lq         $22, 0x70($sp)
/* A279C 001A269C 6000B57B */  lq         $21, 0x60($sp)
/* A27A0 001A26A0 5000B47B */  lq         $20, 0x50($sp)
/* A27A4 001A26A4 4000B37B */  lq         $19, 0x40($sp)
/* A27A8 001A26A8 3000B27B */  lq         $18, 0x30($sp)
/* A27AC 001A26AC 2000B17B */  lq         $17, 0x20($sp)
/* A27B0 001A26B0 1000B07B */  lq         $16, 0x10($sp)
/* A27B4 001A26B4 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* A27B8 001A26B8 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* A27BC 001A26BC 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* A27C0 001A26C0 7001BD27 */  addiu      $sp, $sp, 0x170
/* A27C4 001A26C4 0800E003 */  jr         $31
/* A27C8 001A26C8 00000000 */   nop
/* A27CC 001A26CC 00000000 */  nop
