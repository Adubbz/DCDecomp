.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __unpack_d
/* 00FBD8 0010FAD8 000082DC */  ld          $2, 0x0($4)
/* 00FBDC 0010FADC FFFF0324 */  addiu       $3, $0, -0x1
/* 00FBE0 0010FAE0 3A1B0300 */  dsrl        $3, $3, 12
/* 00FBE4 0010FAE4 FE270200 */  dsrl32      $4, $2, 31
/* 00FBE8 0010FAE8 24184300 */  and         $3, $2, $3
/* 00FBEC 0010FAEC 3E150200 */  dsrl32      $2, $2, 20
/* 00FBF0 0010FAF0 0400A4AC */  sw          $4, 0x4($5)
/* 00FBF4 0010FAF4 FF074430 */  andi        $4, $2, 0x7FF
/* 00FBF8 0010FAF8 05008014 */  bnez        $4, .L0010FB10
/* 00FBFC 0010FAFC FF070224 */   addiu      $2, $0, 0x7FF
/* 00FC00 0010FB00 02000224 */  addiu       $2, $0, 0x2
/* 00FC04 0010FB04 0800E003 */  jr          $31
/* 00FC08 0010FB08 0000A2AC */   sw         $2, 0x0($5)
/* 00FC0C 0010FB0C 00000000 */  nop
.L0010FB10:
/* 00FC10 0010FB10 0F008254 */  bnel        $4, $2, .L0010FB50
/* 00FC14 0010FB14 381A0300 */   dsll       $3, $3, 8
/* 00FC18 0010FB18 03006014 */  bnez        $3, .L0010FB28
/* 00FC1C 0010FB1C 04000224 */   addiu      $2, $0, 0x4
/* 00FC20 0010FB20 0800E003 */  jr          $31
/* 00FC24 0010FB24 0000A2AC */   sw         $2, 0x0($5)
.L0010FB28:
/* 00FC28 0010FB28 00800234 */  ori         $2, $0, 0x8000
/* 00FC2C 0010FB2C 3C110200 */  dsll32      $2, $2, 4
/* 00FC30 0010FB30 24106200 */  and         $2, $3, $2
/* 00FC34 0010FB34 03004010 */  beqz        $2, .L0010FB44
/* 00FC38 0010FB38 01000224 */   addiu      $2, $0, 0x1
/* 00FC3C 0010FB3C 02000010 */  b           .L0010FB48
/* 00FC40 0010FB40 0000A2AC */   sw         $2, 0x0($5)
.L0010FB44:
/* 00FC44 0010FB44 0000A0AC */  sw          $0, 0x0($5)
.L0010FB48:
/* 00FC48 0010FB48 0800E003 */  jr          $31
/* 00FC4C 0010FB4C 1000A3FC */   sd         $3, 0x10($5)
.L0010FB50:
/* 00FC50 0010FB50 00800234 */  ori         $2, $0, 0x8000
/* 00FC54 0010FB54 7C130200 */  dsll32      $2, $2, 13
/* 00FC58 0010FB58 25186200 */  or          $3, $3, $2
/* 00FC5C 0010FB5C 01FC8424 */  addiu       $4, $4, -0x3FF
/* 00FC60 0010FB60 03000224 */  addiu       $2, $0, 0x3
/* 00FC64 0010FB64 1000A3FC */  sd          $3, 0x10($5)
/* 00FC68 0010FB68 0800A4AC */  sw          $4, 0x8($5)
/* 00FC6C 0010FB6C 0800E003 */  jr          $31
/* 00FC70 0010FB70 0000A2AC */   sw         $2, 0x0($5)
/* 00FC74 0010FB74 00000000 */  nop
