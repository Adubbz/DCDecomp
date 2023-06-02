.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StoreImage__Fv
/* 2C900 0012C800 C0FEBD27 */  addiu      $sp, $sp, -0x140
/* 2C904 0012C804 3000BF7F */  sq         $31, 0x30($sp)
/* 2C908 0012C808 2000B27F */  sq         $18, 0x20($sp)
/* 2C90C 0012C80C 1000B17F */  sq         $17, 0x10($sp)
/* 2C910 0012C810 0000B07F */  sq         $16, 0x0($sp)
/* 2C914 0012C814 288C8283 */  lb         $2, -0x73D8($gp)
/* 2C918 0012C818 04004014 */  bnez       $2, .L0012C82C
/* 2C91C 0012C81C 00000000 */   nop
/* 2C920 0012C820 248C80AF */  sw         $0, -0x73DC($gp)
/* 2C924 0012C824 01000224 */  addiu      $2, $0, 0x1
/* 2C928 0012C828 288C82A3 */  sb         $2, -0x73D8($gp)
.L0012C82C:
/* 2C92C 0012C82C 01000224 */  addiu      $2, $0, 0x1
/* 2C930 0012C830 208C82AF */  sw         $2, -0x73E0($gp)
/* 2C934 0012C834 C08B868F */  lw         $6, -0x7440($gp)
/* 2C938 0012C838 40190600 */  sll        $3, $6, 5
/* 2C93C 0012C83C C801023C */  lui        $2, %hi(vifpacket)
/* 2C940 0012C840 80A74224 */  addiu      $2, $2, %lo(vifpacket)
/* 2C944 0012C844 21884300 */  addu       $17, $2, $3
/* 2C948 0012C848 2A00023C */  lui        $2, %hi(_250)
/* 2C94C 0012C84C 088E4424 */  addiu      $4, $2, %lo(_250)
/* 2C950 0012C850 248C858F */  lw         $5, -0x73DC($gp)
/* 2C954 0012C854 D88B878F */  lw         $7, -0x7428($gp)
/* 2C958 0012C858 A611040C */  jal        printf
/* 2C95C 0012C85C 00000000 */   nop
/* 2C960 0012C860 208C838F */  lw         $3, -0x73E0($gp)
/* 2C964 0012C864 01006230 */  andi       $2, $3, 0x1
/* 2C968 0012C868 04006104 */  bgez       $3, .L0012C87C
/* 2C96C 0012C86C 00000000 */   nop
/* 2C970 0012C870 02004010 */  beqz       $2, .L0012C87C
/* 2C974 0012C874 00000000 */   nop
/* 2C978 0012C878 FEFF4224 */  addiu      $2, $2, -0x2
.L0012C87C:
/* 2C97C 0012C87C 22004010 */  beqz       $2, .L0012C908
/* 2C980 0012C880 00000000 */   nop
/* 2C984 0012C884 C000A427 */  addiu      $4, $sp, 0xC0
/* 2C988 0012C888 2A00023C */  lui        $2, %hi(_251)
/* 2C98C 0012C88C 208E4524 */  addiu      $5, $2, %lo(_251)
/* 2C990 0012C890 5A15040C */  jal        strcpy
/* 2C994 0012C894 00000000 */   nop
/* 2C998 0012C898 248C878F */  lw         $7, -0x73DC($gp)
/* 2C99C 0012C89C 0100E224 */  addiu      $2, $7, 0x1
/* 2C9A0 0012C8A0 248C82AF */  sw         $2, -0x73DC($gp)
/* 2C9A4 0012C8A4 4000A427 */  addiu      $4, $sp, 0x40
/* 2C9A8 0012C8A8 2A00023C */  lui        $2, %hi(_252)
/* 2C9AC 0012C8AC 388E4524 */  addiu      $5, $2, %lo(_252)
/* 2C9B0 0012C8B0 C000A627 */  addiu      $6, $sp, 0xC0
/* 2C9B4 0012C8B4 1614040C */  jal        sprintf
/* 2C9B8 0012C8B8 00000000 */   nop
/* 2C9BC 0012C8BC 4000A427 */  addiu      $4, $sp, 0x40
/* 2C9C0 0012C8C0 09000010 */  b          .L0012C8E8
/* 2C9C4 0012C8C4 00000000 */   nop
.L0012C8C8:
/* 2C9C8 0012C8C8 3C1E0200 */  dsll32     $3, $2, 24
/* 2C9CC 0012C8CC 3F1E0300 */  dsra32     $3, $3, 24
/* 2C9D0 0012C8D0 20000224 */  addiu      $2, $0, 0x20
/* 2C9D4 0012C8D4 03006214 */  bne        $3, $2, .L0012C8E4
/* 2C9D8 0012C8D8 00000000 */   nop
/* 2C9DC 0012C8DC 30000224 */  addiu      $2, $0, 0x30
/* 2C9E0 0012C8E0 000082A0 */  sb         $2, 0x0($4)
.L0012C8E4:
/* 2C9E4 0012C8E4 01008424 */  addiu      $4, $4, 0x1
.L0012C8E8:
/* 2C9E8 0012C8E8 00008280 */  lb         $2, 0x0($4)
/* 2C9EC 0012C8EC F6FF4014 */  bnez       $2, .L0012C8C8
/* 2C9F0 0012C8F0 00000000 */   nop
/* 2C9F4 0012C8F4 4000A427 */  addiu      $4, $sp, 0x40
/* 2C9F8 0012C8F8 02060524 */  addiu      $5, $0, 0x602
/* 2C9FC 0012C8FC 865F040C */  jal        sceOpen
/* 2CA00 0012C900 00000000 */   nop
/* 2CA04 0012C904 28864070 */  paddub     $16, $2, $0
.L0012C908:
/* 2CA08 0012C908 C701023C */  lui        $2, %hi(D_1C75330)
/* 2CA0C 0012C90C 30534424 */  addiu      $4, $2, %lo(D_1C75330)
/* 2CA10 0012C910 00080524 */  addiu      $5, $0, 0x800
/* 2CA14 0012C914 2836A070 */  paddub     $6, $5, $0
/* 2CA18 0012C918 283E0070 */  paddub     $7, $0, $0
/* 2CA1C 0012C91C 924F040C */  jal        sceGsSetHalfOffset
/* 2CA20 0012C920 00000000 */   nop
/* 2CA24 0012C924 C701023C */  lui        $2, %hi(D_1C75420)
/* 2CA28 0012C928 20544424 */  addiu      $4, $2, %lo(D_1C75420)
/* 2CA2C 0012C92C 00080524 */  addiu      $5, $0, 0x800
/* 2CA30 0012C930 2836A070 */  paddub     $6, $5, $0
/* 2CA34 0012C934 283E0070 */  paddub     $7, $0, $0
/* 2CA38 0012C938 924F040C */  jal        sceGsSetHalfOffset
/* 2CA3C 0012C93C 00000000 */   nop
/* 2CA40 0012C940 28260070 */  paddub     $4, $0, $0
/* 2CA44 0012C944 6851040C */  jal        FlushCache
/* 2CA48 0012C948 00000000 */   nop
/* 2CA4C 0012C94C C701023C */  lui        $2, %hi(mgDBuff)
/* 2CA50 0012C950 D0524424 */  addiu      $4, $2, %lo(mgDBuff)
/* 2CA54 0012C954 C08B858F */  lw         $5, -0x7440($gp)
/* 2CA58 0012C958 A84B040C */  jal        sceGsSwapDBuff
/* 2CA5C 0012C95C 00000000 */   nop
/* 2CA60 0012C960 28260070 */  paddub     $4, $0, $0
/* 2CA64 0012C964 6851040C */  jal        FlushCache
/* 2CA68 0012C968 00000000 */   nop
/* 2CA6C 0012C96C 28260070 */  paddub     $4, $0, $0
/* 2CA70 0012C970 282E0070 */  paddub     $5, $0, $0
/* 2CA74 0012C974 E64B040C */  jal        sceGsSyncPath
/* 2CA78 0012C978 00000000 */   nop
/* 2CA7C 0012C97C C88B858F */  lw         $5, -0x7438($gp)
/* 2CA80 0012C980 0000A490 */  lbu        $4, 0x0($5)
/* 2CA84 0012C984 40000364 */  daddiu     $3, $0, 0x40
/* 2CA88 0012C988 BFFF0224 */  addiu      $2, $0, -0x41
/* 2CA8C 0012C98C 24108200 */  and        $2, $4, $2
/* 2CA90 0012C990 25104300 */  or         $2, $2, $3
/* 2CA94 0012C994 0000A2A0 */  sb         $2, 0x0($5)
/* 2CA98 0012C998 C88B848F */  lw         $4, -0x7438($gp)
/* 2CA9C 0012C99C 0400258E */  lw         $5, 0x4($17)
/* 2CAA0 0012C9A0 BE31040C */  jal        sceDmaSend
/* 2CAA4 0012C9A4 00000000 */   nop
/* 2CAA8 0012C9A8 28260070 */  paddub     $4, $0, $0
/* 2CAAC 0012C9AC 282E0070 */  paddub     $5, $0, $0
/* 2CAB0 0012C9B0 E64B040C */  jal        sceGsSyncPath
/* 2CAB4 0012C9B4 00000000 */   nop
/* 2CAB8 0012C9B8 C08B828F */  lw         $2, -0x7440($gp)
/* 2CABC 0012C9BC 2B100200 */  sltu       $2, $0, $2
/* 2CAC0 0012C9C0 01004238 */  xori       $2, $2, 0x1
/* 2CAC4 0012C9C4 FF004330 */  andi       $3, $2, 0xFF
/* 2CAC8 0012C9C8 C0100300 */  sll        $2, $3, 3
/* 2CACC 0012C9CC 23184300 */  subu       $3, $2, $3
/* 2CAD0 0012C9D0 80100300 */  sll        $2, $3, 2
/* 2CAD4 0012C9D4 21106200 */  addu       $2, $3, $2
/* 2CAD8 0012C9D8 80110200 */  sll        $2, $2, 6
/* 2CADC 0012C9DC 3C2C0200 */  dsll32     $5, $2, 16
/* 2CAE0 0012C9E0 3F2C0500 */  dsra32     $5, $5, 16
/* 2CAE4 0012C9E4 C801023C */  lui        $2, %hi(gs_simage)
/* 2CAE8 0012C9E8 C0A74424 */  addiu      $4, $2, %lo(gs_simage)
/* 2CAEC 0012C9EC 0A000624 */  addiu      $6, $0, 0xA
/* 2CAF0 0012C9F0 283E0070 */  paddub     $7, $0, $0
/* 2CAF4 0012C9F4 28460070 */  paddub     $8, $0, $0
/* 2CAF8 0012C9F8 284E0070 */  paddub     $9, $0, $0
/* 2CAFC 0012C9FC 80020A24 */  addiu      $10, $0, 0x280
/* 2CB00 0012CA00 E0000B24 */  addiu      $11, $0, 0xE0
/* 2CB04 0012CA04 264D040C */  jal        sceGsSetDefStoreImage
/* 2CB08 0012CA08 00000000 */   nop
/* 2CB0C 0012CA0C 28260070 */  paddub     $4, $0, $0
/* 2CB10 0012CA10 6851040C */  jal        FlushCache
/* 2CB14 0012CA14 00000000 */   nop
/* 2CB18 0012CA18 208C838F */  lw         $3, -0x73E0($gp)
/* 2CB1C 0012CA1C 01006230 */  andi       $2, $3, 0x1
/* 2CB20 0012CA20 04006104 */  bgez       $3, .L0012CA34
/* 2CB24 0012CA24 00000000 */   nop
/* 2CB28 0012CA28 02004010 */  beqz       $2, .L0012CA34
/* 2CB2C 0012CA2C 00000000 */   nop
/* 2CB30 0012CA30 FEFF4224 */  addiu      $2, $2, -0x2
.L0012CA34:
/* 2CB34 0012CA34 08004010 */  beqz       $2, .L0012CA58
/* 2CB38 0012CA38 00000000 */   nop
/* 2CB3C 0012CA3C C801023C */  lui        $2, %hi(gs_simage)
/* 2CB40 0012CA40 C0A74424 */  addiu      $4, $2, %lo(gs_simage)
/* 2CB44 0012CA44 1002053C */  lui        $5, (0x2100000 >> 16)
/* 2CB48 0012CA48 D64D040C */  jal        sceGsExecStoreImage
/* 2CB4C 0012CA4C 00000000 */   nop
/* 2CB50 0012CA50 06000010 */  b          .L0012CA6C
/* 2CB54 0012CA54 00000000 */   nop
.L0012CA58:
/* 2CB58 0012CA58 C801023C */  lui        $2, %hi(gs_simage)
/* 2CB5C 0012CA5C C0A74424 */  addiu      $4, $2, %lo(gs_simage)
/* 2CB60 0012CA60 3002053C */  lui        $5, (0x2300000 >> 16)
/* 2CB64 0012CA64 D64D040C */  jal        sceGsExecStoreImage
/* 2CB68 0012CA68 00000000 */   nop
.L0012CA6C:
/* 2CB6C 0012CA6C 28260070 */  paddub     $4, $0, $0
/* 2CB70 0012CA70 282E0070 */  paddub     $5, $0, $0
/* 2CB74 0012CA74 E64B040C */  jal        sceGsSyncPath
/* 2CB78 0012CA78 00000000 */   nop
/* 2CB7C 0012CA7C C701023C */  lui        $2, %hi(D_1C75330)
/* 2CB80 0012CA80 30534424 */  addiu      $4, $2, %lo(D_1C75330)
/* 2CB84 0012CA84 00080524 */  addiu      $5, $0, 0x800
/* 2CB88 0012CA88 2836A070 */  paddub     $6, $5, $0
/* 2CB8C 0012CA8C 01000724 */  addiu      $7, $0, 0x1
/* 2CB90 0012CA90 924F040C */  jal        sceGsSetHalfOffset
/* 2CB94 0012CA94 00000000 */   nop
/* 2CB98 0012CA98 C701023C */  lui        $2, %hi(D_1C75420)
/* 2CB9C 0012CA9C 20544424 */  addiu      $4, $2, %lo(D_1C75420)
/* 2CBA0 0012CAA0 00080524 */  addiu      $5, $0, 0x800
/* 2CBA4 0012CAA4 2836A070 */  paddub     $6, $5, $0
/* 2CBA8 0012CAA8 01000724 */  addiu      $7, $0, 0x1
/* 2CBAC 0012CAAC 924F040C */  jal        sceGsSetHalfOffset
/* 2CBB0 0012CAB0 00000000 */   nop
/* 2CBB4 0012CAB4 28260070 */  paddub     $4, $0, $0
/* 2CBB8 0012CAB8 6851040C */  jal        FlushCache
/* 2CBBC 0012CABC 00000000 */   nop
/* 2CBC0 0012CAC0 28260070 */  paddub     $4, $0, $0
/* 2CBC4 0012CAC4 282E0070 */  paddub     $5, $0, $0
/* 2CBC8 0012CAC8 E64B040C */  jal        sceGsSyncPath
/* 2CBCC 0012CACC 00000000 */   nop
/* 2CBD0 0012CAD0 C701023C */  lui        $2, %hi(mgDBuff)
/* 2CBD4 0012CAD4 D0524424 */  addiu      $4, $2, %lo(mgDBuff)
/* 2CBD8 0012CAD8 C08B858F */  lw         $5, -0x7440($gp)
/* 2CBDC 0012CADC A84B040C */  jal        sceGsSwapDBuff
/* 2CBE0 0012CAE0 00000000 */   nop
/* 2CBE4 0012CAE4 28260070 */  paddub     $4, $0, $0
/* 2CBE8 0012CAE8 6851040C */  jal        FlushCache
/* 2CBEC 0012CAEC 00000000 */   nop
/* 2CBF0 0012CAF0 28260070 */  paddub     $4, $0, $0
/* 2CBF4 0012CAF4 282E0070 */  paddub     $5, $0, $0
/* 2CBF8 0012CAF8 E64B040C */  jal        sceGsSyncPath
/* 2CBFC 0012CAFC 00000000 */   nop
/* 2CC00 0012CB00 C88B858F */  lw         $5, -0x7438($gp)
/* 2CC04 0012CB04 0000A490 */  lbu        $4, 0x0($5)
/* 2CC08 0012CB08 40000364 */  daddiu     $3, $0, 0x40
/* 2CC0C 0012CB0C BFFF0224 */  addiu      $2, $0, -0x41
/* 2CC10 0012CB10 24108200 */  and        $2, $4, $2
/* 2CC14 0012CB14 25104300 */  or         $2, $2, $3
/* 2CC18 0012CB18 0000A2A0 */  sb         $2, 0x0($5)
/* 2CC1C 0012CB1C C88B848F */  lw         $4, -0x7438($gp)
/* 2CC20 0012CB20 0400258E */  lw         $5, 0x4($17)
/* 2CC24 0012CB24 BE31040C */  jal        sceDmaSend
/* 2CC28 0012CB28 00000000 */   nop
/* 2CC2C 0012CB2C 28260070 */  paddub     $4, $0, $0
/* 2CC30 0012CB30 282E0070 */  paddub     $5, $0, $0
/* 2CC34 0012CB34 E64B040C */  jal        sceGsSyncPath
/* 2CC38 0012CB38 00000000 */   nop
/* 2CC3C 0012CB3C C08B828F */  lw         $2, -0x7440($gp)
/* 2CC40 0012CB40 2B100200 */  sltu       $2, $0, $2
/* 2CC44 0012CB44 01004238 */  xori       $2, $2, 0x1
/* 2CC48 0012CB48 FF004330 */  andi       $3, $2, 0xFF
/* 2CC4C 0012CB4C C0100300 */  sll        $2, $3, 3
/* 2CC50 0012CB50 23184300 */  subu       $3, $2, $3
/* 2CC54 0012CB54 80100300 */  sll        $2, $3, 2
/* 2CC58 0012CB58 21106200 */  addu       $2, $3, $2
/* 2CC5C 0012CB5C 80110200 */  sll        $2, $2, 6
/* 2CC60 0012CB60 3C2C0200 */  dsll32     $5, $2, 16
/* 2CC64 0012CB64 3F2C0500 */  dsra32     $5, $5, 16
/* 2CC68 0012CB68 C801023C */  lui        $2, %hi(gs_simage)
/* 2CC6C 0012CB6C C0A74424 */  addiu      $4, $2, %lo(gs_simage)
/* 2CC70 0012CB70 0A000624 */  addiu      $6, $0, 0xA
/* 2CC74 0012CB74 283E0070 */  paddub     $7, $0, $0
/* 2CC78 0012CB78 28460070 */  paddub     $8, $0, $0
/* 2CC7C 0012CB7C 284E0070 */  paddub     $9, $0, $0
/* 2CC80 0012CB80 80020A24 */  addiu      $10, $0, 0x280
/* 2CC84 0012CB84 E0000B24 */  addiu      $11, $0, 0xE0
/* 2CC88 0012CB88 264D040C */  jal        sceGsSetDefStoreImage
/* 2CC8C 0012CB8C 00000000 */   nop
/* 2CC90 0012CB90 28260070 */  paddub     $4, $0, $0
/* 2CC94 0012CB94 6851040C */  jal        FlushCache
/* 2CC98 0012CB98 00000000 */   nop
/* 2CC9C 0012CB9C 208C838F */  lw         $3, -0x73E0($gp)
/* 2CCA0 0012CBA0 01006230 */  andi       $2, $3, 0x1
/* 2CCA4 0012CBA4 04006104 */  bgez       $3, .L0012CBB8
/* 2CCA8 0012CBA8 00000000 */   nop
/* 2CCAC 0012CBAC 02004010 */  beqz       $2, .L0012CBB8
/* 2CCB0 0012CBB0 00000000 */   nop
/* 2CCB4 0012CBB4 FEFF4224 */  addiu      $2, $2, -0x2
.L0012CBB8:
/* 2CCB8 0012CBB8 08004010 */  beqz       $2, .L0012CBDC
/* 2CCBC 0012CBBC 00000000 */   nop
/* 2CCC0 0012CBC0 C801023C */  lui        $2, %hi(gs_simage)
/* 2CCC4 0012CBC4 C0A74424 */  addiu      $4, $2, %lo(gs_simage)
/* 2CCC8 0012CBC8 2002053C */  lui        $5, (0x2200000 >> 16)
/* 2CCCC 0012CBCC D64D040C */  jal        sceGsExecStoreImage
/* 2CCD0 0012CBD0 00000000 */   nop
/* 2CCD4 0012CBD4 06000010 */  b          .L0012CBF0
/* 2CCD8 0012CBD8 00000000 */   nop
.L0012CBDC:
/* 2CCDC 0012CBDC C801023C */  lui        $2, %hi(gs_simage)
/* 2CCE0 0012CBE0 C0A74424 */  addiu      $4, $2, %lo(gs_simage)
/* 2CCE4 0012CBE4 4002053C */  lui        $5, (0x2400000 >> 16)
/* 2CCE8 0012CBE8 D64D040C */  jal        sceGsExecStoreImage
/* 2CCEC 0012CBEC 00000000 */   nop
.L0012CBF0:
/* 2CCF0 0012CBF0 28260070 */  paddub     $4, $0, $0
/* 2CCF4 0012CBF4 282E0070 */  paddub     $5, $0, $0
/* 2CCF8 0012CBF8 E64B040C */  jal        sceGsSyncPath
/* 2CCFC 0012CBFC 00000000 */   nop
/* 2CD00 0012CC00 208C848F */  lw         $4, -0x73E0($gp)
/* 2CD04 0012CC04 01008330 */  andi       $3, $4, 0x1
/* 2CD08 0012CC08 04008104 */  bgez       $4, .L0012CC1C
/* 2CD0C 0012CC0C 00000000 */   nop
/* 2CD10 0012CC10 02006010 */  beqz       $3, .L0012CC1C
/* 2CD14 0012CC14 00000000 */   nop
/* 2CD18 0012CC18 FEFF6324 */  addiu      $3, $3, -0x2
.L0012CC1C:
/* 2CD1C 0012CC1C 43006010 */  beqz       $3, .L0012CD2C
/* 2CD20 0012CC20 00000000 */   nop
/* 2CD24 0012CC24 28260072 */  paddub     $4, $16, $0
/* 2CD28 0012CC28 2500023C */  lui        $2, %hi(tga_head$211)
/* 2CD2C 0012CC2C 400B4524 */  addiu      $5, $2, %lo(tga_head$211)
/* 2CD30 0012CC30 12000624 */  addiu      $6, $0, 0x12
/* 2CD34 0012CC34 1861040C */  jal        sceWrite
/* 2CD38 0012CC38 00000000 */   nop
/* 2CD3C 0012CC3C 288E0070 */  paddub     $17, $0, $0
/* 2CD40 0012CC40 37000010 */  b          .L0012CD20
/* 2CD44 0012CC44 00000000 */   nop
.L0012CC48:
/* 2CD48 0012CC48 DF000224 */  addiu      $2, $0, 0xDF
/* 2CD4C 0012CC4C 23185100 */  subu       $3, $2, $17
/* 2CD50 0012CC50 80100300 */  sll        $2, $3, 2
/* 2CD54 0012CC54 21104300 */  addu       $2, $2, $3
/* 2CD58 0012CC58 C0110200 */  sll        $2, $2, 7
/* 2CD5C 0012CC5C 83100200 */  sra        $2, $2, 2
/* 2CD60 0012CC60 00110200 */  sll        $2, $2, 4
/* 2CD64 0012CC64 1002013C */  lui        $at, (0x2100002 >> 16)
/* 2CD68 0012CC68 21904100 */  addu       $18, $2, $at
/* 2CD6C 0012CC6C 2002013C */  lui        $at, (0x2200002 >> 16)
/* 2CD70 0012CC70 21284100 */  addu       $5, $2, $at
/* 2CD74 0012CC74 28260070 */  paddub     $4, $0, $0
/* 2CD78 0012CC78 28360070 */  paddub     $6, $0, $0
/* 2CD7C 0012CC7C 1B000010 */  b          .L0012CCEC
/* 2CD80 0012CC80 00000000 */   nop
.L0012CC84:
/* 2CD84 0012CC84 21384602 */  addu       $7, $18, $6
/* 2CD88 0012CC88 0000E390 */  lbu        $3, (0x2100000 & 0xFFFF)($7)
/* 2CD8C 0012CC8C 0200E290 */  lbu        $2, (0x2100002 & 0xFFFF)($7)
/* 2CD90 0012CC90 0000E2A0 */  sb         $2, (0x2100000 & 0xFFFF)($7)
/* 2CD94 0012CC94 0200E3A0 */  sb         $3, (0x2100002 & 0xFFFF)($7)
/* 2CD98 0012CC98 2140A600 */  addu       $8, $5, $6
/* 2CD9C 0012CC9C 00000391 */  lbu        $3, (0x2200000 & 0xFFFF)($8)
/* 2CDA0 0012CCA0 02000291 */  lbu        $2, (0x2200002 & 0xFFFF)($8)
/* 2CDA4 0012CCA4 000002A1 */  sb         $2, (0x2200000 & 0xFFFF)($8)
/* 2CDA8 0012CCA8 020003A1 */  sb         $3, (0x2200002 & 0xFFFF)($8)
/* 2CDAC 0012CCAC 0000E290 */  lbu        $2, (0x2100000 & 0xFFFF)($7)
/* 2CDB0 0012CCB0 21184402 */  addu       $3, $18, $4
/* 2CDB4 0012CCB4 000062A0 */  sb         $2, (0x2100000 & 0xFFFF)($3)
/* 2CDB8 0012CCB8 0100E290 */  lbu        $2, (0x2100001 & 0xFFFF)($7)
/* 2CDBC 0012CCBC 010062A0 */  sb         $2, (0x2100001 & 0xFFFF)($3)
/* 2CDC0 0012CCC0 0200E290 */  lbu        $2, (0x2100002 & 0xFFFF)($7)
/* 2CDC4 0012CCC4 020062A0 */  sb         $2, (0x2100002 & 0xFFFF)($3)
/* 2CDC8 0012CCC8 00000291 */  lbu        $2, (0x2200000 & 0xFFFF)($8)
/* 2CDCC 0012CCCC 2118A400 */  addu       $3, $5, $4
/* 2CDD0 0012CCD0 000062A0 */  sb         $2, (0x2200000 & 0xFFFF)($3)
/* 2CDD4 0012CCD4 01000291 */  lbu        $2, (0x2200001 & 0xFFFF)($8)
/* 2CDD8 0012CCD8 010062A0 */  sb         $2, (0x2200001 & 0xFFFF)($3)
/* 2CDDC 0012CCDC 02000291 */  lbu        $2, (0x2200002 & 0xFFFF)($8)
/* 2CDE0 0012CCE0 020062A0 */  sb         $2, (0x2200002 & 0xFFFF)($3)
/* 2CDE4 0012CCE4 03008424 */  addiu      $4, $4, 0x3
/* 2CDE8 0012CCE8 0400C624 */  addiu      $6, $6, 0x4
.L0012CCEC:
/* 2CDEC 0012CCEC 000AC228 */  slti       $2, $6, 0xA00
/* 2CDF0 0012CCF0 E4FF4014 */  bnez       $2, .L0012CC84
/* 2CDF4 0012CCF4 00000000 */   nop
/* 2CDF8 0012CCF8 28260072 */  paddub     $4, $16, $0
/* 2CDFC 0012CCFC 80070624 */  addiu      $6, $0, 0x780
/* 2CE00 0012CD00 1861040C */  jal        sceWrite
/* 2CE04 0012CD04 00000000 */   nop
/* 2CE08 0012CD08 28260072 */  paddub     $4, $16, $0
/* 2CE0C 0012CD0C 282E4072 */  paddub     $5, $18, $0
/* 2CE10 0012CD10 80070624 */  addiu      $6, $0, 0x780
/* 2CE14 0012CD14 1861040C */  jal        sceWrite
/* 2CE18 0012CD18 00000000 */   nop
/* 2CE1C 0012CD1C 01003126 */  addiu      $17, $17, 0x1
.L0012CD20:
/* 2CE20 0012CD20 E000232A */  slti       $3, $17, 0xE0
/* 2CE24 0012CD24 C8FF6014 */  bnez       $3, .L0012CC48
/* 2CE28 0012CD28 00000000 */   nop
.L0012CD2C:
/* 2CE2C 0012CD2C 208C848F */  lw         $4, -0x73E0($gp)
/* 2CE30 0012CD30 01008330 */  andi       $3, $4, 0x1
/* 2CE34 0012CD34 04008104 */  bgez       $4, .L0012CD48
/* 2CE38 0012CD38 00000000 */   nop
/* 2CE3C 0012CD3C 02006010 */  beqz       $3, .L0012CD48
/* 2CE40 0012CD40 00000000 */   nop
/* 2CE44 0012CD44 FEFF6324 */  addiu      $3, $3, -0x2
.L0012CD48:
/* 2CE48 0012CD48 04006010 */  beqz       $3, .L0012CD5C
/* 2CE4C 0012CD4C 00000000 */   nop
/* 2CE50 0012CD50 28260072 */  paddub     $4, $16, $0
/* 2CE54 0012CD54 F65F040C */  jal        sceClose
/* 2CE58 0012CD58 00000000 */   nop
.L0012CD5C:
/* 2CE5C 0012CD5C 208C838F */  lw         $3, -0x73E0($gp)
/* 2CE60 0012CD60 01006324 */  addiu      $3, $3, 0x1
/* 2CE64 0012CD64 208C83AF */  sw         $3, -0x73E0($gp)
/* 2CE68 0012CD68 3000BF7B */  lq         $31, 0x30($sp)
/* 2CE6C 0012CD6C 2000B27B */  lq         $18, 0x20($sp)
/* 2CE70 0012CD70 1000B17B */  lq         $17, 0x10($sp)
/* 2CE74 0012CD74 0000B07B */  lq         $16, 0x0($sp)
/* 2CE78 0012CD78 4001BD27 */  addiu      $sp, $sp, 0x140
/* 2CE7C 0012CD7C 0800E003 */  jr         $31
/* 2CE80 0012CD80 00000000 */   nop
/* 2CE84 0012CD84 00000000 */  nop
/* 2CE88 0012CD88 00000000 */  nop
/* 2CE8C 0012CD8C 00000000 */  nop
