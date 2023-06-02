.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WeaponMenuCheckEnableSetElem__FP11WEAPON_HAVEP11WEAPON_HAVEi
/* FC210 001FC110 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* FC214 001FC114 3000BF7F */  sq         $31, 0x30($sp)
/* FC218 001FC118 2000B27F */  sq         $18, 0x20($sp)
/* FC21C 001FC11C 1000B17F */  sq         $17, 0x10($sp)
/* FC220 001FC120 0000B07F */  sq         $16, 0x0($sp)
/* FC224 001FC124 28968070 */  paddub     $18, $4, $0
/* FC228 001FC128 288EA070 */  paddub     $17, $5, $0
/* FC22C 001FC12C 28860070 */  paddub     $16, $0, $0
/* FC230 001FC130 16008280 */  lb         $2, 0x16($4)
/* FC234 001FC134 13004614 */  bne        $2, $6, .L001FC184
/* FC238 001FC138 00000000 */   nop
/* FC23C 001FC13C 00004486 */  lh         $4, 0x0($18)
/* FC240 001FC140 F4EF070C */  jal        EnableWeaponElemNone__Fi
/* FC244 001FC144 00000000 */   nop
/* FC248 001FC148 0A004010 */  beqz       $2, .L001FC174
/* FC24C 001FC14C 00000000 */   nop
/* FC250 001FC150 0B000224 */  addiu      $2, $0, 0xB
/* FC254 001FC154 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FC258 001FC158 7CEA22A4 */  sh         $2, -0x1584($at)
/* FC25C 001FC15C 09000224 */  addiu      $2, $0, 0x9
/* FC260 001FC160 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FC264 001FC164 78EA22A0 */  sb         $2, -0x1588($at)
/* FC268 001FC168 01001024 */  addiu      $16, $0, 0x1
/* FC26C 001FC16C 12000010 */  b          .L001FC1B8
/* FC270 001FC170 00000000 */   nop
.L001FC174:
/* FC274 001FC174 05000224 */  addiu      $2, $0, 0x5
/* FC278 001FC178 160042A2 */  sb         $2, 0x16($18)
/* FC27C 001FC17C 0E000010 */  b          .L001FC1B8
/* FC280 001FC180 00000000 */   nop
.L001FC184:
/* FC284 001FC184 2110D100 */  addu       $2, $6, $17
/* FC288 001FC188 17004280 */  lb         $2, 0x17($2)
/* FC28C 001FC18C 04004018 */  blez       $2, .L001FC1A0
/* FC290 001FC190 00000000 */   nop
/* FC294 001FC194 160046A2 */  sb         $6, 0x16($18)
/* FC298 001FC198 07000010 */  b          .L001FC1B8
/* FC29C 001FC19C 00000000 */   nop
.L001FC1A0:
/* FC2A0 001FC1A0 0B000224 */  addiu      $2, $0, 0xB
/* FC2A4 001FC1A4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FC2A8 001FC1A8 7CEA22A4 */  sh         $2, -0x1584($at)
/* FC2AC 001FC1AC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FC2B0 001FC1B0 78EA20A0 */  sb         $0, -0x1588($at)
/* FC2B4 001FC1B4 01001024 */  addiu      $16, $0, 0x1
.L001FC1B8:
/* FC2B8 001FC1B8 10004012 */  beqz       $18, .L001FC1FC
/* FC2BC 001FC1BC 00000000 */   nop
/* FC2C0 001FC1C0 16004582 */  lb         $5, 0x16($18)
/* FC2C4 001FC1C4 2A00023C */  lui        $2, %hi(_2356)
/* FC2C8 001FC1C8 C8D84424 */  addiu      $4, $2, %lo(_2356)
/* FC2CC 001FC1CC A611040C */  jal        printf
/* FC2D0 001FC1D0 00000000 */   nop
/* FC2D4 001FC1D4 16004382 */  lb         $3, 0x16($18)
/* FC2D8 001FC1D8 05000224 */  addiu      $2, $0, 0x5
/* FC2DC 001FC1DC 07006210 */  beq        $3, $2, .L001FC1FC
/* FC2E0 001FC1E0 00000000 */   nop
/* FC2E4 001FC1E4 21107100 */  addu       $2, $3, $17
/* FC2E8 001FC1E8 17004580 */  lb         $5, 0x17($2)
/* FC2EC 001FC1EC 2A00023C */  lui        $2, %hi(_2357)
/* FC2F0 001FC1F0 E0D84424 */  addiu      $4, $2, %lo(_2357)
/* FC2F4 001FC1F4 A611040C */  jal        printf
/* FC2F8 001FC1F8 00000000 */   nop
.L001FC1FC:
/* FC2FC 001FC1FC 28160072 */  paddub     $2, $16, $0
/* FC300 001FC200 3000BF7B */  lq         $31, 0x30($sp)
/* FC304 001FC204 2000B27B */  lq         $18, 0x20($sp)
/* FC308 001FC208 1000B17B */  lq         $17, 0x10($sp)
/* FC30C 001FC20C 0000B07B */  lq         $16, 0x0($sp)
/* FC310 001FC210 4000BD27 */  addiu      $sp, $sp, 0x40
/* FC314 001FC214 0800E003 */  jr         $31
/* FC318 001FC218 00000000 */   nop
/* FC31C 001FC21C 00000000 */  nop
