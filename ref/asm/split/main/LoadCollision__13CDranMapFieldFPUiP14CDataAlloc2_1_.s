.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadCollision__13CDranMapFieldFPUiP14CDataAlloc2_1_
/* 0CD710 001CD610 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0CD714 001CD614 1000BF7F */  sq          $31, 0x10($29)
/* 0CD718 001CD618 0000B07F */  sq          $16, 0x0($29)
/* 0CD71C 001CD61C 28868070 */  paddub      $16, $4, $0
/* 0CD720 001CD620 0100013C */  lui         $1, (0x10000 >> 16)
/* 0CD724 001CD624 21088100 */  addu        $1, $4, $1
/* 0CD728 001CD628 A4D4228C */  lw          $2, -0x2B5C($1)
/* 0CD72C 001CD62C 0C004128 */  slti        $1, $2, 0xC
/* 0CD730 001CD630 32002010 */  beqz        $1, .L001CD6FC
/* 0CD734 001CD634 00000000 */   nop
/* 0CD738 001CD638 2826A070 */  paddub      $4, $5, $0
/* 0CD73C 001CD63C 282EC070 */  paddub      $5, $6, $0
/* 0CD740 001CD640 DC9B040C */  jal         LoadCollisionFile__FPUiP14CDataAlloc2_1_
/* 0CD744 001CD644 00000000 */   nop
/* 0CD748 001CD648 0100013C */  lui         $1, (0x10000 >> 16)
/* 0CD74C 001CD64C 21080102 */  addu        $1, $16, $1
/* 0CD750 001CD650 A4D4238C */  lw          $3, -0x2B5C($1)
/* 0CD754 001CD654 80180300 */  sll         $3, $3, 2
/* 0CD758 001CD658 21187000 */  addu        $3, $3, $16
/* 0CD75C 001CD65C 0100013C */  lui         $1, (0x10000 >> 16)
/* 0CD760 001CD660 21086100 */  addu        $1, $3, $1
/* 0CD764 001CD664 40D422AC */  sw          $2, -0x2BC0($1)
/* 0CD768 001CD668 00608044 */  mtc1        $0, $f12
/* 0CD76C 001CD66C 00000000 */  nop
/* 0CD770 001CD670 46630046 */  mov.s       $f13, $f12
/* 0CD774 001CD674 86630046 */  mov.s       $f14, $f12
/* 0CD778 001CD678 0100013C */  lui         $1, (0x10000 >> 16)
/* 0CD77C 001CD67C 21080102 */  addu        $1, $16, $1
/* 0CD780 001CD680 A4D4228C */  lw          $2, -0x2B5C($1)
/* 0CD784 001CD684 80100200 */  sll         $2, $2, 2
/* 0CD788 001CD688 21105000 */  addu        $2, $2, $16
/* 0CD78C 001CD68C 0100013C */  lui         $1, (0x10000 >> 16)
/* 0CD790 001CD690 21084100 */  addu        $1, $2, $1
/* 0CD794 001CD694 40D4248C */  lw          $4, -0x2BC0($1)
/* 0CD798 001CD698 A09F040C */  jal         SetPosition__6CFrameFfff
/* 0CD79C 001CD69C 00000000 */   nop
/* 0CD7A0 001CD6A0 0100013C */  lui         $1, (0x10000 >> 16)
/* 0CD7A4 001CD6A4 21080102 */  addu        $1, $16, $1
/* 0CD7A8 001CD6A8 A4D4228C */  lw          $2, -0x2B5C($1)
/* 0CD7AC 001CD6AC 80100200 */  sll         $2, $2, 2
/* 0CD7B0 001CD6B0 21105000 */  addu        $2, $2, $16
/* 0CD7B4 001CD6B4 00608044 */  mtc1        $0, $f12
/* 0CD7B8 001CD6B8 00000000 */  nop
/* 0CD7BC 001CD6BC 46630046 */  mov.s       $f13, $f12
/* 0CD7C0 001CD6C0 86630046 */  mov.s       $f14, $f12
/* 0CD7C4 001CD6C4 0100013C */  lui         $1, (0x10000 >> 16)
/* 0CD7C8 001CD6C8 21084100 */  addu        $1, $2, $1
/* 0CD7CC 001CD6CC 40D4248C */  lw          $4, -0x2BC0($1)
/* 0CD7D0 001CD6D0 70A3040C */  jal         SetRotation__6CFrameFfff
/* 0CD7D4 001CD6D4 00000000 */   nop
/* 0CD7D8 001CD6D8 0100013C */  lui         $1, (0x10000 >> 16)
/* 0CD7DC 001CD6DC 21080102 */  addu        $1, $16, $1
/* 0CD7E0 001CD6E0 A4D4238C */  lw          $3, -0x2B5C($1)
/* 0CD7E4 001CD6E4 01006324 */  addiu       $3, $3, 0x1
/* 0CD7E8 001CD6E8 0100013C */  lui         $1, (0x10000 >> 16)
/* 0CD7EC 001CD6EC 21080102 */  addu        $1, $16, $1
/* 0CD7F0 001CD6F0 A4D423AC */  sw          $3, -0x2B5C($1)
/* 0CD7F4 001CD6F4 05000010 */  b           .L001CD70C
/* 0CD7F8 001CD6F8 00000000 */   nop
.L001CD6FC:
/* 0CD7FC 001CD6FC 2A00023C */  lui         $2, %hi(LIT_3606)
/* 0CD800 001CD700 D0BF4424 */  addiu       $4, $2, %lo(LIT_3606)
/* 0CD804 001CD704 A611040C */  jal         printf
/* 0CD808 001CD708 00000000 */   nop
.L001CD70C:
/* 0CD80C 001CD70C 1000BF7B */  lq          $31, 0x10($29)
/* 0CD810 001CD710 0000B07B */  lq          $16, 0x0($29)
/* 0CD814 001CD714 2000BD27 */  addiu       $29, $29, 0x20
/* 0CD818 001CD718 0800E003 */  jr          $31
/* 0CD81C 001CD71C 00000000 */   nop
