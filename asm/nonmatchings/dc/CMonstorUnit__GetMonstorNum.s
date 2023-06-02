.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetMonstorNum__12CMonstorUnitFv
/* D7B40 001D7A40 28160070 */  paddub     $2, $0, $0
/* D7B44 001D7A44 28360070 */  paddub     $6, $0, $0
/* D7B48 001D7A48 0F000010 */  b          .L001D7A88
/* D7B4C 001D7A4C 00000000 */   nop
.L001D7A50:
/* D7B50 001D7A50 80180600 */  sll        $3, $6, 2
/* D7B54 001D7A54 21286600 */  addu       $5, $3, $6
/* D7B58 001D7A58 80180500 */  sll        $3, $5, 2
/* D7B5C 001D7A5C 2118A300 */  addu       $3, $5, $3
/* D7B60 001D7A60 00190300 */  sll        $3, $3, 4
/* D7B64 001D7A64 21186400 */  addu       $3, $3, $4
/* D7B68 001D7A68 0200013C */  lui        $at, (0x20000 >> 16)
/* D7B6C 001D7A6C 21086100 */  addu       $at, $3, $at
/* D7B70 001D7A70 D0E3258C */  lw         $5, -0x1C30($at)
/* D7B74 001D7A74 FFFF0324 */  addiu      $3, $0, -0x1
/* D7B78 001D7A78 0200A310 */  beq        $5, $3, .L001D7A84
/* D7B7C 001D7A7C 00000000 */   nop
/* D7B80 001D7A80 01004224 */  addiu      $2, $2, 0x1
.L001D7A84:
/* D7B84 001D7A84 0100C624 */  addiu      $6, $6, 0x1
.L001D7A88:
/* D7B88 001D7A88 1000C328 */  slti       $3, $6, 0x10
/* D7B8C 001D7A8C F0FF6014 */  bnez       $3, .L001D7A50
/* D7B90 001D7A90 00000000 */   nop
/* D7B94 001D7A94 0800E003 */  jr         $31
/* D7B98 001D7A98 00000000 */   nop
/* D7B9C 001D7A9C 00000000 */  nop
