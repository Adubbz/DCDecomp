.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandFIRE__FPPv__2
/* 0A0050 0019FF50 C0FFBD27 */  addiu       $29, $29, -0x40
/* 0A0054 0019FF54 0000BF7F */  sq          $31, 0x0($29)
/* 0A0058 0019FF58 2700033C */  lui         $3, %hi(LIT_1637__2)
/* 0A005C 0019FF5C 10AE6324 */  addiu       $3, $3, %lo(LIT_1637__2)
/* 0A0060 0019FF60 3000A827 */  addiu       $8, $29, 0x30
/* 0A0064 0019FF64 00006378 */  lq          $3, 0x0($3)
/* 0A0068 0019FF68 0000037D */  sq          $3, 0x0($8)
/* 0A006C 0019FF6C 0400838C */  lw          $3, 0x4($4)
/* 0A0070 0019FF70 000060C4 */  lwc1        $f0, 0x0($3)
/* 0A0074 0019FF74 1000A0E7 */  swc1        $f0, 0x10($29)
/* 0A0078 0019FF78 0800838C */  lw          $3, 0x8($4)
/* 0A007C 0019FF7C 000060C4 */  lwc1        $f0, 0x0($3)
/* 0A0080 0019FF80 1400A0E7 */  swc1        $f0, 0x14($29)
/* 0A0084 0019FF84 0C00838C */  lw          $3, 0xC($4)
/* 0A0088 0019FF88 000060C4 */  lwc1        $f0, 0x0($3)
/* 0A008C 0019FF8C 1800A0E7 */  swc1        $f0, 0x18($29)
/* 0A0090 0019FF90 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 0A0094 0019FF94 1C00A3AF */  sw          $3, 0x1C($29)
/* 0A0098 0019FF98 1000838C */  lw          $3, 0x10($4)
/* 0A009C 0019FF9C 000060C4 */  lwc1        $f0, 0x0($3)
/* 0A00A0 0019FFA0 2000A0E7 */  swc1        $f0, 0x20($29)
/* 0A00A4 0019FFA4 1000838C */  lw          $3, 0x10($4)
/* 0A00A8 0019FFA8 000060C4 */  lwc1        $f0, 0x0($3)
/* 0A00AC 0019FFAC 2400A0E7 */  swc1        $f0, 0x24($29)
/* 0A00B0 0019FFB0 1000838C */  lw          $3, 0x10($4)
/* 0A00B4 0019FFB4 000060C4 */  lwc1        $f0, 0x0($3)
/* 0A00B8 0019FFB8 2800A0E7 */  swc1        $f0, 0x28($29)
/* 0A00BC 0019FFBC 0000858C */  lw          $5, 0x0($4)
/* 0A00C0 0019FFC0 01000424 */  addiu       $4, $0, 0x1
/* 0A00C4 0019FFC4 1000A627 */  addiu       $6, $29, 0x10
/* 0A00C8 0019FFC8 2000A727 */  addiu       $7, $29, 0x20
/* 0A00CC 0019FFCC D07F060C */  jal         SetEffect__F11EFFECT_TYPEPcPfPfPf
/* 0A00D0 0019FFD0 00000000 */   nop
/* 0A00D4 0019FFD4 0000BF7B */  lq          $31, 0x0($29)
/* 0A00D8 0019FFD8 4000BD27 */  addiu       $29, $29, 0x40
/* 0A00DC 0019FFDC 0800E003 */  jr          $31
/* 0A00E0 0019FFE0 00000000 */   nop
/* 0A00E4 0019FFE4 00000000 */  nop
/* 0A00E8 0019FFE8 00000000 */  nop
/* 0A00EC 0019FFEC 00000000 */  nop
