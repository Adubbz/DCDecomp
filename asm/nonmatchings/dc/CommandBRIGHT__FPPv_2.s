.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandBRIGHT__FPPv_2
/* A0190 001A0090 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* A0194 001A0094 0000BF7F */  sq         $31, 0x0($sp)
/* A0198 001A0098 2700033C */  lui        $3, %hi(_1641)
/* A019C 001A009C 30AE6324 */  addiu      $3, $3, %lo(_1641)
/* A01A0 001A00A0 3000A827 */  addiu      $8, $sp, 0x30
/* A01A4 001A00A4 00006378 */  lq         $3, 0x0($3)
/* A01A8 001A00A8 0000037D */  sq         $3, 0x0($8)
/* A01AC 001A00AC 0400838C */  lw         $3, 0x4($4)
/* A01B0 001A00B0 000060C4 */  lwc1       $f0, 0x0($3)
/* A01B4 001A00B4 1000A0E7 */  swc1       $f0, 0x10($sp)
/* A01B8 001A00B8 0800838C */  lw         $3, 0x8($4)
/* A01BC 001A00BC 000060C4 */  lwc1       $f0, 0x0($3)
/* A01C0 001A00C0 1400A0E7 */  swc1       $f0, 0x14($sp)
/* A01C4 001A00C4 0C00838C */  lw         $3, 0xC($4)
/* A01C8 001A00C8 000060C4 */  lwc1       $f0, 0x0($3)
/* A01CC 001A00CC 1800A0E7 */  swc1       $f0, 0x18($sp)
/* A01D0 001A00D0 803F033C */  lui        $3, (0x3F800000 >> 16)
/* A01D4 001A00D4 1C00A3AF */  sw         $3, 0x1C($sp)
/* A01D8 001A00D8 1000838C */  lw         $3, 0x10($4)
/* A01DC 001A00DC 000060C4 */  lwc1       $f0, 0x0($3)
/* A01E0 001A00E0 2000A0E7 */  swc1       $f0, 0x20($sp)
/* A01E4 001A00E4 1000838C */  lw         $3, 0x10($4)
/* A01E8 001A00E8 000060C4 */  lwc1       $f0, 0x0($3)
/* A01EC 001A00EC 2400A0E7 */  swc1       $f0, 0x24($sp)
/* A01F0 001A00F0 1000838C */  lw         $3, 0x10($4)
/* A01F4 001A00F4 000060C4 */  lwc1       $f0, 0x0($3)
/* A01F8 001A00F8 2800A0E7 */  swc1       $f0, 0x28($sp)
/* A01FC 001A00FC 0000858C */  lw         $5, 0x0($4)
/* A0200 001A0100 03000424 */  addiu      $4, $0, 0x3
/* A0204 001A0104 1000A627 */  addiu      $6, $sp, 0x10
/* A0208 001A0108 2000A727 */  addiu      $7, $sp, 0x20
/* A020C 001A010C D07F060C */  jal        SetEffect__F11EFFECT_TYPEPcPfPfPf
/* A0210 001A0110 00000000 */   nop
/* A0214 001A0114 0000BF7B */  lq         $31, 0x0($sp)
/* A0218 001A0118 4000BD27 */  addiu      $sp, $sp, 0x40
/* A021C 001A011C 0800E003 */  jr         $31
/* A0220 001A0120 00000000 */   nop
/* A0224 001A0124 00000000 */  nop
/* A0228 001A0128 00000000 */  nop
/* A022C 001A012C 00000000 */  nop
