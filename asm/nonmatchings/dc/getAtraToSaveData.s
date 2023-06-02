.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel getAtraToSaveData__FiiP9CSaveDataii
/* B7570 001B7470 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* B7574 001B7474 5000BF7F */  sq         $31, 0x50($sp)
/* B7578 001B7478 4000B47F */  sq         $20, 0x40($sp)
/* B757C 001B747C 3000B37F */  sq         $19, 0x30($sp)
/* B7580 001B7480 2000B27F */  sq         $18, 0x20($sp)
/* B7584 001B7484 1000B17F */  sq         $17, 0x10($sp)
/* B7588 001B7488 0000B07F */  sq         $16, 0x0($sp)
/* B758C 001B748C 28A68070 */  paddub     $20, $4, $0
/* B7590 001B7490 289EA070 */  paddub     $19, $5, $0
/* B7594 001B7494 2896C070 */  paddub     $18, $6, $0
/* B7598 001B7498 288EE070 */  paddub     $17, $7, $0
/* B759C 001B749C 28860071 */  paddub     $16, $8, $0
/* B75A0 001B74A0 2A00023C */  lui        $2, %hi(_958)
/* B75A4 001B74A4 70BC4424 */  addiu      $4, $2, %lo(_958)
/* B75A8 001B74A8 282E8072 */  paddub     $5, $20, $0
/* B75AC 001B74AC A611040C */  jal        printf
/* B75B0 001B74B0 00000000 */   nop
/* B75B4 001B74B4 2800812A */  slti       $at, $20, 0x28
/* B75B8 001B74B8 08002010 */  beqz       $at, .L001B74DC
/* B75BC 001B74BC 00000000 */   nop
/* B75C0 001B74C0 28264072 */  paddub     $4, $18, $0
/* B75C4 001B74C4 282E2072 */  paddub     $5, $17, $0
/* B75C8 001B74C8 28368072 */  paddub     $6, $20, $0
/* B75CC 001B74CC 9861050C */  jal        AtraPartsGet__9CSaveDataFii
/* B75D0 001B74D0 00000000 */   nop
/* B75D4 001B74D4 06000010 */  b          .L001B74F0
/* B75D8 001B74D8 00000000 */   nop
.L001B74DC:
/* B75DC 001B74DC D8FF8626 */  addiu      $6, $20, -0x28
/* B75E0 001B74E0 28264072 */  paddub     $4, $18, $0
/* B75E4 001B74E4 282E2072 */  paddub     $5, $17, $0
/* B75E8 001B74E8 D861050C */  jal        AtraChipGet__9CSaveDataFii
/* B75EC 001B74EC 00000000 */   nop
.L001B74F0:
/* B75F0 001B74F0 789C848F */  lw         $4, -0x6388($gp)
/* B75F4 001B74F4 282E2072 */  paddub     $5, $17, $0
/* B75F8 001B74F8 28360072 */  paddub     $6, $16, $0
/* B75FC 001B74FC 283E6072 */  paddub     $7, $19, $0
/* B7600 001B7500 54FE060C */  jal        GetAtraData__14CDngStatusDataFiii
/* B7604 001B7504 00000000 */   nop
/* B7608 001B7508 5000BF7B */  lq         $31, 0x50($sp)
/* B760C 001B750C 4000B47B */  lq         $20, 0x40($sp)
/* B7610 001B7510 3000B37B */  lq         $19, 0x30($sp)
/* B7614 001B7514 2000B27B */  lq         $18, 0x20($sp)
/* B7618 001B7518 1000B17B */  lq         $17, 0x10($sp)
/* B761C 001B751C 0000B07B */  lq         $16, 0x0($sp)
/* B7620 001B7520 6000BD27 */  addiu      $sp, $sp, 0x60
/* B7624 001B7524 0800E003 */  jr         $31
/* B7628 001B7528 00000000 */   nop
/* B762C 001B752C 00000000 */  nop
