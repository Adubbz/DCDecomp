.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MGMoveFrameBuffImage__FP9sceGsTex0iii
/* 2FA70 0012F970 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 2FA74 0012F974 3000BF7F */  sq         $31, 0x30($sp)
/* 2FA78 0012F978 2000B27F */  sq         $18, 0x20($sp)
/* 2FA7C 0012F97C 1000B17F */  sq         $17, 0x10($sp)
/* 2FA80 0012F980 0000B07F */  sq         $16, 0x0($sp)
/* 2FA84 0012F984 28968070 */  paddub     $18, $4, $0
/* 2FA88 0012F988 4000A427 */  addiu      $4, $sp, 0x40
/* 2FA8C 0012F98C 4CBC040C */  jal        MGGetFBuffTex__FP9sceGsTex0
/* 2FA90 0012F990 00000000 */   nop
/* 2FA94 0012F994 4800A427 */  addiu      $4, $sp, 0x48
/* 2FA98 0012F998 68BC040C */  jal        MGGetFBuffBackTex__FP9sceGsTex0
/* 2FA9C 0012F99C 00000000 */   nop
/* 2FAA0 0012F9A0 28860070 */  paddub     $16, $0, $0
/* 2FAA4 0012F9A4 28000010 */  b          .L0012FA48
/* 2FAA8 0012F9A8 00000000 */   nop
.L0012F9AC:
/* 2FAAC 0012F9AC 5000A0AF */  sw         $0, 0x50($sp)
/* 2FAB0 0012F9B0 5400B0AF */  sw         $16, 0x54($sp)
/* 2FAB4 0012F9B4 80020224 */  addiu      $2, $0, 0x280
/* 2FAB8 0012F9B8 5800A2AF */  sw         $2, 0x58($sp)
/* 2FABC 0012F9BC 01000224 */  addiu      $2, $0, 0x1
/* 2FAC0 0012F9C0 5C00A2AF */  sw         $2, 0x5C($sp)
/* 2FAC4 0012F9C4 D88B828F */  lw         $2, -0x7428($gp)
/* 2FAC8 0012F9C8 2B100200 */  sltu       $2, $0, $2
/* 2FACC 0012F9CC 01004238 */  xori       $2, $2, 0x1
/* 2FAD0 0012F9D0 FF004230 */  andi       $2, $2, 0xFF
/* 2FAD4 0012F9D4 C0100200 */  sll        $2, $2, 3
/* 2FAD8 0012F9D8 21105D00 */  addu       $2, $2, $sp
/* 2FADC 0012F9DC 40881000 */  sll        $17, $16, 1
/* 2FAE0 0012F9E0 40004424 */  addiu      $4, $2, 0x40
/* 2FAE4 0012F9E4 5000A527 */  addiu      $5, $sp, 0x50
/* 2FAE8 0012F9E8 28364072 */  paddub     $6, $18, $0
/* 2FAEC 0012F9EC 283E0070 */  paddub     $7, $0, $0
/* 2FAF0 0012F9F0 28462072 */  paddub     $8, $17, $0
/* 2FAF4 0012F9F4 284E0070 */  paddub     $9, $0, $0
/* 2FAF8 0012F9F8 84BC040C */  jal        MGMoveImage__FP9sceGsTex0RC8CRect_i_P9sceGsTex0iii
/* 2FAFC 0012F9FC 00000000 */   nop
/* 2FB00 0012FA00 6000A0AF */  sw         $0, 0x60($sp)
/* 2FB04 0012FA04 6400B0AF */  sw         $16, 0x64($sp)
/* 2FB08 0012FA08 80020224 */  addiu      $2, $0, 0x280
/* 2FB0C 0012FA0C 6800A2AF */  sw         $2, 0x68($sp)
/* 2FB10 0012FA10 01000224 */  addiu      $2, $0, 0x1
/* 2FB14 0012FA14 6C00A2AF */  sw         $2, 0x6C($sp)
/* 2FB18 0012FA18 D88B828F */  lw         $2, -0x7428($gp)
/* 2FB1C 0012FA1C C0100200 */  sll        $2, $2, 3
/* 2FB20 0012FA20 21105D00 */  addu       $2, $2, $sp
/* 2FB24 0012FA24 01002826 */  addiu      $8, $17, 0x1
/* 2FB28 0012FA28 40004424 */  addiu      $4, $2, 0x40
/* 2FB2C 0012FA2C 6000A527 */  addiu      $5, $sp, 0x60
/* 2FB30 0012FA30 28364072 */  paddub     $6, $18, $0
/* 2FB34 0012FA34 283E0070 */  paddub     $7, $0, $0
/* 2FB38 0012FA38 284E0070 */  paddub     $9, $0, $0
/* 2FB3C 0012FA3C 84BC040C */  jal        MGMoveImage__FP9sceGsTex0RC8CRect_i_P9sceGsTex0iii
/* 2FB40 0012FA40 00000000 */   nop
/* 2FB44 0012FA44 01001026 */  addiu      $16, $16, 0x1
.L0012FA48:
/* 2FB48 0012FA48 E000032A */  slti       $3, $16, 0xE0
/* 2FB4C 0012FA4C D7FF6014 */  bnez       $3, .L0012F9AC
/* 2FB50 0012FA50 00000000 */   nop
/* 2FB54 0012FA54 3000BF7B */  lq         $31, 0x30($sp)
/* 2FB58 0012FA58 2000B27B */  lq         $18, 0x20($sp)
/* 2FB5C 0012FA5C 1000B17B */  lq         $17, 0x10($sp)
/* 2FB60 0012FA60 0000B07B */  lq         $16, 0x0($sp)
/* 2FB64 0012FA64 7000BD27 */  addiu      $sp, $sp, 0x70
/* 2FB68 0012FA68 0800E003 */  jr         $31
/* 2FB6C 0012FA6C 00000000 */   nop
