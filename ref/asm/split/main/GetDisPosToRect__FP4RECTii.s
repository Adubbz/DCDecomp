.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetDisPosToRect__FP4RECTii
/* 04CA00 0014C900 F0FFBD27 */  addiu       $29, $29, -0x10
/* 04CA04 0014C904 0000BF7F */  sq          $31, 0x0($29)
/* 04CA08 0014C908 0800828C */  lw          $2, 0x8($4)
/* 04CA0C 0014C90C 43180200 */  sra         $3, $2, 1
/* 04CA10 0014C910 0000828C */  lw          $2, 0x0($4)
/* 04CA14 0014C914 21104300 */  addu        $2, $2, $3
/* 04CA18 0014C918 23104500 */  subu        $2, $2, $5
/* 04CA1C 0014C91C 00008244 */  mtc1        $2, $f0
/* 04CA20 0014C920 00000000 */  nop
/* 04CA24 0014C924 60008046 */  cvt.s.w     $f1, $f0
/* 04CA28 0014C928 0C00828C */  lw          $2, 0xC($4)
/* 04CA2C 0014C92C 43180200 */  sra         $3, $2, 1
/* 04CA30 0014C930 0400828C */  lw          $2, 0x4($4)
/* 04CA34 0014C934 21104300 */  addu        $2, $2, $3
/* 04CA38 0014C938 23104600 */  subu        $2, $2, $6
/* 04CA3C 0014C93C 00008244 */  mtc1        $2, $f0
/* 04CA40 0014C940 00000000 */  nop
/* 04CA44 0014C944 20008046 */  cvt.s.w     $f0, $f0
/* 04CA48 0014C948 1A080146 */  mula.s      $f1, $f1
/* 04CA4C 0014C94C 1C030046 */  madd.s      $f12, $f0, $f0
/* 04CA50 0014C950 9044040C */  jal         fptodp
/* 04CA54 0014C954 00000000 */   nop
/* 04CA58 0014C958 28264070 */  paddub      $4, $2, $0
/* 04CA5C 0014C95C CC76040C */  jal         sqrt
/* 04CA60 0014C960 00000000 */   nop
/* 04CA64 0014C964 28264070 */  paddub      $4, $2, $0
/* 04CA68 0014C968 9241040C */  jal         dptofp
/* 04CA6C 0014C96C 00000000 */   nop
/* 04CA70 0014C970 0000BF7B */  lq          $31, 0x0($29)
/* 04CA74 0014C974 1000BD27 */  addiu       $29, $29, 0x10
/* 04CA78 0014C978 0800E003 */  jr          $31
/* 04CA7C 0014C97C 00000000 */   nop
