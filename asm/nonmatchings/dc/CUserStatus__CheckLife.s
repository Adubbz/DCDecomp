.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckLife__11CUserStatusFv
/* BE990 001BE890 04008280 */  lb         $2, 0x4($4)
/* BE994 001BE894 40280200 */  sll        $5, $2, 1
/* BE998 001BE898 2118A400 */  addu       $3, $5, $4
/* BE99C 001BE89C 0100013C */  lui        $at, (0x10000 >> 16)
/* BE9A0 001BE8A0 21086100 */  addu       $at, $3, $at
/* BE9A4 001BE8A4 688A2284 */  lh         $2, -0x7598($at)
/* BE9A8 001BE8A8 09004010 */  beqz       $2, .L001BE8D0
/* BE9AC 001BE8AC 00000000 */   nop
/* BE9B0 001BE8B0 0100013C */  lui        $at, (0x10000 >> 16)
/* BE9B4 001BE8B4 21086100 */  addu       $at, $3, $at
/* BE9B8 001BE8B8 5C8A2284 */  lh         $2, -0x75A4($at)
/* BE9BC 001BE8BC 0400401C */  bgtz       $2, .L001BE8D0
/* BE9C0 001BE8C0 00000000 */   nop
/* BE9C4 001BE8C4 28160070 */  paddub     $2, $0, $0
/* BE9C8 001BE8C8 09000010 */  b          .L001BE8F0
/* BE9CC 001BE8CC 00000000 */   nop
.L001BE8D0:
/* BE9D0 001BE8D0 2110A400 */  addu       $2, $5, $4
/* BE9D4 001BE8D4 12004284 */  lh         $2, 0x12($2)
/* BE9D8 001BE8D8 0400401C */  bgtz       $2, .L001BE8EC
/* BE9DC 001BE8DC 00000000 */   nop
/* BE9E0 001BE8E0 28160070 */  paddub     $2, $0, $0
/* BE9E4 001BE8E4 02000010 */  b          .L001BE8F0
/* BE9E8 001BE8E8 00000000 */   nop
.L001BE8EC:
/* BE9EC 001BE8EC 01000224 */  addiu      $2, $0, 0x1
.L001BE8F0:
/* BE9F0 001BE8F0 0800E003 */  jr         $31
/* BE9F4 001BE8F4 00000000 */   nop
/* BE9F8 001BE8F8 00000000 */  nop
/* BE9FC 001BE8FC 00000000 */  nop
