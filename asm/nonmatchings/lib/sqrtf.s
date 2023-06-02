.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sqrtf
/* 1DF68 0011DE68 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 1DF6C 0011DE6C 6000B4E7 */  swc1       $f20, 0x60($sp)
/* 1DF70 0011DE70 06650046 */  mov.s      $f20, $f12
/* 1DF74 0011DE74 4000B1FF */  sd         $17, 0x40($sp)
/* 1DF78 0011DE78 3000B0FF */  sd         $16, 0x30($sp)
/* 1DF7C 0011DE7C 6800B5E7 */  swc1       $f21, 0x68($sp)
/* 1DF80 0011DE80 5000BFFF */  sd         $31, 0x50($sp)
/* 1DF84 0011DE84 2C6B040C */  jal        __ieee754_sqrtf
/* 1DF88 0011DE88 2A00113C */   lui       $17, (0x2A0000 >> 16)
/* 1DF8C 0011DE8C 308A308E */  lw         $16, -0x75D0($17)
/* 1DF90 0011DE90 FFFF0224 */  addiu      $2, $0, -0x1
/* 1DF94 0011DE94 31000212 */  beq        $16, $2, .L0011DF5C
/* 1DF98 0011DE98 46050046 */   mov.s     $f21, $f0
/* 1DF9C 0011DE9C A612040C */  jal        isnanf
/* 1DFA0 0011DEA0 06A30046 */   mov.s     $f12, $f20
/* 1DFA4 0011DEA4 2E004014 */  bnez       $2, .L0011DF60
/* 1DFA8 0011DEA8 06A80046 */   mov.s     $f0, $f21
/* 1DFAC 0011DEAC 00008044 */  mtc1       $0, $f0
/* 1DFB0 0011DEB0 34A00046 */  c.lt.s     $f20, $f0
/* 1DFB4 0011DEB4 00000000 */  nop
/* 1DFB8 0011DEB8 28000045 */  bc1f       .L0011DF5C
/* 1DFBC 0011DEBC 2A00023C */   lui       $2, %hi(D_00298AB8)
/* 1DFC0 0011DEC0 01000324 */  addiu      $3, $0, 0x1
/* 1DFC4 0011DEC4 B88A4224 */  addiu      $2, $2, %lo(D_00298AB8)
/* 1DFC8 0011DEC8 0000A3AF */  sw         $3, 0x0($sp)
/* 1DFCC 0011DECC 0400A2AF */  sw         $2, 0x4($sp)
/* 1DFD0 0011DED0 06A30046 */  mov.s      $f12, $f20
/* 1DFD4 0011DED4 9044040C */  jal        fptodp
/* 1DFD8 0011DED8 2000A0AF */   sw        $0, 0x20($sp)
/* 1DFDC 0011DEDC 0800A2FF */  sd         $2, 0x8($sp)
/* 1DFE0 0011DEE0 04000016 */  bnez       $16, .L0011DEF4
/* 1DFE4 0011DEE4 1000A2FF */   sd        $2, 0x10($sp)
/* 1DFE8 0011DEE8 2D100000 */  daddu      $2, $0, $0
/* 1DFEC 0011DEEC 04000010 */  b          .L0011DF00
/* 1DFF0 0011DEF0 1800A2FF */   sd        $2, 0x18($sp)
.L0011DEF4:
/* 1DFF4 0011DEF4 2A00023C */  lui        $2, (0x2A0000 >> 16)
/* 1DFF8 0011DEF8 C08A43DC */  ld         $3, -0x7540($2)
/* 1DFFC 0011DEFC 1800A3FF */  sd         $3, 0x18($sp)
.L0011DF00:
/* 1E000 0011DF00 308A238E */  lw         $3, -0x75D0($17)
/* 1E004 0011DF04 02000224 */  addiu      $2, $0, 0x2
/* 1E008 0011DF08 05006210 */  beq        $3, $2, .L0011DF20
/* 1E00C 0011DF0C 00000000 */   nop
/* 1E010 0011DF10 BA74040C */  jal        matherr
/* 1E014 0011DF14 2D20A003 */   daddu     $4, $sp, $0
/* 1E018 0011DF18 06004014 */  bnez       $2, .L0011DF34
/* 1E01C 0011DF1C 2000A28F */   lw        $2, 0x20($sp)
.L0011DF20:
/* 1E020 0011DF20 D805040C */  jal        __errno
/* 1E024 0011DF24 00000000 */   nop
/* 1E028 0011DF28 21000324 */  addiu      $3, $0, 0x21
/* 1E02C 0011DF2C 000043AC */  sw         $3, 0x0($2)
/* 1E030 0011DF30 2000A28F */  lw         $2, 0x20($sp)
.L0011DF34:
/* 1E034 0011DF34 05004010 */  beqz       $2, .L0011DF4C
/* 1E038 0011DF38 00000000 */   nop
/* 1E03C 0011DF3C D805040C */  jal        __errno
/* 1E040 0011DF40 00000000 */   nop
/* 1E044 0011DF44 2000A38F */  lw         $3, 0x20($sp)
/* 1E048 0011DF48 000043AC */  sw         $3, 0x0($2)
.L0011DF4C:
/* 1E04C 0011DF4C 9241040C */  jal        dptofp
/* 1E050 0011DF50 1800A4DF */   ld        $4, 0x18($sp)
/* 1E054 0011DF54 03000010 */  b          .L0011DF64
/* 1E058 0011DF58 5000BFDF */   ld        $31, 0x50($sp)
.L0011DF5C:
/* 1E05C 0011DF5C 06A80046 */  mov.s      $f0, $f21
.L0011DF60:
/* 1E060 0011DF60 5000BFDF */  ld         $31, 0x50($sp)
.L0011DF64:
/* 1E064 0011DF64 4000B1DF */  ld         $17, 0x40($sp)
/* 1E068 0011DF68 3000B0DF */  ld         $16, 0x30($sp)
/* 1E06C 0011DF6C 6800B5C7 */  lwc1       $f21, 0x68($sp)
/* 1E070 0011DF70 6000B4C7 */  lwc1       $f20, 0x60($sp)
/* 1E074 0011DF74 0800E003 */  jr         $31
/* 1E078 0011DF78 7000BD27 */   addiu     $sp, $sp, 0x70
/* 1E07C 0011DF7C 00000000 */  nop
