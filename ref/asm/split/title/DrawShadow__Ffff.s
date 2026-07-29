.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawShadow__Ffff
/* 00BD80 01DB7A80 D0FFBD27 */  addiu       $29, $29, -0x30
/* 00BD84 01DB7A84 1000BF7F */  sq          $31, 0x10($29)
/* 00BD88 01DB7A88 0800B6E7 */  swc1        $f22, 0x8($29)
/* 00BD8C 01DB7A8C 0400B5E7 */  swc1        $f21, 0x4($29)
/* 00BD90 01DB7A90 0000B4E7 */  swc1        $f20, 0x0($29)
/* 00BD94 01DB7A94 86650046 */  mov.s       $f22, $f12
/* 00BD98 01DB7A98 46750046 */  mov.s       $f21, $f14
/* 00BD9C 01DB7A9C DD01033C */  lui         $3, %hi(LIT_905__3)
/* 00BDA0 01DB7AA0 90676324 */  addiu       $3, $3, %lo(LIT_905__3)
/* 00BDA4 01DB7AA4 2000A427 */  addiu       $4, $29, 0x20
/* 00BDA8 01DB7AA8 00006378 */  lq          $3, 0x0($3)
/* 00BDAC 01DB7AAC 0000837C */  sq          $3, 0x0($4)
/* 00BDB0 01DB7AB0 2C00A427 */  addiu       $4, $29, 0x2C
/* 00BDB4 01DB7AB4 000081C4 */  lwc1        $f1, 0x0($4)
/* 00BDB8 01DB7AB8 2041033C */  lui         $3, (0x41200000 >> 16)
/* 00BDBC 01DB7ABC 00008344 */  mtc1        $3, $f0
/* 00BDC0 01DB7AC0 00000000 */  nop
/* 00BDC4 01DB7AC4 02000D46 */  mul.s       $f0, $f0, $f13
/* 00BDC8 01DB7AC8 41080046 */  sub.s       $f1, $f1, $f0
/* 00BDCC 01DB7ACC 000081E4 */  swc1        $f1, 0x0($4)
/* 00BDD0 01DB7AD0 00008044 */  mtc1        $0, $f0
/* 00BDD4 01DB7AD4 00000000 */  nop
/* 00BDD8 01DB7AD8 36080046 */  c.le.s      $f1, $f0
/* 00BDDC 01DB7ADC 00000000 */  nop
/* 00BDE0 01DB7AE0 22000145 */  bc1t        .L01DB7B6C_2BD36C
/* 00BDE4 01DB7AE4 00000000 */   nop
/* 00BDE8 01DB7AE8 D09880C7 */  lwc1        $f0, -0x6730($28)
/* 00BDEC 01DB7AEC 36080046 */  c.le.s      $f1, $f0
/* 00BDF0 01DB7AF0 00000000 */  nop
/* 00BDF4 01DB7AF4 02000145 */  bc1t        .L01DB7B00_2BD300
/* 00BDF8 01DB7AF8 00000000 */   nop
/* 00BDFC 01DB7AFC 000080E4 */  swc1        $f0, 0x0($4)
.L01DB7B00_2BD300:
/* 00BE00 01DB7B00 2000A427 */  addiu       $4, $29, 0x20
/* 00BE04 01DB7B04 40B7040C */  jal         MGSetAmbient__FPf
/* 00BE08 01DB7B08 00000000 */   nop
/* 00BE0C 01DB7B0C 06B30046 */  mov.s       $f12, $f22
/* 00BE10 01DB7B10 46AB0046 */  mov.s       $f13, $f21
/* 00BE14 01DB7B14 5077040C */  jal         atan2f
/* 00BE18 01DB7B18 00000000 */   nop
/* 00BE1C 01DB7B1C 06050046 */  mov.s       $f20, $f0
/* 00BE20 01DB7B20 CC98848F */  lw          $4, -0x6734($28)
/* 00BE24 01DB7B24 06B30046 */  mov.s       $f12, $f22
/* 00BE28 01DB7B28 E0838DC7 */  lwc1        $f13, -0x7C20($28)
/* 00BE2C 01DB7B2C 86AB0046 */  mov.s       $f14, $f21
/* 00BE30 01DB7B30 A09F040C */  jal         SetPosition__6CFrameFfff
/* 00BE34 01DB7B34 00000000 */   nop
/* 00BE38 01DB7B38 00708044 */  mtc1        $0, $f14
/* 00BE3C 01DB7B3C CC98848F */  lw          $4, -0x6734($28)
/* 00BE40 01DB7B40 E4838CC7 */  lwc1        $f12, -0x7C1C($28)
/* 00BE44 01DB7B44 46A30046 */  mov.s       $f13, $f20
/* 00BE48 01DB7B48 70A3040C */  jal         SetRotation__6CFrameFfff
/* 00BE4C 01DB7B4C 00000000 */   nop
/* 00BE50 01DB7B50 CC98848F */  lw          $4, -0x6734($28)
/* 00BE54 01DB7B54 60BB040C */  jal         MGDraw__FP6CFrame
/* 00BE58 01DB7B58 00000000 */   nop
/* 00BE5C 01DB7B5C 2500023C */  lui         $2, %hi(ambientlight)
/* 00BE60 01DB7B60 001C4424 */  addiu       $4, $2, %lo(ambientlight)
/* 00BE64 01DB7B64 40B7040C */  jal         MGSetAmbient__FPf
/* 00BE68 01DB7B68 00000000 */   nop
.L01DB7B6C_2BD36C:
/* 00BE6C 01DB7B6C 1000BF7B */  lq          $31, 0x10($29)
/* 00BE70 01DB7B70 0800B6C7 */  lwc1        $f22, 0x8($29)
/* 00BE74 01DB7B74 0400B5C7 */  lwc1        $f21, 0x4($29)
/* 00BE78 01DB7B78 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 00BE7C 01DB7B7C 3000BD27 */  addiu       $29, $29, 0x30
/* 00BE80 01DB7B80 0800E003 */  jr          $31
/* 00BE84 01DB7B84 00000000 */   nop
/* 00BE88 01DB7B88 00000000 */  nop
/* 00BE8C 01DB7B8C 00000000 */  nop
