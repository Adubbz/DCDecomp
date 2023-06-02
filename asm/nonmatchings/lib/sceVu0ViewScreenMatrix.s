.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceVu0ViewScreenMatrix
/* 21E90 00121D90 60FFBD27 */  addiu      $sp, $sp, -0xA0
/* 21E94 00121D94 07880046 */  neg.s      $f0, $f17
/* 21E98 00121D98 6000B4E7 */  swc1       $f20, 0x60($sp)
/* 21E9C 00121D9C 07950046 */  neg.s      $f20, $f18
/* 21EA0 00121DA0 A000A1C7 */  lwc1       $f1, 0xA0($sp)
/* 21EA4 00121DA4 6800B5E7 */  swc1       $f21, 0x68($sp)
/* 21EA8 00121DA8 00001246 */  add.s      $f0, $f0, $f18
/* 21EAC 00121DAC 420D1346 */  mul.s      $f21, $f1, $f19
/* 21EB0 00121DB0 4000B0FF */  sd         $16, 0x40($sp)
/* 21EB4 00121DB4 02A51346 */  mul.s      $f20, $f20, $f19
/* 21EB8 00121DB8 2D808000 */  daddu      $16, $4, $0
/* 21EBC 00121DBC 428C0146 */  mul.s      $f17, $f17, $f1
/* 21EC0 00121DC0 9000BAE7 */  swc1       $f26, 0x90($sp)
/* 21EC4 00121DC4 C79C0046 */  neg.s      $f19, $f19
/* 21EC8 00121DC8 8800B9E7 */  swc1       $f25, 0x88($sp)
/* 21ECC 00121DCC 42AD0046 */  mul.s      $f21, $f21, $f0
/* 21ED0 00121DD0 8000B8E7 */  swc1       $f24, 0x80($sp)
/* 21ED4 00121DD4 00A51146 */  add.s      $f20, $f20, $f17
/* 21ED8 00121DD8 7800B7E7 */  swc1       $f23, 0x78($sp)
/* 21EDC 00121DDC C09C0146 */  add.s      $f19, $f19, $f1
/* 21EE0 00121DE0 7000B6E7 */  swc1       $f22, 0x70($sp)
/* 21EE4 00121DE4 86650046 */  mov.s      $f22, $f12
/* 21EE8 00121DE8 066E0046 */  mov.s      $f24, $f13
/* 21EEC 00121DEC C6750046 */  mov.s      $f23, $f14
/* 21EF0 00121DF0 867E0046 */  mov.s      $f26, $f15
/* 21EF4 00121DF4 00000000 */  nop
/* 21EF8 00121DF8 00000000 */  nop
/* 21EFC 00121DFC 43AD1346 */  div.s      $f21, $f21, $f19
/* 21F00 00121E00 00000000 */  nop
/* 21F04 00121E04 00000000 */  nop
/* 21F08 00121E08 03A51346 */  div.s      $f20, $f20, $f19
/* 21F0C 00121E0C 5000BFFF */  sd         $31, 0x50($sp)
/* 21F10 00121E10 2A86040C */  jal        sceVu0UnitMatrix
/* 21F14 00121E14 46860046 */   mov.s     $f25, $f16
/* 21F18 00121E18 803F013C */  lui        $at, (0x3F800000 >> 16)
/* 21F1C 00121E1C 00008144 */  mtc1       $at, $f0
/* 21F20 00121E20 2D20A003 */  daddu      $4, $sp, $0
/* 21F24 00121E24 140016E6 */  swc1       $f22, 0x14($16)
/* 21F28 00121E28 000016E6 */  swc1       $f22, 0x0($16)
/* 21F2C 00121E2C 280000AE */  sw         $0, 0x28($16)
/* 21F30 00121E30 3C0000AE */  sw         $0, 0x3C($16)
/* 21F34 00121E34 2C0000E6 */  swc1       $f0, 0x2C($16)
/* 21F38 00121E38 2A86040C */  jal        sceVu0UnitMatrix
/* 21F3C 00121E3C 380000E6 */   swc1      $f0, 0x38($16)
/* 21F40 00121E40 2D200002 */  daddu      $4, $16, $0
/* 21F44 00121E44 0000B8E7 */  swc1       $f24, 0x0($sp)
/* 21F48 00121E48 1400B7E7 */  swc1       $f23, 0x14($sp)
/* 21F4C 00121E4C 2D28A003 */  daddu      $5, $sp, $0
/* 21F50 00121E50 2800B5E7 */  swc1       $f21, 0x28($sp)
/* 21F54 00121E54 2D308000 */  daddu      $6, $4, $0
/* 21F58 00121E58 3000BAE7 */  swc1       $f26, 0x30($sp)
/* 21F5C 00121E5C 3400B9E7 */  swc1       $f25, 0x34($sp)
/* 21F60 00121E60 6E85040C */  jal        sceVu0MulMatrix
/* 21F64 00121E64 3800B4E7 */   swc1      $f20, 0x38($sp)
/* 21F68 00121E68 5000BFDF */  ld         $31, 0x50($sp)
/* 21F6C 00121E6C 4000B0DF */  ld         $16, 0x40($sp)
/* 21F70 00121E70 9000BAC7 */  lwc1       $f26, 0x90($sp)
/* 21F74 00121E74 8800B9C7 */  lwc1       $f25, 0x88($sp)
/* 21F78 00121E78 8000B8C7 */  lwc1       $f24, 0x80($sp)
/* 21F7C 00121E7C 7800B7C7 */  lwc1       $f23, 0x78($sp)
/* 21F80 00121E80 7000B6C7 */  lwc1       $f22, 0x70($sp)
/* 21F84 00121E84 6800B5C7 */  lwc1       $f21, 0x68($sp)
/* 21F88 00121E88 6000B4C7 */  lwc1       $f20, 0x60($sp)
/* 21F8C 00121E8C 0800E003 */  jr         $31
/* 21F90 00121E90 A000BD27 */   addiu     $sp, $sp, 0xA0
/* 21F94 00121E94 00000000 */  nop
