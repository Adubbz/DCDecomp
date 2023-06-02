.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ShopSpecialFunc__Fv
/* EBB20 001EBA20 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* EBB24 001EBA24 1000BF7F */  sq         $31, 0x10($sp)
/* EBB28 001EBA28 0000B07F */  sq         $16, 0x0($sp)
/* EBB2C 001EBA2C D901013C */  lui        $at, (0x1D900D0 >> 16)
/* EBB30 001EBA30 D0002484 */  lh         $4, (0x1D900D0 & 0xFFFF)($at)
/* EBB34 001EBA34 01000324 */  addiu      $3, $0, 0x1
/* EBB38 001EBA38 3E008314 */  bne        $4, $3, .L001EBB34
/* EBB3C 001EBA3C 00000000 */   nop
/* EBB40 001EBA40 282E0070 */  paddub     $5, $0, $0
/* EBB44 001EBA44 8494838F */  lw         $3, -0x6B7C($gp)
/* EBB48 001EBA48 0C456724 */  addiu      $7, $3, 0x450C
/* EBB4C 001EBA4C 28360070 */  paddub     $6, $0, $0
/* EBB50 001EBA50 0D000010 */  b          .L001EBA88
/* EBB54 001EBA54 00000000 */   nop
.L001EBA58:
/* EBB58 001EBA58 40190600 */  sll        $3, $6, 5
/* EBB5C 001EBA5C 23186600 */  subu       $3, $3, $6
/* EBB60 001EBA60 C0180300 */  sll        $3, $3, 3
/* EBB64 001EBA64 2118E300 */  addu       $3, $7, $3
/* EBB68 001EBA68 00006484 */  lh         $4, 0x0($3)
/* EBB6C 001EBA6C 05000324 */  addiu      $3, $0, 0x5
/* EBB70 001EBA70 04008314 */  bne        $4, $3, .L001EBA84
/* EBB74 001EBA74 00000000 */   nop
/* EBB78 001EBA78 01000524 */  addiu      $5, $0, 0x1
/* EBB7C 001EBA7C 05000010 */  b          .L001EBA94
/* EBB80 001EBA80 00000000 */   nop
.L001EBA84:
/* EBB84 001EBA84 0100C624 */  addiu      $6, $6, 0x1
.L001EBA88:
/* EBB88 001EBA88 0A00C328 */  slti       $3, $6, 0xA
/* EBB8C 001EBA8C F2FF6014 */  bnez       $3, .L001EBA58
/* EBB90 001EBA90 00000000 */   nop
.L001EBA94:
/* EBB94 001EBA94 D901013C */  lui        $at, (0x1D90290 >> 16)
/* EBB98 001EBA98 90022484 */  lh         $4, (0x1D90290 & 0xFFFF)($at)
/* EBB9C 001EBA9C 05000324 */  addiu      $3, $0, 0x5
/* EBBA0 001EBAA0 02008314 */  bne        $4, $3, .L001EBAAC
/* EBBA4 001EBAA4 00000000 */   nop
/* EBBA8 001EBAA8 01000524 */  addiu      $5, $0, 0x1
.L001EBAAC:
/* EBBAC 001EBAAC 2100A010 */  beqz       $5, .L001EBB34
/* EBBB0 001EBAB0 00000000 */   nop
/* EBBB4 001EBAB4 28360070 */  paddub     $6, $0, $0
/* EBBB8 001EBAB8 1B000010 */  b          .L001EBB28
/* EBBBC 001EBABC 00000000 */   nop
.L001EBAC0:
/* EBBC0 001EBAC0 80190600 */  sll        $3, $6, 6
/* EBBC4 001EBAC4 23186600 */  subu       $3, $3, $6
/* EBBC8 001EBAC8 80200300 */  sll        $4, $3, 2
/* EBBCC 001EBACC A094838F */  lw         $3, -0x6B60($gp)
/* EBBD0 001EBAD0 21206400 */  addu       $4, $3, $4
/* EBBD4 001EBAD4 00008584 */  lh         $5, 0x0($4)
/* EBBD8 001EBAD8 05000324 */  addiu      $3, $0, 0x5
/* EBBDC 001EBADC 1100A314 */  bne        $5, $3, .L001EBB24
/* EBBE0 001EBAE0 00000000 */   nop
/* EBBE4 001EBAE4 80800600 */  sll        $16, $6, 2
/* EBBE8 001EBAE8 9094838F */  lw         $3, -0x6B70($gp)
/* EBBEC 001EBAEC 21187000 */  addu       $3, $3, $16
/* EBBF0 001EBAF0 0000658C */  lw         $5, 0x0($3)
/* EBBF4 001EBAF4 01000324 */  addiu      $3, $0, 0x1
/* EBBF8 001EBAF8 0A00A314 */  bne        $5, $3, .L001EBB24
/* EBBFC 001EBAFC 00000000 */   nop
/* EBC00 001EBB00 282E0070 */  paddub     $5, $0, $0
/* EBC04 001EBB04 FC000624 */  addiu      $6, $0, 0xFC
/* EBC08 001EBB08 5A0D040C */  jal        memset
/* EBC0C 001EBB0C 00000000 */   nop
/* EBC10 001EBB10 9094838F */  lw         $3, -0x6B70($gp)
/* EBC14 001EBB14 21187000 */  addu       $3, $3, $16
/* EBC18 001EBB18 000060AC */  sw         $0, 0x0($3)
/* EBC1C 001EBB1C 05000010 */  b          .L001EBB34
/* EBC20 001EBB20 00000000 */   nop
.L001EBB24:
/* EBC24 001EBB24 0100C624 */  addiu      $6, $6, 0x1
.L001EBB28:
/* EBC28 001EBB28 1E00C328 */  slti       $3, $6, 0x1E
/* EBC2C 001EBB2C E4FF6014 */  bnez       $3, .L001EBAC0
/* EBC30 001EBB30 00000000 */   nop
.L001EBB34:
/* EBC34 001EBB34 1000BF7B */  lq         $31, 0x10($sp)
/* EBC38 001EBB38 0000B07B */  lq         $16, 0x0($sp)
/* EBC3C 001EBB3C 2000BD27 */  addiu      $sp, $sp, 0x20
/* EBC40 001EBB40 0800E003 */  jr         $31
/* EBC44 001EBB44 00000000 */   nop
/* EBC48 001EBB48 00000000 */  nop
/* EBC4C 001EBB4C 00000000 */  nop
