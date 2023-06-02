.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceDmaSendN
/* C8D0 0010C7D0 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* C8D4 0010C7D4 4000B4FF */  sd         $20, 0x40($sp)
/* C8D8 0010C7D8 3000B3FF */  sd         $19, 0x30($sp)
/* C8DC 0010C7DC 2DA0C000 */  daddu      $20, $6, $0
/* C8E0 0010C7E0 1000B1FF */  sd         $17, 0x10($sp)
/* C8E4 0010C7E4 2D98A000 */  daddu      $19, $5, $0
/* C8E8 0010C7E8 0000B0FF */  sd         $16, 0x0($sp)
/* C8EC 0010C7EC 0001113C */  lui        $17, %hi(GlobalDataBuffer + 0xD54F7F)
/* C8F0 0010C7F0 5000BFFF */  sd         $31, 0x50($sp)
/* C8F4 0010C7F4 2D808000 */  daddu      $16, $4, $0
/* C8F8 0010C7F8 2000B2FF */  sd         $18, 0x20($sp)
/* C8FC 0010C7FC 0000028E */  lw         $2, 0x0($16)
/* C900 0010C800 00014230 */  andi       $2, $2, 0x100
/* C904 0010C804 18004010 */  beqz       $2, .L0010C868
/* C908 0010C808 2900123C */   lui       $18, %hi(D_002973B0)
/* C90C 0010C80C FFFF3126 */  addiu      $17, $17, %lo(GlobalDataBuffer + (0xD54F7F & 0xFFFF))
.L0010C810:
/* C910 0010C810 11002106 */  bgez       $17, .L0010C858
/* C914 0010C814 00000000 */   nop
/* C918 0010C818 A611040C */  jal        printf
/* C91C 0010C81C B0734426 */   addiu     $4, $18, %lo(D_002973B0)
/* C920 0010C820 0000048E */  lw         $4, 0x0($16)
/* C924 0010C824 02120400 */  srl        $2, $4, 8
/* C928 0010C828 01004230 */  andi       $2, $2, 0x1
/* C92C 0010C82C 0A004010 */  beqz       $2, .L0010C858
/* C930 0010C830 00000000 */   nop
/* C934 0010C834 FFFE0524 */  addiu      $5, $0, -0x101
.L0010C838:
/* C938 0010C838 24188500 */  and        $3, $4, $5
/* C93C 0010C83C 2D100000 */  daddu      $2, $0, $0
/* C940 0010C840 2D206000 */  daddu      $4, $3, $0
/* C944 0010C844 00000000 */  nop
/* C948 0010C848 00000000 */  nop
/* C94C 0010C84C FAFF4014 */  bnez       $2, .L0010C838
/* C950 0010C850 00000000 */   nop
/* C954 0010C854 000003AE */  sw         $3, 0x0($16)
.L0010C858:
/* C958 0010C858 0000028E */  lw         $2, 0x0($16)
/* C95C 0010C85C 00014230 */  andi       $2, $2, 0x100
/* C960 0010C860 EBFF4014 */  bnez       $2, .L0010C810
/* C964 0010C864 FFFF3126 */   addiu     $17, $17, -0x1
.L0010C868:
/* C968 0010C868 FFFF023C */  lui        $2, (0xFFFFFFFF >> 16)
/* C96C 0010C86C 1000038E */  lw         $3, 0x10($16)
/* C970 0010C870 FFFF4234 */  ori        $2, $2, (0xFFFFFFFF & 0xFFFF)
/* C974 0010C874 01006254 */  bnel       $3, $2, .L0010C87C
/* C978 0010C878 100013AE */   sw        $19, 0x10($16)
.L0010C87C:
/* C97C 0010C87C 0000028E */  lw         $2, 0x0($16)
/* C980 0010C880 F3FF0324 */  addiu      $3, $0, -0xD
/* C984 0010C884 200014AE */  sw         $20, 0x20($16)
/* C988 0010C888 24104300 */  and        $2, $2, $3
/* C98C 0010C88C 5000BFDF */  ld         $31, 0x50($sp)
/* C990 0010C890 01014234 */  ori        $2, $2, 0x101
/* C994 0010C894 4000B4DF */  ld         $20, 0x40($sp)
/* C998 0010C898 000002AE */  sw         $2, 0x0($16)
/* C99C 0010C89C 3000B3DF */  ld         $19, 0x30($sp)
/* C9A0 0010C8A0 2000B2DF */  ld         $18, 0x20($sp)
/* C9A4 0010C8A4 1000B1DF */  ld         $17, 0x10($sp)
/* C9A8 0010C8A8 0000B0DF */  ld         $16, 0x0($sp)
/* C9AC 0010C8AC 0800E003 */  jr         $31
/* C9B0 0010C8B0 6000BD27 */   addiu     $sp, $sp, 0x60
/* C9B4 0010C8B4 00000000 */  nop
