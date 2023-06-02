.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceDmaSendI
/* C9B8 0010C8B8 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* C9BC 0010C8BC 4000B4FF */  sd         $20, 0x40($sp)
/* C9C0 0010C8C0 3000B3FF */  sd         $19, 0x30($sp)
/* C9C4 0010C8C4 2DA0C000 */  daddu      $20, $6, $0
/* C9C8 0010C8C8 1000B1FF */  sd         $17, 0x10($sp)
/* C9CC 0010C8CC 2D98A000 */  daddu      $19, $5, $0
/* C9D0 0010C8D0 0000B0FF */  sd         $16, 0x0($sp)
/* C9D4 0010C8D4 0001113C */  lui        $17, %hi(GlobalDataBuffer + 0xD54F7F)
/* C9D8 0010C8D8 5000BFFF */  sd         $31, 0x50($sp)
/* C9DC 0010C8DC 2D808000 */  daddu      $16, $4, $0
/* C9E0 0010C8E0 2000B2FF */  sd         $18, 0x20($sp)
/* C9E4 0010C8E4 0000028E */  lw         $2, 0x0($16)
/* C9E8 0010C8E8 00014230 */  andi       $2, $2, 0x100
/* C9EC 0010C8EC 18004010 */  beqz       $2, .L0010C950
/* C9F0 0010C8F0 2900123C */   lui       $18, %hi(D_002973B0)
/* C9F4 0010C8F4 FFFF3126 */  addiu      $17, $17, %lo(GlobalDataBuffer + (0xD54F7F & 0xFFFF))
.L0010C8F8:
/* C9F8 0010C8F8 11002106 */  bgez       $17, .L0010C940
/* C9FC 0010C8FC 00000000 */   nop
/* CA00 0010C900 A611040C */  jal        printf
/* CA04 0010C904 B0734426 */   addiu     $4, $18, %lo(D_002973B0)
/* CA08 0010C908 0000048E */  lw         $4, 0x0($16)
/* CA0C 0010C90C 02120400 */  srl        $2, $4, 8
/* CA10 0010C910 01004230 */  andi       $2, $2, 0x1
/* CA14 0010C914 0A004010 */  beqz       $2, .L0010C940
/* CA18 0010C918 00000000 */   nop
/* CA1C 0010C91C FFFE0524 */  addiu      $5, $0, -0x101
.L0010C920:
/* CA20 0010C920 24188500 */  and        $3, $4, $5
/* CA24 0010C924 2D100000 */  daddu      $2, $0, $0
/* CA28 0010C928 2D206000 */  daddu      $4, $3, $0
/* CA2C 0010C92C 00000000 */  nop
/* CA30 0010C930 00000000 */  nop
/* CA34 0010C934 FAFF4014 */  bnez       $2, .L0010C920
/* CA38 0010C938 00000000 */   nop
/* CA3C 0010C93C 000003AE */  sw         $3, 0x0($16)
.L0010C940:
/* CA40 0010C940 0000028E */  lw         $2, 0x0($16)
/* CA44 0010C944 00014230 */  andi       $2, $2, 0x100
/* CA48 0010C948 EBFF4014 */  bnez       $2, .L0010C8F8
/* CA4C 0010C94C FFFF3126 */   addiu     $17, $17, -0x1
.L0010C950:
/* CA50 0010C950 FFFF023C */  lui        $2, (0xFFFFFFFF >> 16)
/* CA54 0010C954 1000038E */  lw         $3, 0x10($16)
/* CA58 0010C958 FFFF4234 */  ori        $2, $2, (0xFFFFFFFF & 0xFFFF)
/* CA5C 0010C95C 01006254 */  bnel       $3, $2, .L0010C964
/* CA60 0010C960 100013AE */   sw        $19, 0x10($16)
.L0010C964:
/* CA64 0010C964 0000028E */  lw         $2, 0x0($16)
/* CA68 0010C968 F3FF0324 */  addiu      $3, $0, -0xD
/* CA6C 0010C96C 200014AE */  sw         $20, 0x20($16)
/* CA70 0010C970 24104300 */  and        $2, $2, $3
/* CA74 0010C974 5000BFDF */  ld         $31, 0x50($sp)
/* CA78 0010C978 09014234 */  ori        $2, $2, 0x109
/* CA7C 0010C97C 4000B4DF */  ld         $20, 0x40($sp)
/* CA80 0010C980 000002AE */  sw         $2, 0x0($16)
/* CA84 0010C984 3000B3DF */  ld         $19, 0x30($sp)
/* CA88 0010C988 2000B2DF */  ld         $18, 0x20($sp)
/* CA8C 0010C98C 1000B1DF */  ld         $17, 0x10($sp)
/* CA90 0010C990 0000B0DF */  ld         $16, 0x0($sp)
/* CA94 0010C994 0800E003 */  jr         $31
/* CA98 0010C998 6000BD27 */   addiu     $sp, $sp, 0x60
/* CA9C 0010C99C 00000000 */  nop
