.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel acosf
/* 01DD40 0011DC40 A0FFBD27 */  addiu       $29, $29, -0x60
/* 01DD44 0011DC44 5000B4E7 */  swc1        $f20, 0x50($29)
/* 01DD48 0011DC48 3000B0FF */  sd          $16, 0x30($29)
/* 01DD4C 0011DC4C 5800B5E7 */  swc1        $f21, 0x58($29)
/* 01DD50 0011DC50 4000BFFF */  sd          $31, 0x40($29)
/* 01DD54 0011DC54 6E68040C */  jal         __ieee754_acosf
/* 01DD58 0011DC58 06650046 */   mov.s      $f20, $f12
/* 01DD5C 0011DC5C 2A00023C */  lui         $2, %hi(__fdlib_version)
/* 01DD60 0011DC60 308A508C */  lw          $16, %lo(__fdlib_version)($2)
/* 01DD64 0011DC64 FFFF0324 */  addiu       $3, $0, -0x1
/* 01DD68 0011DC68 2D000312 */  beq         $16, $3, .L0011DD20
/* 01DD6C 0011DC6C 46050046 */   mov.s      $f21, $f0
/* 01DD70 0011DC70 A612040C */  jal         isnanf
/* 01DD74 0011DC74 06A30046 */   mov.s      $f12, $f20
/* 01DD78 0011DC78 2A004014 */  bnez        $2, .L0011DD24
/* 01DD7C 0011DC7C 06A80046 */   mov.s      $f0, $f21
/* 01DD80 0011DC80 E675040C */  jal         fabsf
/* 01DD84 0011DC84 06A30046 */   mov.s      $f12, $f20
/* 01DD88 0011DC88 803F013C */  lui         $1, (0x3F800000 >> 16)
/* 01DD8C 0011DC8C 00088144 */  mtc1        $1, $f1
/* 01DD90 0011DC90 34080046 */  c.lt.s      $f1, $f0
/* 01DD94 0011DC94 00000000 */  nop
/* 01DD98 0011DC98 21000045 */  bc1f        .L0011DD20
/* 01DD9C 0011DC9C 2A00023C */   lui        $2, %hi(RO_00298AA8)
/* 01DDA0 0011DCA0 01000324 */  addiu       $3, $0, 0x1
/* 01DDA4 0011DCA4 A88A4224 */  addiu       $2, $2, %lo(RO_00298AA8)
/* 01DDA8 0011DCA8 0000A3AF */  sw          $3, 0x0($29)
/* 01DDAC 0011DCAC 0400A2AF */  sw          $2, 0x4($29)
/* 01DDB0 0011DCB0 06A30046 */  mov.s       $f12, $f20
/* 01DDB4 0011DCB4 9044040C */  jal         fptodp
/* 01DDB8 0011DCB8 2000A0AF */   sw         $0, 0x20($29)
/* 01DDBC 0011DCBC 2D180000 */  daddu       $3, $0, $0
/* 01DDC0 0011DCC0 0800A2FF */  sd          $2, 0x8($29)
/* 01DDC4 0011DCC4 1800A3FF */  sd          $3, 0x18($29)
/* 01DDC8 0011DCC8 02000324 */  addiu       $3, $0, 0x2
/* 01DDCC 0011DCCC 05000312 */  beq         $16, $3, .L0011DCE4
/* 01DDD0 0011DCD0 1000A2FF */   sd         $2, 0x10($29)
/* 01DDD4 0011DCD4 BA74040C */  jal         matherr
/* 01DDD8 0011DCD8 2D20A003 */   daddu      $4, $29, $0
/* 01DDDC 0011DCDC 06004014 */  bnez        $2, .L0011DCF8
/* 01DDE0 0011DCE0 2000A28F */   lw         $2, 0x20($29)
.L0011DCE4:
/* 01DDE4 0011DCE4 D805040C */  jal         __errno
/* 01DDE8 0011DCE8 00000000 */   nop
/* 01DDEC 0011DCEC 21000324 */  addiu       $3, $0, 0x21
/* 01DDF0 0011DCF0 000043AC */  sw          $3, 0x0($2)
/* 01DDF4 0011DCF4 2000A28F */  lw          $2, 0x20($29)
.L0011DCF8:
/* 01DDF8 0011DCF8 05004010 */  beqz        $2, .L0011DD10
/* 01DDFC 0011DCFC 00000000 */   nop
/* 01DE00 0011DD00 D805040C */  jal         __errno
/* 01DE04 0011DD04 00000000 */   nop
/* 01DE08 0011DD08 2000A38F */  lw          $3, 0x20($29)
/* 01DE0C 0011DD0C 000043AC */  sw          $3, 0x0($2)
.L0011DD10:
/* 01DE10 0011DD10 9241040C */  jal         dptofp
/* 01DE14 0011DD14 1800A4DF */   ld         $4, 0x18($29)
/* 01DE18 0011DD18 03000010 */  b           .L0011DD28
/* 01DE1C 0011DD1C 4000BFDF */   ld         $31, 0x40($29)
.L0011DD20:
/* 01DE20 0011DD20 06A80046 */  mov.s       $f0, $f21
.L0011DD24:
/* 01DE24 0011DD24 4000BFDF */  ld          $31, 0x40($29)
.L0011DD28:
/* 01DE28 0011DD28 3000B0DF */  ld          $16, 0x30($29)
/* 01DE2C 0011DD2C 5800B5C7 */  lwc1        $f21, 0x58($29)
/* 01DE30 0011DD30 5000B4C7 */  lwc1        $f20, 0x50($29)
/* 01DE34 0011DD34 0800E003 */  jr          $31
/* 01DE38 0011DD38 6000BD27 */   addiu      $29, $29, 0x60
/* 01DE3C 0011DD3C 00000000 */  nop
