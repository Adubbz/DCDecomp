.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel WeaponMenuCheckElemValue__FP11WEAPON_HAVEP11WEAPON_HAVE
/* 0FC150 001FC050 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0FC154 001FC054 1000BF7F */  sq          $31, 0x10($29)
/* 0FC158 001FC058 0000B07F */  sq          $16, 0x0($29)
/* 0FC15C 001FC05C 28868070 */  paddub      $16, $4, $0
/* 0FC160 001FC060 16008280 */  lb          $2, 0x16($4)
/* 0FC164 001FC064 2A084000 */  slt         $1, $2, $0
/* 0FC168 001FC068 0A002014 */  bnez        $1, .L001FC094
/* 0FC16C 001FC06C 00000000 */   nop
/* 0FC170 001FC070 05004128 */  slti        $1, $2, 0x5
/* 0FC174 001FC074 07002010 */  beqz        $1, .L001FC094
/* 0FC178 001FC078 00000000 */   nop
/* 0FC17C 001FC07C 21104500 */  addu        $2, $2, $5
/* 0FC180 001FC080 17004280 */  lb          $2, 0x17($2)
/* 0FC184 001FC084 0300401C */  bgtz        $2, .L001FC094
/* 0FC188 001FC088 00000000 */   nop
/* 0FC18C 001FC08C 05000224 */  addiu       $2, $0, 0x5
/* 0FC190 001FC090 160002A2 */  sb          $2, 0x16($16)
.L001FC094:
/* 0FC194 001FC094 16000382 */  lb          $3, 0x16($16)
/* 0FC198 001FC098 05000224 */  addiu       $2, $0, 0x5
/* 0FC19C 001FC09C 09006214 */  bne         $3, $2, .L001FC0C4
/* 0FC1A0 001FC0A0 00000000 */   nop
/* 0FC1A4 001FC0A4 00000486 */  lh          $4, 0x0($16)
/* 0FC1A8 001FC0A8 F4EF070C */  jal         EnableWeaponElemNone__Fi
/* 0FC1AC 001FC0AC 00000000 */   nop
/* 0FC1B0 001FC0B0 04004010 */  beqz        $2, .L001FC0C4
/* 0FC1B4 001FC0B4 00000000 */   nop
/* 0FC1B8 001FC0B8 28260072 */  paddub      $4, $16, $0
/* 0FC1BC 001FC0BC A03D080C */  jal         SetWeaponElementStatus__FP11WEAPON_HAVE
/* 0FC1C0 001FC0C0 00000000 */   nop
.L001FC0C4:
/* 0FC1C4 001FC0C4 16000582 */  lb          $5, 0x16($16)
/* 0FC1C8 001FC0C8 2A00023C */  lui         $2, %hi(LIT_2339__2)
/* 0FC1CC 001FC0CC 90D84424 */  addiu       $4, $2, %lo(LIT_2339__2)
/* 0FC1D0 001FC0D0 A611040C */  jal         printf
/* 0FC1D4 001FC0D4 00000000 */   nop
/* 0FC1D8 001FC0D8 16000282 */  lb          $2, 0x16($16)
/* 0FC1DC 001FC0DC 21105000 */  addu        $2, $2, $16
/* 0FC1E0 001FC0E0 17004580 */  lb          $5, 0x17($2)
/* 0FC1E4 001FC0E4 2A00023C */  lui         $2, %hi(LIT_2340__2)
/* 0FC1E8 001FC0E8 B0D84424 */  addiu       $4, $2, %lo(LIT_2340__2)
/* 0FC1EC 001FC0EC A611040C */  jal         printf
/* 0FC1F0 001FC0F0 00000000 */   nop
/* 0FC1F4 001FC0F4 1000BF7B */  lq          $31, 0x10($29)
/* 0FC1F8 001FC0F8 0000B07B */  lq          $16, 0x0($29)
/* 0FC1FC 001FC0FC 2000BD27 */  addiu       $29, $29, 0x20
/* 0FC200 001FC100 0800E003 */  jr          $31
/* 0FC204 001FC104 00000000 */   nop
/* 0FC208 001FC108 00000000 */  nop
/* 0FC20C 001FC10C 00000000 */  nop
