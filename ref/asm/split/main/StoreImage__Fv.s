.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel StoreImage__Fv
/* 02C900 0012C800 C0FEBD27 */  addiu       $29, $29, -0x140
/* 02C904 0012C804 3000BF7F */  sq          $31, 0x30($29)
/* 02C908 0012C808 2000B27F */  sq          $18, 0x20($29)
/* 02C90C 0012C80C 1000B17F */  sq          $17, 0x10($29)
/* 02C910 0012C810 0000B07F */  sq          $16, 0x0($29)
/* 02C914 0012C814 288C8283 */  lb          $2, -0x73D8($28)
/* 02C918 0012C818 04004014 */  bnez        $2, .L0012C82C
/* 02C91C 0012C81C 00000000 */   nop
/* 02C920 0012C820 248C80AF */  sw          $0, -0x73DC($28)
/* 02C924 0012C824 01000224 */  addiu       $2, $0, 0x1
/* 02C928 0012C828 288C82A3 */  sb          $2, -0x73D8($28)
.L0012C82C:
/* 02C92C 0012C82C 01000224 */  addiu       $2, $0, 0x1
/* 02C930 0012C830 208C82AF */  sw          $2, -0x73E0($28)
/* 02C934 0012C834 C08B868F */  lw          $6, -0x7440($28)
/* 02C938 0012C838 40190600 */  sll         $3, $6, 5
/* 02C93C 0012C83C C801023C */  lui         $2, %hi(vifpacket)
/* 02C940 0012C840 80A74224 */  addiu       $2, $2, %lo(vifpacket)
/* 02C944 0012C844 21884300 */  addu        $17, $2, $3
/* 02C948 0012C848 2A00023C */  lui         $2, %hi(LIT_250)
/* 02C94C 0012C84C 088E4424 */  addiu       $4, $2, %lo(LIT_250)
/* 02C950 0012C850 248C858F */  lw          $5, -0x73DC($28)
/* 02C954 0012C854 D88B878F */  lw          $7, -0x7428($28)
/* 02C958 0012C858 A611040C */  jal         printf
/* 02C95C 0012C85C 00000000 */   nop
/* 02C960 0012C860 208C838F */  lw          $3, -0x73E0($28)
/* 02C964 0012C864 01006230 */  andi        $2, $3, 0x1
/* 02C968 0012C868 04006104 */  bgez        $3, .L0012C87C
/* 02C96C 0012C86C 00000000 */   nop
/* 02C970 0012C870 02004010 */  beqz        $2, .L0012C87C
/* 02C974 0012C874 00000000 */   nop
/* 02C978 0012C878 FEFF4224 */  addiu       $2, $2, -0x2
.L0012C87C:
/* 02C97C 0012C87C 22004010 */  beqz        $2, .L0012C908
/* 02C980 0012C880 00000000 */   nop
/* 02C984 0012C884 C000A427 */  addiu       $4, $29, 0xC0
/* 02C988 0012C888 2A00023C */  lui         $2, %hi(LIT_251)
/* 02C98C 0012C88C 208E4524 */  addiu       $5, $2, %lo(LIT_251)
/* 02C990 0012C890 5A15040C */  jal         strcpy
/* 02C994 0012C894 00000000 */   nop
/* 02C998 0012C898 248C878F */  lw          $7, -0x73DC($28)
/* 02C99C 0012C89C 0100E224 */  addiu       $2, $7, 0x1
/* 02C9A0 0012C8A0 248C82AF */  sw          $2, -0x73DC($28)
/* 02C9A4 0012C8A4 4000A427 */  addiu       $4, $29, 0x40
/* 02C9A8 0012C8A8 2A00023C */  lui         $2, %hi(LIT_252)
/* 02C9AC 0012C8AC 388E4524 */  addiu       $5, $2, %lo(LIT_252)
/* 02C9B0 0012C8B0 C000A627 */  addiu       $6, $29, 0xC0
/* 02C9B4 0012C8B4 1614040C */  jal         sprintf
/* 02C9B8 0012C8B8 00000000 */   nop
/* 02C9BC 0012C8BC 4000A427 */  addiu       $4, $29, 0x40
/* 02C9C0 0012C8C0 09000010 */  b           .L0012C8E8
/* 02C9C4 0012C8C4 00000000 */   nop
.L0012C8C8:
/* 02C9C8 0012C8C8 3C1E0200 */  dsll32      $3, $2, 24
/* 02C9CC 0012C8CC 3F1E0300 */  dsra32      $3, $3, 24
/* 02C9D0 0012C8D0 20000224 */  addiu       $2, $0, 0x20
/* 02C9D4 0012C8D4 03006214 */  bne         $3, $2, .L0012C8E4
/* 02C9D8 0012C8D8 00000000 */   nop
/* 02C9DC 0012C8DC 30000224 */  addiu       $2, $0, 0x30
/* 02C9E0 0012C8E0 000082A0 */  sb          $2, 0x0($4)
.L0012C8E4:
/* 02C9E4 0012C8E4 01008424 */  addiu       $4, $4, 0x1
.L0012C8E8:
/* 02C9E8 0012C8E8 00008280 */  lb          $2, 0x0($4)
/* 02C9EC 0012C8EC F6FF4014 */  bnez        $2, .L0012C8C8
/* 02C9F0 0012C8F0 00000000 */   nop
/* 02C9F4 0012C8F4 4000A427 */  addiu       $4, $29, 0x40
/* 02C9F8 0012C8F8 02060524 */  addiu       $5, $0, 0x602
/* 02C9FC 0012C8FC 865F040C */  jal         sceOpen
/* 02CA00 0012C900 00000000 */   nop
/* 02CA04 0012C904 28864070 */  paddub      $16, $2, $0
.L0012C908:
/* 02CA08 0012C908 C701023C */  lui         $2, %hi(mgDBuff + 0x60)
/* 02CA0C 0012C90C 30534424 */  addiu       $4, $2, %lo(mgDBuff + 0x60)
/* 02CA10 0012C910 00080524 */  addiu       $5, $0, 0x800
/* 02CA14 0012C914 2836A070 */  paddub      $6, $5, $0
/* 02CA18 0012C918 283E0070 */  paddub      $7, $0, $0
/* 02CA1C 0012C91C 924F040C */  jal         sceGsSetHalfOffset
/* 02CA20 0012C920 00000000 */   nop
/* 02CA24 0012C924 C701023C */  lui         $2, %hi(mgDBuff + 0x150)
/* 02CA28 0012C928 20544424 */  addiu       $4, $2, %lo(mgDBuff + 0x150)
/* 02CA2C 0012C92C 00080524 */  addiu       $5, $0, 0x800
/* 02CA30 0012C930 2836A070 */  paddub      $6, $5, $0
/* 02CA34 0012C934 283E0070 */  paddub      $7, $0, $0
/* 02CA38 0012C938 924F040C */  jal         sceGsSetHalfOffset
/* 02CA3C 0012C93C 00000000 */   nop
/* 02CA40 0012C940 28260070 */  paddub      $4, $0, $0
/* 02CA44 0012C944 6851040C */  jal         FlushCache
/* 02CA48 0012C948 00000000 */   nop
/* 02CA4C 0012C94C C701023C */  lui         $2, %hi(mgDBuff)
/* 02CA50 0012C950 D0524424 */  addiu       $4, $2, %lo(mgDBuff)
/* 02CA54 0012C954 C08B858F */  lw          $5, -0x7440($28)
/* 02CA58 0012C958 A84B040C */  jal         sceGsSwapDBuff
/* 02CA5C 0012C95C 00000000 */   nop
/* 02CA60 0012C960 28260070 */  paddub      $4, $0, $0
/* 02CA64 0012C964 6851040C */  jal         FlushCache
/* 02CA68 0012C968 00000000 */   nop
/* 02CA6C 0012C96C 28260070 */  paddub      $4, $0, $0
/* 02CA70 0012C970 282E0070 */  paddub      $5, $0, $0
/* 02CA74 0012C974 E64B040C */  jal         sceGsSyncPath
/* 02CA78 0012C978 00000000 */   nop
/* 02CA7C 0012C97C C88B858F */  lw          $5, -0x7438($28)
/* 02CA80 0012C980 0000A490 */  lbu         $4, 0x0($5)
/* 02CA84 0012C984 40000364 */  daddiu      $3, $0, 0x40
/* 02CA88 0012C988 BFFF0224 */  addiu       $2, $0, -0x41
/* 02CA8C 0012C98C 24108200 */  and         $2, $4, $2
/* 02CA90 0012C990 25104300 */  or          $2, $2, $3
/* 02CA94 0012C994 0000A2A0 */  sb          $2, 0x0($5)
/* 02CA98 0012C998 C88B848F */  lw          $4, -0x7438($28)
/* 02CA9C 0012C99C 0400258E */  lw          $5, 0x4($17)
/* 02CAA0 0012C9A0 BE31040C */  jal         sceDmaSend
/* 02CAA4 0012C9A4 00000000 */   nop
/* 02CAA8 0012C9A8 28260070 */  paddub      $4, $0, $0
/* 02CAAC 0012C9AC 282E0070 */  paddub      $5, $0, $0
/* 02CAB0 0012C9B0 E64B040C */  jal         sceGsSyncPath
/* 02CAB4 0012C9B4 00000000 */   nop
/* 02CAB8 0012C9B8 C08B828F */  lw          $2, -0x7440($28)
/* 02CABC 0012C9BC 2B100200 */  sltu        $2, $0, $2
/* 02CAC0 0012C9C0 01004238 */  xori        $2, $2, 0x1
/* 02CAC4 0012C9C4 FF004330 */  andi        $3, $2, 0xFF
/* 02CAC8 0012C9C8 C0100300 */  sll         $2, $3, 3
/* 02CACC 0012C9CC 23184300 */  subu        $3, $2, $3
/* 02CAD0 0012C9D0 80100300 */  sll         $2, $3, 2
/* 02CAD4 0012C9D4 21106200 */  addu        $2, $3, $2
/* 02CAD8 0012C9D8 80110200 */  sll         $2, $2, 6
/* 02CADC 0012C9DC 3C2C0200 */  dsll32      $5, $2, 16
/* 02CAE0 0012C9E0 3F2C0500 */  dsra32      $5, $5, 16
/* 02CAE4 0012C9E4 C801023C */  lui         $2, %hi(gs_simage)
/* 02CAE8 0012C9E8 C0A74424 */  addiu       $4, $2, %lo(gs_simage)
/* 02CAEC 0012C9EC 0A000624 */  addiu       $6, $0, 0xA
/* 02CAF0 0012C9F0 283E0070 */  paddub      $7, $0, $0
/* 02CAF4 0012C9F4 28460070 */  paddub      $8, $0, $0
/* 02CAF8 0012C9F8 284E0070 */  paddub      $9, $0, $0
/* 02CAFC 0012C9FC 80020A24 */  addiu       $10, $0, 0x280
/* 02CB00 0012CA00 E0000B24 */  addiu       $11, $0, 0xE0
/* 02CB04 0012CA04 264D040C */  jal         sceGsSetDefStoreImage
/* 02CB08 0012CA08 00000000 */   nop
/* 02CB0C 0012CA0C 28260070 */  paddub      $4, $0, $0
/* 02CB10 0012CA10 6851040C */  jal         FlushCache
/* 02CB14 0012CA14 00000000 */   nop
/* 02CB18 0012CA18 208C838F */  lw          $3, -0x73E0($28)
/* 02CB1C 0012CA1C 01006230 */  andi        $2, $3, 0x1
/* 02CB20 0012CA20 04006104 */  bgez        $3, .L0012CA34
/* 02CB24 0012CA24 00000000 */   nop
/* 02CB28 0012CA28 02004010 */  beqz        $2, .L0012CA34
/* 02CB2C 0012CA2C 00000000 */   nop
/* 02CB30 0012CA30 FEFF4224 */  addiu       $2, $2, -0x2
.L0012CA34:
/* 02CB34 0012CA34 08004010 */  beqz        $2, .L0012CA58
/* 02CB38 0012CA38 00000000 */   nop
/* 02CB3C 0012CA3C C801023C */  lui         $2, %hi(gs_simage)
/* 02CB40 0012CA40 C0A74424 */  addiu       $4, $2, %lo(gs_simage)
/* 02CB44 0012CA44 1002053C */  lui         $5, (0x2100000 >> 16)
/* 02CB48 0012CA48 D64D040C */  jal         sceGsExecStoreImage
/* 02CB4C 0012CA4C 00000000 */   nop
/* 02CB50 0012CA50 06000010 */  b           .L0012CA6C
/* 02CB54 0012CA54 00000000 */   nop
.L0012CA58:
/* 02CB58 0012CA58 C801023C */  lui         $2, %hi(gs_simage)
/* 02CB5C 0012CA5C C0A74424 */  addiu       $4, $2, %lo(gs_simage)
/* 02CB60 0012CA60 3002053C */  lui         $5, (0x2300000 >> 16)
/* 02CB64 0012CA64 D64D040C */  jal         sceGsExecStoreImage
/* 02CB68 0012CA68 00000000 */   nop
.L0012CA6C:
/* 02CB6C 0012CA6C 28260070 */  paddub      $4, $0, $0
/* 02CB70 0012CA70 282E0070 */  paddub      $5, $0, $0
/* 02CB74 0012CA74 E64B040C */  jal         sceGsSyncPath
/* 02CB78 0012CA78 00000000 */   nop
/* 02CB7C 0012CA7C C701023C */  lui         $2, %hi(mgDBuff + 0x60)
/* 02CB80 0012CA80 30534424 */  addiu       $4, $2, %lo(mgDBuff + 0x60)
/* 02CB84 0012CA84 00080524 */  addiu       $5, $0, 0x800
/* 02CB88 0012CA88 2836A070 */  paddub      $6, $5, $0
/* 02CB8C 0012CA8C 01000724 */  addiu       $7, $0, 0x1
/* 02CB90 0012CA90 924F040C */  jal         sceGsSetHalfOffset
/* 02CB94 0012CA94 00000000 */   nop
/* 02CB98 0012CA98 C701023C */  lui         $2, %hi(mgDBuff + 0x150)
/* 02CB9C 0012CA9C 20544424 */  addiu       $4, $2, %lo(mgDBuff + 0x150)
/* 02CBA0 0012CAA0 00080524 */  addiu       $5, $0, 0x800
/* 02CBA4 0012CAA4 2836A070 */  paddub      $6, $5, $0
/* 02CBA8 0012CAA8 01000724 */  addiu       $7, $0, 0x1
/* 02CBAC 0012CAAC 924F040C */  jal         sceGsSetHalfOffset
/* 02CBB0 0012CAB0 00000000 */   nop
/* 02CBB4 0012CAB4 28260070 */  paddub      $4, $0, $0
/* 02CBB8 0012CAB8 6851040C */  jal         FlushCache
/* 02CBBC 0012CABC 00000000 */   nop
/* 02CBC0 0012CAC0 28260070 */  paddub      $4, $0, $0
/* 02CBC4 0012CAC4 282E0070 */  paddub      $5, $0, $0
/* 02CBC8 0012CAC8 E64B040C */  jal         sceGsSyncPath
/* 02CBCC 0012CACC 00000000 */   nop
/* 02CBD0 0012CAD0 C701023C */  lui         $2, %hi(mgDBuff)
/* 02CBD4 0012CAD4 D0524424 */  addiu       $4, $2, %lo(mgDBuff)
/* 02CBD8 0012CAD8 C08B858F */  lw          $5, -0x7440($28)
/* 02CBDC 0012CADC A84B040C */  jal         sceGsSwapDBuff
/* 02CBE0 0012CAE0 00000000 */   nop
/* 02CBE4 0012CAE4 28260070 */  paddub      $4, $0, $0
/* 02CBE8 0012CAE8 6851040C */  jal         FlushCache
/* 02CBEC 0012CAEC 00000000 */   nop
/* 02CBF0 0012CAF0 28260070 */  paddub      $4, $0, $0
/* 02CBF4 0012CAF4 282E0070 */  paddub      $5, $0, $0
/* 02CBF8 0012CAF8 E64B040C */  jal         sceGsSyncPath
/* 02CBFC 0012CAFC 00000000 */   nop
/* 02CC00 0012CB00 C88B858F */  lw          $5, -0x7438($28)
/* 02CC04 0012CB04 0000A490 */  lbu         $4, 0x0($5)
/* 02CC08 0012CB08 40000364 */  daddiu      $3, $0, 0x40
/* 02CC0C 0012CB0C BFFF0224 */  addiu       $2, $0, -0x41
/* 02CC10 0012CB10 24108200 */  and         $2, $4, $2
/* 02CC14 0012CB14 25104300 */  or          $2, $2, $3
/* 02CC18 0012CB18 0000A2A0 */  sb          $2, 0x0($5)
/* 02CC1C 0012CB1C C88B848F */  lw          $4, -0x7438($28)
/* 02CC20 0012CB20 0400258E */  lw          $5, 0x4($17)
/* 02CC24 0012CB24 BE31040C */  jal         sceDmaSend
/* 02CC28 0012CB28 00000000 */   nop
/* 02CC2C 0012CB2C 28260070 */  paddub      $4, $0, $0
/* 02CC30 0012CB30 282E0070 */  paddub      $5, $0, $0
/* 02CC34 0012CB34 E64B040C */  jal         sceGsSyncPath
/* 02CC38 0012CB38 00000000 */   nop
/* 02CC3C 0012CB3C C08B828F */  lw          $2, -0x7440($28)
/* 02CC40 0012CB40 2B100200 */  sltu        $2, $0, $2
/* 02CC44 0012CB44 01004238 */  xori        $2, $2, 0x1
/* 02CC48 0012CB48 FF004330 */  andi        $3, $2, 0xFF
/* 02CC4C 0012CB4C C0100300 */  sll         $2, $3, 3
/* 02CC50 0012CB50 23184300 */  subu        $3, $2, $3
/* 02CC54 0012CB54 80100300 */  sll         $2, $3, 2
/* 02CC58 0012CB58 21106200 */  addu        $2, $3, $2
/* 02CC5C 0012CB5C 80110200 */  sll         $2, $2, 6
/* 02CC60 0012CB60 3C2C0200 */  dsll32      $5, $2, 16
/* 02CC64 0012CB64 3F2C0500 */  dsra32      $5, $5, 16
/* 02CC68 0012CB68 C801023C */  lui         $2, %hi(gs_simage)
/* 02CC6C 0012CB6C C0A74424 */  addiu       $4, $2, %lo(gs_simage)
/* 02CC70 0012CB70 0A000624 */  addiu       $6, $0, 0xA
/* 02CC74 0012CB74 283E0070 */  paddub      $7, $0, $0
/* 02CC78 0012CB78 28460070 */  paddub      $8, $0, $0
/* 02CC7C 0012CB7C 284E0070 */  paddub      $9, $0, $0
/* 02CC80 0012CB80 80020A24 */  addiu       $10, $0, 0x280
/* 02CC84 0012CB84 E0000B24 */  addiu       $11, $0, 0xE0
/* 02CC88 0012CB88 264D040C */  jal         sceGsSetDefStoreImage
/* 02CC8C 0012CB8C 00000000 */   nop
/* 02CC90 0012CB90 28260070 */  paddub      $4, $0, $0
/* 02CC94 0012CB94 6851040C */  jal         FlushCache
/* 02CC98 0012CB98 00000000 */   nop
/* 02CC9C 0012CB9C 208C838F */  lw          $3, -0x73E0($28)
/* 02CCA0 0012CBA0 01006230 */  andi        $2, $3, 0x1
/* 02CCA4 0012CBA4 04006104 */  bgez        $3, .L0012CBB8
/* 02CCA8 0012CBA8 00000000 */   nop
/* 02CCAC 0012CBAC 02004010 */  beqz        $2, .L0012CBB8
/* 02CCB0 0012CBB0 00000000 */   nop
/* 02CCB4 0012CBB4 FEFF4224 */  addiu       $2, $2, -0x2
.L0012CBB8:
/* 02CCB8 0012CBB8 08004010 */  beqz        $2, .L0012CBDC
/* 02CCBC 0012CBBC 00000000 */   nop
/* 02CCC0 0012CBC0 C801023C */  lui         $2, %hi(gs_simage)
/* 02CCC4 0012CBC4 C0A74424 */  addiu       $4, $2, %lo(gs_simage)
/* 02CCC8 0012CBC8 2002053C */  lui         $5, (0x2200000 >> 16)
/* 02CCCC 0012CBCC D64D040C */  jal         sceGsExecStoreImage
/* 02CCD0 0012CBD0 00000000 */   nop
/* 02CCD4 0012CBD4 06000010 */  b           .L0012CBF0
/* 02CCD8 0012CBD8 00000000 */   nop
.L0012CBDC:
/* 02CCDC 0012CBDC C801023C */  lui         $2, %hi(gs_simage)
/* 02CCE0 0012CBE0 C0A74424 */  addiu       $4, $2, %lo(gs_simage)
/* 02CCE4 0012CBE4 4002053C */  lui         $5, (0x2400000 >> 16)
/* 02CCE8 0012CBE8 D64D040C */  jal         sceGsExecStoreImage
/* 02CCEC 0012CBEC 00000000 */   nop
.L0012CBF0:
/* 02CCF0 0012CBF0 28260070 */  paddub      $4, $0, $0
/* 02CCF4 0012CBF4 282E0070 */  paddub      $5, $0, $0
/* 02CCF8 0012CBF8 E64B040C */  jal         sceGsSyncPath
/* 02CCFC 0012CBFC 00000000 */   nop
/* 02CD00 0012CC00 208C848F */  lw          $4, -0x73E0($28)
/* 02CD04 0012CC04 01008330 */  andi        $3, $4, 0x1
/* 02CD08 0012CC08 04008104 */  bgez        $4, .L0012CC1C
/* 02CD0C 0012CC0C 00000000 */   nop
/* 02CD10 0012CC10 02006010 */  beqz        $3, .L0012CC1C
/* 02CD14 0012CC14 00000000 */   nop
/* 02CD18 0012CC18 FEFF6324 */  addiu       $3, $3, -0x2
.L0012CC1C:
/* 02CD1C 0012CC1C 43006010 */  beqz        $3, .L0012CD2C
/* 02CD20 0012CC20 00000000 */   nop
/* 02CD24 0012CC24 28260072 */  paddub      $4, $16, $0
/* 02CD28 0012CC28 2500023C */  lui         $2, %hi(tga_head$211)
/* 02CD2C 0012CC2C 400B4524 */  addiu       $5, $2, %lo(tga_head$211)
/* 02CD30 0012CC30 12000624 */  addiu       $6, $0, 0x12
/* 02CD34 0012CC34 1861040C */  jal         sceWrite
/* 02CD38 0012CC38 00000000 */   nop
/* 02CD3C 0012CC3C 288E0070 */  paddub      $17, $0, $0
/* 02CD40 0012CC40 37000010 */  b           .L0012CD20
/* 02CD44 0012CC44 00000000 */   nop
.L0012CC48:
/* 02CD48 0012CC48 DF000224 */  addiu       $2, $0, 0xDF
/* 02CD4C 0012CC4C 23185100 */  subu        $3, $2, $17
/* 02CD50 0012CC50 80100300 */  sll         $2, $3, 2
/* 02CD54 0012CC54 21104300 */  addu        $2, $2, $3
/* 02CD58 0012CC58 C0110200 */  sll         $2, $2, 7
/* 02CD5C 0012CC5C 83100200 */  sra         $2, $2, 2
/* 02CD60 0012CC60 00110200 */  sll         $2, $2, 4
/* 02CD64 0012CC64 1002013C */  lui         $1, (0x2100002 >> 16)
/* 02CD68 0012CC68 21904100 */  addu        $18, $2, $1
/* 02CD6C 0012CC6C 2002013C */  lui         $1, (0x2200002 >> 16)
/* 02CD70 0012CC70 21284100 */  addu        $5, $2, $1
/* 02CD74 0012CC74 28260070 */  paddub      $4, $0, $0
/* 02CD78 0012CC78 28360070 */  paddub      $6, $0, $0
/* 02CD7C 0012CC7C 1B000010 */  b           .L0012CCEC
/* 02CD80 0012CC80 00000000 */   nop
.L0012CC84:
/* 02CD84 0012CC84 21384602 */  addu        $7, $18, $6
/* 02CD88 0012CC88 0000E390 */  lbu         $3, (0x2100000 & 0xFFFF)($7)
/* 02CD8C 0012CC8C 0200E290 */  lbu         $2, (0x2100002 & 0xFFFF)($7)
/* 02CD90 0012CC90 0000E2A0 */  sb          $2, (0x2100000 & 0xFFFF)($7)
/* 02CD94 0012CC94 0200E3A0 */  sb          $3, (0x2100002 & 0xFFFF)($7)
/* 02CD98 0012CC98 2140A600 */  addu        $8, $5, $6
/* 02CD9C 0012CC9C 00000391 */  lbu         $3, (0x2200000 & 0xFFFF)($8)
/* 02CDA0 0012CCA0 02000291 */  lbu         $2, (0x2200002 & 0xFFFF)($8)
/* 02CDA4 0012CCA4 000002A1 */  sb          $2, (0x2200000 & 0xFFFF)($8)
/* 02CDA8 0012CCA8 020003A1 */  sb          $3, (0x2200002 & 0xFFFF)($8)
/* 02CDAC 0012CCAC 0000E290 */  lbu         $2, (0x2100000 & 0xFFFF)($7)
/* 02CDB0 0012CCB0 21184402 */  addu        $3, $18, $4
/* 02CDB4 0012CCB4 000062A0 */  sb          $2, (0x2100000 & 0xFFFF)($3)
/* 02CDB8 0012CCB8 0100E290 */  lbu         $2, (0x2100001 & 0xFFFF)($7)
/* 02CDBC 0012CCBC 010062A0 */  sb          $2, (0x2100001 & 0xFFFF)($3)
/* 02CDC0 0012CCC0 0200E290 */  lbu         $2, (0x2100002 & 0xFFFF)($7)
/* 02CDC4 0012CCC4 020062A0 */  sb          $2, (0x2100002 & 0xFFFF)($3)
/* 02CDC8 0012CCC8 00000291 */  lbu         $2, (0x2200000 & 0xFFFF)($8)
/* 02CDCC 0012CCCC 2118A400 */  addu        $3, $5, $4
/* 02CDD0 0012CCD0 000062A0 */  sb          $2, (0x2200000 & 0xFFFF)($3)
/* 02CDD4 0012CCD4 01000291 */  lbu         $2, (0x2200001 & 0xFFFF)($8)
/* 02CDD8 0012CCD8 010062A0 */  sb          $2, (0x2200001 & 0xFFFF)($3)
/* 02CDDC 0012CCDC 02000291 */  lbu         $2, (0x2200002 & 0xFFFF)($8)
/* 02CDE0 0012CCE0 020062A0 */  sb          $2, (0x2200002 & 0xFFFF)($3)
/* 02CDE4 0012CCE4 03008424 */  addiu       $4, $4, 0x3
/* 02CDE8 0012CCE8 0400C624 */  addiu       $6, $6, 0x4
.L0012CCEC:
/* 02CDEC 0012CCEC 000AC228 */  slti        $2, $6, 0xA00
/* 02CDF0 0012CCF0 E4FF4014 */  bnez        $2, .L0012CC84
/* 02CDF4 0012CCF4 00000000 */   nop
/* 02CDF8 0012CCF8 28260072 */  paddub      $4, $16, $0
/* 02CDFC 0012CCFC 80070624 */  addiu       $6, $0, 0x780
/* 02CE00 0012CD00 1861040C */  jal         sceWrite
/* 02CE04 0012CD04 00000000 */   nop
/* 02CE08 0012CD08 28260072 */  paddub      $4, $16, $0
/* 02CE0C 0012CD0C 282E4072 */  paddub      $5, $18, $0
/* 02CE10 0012CD10 80070624 */  addiu       $6, $0, 0x780
/* 02CE14 0012CD14 1861040C */  jal         sceWrite
/* 02CE18 0012CD18 00000000 */   nop
/* 02CE1C 0012CD1C 01003126 */  addiu       $17, $17, 0x1
.L0012CD20:
/* 02CE20 0012CD20 E000232A */  slti        $3, $17, 0xE0
/* 02CE24 0012CD24 C8FF6014 */  bnez        $3, .L0012CC48
/* 02CE28 0012CD28 00000000 */   nop
.L0012CD2C:
/* 02CE2C 0012CD2C 208C848F */  lw          $4, -0x73E0($28)
/* 02CE30 0012CD30 01008330 */  andi        $3, $4, 0x1
/* 02CE34 0012CD34 04008104 */  bgez        $4, .L0012CD48
/* 02CE38 0012CD38 00000000 */   nop
/* 02CE3C 0012CD3C 02006010 */  beqz        $3, .L0012CD48
/* 02CE40 0012CD40 00000000 */   nop
/* 02CE44 0012CD44 FEFF6324 */  addiu       $3, $3, -0x2
.L0012CD48:
/* 02CE48 0012CD48 04006010 */  beqz        $3, .L0012CD5C
/* 02CE4C 0012CD4C 00000000 */   nop
/* 02CE50 0012CD50 28260072 */  paddub      $4, $16, $0
/* 02CE54 0012CD54 F65F040C */  jal         sceClose
/* 02CE58 0012CD58 00000000 */   nop
.L0012CD5C:
/* 02CE5C 0012CD5C 208C838F */  lw          $3, -0x73E0($28)
/* 02CE60 0012CD60 01006324 */  addiu       $3, $3, 0x1
/* 02CE64 0012CD64 208C83AF */  sw          $3, -0x73E0($28)
/* 02CE68 0012CD68 3000BF7B */  lq          $31, 0x30($29)
/* 02CE6C 0012CD6C 2000B27B */  lq          $18, 0x20($29)
/* 02CE70 0012CD70 1000B17B */  lq          $17, 0x10($29)
/* 02CE74 0012CD74 0000B07B */  lq          $16, 0x0($29)
/* 02CE78 0012CD78 4001BD27 */  addiu       $29, $29, 0x140
/* 02CE7C 0012CD7C 0800E003 */  jr          $31
/* 02CE80 0012CD80 00000000 */   nop
/* 02CE84 0012CD84 00000000 */  nop
/* 02CE88 0012CD88 00000000 */  nop
/* 02CE8C 0012CD8C 00000000 */  nop
