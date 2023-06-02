.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DngActiveItemTextureCopy__Fv
/* 12A6A0 0022A5A0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 12A6A4 0022A5A4 2000BF7F */  sq         $31, 0x20($sp)
/* 12A6A8 0022A5A8 1000B17F */  sq         $17, 0x10($sp)
/* 12A6AC 0022A5AC 0000B07F */  sq         $16, 0x0($sp)
/* 12A6B0 0022A5B0 789C828F */  lw         $2, -0x6388($gp)
/* 12A6B4 0022A5B4 60435124 */  addiu      $17, $2, 0x4360
/* 12A6B8 0022A5B8 04002016 */  bnez       $17, .L0022A5CC
/* 12A6BC 0022A5BC 00000000 */   nop
/* 12A6C0 0022A5C0 FFFF0224 */  addiu      $2, $0, -0x1
/* 12A6C4 0022A5C4 31000010 */  b          .L0022A68C
/* 12A6C8 0022A5C8 00000000 */   nop
.L0022A5CC:
/* 12A6CC 0022A5CC 2900023C */  lui        $2, %hi(_1707)
/* 12A6D0 0022A5D0 D0424224 */  addiu      $2, $2, %lo(_1707)
/* 12A6D4 0022A5D4 3000A427 */  addiu      $4, $sp, 0x30
/* 12A6D8 0022A5D8 000043DC */  ld         $3, 0x0($2)
/* 12A6DC 0022A5DC 08004290 */  lbu        $2, 0x8($2)
/* 12A6E0 0022A5E0 000083FC */  sd         $3, 0x0($4)
/* 12A6E4 0022A5E4 080082A0 */  sb         $2, 0x8($4)
/* 12A6E8 0022A5E8 28860070 */  paddub     $16, $0, $0
/* 12A6EC 0022A5EC 23000010 */  b          .L0022A67C
/* 12A6F0 0022A5F0 00000000 */   nop
.L0022A5F4:
/* 12A6F4 0022A5F4 40101000 */  sll        $2, $16, 1
/* 12A6F8 0022A5F8 21105100 */  addu       $2, $2, $17
/* 12A6FC 0022A5FC 02004484 */  lh         $4, 0x2($2)
/* 12A700 0022A600 84008228 */  slti       $2, $4, 0x84
/* 12A704 0022A604 1C004014 */  bnez       $2, .L0022A678
/* 12A708 0022A608 00000000 */   nop
/* 12A70C 0022A60C 7443070C */  jal        GetCommonItemInfo__Fi
/* 12A710 0022A610 00000000 */   nop
/* 12A714 0022A614 18004010 */  beqz       $2, .L0022A678
/* 12A718 0022A618 00000000 */   nop
/* 12A71C 0022A61C 04004384 */  lh         $3, 0x4($2)
/* 12A720 0022A620 15006004 */  bltz       $3, .L0022A678
/* 12A724 0022A624 00000000 */   nop
/* 12A728 0022A628 01016128 */  slti       $at, $3, 0x101
/* 12A72C 0022A62C 12002010 */  beqz       $at, .L0022A678
/* 12A730 0022A630 00000000 */   nop
/* 12A734 0022A634 07006230 */  andi       $2, $3, 0x7
/* 12A738 0022A638 04006104 */  bgez       $3, .L0022A64C
/* 12A73C 0022A63C 00000000 */   nop
/* 12A740 0022A640 02004010 */  beqz       $2, .L0022A64C
/* 12A744 0022A644 00000000 */   nop
/* 12A748 0022A648 F8FF4224 */  addiu      $2, $2, -0x8
.L0022A64C:
/* 12A74C 0022A64C 40290200 */  sll        $5, $2, 5
/* 12A750 0022A650 C3100300 */  sra        $2, $3, 3
/* 12A754 0022A654 40310200 */  sll        $6, $2, 5
/* 12A758 0022A658 40111000 */  sll        $2, $16, 5
/* 12A75C 0022A65C 20004824 */  addiu      $8, $2, 0x20
/* 12A760 0022A660 3000A427 */  addiu      $4, $sp, 0x30
/* 12A764 0022A664 2A00023C */  lui        $2, %hi(_1728_2)
/* 12A768 0022A668 40F04724 */  addiu      $7, $2, %lo(_1728_2)
/* 12A76C 0022A66C 284E0070 */  paddub     $9, $0, $0
/* 12A770 0022A670 BCC7060C */  jal        setItemToReserved__FPciiPcii
/* 12A774 0022A674 00000000 */   nop
.L0022A678:
/* 12A778 0022A678 01001026 */  addiu      $16, $16, 0x1
.L0022A67C:
/* 12A77C 0022A67C 0300022A */  slti       $2, $16, 0x3
/* 12A780 0022A680 DCFF4014 */  bnez       $2, .L0022A5F4
/* 12A784 0022A684 00000000 */   nop
/* 12A788 0022A688 01000224 */  addiu      $2, $0, 0x1
.L0022A68C:
/* 12A78C 0022A68C 2000BF7B */  lq         $31, 0x20($sp)
/* 12A790 0022A690 1000B17B */  lq         $17, 0x10($sp)
/* 12A794 0022A694 0000B07B */  lq         $16, 0x0($sp)
/* 12A798 0022A698 4000BD27 */  addiu      $sp, $sp, 0x40
/* 12A79C 0022A69C 0800E003 */  jr         $31
/* 12A7A0 0022A6A0 00000000 */   nop
/* 12A7A4 0022A6A4 00000000 */  nop
/* 12A7A8 0022A6A8 00000000 */  nop
/* 12A7AC 0022A6AC 00000000 */  nop
