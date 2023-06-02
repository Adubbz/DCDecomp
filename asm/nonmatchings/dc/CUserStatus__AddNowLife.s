.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AddNowLife__11CUserStatusFisf
/* BE810 001BE710 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* BE814 001BE714 3000BF7F */  sq         $31, 0x30($sp)
/* BE818 001BE718 2000B27F */  sq         $18, 0x20($sp)
/* BE81C 001BE71C 1000B17F */  sq         $17, 0x10($sp)
/* BE820 001BE720 0000B07F */  sq         $16, 0x0($sp)
/* BE824 001BE724 40400500 */  sll        $8, $5, 1
/* BE828 001BE728 21380401 */  addu       $7, $8, $4
/* BE82C 001BE72C 700AF024 */  addiu      $16, $7, 0xA70
/* BE830 001BE730 F87F1026 */  addiu      $16, $16, 0x7FF8
/* BE834 001BE734 00000386 */  lh         $3, 0x0($16)
/* BE838 001BE738 06006010 */  beqz       $3, .L001BE754
/* BE83C 001BE73C 00000000 */   nop
/* BE840 001BE740 0100013C */  lui        $at, (0x10000 >> 16)
/* BE844 001BE744 2108E100 */  addu       $at, $7, $at
/* BE848 001BE748 5C8A2384 */  lh         $3, -0x75A4($at)
/* BE84C 001BE74C 1200E3A4 */  sh         $3, 0x12($7)
/* BE850 001BE750 000000A6 */  sh         $0, 0x0($16)
.L001BE754:
/* BE854 001BE754 00008044 */  mtc1       $0, $f0
/* BE858 001BE758 00000000 */  nop
/* BE85C 001BE75C 32000C46 */  c.eq.s     $f0, $f12
/* BE860 001BE760 00000000 */  nop
/* BE864 001BE764 13000045 */  bc1f       .L001BE7B4
/* BE868 001BE768 00000000 */   nop
/* BE86C 001BE76C 21280401 */  addu       $5, $8, $4
/* BE870 001BE770 1200A724 */  addiu      $7, $5, 0x12
/* BE874 001BE774 1200A384 */  lh         $3, 0x12($5)
/* BE878 001BE778 21186600 */  addu       $3, $3, $6
/* BE87C 001BE77C 1200A3A4 */  sh         $3, 0x12($5)
/* BE880 001BE780 1200A384 */  lh         $3, 0x12($5)
/* BE884 001BE784 0200601C */  bgtz       $3, .L001BE790
/* BE888 001BE788 00000000 */   nop
/* BE88C 001BE78C 0000E0A4 */  sh         $0, 0x0($7)
.L001BE790:
/* BE890 001BE790 0000E584 */  lh         $5, 0x0($7)
/* BE894 001BE794 21180401 */  addu       $3, $8, $4
/* BE898 001BE798 06006484 */  lh         $4, 0x6($3)
/* BE89C 001BE79C 2A18A400 */  slt        $3, $5, $4
/* BE8A0 001BE7A0 32006014 */  bnez       $3, .L001BE86C
/* BE8A4 001BE7A4 00000000 */   nop
/* BE8A8 001BE7A8 0000E4A4 */  sh         $4, 0x0($7)
/* BE8AC 001BE7AC 2F000010 */  b          .L001BE86C
/* BE8B0 001BE7B0 00000000 */   nop
.L001BE7B4:
/* BE8B4 001BE7B4 21180401 */  addu       $3, $8, $4
/* BE8B8 001BE7B8 12007224 */  addiu      $18, $3, 0x12
/* BE8BC 001BE7BC 12006284 */  lh         $2, 0x12($3)
/* BE8C0 001BE7C0 21104600 */  addu       $2, $2, $6
/* BE8C4 001BE7C4 640A7124 */  addiu      $17, $3, 0xA64
/* BE8C8 001BE7C8 F87F3126 */  addiu      $17, $17, 0x7FF8
/* BE8CC 001BE7CC 000022A6 */  sh         $2, 0x0($17)
/* BE8D0 001BE7D0 00002286 */  lh         $2, 0x0($17)
/* BE8D4 001BE7D4 0200401C */  bgtz       $2, .L001BE7E0
/* BE8D8 001BE7D8 00000000 */   nop
/* BE8DC 001BE7DC 000020A6 */  sh         $0, 0x0($17)
.L001BE7E0:
/* BE8E0 001BE7E0 00002686 */  lh         $6, 0x0($17)
/* BE8E4 001BE7E4 21100401 */  addu       $2, $8, $4
/* BE8E8 001BE7E8 06004384 */  lh         $3, 0x6($2)
/* BE8EC 001BE7EC 2A10C300 */  slt        $2, $6, $3
/* BE8F0 001BE7F0 02004014 */  bnez       $2, .L001BE7FC
/* BE8F4 001BE7F4 00000000 */   nop
/* BE8F8 001BE7F8 000023A6 */  sh         $3, 0x0($17)
.L001BE7FC:
/* BE8FC 001BE7FC 00002386 */  lh         $3, 0x0($17)
/* BE900 001BE800 00004286 */  lh         $2, 0x0($18)
/* BE904 001BE804 23106200 */  subu       $2, $3, $2
/* BE908 001BE808 00008244 */  mtc1       $2, $f0
/* BE90C 001BE80C 00000000 */  nop
/* BE910 001BE810 60008046 */  cvt.s.w    $f1, $f0
/* BE914 001BE814 C842023C */  lui        $2, (0x42C80000 >> 16)
/* BE918 001BE818 00008244 */  mtc1       $2, $f0
/* BE91C 001BE81C 00000000 */  nop
/* BE920 001BE820 03080046 */  div.s      $f0, $f1, $f0
/* BE924 001BE824 02630046 */  mul.s      $f12, $f12, $f0
/* BE928 001BE828 2C44040C */  jal        fptosi
/* BE92C 001BE82C 00000000 */   nop
/* BE930 001BE830 000002A6 */  sh         $2, 0x0($16)
/* BE934 001BE834 00000386 */  lh         $3, 0x0($16)
/* BE938 001BE838 0C006014 */  bnez       $3, .L001BE86C
/* BE93C 001BE83C 00000000 */   nop
/* BE940 001BE840 00002486 */  lh         $4, 0x0($17)
/* BE944 001BE844 00004386 */  lh         $3, 0x0($18)
/* BE948 001BE848 23188300 */  subu       $3, $4, $3
/* BE94C 001BE84C 05006104 */  bgez       $3, .L001BE864
/* BE950 001BE850 00000000 */   nop
/* BE954 001BE854 FFFF0324 */  addiu      $3, $0, -0x1
/* BE958 001BE858 000003A6 */  sh         $3, 0x0($16)
/* BE95C 001BE85C 03000010 */  b          .L001BE86C
/* BE960 001BE860 00000000 */   nop
.L001BE864:
/* BE964 001BE864 01000324 */  addiu      $3, $0, 0x1
/* BE968 001BE868 000003A6 */  sh         $3, 0x0($16)
.L001BE86C:
/* BE96C 001BE86C 3000BF7B */  lq         $31, 0x30($sp)
/* BE970 001BE870 2000B27B */  lq         $18, 0x20($sp)
/* BE974 001BE874 1000B17B */  lq         $17, 0x10($sp)
/* BE978 001BE878 0000B07B */  lq         $16, 0x0($sp)
/* BE97C 001BE87C 4000BD27 */  addiu      $sp, $sp, 0x40
/* BE980 001BE880 0800E003 */  jr         $31
/* BE984 001BE884 00000000 */   nop
/* BE988 001BE888 00000000 */  nop
/* BE98C 001BE88C 00000000 */  nop
