.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Step__13CDranMapFieldFv
/* CD8D0 001CD7D0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* CD8D4 001CD7D4 4000BF7F */  sq         $31, 0x40($sp)
/* CD8D8 001CD7D8 3000B37F */  sq         $19, 0x30($sp)
/* CD8DC 001CD7DC 2000B27F */  sq         $18, 0x20($sp)
/* CD8E0 001CD7E0 1000B17F */  sq         $17, 0x10($sp)
/* CD8E4 001CD7E4 0000B07F */  sq         $16, 0x0($sp)
/* CD8E8 001CD7E8 289E8070 */  paddub     $19, $4, $0
/* CD8EC 001CD7EC 0100013C */  lui        $at, (0x10000 >> 16)
/* CD8F0 001CD7F0 21088100 */  addu       $at, $4, $at
/* CD8F4 001CD7F4 A0D4238C */  lw         $3, -0x2B60($at)
/* CD8F8 001CD7F8 3A006010 */  beqz       $3, .L001CD8E4
/* CD8FC 001CD7FC 00000000 */   nop
/* CD900 001CD800 28860070 */  paddub     $16, $0, $0
/* CD904 001CD804 31000010 */  b          .L001CD8CC
/* CD908 001CD808 00000000 */   nop
.L001CD80C:
/* CD90C 001CD80C B0110324 */  addiu      $3, $0, 0x11B0
/* CD910 001CD810 18900302 */  mult       $18, $16, $3
/* CD914 001CD814 21185302 */  addu       $3, $18, $19
/* CD918 001CD818 BC00638C */  lw         $3, 0xBC($3)
/* CD91C 001CD81C 2A006010 */  beqz       $3, .L001CD8C8
/* CD920 001CD820 00000000 */   nop
/* CD924 001CD824 80181000 */  sll        $3, $16, 2
/* CD928 001CD828 21187300 */  addu       $3, $3, $19
/* CD92C 001CD82C 78547124 */  addiu      $17, $3, 0x5478
/* CD930 001CD830 F87F3126 */  addiu      $17, $17, 0x7FF8
/* CD934 001CD834 0000248E */  lw         $4, 0x0($17)
/* CD938 001CD838 23008018 */  blez       $4, .L001CD8C8
/* CD93C 001CD83C 00000000 */   nop
/* CD940 001CD840 02000324 */  addiu      $3, $0, 0x2
/* CD944 001CD844 09008314 */  bne        $4, $3, .L001CD86C
/* CD948 001CD848 00000000 */   nop
/* CD94C 001CD84C C9060424 */  addiu      $4, $0, 0x6C9
/* CD950 001CD850 FFFF0524 */  addiu      $5, $0, -0x1
/* CD954 001CD854 28360070 */  paddub     $6, $0, $0
/* CD958 001CD858 AC69050C */  jal        SndSePlay__Fiii
/* CD95C 001CD85C 00000000 */   nop
/* CD960 001CD860 0000238E */  lw         $3, 0x0($17)
/* CD964 001CD864 FFFF6324 */  addiu      $3, $3, -0x1
/* CD968 001CD868 000023AE */  sw         $3, 0x0($17)
.L001CD86C:
/* CD96C 001CD86C 0000248E */  lw         $4, 0x0($17)
/* CD970 001CD870 01000324 */  addiu      $3, $0, 0x1
/* CD974 001CD874 14008314 */  bne        $4, $3, .L001CD8C8
/* CD978 001CD878 00000000 */   nop
/* CD97C 001CD87C 21907202 */  addu       $18, $19, $18
/* CD980 001CD880 28264072 */  paddub     $4, $18, $0
/* CD984 001CD884 A000598E */  lw         $25, 0xA0($18)
/* CD988 001CD888 0800398F */  lw         $25, 0x8($25)
/* CD98C 001CD88C 09F82003 */  jalr       $25
/* CD990 001CD890 00000000 */   nop
/* CD994 001CD894 28264072 */  paddub     $4, $18, $0
/* CD998 001CD898 38E1040C */  jal        GetNowTime__10CCharacterFv
/* CD99C 001CD89C 00000000 */   nop
/* CD9A0 001CD8A0 6C42033C */  lui        $3, (0x426C0000 >> 16)
/* CD9A4 001CD8A4 00088344 */  mtc1       $3, $f1
/* CD9A8 001CD8A8 00000000 */  nop
/* CD9AC 001CD8AC 34000146 */  c.lt.s     $f0, $f1
/* CD9B0 001CD8B0 00000000 */  nop
/* CD9B4 001CD8B4 04000145 */  bc1t       .L001CD8C8
/* CD9B8 001CD8B8 00000000 */   nop
/* CD9BC 001CD8BC 0000238E */  lw         $3, 0x0($17)
/* CD9C0 001CD8C0 FFFF6324 */  addiu      $3, $3, -0x1
/* CD9C4 001CD8C4 000023AE */  sw         $3, 0x0($17)
.L001CD8C8:
/* CD9C8 001CD8C8 01001026 */  addiu      $16, $16, 0x1
.L001CD8CC:
/* CD9CC 001CD8CC 0100013C */  lui        $at, (0x10000 >> 16)
/* CD9D0 001CD8D0 21086102 */  addu       $at, $19, $at
/* CD9D4 001CD8D4 A0D4238C */  lw         $3, -0x2B60($at)
/* CD9D8 001CD8D8 2A180302 */  slt        $3, $16, $3
/* CD9DC 001CD8DC CBFF6014 */  bnez       $3, .L001CD80C
/* CD9E0 001CD8E0 00000000 */   nop
.L001CD8E4:
/* CD9E4 001CD8E4 4000BF7B */  lq         $31, 0x40($sp)
/* CD9E8 001CD8E8 3000B37B */  lq         $19, 0x30($sp)
/* CD9EC 001CD8EC 2000B27B */  lq         $18, 0x20($sp)
/* CD9F0 001CD8F0 1000B17B */  lq         $17, 0x10($sp)
/* CD9F4 001CD8F4 0000B07B */  lq         $16, 0x0($sp)
/* CD9F8 001CD8F8 5000BD27 */  addiu      $sp, $sp, 0x50
/* CD9FC 001CD8FC 0800E003 */  jr         $31
/* CDA00 001CD900 00000000 */   nop
/* CDA04 001CD904 00000000 */  nop
/* CDA08 001CD908 00000000 */  nop
/* CDA0C 001CD90C 00000000 */  nop
