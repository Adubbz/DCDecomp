.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SkipSpace__FR9input_str
/* 3B270 0013B170 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 3B274 0013B174 3000BF7F */  sq         $31, 0x30($sp)
/* 3B278 0013B178 2000B27F */  sq         $18, 0x20($sp)
/* 3B27C 0013B17C 1000B17F */  sq         $17, 0x10($sp)
/* 3B280 0013B180 0000B07F */  sq         $16, 0x0($sp)
/* 3B284 0013B184 28968070 */  paddub     $18, $4, $0
/* 3B288 0013B188 0000908C */  lw         $16, 0x0($4)
/* 3B28C 0013B18C 0800918C */  lw         $17, 0x8($4)
/* 3B290 0013B190 08000010 */  b          .L0013B1B4
/* 3B294 0013B194 00000000 */   nop
.L0013B198:
/* 3B298 0013B198 21101102 */  addu       $2, $16, $17
/* 3B29C 0013B19C 00004480 */  lb         $4, 0x0($2)
/* 3B2A0 0013B1A0 84EC040C */  jal        CheckChar__Fc
/* 3B2A4 0013B1A4 00000000 */   nop
/* 3B2A8 0013B1A8 06004014 */  bnez       $2, .L0013B1C4
/* 3B2AC 0013B1AC 00000000 */   nop
/* 3B2B0 0013B1B0 01003126 */  addiu      $17, $17, 0x1
.L0013B1B4:
/* 3B2B4 0013B1B4 0400428E */  lw         $2, 0x4($18)
/* 3B2B8 0013B1B8 2A102202 */  slt        $2, $17, $2
/* 3B2BC 0013B1BC F6FF4014 */  bnez       $2, .L0013B198
/* 3B2C0 0013B1C0 00000000 */   nop
.L0013B1C4:
/* 3B2C4 0013B1C4 080051AE */  sw         $17, 0x8($18)
/* 3B2C8 0013B1C8 0400428E */  lw         $2, 0x4($18)
/* 3B2CC 0013B1CC 2A102202 */  slt        $2, $17, $2
/* 3B2D0 0013B1D0 04004014 */  bnez       $2, .L0013B1E4
/* 3B2D4 0013B1D4 00000000 */   nop
/* 3B2D8 0013B1D8 28160070 */  paddub     $2, $0, $0
/* 3B2DC 0013B1DC 02000010 */  b          .L0013B1E8
/* 3B2E0 0013B1E0 00000000 */   nop
.L0013B1E4:
/* 3B2E4 0013B1E4 01000224 */  addiu      $2, $0, 0x1
.L0013B1E8:
/* 3B2E8 0013B1E8 3000BF7B */  lq         $31, 0x30($sp)
/* 3B2EC 0013B1EC 2000B27B */  lq         $18, 0x20($sp)
/* 3B2F0 0013B1F0 1000B17B */  lq         $17, 0x10($sp)
/* 3B2F4 0013B1F4 0000B07B */  lq         $16, 0x0($sp)
/* 3B2F8 0013B1F8 4000BD27 */  addiu      $sp, $sp, 0x40
/* 3B2FC 0013B1FC 0800E003 */  jr         $31
/* 3B300 0013B200 00000000 */   nop
/* 3B304 0013B204 00000000 */  nop
/* 3B308 0013B208 00000000 */  nop
/* 3B30C 0013B20C 00000000 */  nop
