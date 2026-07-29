.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetWeaponColor__Fv
/* 00E100 01DB9E00 D0FFBD27 */  addiu       $29, $29, -0x30
/* 00E104 01DB9E04 2000BF7F */  sq          $31, 0x20($29)
/* 00E108 01DB9E08 1000B17F */  sq          $17, 0x10($29)
/* 00E10C 01DB9E0C 0000B07F */  sq          $16, 0x0($29)
/* 00E110 01DB9E10 049D838F */  lw          $3, -0x62FC($28)
/* 00E114 01DB9E14 16006680 */  lb          $6, 0x16($3)
/* 00E118 01DB9E18 05000324 */  addiu       $3, $0, 0x5
/* 00E11C 01DB9E1C 1D00C314 */  bne         $6, $3, .L01DB9E94_2F5494
/* 00E120 01DB9E20 00000000 */   nop
/* 00E124 01DB9E24 40000324 */  addiu       $3, $0, 0x40
/* 00E128 01DB9E28 E601013C */  lui         $1, %hi(CWeaponFx + 0x518)
/* 00E12C 01DB9E2C 589423A0 */  sb          $3, %lo(CWeaponFx + 0x518)($1)
/* 00E130 01DB9E30 E601013C */  lui         $1, %hi(CWeaponFx + 0x510)
/* 00E134 01DB9E34 509423A0 */  sb          $3, %lo(CWeaponFx + 0x510)($1)
/* 00E138 01DB9E38 E601013C */  lui         $1, %hi(CWeaponFx + 0x519)
/* 00E13C 01DB9E3C 599423A0 */  sb          $3, %lo(CWeaponFx + 0x519)($1)
/* 00E140 01DB9E40 E601013C */  lui         $1, %hi(CWeaponFx + 0x511)
/* 00E144 01DB9E44 519423A0 */  sb          $3, %lo(CWeaponFx + 0x511)($1)
/* 00E148 01DB9E48 E601013C */  lui         $1, %hi(CWeaponFx + 0x51A)
/* 00E14C 01DB9E4C 5A9423A0 */  sb          $3, %lo(CWeaponFx + 0x51A)($1)
/* 00E150 01DB9E50 E601013C */  lui         $1, %hi(CWeaponFx + 0x512)
/* 00E154 01DB9E54 529423A0 */  sb          $3, %lo(CWeaponFx + 0x512)($1)
/* 00E158 01DB9E58 06000324 */  addiu       $3, $0, 0x6
/* 00E15C 01DB9E5C E601013C */  lui         $1, %hi(CWeaponFx + 0x51C)
/* 00E160 01DB9E60 5C9423A0 */  sb          $3, %lo(CWeaponFx + 0x51C)($1)
/* 00E164 01DB9E64 E601013C */  lui         $1, %hi(CWeaponFx + 0x514)
/* 00E168 01DB9E68 549423A0 */  sb          $3, %lo(CWeaponFx + 0x514)($1)
/* 00E16C 01DB9E6C E601013C */  lui         $1, %hi(CWeaponFx + 0x51D)
/* 00E170 01DB9E70 5D9423A0 */  sb          $3, %lo(CWeaponFx + 0x51D)($1)
/* 00E174 01DB9E74 E601013C */  lui         $1, %hi(CWeaponFx + 0x515)
/* 00E178 01DB9E78 559423A0 */  sb          $3, %lo(CWeaponFx + 0x515)($1)
/* 00E17C 01DB9E7C E601013C */  lui         $1, %hi(CWeaponFx + 0x51E)
/* 00E180 01DB9E80 5E9423A0 */  sb          $3, %lo(CWeaponFx + 0x51E)($1)
/* 00E184 01DB9E84 E601013C */  lui         $1, %hi(CWeaponFx + 0x516)
/* 00E188 01DB9E88 569423A0 */  sb          $3, %lo(CWeaponFx + 0x516)($1)
/* 00E18C 01DB9E8C 6E000010 */  b           .L01DBA048_2F5648
/* 00E190 01DB9E90 00000000 */   nop
.L01DB9E94_2F5494:
/* 00E194 01DB9E94 6C00C004 */  bltz        $6, .L01DBA048_2F5648
/* 00E198 01DB9E98 00000000 */   nop
/* 00E19C 01DB9E9C 0600C128 */  slti        $1, $6, 0x6
/* 00E1A0 01DB9EA0 69002010 */  beqz        $1, .L01DBA048_2F5648
/* 00E1A4 01DB9EA4 00000000 */   nop
/* 00E1A8 01DB9EA8 40100600 */  sll         $2, $6, 1
/* 00E1AC 01DB9EAC 21184600 */  addu        $3, $2, $6
/* 00E1B0 01DB9EB0 DC01023C */  lui         $2, %hi(wep_rgb + 0x2)
/* 00E1B4 01DB9EB4 12284224 */  addiu       $2, $2, %lo(wep_rgb + 0x2)
/* 00E1B8 01DB9EB8 21104300 */  addu        $2, $2, $3
/* 00E1BC 01DB9EBC 00004290 */  lbu         $2, 0x0($2)
/* 00E1C0 01DB9EC0 83380200 */  sra         $7, $2, 2
/* 00E1C4 01DB9EC4 FF00F130 */  andi        $17, $7, 0xFF
/* 00E1C8 01DB9EC8 DC01023C */  lui         $2, %hi(wep_rgb + 0x1)
/* 00E1CC 01DB9ECC 11284224 */  addiu       $2, $2, %lo(wep_rgb + 0x1)
/* 00E1D0 01DB9ED0 21104300 */  addu        $2, $2, $3
/* 00E1D4 01DB9ED4 00004290 */  lbu         $2, 0x0($2)
/* 00E1D8 01DB9ED8 83300200 */  sra         $6, $2, 2
/* 00E1DC 01DB9EDC FF00D030 */  andi        $16, $6, 0xFF
/* 00E1E0 01DB9EE0 DC01023C */  lui         $2, %hi(wep_rgb)
/* 00E1E4 01DB9EE4 10284224 */  addiu       $2, $2, %lo(wep_rgb)
/* 00E1E8 01DB9EE8 21104300 */  addu        $2, $2, $3
/* 00E1EC 01DB9EEC 00004290 */  lbu         $2, 0x0($2)
/* 00E1F0 01DB9EF0 83180200 */  sra         $3, $2, 2
/* 00E1F4 01DB9EF4 FF006230 */  andi        $2, $3, 0xFF
/* 00E1F8 01DB9EF8 E601013C */  lui         $1, %hi(CWeaponFx + 0x518)
/* 00E1FC 01DB9EFC 589423A0 */  sb          $3, %lo(CWeaponFx + 0x518)($1)
/* 00E200 01DB9F00 E601013C */  lui         $1, %hi(CWeaponFx + 0x510)
/* 00E204 01DB9F04 509423A0 */  sb          $3, %lo(CWeaponFx + 0x510)($1)
/* 00E208 01DB9F08 E601013C */  lui         $1, %hi(CWeaponFx + 0x519)
/* 00E20C 01DB9F0C 599426A0 */  sb          $6, %lo(CWeaponFx + 0x519)($1)
/* 00E210 01DB9F10 E601013C */  lui         $1, %hi(CWeaponFx + 0x511)
/* 00E214 01DB9F14 519426A0 */  sb          $6, %lo(CWeaponFx + 0x511)($1)
/* 00E218 01DB9F18 E601013C */  lui         $1, %hi(CWeaponFx + 0x51A)
/* 00E21C 01DB9F1C 5A9427A0 */  sb          $7, %lo(CWeaponFx + 0x51A)($1)
/* 00E220 01DB9F20 E601013C */  lui         $1, %hi(CWeaponFx + 0x512)
/* 00E224 01DB9F24 529427A0 */  sb          $7, %lo(CWeaponFx + 0x512)($1)
/* 00E228 01DB9F28 06004004 */  bltz        $2, .L01DB9F44_2F5544
/* 00E22C 01DB9F2C 00000000 */   nop
/* 00E230 01DB9F30 00008244 */  mtc1        $2, $f0
/* 00E234 01DB9F34 00000000 */  nop
/* 00E238 01DB9F38 60008046 */  cvt.s.w     $f1, $f0
/* 00E23C 01DB9F3C 08000010 */  b           .L01DB9F60_2F5560
/* 00E240 01DB9F40 00000000 */   nop
.L01DB9F44_2F5544:
/* 00E244 01DB9F44 42180200 */  srl         $3, $2, 1
/* 00E248 01DB9F48 01004230 */  andi        $2, $2, 0x1
/* 00E24C 01DB9F4C 25186200 */  or          $3, $3, $2
/* 00E250 01DB9F50 00008344 */  mtc1        $3, $f0
/* 00E254 01DB9F54 00000000 */  nop
/* 00E258 01DB9F58 60008046 */  cvt.s.w     $f1, $f0
/* 00E25C 01DB9F5C 40080146 */  add.s       $f1, $f1, $f1
.L01DB9F60_2F5560:
/* 00E260 01DB9F60 2041023C */  lui         $2, (0x41200000 >> 16)
/* 00E264 01DB9F64 00008244 */  mtc1        $2, $f0
/* 00E268 01DB9F68 00000000 */  nop
/* 00E26C 01DB9F6C 030B0046 */  div.s       $f12, $f1, $f0
/* 00E270 01DB9F70 5044040C */  jal         fptoui
/* 00E274 01DB9F74 00000000 */   nop
/* 00E278 01DB9F78 E601013C */  lui         $1, %hi(CWeaponFx + 0x51C)
/* 00E27C 01DB9F7C 5C9422A0 */  sb          $2, %lo(CWeaponFx + 0x51C)($1)
/* 00E280 01DB9F80 E601013C */  lui         $1, %hi(CWeaponFx + 0x514)
/* 00E284 01DB9F84 549422A0 */  sb          $2, %lo(CWeaponFx + 0x514)($1)
/* 00E288 01DB9F88 06000006 */  bltz        $16, .L01DB9FA4_2F55A4
/* 00E28C 01DB9F8C 00000000 */   nop
/* 00E290 01DB9F90 00009044 */  mtc1        $16, $f0
/* 00E294 01DB9F94 00000000 */  nop
/* 00E298 01DB9F98 60008046 */  cvt.s.w     $f1, $f0
/* 00E29C 01DB9F9C 08000010 */  b           .L01DB9FC0_2F55C0
/* 00E2A0 01DB9FA0 00000000 */   nop
.L01DB9FA4_2F55A4:
/* 00E2A4 01DB9FA4 42181000 */  srl         $3, $16, 1
/* 00E2A8 01DB9FA8 01000232 */  andi        $2, $16, 0x1
/* 00E2AC 01DB9FAC 25186200 */  or          $3, $3, $2
/* 00E2B0 01DB9FB0 00008344 */  mtc1        $3, $f0
/* 00E2B4 01DB9FB4 00000000 */  nop
/* 00E2B8 01DB9FB8 60008046 */  cvt.s.w     $f1, $f0
/* 00E2BC 01DB9FBC 40080146 */  add.s       $f1, $f1, $f1
.L01DB9FC0_2F55C0:
/* 00E2C0 01DB9FC0 2041023C */  lui         $2, (0x41200000 >> 16)
/* 00E2C4 01DB9FC4 00008244 */  mtc1        $2, $f0
/* 00E2C8 01DB9FC8 00000000 */  nop
/* 00E2CC 01DB9FCC 030B0046 */  div.s       $f12, $f1, $f0
/* 00E2D0 01DB9FD0 5044040C */  jal         fptoui
/* 00E2D4 01DB9FD4 00000000 */   nop
/* 00E2D8 01DB9FD8 E601013C */  lui         $1, %hi(CWeaponFx + 0x51D)
/* 00E2DC 01DB9FDC 5D9422A0 */  sb          $2, %lo(CWeaponFx + 0x51D)($1)
/* 00E2E0 01DB9FE0 E601013C */  lui         $1, %hi(CWeaponFx + 0x515)
/* 00E2E4 01DB9FE4 559422A0 */  sb          $2, %lo(CWeaponFx + 0x515)($1)
/* 00E2E8 01DB9FE8 06002006 */  bltz        $17, .L01DBA004_2F5604
/* 00E2EC 01DB9FEC 00000000 */   nop
/* 00E2F0 01DB9FF0 00009144 */  mtc1        $17, $f0
/* 00E2F4 01DB9FF4 00000000 */  nop
/* 00E2F8 01DB9FF8 60008046 */  cvt.s.w     $f1, $f0
/* 00E2FC 01DB9FFC 08000010 */  b           .L01DBA020_2F5620
/* 00E300 01DBA000 00000000 */   nop
.L01DBA004_2F5604:
/* 00E304 01DBA004 42181100 */  srl         $3, $17, 1
/* 00E308 01DBA008 01002232 */  andi        $2, $17, 0x1
/* 00E30C 01DBA00C 25186200 */  or          $3, $3, $2
/* 00E310 01DBA010 00008344 */  mtc1        $3, $f0
/* 00E314 01DBA014 00000000 */  nop
/* 00E318 01DBA018 60008046 */  cvt.s.w     $f1, $f0
/* 00E31C 01DBA01C 40080146 */  add.s       $f1, $f1, $f1
.L01DBA020_2F5620:
/* 00E320 01DBA020 2041023C */  lui         $2, (0x41200000 >> 16)
/* 00E324 01DBA024 00008244 */  mtc1        $2, $f0
/* 00E328 01DBA028 00000000 */  nop
/* 00E32C 01DBA02C 030B0046 */  div.s       $f12, $f1, $f0
/* 00E330 01DBA030 5044040C */  jal         fptoui
/* 00E334 01DBA034 00000000 */   nop
/* 00E338 01DBA038 E601013C */  lui         $1, %hi(CWeaponFx + 0x51E)
/* 00E33C 01DBA03C 5E9422A0 */  sb          $2, %lo(CWeaponFx + 0x51E)($1)
/* 00E340 01DBA040 E601013C */  lui         $1, %hi(CWeaponFx + 0x516)
/* 00E344 01DBA044 569422A0 */  sb          $2, %lo(CWeaponFx + 0x516)($1)
.L01DBA048_2F5648:
/* 00E348 01DBA048 2000BF7B */  lq          $31, 0x20($29)
/* 00E34C 01DBA04C 1000B17B */  lq          $17, 0x10($29)
/* 00E350 01DBA050 0000B07B */  lq          $16, 0x0($29)
/* 00E354 01DBA054 3000BD27 */  addiu       $29, $29, 0x30
/* 00E358 01DBA058 0800E003 */  jr          $31
/* 00E35C 01DBA05C 00000000 */   nop
