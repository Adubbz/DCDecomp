.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel AddCollision__13CDranMapFieldFP6CCPolyi7CBoxVu0
/* 0CD610 001CD510 90FFBD27 */  addiu       $29, $29, -0x70
/* 0CD614 001CD514 4000BF7F */  sq          $31, 0x40($29)
/* 0CD618 001CD518 3000B37F */  sq          $19, 0x30($29)
/* 0CD61C 001CD51C 2000B27F */  sq          $18, 0x20($29)
/* 0CD620 001CD520 1000B17F */  sq          $17, 0x10($29)
/* 0CD624 001CD524 0000B07F */  sq          $16, 0x0($29)
/* 0CD628 001CD528 289E8070 */  paddub      $19, $4, $0
/* 0CD62C 001CD52C 2896A070 */  paddub      $18, $5, $0
/* 0CD630 001CD530 288EC070 */  paddub      $17, $6, $0
/* 0CD634 001CD534 5000A527 */  addiu       $5, $29, 0x50
/* 0CD638 001CD538 0000E378 */  lq          $3, 0x0($7)
/* 0CD63C 001CD53C 1000E278 */  lq          $2, 0x10($7)
/* 0CD640 001CD540 0000A37C */  sq          $3, 0x0($5)
/* 0CD644 001CD544 1000A27C */  sq          $2, 0x10($5)
/* 0CD648 001CD548 0100013C */  lui         $1, (0x10000 >> 16)
/* 0CD64C 001CD54C 21088100 */  addu        $1, $4, $1
/* 0CD650 001CD550 A4D4228C */  lw          $2, -0x2B5C($1)
/* 0CD654 001CD554 04004014 */  bnez        $2, .L001CD568
/* 0CD658 001CD558 00000000 */   nop
/* 0CD65C 001CD55C 28162072 */  paddub      $2, $17, $0
/* 0CD660 001CD560 21000010 */  b           .L001CD5E8
/* 0CD664 001CD564 00000000 */   nop
.L001CD568:
/* 0CD668 001CD568 28860070 */  paddub      $16, $0, $0
/* 0CD66C 001CD56C 17000010 */  b           .L001CD5CC
/* 0CD670 001CD570 00000000 */   nop
.L001CD574:
/* 0CD674 001CD574 80101000 */  sll         $2, $16, 2
/* 0CD678 001CD578 21105300 */  addu        $2, $2, $19
/* 0CD67C 001CD57C 0100013C */  lui         $1, (0x10000 >> 16)
/* 0CD680 001CD580 21084100 */  addu        $1, $2, $1
/* 0CD684 001CD584 40D4248C */  lw          $4, -0x2BC0($1)
/* 0CD688 001CD588 0F008010 */  beqz        $4, .L001CD5C8
/* 0CD68C 001CD58C 00000000 */   nop
/* 0CD690 001CD590 0100013C */  lui         $1, (0x10000 >> 16)
/* 0CD694 001CD594 21084100 */  addu        $1, $2, $1
/* 0CD698 001CD598 70D4228C */  lw          $2, -0x2B90($1)
/* 0CD69C 001CD59C 02004128 */  slti        $1, $2, 0x2
/* 0CD6A0 001CD5A0 09002014 */  bnez        $1, .L001CD5C8
/* 0CD6A4 001CD5A4 00000000 */   nop
/* 0CD6A8 001CD5A8 80101100 */  sll         $2, $17, 2
/* 0CD6AC 001CD5AC 21105100 */  addu        $2, $2, $17
/* 0CD6B0 001CD5B0 00110200 */  sll         $2, $2, 4
/* 0CD6B4 001CD5B4 21284202 */  addu        $5, $18, $2
/* 0CD6B8 001CD5B8 5000A627 */  addiu       $6, $29, 0x50
/* 0CD6BC 001CD5BC E4A8040C */  jal         PickUpNearPoly__6CFrameFP6CCPolyRC7CBoxVu0
/* 0CD6C0 001CD5C0 00000000 */   nop
/* 0CD6C4 001CD5C4 21882202 */  addu        $17, $17, $2
.L001CD5C8:
/* 0CD6C8 001CD5C8 01001026 */  addiu       $16, $16, 0x1
.L001CD5CC:
/* 0CD6CC 001CD5CC 0100013C */  lui         $1, (0x10000 >> 16)
/* 0CD6D0 001CD5D0 21086102 */  addu        $1, $19, $1
/* 0CD6D4 001CD5D4 A4D4228C */  lw          $2, -0x2B5C($1)
/* 0CD6D8 001CD5D8 2A100202 */  slt         $2, $16, $2
/* 0CD6DC 001CD5DC E5FF4014 */  bnez        $2, .L001CD574
/* 0CD6E0 001CD5E0 00000000 */   nop
/* 0CD6E4 001CD5E4 28162072 */  paddub      $2, $17, $0
.L001CD5E8:
/* 0CD6E8 001CD5E8 4000BF7B */  lq          $31, 0x40($29)
/* 0CD6EC 001CD5EC 3000B37B */  lq          $19, 0x30($29)
/* 0CD6F0 001CD5F0 2000B27B */  lq          $18, 0x20($29)
/* 0CD6F4 001CD5F4 1000B17B */  lq          $17, 0x10($29)
/* 0CD6F8 001CD5F8 0000B07B */  lq          $16, 0x0($29)
/* 0CD6FC 001CD5FC 7000BD27 */  addiu       $29, $29, 0x70
/* 0CD700 001CD600 0800E003 */  jr          $31
/* 0CD704 001CD604 00000000 */   nop
/* 0CD708 001CD608 00000000 */  nop
/* 0CD70C 001CD60C 00000000 */  nop
