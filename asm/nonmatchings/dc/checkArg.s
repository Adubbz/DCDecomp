.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel checkArg__FPciPi
/* CDB20 001CDA20 90FFBD27 */  addiu      $sp, $sp, -0x70
/* CDB24 001CDA24 6000BF7F */  sq         $31, 0x60($sp)
/* CDB28 001CDA28 5000B57F */  sq         $21, 0x50($sp)
/* CDB2C 001CDA2C 4000B47F */  sq         $20, 0x40($sp)
/* CDB30 001CDA30 3000B37F */  sq         $19, 0x30($sp)
/* CDB34 001CDA34 2000B27F */  sq         $18, 0x20($sp)
/* CDB38 001CDA38 1000B17F */  sq         $17, 0x10($sp)
/* CDB3C 001CDA3C 0000B07F */  sq         $16, 0x0($sp)
/* CDB40 001CDA40 288E8070 */  paddub     $17, $4, $0
/* CDB44 001CDA44 2886C070 */  paddub     $16, $6, $0
/* CDB48 001CDA48 289EA070 */  paddub     $19, $5, $0
/* CDB4C 001CDA4C 0400C28C */  lw         $2, 0x4($6)
/* CDB50 001CDA50 04004014 */  bnez       $2, .L001CDA64
/* CDB54 001CDA54 00000000 */   nop
/* CDB58 001CDA58 2816A070 */  paddub     $2, $5, $0
/* CDB5C 001CDA5C 7F010010 */  b          .L001CE05C
/* CDB60 001CDA60 00000000 */   nop
.L001CDA64:
/* CDB64 001CDA64 28960070 */  paddub     $18, $0, $0
/* CDB68 001CDA68 77010010 */  b          .L001CE048
/* CDB6C 001CDA6C 00000000 */   nop
.L001CDA70:
/* CDB70 001CDA70 000000C6 */  lwc1       $f0, 0x0($16)
/* CDB74 001CDA74 20008046 */  cvt.s.w    $f0, $f0
/* CDB78 001CDA78 0C94838F */  lw         $3, -0x6BF4($gp)
/* CDB7C 001CDA7C C0100300 */  sll        $2, $3, 3
/* CDB80 001CDA80 21104300 */  addu       $2, $2, $3
/* CDB84 001CDA84 00210200 */  sll        $4, $2, 4
/* CDB88 001CDA88 D701023C */  lui        $2, %hi(argValBuff)
/* CDB8C 001CDA8C 20B64224 */  addiu      $2, $2, %lo(argValBuff)
/* CDB90 001CDA90 21104400 */  addu       $2, $2, $4
/* CDB94 001CDA94 000040E4 */  swc1       $f0, 0x0($2)
/* CDB98 001CDA98 80A01200 */  sll        $20, $18, 2
/* CDB9C 001CDA9C 21109002 */  addu       $2, $20, $16
/* CDBA0 001CDAA0 0800448C */  lw         $4, 0x8($2)
/* CDBA4 001CDAA4 02000624 */  addiu      $6, $0, 0x2
/* CDBA8 001CDAA8 DA008610 */  beq        $4, $6, .L001CDE14
/* CDBAC 001CDAAC 00000000 */   nop
/* CDBB0 001CDAB0 01000224 */  addiu      $2, $0, 0x1
/* CDBB4 001CDAB4 3B008210 */  beq        $4, $2, .L001CDBA4
/* CDBB8 001CDAB8 00000000 */   nop
/* CDBBC 001CDABC 03008010 */  beqz       $4, .L001CDACC
/* CDBC0 001CDAC0 00000000 */   nop
/* CDBC4 001CDAC4 5F010010 */  b          .L001CE044
/* CDBC8 001CDAC8 00000000 */   nop
.L001CDACC:
/* CDBCC 001CDACC 21103302 */  addu       $2, $17, $19
/* CDBD0 001CDAD0 00004480 */  lb         $4, 0x0($2)
/* CDBD4 001CDAD4 22000224 */  addiu      $2, $0, 0x22
/* CDBD8 001CDAD8 04008210 */  beq        $4, $2, .L001CDAEC
/* CDBDC 001CDADC 00000000 */   nop
/* CDBE0 001CDAE0 FFFF0224 */  addiu      $2, $0, -0x1
/* CDBE4 001CDAE4 5D010010 */  b          .L001CE05C
/* CDBE8 001CDAE8 00000000 */   nop
.L001CDAEC:
/* CDBEC 001CDAEC 01007326 */  addiu      $19, $19, 0x1
/* CDBF0 001CDAF0 28160070 */  paddub     $2, $0, $0
/* CDBF4 001CDAF4 1B000010 */  b          .L001CDB64
/* CDBF8 001CDAF8 00000000 */   nop
.L001CDAFC:
/* CDBFC 001CDAFC 21203302 */  addu       $4, $17, $19
/* CDC00 001CDB00 00008680 */  lb         $6, 0x0($4)
/* CDC04 001CDB04 22000424 */  addiu      $4, $0, 0x22
/* CDC08 001CDB08 0C00C414 */  bne        $6, $4, .L001CDB3C
/* CDC0C 001CDB0C 00000000 */   nop
/* CDC10 001CDB10 C0200300 */  sll        $4, $3, 3
/* CDC14 001CDB14 21188300 */  addu       $3, $4, $3
/* CDC18 001CDB18 80200300 */  sll        $4, $3, 2
/* CDC1C 001CDB1C D601033C */  lui        $3, %hi(argStrBuff)
/* CDC20 001CDB20 205C6324 */  addiu      $3, $3, %lo(argStrBuff)
/* CDC24 001CDB24 21186400 */  addu       $3, $3, $4
/* CDC28 001CDB28 21184300 */  addu       $3, $2, $3
/* CDC2C 001CDB2C 000060A0 */  sb         $0, 0x0($3)
/* CDC30 001CDB30 01007326 */  addiu      $19, $19, 0x1
/* CDC34 001CDB34 0E000010 */  b          .L001CDB70
/* CDC38 001CDB38 00000000 */   nop
.L001CDB3C:
/* CDC3C 001CDB3C C0200300 */  sll        $4, $3, 3
/* CDC40 001CDB40 21208300 */  addu       $4, $4, $3
/* CDC44 001CDB44 80280400 */  sll        $5, $4, 2
/* CDC48 001CDB48 D601043C */  lui        $4, %hi(argStrBuff)
/* CDC4C 001CDB4C 205C8424 */  addiu      $4, $4, %lo(argStrBuff)
/* CDC50 001CDB50 21208500 */  addu       $4, $4, $5
/* CDC54 001CDB54 21204400 */  addu       $4, $2, $4
/* CDC58 001CDB58 000086A0 */  sb         $6, 0x0($4)
/* CDC5C 001CDB5C 01007326 */  addiu      $19, $19, 0x1
/* CDC60 001CDB60 01004224 */  addiu      $2, $2, 0x1
.L001CDB64:
/* CDC64 001CDB64 20004428 */  slti       $4, $2, 0x20
/* CDC68 001CDB68 E4FF8014 */  bnez       $4, .L001CDAFC
/* CDC6C 001CDB6C 00000000 */   nop
.L001CDB70:
/* CDC70 001CDB70 20000324 */  addiu      $3, $0, 0x20
/* CDC74 001CDB74 04004314 */  bne        $2, $3, .L001CDB88
/* CDC78 001CDB78 00000000 */   nop
/* CDC7C 001CDB7C FFFF0224 */  addiu      $2, $0, -0x1
/* CDC80 001CDB80 36010010 */  b          .L001CE05C
/* CDC84 001CDB84 00000000 */   nop
.L001CDB88:
/* CDC88 001CDB88 28262072 */  paddub     $4, $17, $0
/* CDC8C 001CDB8C 282E6072 */  paddub     $5, $19, $0
/* CDC90 001CDB90 4436070C */  jal        skipSpace__FPci
/* CDC94 001CDB94 00000000 */   nop
/* CDC98 001CDB98 289E4070 */  paddub     $19, $2, $0
/* CDC9C 001CDB9C 29010010 */  b          .L001CE044
/* CDCA0 001CDBA0 00000000 */   nop
.L001CDBA4:
/* CDCA4 001CDBA4 21103302 */  addu       $2, $17, $19
/* CDCA8 001CDBA8 00004380 */  lb         $3, 0x0($2)
/* CDCAC 001CDBAC 2C000224 */  addiu      $2, $0, 0x2C
/* CDCB0 001CDBB0 04006210 */  beq        $3, $2, .L001CDBC4
/* CDCB4 001CDBB4 00000000 */   nop
/* CDCB8 001CDBB8 FFFF0224 */  addiu      $2, $0, -0x1
/* CDCBC 001CDBBC 27010010 */  b          .L001CE05C
/* CDCC0 001CDBC0 00000000 */   nop
.L001CDBC4:
/* CDCC4 001CDBC4 01006526 */  addiu      $5, $19, 0x1
/* CDCC8 001CDBC8 28262072 */  paddub     $4, $17, $0
/* CDCCC 001CDBCC 4436070C */  jal        skipSpace__FPci
/* CDCD0 001CDBD0 00000000 */   nop
/* CDCD4 001CDBD4 289E4070 */  paddub     $19, $2, $0
/* CDCD8 001CDBD8 21A82202 */  addu       $21, $17, $2
/* CDCDC 001CDBDC 2826A072 */  paddub     $4, $21, $0
/* CDCE0 001CDBE0 2A00023C */  lui        $2, %hi(_653)
/* CDCE4 001CDBE4 F0C14524 */  addiu      $5, $2, %lo(_653)
/* CDCE8 001CDBE8 02000624 */  addiu      $6, $0, 0x2
/* CDCEC 001CDBEC C60C040C */  jal        memcmp
/* CDCF0 001CDBF0 00000000 */   nop
/* CDCF4 001CDBF4 15004014 */  bnez       $2, .L001CDC4C
/* CDCF8 001CDBF8 00000000 */   nop
/* CDCFC 001CDBFC 803F043C */  lui        $4, (0x3F800000 >> 16)
/* CDD00 001CDC00 0C94838F */  lw         $3, -0x6BF4($gp)
/* CDD04 001CDC04 C0100300 */  sll        $2, $3, 3
/* CDD08 001CDC08 21104300 */  addu       $2, $2, $3
/* CDD0C 001CDC0C 00190200 */  sll        $3, $2, 4
/* CDD10 001CDC10 D701023C */  lui        $2, %hi(D_1D6B624)
/* CDD14 001CDC14 24B64224 */  addiu      $2, $2, %lo(D_1D6B624)
/* CDD18 001CDC18 21104300 */  addu       $2, $2, $3
/* CDD1C 001CDC1C 21108202 */  addu       $2, $20, $2
/* CDD20 001CDC20 000044AC */  sw         $4, 0x0($2)
/* CDD24 001CDC24 2000422A */  slti       $2, $18, 0x20
/* CDD28 001CDC28 05004014 */  bnez       $2, .L001CDC40
/* CDD2C 001CDC2C 00000000 */   nop
/* CDD30 001CDC30 2A00023C */  lui        $2, %hi(_654)
/* CDD34 001CDC34 00C24424 */  addiu      $4, $2, %lo(_654)
/* CDD38 001CDC38 A611040C */  jal        printf
/* CDD3C 001CDC3C 00000000 */   nop
.L001CDC40:
/* CDD40 001CDC40 02007326 */  addiu      $19, $19, 0x2
/* CDD44 001CDC44 6C000010 */  b          .L001CDDF8
/* CDD48 001CDC48 00000000 */   nop
.L001CDC4C:
/* CDD4C 001CDC4C 2826A072 */  paddub     $4, $21, $0
/* CDD50 001CDC50 2A00023C */  lui        $2, %hi(_655)
/* CDD54 001CDC54 18C24524 */  addiu      $5, $2, %lo(_655)
/* CDD58 001CDC58 03000624 */  addiu      $6, $0, 0x3
/* CDD5C 001CDC5C C60C040C */  jal        memcmp
/* CDD60 001CDC60 00000000 */   nop
/* CDD64 001CDC64 14004014 */  bnez       $2, .L001CDCB8
/* CDD68 001CDC68 00000000 */   nop
/* CDD6C 001CDC6C 0C94838F */  lw         $3, -0x6BF4($gp)
/* CDD70 001CDC70 C0100300 */  sll        $2, $3, 3
/* CDD74 001CDC74 21104300 */  addu       $2, $2, $3
/* CDD78 001CDC78 00190200 */  sll        $3, $2, 4
/* CDD7C 001CDC7C D701023C */  lui        $2, %hi(D_1D6B624)
/* CDD80 001CDC80 24B64224 */  addiu      $2, $2, %lo(D_1D6B624)
/* CDD84 001CDC84 21104300 */  addu       $2, $2, $3
/* CDD88 001CDC88 21108202 */  addu       $2, $20, $2
/* CDD8C 001CDC8C 000040AC */  sw         $0, 0x0($2)
/* CDD90 001CDC90 2000422A */  slti       $2, $18, 0x20
/* CDD94 001CDC94 05004014 */  bnez       $2, .L001CDCAC
/* CDD98 001CDC98 00000000 */   nop
/* CDD9C 001CDC9C 2A00023C */  lui        $2, %hi(_654)
/* CDDA0 001CDCA0 00C24424 */  addiu      $4, $2, %lo(_654)
/* CDDA4 001CDCA4 A611040C */  jal        printf
/* CDDA8 001CDCA8 00000000 */   nop
.L001CDCAC:
/* CDDAC 001CDCAC 03007326 */  addiu      $19, $19, 0x3
/* CDDB0 001CDCB0 51000010 */  b          .L001CDDF8
/* CDDB4 001CDCB4 00000000 */   nop
.L001CDCB8:
/* CDDB8 001CDCB8 281E0070 */  paddub     $3, $0, $0
/* CDDBC 001CDCBC 0000A482 */  lb         $4, 0x0($21)
/* CDDC0 001CDCC0 2D000224 */  addiu      $2, $0, 0x2D
/* CDDC4 001CDCC4 02008214 */  bne        $4, $2, .L001CDCD0
/* CDDC8 001CDCC8 00000000 */   nop
/* CDDCC 001CDCCC 01000324 */  addiu      $3, $0, 0x1
.L001CDCD0:
/* CDDD0 001CDCD0 30008228 */  slti       $2, $4, 0x30
/* CDDD4 001CDCD4 05004014 */  bnez       $2, .L001CDCEC
/* CDDD8 001CDCD8 00000000 */   nop
/* CDDDC 001CDCDC 3A008128 */  slti       $at, $4, 0x3A
/* CDDE0 001CDCE0 02002010 */  beqz       $at, .L001CDCEC
/* CDDE4 001CDCE4 00000000 */   nop
/* CDDE8 001CDCE8 01000324 */  addiu      $3, $0, 0x1
.L001CDCEC:
/* CDDEC 001CDCEC 04006014 */  bnez       $3, .L001CDD00
/* CDDF0 001CDCF0 00000000 */   nop
/* CDDF4 001CDCF4 FFFF0224 */  addiu      $2, $0, -0x1
/* CDDF8 001CDCF8 D8000010 */  b          .L001CE05C
/* CDDFC 001CDCFC 00000000 */   nop
.L001CDD00:
/* CDE00 001CDD00 2826A072 */  paddub     $4, $21, $0
/* CDE04 001CDD04 8600040C */  jal        atof
/* CDE08 001CDD08 00000000 */   nop
/* CDE0C 001CDD0C 28264070 */  paddub     $4, $2, $0
/* CDE10 001CDD10 9241040C */  jal        dptofp
/* CDE14 001CDD14 00000000 */   nop
/* CDE18 001CDD18 0C94838F */  lw         $3, -0x6BF4($gp)
/* CDE1C 001CDD1C C0100300 */  sll        $2, $3, 3
/* CDE20 001CDD20 21104300 */  addu       $2, $2, $3
/* CDE24 001CDD24 00190200 */  sll        $3, $2, 4
/* CDE28 001CDD28 D701023C */  lui        $2, %hi(D_1D6B624)
/* CDE2C 001CDD2C 24B64224 */  addiu      $2, $2, %lo(D_1D6B624)
/* CDE30 001CDD30 21104300 */  addu       $2, $2, $3
/* CDE34 001CDD34 21108202 */  addu       $2, $20, $2
/* CDE38 001CDD38 000040E4 */  swc1       $f0, 0x0($2)
/* CDE3C 001CDD3C 2000422A */  slti       $2, $18, 0x20
/* CDE40 001CDD40 05004014 */  bnez       $2, .L001CDD58
/* CDE44 001CDD44 00000000 */   nop
/* CDE48 001CDD48 2A00023C */  lui        $2, %hi(_654)
/* CDE4C 001CDD4C 00C24424 */  addiu      $4, $2, %lo(_654)
/* CDE50 001CDD50 A611040C */  jal        printf
/* CDE54 001CDD54 00000000 */   nop
.L001CDD58:
/* CDE58 001CDD58 28160070 */  paddub     $2, $0, $0
/* CDE5C 001CDD5C 1D000010 */  b          .L001CDDD4
/* CDE60 001CDD60 00000000 */   nop
.L001CDD64:
/* CDE64 001CDD64 281E0070 */  paddub     $3, $0, $0
/* CDE68 001CDD68 21203302 */  addu       $4, $17, $19
/* CDE6C 001CDD6C 00008580 */  lb         $5, 0x0($4)
/* CDE70 001CDD70 2D000424 */  addiu      $4, $0, 0x2D
/* CDE74 001CDD74 0300A414 */  bne        $5, $4, .L001CDD84
/* CDE78 001CDD78 00000000 */   nop
/* CDE7C 001CDD7C 01007326 */  addiu      $19, $19, 0x1
/* CDE80 001CDD80 01000324 */  addiu      $3, $0, 0x1
.L001CDD84:
/* CDE84 001CDD84 21203302 */  addu       $4, $17, $19
/* CDE88 001CDD88 00008580 */  lb         $5, 0x0($4)
/* CDE8C 001CDD8C 3000A428 */  slti       $4, $5, 0x30
/* CDE90 001CDD90 06008014 */  bnez       $4, .L001CDDAC
/* CDE94 001CDD94 00000000 */   nop
/* CDE98 001CDD98 3A00A128 */  slti       $at, $5, 0x3A
/* CDE9C 001CDD9C 03002010 */  beqz       $at, .L001CDDAC
/* CDEA0 001CDDA0 00000000 */   nop
/* CDEA4 001CDDA4 01007326 */  addiu      $19, $19, 0x1
/* CDEA8 001CDDA8 01000324 */  addiu      $3, $0, 0x1
.L001CDDAC:
/* CDEAC 001CDDAC 21203302 */  addu       $4, $17, $19
/* CDEB0 001CDDB0 00008580 */  lb         $5, 0x0($4)
/* CDEB4 001CDDB4 2E000424 */  addiu      $4, $0, 0x2E
/* CDEB8 001CDDB8 0300A414 */  bne        $5, $4, .L001CDDC8
/* CDEBC 001CDDBC 00000000 */   nop
/* CDEC0 001CDDC0 01007326 */  addiu      $19, $19, 0x1
/* CDEC4 001CDDC4 01000324 */  addiu      $3, $0, 0x1
.L001CDDC8:
/* CDEC8 001CDDC8 05006010 */  beqz       $3, .L001CDDE0
/* CDECC 001CDDCC 00000000 */   nop
/* CDED0 001CDDD0 01004224 */  addiu      $2, $2, 0x1
.L001CDDD4:
/* CDED4 001CDDD4 20004328 */  slti       $3, $2, 0x20
/* CDED8 001CDDD8 E2FF6014 */  bnez       $3, .L001CDD64
/* CDEDC 001CDDDC 00000000 */   nop
.L001CDDE0:
/* CDEE0 001CDDE0 20000324 */  addiu      $3, $0, 0x20
/* CDEE4 001CDDE4 04004314 */  bne        $2, $3, .L001CDDF8
/* CDEE8 001CDDE8 00000000 */   nop
/* CDEEC 001CDDEC FFFF0224 */  addiu      $2, $0, -0x1
/* CDEF0 001CDDF0 9A000010 */  b          .L001CE05C
/* CDEF4 001CDDF4 00000000 */   nop
.L001CDDF8:
/* CDEF8 001CDDF8 28262072 */  paddub     $4, $17, $0
/* CDEFC 001CDDFC 282E6072 */  paddub     $5, $19, $0
/* CDF00 001CDE00 4436070C */  jal        skipSpace__FPci
/* CDF04 001CDE04 00000000 */   nop
/* CDF08 001CDE08 289E4070 */  paddub     $19, $2, $0
/* CDF0C 001CDE0C 8D000010 */  b          .L001CE044
/* CDF10 001CDE10 00000000 */   nop
.L001CDE14:
/* CDF14 001CDE14 21A83302 */  addu       $21, $17, $19
/* CDF18 001CDE18 2826A072 */  paddub     $4, $21, $0
/* CDF1C 001CDE1C 2A00023C */  lui        $2, %hi(_653)
/* CDF20 001CDE20 F0C14524 */  addiu      $5, $2, %lo(_653)
/* CDF24 001CDE24 C60C040C */  jal        memcmp
/* CDF28 001CDE28 00000000 */   nop
/* CDF2C 001CDE2C 15004014 */  bnez       $2, .L001CDE84
/* CDF30 001CDE30 00000000 */   nop
/* CDF34 001CDE34 803F043C */  lui        $4, (0x3F800000 >> 16)
/* CDF38 001CDE38 0C94838F */  lw         $3, -0x6BF4($gp)
/* CDF3C 001CDE3C C0100300 */  sll        $2, $3, 3
/* CDF40 001CDE40 21104300 */  addu       $2, $2, $3
/* CDF44 001CDE44 00190200 */  sll        $3, $2, 4
/* CDF48 001CDE48 D701023C */  lui        $2, %hi(D_1D6B624)
/* CDF4C 001CDE4C 24B64224 */  addiu      $2, $2, %lo(D_1D6B624)
/* CDF50 001CDE50 21104300 */  addu       $2, $2, $3
/* CDF54 001CDE54 21108202 */  addu       $2, $20, $2
/* CDF58 001CDE58 000044AC */  sw         $4, 0x0($2)
/* CDF5C 001CDE5C 2000422A */  slti       $2, $18, 0x20
/* CDF60 001CDE60 05004014 */  bnez       $2, .L001CDE78
/* CDF64 001CDE64 00000000 */   nop
/* CDF68 001CDE68 2A00023C */  lui        $2, %hi(_654)
/* CDF6C 001CDE6C 00C24424 */  addiu      $4, $2, %lo(_654)
/* CDF70 001CDE70 A611040C */  jal        printf
/* CDF74 001CDE74 00000000 */   nop
.L001CDE78:
/* CDF78 001CDE78 02007326 */  addiu      $19, $19, 0x2
/* CDF7C 001CDE7C 6C000010 */  b          .L001CE030
/* CDF80 001CDE80 00000000 */   nop
.L001CDE84:
/* CDF84 001CDE84 2826A072 */  paddub     $4, $21, $0
/* CDF88 001CDE88 2A00023C */  lui        $2, %hi(_655)
/* CDF8C 001CDE8C 18C24524 */  addiu      $5, $2, %lo(_655)
/* CDF90 001CDE90 03000624 */  addiu      $6, $0, 0x3
/* CDF94 001CDE94 C60C040C */  jal        memcmp
/* CDF98 001CDE98 00000000 */   nop
/* CDF9C 001CDE9C 14004014 */  bnez       $2, .L001CDEF0
/* CDFA0 001CDEA0 00000000 */   nop
/* CDFA4 001CDEA4 0C94838F */  lw         $3, -0x6BF4($gp)
/* CDFA8 001CDEA8 C0100300 */  sll        $2, $3, 3
/* CDFAC 001CDEAC 21104300 */  addu       $2, $2, $3
/* CDFB0 001CDEB0 00190200 */  sll        $3, $2, 4
/* CDFB4 001CDEB4 D701023C */  lui        $2, %hi(D_1D6B624)
/* CDFB8 001CDEB8 24B64224 */  addiu      $2, $2, %lo(D_1D6B624)
/* CDFBC 001CDEBC 21104300 */  addu       $2, $2, $3
/* CDFC0 001CDEC0 21108202 */  addu       $2, $20, $2
/* CDFC4 001CDEC4 000040AC */  sw         $0, 0x0($2)
/* CDFC8 001CDEC8 2000422A */  slti       $2, $18, 0x20
/* CDFCC 001CDECC 05004014 */  bnez       $2, .L001CDEE4
/* CDFD0 001CDED0 00000000 */   nop
/* CDFD4 001CDED4 2A00023C */  lui        $2, %hi(_654)
/* CDFD8 001CDED8 00C24424 */  addiu      $4, $2, %lo(_654)
/* CDFDC 001CDEDC A611040C */  jal        printf
/* CDFE0 001CDEE0 00000000 */   nop
.L001CDEE4:
/* CDFE4 001CDEE4 03007326 */  addiu      $19, $19, 0x3
/* CDFE8 001CDEE8 51000010 */  b          .L001CE030
/* CDFEC 001CDEEC 00000000 */   nop
.L001CDEF0:
/* CDFF0 001CDEF0 281E0070 */  paddub     $3, $0, $0
/* CDFF4 001CDEF4 0000A482 */  lb         $4, 0x0($21)
/* CDFF8 001CDEF8 2D000224 */  addiu      $2, $0, 0x2D
/* CDFFC 001CDEFC 02008214 */  bne        $4, $2, .L001CDF08
/* CE000 001CDF00 00000000 */   nop
/* CE004 001CDF04 01000324 */  addiu      $3, $0, 0x1
.L001CDF08:
/* CE008 001CDF08 30008228 */  slti       $2, $4, 0x30
/* CE00C 001CDF0C 05004014 */  bnez       $2, .L001CDF24
/* CE010 001CDF10 00000000 */   nop
/* CE014 001CDF14 3A008128 */  slti       $at, $4, 0x3A
/* CE018 001CDF18 02002010 */  beqz       $at, .L001CDF24
/* CE01C 001CDF1C 00000000 */   nop
/* CE020 001CDF20 01000324 */  addiu      $3, $0, 0x1
.L001CDF24:
/* CE024 001CDF24 04006014 */  bnez       $3, .L001CDF38
/* CE028 001CDF28 00000000 */   nop
/* CE02C 001CDF2C FFFF0224 */  addiu      $2, $0, -0x1
/* CE030 001CDF30 4A000010 */  b          .L001CE05C
/* CE034 001CDF34 00000000 */   nop
.L001CDF38:
/* CE038 001CDF38 2826A072 */  paddub     $4, $21, $0
/* CE03C 001CDF3C 8600040C */  jal        atof
/* CE040 001CDF40 00000000 */   nop
/* CE044 001CDF44 28264070 */  paddub     $4, $2, $0
/* CE048 001CDF48 9241040C */  jal        dptofp
/* CE04C 001CDF4C 00000000 */   nop
/* CE050 001CDF50 0C94838F */  lw         $3, -0x6BF4($gp)
/* CE054 001CDF54 C0100300 */  sll        $2, $3, 3
/* CE058 001CDF58 21104300 */  addu       $2, $2, $3
/* CE05C 001CDF5C 00190200 */  sll        $3, $2, 4
/* CE060 001CDF60 D701023C */  lui        $2, %hi(D_1D6B624)
/* CE064 001CDF64 24B64224 */  addiu      $2, $2, %lo(D_1D6B624)
/* CE068 001CDF68 21104300 */  addu       $2, $2, $3
/* CE06C 001CDF6C 21108202 */  addu       $2, $20, $2
/* CE070 001CDF70 000040E4 */  swc1       $f0, 0x0($2)
/* CE074 001CDF74 2000422A */  slti       $2, $18, 0x20
/* CE078 001CDF78 05004014 */  bnez       $2, .L001CDF90
/* CE07C 001CDF7C 00000000 */   nop
/* CE080 001CDF80 2A00023C */  lui        $2, %hi(_654)
/* CE084 001CDF84 00C24424 */  addiu      $4, $2, %lo(_654)
/* CE088 001CDF88 A611040C */  jal        printf
/* CE08C 001CDF8C 00000000 */   nop
.L001CDF90:
/* CE090 001CDF90 28160070 */  paddub     $2, $0, $0
/* CE094 001CDF94 1D000010 */  b          .L001CE00C
/* CE098 001CDF98 00000000 */   nop
.L001CDF9C:
/* CE09C 001CDF9C 281E0070 */  paddub     $3, $0, $0
/* CE0A0 001CDFA0 21203302 */  addu       $4, $17, $19
/* CE0A4 001CDFA4 00008580 */  lb         $5, 0x0($4)
/* CE0A8 001CDFA8 2D000424 */  addiu      $4, $0, 0x2D
/* CE0AC 001CDFAC 0300A414 */  bne        $5, $4, .L001CDFBC
/* CE0B0 001CDFB0 00000000 */   nop
/* CE0B4 001CDFB4 01007326 */  addiu      $19, $19, 0x1
/* CE0B8 001CDFB8 01000324 */  addiu      $3, $0, 0x1
.L001CDFBC:
/* CE0BC 001CDFBC 21203302 */  addu       $4, $17, $19
/* CE0C0 001CDFC0 00008580 */  lb         $5, 0x0($4)
/* CE0C4 001CDFC4 3000A428 */  slti       $4, $5, 0x30
/* CE0C8 001CDFC8 06008014 */  bnez       $4, .L001CDFE4
/* CE0CC 001CDFCC 00000000 */   nop
/* CE0D0 001CDFD0 3A00A128 */  slti       $at, $5, 0x3A
/* CE0D4 001CDFD4 03002010 */  beqz       $at, .L001CDFE4
/* CE0D8 001CDFD8 00000000 */   nop
/* CE0DC 001CDFDC 01007326 */  addiu      $19, $19, 0x1
/* CE0E0 001CDFE0 01000324 */  addiu      $3, $0, 0x1
.L001CDFE4:
/* CE0E4 001CDFE4 21203302 */  addu       $4, $17, $19
/* CE0E8 001CDFE8 00008580 */  lb         $5, 0x0($4)
/* CE0EC 001CDFEC 2E000424 */  addiu      $4, $0, 0x2E
/* CE0F0 001CDFF0 0300A414 */  bne        $5, $4, .L001CE000
/* CE0F4 001CDFF4 00000000 */   nop
/* CE0F8 001CDFF8 01007326 */  addiu      $19, $19, 0x1
/* CE0FC 001CDFFC 01000324 */  addiu      $3, $0, 0x1
.L001CE000:
/* CE100 001CE000 05006010 */  beqz       $3, .L001CE018
/* CE104 001CE004 00000000 */   nop
/* CE108 001CE008 01004224 */  addiu      $2, $2, 0x1
.L001CE00C:
/* CE10C 001CE00C 20004328 */  slti       $3, $2, 0x20
/* CE110 001CE010 E2FF6014 */  bnez       $3, .L001CDF9C
/* CE114 001CE014 00000000 */   nop
.L001CE018:
/* CE118 001CE018 20000324 */  addiu      $3, $0, 0x20
/* CE11C 001CE01C 04004314 */  bne        $2, $3, .L001CE030
/* CE120 001CE020 00000000 */   nop
/* CE124 001CE024 FFFF0224 */  addiu      $2, $0, -0x1
/* CE128 001CE028 0C000010 */  b          .L001CE05C
/* CE12C 001CE02C 00000000 */   nop
.L001CE030:
/* CE130 001CE030 28262072 */  paddub     $4, $17, $0
/* CE134 001CE034 282E6072 */  paddub     $5, $19, $0
/* CE138 001CE038 4436070C */  jal        skipSpace__FPci
/* CE13C 001CE03C 00000000 */   nop
/* CE140 001CE040 289E4070 */  paddub     $19, $2, $0
.L001CE044:
/* CE144 001CE044 01005226 */  addiu      $18, $18, 0x1
.L001CE048:
/* CE148 001CE048 0400028E */  lw         $2, 0x4($16)
/* CE14C 001CE04C 2A104202 */  slt        $2, $18, $2
/* CE150 001CE050 87FE4014 */  bnez       $2, .L001CDA70
/* CE154 001CE054 00000000 */   nop
/* CE158 001CE058 28166072 */  paddub     $2, $19, $0
.L001CE05C:
/* CE15C 001CE05C 6000BF7B */  lq         $31, 0x60($sp)
/* CE160 001CE060 5000B57B */  lq         $21, 0x50($sp)
/* CE164 001CE064 4000B47B */  lq         $20, 0x40($sp)
/* CE168 001CE068 3000B37B */  lq         $19, 0x30($sp)
/* CE16C 001CE06C 2000B27B */  lq         $18, 0x20($sp)
/* CE170 001CE070 1000B17B */  lq         $17, 0x10($sp)
/* CE174 001CE074 0000B07B */  lq         $16, 0x0($sp)
/* CE178 001CE078 7000BD27 */  addiu      $sp, $sp, 0x70
/* CE17C 001CE07C 0800E003 */  jr         $31
/* CE180 001CE080 00000000 */   nop
/* CE184 001CE084 00000000 */  nop
/* CE188 001CE088 00000000 */  nop
/* CE18C 001CE08C 00000000 */  nop
