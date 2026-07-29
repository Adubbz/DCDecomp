.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel OffEffect__12CSHOT_EFFECTFi
/* 0ACD10 001ACC10 FFFF0324 */  addiu       $3, $0, -0x1
/* 0ACD14 001ACC14 0800A310 */  beq         $5, $3, .L001ACC38
/* 0ACD18 001ACC18 00000000 */   nop
/* 0ACD1C 001ACC1C 40180500 */  sll         $3, $5, 1
/* 0ACD20 001ACC20 21186400 */  addu        $3, $3, $4
/* 0ACD24 001ACC24 0100013C */  lui         $1, (0x10000 >> 16)
/* 0ACD28 001ACC28 21086100 */  addu        $1, $3, $1
/* 0ACD2C 001ACC2C 00A020A4 */  sh          $0, -0x6000($1)
/* 0ACD30 001ACC30 0D000010 */  b           .L001ACC68
/* 0ACD34 001ACC34 00000000 */   nop
.L001ACC38:
/* 0ACD38 001ACC38 282E0070 */  paddub      $5, $0, $0
/* 0ACD3C 001ACC3C 07000010 */  b           .L001ACC5C
/* 0ACD40 001ACC40 00000000 */   nop
.L001ACC44:
/* 0ACD44 001ACC44 40180500 */  sll         $3, $5, 1
/* 0ACD48 001ACC48 21186400 */  addu        $3, $3, $4
/* 0ACD4C 001ACC4C 0100013C */  lui         $1, (0x10000 >> 16)
/* 0ACD50 001ACC50 21086100 */  addu        $1, $3, $1
/* 0ACD54 001ACC54 00A020A4 */  sh          $0, -0x6000($1)
/* 0ACD58 001ACC58 0100A524 */  addiu       $5, $5, 0x1
.L001ACC5C:
/* 0ACD5C 001ACC5C 0800A328 */  slti        $3, $5, 0x8
/* 0ACD60 001ACC60 F8FF6014 */  bnez        $3, .L001ACC44
/* 0ACD64 001ACC64 00000000 */   nop
.L001ACC68:
/* 0ACD68 001ACC68 0800E003 */  jr          $31
/* 0ACD6C 001ACC6C 00000000 */   nop
