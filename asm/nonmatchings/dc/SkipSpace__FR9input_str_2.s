.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SkipSpace__FR9input_str_2
/* 40570 00140470 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 40574 00140474 3000BF7F */  sq         $31, 0x30($sp)
/* 40578 00140478 2000B27F */  sq         $18, 0x20($sp)
/* 4057C 0014047C 1000B17F */  sq         $17, 0x10($sp)
/* 40580 00140480 0000B07F */  sq         $16, 0x0($sp)
/* 40584 00140484 28968070 */  paddub     $18, $4, $0
/* 40588 00140488 0000908C */  lw         $16, 0x0($4)
/* 4058C 0014048C 0800918C */  lw         $17, 0x8($4)
/* 40590 00140490 08000010 */  b          .L001404B4
/* 40594 00140494 00000000 */   nop
.L00140498:
/* 40598 00140498 21101102 */  addu       $2, $16, $17
/* 4059C 0014049C 00004480 */  lb         $4, 0x0($2)
/* 405A0 001404A0 4401050C */  jal        CheckChar__Fc_2
/* 405A4 001404A4 00000000 */   nop
/* 405A8 001404A8 06004014 */  bnez       $2, .L001404C4
/* 405AC 001404AC 00000000 */   nop
/* 405B0 001404B0 01003126 */  addiu      $17, $17, 0x1
.L001404B4:
/* 405B4 001404B4 0400428E */  lw         $2, 0x4($18)
/* 405B8 001404B8 2A102202 */  slt        $2, $17, $2
/* 405BC 001404BC F6FF4014 */  bnez       $2, .L00140498
/* 405C0 001404C0 00000000 */   nop
.L001404C4:
/* 405C4 001404C4 080051AE */  sw         $17, 0x8($18)
/* 405C8 001404C8 0400428E */  lw         $2, 0x4($18)
/* 405CC 001404CC 2A102202 */  slt        $2, $17, $2
/* 405D0 001404D0 04004014 */  bnez       $2, .L001404E4
/* 405D4 001404D4 00000000 */   nop
/* 405D8 001404D8 28160070 */  paddub     $2, $0, $0
/* 405DC 001404DC 02000010 */  b          .L001404E8
/* 405E0 001404E0 00000000 */   nop
.L001404E4:
/* 405E4 001404E4 01000224 */  addiu      $2, $0, 0x1
.L001404E8:
/* 405E8 001404E8 3000BF7B */  lq         $31, 0x30($sp)
/* 405EC 001404EC 2000B27B */  lq         $18, 0x20($sp)
/* 405F0 001404F0 1000B17B */  lq         $17, 0x10($sp)
/* 405F4 001404F4 0000B07B */  lq         $16, 0x0($sp)
/* 405F8 001404F8 4000BD27 */  addiu      $sp, $sp, 0x40
/* 405FC 001404FC 0800E003 */  jr         $31
/* 40600 00140500 00000000 */   nop
/* 40604 00140504 00000000 */  nop
/* 40608 00140508 00000000 */  nop
/* 4060C 0014050C 00000000 */  nop