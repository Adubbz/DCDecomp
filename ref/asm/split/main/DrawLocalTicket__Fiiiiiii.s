.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawLocalTicket__Fiiiiiii
/* 0ECCC0 001ECBC0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0ECCC4 001ECBC4 0000BF7F */  sq          $31, 0x0($29)
/* 0ECCC8 001ECBC8 28768070 */  paddub      $14, $4, $0
/* 0ECCCC 001ECBCC 286EA070 */  paddub      $13, $5, $0
/* 0ECCD0 001ECBD0 2866C070 */  paddub      $12, $6, $0
/* 0ECCD4 001ECBD4 285EE070 */  paddub      $11, $7, $0
/* 0ECCD8 001ECBD8 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0ECCDC 001ECBDC E400228C */  lw          $2, %lo(ShopMenu + 0x14)($1)
/* 0ECCE0 001ECBE0 2C000215 */  bne         $8, $2, .L001ECC94
/* 0ECCE4 001ECBE4 00000000 */   nop
/* 0ECCE8 001ECBE8 D901013C */  lui         $1, %hi(ShopMenu + 0x2)
/* 0ECCEC 001ECBEC D2002384 */  lh          $3, %lo(ShopMenu + 0x2)($1)
/* 0ECCF0 001ECBF0 01000224 */  addiu       $2, $0, 0x1
/* 0ECCF4 001ECBF4 27006214 */  bne         $3, $2, .L001ECC94
/* 0ECCF8 001ECBF8 00000000 */   nop
/* 0ECCFC 001ECBFC 28262071 */  paddub      $4, $9, $0
/* 0ECD00 001ECC00 282E0070 */  paddub      $5, $0, $0
/* 0ECD04 001ECC04 B4AC070C */  jal         CalItemMoney__Fii
/* 0ECD08 001ECC08 00000000 */   nop
/* 0ECD0C 001ECC0C 282E4070 */  paddub      $5, $2, $0
/* 0ECD10 001ECC10 0200A104 */  bgez        $5, .L001ECC1C
/* 0ECD14 001ECC14 00000000 */   nop
/* 0ECD18 001ECC18 01000524 */  addiu       $5, $0, 0x1
.L001ECC1C:
/* 0ECD1C 001ECC1C 05000724 */  addiu       $7, $0, 0x5
/* 0ECD20 001ECC20 1A000701 */  div         $0, $8, $7
/* 0ECD24 001ECC24 00000000 */  nop
/* 0ECD28 001ECC28 00000000 */  nop
/* 0ECD2C 001ECC2C 10200000 */  mfhi        $4
/* 0ECD30 001ECC30 80180400 */  sll         $3, $4, 2
/* 0ECD34 001ECC34 21186400 */  addu        $3, $3, $4
/* 0ECD38 001ECC38 C0180300 */  sll         $3, $3, 3
/* 0ECD3C 001ECC3C 2130C301 */  addu        $6, $14, $3
/* 0ECD40 001ECC40 1A000701 */  div         $0, $8, $7
/* 0ECD44 001ECC44 0200E014 */  bnez        $7, .L001ECC50
/* 0ECD48 001ECC48 00000000 */   nop
/* 0ECD4C 001ECC4C CD010000 */  break       0, 7
.L001ECC50:
/* 0ECD50 001ECC50 12200000 */  mflo        $4
/* 0ECD54 001ECC54 80180400 */  sll         $3, $4, 2
/* 0ECD58 001ECC58 21186400 */  addu        $3, $3, $4
/* 0ECD5C 001ECC5C C0180300 */  sll         $3, $3, 3
/* 0ECD60 001ECC60 2138A301 */  addu        $7, $13, $3
/* 0ECD64 001ECC64 2A08EC00 */  slt         $1, $7, $12
/* 0ECD68 001ECC68 04002010 */  beqz        $1, .L001ECC7C
/* 0ECD6C 001ECC6C 00000000 */   nop
/* 0ECD70 001ECC70 2A08EB00 */  slt         $1, $7, $11
/* 0ECD74 001ECC74 21002010 */  beqz        $1, .L001ECCFC
/* 0ECD78 001ECC78 00000000 */   nop
.L001ECC7C:
/* 0ECD7C 001ECC7C 28260070 */  paddub      $4, $0, $0
/* 0ECD80 001ECC80 80000824 */  addiu       $8, $0, 0x80
/* 0ECD84 001ECC84 54B2070C */  jal         DrawBigSellTicket__Fiiiii
/* 0ECD88 001ECC88 00000000 */   nop
/* 0ECD8C 001ECC8C 1B000010 */  b           .L001ECCFC
/* 0ECD90 001ECC90 00000000 */   nop
.L001ECC94:
/* 0ECD94 001ECC94 05000424 */  addiu       $4, $0, 0x5
/* 0ECD98 001ECC98 1A000401 */  div         $0, $8, $4
/* 0ECD9C 001ECC9C 00000000 */  nop
/* 0ECDA0 001ECCA0 00000000 */  nop
/* 0ECDA4 001ECCA4 10180000 */  mfhi        $3
/* 0ECDA8 001ECCA8 80100300 */  sll         $2, $3, 2
/* 0ECDAC 001ECCAC 21104300 */  addu        $2, $2, $3
/* 0ECDB0 001ECCB0 C0100200 */  sll         $2, $2, 3
/* 0ECDB4 001ECCB4 2130C201 */  addu        $6, $14, $2
/* 0ECDB8 001ECCB8 1A000401 */  div         $0, $8, $4
/* 0ECDBC 001ECCBC 02008014 */  bnez        $4, .L001ECCC8
/* 0ECDC0 001ECCC0 00000000 */   nop
/* 0ECDC4 001ECCC4 CD010000 */  break       0, 7
.L001ECCC8:
/* 0ECDC8 001ECCC8 12180000 */  mflo        $3
/* 0ECDCC 001ECCCC 80100300 */  sll         $2, $3, 2
/* 0ECDD0 001ECCD0 21104300 */  addu        $2, $2, $3
/* 0ECDD4 001ECCD4 C0100200 */  sll         $2, $2, 3
/* 0ECDD8 001ECCD8 2138A201 */  addu        $7, $13, $2
/* 0ECDDC 001ECCDC 28260070 */  paddub      $4, $0, $0
/* 0ECDE0 001ECCE0 282EC070 */  paddub      $5, $6, $0
/* 0ECDE4 001ECCE4 2836E070 */  paddub      $6, $7, $0
/* 0ECDE8 001ECCE8 283E8071 */  paddub      $7, $12, $0
/* 0ECDEC 001ECCEC 28466071 */  paddub      $8, $11, $0
/* 0ECDF0 001ECCF0 284E4071 */  paddub      $9, $10, $0
/* 0ECDF4 001ECCF4 1CB2070C */  jal         DrawSmallSellTicket__Fiiiiii
/* 0ECDF8 001ECCF8 00000000 */   nop
.L001ECCFC:
/* 0ECDFC 001ECCFC 0000BF7B */  lq          $31, 0x0($29)
/* 0ECE00 001ECD00 1000BD27 */  addiu       $29, $29, 0x10
/* 0ECE04 001ECD04 0800E003 */  jr          $31
/* 0ECE08 001ECD08 00000000 */   nop
/* 0ECE0C 001ECD0C 00000000 */  nop
