.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetAtraData__14CDngStatusDataFiii
/* 0BFA50 001BF950 0600A128 */  slti        $1, $5, 0x6
/* 0BFA54 001BF954 54002010 */  beqz        $1, .L001BFAA8
/* 0BFA58 001BF958 00000000 */   nop
/* 0BFA5C 001BF95C 284E0070 */  paddub      $9, $0, $0
/* 0BFA60 001BF960 24000010 */  b           .L001BF9F4
/* 0BFA64 001BF964 00000000 */   nop
.L001BF968:
/* 0BFA68 001BF968 80180500 */  sll         $3, $5, 2
/* 0BFA6C 001BF96C 21186500 */  addu        $3, $3, $5
/* 0BFA70 001BF970 001A0300 */  sll         $3, $3, 8
/* 0BFA74 001BF974 21406400 */  addu        $8, $3, $4
/* 0BFA78 001BF978 40190600 */  sll         $3, $6, 5
/* 0BFA7C 001BF97C 21406800 */  addu        $8, $3, $8
/* 0BFA80 001BF980 80180900 */  sll         $3, $9, 2
/* 0BFA84 001BF984 21186800 */  addu        $3, $3, $8
/* 0BFA88 001BF988 78026824 */  addiu       $8, $3, 0x278
/* 0BFA8C 001BF98C 7802638C */  lw          $3, 0x278($3)
/* 0BFA90 001BF990 17006714 */  bne         $3, $7, .L001BF9F0
/* 0BFA94 001BF994 00000000 */   nop
/* 0BFA98 001BF998 FDFF0324 */  addiu       $3, $0, -0x3
/* 0BFA9C 001BF99C 000003AD */  sw          $3, 0x0($8)
/* 0BFAA0 001BF9A0 00190500 */  sll         $3, $5, 4
/* 0BFAA4 001BF9A4 23286500 */  subu        $5, $3, $5
/* 0BFAA8 001BF9A8 80180500 */  sll         $3, $5, 2
/* 0BFAAC 001BF9AC 2118A300 */  addu        $3, $5, $3
/* 0BFAB0 001BF9B0 00190300 */  sll         $3, $3, 4
/* 0BFAB4 001BF9B4 21206400 */  addu        $4, $3, $4
/* 0BFAB8 001BF9B8 40180700 */  sll         $3, $7, 1
/* 0BFABC 001BF9BC 21186700 */  addu        $3, $3, $7
/* 0BFAC0 001BF9C0 80180300 */  sll         $3, $3, 2
/* 0BFAC4 001BF9C4 21206400 */  addu        $4, $3, $4
/* 0BFAC8 001BF9C8 8020838C */  lw          $3, 0x2080($4)
/* 0BFACC 001BF9CC FFFF6324 */  addiu       $3, $3, -0x1
/* 0BFAD0 001BF9D0 802083AC */  sw          $3, 0x2080($4)
/* 0BFAD4 001BF9D4 8020838C */  lw          $3, 0x2080($4)
/* 0BFAD8 001BF9D8 03006014 */  bnez        $3, .L001BF9E8
/* 0BFADC 001BF9DC 00000000 */   nop
/* 0BFAE0 001BF9E0 FFFF0324 */  addiu       $3, $0, -0x1
/* 0BFAE4 001BF9E4 782083AC */  sw          $3, 0x2078($4)
.L001BF9E8:
/* 0BFAE8 001BF9E8 2F000010 */  b           .L001BFAA8
/* 0BFAEC 001BF9EC 00000000 */   nop
.L001BF9F0:
/* 0BFAF0 001BF9F0 01002925 */  addiu       $9, $9, 0x1
.L001BF9F4:
/* 0BFAF4 001BF9F4 08002329 */  slti        $3, $9, 0x8
/* 0BFAF8 001BF9F8 DBFF6014 */  bnez        $3, .L001BF968
/* 0BFAFC 001BF9FC 00000000 */   nop
/* 0BFB00 001BFA00 284E0070 */  paddub      $9, $0, $0
/* 0BFB04 001BFA04 25000010 */  b           .L001BFA9C
/* 0BFB08 001BFA08 00000000 */   nop
.L001BFA0C:
/* 0BFB0C 001BFA0C 80180500 */  sll         $3, $5, 2
/* 0BFB10 001BFA10 21186500 */  addu        $3, $3, $5
/* 0BFB14 001BFA14 001A0300 */  sll         $3, $3, 8
/* 0BFB18 001BFA18 21406400 */  addu        $8, $3, $4
/* 0BFB1C 001BFA1C 40190600 */  sll         $3, $6, 5
/* 0BFB20 001BFA20 21406800 */  addu        $8, $3, $8
/* 0BFB24 001BFA24 80180900 */  sll         $3, $9, 2
/* 0BFB28 001BFA28 21186800 */  addu        $3, $3, $8
/* 0BFB2C 001BFA2C 78026A24 */  addiu       $10, $3, 0x278
/* 0BFB30 001BFA30 7802688C */  lw          $8, 0x278($3)
/* 0BFB34 001BFA34 FEFF0324 */  addiu       $3, $0, -0x2
/* 0BFB38 001BFA38 17000315 */  bne         $8, $3, .L001BFA98
/* 0BFB3C 001BFA3C 00000000 */   nop
/* 0BFB40 001BFA40 FDFF0324 */  addiu       $3, $0, -0x3
/* 0BFB44 001BFA44 000043AD */  sw          $3, 0x0($10)
/* 0BFB48 001BFA48 00190500 */  sll         $3, $5, 4
/* 0BFB4C 001BFA4C 23286500 */  subu        $5, $3, $5
/* 0BFB50 001BFA50 80180500 */  sll         $3, $5, 2
/* 0BFB54 001BFA54 2118A300 */  addu        $3, $5, $3
/* 0BFB58 001BFA58 00190300 */  sll         $3, $3, 4
/* 0BFB5C 001BFA5C 21206400 */  addu        $4, $3, $4
/* 0BFB60 001BFA60 40180700 */  sll         $3, $7, 1
/* 0BFB64 001BFA64 21186700 */  addu        $3, $3, $7
/* 0BFB68 001BFA68 80180300 */  sll         $3, $3, 2
/* 0BFB6C 001BFA6C 21206400 */  addu        $4, $3, $4
/* 0BFB70 001BFA70 8020838C */  lw          $3, 0x2080($4)
/* 0BFB74 001BFA74 FFFF6324 */  addiu       $3, $3, -0x1
/* 0BFB78 001BFA78 802083AC */  sw          $3, 0x2080($4)
/* 0BFB7C 001BFA7C 8020838C */  lw          $3, 0x2080($4)
/* 0BFB80 001BFA80 09006014 */  bnez        $3, .L001BFAA8
/* 0BFB84 001BFA84 00000000 */   nop
/* 0BFB88 001BFA88 FFFF0324 */  addiu       $3, $0, -0x1
/* 0BFB8C 001BFA8C 782083AC */  sw          $3, 0x2078($4)
/* 0BFB90 001BFA90 05000010 */  b           .L001BFAA8
/* 0BFB94 001BFA94 00000000 */   nop
.L001BFA98:
/* 0BFB98 001BFA98 01002925 */  addiu       $9, $9, 0x1
.L001BFA9C:
/* 0BFB9C 001BFA9C 08002329 */  slti        $3, $9, 0x8
/* 0BFBA0 001BFAA0 DAFF6014 */  bnez        $3, .L001BFA0C
/* 0BFBA4 001BFAA4 00000000 */   nop
.L001BFAA8:
/* 0BFBA8 001BFAA8 0800E003 */  jr          $31
/* 0BFBAC 001BFAAC 00000000 */   nop
