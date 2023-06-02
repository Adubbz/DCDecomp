.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AttachMentValuePlus__FP11ATTACH_LISTP11ATTACH_LISTf
/* 135B10 00235A10 80FFBD27 */  addiu      $sp, $sp, -0x80
/* 135B14 00235A14 6000BF7F */  sq         $31, 0x60($sp)
/* 135B18 00235A18 5000B47F */  sq         $20, 0x50($sp)
/* 135B1C 00235A1C 4000B37F */  sq         $19, 0x40($sp)
/* 135B20 00235A20 3000B27F */  sq         $18, 0x30($sp)
/* 135B24 00235A24 2000B17F */  sq         $17, 0x20($sp)
/* 135B28 00235A28 1000B07F */  sq         $16, 0x10($sp)
/* 135B2C 00235A2C 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 135B30 00235A30 289E8070 */  paddub     $19, $4, $0
/* 135B34 00235A34 2896A070 */  paddub     $18, $5, $0
/* 135B38 00235A38 06650046 */  mov.s      $f20, $f12
/* 135B3C 00235A3C 02008484 */  lh         $4, 0x2($4)
/* 135B40 00235A40 D443070C */  jal        GetWeaponData__Fi
/* 135B44 00235A44 00000000 */   nop
/* 135B48 00235A48 2900033C */  lui        $3, %hi(_737_2)
/* 135B4C 00235A4C 40586324 */  addiu      $3, $3, %lo(_737_2)
/* 135B50 00235A50 7000A627 */  addiu      $6, $sp, 0x70
/* 135B54 00235A54 00006378 */  lq         $3, 0x0($3)
/* 135B58 00235A58 0000C37C */  sq         $3, 0x0($6)
/* 135B5C 00235A5C 05004010 */  beqz       $2, .L00235A74
/* 135B60 00235A60 00000000 */   nop
/* 135B64 00235A64 44004384 */  lh         $3, 0x44($2)
/* 135B68 00235A68 7000A3AF */  sw         $3, 0x70($sp)
/* 135B6C 00235A6C 46004384 */  lh         $3, 0x46($2)
/* 135B70 00235A70 7C00A3AF */  sw         $3, 0x7C($sp)
.L00235A74:
/* 135B74 00235A74 28860070 */  paddub     $16, $0, $0
/* 135B78 00235A78 1D000010 */  b          .L00235AF0
/* 135B7C 00235A7C 00000000 */   nop
.L00235A80:
/* 135B80 00235A80 40881000 */  sll        $17, $16, 1
/* 135B84 00235A84 21103202 */  addu       $2, $17, $18
/* 135B88 00235A88 08004284 */  lh         $2, 0x8($2)
/* 135B8C 00235A8C 00008244 */  mtc1       $2, $f0
/* 135B90 00235A90 00000000 */  nop
/* 135B94 00235A94 20008046 */  cvt.s.w    $f0, $f0
/* 135B98 00235A98 02031446 */  mul.s      $f12, $f0, $f20
/* 135B9C 00235A9C 2C44040C */  jal        fptosi
/* 135BA0 00235AA0 00000000 */   nop
/* 135BA4 00235AA4 3C340200 */  dsll32     $6, $2, 16
/* 135BA8 00235AA8 3F340600 */  dsra32     $6, $6, 16
/* 135BAC 00235AAC 21183302 */  addu       $3, $17, $19
/* 135BB0 00235AB0 08006824 */  addiu      $8, $3, 0x8
/* 135BB4 00235AB4 08006384 */  lh         $3, 0x8($3)
/* 135BB8 00235AB8 21306600 */  addu       $6, $3, $6
/* 135BBC 00235ABC 80181000 */  sll        $3, $16, 2
/* 135BC0 00235AC0 21187D00 */  addu       $3, $3, $sp
/* 135BC4 00235AC4 70006724 */  addiu      $7, $3, 0x70
/* 135BC8 00235AC8 0000E38C */  lw         $3, 0x0($7)
/* 135BCC 00235ACC 2A18C300 */  slt        $3, $6, $3
/* 135BD0 00235AD0 05006014 */  bnez       $3, .L00235AE8
/* 135BD4 00235AD4 00000000 */   nop
/* 135BD8 00235AD8 0000E384 */  lh         $3, 0x0($7)
/* 135BDC 00235ADC 000003A5 */  sh         $3, 0x0($8)
/* 135BE0 00235AE0 02000010 */  b          .L00235AEC
/* 135BE4 00235AE4 00000000 */   nop
.L00235AE8:
/* 135BE8 00235AE8 000006A5 */  sh         $6, 0x0($8)
.L00235AEC:
/* 135BEC 00235AEC 01001026 */  addiu      $16, $16, 0x1
.L00235AF0:
/* 135BF0 00235AF0 0400032A */  slti       $3, $16, 0x4
/* 135BF4 00235AF4 E2FF6014 */  bnez       $3, .L00235A80
/* 135BF8 00235AF8 00000000 */   nop
/* 135BFC 00235AFC 28860070 */  paddub     $16, $0, $0
/* 135C00 00235B00 16000010 */  b          .L00235B5C
/* 135C04 00235B04 00000000 */   nop
.L00235B08:
/* 135C08 00235B08 21101302 */  addu       $2, $16, $19
/* 135C0C 00235B0C 10005124 */  addiu      $17, $2, 0x10
/* 135C10 00235B10 10005480 */  lb         $20, 0x10($2)
/* 135C14 00235B14 21101202 */  addu       $2, $16, $18
/* 135C18 00235B18 10004280 */  lb         $2, 0x10($2)
/* 135C1C 00235B1C 00008244 */  mtc1       $2, $f0
/* 135C20 00235B20 00000000 */  nop
/* 135C24 00235B24 20008046 */  cvt.s.w    $f0, $f0
/* 135C28 00235B28 02031446 */  mul.s      $f12, $f0, $f20
/* 135C2C 00235B2C 2C44040C */  jal        fptosi
/* 135C30 00235B30 00000000 */   nop
/* 135C34 00235B34 21308202 */  addu       $6, $20, $2
/* 135C38 00235B38 6300C328 */  slti       $3, $6, 0x63
/* 135C3C 00235B3C 05006014 */  bnez       $3, .L00235B54
/* 135C40 00235B40 00000000 */   nop
/* 135C44 00235B44 63000324 */  addiu      $3, $0, 0x63
/* 135C48 00235B48 000023A2 */  sb         $3, 0x0($17)
/* 135C4C 00235B4C 02000010 */  b          .L00235B58
/* 135C50 00235B50 00000000 */   nop
.L00235B54:
/* 135C54 00235B54 000026A2 */  sb         $6, 0x0($17)
.L00235B58:
/* 135C58 00235B58 01001026 */  addiu      $16, $16, 0x1
.L00235B5C:
/* 135C5C 00235B5C 0500032A */  slti       $3, $16, 0x5
/* 135C60 00235B60 E9FF6014 */  bnez       $3, .L00235B08
/* 135C64 00235B64 00000000 */   nop
/* 135C68 00235B68 28860070 */  paddub     $16, $0, $0
/* 135C6C 00235B6C 16000010 */  b          .L00235BC8
/* 135C70 00235B70 00000000 */   nop
.L00235B74:
/* 135C74 00235B74 21101302 */  addu       $2, $16, $19
/* 135C78 00235B78 15005124 */  addiu      $17, $2, 0x15
/* 135C7C 00235B7C 15005480 */  lb         $20, 0x15($2)
/* 135C80 00235B80 21101202 */  addu       $2, $16, $18
/* 135C84 00235B84 15004280 */  lb         $2, 0x15($2)
/* 135C88 00235B88 00008244 */  mtc1       $2, $f0
/* 135C8C 00235B8C 00000000 */  nop
/* 135C90 00235B90 20008046 */  cvt.s.w    $f0, $f0
/* 135C94 00235B94 02031446 */  mul.s      $f12, $f0, $f20
/* 135C98 00235B98 2C44040C */  jal        fptosi
/* 135C9C 00235B9C 00000000 */   nop
/* 135CA0 00235BA0 21308202 */  addu       $6, $20, $2
/* 135CA4 00235BA4 6300C328 */  slti       $3, $6, 0x63
/* 135CA8 00235BA8 05006014 */  bnez       $3, .L00235BC0
/* 135CAC 00235BAC 00000000 */   nop
/* 135CB0 00235BB0 63000324 */  addiu      $3, $0, 0x63
/* 135CB4 00235BB4 000023A2 */  sb         $3, 0x0($17)
/* 135CB8 00235BB8 02000010 */  b          .L00235BC4
/* 135CBC 00235BBC 00000000 */   nop
.L00235BC0:
/* 135CC0 00235BC0 000026A2 */  sb         $6, 0x0($17)
.L00235BC4:
/* 135CC4 00235BC4 01001026 */  addiu      $16, $16, 0x1
.L00235BC8:
/* 135CC8 00235BC8 0A00032A */  slti       $3, $16, 0xA
/* 135CCC 00235BCC E9FF6014 */  bnez       $3, .L00235B74
/* 135CD0 00235BD0 00000000 */   nop
/* 135CD4 00235BD4 6000BF7B */  lq         $31, 0x60($sp)
/* 135CD8 00235BD8 5000B47B */  lq         $20, 0x50($sp)
/* 135CDC 00235BDC 4000B37B */  lq         $19, 0x40($sp)
/* 135CE0 00235BE0 3000B27B */  lq         $18, 0x30($sp)
/* 135CE4 00235BE4 2000B17B */  lq         $17, 0x20($sp)
/* 135CE8 00235BE8 1000B07B */  lq         $16, 0x10($sp)
/* 135CEC 00235BEC 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 135CF0 00235BF0 8000BD27 */  addiu      $sp, $sp, 0x80
/* 135CF4 00235BF4 0800E003 */  jr         $31
/* 135CF8 00235BF8 00000000 */   nop
/* 135CFC 00235BFC 00000000 */  nop
