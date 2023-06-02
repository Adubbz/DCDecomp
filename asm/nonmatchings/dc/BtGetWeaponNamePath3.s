.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BtGetWeaponNamePath3__FPcPci
/* B74B0 001B73B0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* B74B4 001B73B4 4000BF7F */  sq         $31, 0x40($sp)
/* B74B8 001B73B8 3000B37F */  sq         $19, 0x30($sp)
/* B74BC 001B73BC 2000B27F */  sq         $18, 0x20($sp)
/* B74C0 001B73C0 1000B17F */  sq         $17, 0x10($sp)
/* B74C4 001B73C4 0000B07F */  sq         $16, 0x0($sp)
/* B74C8 001B73C8 289E8070 */  paddub     $19, $4, $0
/* B74CC 001B73CC 2896A070 */  paddub     $18, $5, $0
/* B74D0 001B73D0 288EC070 */  paddub     $17, $6, $0
/* B74D4 001B73D4 0101212A */  slti       $at, $17, 0x101
/* B74D8 001B73D8 03002010 */  beqz       $at, .L001B73E8
/* B74DC 001B73DC 00000000 */   nop
/* B74E0 001B73E0 18000010 */  b          .L001B7444
/* B74E4 001B73E4 00000000 */   nop
.L001B73E8:
/* B74E8 001B73E8 28262072 */  paddub     $4, $17, $0
/* B74EC 001B73EC D443070C */  jal        GetWeaponData__Fi
/* B74F0 001B73F0 00000000 */   nop
/* B74F4 001B73F4 13004010 */  beqz       $2, .L001B7444
/* B74F8 001B73F8 00000000 */   nop
/* B74FC 001B73FC 0A005080 */  lb         $16, 0xA($2)
/* B7500 001B7400 80181000 */  sll        $3, $16, 2
/* B7504 001B7404 2700023C */  lui        $2, %hi(defWeapon_2)
/* B7508 001B7408 90B14224 */  addiu      $2, $2, %lo(defWeapon_2)
/* B750C 001B740C 21104300 */  addu       $2, $2, $3
/* B7510 001B7410 0000428C */  lw         $2, 0x0($2)
/* B7514 001B7414 23882202 */  subu       $17, $17, $2
/* B7518 001B7418 2A00023C */  lui        $2, %hi(_953)
/* B751C 001B741C 60BC4424 */  addiu      $4, $2, %lo(_953)
/* B7520 001B7420 282E2072 */  paddub     $5, $17, $0
/* B7524 001B7424 A611040C */  jal        printf
/* B7528 001B7428 00000000 */   nop
/* B752C 001B742C 28266072 */  paddub     $4, $19, $0
/* B7530 001B7430 282E4072 */  paddub     $5, $18, $0
/* B7534 001B7434 28360072 */  paddub     $6, $16, $0
/* B7538 001B7438 283E2072 */  paddub     $7, $17, $0
/* B753C 001B743C 94DC060C */  jal        BtGetWeaponNamePath2__FPcPcii
/* B7540 001B7440 00000000 */   nop
.L001B7444:
/* B7544 001B7444 4000BF7B */  lq         $31, 0x40($sp)
/* B7548 001B7448 3000B37B */  lq         $19, 0x30($sp)
/* B754C 001B744C 2000B27B */  lq         $18, 0x20($sp)
/* B7550 001B7450 1000B17B */  lq         $17, 0x10($sp)
/* B7554 001B7454 0000B07B */  lq         $16, 0x0($sp)
/* B7558 001B7458 5000BD27 */  addiu      $sp, $sp, 0x50
/* B755C 001B745C 0800E003 */  jr         $31
/* B7560 001B7460 00000000 */   nop
/* B7564 001B7464 00000000 */  nop
/* B7568 001B7468 00000000 */  nop
/* B756C 001B746C 00000000 */  nop
