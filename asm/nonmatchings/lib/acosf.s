.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel acosf
/* 1DD40 0011DC40 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 1DD44 0011DC44 5000B4E7 */  swc1       $f20, 0x50($sp)
/* 1DD48 0011DC48 3000B0FF */  sd         $16, 0x30($sp)
/* 1DD4C 0011DC4C 5800B5E7 */  swc1       $f21, 0x58($sp)
/* 1DD50 0011DC50 4000BFFF */  sd         $31, 0x40($sp)
/* 1DD54 0011DC54 6E68040C */  jal        __ieee754_acosf
/* 1DD58 0011DC58 06650046 */   mov.s     $f20, $f12
/* 1DD5C 0011DC5C 2A00023C */  lui        $2, (0x2A0000 >> 16)
/* 1DD60 0011DC60 308A508C */  lw         $16, -0x75D0($2)
/* 1DD64 0011DC64 FFFF0324 */  addiu      $3, $0, -0x1
/* 1DD68 0011DC68 2D000312 */  beq        $16, $3, .L0011DD20
/* 1DD6C 0011DC6C 46050046 */   mov.s     $f21, $f0
/* 1DD70 0011DC70 A612040C */  jal        isnanf
/* 1DD74 0011DC74 06A30046 */   mov.s     $f12, $f20
/* 1DD78 0011DC78 2A004014 */  bnez       $2, .L0011DD24
/* 1DD7C 0011DC7C 06A80046 */   mov.s     $f0, $f21
/* 1DD80 0011DC80 E675040C */  jal        fabsf
/* 1DD84 0011DC84 06A30046 */   mov.s     $f12, $f20
/* 1DD88 0011DC88 803F013C */  lui        $at, (0x3F800000 >> 16)
/* 1DD8C 0011DC8C 00088144 */  mtc1       $at, $f1
/* 1DD90 0011DC90 34080046 */  c.lt.s     $f1, $f0
/* 1DD94 0011DC94 00000000 */  nop
/* 1DD98 0011DC98 21000045 */  bc1f       .L0011DD20
/* 1DD9C 0011DC9C 2A00023C */   lui       $2, %hi(D_00298AA8)
/* 1DDA0 0011DCA0 01000324 */  addiu      $3, $0, 0x1
/* 1DDA4 0011DCA4 A88A4224 */  addiu      $2, $2, %lo(D_00298AA8)
/* 1DDA8 0011DCA8 0000A3AF */  sw         $3, 0x0($sp)
/* 1DDAC 0011DCAC 0400A2AF */  sw         $2, 0x4($sp)
/* 1DDB0 0011DCB0 06A30046 */  mov.s      $f12, $f20
/* 1DDB4 0011DCB4 9044040C */  jal        fptodp
/* 1DDB8 0011DCB8 2000A0AF */   sw        $0, 0x20($sp)
/* 1DDBC 0011DCBC 2D180000 */  daddu      $3, $0, $0
/* 1DDC0 0011DCC0 0800A2FF */  sd         $2, 0x8($sp)
/* 1DDC4 0011DCC4 1800A3FF */  sd         $3, 0x18($sp)
/* 1DDC8 0011DCC8 02000324 */  addiu      $3, $0, 0x2
/* 1DDCC 0011DCCC 05000312 */  beq        $16, $3, .L0011DCE4
/* 1DDD0 0011DCD0 1000A2FF */   sd        $2, 0x10($sp)
/* 1DDD4 0011DCD4 BA74040C */  jal        matherr
/* 1DDD8 0011DCD8 2D20A003 */   daddu     $4, $sp, $0
/* 1DDDC 0011DCDC 06004014 */  bnez       $2, .L0011DCF8
/* 1DDE0 0011DCE0 2000A28F */   lw        $2, 0x20($sp)
.L0011DCE4:
/* 1DDE4 0011DCE4 D805040C */  jal        __errno
/* 1DDE8 0011DCE8 00000000 */   nop
/* 1DDEC 0011DCEC 21000324 */  addiu      $3, $0, 0x21
/* 1DDF0 0011DCF0 000043AC */  sw         $3, 0x0($2)
/* 1DDF4 0011DCF4 2000A28F */  lw         $2, 0x20($sp)
.L0011DCF8:
/* 1DDF8 0011DCF8 05004010 */  beqz       $2, .L0011DD10
/* 1DDFC 0011DCFC 00000000 */   nop
/* 1DE00 0011DD00 D805040C */  jal        __errno
/* 1DE04 0011DD04 00000000 */   nop
/* 1DE08 0011DD08 2000A38F */  lw         $3, 0x20($sp)
/* 1DE0C 0011DD0C 000043AC */  sw         $3, 0x0($2)
.L0011DD10:
/* 1DE10 0011DD10 9241040C */  jal        dptofp
/* 1DE14 0011DD14 1800A4DF */   ld        $4, 0x18($sp)
/* 1DE18 0011DD18 03000010 */  b          .L0011DD28
/* 1DE1C 0011DD1C 4000BFDF */   ld        $31, 0x40($sp)
.L0011DD20:
/* 1DE20 0011DD20 06A80046 */  mov.s      $f0, $f21
.L0011DD24:
/* 1DE24 0011DD24 4000BFDF */  ld         $31, 0x40($sp)
.L0011DD28:
/* 1DE28 0011DD28 3000B0DF */  ld         $16, 0x30($sp)
/* 1DE2C 0011DD2C 5800B5C7 */  lwc1       $f21, 0x58($sp)
/* 1DE30 0011DD30 5000B4C7 */  lwc1       $f20, 0x50($sp)
/* 1DE34 0011DD34 0800E003 */  jr         $31
/* 1DE38 0011DD38 6000BD27 */   addiu     $sp, $sp, 0x60
/* 1DE3C 0011DD3C 00000000 */  nop
