.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel checkArg__FPciPi__2
/* 0CDB20 001CDA20 90FFBD27 */  addiu       $29, $29, -0x70
/* 0CDB24 001CDA24 6000BF7F */  sq          $31, 0x60($29)
/* 0CDB28 001CDA28 5000B57F */  sq          $21, 0x50($29)
/* 0CDB2C 001CDA2C 4000B47F */  sq          $20, 0x40($29)
/* 0CDB30 001CDA30 3000B37F */  sq          $19, 0x30($29)
/* 0CDB34 001CDA34 2000B27F */  sq          $18, 0x20($29)
/* 0CDB38 001CDA38 1000B17F */  sq          $17, 0x10($29)
/* 0CDB3C 001CDA3C 0000B07F */  sq          $16, 0x0($29)
/* 0CDB40 001CDA40 288E8070 */  paddub      $17, $4, $0
/* 0CDB44 001CDA44 2886C070 */  paddub      $16, $6, $0
/* 0CDB48 001CDA48 289EA070 */  paddub      $19, $5, $0
/* 0CDB4C 001CDA4C 0400C28C */  lw          $2, 0x4($6)
/* 0CDB50 001CDA50 04004014 */  bnez        $2, .L001CDA64
/* 0CDB54 001CDA54 00000000 */   nop
/* 0CDB58 001CDA58 2816A070 */  paddub      $2, $5, $0
/* 0CDB5C 001CDA5C 7F010010 */  b           .L001CE05C
/* 0CDB60 001CDA60 00000000 */   nop
.L001CDA64:
/* 0CDB64 001CDA64 28960070 */  paddub      $18, $0, $0
/* 0CDB68 001CDA68 77010010 */  b           .L001CE048
/* 0CDB6C 001CDA6C 00000000 */   nop
.L001CDA70:
/* 0CDB70 001CDA70 000000C6 */  lwc1        $f0, 0x0($16)
/* 0CDB74 001CDA74 20008046 */  cvt.s.w     $f0, $f0
/* 0CDB78 001CDA78 0C94838F */  lw          $3, -0x6BF4($28)
/* 0CDB7C 001CDA7C C0100300 */  sll         $2, $3, 3
/* 0CDB80 001CDA80 21104300 */  addu        $2, $2, $3
/* 0CDB84 001CDA84 00210200 */  sll         $4, $2, 4
/* 0CDB88 001CDA88 D701023C */  lui         $2, %hi(argValBuff__2)
/* 0CDB8C 001CDA8C 20B64224 */  addiu       $2, $2, %lo(argValBuff__2)
/* 0CDB90 001CDA90 21104400 */  addu        $2, $2, $4
/* 0CDB94 001CDA94 000040E4 */  swc1        $f0, 0x0($2)
/* 0CDB98 001CDA98 80A01200 */  sll         $20, $18, 2
/* 0CDB9C 001CDA9C 21109002 */  addu        $2, $20, $16
/* 0CDBA0 001CDAA0 0800448C */  lw          $4, 0x8($2)
/* 0CDBA4 001CDAA4 02000624 */  addiu       $6, $0, 0x2
/* 0CDBA8 001CDAA8 DA008610 */  beq         $4, $6, .L001CDE14
/* 0CDBAC 001CDAAC 00000000 */   nop
/* 0CDBB0 001CDAB0 01000224 */  addiu       $2, $0, 0x1
/* 0CDBB4 001CDAB4 3B008210 */  beq         $4, $2, .L001CDBA4
/* 0CDBB8 001CDAB8 00000000 */   nop
/* 0CDBBC 001CDABC 03008010 */  beqz        $4, .L001CDACC
/* 0CDBC0 001CDAC0 00000000 */   nop
/* 0CDBC4 001CDAC4 5F010010 */  b           .L001CE044
/* 0CDBC8 001CDAC8 00000000 */   nop
.L001CDACC:
/* 0CDBCC 001CDACC 21103302 */  addu        $2, $17, $19
/* 0CDBD0 001CDAD0 00004480 */  lb          $4, 0x0($2)
/* 0CDBD4 001CDAD4 22000224 */  addiu       $2, $0, 0x22
/* 0CDBD8 001CDAD8 04008210 */  beq         $4, $2, .L001CDAEC
/* 0CDBDC 001CDADC 00000000 */   nop
/* 0CDBE0 001CDAE0 FFFF0224 */  addiu       $2, $0, -0x1
/* 0CDBE4 001CDAE4 5D010010 */  b           .L001CE05C
/* 0CDBE8 001CDAE8 00000000 */   nop
.L001CDAEC:
/* 0CDBEC 001CDAEC 01007326 */  addiu       $19, $19, 0x1
/* 0CDBF0 001CDAF0 28160070 */  paddub      $2, $0, $0
/* 0CDBF4 001CDAF4 1B000010 */  b           .L001CDB64
/* 0CDBF8 001CDAF8 00000000 */   nop
.L001CDAFC:
/* 0CDBFC 001CDAFC 21203302 */  addu        $4, $17, $19
/* 0CDC00 001CDB00 00008680 */  lb          $6, 0x0($4)
/* 0CDC04 001CDB04 22000424 */  addiu       $4, $0, 0x22
/* 0CDC08 001CDB08 0C00C414 */  bne         $6, $4, .L001CDB3C
/* 0CDC0C 001CDB0C 00000000 */   nop
/* 0CDC10 001CDB10 C0200300 */  sll         $4, $3, 3
/* 0CDC14 001CDB14 21188300 */  addu        $3, $4, $3
/* 0CDC18 001CDB18 80200300 */  sll         $4, $3, 2
/* 0CDC1C 001CDB1C D601033C */  lui         $3, %hi(argStrBuff__2)
/* 0CDC20 001CDB20 205C6324 */  addiu       $3, $3, %lo(argStrBuff__2)
/* 0CDC24 001CDB24 21186400 */  addu        $3, $3, $4
/* 0CDC28 001CDB28 21184300 */  addu        $3, $2, $3
/* 0CDC2C 001CDB2C 000060A0 */  sb          $0, 0x0($3)
/* 0CDC30 001CDB30 01007326 */  addiu       $19, $19, 0x1
/* 0CDC34 001CDB34 0E000010 */  b           .L001CDB70
/* 0CDC38 001CDB38 00000000 */   nop
.L001CDB3C:
/* 0CDC3C 001CDB3C C0200300 */  sll         $4, $3, 3
/* 0CDC40 001CDB40 21208300 */  addu        $4, $4, $3
/* 0CDC44 001CDB44 80280400 */  sll         $5, $4, 2
/* 0CDC48 001CDB48 D601043C */  lui         $4, %hi(argStrBuff__2)
/* 0CDC4C 001CDB4C 205C8424 */  addiu       $4, $4, %lo(argStrBuff__2)
/* 0CDC50 001CDB50 21208500 */  addu        $4, $4, $5
/* 0CDC54 001CDB54 21204400 */  addu        $4, $2, $4
/* 0CDC58 001CDB58 000086A0 */  sb          $6, 0x0($4)
/* 0CDC5C 001CDB5C 01007326 */  addiu       $19, $19, 0x1
/* 0CDC60 001CDB60 01004224 */  addiu       $2, $2, 0x1
.L001CDB64:
/* 0CDC64 001CDB64 20004428 */  slti        $4, $2, 0x20
/* 0CDC68 001CDB68 E4FF8014 */  bnez        $4, .L001CDAFC
/* 0CDC6C 001CDB6C 00000000 */   nop
.L001CDB70:
/* 0CDC70 001CDB70 20000324 */  addiu       $3, $0, 0x20
/* 0CDC74 001CDB74 04004314 */  bne         $2, $3, .L001CDB88
/* 0CDC78 001CDB78 00000000 */   nop
/* 0CDC7C 001CDB7C FFFF0224 */  addiu       $2, $0, -0x1
/* 0CDC80 001CDB80 36010010 */  b           .L001CE05C
/* 0CDC84 001CDB84 00000000 */   nop
.L001CDB88:
/* 0CDC88 001CDB88 28262072 */  paddub      $4, $17, $0
/* 0CDC8C 001CDB8C 282E6072 */  paddub      $5, $19, $0
/* 0CDC90 001CDB90 4436070C */  jal         skipSpace__FPci__2
/* 0CDC94 001CDB94 00000000 */   nop
/* 0CDC98 001CDB98 289E4070 */  paddub      $19, $2, $0
/* 0CDC9C 001CDB9C 29010010 */  b           .L001CE044
/* 0CDCA0 001CDBA0 00000000 */   nop
.L001CDBA4:
/* 0CDCA4 001CDBA4 21103302 */  addu        $2, $17, $19
/* 0CDCA8 001CDBA8 00004380 */  lb          $3, 0x0($2)
/* 0CDCAC 001CDBAC 2C000224 */  addiu       $2, $0, 0x2C
/* 0CDCB0 001CDBB0 04006210 */  beq         $3, $2, .L001CDBC4
/* 0CDCB4 001CDBB4 00000000 */   nop
/* 0CDCB8 001CDBB8 FFFF0224 */  addiu       $2, $0, -0x1
/* 0CDCBC 001CDBBC 27010010 */  b           .L001CE05C
/* 0CDCC0 001CDBC0 00000000 */   nop
.L001CDBC4:
/* 0CDCC4 001CDBC4 01006526 */  addiu       $5, $19, 0x1
/* 0CDCC8 001CDBC8 28262072 */  paddub      $4, $17, $0
/* 0CDCCC 001CDBCC 4436070C */  jal         skipSpace__FPci__2
/* 0CDCD0 001CDBD0 00000000 */   nop
/* 0CDCD4 001CDBD4 289E4070 */  paddub      $19, $2, $0
/* 0CDCD8 001CDBD8 21A82202 */  addu        $21, $17, $2
/* 0CDCDC 001CDBDC 2826A072 */  paddub      $4, $21, $0
/* 0CDCE0 001CDBE0 2A00023C */  lui         $2, %hi(LIT_653)
/* 0CDCE4 001CDBE4 F0C14524 */  addiu       $5, $2, %lo(LIT_653)
/* 0CDCE8 001CDBE8 02000624 */  addiu       $6, $0, 0x2
/* 0CDCEC 001CDBEC C60C040C */  jal         memcmp
/* 0CDCF0 001CDBF0 00000000 */   nop
/* 0CDCF4 001CDBF4 15004014 */  bnez        $2, .L001CDC4C
/* 0CDCF8 001CDBF8 00000000 */   nop
/* 0CDCFC 001CDBFC 803F043C */  lui         $4, (0x3F800000 >> 16)
/* 0CDD00 001CDC00 0C94838F */  lw          $3, -0x6BF4($28)
/* 0CDD04 001CDC04 C0100300 */  sll         $2, $3, 3
/* 0CDD08 001CDC08 21104300 */  addu        $2, $2, $3
/* 0CDD0C 001CDC0C 00190200 */  sll         $3, $2, 4
/* 0CDD10 001CDC10 D701023C */  lui         $2, %hi(argValBuff__2 + 0x4)
/* 0CDD14 001CDC14 24B64224 */  addiu       $2, $2, %lo(argValBuff__2 + 0x4)
/* 0CDD18 001CDC18 21104300 */  addu        $2, $2, $3
/* 0CDD1C 001CDC1C 21108202 */  addu        $2, $20, $2
/* 0CDD20 001CDC20 000044AC */  sw          $4, 0x0($2)
/* 0CDD24 001CDC24 2000422A */  slti        $2, $18, 0x20
/* 0CDD28 001CDC28 05004014 */  bnez        $2, .L001CDC40
/* 0CDD2C 001CDC2C 00000000 */   nop
/* 0CDD30 001CDC30 2A00023C */  lui         $2, %hi(LIT_654)
/* 0CDD34 001CDC34 00C24424 */  addiu       $4, $2, %lo(LIT_654)
/* 0CDD38 001CDC38 A611040C */  jal         printf
/* 0CDD3C 001CDC3C 00000000 */   nop
.L001CDC40:
/* 0CDD40 001CDC40 02007326 */  addiu       $19, $19, 0x2
/* 0CDD44 001CDC44 6C000010 */  b           .L001CDDF8
/* 0CDD48 001CDC48 00000000 */   nop
.L001CDC4C:
/* 0CDD4C 001CDC4C 2826A072 */  paddub      $4, $21, $0
/* 0CDD50 001CDC50 2A00023C */  lui         $2, %hi(LIT_655)
/* 0CDD54 001CDC54 18C24524 */  addiu       $5, $2, %lo(LIT_655)
/* 0CDD58 001CDC58 03000624 */  addiu       $6, $0, 0x3
/* 0CDD5C 001CDC5C C60C040C */  jal         memcmp
/* 0CDD60 001CDC60 00000000 */   nop
/* 0CDD64 001CDC64 14004014 */  bnez        $2, .L001CDCB8
/* 0CDD68 001CDC68 00000000 */   nop
/* 0CDD6C 001CDC6C 0C94838F */  lw          $3, -0x6BF4($28)
/* 0CDD70 001CDC70 C0100300 */  sll         $2, $3, 3
/* 0CDD74 001CDC74 21104300 */  addu        $2, $2, $3
/* 0CDD78 001CDC78 00190200 */  sll         $3, $2, 4
/* 0CDD7C 001CDC7C D701023C */  lui         $2, %hi(argValBuff__2 + 0x4)
/* 0CDD80 001CDC80 24B64224 */  addiu       $2, $2, %lo(argValBuff__2 + 0x4)
/* 0CDD84 001CDC84 21104300 */  addu        $2, $2, $3
/* 0CDD88 001CDC88 21108202 */  addu        $2, $20, $2
/* 0CDD8C 001CDC8C 000040AC */  sw          $0, 0x0($2)
/* 0CDD90 001CDC90 2000422A */  slti        $2, $18, 0x20
/* 0CDD94 001CDC94 05004014 */  bnez        $2, .L001CDCAC
/* 0CDD98 001CDC98 00000000 */   nop
/* 0CDD9C 001CDC9C 2A00023C */  lui         $2, %hi(LIT_654)
/* 0CDDA0 001CDCA0 00C24424 */  addiu       $4, $2, %lo(LIT_654)
/* 0CDDA4 001CDCA4 A611040C */  jal         printf
/* 0CDDA8 001CDCA8 00000000 */   nop
.L001CDCAC:
/* 0CDDAC 001CDCAC 03007326 */  addiu       $19, $19, 0x3
/* 0CDDB0 001CDCB0 51000010 */  b           .L001CDDF8
/* 0CDDB4 001CDCB4 00000000 */   nop
.L001CDCB8:
/* 0CDDB8 001CDCB8 281E0070 */  paddub      $3, $0, $0
/* 0CDDBC 001CDCBC 0000A482 */  lb          $4, 0x0($21)
/* 0CDDC0 001CDCC0 2D000224 */  addiu       $2, $0, 0x2D
/* 0CDDC4 001CDCC4 02008214 */  bne         $4, $2, .L001CDCD0
/* 0CDDC8 001CDCC8 00000000 */   nop
/* 0CDDCC 001CDCCC 01000324 */  addiu       $3, $0, 0x1
.L001CDCD0:
/* 0CDDD0 001CDCD0 30008228 */  slti        $2, $4, 0x30
/* 0CDDD4 001CDCD4 05004014 */  bnez        $2, .L001CDCEC
/* 0CDDD8 001CDCD8 00000000 */   nop
/* 0CDDDC 001CDCDC 3A008128 */  slti        $1, $4, 0x3A
/* 0CDDE0 001CDCE0 02002010 */  beqz        $1, .L001CDCEC
/* 0CDDE4 001CDCE4 00000000 */   nop
/* 0CDDE8 001CDCE8 01000324 */  addiu       $3, $0, 0x1
.L001CDCEC:
/* 0CDDEC 001CDCEC 04006014 */  bnez        $3, .L001CDD00
/* 0CDDF0 001CDCF0 00000000 */   nop
/* 0CDDF4 001CDCF4 FFFF0224 */  addiu       $2, $0, -0x1
/* 0CDDF8 001CDCF8 D8000010 */  b           .L001CE05C
/* 0CDDFC 001CDCFC 00000000 */   nop
.L001CDD00:
/* 0CDE00 001CDD00 2826A072 */  paddub      $4, $21, $0
/* 0CDE04 001CDD04 8600040C */  jal         atof
/* 0CDE08 001CDD08 00000000 */   nop
/* 0CDE0C 001CDD0C 28264070 */  paddub      $4, $2, $0
/* 0CDE10 001CDD10 9241040C */  jal         dptofp
/* 0CDE14 001CDD14 00000000 */   nop
/* 0CDE18 001CDD18 0C94838F */  lw          $3, -0x6BF4($28)
/* 0CDE1C 001CDD1C C0100300 */  sll         $2, $3, 3
/* 0CDE20 001CDD20 21104300 */  addu        $2, $2, $3
/* 0CDE24 001CDD24 00190200 */  sll         $3, $2, 4
/* 0CDE28 001CDD28 D701023C */  lui         $2, %hi(argValBuff__2 + 0x4)
/* 0CDE2C 001CDD2C 24B64224 */  addiu       $2, $2, %lo(argValBuff__2 + 0x4)
/* 0CDE30 001CDD30 21104300 */  addu        $2, $2, $3
/* 0CDE34 001CDD34 21108202 */  addu        $2, $20, $2
/* 0CDE38 001CDD38 000040E4 */  swc1        $f0, 0x0($2)
/* 0CDE3C 001CDD3C 2000422A */  slti        $2, $18, 0x20
/* 0CDE40 001CDD40 05004014 */  bnez        $2, .L001CDD58
/* 0CDE44 001CDD44 00000000 */   nop
/* 0CDE48 001CDD48 2A00023C */  lui         $2, %hi(LIT_654)
/* 0CDE4C 001CDD4C 00C24424 */  addiu       $4, $2, %lo(LIT_654)
/* 0CDE50 001CDD50 A611040C */  jal         printf
/* 0CDE54 001CDD54 00000000 */   nop
.L001CDD58:
/* 0CDE58 001CDD58 28160070 */  paddub      $2, $0, $0
/* 0CDE5C 001CDD5C 1D000010 */  b           .L001CDDD4
/* 0CDE60 001CDD60 00000000 */   nop
.L001CDD64:
/* 0CDE64 001CDD64 281E0070 */  paddub      $3, $0, $0
/* 0CDE68 001CDD68 21203302 */  addu        $4, $17, $19
/* 0CDE6C 001CDD6C 00008580 */  lb          $5, 0x0($4)
/* 0CDE70 001CDD70 2D000424 */  addiu       $4, $0, 0x2D
/* 0CDE74 001CDD74 0300A414 */  bne         $5, $4, .L001CDD84
/* 0CDE78 001CDD78 00000000 */   nop
/* 0CDE7C 001CDD7C 01007326 */  addiu       $19, $19, 0x1
/* 0CDE80 001CDD80 01000324 */  addiu       $3, $0, 0x1
.L001CDD84:
/* 0CDE84 001CDD84 21203302 */  addu        $4, $17, $19
/* 0CDE88 001CDD88 00008580 */  lb          $5, 0x0($4)
/* 0CDE8C 001CDD8C 3000A428 */  slti        $4, $5, 0x30
/* 0CDE90 001CDD90 06008014 */  bnez        $4, .L001CDDAC
/* 0CDE94 001CDD94 00000000 */   nop
/* 0CDE98 001CDD98 3A00A128 */  slti        $1, $5, 0x3A
/* 0CDE9C 001CDD9C 03002010 */  beqz        $1, .L001CDDAC
/* 0CDEA0 001CDDA0 00000000 */   nop
/* 0CDEA4 001CDDA4 01007326 */  addiu       $19, $19, 0x1
/* 0CDEA8 001CDDA8 01000324 */  addiu       $3, $0, 0x1
.L001CDDAC:
/* 0CDEAC 001CDDAC 21203302 */  addu        $4, $17, $19
/* 0CDEB0 001CDDB0 00008580 */  lb          $5, 0x0($4)
/* 0CDEB4 001CDDB4 2E000424 */  addiu       $4, $0, 0x2E
/* 0CDEB8 001CDDB8 0300A414 */  bne         $5, $4, .L001CDDC8
/* 0CDEBC 001CDDBC 00000000 */   nop
/* 0CDEC0 001CDDC0 01007326 */  addiu       $19, $19, 0x1
/* 0CDEC4 001CDDC4 01000324 */  addiu       $3, $0, 0x1
.L001CDDC8:
/* 0CDEC8 001CDDC8 05006010 */  beqz        $3, .L001CDDE0
/* 0CDECC 001CDDCC 00000000 */   nop
/* 0CDED0 001CDDD0 01004224 */  addiu       $2, $2, 0x1
.L001CDDD4:
/* 0CDED4 001CDDD4 20004328 */  slti        $3, $2, 0x20
/* 0CDED8 001CDDD8 E2FF6014 */  bnez        $3, .L001CDD64
/* 0CDEDC 001CDDDC 00000000 */   nop
.L001CDDE0:
/* 0CDEE0 001CDDE0 20000324 */  addiu       $3, $0, 0x20
/* 0CDEE4 001CDDE4 04004314 */  bne         $2, $3, .L001CDDF8
/* 0CDEE8 001CDDE8 00000000 */   nop
/* 0CDEEC 001CDDEC FFFF0224 */  addiu       $2, $0, -0x1
/* 0CDEF0 001CDDF0 9A000010 */  b           .L001CE05C
/* 0CDEF4 001CDDF4 00000000 */   nop
.L001CDDF8:
/* 0CDEF8 001CDDF8 28262072 */  paddub      $4, $17, $0
/* 0CDEFC 001CDDFC 282E6072 */  paddub      $5, $19, $0
/* 0CDF00 001CDE00 4436070C */  jal         skipSpace__FPci__2
/* 0CDF04 001CDE04 00000000 */   nop
/* 0CDF08 001CDE08 289E4070 */  paddub      $19, $2, $0
/* 0CDF0C 001CDE0C 8D000010 */  b           .L001CE044
/* 0CDF10 001CDE10 00000000 */   nop
.L001CDE14:
/* 0CDF14 001CDE14 21A83302 */  addu        $21, $17, $19
/* 0CDF18 001CDE18 2826A072 */  paddub      $4, $21, $0
/* 0CDF1C 001CDE1C 2A00023C */  lui         $2, %hi(LIT_653)
/* 0CDF20 001CDE20 F0C14524 */  addiu       $5, $2, %lo(LIT_653)
/* 0CDF24 001CDE24 C60C040C */  jal         memcmp
/* 0CDF28 001CDE28 00000000 */   nop
/* 0CDF2C 001CDE2C 15004014 */  bnez        $2, .L001CDE84
/* 0CDF30 001CDE30 00000000 */   nop
/* 0CDF34 001CDE34 803F043C */  lui         $4, (0x3F800000 >> 16)
/* 0CDF38 001CDE38 0C94838F */  lw          $3, -0x6BF4($28)
/* 0CDF3C 001CDE3C C0100300 */  sll         $2, $3, 3
/* 0CDF40 001CDE40 21104300 */  addu        $2, $2, $3
/* 0CDF44 001CDE44 00190200 */  sll         $3, $2, 4
/* 0CDF48 001CDE48 D701023C */  lui         $2, %hi(argValBuff__2 + 0x4)
/* 0CDF4C 001CDE4C 24B64224 */  addiu       $2, $2, %lo(argValBuff__2 + 0x4)
/* 0CDF50 001CDE50 21104300 */  addu        $2, $2, $3
/* 0CDF54 001CDE54 21108202 */  addu        $2, $20, $2
/* 0CDF58 001CDE58 000044AC */  sw          $4, 0x0($2)
/* 0CDF5C 001CDE5C 2000422A */  slti        $2, $18, 0x20
/* 0CDF60 001CDE60 05004014 */  bnez        $2, .L001CDE78
/* 0CDF64 001CDE64 00000000 */   nop
/* 0CDF68 001CDE68 2A00023C */  lui         $2, %hi(LIT_654)
/* 0CDF6C 001CDE6C 00C24424 */  addiu       $4, $2, %lo(LIT_654)
/* 0CDF70 001CDE70 A611040C */  jal         printf
/* 0CDF74 001CDE74 00000000 */   nop
.L001CDE78:
/* 0CDF78 001CDE78 02007326 */  addiu       $19, $19, 0x2
/* 0CDF7C 001CDE7C 6C000010 */  b           .L001CE030
/* 0CDF80 001CDE80 00000000 */   nop
.L001CDE84:
/* 0CDF84 001CDE84 2826A072 */  paddub      $4, $21, $0
/* 0CDF88 001CDE88 2A00023C */  lui         $2, %hi(LIT_655)
/* 0CDF8C 001CDE8C 18C24524 */  addiu       $5, $2, %lo(LIT_655)
/* 0CDF90 001CDE90 03000624 */  addiu       $6, $0, 0x3
/* 0CDF94 001CDE94 C60C040C */  jal         memcmp
/* 0CDF98 001CDE98 00000000 */   nop
/* 0CDF9C 001CDE9C 14004014 */  bnez        $2, .L001CDEF0
/* 0CDFA0 001CDEA0 00000000 */   nop
/* 0CDFA4 001CDEA4 0C94838F */  lw          $3, -0x6BF4($28)
/* 0CDFA8 001CDEA8 C0100300 */  sll         $2, $3, 3
/* 0CDFAC 001CDEAC 21104300 */  addu        $2, $2, $3
/* 0CDFB0 001CDEB0 00190200 */  sll         $3, $2, 4
/* 0CDFB4 001CDEB4 D701023C */  lui         $2, %hi(argValBuff__2 + 0x4)
/* 0CDFB8 001CDEB8 24B64224 */  addiu       $2, $2, %lo(argValBuff__2 + 0x4)
/* 0CDFBC 001CDEBC 21104300 */  addu        $2, $2, $3
/* 0CDFC0 001CDEC0 21108202 */  addu        $2, $20, $2
/* 0CDFC4 001CDEC4 000040AC */  sw          $0, 0x0($2)
/* 0CDFC8 001CDEC8 2000422A */  slti        $2, $18, 0x20
/* 0CDFCC 001CDECC 05004014 */  bnez        $2, .L001CDEE4
/* 0CDFD0 001CDED0 00000000 */   nop
/* 0CDFD4 001CDED4 2A00023C */  lui         $2, %hi(LIT_654)
/* 0CDFD8 001CDED8 00C24424 */  addiu       $4, $2, %lo(LIT_654)
/* 0CDFDC 001CDEDC A611040C */  jal         printf
/* 0CDFE0 001CDEE0 00000000 */   nop
.L001CDEE4:
/* 0CDFE4 001CDEE4 03007326 */  addiu       $19, $19, 0x3
/* 0CDFE8 001CDEE8 51000010 */  b           .L001CE030
/* 0CDFEC 001CDEEC 00000000 */   nop
.L001CDEF0:
/* 0CDFF0 001CDEF0 281E0070 */  paddub      $3, $0, $0
/* 0CDFF4 001CDEF4 0000A482 */  lb          $4, 0x0($21)
/* 0CDFF8 001CDEF8 2D000224 */  addiu       $2, $0, 0x2D
/* 0CDFFC 001CDEFC 02008214 */  bne         $4, $2, .L001CDF08
/* 0CE000 001CDF00 00000000 */   nop
/* 0CE004 001CDF04 01000324 */  addiu       $3, $0, 0x1
.L001CDF08:
/* 0CE008 001CDF08 30008228 */  slti        $2, $4, 0x30
/* 0CE00C 001CDF0C 05004014 */  bnez        $2, .L001CDF24
/* 0CE010 001CDF10 00000000 */   nop
/* 0CE014 001CDF14 3A008128 */  slti        $1, $4, 0x3A
/* 0CE018 001CDF18 02002010 */  beqz        $1, .L001CDF24
/* 0CE01C 001CDF1C 00000000 */   nop
/* 0CE020 001CDF20 01000324 */  addiu       $3, $0, 0x1
.L001CDF24:
/* 0CE024 001CDF24 04006014 */  bnez        $3, .L001CDF38
/* 0CE028 001CDF28 00000000 */   nop
/* 0CE02C 001CDF2C FFFF0224 */  addiu       $2, $0, -0x1
/* 0CE030 001CDF30 4A000010 */  b           .L001CE05C
/* 0CE034 001CDF34 00000000 */   nop
.L001CDF38:
/* 0CE038 001CDF38 2826A072 */  paddub      $4, $21, $0
/* 0CE03C 001CDF3C 8600040C */  jal         atof
/* 0CE040 001CDF40 00000000 */   nop
/* 0CE044 001CDF44 28264070 */  paddub      $4, $2, $0
/* 0CE048 001CDF48 9241040C */  jal         dptofp
/* 0CE04C 001CDF4C 00000000 */   nop
/* 0CE050 001CDF50 0C94838F */  lw          $3, -0x6BF4($28)
/* 0CE054 001CDF54 C0100300 */  sll         $2, $3, 3
/* 0CE058 001CDF58 21104300 */  addu        $2, $2, $3
/* 0CE05C 001CDF5C 00190200 */  sll         $3, $2, 4
/* 0CE060 001CDF60 D701023C */  lui         $2, %hi(argValBuff__2 + 0x4)
/* 0CE064 001CDF64 24B64224 */  addiu       $2, $2, %lo(argValBuff__2 + 0x4)
/* 0CE068 001CDF68 21104300 */  addu        $2, $2, $3
/* 0CE06C 001CDF6C 21108202 */  addu        $2, $20, $2
/* 0CE070 001CDF70 000040E4 */  swc1        $f0, 0x0($2)
/* 0CE074 001CDF74 2000422A */  slti        $2, $18, 0x20
/* 0CE078 001CDF78 05004014 */  bnez        $2, .L001CDF90
/* 0CE07C 001CDF7C 00000000 */   nop
/* 0CE080 001CDF80 2A00023C */  lui         $2, %hi(LIT_654)
/* 0CE084 001CDF84 00C24424 */  addiu       $4, $2, %lo(LIT_654)
/* 0CE088 001CDF88 A611040C */  jal         printf
/* 0CE08C 001CDF8C 00000000 */   nop
.L001CDF90:
/* 0CE090 001CDF90 28160070 */  paddub      $2, $0, $0
/* 0CE094 001CDF94 1D000010 */  b           .L001CE00C
/* 0CE098 001CDF98 00000000 */   nop
.L001CDF9C:
/* 0CE09C 001CDF9C 281E0070 */  paddub      $3, $0, $0
/* 0CE0A0 001CDFA0 21203302 */  addu        $4, $17, $19
/* 0CE0A4 001CDFA4 00008580 */  lb          $5, 0x0($4)
/* 0CE0A8 001CDFA8 2D000424 */  addiu       $4, $0, 0x2D
/* 0CE0AC 001CDFAC 0300A414 */  bne         $5, $4, .L001CDFBC
/* 0CE0B0 001CDFB0 00000000 */   nop
/* 0CE0B4 001CDFB4 01007326 */  addiu       $19, $19, 0x1
/* 0CE0B8 001CDFB8 01000324 */  addiu       $3, $0, 0x1
.L001CDFBC:
/* 0CE0BC 001CDFBC 21203302 */  addu        $4, $17, $19
/* 0CE0C0 001CDFC0 00008580 */  lb          $5, 0x0($4)
/* 0CE0C4 001CDFC4 3000A428 */  slti        $4, $5, 0x30
/* 0CE0C8 001CDFC8 06008014 */  bnez        $4, .L001CDFE4
/* 0CE0CC 001CDFCC 00000000 */   nop
/* 0CE0D0 001CDFD0 3A00A128 */  slti        $1, $5, 0x3A
/* 0CE0D4 001CDFD4 03002010 */  beqz        $1, .L001CDFE4
/* 0CE0D8 001CDFD8 00000000 */   nop
/* 0CE0DC 001CDFDC 01007326 */  addiu       $19, $19, 0x1
/* 0CE0E0 001CDFE0 01000324 */  addiu       $3, $0, 0x1
.L001CDFE4:
/* 0CE0E4 001CDFE4 21203302 */  addu        $4, $17, $19
/* 0CE0E8 001CDFE8 00008580 */  lb          $5, 0x0($4)
/* 0CE0EC 001CDFEC 2E000424 */  addiu       $4, $0, 0x2E
/* 0CE0F0 001CDFF0 0300A414 */  bne         $5, $4, .L001CE000
/* 0CE0F4 001CDFF4 00000000 */   nop
/* 0CE0F8 001CDFF8 01007326 */  addiu       $19, $19, 0x1
/* 0CE0FC 001CDFFC 01000324 */  addiu       $3, $0, 0x1
.L001CE000:
/* 0CE100 001CE000 05006010 */  beqz        $3, .L001CE018
/* 0CE104 001CE004 00000000 */   nop
/* 0CE108 001CE008 01004224 */  addiu       $2, $2, 0x1
.L001CE00C:
/* 0CE10C 001CE00C 20004328 */  slti        $3, $2, 0x20
/* 0CE110 001CE010 E2FF6014 */  bnez        $3, .L001CDF9C
/* 0CE114 001CE014 00000000 */   nop
.L001CE018:
/* 0CE118 001CE018 20000324 */  addiu       $3, $0, 0x20
/* 0CE11C 001CE01C 04004314 */  bne         $2, $3, .L001CE030
/* 0CE120 001CE020 00000000 */   nop
/* 0CE124 001CE024 FFFF0224 */  addiu       $2, $0, -0x1
/* 0CE128 001CE028 0C000010 */  b           .L001CE05C
/* 0CE12C 001CE02C 00000000 */   nop
.L001CE030:
/* 0CE130 001CE030 28262072 */  paddub      $4, $17, $0
/* 0CE134 001CE034 282E6072 */  paddub      $5, $19, $0
/* 0CE138 001CE038 4436070C */  jal         skipSpace__FPci__2
/* 0CE13C 001CE03C 00000000 */   nop
/* 0CE140 001CE040 289E4070 */  paddub      $19, $2, $0
.L001CE044:
/* 0CE144 001CE044 01005226 */  addiu       $18, $18, 0x1
.L001CE048:
/* 0CE148 001CE048 0400028E */  lw          $2, 0x4($16)
/* 0CE14C 001CE04C 2A104202 */  slt         $2, $18, $2
/* 0CE150 001CE050 87FE4014 */  bnez        $2, .L001CDA70
/* 0CE154 001CE054 00000000 */   nop
/* 0CE158 001CE058 28166072 */  paddub      $2, $19, $0
.L001CE05C:
/* 0CE15C 001CE05C 6000BF7B */  lq          $31, 0x60($29)
/* 0CE160 001CE060 5000B57B */  lq          $21, 0x50($29)
/* 0CE164 001CE064 4000B47B */  lq          $20, 0x40($29)
/* 0CE168 001CE068 3000B37B */  lq          $19, 0x30($29)
/* 0CE16C 001CE06C 2000B27B */  lq          $18, 0x20($29)
/* 0CE170 001CE070 1000B17B */  lq          $17, 0x10($29)
/* 0CE174 001CE074 0000B07B */  lq          $16, 0x0($29)
/* 0CE178 001CE078 7000BD27 */  addiu       $29, $29, 0x70
/* 0CE17C 001CE07C 0800E003 */  jr          $31
/* 0CE180 001CE080 00000000 */   nop
/* 0CE184 001CE084 00000000 */  nop
/* 0CE188 001CE088 00000000 */  nop
/* 0CE18C 001CE08C 00000000 */  nop
