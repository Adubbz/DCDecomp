.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Step__14CWeaponElementFv
/* B7A40 001B7940 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* B7A44 001B7944 0000BF7F */  sq         $31, 0x0($sp)
/* B7A48 001B7948 AC058384 */  lh         $3, 0x5AC($4)
/* B7A4C 001B794C 24006010 */  beqz       $3, .L001B79E0
/* B7A50 001B7950 00000000 */   nop
/* B7A54 001B7954 A4058384 */  lh         $3, 0x5A4($4)
/* B7A58 001B7958 04000224 */  addiu      $2, $0, 0x4
/* B7A5C 001B795C 1E006210 */  beq        $3, $2, .L001B79D8
/* B7A60 001B7960 00000000 */   nop
/* B7A64 001B7964 02000224 */  addiu      $2, $0, 0x2
/* B7A68 001B7968 17006210 */  beq        $3, $2, .L001B79C8
/* B7A6C 001B796C 00000000 */   nop
/* B7A70 001B7970 11006010 */  beqz       $3, .L001B79B8
/* B7A74 001B7974 00000000 */   nop
/* B7A78 001B7978 03000224 */  addiu      $2, $0, 0x3
/* B7A7C 001B797C 0A006210 */  beq        $3, $2, .L001B79A8
/* B7A80 001B7980 00000000 */   nop
/* B7A84 001B7984 01000224 */  addiu      $2, $0, 0x1
/* B7A88 001B7988 03006210 */  beq        $3, $2, .L001B7998
/* B7A8C 001B798C 00000000 */   nop
/* B7A90 001B7990 01000010 */  b          .L001B7998
/* B7A94 001B7994 00000000 */   nop
.L001B7998:
/* B7A98 001B7998 F0E1060C */  jal        Step_Cold__14CWeaponElementFv
/* B7A9C 001B799C 00000000 */   nop
/* B7AA0 001B79A0 0F000010 */  b          .L001B79E0
/* B7AA4 001B79A4 00000000 */   nop
.L001B79A8:
/* B7AA8 001B79A8 B4E4060C */  jal        Step_Wind__14CWeaponElementFv
/* B7AAC 001B79AC 00000000 */   nop
/* B7AB0 001B79B0 0B000010 */  b          .L001B79E0
/* B7AB4 001B79B4 00000000 */   nop
.L001B79B8:
/* B7AB8 001B79B8 88E7060C */  jal        Step_Fire__14CWeaponElementFv
/* B7ABC 001B79BC 00000000 */   nop
/* B7AC0 001B79C0 07000010 */  b          .L001B79E0
/* B7AC4 001B79C4 00000000 */   nop
.L001B79C8:
/* B7AC8 001B79C8 88EA060C */  jal        Step_Thunder__14CWeaponElementFv
/* B7ACC 001B79CC 00000000 */   nop
/* B7AD0 001B79D0 03000010 */  b          .L001B79E0
/* B7AD4 001B79D4 00000000 */   nop
.L001B79D8:
/* B7AD8 001B79D8 78DF060C */  jal        Step_Holy__14CWeaponElementFv
/* B7ADC 001B79DC 00000000 */   nop
.L001B79E0:
/* B7AE0 001B79E0 0000BF7B */  lq         $31, 0x0($sp)
/* B7AE4 001B79E4 1000BD27 */  addiu      $sp, $sp, 0x10
/* B7AE8 001B79E8 0800E003 */  jr         $31
/* B7AEC 001B79EC 00000000 */   nop
