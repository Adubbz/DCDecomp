.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CharaStatusMsgDraw__Fiiiii
/* 107CC0 00207BC0 80FFBD27 */  addiu      $sp, $sp, -0x80
/* 107CC4 00207BC4 5000BF7F */  sq         $31, 0x50($sp)
/* 107CC8 00207BC8 4000B47F */  sq         $20, 0x40($sp)
/* 107CCC 00207BCC 3000B37F */  sq         $19, 0x30($sp)
/* 107CD0 00207BD0 2000B27F */  sq         $18, 0x20($sp)
/* 107CD4 00207BD4 1000B17F */  sq         $17, 0x10($sp)
/* 107CD8 00207BD8 0000B07F */  sq         $16, 0x0($sp)
/* 107CDC 00207BDC 28A68070 */  paddub     $20, $4, $0
/* 107CE0 00207BE0 289EA070 */  paddub     $19, $5, $0
/* 107CE4 00207BE4 2896C070 */  paddub     $18, $6, $0
/* 107CE8 00207BE8 288EE070 */  paddub     $17, $7, $0
/* 107CEC 00207BEC 28860071 */  paddub     $16, $8, $0
/* 107CF0 00207BF0 C8958283 */  lb         $2, -0x6A38($gp)
/* 107CF4 00207BF4 05004014 */  bnez       $2, .L00207C0C
/* 107CF8 00207BF8 00000000 */   nop
/* 107CFC 00207BFC EC8280C7 */  lwc1       $f0, -0x7D14($gp)
/* 107D00 00207C00 C49580E7 */  swc1       $f0, -0x6A3C($gp)
/* 107D04 00207C04 01000224 */  addiu      $2, $0, 0x1
/* 107D08 00207C08 C89582A3 */  sb         $2, -0x6A38($gp)
.L00207C0C:
/* 107D0C 00207C0C C4958CC7 */  lwc1       $f12, -0x6A3C($gp)
/* 107D10 00207C10 2876040C */  jal        sinf
/* 107D14 00207C14 00000000 */   nop
/* 107D18 00207C18 8040023C */  lui        $2, (0x40800000 >> 16)
/* 107D1C 00207C1C 00088244 */  mtc1       $2, $f1
/* 107D20 00207C20 00000000 */  nop
/* 107D24 00207C24 42080046 */  mul.s      $f1, $f1, $f0
/* 107D28 00207C28 00009344 */  mtc1       $19, $f0
/* 107D2C 00207C2C 00000000 */  nop
/* 107D30 00207C30 20008046 */  cvt.s.w    $f0, $f0
/* 107D34 00207C34 00030146 */  add.s      $f12, $f0, $f1
/* 107D38 00207C38 2C44040C */  jal        fptosi
/* 107D3C 00207C3C 00000000 */   nop
/* 107D40 00207C40 FFFF0524 */  addiu      $5, $0, -0x1
/* 107D44 00207C44 D494868F */  lw         $6, -0x6B2C($gp)
/* 107D48 00207C48 80181200 */  sll        $3, $18, 2
/* 107D4C 00207C4C 21186600 */  addu       $3, $3, $6
/* 107D50 00207C50 C842648C */  lw         $4, 0x42C8($3)
/* 107D54 00207C54 40008330 */  andi       $3, $4, 0x40
/* 107D58 00207C58 02006010 */  beqz       $3, .L00207C64
/* 107D5C 00207C5C 00000000 */   nop
/* 107D60 00207C60 05000524 */  addiu      $5, $0, 0x5
.L00207C64:
/* 107D64 00207C64 20008330 */  andi       $3, $4, 0x20
/* 107D68 00207C68 02006010 */  beqz       $3, .L00207C74
/* 107D6C 00207C6C 00000000 */   nop
/* 107D70 00207C70 02000524 */  addiu      $5, $0, 0x2
.L00207C74:
/* 107D74 00207C74 10008330 */  andi       $3, $4, 0x10
/* 107D78 00207C78 02006010 */  beqz       $3, .L00207C84
/* 107D7C 00207C7C 00000000 */   nop
/* 107D80 00207C80 04000524 */  addiu      $5, $0, 0x4
.L00207C84:
/* 107D84 00207C84 08008330 */  andi       $3, $4, 0x8
/* 107D88 00207C88 02006010 */  beqz       $3, .L00207C94
/* 107D8C 00207C8C 00000000 */   nop
/* 107D90 00207C90 01000524 */  addiu      $5, $0, 0x1
.L00207C94:
/* 107D94 00207C94 04008330 */  andi       $3, $4, 0x4
/* 107D98 00207C98 02006010 */  beqz       $3, .L00207CA4
/* 107D9C 00207C9C 00000000 */   nop
/* 107DA0 00207CA0 03000524 */  addiu      $5, $0, 0x3
.L00207CA4:
/* 107DA4 00207CA4 40181200 */  sll        $3, $18, 1
/* 107DA8 00207CA8 21186600 */  addu       $3, $3, $6
/* 107DAC 00207CAC 12006384 */  lh         $3, 0x12($3)
/* 107DB0 00207CB0 04006018 */  blez       $3, .L00207CC4
/* 107DB4 00207CB4 00000000 */   nop
/* 107DB8 00207CB8 02008330 */  andi       $3, $4, 0x2
/* 107DBC 00207CBC 02006010 */  beqz       $3, .L00207CC8
/* 107DC0 00207CC0 00000000 */   nop
.L00207CC4:
/* 107DC4 00207CC4 282E0070 */  paddub     $5, $0, $0
.L00207CC8:
/* 107DC8 00207CC8 2500A004 */  bltz       $5, .L00207D60
/* 107DCC 00207CCC 00000000 */   nop
/* 107DD0 00207CD0 03000324 */  addiu      $3, $0, 0x3
/* 107DD4 00207CD4 1A00A300 */  div        $0, $5, $3
/* 107DD8 00207CD8 02006014 */  bnez       $3, .L00207CE4
/* 107DDC 00207CDC 00000000 */   nop
/* 107DE0 00207CE0 CD010000 */  break      0, 7
.L00207CE4:
/* 107DE4 00207CE4 12200000 */  mflo       $4
/* 107DE8 00207CE8 00190400 */  sll        $3, $4, 4
/* 107DEC 00207CEC 21186400 */  addu       $3, $3, $4
/* 107DF0 00207CF0 80180300 */  sll        $3, $3, 2
/* 107DF4 00207CF4 78006624 */  addiu      $6, $3, 0x78
/* 107DF8 00207CF8 03000324 */  addiu      $3, $0, 0x3
/* 107DFC 00207CFC 1A00A300 */  div        $0, $5, $3
/* 107E00 00207D00 00000000 */  nop
/* 107E04 00207D04 00000000 */  nop
/* 107E08 00207D08 10200000 */  mfhi       $4
/* 107E0C 00207D0C C0180400 */  sll        $3, $4, 3
/* 107E10 00207D10 21186400 */  addu       $3, $3, $4
/* 107E14 00207D14 80180300 */  sll        $3, $3, 2
/* 107E18 00207D18 14006324 */  addiu      $3, $3, 0x14
/* 107E1C 00207D1C 7000A6AF */  sw         $6, 0x70($sp)
/* 107E20 00207D20 7400A3AF */  sw         $3, 0x74($sp)
/* 107E24 00207D24 44000424 */  addiu      $4, $0, 0x44
/* 107E28 00207D28 7800A4AF */  sw         $4, 0x78($sp)
/* 107E2C 00207D2C 24000324 */  addiu      $3, $0, 0x24
/* 107E30 00207D30 7C00A3AF */  sw         $3, 0x7C($sp)
/* 107E34 00207D34 6000B4AF */  sw         $20, 0x60($sp)
/* 107E38 00207D38 6400A2AF */  sw         $2, 0x64($sp)
/* 107E3C 00207D3C 6800A4AF */  sw         $4, 0x68($sp)
/* 107E40 00207D40 23000224 */  addiu      $2, $0, 0x23
/* 107E44 00207D44 6C00A2AF */  sw         $2, 0x6C($sp)
/* 107E48 00207D48 2895848F */  lw         $4, -0x6AD8($gp)
/* 107E4C 00207D4C 6000A527 */  addiu      $5, $sp, 0x60
/* 107E50 00207D50 7000A627 */  addiu      $6, $sp, 0x70
/* 107E54 00207D54 283E0072 */  paddub     $7, $16, $0
/* 107E58 00207D58 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 107E5C 00207D5C 00000000 */   nop
.L00207D60:
/* 107E60 00207D60 0C002012 */  beqz       $17, .L00207D94
/* 107E64 00207D64 00000000 */   nop
/* 107E68 00207D68 D494838F */  lw         $3, -0x6B2C($gp)
/* 107E6C 00207D6C 05006380 */  lb         $3, 0x5($3)
/* 107E70 00207D70 00008344 */  mtc1       $3, $f0
/* 107E74 00207D74 00000000 */  nop
/* 107E78 00207D78 60008046 */  cvt.s.w    $f1, $f0
/* 107E7C 00207D7C 4842033C */  lui        $3, (0x42480000 >> 16)
/* 107E80 00207D80 00008344 */  mtc1       $3, $f0
/* 107E84 00207D84 00000000 */  nop
/* 107E88 00207D88 02000146 */  mul.s      $f0, $f0, $f1
/* 107E8C 00207D8C 03000010 */  b          .L00207D9C
/* 107E90 00207D90 00000000 */   nop
.L00207D94:
/* 107E94 00207D94 4842033C */  lui        $3, (0x42480000 >> 16)
/* 107E98 00207D98 00008344 */  mtc1       $3, $f0
.L00207D9C:
/* 107E9C 00207D9C B08082C7 */  lwc1       $f2, -0x7F50($gp)
/* 107EA0 00207DA0 43100046 */  div.s      $f1, $f2, $f0
/* 107EA4 00207DA4 C49580C7 */  lwc1       $f0, -0x6A3C($gp)
/* 107EA8 00207DA8 00000146 */  add.s      $f0, $f0, $f1
/* 107EAC 00207DAC C49580E7 */  swc1       $f0, -0x6A3C($gp)
/* 107EB0 00207DB0 34000246 */  c.lt.s     $f0, $f2
/* 107EB4 00207DB4 00000000 */  nop
/* 107EB8 00207DB8 03000145 */  bc1t       .L00207DC8
/* 107EBC 00207DBC 00000000 */   nop
/* 107EC0 00207DC0 EC8280C7 */  lwc1       $f0, -0x7D14($gp)
/* 107EC4 00207DC4 C49580E7 */  swc1       $f0, -0x6A3C($gp)
.L00207DC8:
/* 107EC8 00207DC8 5000BF7B */  lq         $31, 0x50($sp)
/* 107ECC 00207DCC 4000B47B */  lq         $20, 0x40($sp)
/* 107ED0 00207DD0 3000B37B */  lq         $19, 0x30($sp)
/* 107ED4 00207DD4 2000B27B */  lq         $18, 0x20($sp)
/* 107ED8 00207DD8 1000B17B */  lq         $17, 0x10($sp)
/* 107EDC 00207DDC 0000B07B */  lq         $16, 0x0($sp)
/* 107EE0 00207DE0 8000BD27 */  addiu      $sp, $sp, 0x80
/* 107EE4 00207DE4 0800E003 */  jr         $31
/* 107EE8 00207DE8 00000000 */   nop
/* 107EEC 00207DEC 00000000 */  nop
