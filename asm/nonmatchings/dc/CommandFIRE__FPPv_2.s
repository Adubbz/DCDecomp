.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandFIRE__FPPv_2
/* A0050 0019FF50 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* A0054 0019FF54 0000BF7F */  sq         $31, 0x0($sp)
/* A0058 0019FF58 2700033C */  lui        $3, %hi(_1637_2)
/* A005C 0019FF5C 10AE6324 */  addiu      $3, $3, %lo(_1637_2)
/* A0060 0019FF60 3000A827 */  addiu      $8, $sp, 0x30
/* A0064 0019FF64 00006378 */  lq         $3, 0x0($3)
/* A0068 0019FF68 0000037D */  sq         $3, 0x0($8)
/* A006C 0019FF6C 0400838C */  lw         $3, 0x4($4)
/* A0070 0019FF70 000060C4 */  lwc1       $f0, 0x0($3)
/* A0074 0019FF74 1000A0E7 */  swc1       $f0, 0x10($sp)
/* A0078 0019FF78 0800838C */  lw         $3, 0x8($4)
/* A007C 0019FF7C 000060C4 */  lwc1       $f0, 0x0($3)
/* A0080 0019FF80 1400A0E7 */  swc1       $f0, 0x14($sp)
/* A0084 0019FF84 0C00838C */  lw         $3, 0xC($4)
/* A0088 0019FF88 000060C4 */  lwc1       $f0, 0x0($3)
/* A008C 0019FF8C 1800A0E7 */  swc1       $f0, 0x18($sp)
/* A0090 0019FF90 803F033C */  lui        $3, (0x3F800000 >> 16)
/* A0094 0019FF94 1C00A3AF */  sw         $3, 0x1C($sp)
/* A0098 0019FF98 1000838C */  lw         $3, 0x10($4)
/* A009C 0019FF9C 000060C4 */  lwc1       $f0, 0x0($3)
/* A00A0 0019FFA0 2000A0E7 */  swc1       $f0, 0x20($sp)
/* A00A4 0019FFA4 1000838C */  lw         $3, 0x10($4)
/* A00A8 0019FFA8 000060C4 */  lwc1       $f0, 0x0($3)
/* A00AC 0019FFAC 2400A0E7 */  swc1       $f0, 0x24($sp)
/* A00B0 0019FFB0 1000838C */  lw         $3, 0x10($4)
/* A00B4 0019FFB4 000060C4 */  lwc1       $f0, 0x0($3)
/* A00B8 0019FFB8 2800A0E7 */  swc1       $f0, 0x28($sp)
/* A00BC 0019FFBC 0000858C */  lw         $5, 0x0($4)
/* A00C0 0019FFC0 01000424 */  addiu      $4, $0, 0x1
/* A00C4 0019FFC4 1000A627 */  addiu      $6, $sp, 0x10
/* A00C8 0019FFC8 2000A727 */  addiu      $7, $sp, 0x20
/* A00CC 0019FFCC D07F060C */  jal        SetEffect__F11EFFECT_TYPEPcPfPfPf
/* A00D0 0019FFD0 00000000 */   nop
/* A00D4 0019FFD4 0000BF7B */  lq         $31, 0x0($sp)
/* A00D8 0019FFD8 4000BD27 */  addiu      $sp, $sp, 0x40
/* A00DC 0019FFDC 0800E003 */  jr         $31
/* A00E0 0019FFE0 00000000 */   nop
/* A00E4 0019FFE4 00000000 */  nop
/* A00E8 0019FFE8 00000000 */  nop
/* A00EC 0019FFEC 00000000 */  nop
