.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel PickUpPoly__9CEditAreaFP6CCPoly7CBoxVu0
/* 06FB70 0016FA70 60FFBD27 */  addiu       $29, $29, -0xA0
/* 06FB74 0016FA74 5000BF7F */  sq          $31, 0x50($29)
/* 06FB78 0016FA78 4000B47F */  sq          $20, 0x40($29)
/* 06FB7C 0016FA7C 3000B37F */  sq          $19, 0x30($29)
/* 06FB80 0016FA80 2000B27F */  sq          $18, 0x20($29)
/* 06FB84 0016FA84 1000B17F */  sq          $17, 0x10($29)
/* 06FB88 0016FA88 0000B07F */  sq          $16, 0x0($29)
/* 06FB8C 0016FA8C 288E8070 */  paddub      $17, $4, $0
/* 06FB90 0016FA90 2886A070 */  paddub      $16, $5, $0
/* 06FB94 0016FA94 6000A527 */  addiu       $5, $29, 0x60
/* 06FB98 0016FA98 0000C378 */  lq          $3, 0x0($6)
/* 06FB9C 0016FA9C 1000C278 */  lq          $2, 0x10($6)
/* 06FBA0 0016FAA0 0000A37C */  sq          $3, 0x0($5)
/* 06FBA4 0016FAA4 1000A27C */  sq          $2, 0x10($5)
/* 06FBA8 0016FAA8 8000A527 */  addiu       $5, $29, 0x80
/* 06FBAC 0016FAAC 7000ACC7 */  lwc1        $f12, 0x70($29)
/* 06FBB0 0016FAB0 7400ADC7 */  lwc1        $f13, 0x74($29)
/* 06FBB4 0016FAB4 7800AEC7 */  lwc1        $f14, 0x78($29)
/* 06FBB8 0016FAB8 20B6050C */  jal         GetPos__9CEditAreaFP11CVector3_i_fff
/* 06FBBC 0016FABC 00000000 */   nop
/* 06FBC0 0016FAC0 8000B28F */  lw          $18, 0x80($29)
/* 06FBC4 0016FAC4 8800B427 */  addiu       $20, $29, 0x88
/* 06FBC8 0016FAC8 0000938E */  lw          $19, 0x0($20)
/* 06FBCC 0016FACC 28262072 */  paddub      $4, $17, $0
/* 06FBD0 0016FAD0 8000A527 */  addiu       $5, $29, 0x80
/* 06FBD4 0016FAD4 6000ACC7 */  lwc1        $f12, 0x60($29)
/* 06FBD8 0016FAD8 6400ADC7 */  lwc1        $f13, 0x64($29)
/* 06FBDC 0016FADC 6800AEC7 */  lwc1        $f14, 0x68($29)
/* 06FBE0 0016FAE0 20B6050C */  jal         GetPos__9CEditAreaFP11CVector3_i_fff
/* 06FBE4 0016FAE4 00000000 */   nop
/* 06FBE8 0016FAE8 8000A38F */  lw          $3, 0x80($29)
/* 06FBEC 0016FAEC 0000848E */  lw          $4, 0x0($20)
/* 06FBF0 0016FAF0 FFFF4226 */  addiu       $2, $18, -0x1
/* 06FBF4 0016FAF4 9000A2AF */  sw          $2, 0x90($29)
/* 06FBF8 0016FAF8 FFFF6226 */  addiu       $2, $19, -0x1
/* 06FBFC 0016FAFC 9400A2AF */  sw          $2, 0x94($29)
/* 06FC00 0016FB00 23107200 */  subu        $2, $3, $18
/* 06FC04 0016FB04 02004224 */  addiu       $2, $2, 0x2
/* 06FC08 0016FB08 9800A2AF */  sw          $2, 0x98($29)
/* 06FC0C 0016FB0C 23109300 */  subu        $2, $4, $19
/* 06FC10 0016FB10 02004224 */  addiu       $2, $2, 0x2
/* 06FC14 0016FB14 9C00A2AF */  sw          $2, 0x9C($29)
/* 06FC18 0016FB18 28262072 */  paddub      $4, $17, $0
/* 06FC1C 0016FB1C 282E0072 */  paddub      $5, $16, $0
/* 06FC20 0016FB20 9000A627 */  addiu       $6, $29, 0x90
/* 06FC24 0016FB24 CCBD050C */  jal         PickUpPoly__9CEditAreaFP6CCPoly8CRect_i_
/* 06FC28 0016FB28 00000000 */   nop
/* 06FC2C 0016FB2C 5000BF7B */  lq          $31, 0x50($29)
/* 06FC30 0016FB30 4000B47B */  lq          $20, 0x40($29)
/* 06FC34 0016FB34 3000B37B */  lq          $19, 0x30($29)
/* 06FC38 0016FB38 2000B27B */  lq          $18, 0x20($29)
/* 06FC3C 0016FB3C 1000B17B */  lq          $17, 0x10($29)
/* 06FC40 0016FB40 0000B07B */  lq          $16, 0x0($29)
/* 06FC44 0016FB44 A000BD27 */  addiu       $29, $29, 0xA0
/* 06FC48 0016FB48 0800E003 */  jr          $31
/* 06FC4C 0016FB4C 00000000 */   nop
