.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ShopSpecialFunc__Fv
/* 0EBB20 001EBA20 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0EBB24 001EBA24 1000BF7F */  sq          $31, 0x10($29)
/* 0EBB28 001EBA28 0000B07F */  sq          $16, 0x0($29)
/* 0EBB2C 001EBA2C D901013C */  lui         $1, %hi(ShopMenu)
/* 0EBB30 001EBA30 D0002484 */  lh          $4, %lo(ShopMenu)($1)
/* 0EBB34 001EBA34 01000324 */  addiu       $3, $0, 0x1
/* 0EBB38 001EBA38 3E008314 */  bne         $4, $3, .L001EBB34
/* 0EBB3C 001EBA3C 00000000 */   nop
/* 0EBB40 001EBA40 282E0070 */  paddub      $5, $0, $0
/* 0EBB44 001EBA44 8494838F */  lw          $3, -0x6B7C($28)
/* 0EBB48 001EBA48 0C456724 */  addiu       $7, $3, 0x450C
/* 0EBB4C 001EBA4C 28360070 */  paddub      $6, $0, $0
/* 0EBB50 001EBA50 0D000010 */  b           .L001EBA88
/* 0EBB54 001EBA54 00000000 */   nop
.L001EBA58:
/* 0EBB58 001EBA58 40190600 */  sll         $3, $6, 5
/* 0EBB5C 001EBA5C 23186600 */  subu        $3, $3, $6
/* 0EBB60 001EBA60 C0180300 */  sll         $3, $3, 3
/* 0EBB64 001EBA64 2118E300 */  addu        $3, $7, $3
/* 0EBB68 001EBA68 00006484 */  lh          $4, 0x0($3)
/* 0EBB6C 001EBA6C 05000324 */  addiu       $3, $0, 0x5
/* 0EBB70 001EBA70 04008314 */  bne         $4, $3, .L001EBA84
/* 0EBB74 001EBA74 00000000 */   nop
/* 0EBB78 001EBA78 01000524 */  addiu       $5, $0, 0x1
/* 0EBB7C 001EBA7C 05000010 */  b           .L001EBA94
/* 0EBB80 001EBA80 00000000 */   nop
.L001EBA84:
/* 0EBB84 001EBA84 0100C624 */  addiu       $6, $6, 0x1
.L001EBA88:
/* 0EBB88 001EBA88 0A00C328 */  slti        $3, $6, 0xA
/* 0EBB8C 001EBA8C F2FF6014 */  bnez        $3, .L001EBA58
/* 0EBB90 001EBA90 00000000 */   nop
.L001EBA94:
/* 0EBB94 001EBA94 D901013C */  lui         $1, %hi(ShopDataMove + 0x10)
/* 0EBB98 001EBA98 90022484 */  lh          $4, %lo(ShopDataMove + 0x10)($1)
/* 0EBB9C 001EBA9C 05000324 */  addiu       $3, $0, 0x5
/* 0EBBA0 001EBAA0 02008314 */  bne         $4, $3, .L001EBAAC
/* 0EBBA4 001EBAA4 00000000 */   nop
/* 0EBBA8 001EBAA8 01000524 */  addiu       $5, $0, 0x1
.L001EBAAC:
/* 0EBBAC 001EBAAC 2100A010 */  beqz        $5, .L001EBB34
/* 0EBBB0 001EBAB0 00000000 */   nop
/* 0EBBB4 001EBAB4 28360070 */  paddub      $6, $0, $0
/* 0EBBB8 001EBAB8 1B000010 */  b           .L001EBB28
/* 0EBBBC 001EBABC 00000000 */   nop
.L001EBAC0:
/* 0EBBC0 001EBAC0 80190600 */  sll         $3, $6, 6
/* 0EBBC4 001EBAC4 23186600 */  subu        $3, $3, $6
/* 0EBBC8 001EBAC8 80200300 */  sll         $4, $3, 2
/* 0EBBCC 001EBACC A094838F */  lw          $3, -0x6B60($28)
/* 0EBBD0 001EBAD0 21206400 */  addu        $4, $3, $4
/* 0EBBD4 001EBAD4 00008584 */  lh          $5, 0x0($4)
/* 0EBBD8 001EBAD8 05000324 */  addiu       $3, $0, 0x5
/* 0EBBDC 001EBADC 1100A314 */  bne         $5, $3, .L001EBB24
/* 0EBBE0 001EBAE0 00000000 */   nop
/* 0EBBE4 001EBAE4 80800600 */  sll         $16, $6, 2
/* 0EBBE8 001EBAE8 9094838F */  lw          $3, -0x6B70($28)
/* 0EBBEC 001EBAEC 21187000 */  addu        $3, $3, $16
/* 0EBBF0 001EBAF0 0000658C */  lw          $5, 0x0($3)
/* 0EBBF4 001EBAF4 01000324 */  addiu       $3, $0, 0x1
/* 0EBBF8 001EBAF8 0A00A314 */  bne         $5, $3, .L001EBB24
/* 0EBBFC 001EBAFC 00000000 */   nop
/* 0EBC00 001EBB00 282E0070 */  paddub      $5, $0, $0
/* 0EBC04 001EBB04 FC000624 */  addiu       $6, $0, 0xFC
/* 0EBC08 001EBB08 5A0D040C */  jal         memset
/* 0EBC0C 001EBB0C 00000000 */   nop
/* 0EBC10 001EBB10 9094838F */  lw          $3, -0x6B70($28)
/* 0EBC14 001EBB14 21187000 */  addu        $3, $3, $16
/* 0EBC18 001EBB18 000060AC */  sw          $0, 0x0($3)
/* 0EBC1C 001EBB1C 05000010 */  b           .L001EBB34
/* 0EBC20 001EBB20 00000000 */   nop
.L001EBB24:
/* 0EBC24 001EBB24 0100C624 */  addiu       $6, $6, 0x1
.L001EBB28:
/* 0EBC28 001EBB28 1E00C328 */  slti        $3, $6, 0x1E
/* 0EBC2C 001EBB2C E4FF6014 */  bnez        $3, .L001EBAC0
/* 0EBC30 001EBB30 00000000 */   nop
.L001EBB34:
/* 0EBC34 001EBB34 1000BF7B */  lq          $31, 0x10($29)
/* 0EBC38 001EBB38 0000B07B */  lq          $16, 0x0($29)
/* 0EBC3C 001EBB3C 2000BD27 */  addiu       $29, $29, 0x20
/* 0EBC40 001EBB40 0800E003 */  jr          $31
/* 0EBC44 001EBB44 00000000 */   nop
/* 0EBC48 001EBB48 00000000 */  nop
/* 0EBC4C 001EBB4C 00000000 */  nop
