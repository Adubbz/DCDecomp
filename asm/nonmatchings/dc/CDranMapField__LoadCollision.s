.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoadCollision__13CDranMapFieldFPUiP14CDataAlloc2_1_
/* CD710 001CD610 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* CD714 001CD614 1000BF7F */  sq         $31, 0x10($sp)
/* CD718 001CD618 0000B07F */  sq         $16, 0x0($sp)
/* CD71C 001CD61C 28868070 */  paddub     $16, $4, $0
/* CD720 001CD620 0100013C */  lui        $at, (0x10000 >> 16)
/* CD724 001CD624 21088100 */  addu       $at, $4, $at
/* CD728 001CD628 A4D4228C */  lw         $2, -0x2B5C($at)
/* CD72C 001CD62C 0C004128 */  slti       $at, $2, 0xC
/* CD730 001CD630 32002010 */  beqz       $at, .L001CD6FC
/* CD734 001CD634 00000000 */   nop
/* CD738 001CD638 2826A070 */  paddub     $4, $5, $0
/* CD73C 001CD63C 282EC070 */  paddub     $5, $6, $0
/* CD740 001CD640 DC9B040C */  jal        LoadCollisionFile__FPUiP14CDataAlloc2_1_
/* CD744 001CD644 00000000 */   nop
/* CD748 001CD648 0100013C */  lui        $at, (0x10000 >> 16)
/* CD74C 001CD64C 21080102 */  addu       $at, $16, $at
/* CD750 001CD650 A4D4238C */  lw         $3, -0x2B5C($at)
/* CD754 001CD654 80180300 */  sll        $3, $3, 2
/* CD758 001CD658 21187000 */  addu       $3, $3, $16
/* CD75C 001CD65C 0100013C */  lui        $at, (0x10000 >> 16)
/* CD760 001CD660 21086100 */  addu       $at, $3, $at
/* CD764 001CD664 40D422AC */  sw         $2, -0x2BC0($at)
/* CD768 001CD668 00608044 */  mtc1       $0, $f12
/* CD76C 001CD66C 00000000 */  nop
/* CD770 001CD670 46630046 */  mov.s      $f13, $f12
/* CD774 001CD674 86630046 */  mov.s      $f14, $f12
/* CD778 001CD678 0100013C */  lui        $at, (0x10000 >> 16)
/* CD77C 001CD67C 21080102 */  addu       $at, $16, $at
/* CD780 001CD680 A4D4228C */  lw         $2, -0x2B5C($at)
/* CD784 001CD684 80100200 */  sll        $2, $2, 2
/* CD788 001CD688 21105000 */  addu       $2, $2, $16
/* CD78C 001CD68C 0100013C */  lui        $at, (0x10000 >> 16)
/* CD790 001CD690 21084100 */  addu       $at, $2, $at
/* CD794 001CD694 40D4248C */  lw         $4, -0x2BC0($at)
/* CD798 001CD698 A09F040C */  jal        SetPosition__6CFrameFfff
/* CD79C 001CD69C 00000000 */   nop
/* CD7A0 001CD6A0 0100013C */  lui        $at, (0x10000 >> 16)
/* CD7A4 001CD6A4 21080102 */  addu       $at, $16, $at
/* CD7A8 001CD6A8 A4D4228C */  lw         $2, -0x2B5C($at)
/* CD7AC 001CD6AC 80100200 */  sll        $2, $2, 2
/* CD7B0 001CD6B0 21105000 */  addu       $2, $2, $16
/* CD7B4 001CD6B4 00608044 */  mtc1       $0, $f12
/* CD7B8 001CD6B8 00000000 */  nop
/* CD7BC 001CD6BC 46630046 */  mov.s      $f13, $f12
/* CD7C0 001CD6C0 86630046 */  mov.s      $f14, $f12
/* CD7C4 001CD6C4 0100013C */  lui        $at, (0x10000 >> 16)
/* CD7C8 001CD6C8 21084100 */  addu       $at, $2, $at
/* CD7CC 001CD6CC 40D4248C */  lw         $4, -0x2BC0($at)
/* CD7D0 001CD6D0 70A3040C */  jal        SetRotation__6CFrameFfff
/* CD7D4 001CD6D4 00000000 */   nop
/* CD7D8 001CD6D8 0100013C */  lui        $at, (0x10000 >> 16)
/* CD7DC 001CD6DC 21080102 */  addu       $at, $16, $at
/* CD7E0 001CD6E0 A4D4238C */  lw         $3, -0x2B5C($at)
/* CD7E4 001CD6E4 01006324 */  addiu      $3, $3, 0x1
/* CD7E8 001CD6E8 0100013C */  lui        $at, (0x10000 >> 16)
/* CD7EC 001CD6EC 21080102 */  addu       $at, $16, $at
/* CD7F0 001CD6F0 A4D423AC */  sw         $3, -0x2B5C($at)
/* CD7F4 001CD6F4 05000010 */  b          .L001CD70C
/* CD7F8 001CD6F8 00000000 */   nop
.L001CD6FC:
/* CD7FC 001CD6FC 2A00023C */  lui        $2, %hi(_3606)
/* CD800 001CD700 D0BF4424 */  addiu      $4, $2, %lo(_3606)
/* CD804 001CD704 A611040C */  jal        printf
/* CD808 001CD708 00000000 */   nop
.L001CD70C:
/* CD80C 001CD70C 1000BF7B */  lq         $31, 0x10($sp)
/* CD810 001CD710 0000B07B */  lq         $16, 0x0($sp)
/* CD814 001CD714 2000BD27 */  addiu      $sp, $sp, 0x20
/* CD818 001CD718 0800E003 */  jr         $31
/* CD81C 001CD71C 00000000 */   nop
