.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ItemPosInfoInit__Fv
/* EDE00 001EDD00 8494838F */  lw         $3, -0x6B7C($gp)
/* EDE04 001EDD04 60436724 */  addiu      $7, $3, 0x4360
/* EDE08 001EDD08 281E0070 */  paddub     $3, $0, $0
/* EDE0C 001EDD0C 13000010 */  b          .L001EDD5C
/* EDE10 001EDD10 00000000 */   nop
.L001EDD14:
/* EDE14 001EDD14 40200300 */  sll        $4, $3, 1
/* EDE18 001EDD18 21208700 */  addu       $4, $4, $7
/* EDE1C 001EDD1C 0E008484 */  lh         $4, 0xE($4)
/* EDE20 001EDD20 84008428 */  slti       $4, $4, 0x84
/* EDE24 001EDD24 08008014 */  bnez       $4, .L001EDD48
/* EDE28 001EDD28 00000000 */   nop
/* EDE2C 001EDD2C 02000624 */  addiu      $6, $0, 0x2
/* EDE30 001EDD30 80280300 */  sll        $5, $3, 2
/* EDE34 001EDD34 9494848F */  lw         $4, -0x6B6C($gp)
/* EDE38 001EDD38 21208500 */  addu       $4, $4, $5
/* EDE3C 001EDD3C 000086AC */  sw         $6, 0x0($4)
/* EDE40 001EDD40 05000010 */  b          .L001EDD58
/* EDE44 001EDD44 00000000 */   nop
.L001EDD48:
/* EDE48 001EDD48 80280300 */  sll        $5, $3, 2
/* EDE4C 001EDD4C 9494848F */  lw         $4, -0x6B6C($gp)
/* EDE50 001EDD50 21208500 */  addu       $4, $4, $5
/* EDE54 001EDD54 000080AC */  sw         $0, 0x0($4)
.L001EDD58:
/* EDE58 001EDD58 01006324 */  addiu      $3, $3, 0x1
.L001EDD5C:
/* EDE5C 001EDD5C 64006428 */  slti       $4, $3, 0x64
/* EDE60 001EDD60 ECFF8014 */  bnez       $4, .L001EDD14
/* EDE64 001EDD64 00000000 */   nop
/* EDE68 001EDD68 281E0070 */  paddub     $3, $0, $0
/* EDE6C 001EDD6C 29000010 */  b          .L001EDE14
/* EDE70 001EDD70 00000000 */   nop
.L001EDD74:
/* EDE74 001EDD74 8494858F */  lw         $5, -0x6B7C($gp)
/* EDE78 001EDD78 A80A0424 */  addiu      $4, $0, 0xAA8
/* EDE7C 001EDD7C 18206400 */  mult       $4, $3, $4
/* EDE80 001EDD80 2120A400 */  addu       $4, $5, $4
/* EDE84 001EDD84 0C458524 */  addiu      $5, $4, 0x450C
/* EDE88 001EDD88 28260070 */  paddub     $4, $0, $0
/* EDE8C 001EDD8C 1D000010 */  b          .L001EDE04
/* EDE90 001EDD90 00000000 */   nop
.L001EDD94:
/* EDE94 001EDD94 40310400 */  sll        $6, $4, 5
/* EDE98 001EDD98 2330C400 */  subu       $6, $6, $4
/* EDE9C 001EDD9C C0300600 */  sll        $6, $6, 3
/* EDEA0 001EDDA0 2130A600 */  addu       $6, $5, $6
/* EDEA4 001EDDA4 0000C684 */  lh         $6, 0x0($6)
/* EDEA8 001EDDA8 0101C628 */  slti       $6, $6, 0x101
/* EDEAC 001EDDAC 0C00C014 */  bnez       $6, .L001EDDE0
/* EDEB0 001EDDB0 00000000 */   nop
/* EDEB4 001EDDB4 02000824 */  addiu      $8, $0, 0x2
/* EDEB8 001EDDB8 80300300 */  sll        $6, $3, 2
/* EDEBC 001EDDBC 2130C300 */  addu       $6, $6, $3
/* EDEC0 001EDDC0 C0380600 */  sll        $7, $6, 3
/* EDEC4 001EDDC4 9894868F */  lw         $6, -0x6B68($gp)
/* EDEC8 001EDDC8 2138C700 */  addu       $7, $6, $7
/* EDECC 001EDDCC 80300400 */  sll        $6, $4, 2
/* EDED0 001EDDD0 2130E600 */  addu       $6, $7, $6
/* EDED4 001EDDD4 0000C8AC */  sw         $8, 0x0($6)
/* EDED8 001EDDD8 09000010 */  b          .L001EDE00
/* EDEDC 001EDDDC 00000000 */   nop
.L001EDDE0:
/* EDEE0 001EDDE0 80300300 */  sll        $6, $3, 2
/* EDEE4 001EDDE4 2130C300 */  addu       $6, $6, $3
/* EDEE8 001EDDE8 C0380600 */  sll        $7, $6, 3
/* EDEEC 001EDDEC 9894868F */  lw         $6, -0x6B68($gp)
/* EDEF0 001EDDF0 2138C700 */  addu       $7, $6, $7
/* EDEF4 001EDDF4 80300400 */  sll        $6, $4, 2
/* EDEF8 001EDDF8 2130E600 */  addu       $6, $7, $6
/* EDEFC 001EDDFC 0000C0AC */  sw         $0, 0x0($6)
.L001EDE00:
/* EDF00 001EDE00 01008424 */  addiu      $4, $4, 0x1
.L001EDE04:
/* EDF04 001EDE04 0A008628 */  slti       $6, $4, 0xA
/* EDF08 001EDE08 E2FFC014 */  bnez       $6, .L001EDD94
/* EDF0C 001EDE0C 00000000 */   nop
/* EDF10 001EDE10 01006324 */  addiu      $3, $3, 0x1
.L001EDE14:
/* EDF14 001EDE14 06006428 */  slti       $4, $3, 0x6
/* EDF18 001EDE18 D6FF8014 */  bnez       $4, .L001EDD74
/* EDF1C 001EDE1C 00000000 */   nop
/* EDF20 001EDE20 8494838F */  lw         $3, -0x6B7C($gp)
/* EDF24 001EDE24 04056724 */  addiu      $7, $3, 0x504
/* EDF28 001EDE28 F87FE724 */  addiu      $7, $7, 0x7FF8
/* EDF2C 001EDE2C 281E0070 */  paddub     $3, $0, $0
/* EDF30 001EDE30 13000010 */  b          .L001EDE80
/* EDF34 001EDE34 00000000 */   nop
.L001EDE38:
/* EDF38 001EDE38 40210300 */  sll        $4, $3, 5
/* EDF3C 001EDE3C 2120E400 */  addu       $4, $7, $4
/* EDF40 001EDE40 00008484 */  lh         $4, 0x0($4)
/* EDF44 001EDE44 51008428 */  slti       $4, $4, 0x51
/* EDF48 001EDE48 08008014 */  bnez       $4, .L001EDE6C
/* EDF4C 001EDE4C 00000000 */   nop
/* EDF50 001EDE50 02000624 */  addiu      $6, $0, 0x2
/* EDF54 001EDE54 80280300 */  sll        $5, $3, 2
/* EDF58 001EDE58 9C94848F */  lw         $4, -0x6B64($gp)
/* EDF5C 001EDE5C 21208500 */  addu       $4, $4, $5
/* EDF60 001EDE60 000086AC */  sw         $6, 0x0($4)
/* EDF64 001EDE64 05000010 */  b          .L001EDE7C
/* EDF68 001EDE68 00000000 */   nop
.L001EDE6C:
/* EDF6C 001EDE6C 80280300 */  sll        $5, $3, 2
/* EDF70 001EDE70 9C94848F */  lw         $4, -0x6B64($gp)
/* EDF74 001EDE74 21208500 */  addu       $4, $4, $5
/* EDF78 001EDE78 000080AC */  sw         $0, 0x0($4)
.L001EDE7C:
/* EDF7C 001EDE7C 01006324 */  addiu      $3, $3, 0x1
.L001EDE80:
/* EDF80 001EDE80 28006428 */  slti       $4, $3, 0x28
/* EDF84 001EDE84 ECFF8014 */  bnez       $4, .L001EDE38
/* EDF88 001EDE88 00000000 */   nop
/* EDF8C 001EDE8C 0800E003 */  jr         $31
/* EDF90 001EDE90 00000000 */   nop
/* EDF94 001EDE94 00000000 */  nop
/* EDF98 001EDE98 00000000 */  nop
/* EDF9C 001EDE9C 00000000 */  nop
