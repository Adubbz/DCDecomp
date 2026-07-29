.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel atan2f
/* 01DE40 0011DD40 90FFBD27 */  addiu       $29, $29, -0x70
/* 01DE44 0011DD44 5800B5E7 */  swc1        $f21, 0x58($29)
/* 01DE48 0011DD48 5000B4E7 */  swc1        $f20, 0x50($29)
/* 01DE4C 0011DD4C 466D0046 */  mov.s       $f21, $f13
/* 01DE50 0011DD50 3000B0FF */  sd          $16, 0x30($29)
/* 01DE54 0011DD54 6000B6E7 */  swc1        $f22, 0x60($29)
/* 01DE58 0011DD58 4000BFFF */  sd          $31, 0x40($29)
/* 01DE5C 0011DD5C 7A69040C */  jal         __ieee754_atan2f
/* 01DE60 0011DD60 06650046 */   mov.s      $f20, $f12
/* 01DE64 0011DD64 2A00023C */  lui         $2, %hi(__fdlib_version)
/* 01DE68 0011DD68 308A508C */  lw          $16, %lo(__fdlib_version)($2)
/* 01DE6C 0011DD6C FFFF0324 */  addiu       $3, $0, -0x1
/* 01DE70 0011DD70 35000312 */  beq         $16, $3, .L0011DE48
/* 01DE74 0011DD74 86050046 */   mov.s      $f22, $f0
/* 01DE78 0011DD78 A612040C */  jal         isnanf
/* 01DE7C 0011DD7C 06AB0046 */   mov.s      $f12, $f21
/* 01DE80 0011DD80 32004014 */  bnez        $2, .L0011DE4C
/* 01DE84 0011DD84 06B00046 */   mov.s      $f0, $f22
/* 01DE88 0011DD88 A612040C */  jal         isnanf
/* 01DE8C 0011DD8C 06A30046 */   mov.s      $f12, $f20
/* 01DE90 0011DD90 2E004014 */  bnez        $2, .L0011DE4C
/* 01DE94 0011DD94 06B00046 */   mov.s      $f0, $f22
/* 01DE98 0011DD98 00008044 */  mtc1        $0, $f0
/* 01DE9C 0011DD9C 32A80046 */  c.eq.s      $f21, $f0
/* 01DEA0 0011DDA0 00000000 */  nop
/* 01DEA4 0011DDA4 29000245 */  bc1fl       .L0011DE4C
/* 01DEA8 0011DDA8 06B00046 */   mov.s      $f0, $f22
/* 01DEAC 0011DDAC 32A00046 */  c.eq.s      $f20, $f0
/* 01DEB0 0011DDB0 00000000 */  nop
/* 01DEB4 0011DDB4 25000045 */  bc1f        .L0011DE4C
/* 01DEB8 0011DDB8 06B00046 */   mov.s      $f0, $f22
/* 01DEBC 0011DDBC 9044040C */  jal         fptodp
/* 01DEC0 0011DDC0 06A30046 */   mov.s      $f12, $f20
/* 01DEC4 0011DDC4 06AB0046 */  mov.s       $f12, $f21
/* 01DEC8 0011DDC8 9044040C */  jal         fptodp
/* 01DECC 0011DDCC 0800A2FF */   sd         $2, 0x8($29)
/* 01DED0 0011DDD0 1000A2FF */  sd          $2, 0x10($29)
/* 01DED4 0011DDD4 2A00033C */  lui         $3, %hi(RO_00298AB0)
/* 01DED8 0011DDD8 2D100000 */  daddu       $2, $0, $0
/* 01DEDC 0011DDDC 01000424 */  addiu       $4, $0, 0x1
/* 01DEE0 0011DDE0 B08A6324 */  addiu       $3, $3, %lo(RO_00298AB0)
/* 01DEE4 0011DDE4 1800A2FF */  sd          $2, 0x18($29)
/* 01DEE8 0011DDE8 0000A4AF */  sw          $4, 0x0($29)
/* 01DEEC 0011DDEC 02000224 */  addiu       $2, $0, 0x2
/* 01DEF0 0011DDF0 0400A3AF */  sw          $3, 0x4($29)
/* 01DEF4 0011DDF4 05000212 */  beq         $16, $2, .L0011DE0C
/* 01DEF8 0011DDF8 2000A0AF */   sw         $0, 0x20($29)
/* 01DEFC 0011DDFC BA74040C */  jal         matherr
/* 01DF00 0011DE00 2D20A003 */   daddu      $4, $29, $0
/* 01DF04 0011DE04 06004014 */  bnez        $2, .L0011DE20
/* 01DF08 0011DE08 2000A28F */   lw         $2, 0x20($29)
.L0011DE0C:
/* 01DF0C 0011DE0C D805040C */  jal         __errno
/* 01DF10 0011DE10 00000000 */   nop
/* 01DF14 0011DE14 21000324 */  addiu       $3, $0, 0x21
/* 01DF18 0011DE18 000043AC */  sw          $3, 0x0($2)
/* 01DF1C 0011DE1C 2000A28F */  lw          $2, 0x20($29)
.L0011DE20:
/* 01DF20 0011DE20 05004010 */  beqz        $2, .L0011DE38
/* 01DF24 0011DE24 00000000 */   nop
/* 01DF28 0011DE28 D805040C */  jal         __errno
/* 01DF2C 0011DE2C 00000000 */   nop
/* 01DF30 0011DE30 2000A38F */  lw          $3, 0x20($29)
/* 01DF34 0011DE34 000043AC */  sw          $3, 0x0($2)
.L0011DE38:
/* 01DF38 0011DE38 9241040C */  jal         dptofp
/* 01DF3C 0011DE3C 1800A4DF */   ld         $4, 0x18($29)
/* 01DF40 0011DE40 03000010 */  b           .L0011DE50
/* 01DF44 0011DE44 4000BFDF */   ld         $31, 0x40($29)
.L0011DE48:
/* 01DF48 0011DE48 06B00046 */  mov.s       $f0, $f22
.L0011DE4C:
/* 01DF4C 0011DE4C 4000BFDF */  ld          $31, 0x40($29)
.L0011DE50:
/* 01DF50 0011DE50 3000B0DF */  ld          $16, 0x30($29)
/* 01DF54 0011DE54 6000B6C7 */  lwc1        $f22, 0x60($29)
/* 01DF58 0011DE58 5800B5C7 */  lwc1        $f21, 0x58($29)
/* 01DF5C 0011DE5C 5000B4C7 */  lwc1        $f20, 0x50($29)
/* 01DF60 0011DE60 0800E003 */  jr          $31
/* 01DF64 0011DE64 7000BD27 */   addiu      $29, $29, 0x70
