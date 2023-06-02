.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Draw__13CDranMapFieldFv
/* CD820 001CD720 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* CD824 001CD724 2000BF7F */  sq         $31, 0x20($sp)
/* CD828 001CD728 1000B17F */  sq         $17, 0x10($sp)
/* CD82C 001CD72C 0000B07F */  sq         $16, 0x0($sp)
/* CD830 001CD730 288E8070 */  paddub     $17, $4, $0
/* CD834 001CD734 0100013C */  lui        $at, (0x10000 >> 16)
/* CD838 001CD738 21088100 */  addu       $at, $4, $at
/* CD83C 001CD73C A0D4238C */  lw         $3, -0x2B60($at)
/* CD840 001CD740 1C006010 */  beqz       $3, .L001CD7B4
/* CD844 001CD744 00000000 */   nop
/* CD848 001CD748 28860070 */  paddub     $16, $0, $0
/* CD84C 001CD74C 13000010 */  b          .L001CD79C
/* CD850 001CD750 00000000 */   nop
.L001CD754:
/* CD854 001CD754 B0110324 */  addiu      $3, $0, 0x11B0
/* CD858 001CD758 18180302 */  mult       $3, $16, $3
/* CD85C 001CD75C 21207100 */  addu       $4, $3, $17
/* CD860 001CD760 BC00838C */  lw         $3, 0xBC($4)
/* CD864 001CD764 0C006010 */  beqz       $3, .L001CD798
/* CD868 001CD768 00000000 */   nop
/* CD86C 001CD76C 80181000 */  sll        $3, $16, 2
/* CD870 001CD770 21187100 */  addu       $3, $3, $17
/* CD874 001CD774 0100013C */  lui        $at, (0x10000 >> 16)
/* CD878 001CD778 21086100 */  addu       $at, $3, $at
/* CD87C 001CD77C 70D4238C */  lw         $3, -0x2B90($at)
/* CD880 001CD780 05006010 */  beqz       $3, .L001CD798
/* CD884 001CD784 00000000 */   nop
/* CD888 001CD788 A000998C */  lw         $25, 0xA0($4)
/* CD88C 001CD78C AC00398F */  lw         $25, 0xAC($25)
/* CD890 001CD790 09F82003 */  jalr       $25
/* CD894 001CD794 00000000 */   nop
.L001CD798:
/* CD898 001CD798 01001026 */  addiu      $16, $16, 0x1
.L001CD79C:
/* CD89C 001CD79C 0100013C */  lui        $at, (0x10000 >> 16)
/* CD8A0 001CD7A0 21082102 */  addu       $at, $17, $at
/* CD8A4 001CD7A4 A0D4238C */  lw         $3, -0x2B60($at)
/* CD8A8 001CD7A8 2A180302 */  slt        $3, $16, $3
/* CD8AC 001CD7AC E9FF6014 */  bnez       $3, .L001CD754
/* CD8B0 001CD7B0 00000000 */   nop
.L001CD7B4:
/* CD8B4 001CD7B4 2000BF7B */  lq         $31, 0x20($sp)
/* CD8B8 001CD7B8 1000B17B */  lq         $17, 0x10($sp)
/* CD8BC 001CD7BC 0000B07B */  lq         $16, 0x0($sp)
/* CD8C0 001CD7C0 3000BD27 */  addiu      $sp, $sp, 0x30
/* CD8C4 001CD7C4 0800E003 */  jr         $31
/* CD8C8 001CD7C8 00000000 */   nop
/* CD8CC 001CD7CC 00000000 */  nop
