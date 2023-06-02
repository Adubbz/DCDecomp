.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Initialize__10CStealItemFP9CFrameVu1
/* D75E0 001D74E0 000085AC */  sw         $5, 0x0($4)
/* D75E4 001D74E4 28360070 */  paddub     $6, $0, $0
/* D75E8 001D74E8 07000010 */  b          .L001D7508
/* D75EC 001D74EC 00000000 */   nop
.L001D74F0:
/* D75F0 001D74F0 FFFF0524 */  addiu      $5, $0, -0x1
/* D75F4 001D74F4 80180600 */  sll        $3, $6, 2
/* D75F8 001D74F8 21186400 */  addu       $3, $3, $4
/* D75FC 001D74FC D00065AC */  sw         $5, 0xD0($3)
/* D7600 001D7500 F00065AC */  sw         $5, 0xF0($3)
/* D7604 001D7504 0100C624 */  addiu      $6, $6, 0x1
.L001D7508:
/* D7608 001D7508 0800C328 */  slti       $3, $6, 0x8
/* D760C 001D750C F8FF6014 */  bnez       $3, .L001D74F0
/* D7610 001D7510 00000000 */   nop
/* D7614 001D7514 0800E003 */  jr         $31
/* D7618 001D7518 00000000 */   nop
/* D761C 001D751C 00000000 */  nop
