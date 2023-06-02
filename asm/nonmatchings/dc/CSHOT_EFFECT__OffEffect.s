.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel OffEffect__12CSHOT_EFFECTFi
/* ACD10 001ACC10 FFFF0324 */  addiu      $3, $0, -0x1
/* ACD14 001ACC14 0800A310 */  beq        $5, $3, .L001ACC38
/* ACD18 001ACC18 00000000 */   nop
/* ACD1C 001ACC1C 40180500 */  sll        $3, $5, 1
/* ACD20 001ACC20 21186400 */  addu       $3, $3, $4
/* ACD24 001ACC24 0100013C */  lui        $at, (0x10000 >> 16)
/* ACD28 001ACC28 21086100 */  addu       $at, $3, $at
/* ACD2C 001ACC2C 00A020A4 */  sh         $0, -0x6000($at)
/* ACD30 001ACC30 0D000010 */  b          .L001ACC68
/* ACD34 001ACC34 00000000 */   nop
.L001ACC38:
/* ACD38 001ACC38 282E0070 */  paddub     $5, $0, $0
/* ACD3C 001ACC3C 07000010 */  b          .L001ACC5C
/* ACD40 001ACC40 00000000 */   nop
.L001ACC44:
/* ACD44 001ACC44 40180500 */  sll        $3, $5, 1
/* ACD48 001ACC48 21186400 */  addu       $3, $3, $4
/* ACD4C 001ACC4C 0100013C */  lui        $at, (0x10000 >> 16)
/* ACD50 001ACC50 21086100 */  addu       $at, $3, $at
/* ACD54 001ACC54 00A020A4 */  sh         $0, -0x6000($at)
/* ACD58 001ACC58 0100A524 */  addiu      $5, $5, 0x1
.L001ACC5C:
/* ACD5C 001ACC5C 0800A328 */  slti       $3, $5, 0x8
/* ACD60 001ACC60 F8FF6014 */  bnez       $3, .L001ACC44
/* ACD64 001ACC64 00000000 */   nop
.L001ACC68:
/* ACD68 001ACC68 0800E003 */  jr         $31
/* ACD6C 001ACC6C 00000000 */   nop
