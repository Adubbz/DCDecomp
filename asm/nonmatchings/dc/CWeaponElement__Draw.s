.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Draw__14CWeaponElementFv
/* B7AF0 001B79F0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* B7AF4 001B79F4 0000BF7F */  sq         $31, 0x0($sp)
/* B7AF8 001B79F8 AC058384 */  lh         $3, 0x5AC($4)
/* B7AFC 001B79FC 24006010 */  beqz       $3, .L001B7A90
/* B7B00 001B7A00 00000000 */   nop
/* B7B04 001B7A04 A4058384 */  lh         $3, 0x5A4($4)
/* B7B08 001B7A08 04000224 */  addiu      $2, $0, 0x4
/* B7B0C 001B7A0C 1E006210 */  beq        $3, $2, .L001B7A88
/* B7B10 001B7A10 00000000 */   nop
/* B7B14 001B7A14 02000224 */  addiu      $2, $0, 0x2
/* B7B18 001B7A18 17006210 */  beq        $3, $2, .L001B7A78
/* B7B1C 001B7A1C 00000000 */   nop
/* B7B20 001B7A20 11006010 */  beqz       $3, .L001B7A68
/* B7B24 001B7A24 00000000 */   nop
/* B7B28 001B7A28 03000224 */  addiu      $2, $0, 0x3
/* B7B2C 001B7A2C 0A006210 */  beq        $3, $2, .L001B7A58
/* B7B30 001B7A30 00000000 */   nop
/* B7B34 001B7A34 01000224 */  addiu      $2, $0, 0x1
/* B7B38 001B7A38 03006210 */  beq        $3, $2, .L001B7A48
/* B7B3C 001B7A3C 00000000 */   nop
/* B7B40 001B7A40 01000010 */  b          .L001B7A48
/* B7B44 001B7A44 00000000 */   nop
.L001B7A48:
/* B7B48 001B7A48 28E3060C */  jal        Draw_Cold__14CWeaponElementFv
/* B7B4C 001B7A4C 00000000 */   nop
/* B7B50 001B7A50 0F000010 */  b          .L001B7A90
/* B7B54 001B7A54 00000000 */   nop
.L001B7A58:
/* B7B58 001B7A58 20E6060C */  jal        Draw_Wind__14CWeaponElementFv
/* B7B5C 001B7A5C 00000000 */   nop
/* B7B60 001B7A60 0B000010 */  b          .L001B7A90
/* B7B64 001B7A64 00000000 */   nop
.L001B7A68:
/* B7B68 001B7A68 C0E8060C */  jal        Draw_Fire__14CWeaponElementFv
/* B7B6C 001B7A6C 00000000 */   nop
/* B7B70 001B7A70 07000010 */  b          .L001B7A90
/* B7B74 001B7A74 00000000 */   nop
.L001B7A78:
/* B7B78 001B7A78 40EB060C */  jal        Draw_Thunder__14CWeaponElementFv
/* B7B7C 001B7A7C 00000000 */   nop
/* B7B80 001B7A80 03000010 */  b          .L001B7A90
/* B7B84 001B7A84 00000000 */   nop
.L001B7A88:
/* B7B88 001B7A88 A4E0060C */  jal        Draw_Holy__14CWeaponElementFv
/* B7B8C 001B7A8C 00000000 */   nop
.L001B7A90:
/* B7B90 001B7A90 0000BF7B */  lq         $31, 0x0($sp)
/* B7B94 001B7A94 1000BD27 */  addiu      $sp, $sp, 0x10
/* B7B98 001B7A98 0800E003 */  jr         $31
/* B7B9C 001B7A9C 00000000 */   nop
