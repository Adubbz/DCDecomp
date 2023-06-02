.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _LOOKAT__FP12RS_STACKDATAi
/* E5580 001E5480 20FFBD27 */  addiu      $sp, $sp, -0xE0
/* E5584 001E5484 3000BF7F */  sq         $31, 0x30($sp)
/* E5588 001E5488 2000B27F */  sq         $18, 0x20($sp)
/* E558C 001E548C 1000B17F */  sq         $17, 0x10($sp)
/* E5590 001E5490 0000B07F */  sq         $16, 0x0($sp)
/* E5594 001E5494 E09C828F */  lw         $2, -0x6320($gp)
/* E5598 001E5498 9000518C */  lw         $17, 0x90($2)
/* E559C 001E549C 08008524 */  addiu      $5, $4, 0x8
/* E55A0 001E54A0 A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E55A4 001E54A4 00000000 */   nop
/* E55A8 001E54A8 E09C848F */  lw         $4, -0x6320($gp)
/* E55AC 001E54AC 80101100 */  sll        $2, $17, 2
/* E55B0 001E54B0 21185100 */  addu       $3, $2, $17
/* E55B4 001E54B4 80100300 */  sll        $2, $3, 2
/* E55B8 001E54B8 21106200 */  addu       $2, $3, $2
/* E55BC 001E54BC 00910200 */  sll        $18, $2, 4
/* E55C0 001E54C0 21104402 */  addu       $2, $18, $4
/* E55C4 001E54C4 0200013C */  lui        $at, (0x20000 >> 16)
/* E55C8 001E54C8 21084100 */  addu       $at, $2, $at
/* E55CC 001E54CC 40E420E4 */  swc1       $f0, -0x1BC0($at)
/* E55D0 001E54D0 2826A070 */  paddub     $4, $5, $0
/* E55D4 001E54D4 08008524 */  addiu      $5, $4, 0x8
/* E55D8 001E54D8 A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E55DC 001E54DC 00000000 */   nop
/* E55E0 001E54E0 E09C828F */  lw         $2, -0x6320($gp)
/* E55E4 001E54E4 21104202 */  addu       $2, $18, $2
/* E55E8 001E54E8 0200013C */  lui        $at, (0x20000 >> 16)
/* E55EC 001E54EC 21084100 */  addu       $at, $2, $at
/* E55F0 001E54F0 44E420E4 */  swc1       $f0, -0x1BBC($at)
/* E55F4 001E54F4 2826A070 */  paddub     $4, $5, $0
/* E55F8 001E54F8 08008524 */  addiu      $5, $4, 0x8
/* E55FC 001E54FC A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E5600 001E5500 00000000 */   nop
/* E5604 001E5504 E09C828F */  lw         $2, -0x6320($gp)
/* E5608 001E5508 21104202 */  addu       $2, $18, $2
/* E560C 001E550C 0200013C */  lui        $at, (0x20000 >> 16)
/* E5610 001E5510 21084100 */  addu       $at, $2, $at
/* E5614 001E5514 48E420E4 */  swc1       $f0, -0x1BB8($at)
/* E5618 001E5518 2826A070 */  paddub     $4, $5, $0
/* E561C 001E551C 9085070C */  jal        GetStackInt__FP12RS_STACKDATA_3
/* E5620 001E5520 00000000 */   nop
/* E5624 001E5524 28864070 */  paddub     $16, $2, $0
/* E5628 001E5528 6000A427 */  addiu      $4, $sp, 0x60
/* E562C 001E552C 2A86040C */  jal        sceVu0UnitMatrix
/* E5630 001E5530 00000000 */   nop
/* E5634 001E5534 10350224 */  addiu      $2, $0, 0x3510
/* E5638 001E5538 18882202 */  mult       $17, $17, $2
/* E563C 001E553C E09C828F */  lw         $2, -0x6320($gp)
/* E5640 001E5540 21105100 */  addu       $2, $2, $17
/* E5644 001E5544 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* E5648 001E5548 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* E564C 001E554C 21204100 */  addu       $4, $2, $at
/* E5650 001E5550 4000A527 */  addiu      $5, $sp, 0x40
/* E5654 001E5554 A000998C */  lw         $25, 0xA0($4)
/* E5658 001E5558 A000398F */  lw         $25, 0xA0($25)
/* E565C 001E555C 09F82003 */  jalr       $25
/* E5660 001E5560 00000000 */   nop
/* E5664 001E5564 E09C828F */  lw         $2, -0x6320($gp)
/* E5668 001E5568 21105100 */  addu       $2, $2, $17
/* E566C 001E556C 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* E5670 001E5570 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* E5674 001E5574 21204100 */  addu       $4, $2, $at
/* E5678 001E5578 5000A527 */  addiu      $5, $sp, 0x50
/* E567C 001E557C A000998C */  lw         $25, 0xA0($4)
/* E5680 001E5580 5800398F */  lw         $25, 0x58($25)
/* E5684 001E5584 09F82003 */  jalr       $25
/* E5688 001E5588 00000000 */   nop
/* E568C 001E558C E09C828F */  lw         $2, -0x6320($gp)
/* E5690 001E5590 21102202 */  addu       $2, $17, $2
/* E5694 001E5594 0200013C */  lui        $at, (0x20000 >> 16)
/* E5698 001E5598 21084100 */  addu       $at, $2, $at
/* E569C 001E559C 8CFD228C */  lw         $2, -0x274($at)
/* E56A0 001E55A0 6000A427 */  addiu      $4, $sp, 0x60
/* E56A4 001E55A4 D0014524 */  addiu      $5, $2, 0x1D0
/* E56A8 001E55A8 1086040C */  jal        sceVu0CopyMatrix
/* E56AC 001E55AC 00000000 */   nop
/* E56B0 001E55B0 E09C828F */  lw         $2, -0x6320($gp)
/* E56B4 001E55B4 21105200 */  addu       $2, $2, $18
/* E56B8 001E55B8 A000A427 */  addiu      $4, $sp, 0xA0
/* E56BC 001E55BC 0100013C */  lui        $at, (0x1E440 >> 16)
/* E56C0 001E55C0 40E42134 */  ori        $at, $at, (0x1E440 & 0xFFFF)
/* E56C4 001E55C4 21284100 */  addu       $5, $2, $at
/* E56C8 001E55C8 4000A627 */  addiu      $6, $sp, 0x40
/* E56CC 001E55CC EE85040C */  jal        sceVu0SubVector
/* E56D0 001E55D0 00000000 */   nop
/* E56D4 001E55D4 24000016 */  bnez       $16, .L001E5668
/* E56D8 001E55D8 00000000 */   nop
/* E56DC 001E55DC B000A427 */  addiu      $4, $sp, 0xB0
/* E56E0 001E55E0 A000A527 */  addiu      $5, $sp, 0xA0
/* E56E4 001E55E4 9285040C */  jal        sceVu0Normalize
/* E56E8 001E55E8 00000000 */   nop
/* E56EC 001E55EC 7000B227 */  addiu      $18, $sp, 0x70
/* E56F0 001E55F0 D000A427 */  addiu      $4, $sp, 0xD0
/* E56F4 001E55F4 B000A527 */  addiu      $5, $sp, 0xB0
/* E56F8 001E55F8 28364072 */  paddub     $6, $18, $0
/* E56FC 001E55FC 8085040C */  jal        sceVu0OuterProduct
/* E5700 001E5600 00000000 */   nop
/* E5704 001E5604 C000A427 */  addiu      $4, $sp, 0xC0
/* E5708 001E5608 B000A527 */  addiu      $5, $sp, 0xB0
/* E570C 001E560C D000A627 */  addiu      $6, $sp, 0xD0
/* E5710 001E5610 8085040C */  jal        sceVu0OuterProduct
/* E5714 001E5614 00000000 */   nop
/* E5718 001E5618 6000A427 */  addiu      $4, $sp, 0x60
/* E571C 001E561C B000A527 */  addiu      $5, $sp, 0xB0
/* E5720 001E5620 0C86040C */  jal        sceVu0CopyVector
/* E5724 001E5624 00000000 */   nop
/* E5728 001E5628 28264072 */  paddub     $4, $18, $0
/* E572C 001E562C C000A527 */  addiu      $5, $sp, 0xC0
/* E5730 001E5630 0C86040C */  jal        sceVu0CopyVector
/* E5734 001E5634 00000000 */   nop
/* E5738 001E5638 8000A427 */  addiu      $4, $sp, 0x80
/* E573C 001E563C D000A527 */  addiu      $5, $sp, 0xD0
/* E5740 001E5640 0C86040C */  jal        sceVu0CopyVector
/* E5744 001E5644 00000000 */   nop
/* E5748 001E5648 E09C828F */  lw         $2, -0x6320($gp)
/* E574C 001E564C 21102202 */  addu       $2, $17, $2
/* E5750 001E5650 0200013C */  lui        $at, (0x20000 >> 16)
/* E5754 001E5654 21084100 */  addu       $at, $2, $at
/* E5758 001E5658 8CFD248C */  lw         $4, -0x274($at)
/* E575C 001E565C 6000A527 */  addiu      $5, $sp, 0x60
/* E5760 001E5660 58A1040C */  jal        SetTransMatrix__6CFrameFPA4_f
/* E5764 001E5664 00000000 */   nop
.L001E5668:
/* E5768 001E5668 01000224 */  addiu      $2, $0, 0x1
/* E576C 001E566C 24000216 */  bne        $16, $2, .L001E5700
/* E5770 001E5670 00000000 */   nop
/* E5774 001E5674 C000A427 */  addiu      $4, $sp, 0xC0
/* E5778 001E5678 A000A527 */  addiu      $5, $sp, 0xA0
/* E577C 001E567C 9285040C */  jal        sceVu0Normalize
/* E5780 001E5680 00000000 */   nop
/* E5784 001E5684 8000B227 */  addiu      $18, $sp, 0x80
/* E5788 001E5688 B000A427 */  addiu      $4, $sp, 0xB0
/* E578C 001E568C C000A527 */  addiu      $5, $sp, 0xC0
/* E5790 001E5690 28364072 */  paddub     $6, $18, $0
/* E5794 001E5694 8085040C */  jal        sceVu0OuterProduct
/* E5798 001E5698 00000000 */   nop
/* E579C 001E569C D000A427 */  addiu      $4, $sp, 0xD0
/* E57A0 001E56A0 B000A527 */  addiu      $5, $sp, 0xB0
/* E57A4 001E56A4 28368070 */  paddub     $6, $4, $0
/* E57A8 001E56A8 8085040C */  jal        sceVu0OuterProduct
/* E57AC 001E56AC 00000000 */   nop
/* E57B0 001E56B0 6000A427 */  addiu      $4, $sp, 0x60
/* E57B4 001E56B4 B000A527 */  addiu      $5, $sp, 0xB0
/* E57B8 001E56B8 0C86040C */  jal        sceVu0CopyVector
/* E57BC 001E56BC 00000000 */   nop
/* E57C0 001E56C0 7000A427 */  addiu      $4, $sp, 0x70
/* E57C4 001E56C4 C000A527 */  addiu      $5, $sp, 0xC0
/* E57C8 001E56C8 0C86040C */  jal        sceVu0CopyVector
/* E57CC 001E56CC 00000000 */   nop
/* E57D0 001E56D0 28264072 */  paddub     $4, $18, $0
/* E57D4 001E56D4 D000A527 */  addiu      $5, $sp, 0xD0
/* E57D8 001E56D8 0C86040C */  jal        sceVu0CopyVector
/* E57DC 001E56DC 00000000 */   nop
/* E57E0 001E56E0 E09C828F */  lw         $2, -0x6320($gp)
/* E57E4 001E56E4 21102202 */  addu       $2, $17, $2
/* E57E8 001E56E8 0200013C */  lui        $at, (0x20000 >> 16)
/* E57EC 001E56EC 21084100 */  addu       $at, $2, $at
/* E57F0 001E56F0 8CFD248C */  lw         $4, -0x274($at)
/* E57F4 001E56F4 6000A527 */  addiu      $5, $sp, 0x60
/* E57F8 001E56F8 58A1040C */  jal        SetTransMatrix__6CFrameFPA4_f
/* E57FC 001E56FC 00000000 */   nop
.L001E5700:
/* E5800 001E5700 02000224 */  addiu      $2, $0, 0x2
/* E5804 001E5704 24000216 */  bne        $16, $2, .L001E5798
/* E5808 001E5708 00000000 */   nop
/* E580C 001E570C D000A427 */  addiu      $4, $sp, 0xD0
/* E5810 001E5710 A000A527 */  addiu      $5, $sp, 0xA0
/* E5814 001E5714 9285040C */  jal        sceVu0Normalize
/* E5818 001E5718 00000000 */   nop
/* E581C 001E571C 7000B027 */  addiu      $16, $sp, 0x70
/* E5820 001E5720 B000A427 */  addiu      $4, $sp, 0xB0
/* E5824 001E5724 D000A527 */  addiu      $5, $sp, 0xD0
/* E5828 001E5728 28360072 */  paddub     $6, $16, $0
/* E582C 001E572C 8085040C */  jal        sceVu0OuterProduct
/* E5830 001E5730 00000000 */   nop
/* E5834 001E5734 C000A427 */  addiu      $4, $sp, 0xC0
/* E5838 001E5738 B000A527 */  addiu      $5, $sp, 0xB0
/* E583C 001E573C D000A627 */  addiu      $6, $sp, 0xD0
/* E5840 001E5740 8085040C */  jal        sceVu0OuterProduct
/* E5844 001E5744 00000000 */   nop
/* E5848 001E5748 6000A427 */  addiu      $4, $sp, 0x60
/* E584C 001E574C B000A527 */  addiu      $5, $sp, 0xB0
/* E5850 001E5750 0C86040C */  jal        sceVu0CopyVector
/* E5854 001E5754 00000000 */   nop
/* E5858 001E5758 28260072 */  paddub     $4, $16, $0
/* E585C 001E575C C000A527 */  addiu      $5, $sp, 0xC0
/* E5860 001E5760 0C86040C */  jal        sceVu0CopyVector
/* E5864 001E5764 00000000 */   nop
/* E5868 001E5768 8000A427 */  addiu      $4, $sp, 0x80
/* E586C 001E576C D000A527 */  addiu      $5, $sp, 0xD0
/* E5870 001E5770 0C86040C */  jal        sceVu0CopyVector
/* E5874 001E5774 00000000 */   nop
/* E5878 001E5778 E09C828F */  lw         $2, -0x6320($gp)
/* E587C 001E577C 21102202 */  addu       $2, $17, $2
/* E5880 001E5780 0200013C */  lui        $at, (0x20000 >> 16)
/* E5884 001E5784 21084100 */  addu       $at, $2, $at
/* E5888 001E5788 8CFD248C */  lw         $4, -0x274($at)
/* E588C 001E578C 6000A527 */  addiu      $5, $sp, 0x60
/* E5890 001E5790 58A1040C */  jal        SetTransMatrix__6CFrameFPA4_f
/* E5894 001E5794 00000000 */   nop
.L001E5798:
/* E5898 001E5798 01000224 */  addiu      $2, $0, 0x1
/* E589C 001E579C 3000BF7B */  lq         $31, 0x30($sp)
/* E58A0 001E57A0 2000B27B */  lq         $18, 0x20($sp)
/* E58A4 001E57A4 1000B17B */  lq         $17, 0x10($sp)
/* E58A8 001E57A8 0000B07B */  lq         $16, 0x0($sp)
/* E58AC 001E57AC E000BD27 */  addiu      $sp, $sp, 0xE0
/* E58B0 001E57B0 0800E003 */  jr         $31
/* E58B4 001E57B4 00000000 */   nop
/* E58B8 001E57B8 00000000 */  nop
/* E58BC 001E57BC 00000000 */  nop
