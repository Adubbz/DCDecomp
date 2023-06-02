.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetCopyAtraList__14CDngStatusDataFiiPi
/* BF9F0 001BF8F0 06000324 */  addiu      $3, $0, 0x6
/* BF9F4 001BF8F4 1300A310 */  beq        $5, $3, .L001BF944
/* BF9F8 001BF8F8 00000000 */   nop
/* BF9FC 001BF8FC 284E0070 */  paddub     $9, $0, $0
/* BFA00 001BF900 0D000010 */  b          .L001BF938
/* BFA04 001BF904 00000000 */   nop
.L001BF908:
/* BFA08 001BF908 80500900 */  sll        $10, $9, 2
/* BFA0C 001BF90C 80180500 */  sll        $3, $5, 2
/* BFA10 001BF910 21186500 */  addu       $3, $3, $5
/* BFA14 001BF914 001A0300 */  sll        $3, $3, 8
/* BFA18 001BF918 21406400 */  addu       $8, $3, $4
/* BFA1C 001BF91C 40190600 */  sll        $3, $6, 5
/* BFA20 001BF920 21186800 */  addu       $3, $3, $8
/* BFA24 001BF924 21184301 */  addu       $3, $10, $3
/* BFA28 001BF928 7802688C */  lw         $8, 0x278($3)
/* BFA2C 001BF92C 2118EA00 */  addu       $3, $7, $10
/* BFA30 001BF930 000068AC */  sw         $8, 0x0($3)
/* BFA34 001BF934 01002925 */  addiu      $9, $9, 0x1
.L001BF938:
/* BFA38 001BF938 08002329 */  slti       $3, $9, 0x8
/* BFA3C 001BF93C F2FF6014 */  bnez       $3, .L001BF908
/* BFA40 001BF940 00000000 */   nop
.L001BF944:
/* BFA44 001BF944 0800E003 */  jr         $31
/* BFA48 001BF948 00000000 */   nop
/* BFA4C 001BF94C 00000000 */  nop
