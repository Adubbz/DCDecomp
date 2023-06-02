.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BattleMenuDraw__Fv
/* F62E0 001F61E0 70FFBD27 */  addiu      $sp, $sp, -0x90
/* F62E4 001F61E4 2000BF7F */  sq         $31, 0x20($sp)
/* F62E8 001F61E8 1000B17F */  sq         $17, 0x10($sp)
/* F62EC 001F61EC 0000B07F */  sq         $16, 0x0($sp)
/* F62F0 001F61F0 28260070 */  paddub     $4, $0, $0
/* F62F4 001F61F4 046F050C */  jal        setbilinear__Fi
/* F62F8 001F61F8 00000000 */   nop
/* F62FC 001F61FC DA01023C */  lui        $2, %hi(MenuCamera)
/* F6300 001F6200 D0084424 */  addiu      $4, $2, %lo(MenuCamera)
/* F6304 001F6204 7CAF080C */  jal        MenuWorldTrans__FP7CCamera
/* F6308 001F6208 00000000 */   nop
/* F630C 001F620C A0B8040C */  jal        GetVif1Packet__Fv
/* F6310 001F6210 00000000 */   nop
/* F6314 001F6214 2400033C */  lui        $3, %hi(D_00246100)
/* F6318 001F6218 00616524 */  addiu      $5, $3, %lo(D_00246100)
/* F631C 001F621C 28264070 */  paddub     $4, $2, $0
/* F6320 001F6220 28360070 */  paddub     $6, $0, $0
/* F6324 001F6224 5C83040C */  jal        sceVif1PkCall
/* F6328 001F6228 00000000 */   nop
/* F632C 001F622C A0B8040C */  jal        GetVif1Packet__Fv
/* F6330 001F6230 00000000 */   nop
/* F6334 001F6234 28264070 */  paddub     $4, $2, $0
/* F6338 001F6238 0A83040C */  jal        sceVif1PkTerminate
/* F633C 001F623C 00000000 */   nop
/* F6340 001F6240 E094848F */  lw         $4, -0x6B20($gp)
/* F6344 001F6244 38B4080C */  jal        MenuTextureReload__Fi
/* F6348 001F6248 00000000 */   nop
/* F634C 001F624C C701023C */  lui        $2, %hi(TexManager)
/* F6350 001F6250 70584424 */  addiu      $4, $2, %lo(TexManager)
/* F6354 001F6254 2A00023C */  lui        $2, %hi(_924_2)
/* F6358 001F6258 E8D44524 */  addiu      $5, $2, %lo(_924_2)
/* F635C 001F625C FFFF0624 */  addiu      $6, $0, -0x1
/* F6360 001F6260 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* F6364 001F6264 00000000 */   nop
/* F6368 001F6268 00004384 */  lh         $3, 0x0($2)
/* F636C 001F626C 3000A3A7 */  sh         $3, 0x30($sp)
/* F6370 001F6270 02004384 */  lh         $3, 0x2($2)
/* F6374 001F6274 3200A3A7 */  sh         $3, 0x32($sp)
/* F6378 001F6278 04004384 */  lh         $3, 0x4($2)
/* F637C 001F627C 3400A3A7 */  sh         $3, 0x34($sp)
/* F6380 001F6280 06004384 */  lh         $3, 0x6($2)
/* F6384 001F6284 3600A3A7 */  sh         $3, 0x36($sp)
/* F6388 001F6288 08004924 */  addiu      $9, $2, 0x8
/* F638C 001F628C 3800A827 */  addiu      $8, $sp, 0x38
/* F6390 001F6290 04000724 */  addiu      $7, $0, 0x4
.L001F6294:
/* F6394 001F6294 0000268D */  lw         $6, 0x0($9)
/* F6398 001F6298 0400238D */  lw         $3, 0x4($9)
/* F639C 001F629C 08002925 */  addiu      $9, $9, 0x8
/* F63A0 001F62A0 FFFFE724 */  addiu      $7, $7, -0x1
/* F63A4 001F62A4 000006AD */  sw         $6, 0x0($8)
/* F63A8 001F62A8 040003AD */  sw         $3, 0x4($8)
/* F63AC 001F62AC 08000825 */  addiu      $8, $8, 0x8
/* F63B0 001F62B0 F8FFE01C */  bgtz       $7, .L001F6294
/* F63B4 001F62B4 00000000 */   nop
/* F63B8 001F62B8 280043DC */  ld         $3, 0x28($2)
/* F63BC 001F62BC 5800A727 */  addiu      $7, $sp, 0x58
/* F63C0 001F62C0 0000E3FC */  sd         $3, 0x0($7)
/* F63C4 001F62C4 300043DC */  ld         $3, 0x30($2)
/* F63C8 001F62C8 6000A3FF */  sd         $3, 0x60($sp)
/* F63CC 001F62CC 6800A327 */  addiu      $3, $sp, 0x68
/* F63D0 001F62D0 380043C4 */  lwc1       $f3, 0x38($2)
/* F63D4 001F62D4 3C0042C4 */  lwc1       $f2, 0x3C($2)
/* F63D8 001F62D8 400041C4 */  lwc1       $f1, 0x40($2)
/* F63DC 001F62DC 440040C4 */  lwc1       $f0, 0x44($2)
/* F63E0 001F62E0 000063E4 */  swc1       $f3, 0x0($3)
/* F63E4 001F62E4 040062E4 */  swc1       $f2, 0x4($3)
/* F63E8 001F62E8 080061E4 */  swc1       $f1, 0x8($3)
/* F63EC 001F62EC 0C0060E4 */  swc1       $f0, 0xC($3)
/* F63F0 001F62F0 4800438C */  lw         $3, 0x48($2)
/* F63F4 001F62F4 7800A3AF */  sw         $3, 0x78($sp)
/* F63F8 001F62F8 4C00438C */  lw         $3, 0x4C($2)
/* F63FC 001F62FC 7C00A3AF */  sw         $3, 0x7C($sp)
/* F6400 001F6300 3000A327 */  addiu      $3, $sp, 0x30
/* F6404 001F6304 0A006010 */  beqz       $3, .L001F6330
/* F6408 001F6308 00000000 */   nop
/* F640C 001F630C 0400E690 */  lbu        $6, 0x4($7)
/* F6410 001F6310 01000230 */  andi       $2, $0, 0x1
/* F6414 001F6314 80180200 */  sll        $3, $2, 2
/* F6418 001F6318 FBFF0224 */  addiu      $2, $0, -0x5
/* F641C 001F631C 2410C200 */  and        $2, $6, $2
/* F6420 001F6320 25104300 */  or         $2, $2, $3
/* F6424 001F6324 0400E2A0 */  sb         $2, 0x4($7)
/* F6428 001F6328 03000010 */  b          .L001F6338
/* F642C 001F632C 00000000 */   nop
.L001F6330:
/* F6430 001F6330 F5000010 */  b          .L001F6708
/* F6434 001F6334 00000000 */   nop
.L001F6338:
/* F6438 001F6338 40000224 */  addiu      $2, $0, 0x40
/* F643C 001F633C 2088868F */  lw         $6, -0x77E0($gp)
/* F6440 001F6340 1C000324 */  addiu      $3, $0, 0x1C
/* F6444 001F6344 1500C310 */  beq        $6, $3, .L001F639C
/* F6448 001F6348 00000000 */   nop
/* F644C 001F634C FFFF0324 */  addiu      $3, $0, -0x1
/* F6450 001F6350 0300C310 */  beq        $6, $3, .L001F6360
/* F6454 001F6354 00000000 */   nop
/* F6458 001F6358 1E000010 */  b          .L001F63D4
/* F645C 001F635C 00000000 */   nop
.L001F6360:
/* F6460 001F6360 0043023C */  lui        $2, (0x43000000 >> 16)
/* F6464 001F6364 00108244 */  mtc1       $2, $f2
/* F6468 001F6368 8040023C */  lui        $2, (0x40800000 >> 16)
/* F646C 001F636C 00088244 */  mtc1       $2, $f1
/* F6470 001F6370 849580C7 */  lwc1       $f0, -0x6A7C($gp)
/* F6474 001F6374 02080046 */  mul.s      $f0, $f1, $f0
/* F6478 001F6378 01130046 */  sub.s      $f12, $f2, $f0
/* F647C 001F637C 2C44040C */  jal        fptosi
/* F6480 001F6380 00000000 */   nop
/* F6484 001F6384 40004128 */  slti       $at, $2, 0x40
/* F6488 001F6388 12002010 */  beqz       $at, .L001F63D4
/* F648C 001F638C 00000000 */   nop
/* F6490 001F6390 40000224 */  addiu      $2, $0, 0x40
/* F6494 001F6394 0F000010 */  b          .L001F63D4
/* F6498 001F6398 00000000 */   nop
.L001F639C:
/* F649C 001F639C 00008244 */  mtc1       $2, $f0
/* F64A0 001F63A0 00000000 */  nop
/* F64A4 001F63A4 A0008046 */  cvt.s.w    $f2, $f0
/* F64A8 001F63A8 8040023C */  lui        $2, (0x40800000 >> 16)
/* F64AC 001F63AC 00088244 */  mtc1       $2, $f1
/* F64B0 001F63B0 849580C7 */  lwc1       $f0, -0x6A7C($gp)
/* F64B4 001F63B4 02080046 */  mul.s      $f0, $f1, $f0
/* F64B8 001F63B8 00130046 */  add.s      $f12, $f2, $f0
/* F64BC 001F63BC 2C44040C */  jal        fptosi
/* F64C0 001F63C0 00000000 */   nop
/* F64C4 001F63C4 81004128 */  slti       $at, $2, 0x81
/* F64C8 001F63C8 02002014 */  bnez       $at, .L001F63D4
/* F64CC 001F63CC 00000000 */   nop
/* F64D0 001F63D0 80000224 */  addiu      $2, $0, 0x80
.L001F63D4:
/* F64D4 001F63D4 FF004730 */  andi       $7, $2, 0xFF
/* F64D8 001F63D8 2846E070 */  paddub     $8, $7, $0
/* F64DC 001F63DC 284EE070 */  paddub     $9, $7, $0
/* F64E0 001F63E0 3000A427 */  addiu      $4, $sp, 0x30
/* F64E4 001F63E4 DA01023C */  lui        $2, %hi(MenuDispRc)
/* F64E8 001F63E8 906A4524 */  addiu      $5, $2, %lo(MenuDispRc)
/* F64EC 001F63EC DA01023C */  lui        $2, %hi(MenuDispRc)
/* F64F0 001F63F0 906A4624 */  addiu      $6, $2, %lo(MenuDispRc)
/* F64F4 001F63F4 80000A24 */  addiu      $10, $0, 0x80
/* F64F8 001F63F8 E4B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_UcUcUci
/* F64FC 001F63FC 00000000 */   nop
/* F6500 001F6400 2088848F */  lw         $4, -0x77E0($gp)
/* F6504 001F6404 1B00812C */  sltiu      $at, $4, 0x1B
/* F6508 001F6408 2A002010 */  beqz       $at, .L001F64B4
/* F650C 001F640C 00000000 */   nop
/* F6510 001F6410 2A00023C */  lui        $2, %hi(_1158_2)
/* F6514 001F6414 30D64324 */  addiu      $3, $2, %lo(_1158_2)
/* F6518 001F6418 80100400 */  sll        $2, $4, 2
/* F651C 001F641C 21104300 */  addu       $2, $2, $3
/* F6520 001F6420 0000428C */  lw         $2, 0x0($2)
/* F6524 001F6424 08004000 */  jr         $2
/* F6528 001F6428 00000000 */   nop
/* F652C 001F642C 58D1070C */  jal        DrawBattleMain__Fv
/* F6530 001F6430 00000000 */   nop
/* F6534 001F6434 1F000010 */  b          .L001F64B4
/* F6538 001F6438 00000000 */   nop
/* F653C 001F643C 8CDF070C */  jal        DrawCharaSelect__Fv
/* F6540 001F6440 00000000 */   nop
/* F6544 001F6444 1B000010 */  b          .L001F64B4
/* F6548 001F6448 00000000 */   nop
/* F654C 001F644C 2003080C */  jal        WeaponMenuDraw__Fv
/* F6550 001F6450 00000000 */   nop
/* F6554 001F6454 17000010 */  b          .L001F64B4
/* F6558 001F6458 00000000 */   nop
/* F655C 001F645C 6C16080C */  jal        ItemMenuModeDraw__Fv
/* F6560 001F6460 00000000 */   nop
/* F6564 001F6464 13000010 */  b          .L001F64B4
/* F6568 001F6468 00000000 */   nop
/* F656C 001F646C 04D6070C */  jal        DrawBtlAtoraSelect__Fv
/* F6570 001F6470 00000000 */   nop
/* F6574 001F6474 0F000010 */  b          .L001F64B4
/* F6578 001F6478 00000000 */   nop
/* F657C 001F647C FC23080C */  jal        DrawMenuMove__Fv
/* F6580 001F6480 00000000 */   nop
/* F6584 001F6484 0B000010 */  b          .L001F64B4
/* F6588 001F6488 00000000 */   nop
/* F658C 001F648C 0CD6070C */  jal        BtlDrawOption__Fv
/* F6590 001F6490 00000000 */   nop
/* F6594 001F6494 07000010 */  b          .L001F64B4
/* F6598 001F6498 00000000 */   nop
/* F659C 001F649C 18D6070C */  jal        BtlDrawSave__Fv
/* F65A0 001F64A0 00000000 */   nop
/* F65A4 001F64A4 03000010 */  b          .L001F64B4
/* F65A8 001F64A8 00000000 */   nop
/* F65AC 001F64AC 642C080C */  jal        BattleManualDraw__Fv
/* F65B0 001F64B0 00000000 */   nop
.L001F64B4:
/* F65B4 001F64B4 F896828F */  lw         $2, -0x6908($gp)
/* F65B8 001F64B8 01004224 */  addiu      $2, $2, 0x1
/* F65BC 001F64BC F89682AF */  sw         $2, -0x6908($gp)
/* F65C0 001F64C0 F896838F */  lw         $3, -0x6908($gp)
/* F65C4 001F64C4 5F40023C */  lui        $2, (0x405F7E00 >> 16)
/* F65C8 001F64C8 007E4234 */  ori        $2, $2, (0x405F7E00 & 0xFFFF)
/* F65CC 001F64CC 2A106200 */  slt        $2, $3, $2
/* F65D0 001F64D0 02004014 */  bnez       $2, .L001F64DC
/* F65D4 001F64D4 00000000 */   nop
/* F65D8 001F64D8 F89680AF */  sw         $0, -0x6908($gp)
.L001F64DC:
/* F65DC 001F64DC 48958493 */  lbu        $4, -0x6AB8($gp)
/* F65E0 001F64E0 54D8070C */  jal        BtlMenuDrawSpecialFlag__Fi
/* F65E4 001F64E4 00000000 */   nop
/* F65E8 001F64E8 28864070 */  paddub     $16, $2, $0
/* F65EC 001F64EC E894828F */  lw         $2, -0x6B18($gp)
/* F65F0 001F64F0 29004010 */  beqz       $2, .L001F6598
/* F65F4 001F64F4 00000000 */   nop
/* F65F8 001F64F8 2088838F */  lw         $3, -0x77E0($gp)
/* F65FC 001F64FC 1C000224 */  addiu      $2, $0, 0x1C
/* F6600 001F6500 03006210 */  beq        $3, $2, .L001F6510
/* F6604 001F6504 00000000 */   nop
/* F6608 001F6508 0A000010 */  b          .L001F6534
/* F660C 001F650C 00000000 */   nop
.L001F6510:
/* F6610 001F6510 4C95828F */  lw         $2, -0x6AB4($gp)
/* F6614 001F6514 F8FF4224 */  addiu      $2, $2, -0x8
/* F6618 001F6518 4C9582AF */  sw         $2, -0x6AB4($gp)
/* F661C 001F651C 4C95828F */  lw         $2, -0x6AB4($gp)
/* F6620 001F6520 0D004104 */  bgez       $2, .L001F6558
/* F6624 001F6524 00000000 */   nop
/* F6628 001F6528 4C9580AF */  sw         $0, -0x6AB4($gp)
/* F662C 001F652C 0A000010 */  b          .L001F6558
/* F6630 001F6530 00000000 */   nop
.L001F6534:
/* F6634 001F6534 4C95828F */  lw         $2, -0x6AB4($gp)
/* F6638 001F6538 09004224 */  addiu      $2, $2, 0x9
/* F663C 001F653C 4C9582AF */  sw         $2, -0x6AB4($gp)
/* F6640 001F6540 4C95828F */  lw         $2, -0x6AB4($gp)
/* F6644 001F6544 81004128 */  slti       $at, $2, 0x81
/* F6648 001F6548 03002014 */  bnez       $at, .L001F6558
/* F664C 001F654C 00000000 */   nop
/* F6650 001F6550 80000224 */  addiu      $2, $0, 0x80
/* F6654 001F6554 4C9582AF */  sw         $2, -0x6AB4($gp)
.L001F6558:
/* F6658 001F6558 0F000012 */  beqz       $16, .L001F6598
/* F665C 001F655C 00000000 */   nop
/* F6660 001F6560 40958CC7 */  lwc1       $f12, -0x6AC0($gp)
/* F6664 001F6564 2C44040C */  jal        fptosi
/* F6668 001F6568 00000000 */   nop
/* F666C 001F656C 288E4070 */  paddub     $17, $2, $0
/* F6670 001F6570 44958CC7 */  lwc1       $f12, -0x6ABC($gp)
/* F6674 001F6574 2C44040C */  jal        fptosi
/* F6678 001F6578 00000000 */   nop
/* F667C 001F657C 28262072 */  paddub     $4, $17, $0
/* F6680 001F6580 282E4070 */  paddub     $5, $2, $0
/* F6684 001F6584 50958CC7 */  lwc1       $f12, -0x6AB0($gp)
/* F6688 001F6588 54958DC7 */  lwc1       $f13, -0x6AAC($gp)
/* F668C 001F658C 4C95868F */  lw         $6, -0x6AB4($gp)
/* F6690 001F6590 985E080C */  jal        MenuHelpWinDraw__Fiiffi
/* F6694 001F6594 00000000 */   nop
.L001F6598:
/* F6698 001F6598 DA01013C */  lui        $at, (0x1DA3A9C >> 16)
/* F669C 001F659C 9C3A248C */  lw         $4, (0x1DA3A9C & 0xFFFF)($at)
/* F66A0 001F65A0 38B4080C */  jal        MenuTextureReload__Fi
/* F66A4 001F65A4 00000000 */   nop
/* F66A8 001F65A8 8800A427 */  addiu      $4, $sp, 0x88
/* F66AC 001F65AC 8C00A527 */  addiu      $5, $sp, 0x8C
/* F66B0 001F65B0 F0B8080C */  jal        GetMainMenuRightHelpMsgLangOffset__FRiRi
/* F66B4 001F65B4 00000000 */   nop
/* F66B8 001F65B8 409581C7 */  lwc1       $f1, -0x6AC0($gp)
/* F66BC 001F65BC 8800A0C7 */  lwc1       $f0, 0x88($sp)
/* F66C0 001F65C0 20008046 */  cvt.s.w    $f0, $f0
/* F66C4 001F65C4 000B0046 */  add.s      $f12, $f1, $f0
/* F66C8 001F65C8 2C44040C */  jal        fptosi
/* F66CC 001F65CC 00000000 */   nop
/* F66D0 001F65D0 DA01013C */  lui        $at, (0x1DA2350 >> 16)
/* F66D4 001F65D4 502322AC */  sw         $2, (0x1DA2350 & 0xFFFF)($at)
/* F66D8 001F65D8 449581C7 */  lwc1       $f1, -0x6ABC($gp)
/* F66DC 001F65DC 8C00A0C7 */  lwc1       $f0, 0x8C($sp)
/* F66E0 001F65E0 20008046 */  cvt.s.w    $f0, $f0
/* F66E4 001F65E4 000B0046 */  add.s      $f12, $f1, $f0
/* F66E8 001F65E8 2C44040C */  jal        fptosi
/* F66EC 001F65EC 00000000 */   nop
/* F66F0 001F65F0 DA01013C */  lui        $at, (0x1DA2354 >> 16)
/* F66F4 001F65F4 542322AC */  sw         $2, (0x1DA2354 & 0xFFFF)($at)
/* F66F8 001F65F8 E894828F */  lw         $2, -0x6B18($gp)
/* F66FC 001F65FC 10004010 */  beqz       $2, .L001F6640
/* F6700 001F6600 00000000 */   nop
/* F6704 001F6604 0E000012 */  beqz       $16, .L001F6640
/* F6708 001F6608 00000000 */   nop
/* F670C 001F660C DA01013C */  lui        $at, (0x1DA23E8 >> 16)
/* F6710 001F6610 E82320AC */  sw         $0, (0x1DA23E8 & 0xFFFF)($at)
/* F6714 001F6614 4C95828F */  lw         $2, -0x6AB4($gp)
/* F6718 001F6618 DA01013C */  lui        $at, (0x1DA3A24 >> 16)
/* F671C 001F661C 243A22AC */  sw         $2, (0x1DA3A24 & 0xFFFF)($at)
/* F6720 001F6620 DA01023C */  lui        $2, %hi(CommonMenuMes2)
/* F6724 001F6624 50234424 */  addiu      $4, $2, %lo(CommonMenuMes2)
/* F6728 001F6628 6437050C */  jal        Step__6ClsMesFv
/* F672C 001F662C 00000000 */   nop
/* F6730 001F6630 DA01023C */  lui        $2, %hi(CommonMenuMes2)
/* F6734 001F6634 50234424 */  addiu      $4, $2, %lo(CommonMenuMes2)
/* F6738 001F6638 C44C050C */  jal        DrawMesWin__6ClsMesFv
/* F673C 001F663C 00000000 */   nop
.L001F6640:
/* F6740 001F6640 28260070 */  paddub     $4, $0, $0
/* F6744 001F6644 046F050C */  jal        setbilinear__Fi
/* F6748 001F6648 00000000 */   nop
/* F674C 001F664C 01000424 */  addiu      $4, $0, 0x1
/* F6750 001F6650 54D8070C */  jal        BtlMenuDrawSpecialFlag__Fi
/* F6754 001F6654 00000000 */   nop
/* F6758 001F6658 28864070 */  paddub     $16, $2, $0
/* F675C 001F665C 03000012 */  beqz       $16, .L001F666C
/* F6760 001F6660 00000000 */   nop
/* F6764 001F6664 94D0070C */  jal        DrawBtlMenuBar__Fv
/* F6768 001F6668 00000000 */   nop
.L001F666C:
/* F676C 001F666C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* F6770 001F6670 72EA2384 */  lh         $3, -0x158E($at)
/* F6774 001F6674 05000224 */  addiu      $2, $0, 0x5
/* F6778 001F6678 09006210 */  beq        $3, $2, .L001F66A0
/* F677C 001F667C 00000000 */   nop
/* F6780 001F6680 DB01023C */  lui        $2, %hi(MenuWepLevelUp)
/* F6784 001F6684 E0A84424 */  addiu      $4, $2, %lo(MenuWepLevelUp)
/* F6788 001F6688 04DC080C */  jal        Step__14CWeaponLevelUpFv
/* F678C 001F668C 00000000 */   nop
/* F6790 001F6690 DB01023C */  lui        $2, %hi(MenuWepLevelUp)
/* F6794 001F6694 E0A84424 */  addiu      $4, $2, %lo(MenuWepLevelUp)
/* F6798 001F6698 4CDE080C */  jal        Draw__14CWeaponLevelUpFv
/* F679C 001F669C 00000000 */   nop
.L001F66A0:
/* F67A0 001F66A0 F4CF070C */  jal        GetInteriorOutFlag__Fv
/* F67A4 001F66A4 00000000 */   nop
/* F67A8 001F66A8 14004010 */  beqz       $2, .L001F66FC
/* F67AC 001F66AC 00000000 */   nop
/* F67B0 001F66B0 849581C7 */  lwc1       $f1, -0x6A7C($gp)
/* F67B4 001F66B4 803F023C */  lui        $2, (0x3F800000 >> 16)
/* F67B8 001F66B8 00008244 */  mtc1       $2, $f0
/* F67BC 001F66BC 00000000 */  nop
/* F67C0 001F66C0 00080046 */  add.s      $f0, $f1, $f0
/* F67C4 001F66C4 849580E7 */  swc1       $f0, -0x6A7C($gp)
/* F67C8 001F66C8 4040023C */  lui        $2, (0x40400000 >> 16)
/* F67CC 001F66CC 00088244 */  mtc1       $2, $f1
/* F67D0 001F66D0 849580C7 */  lwc1       $f0, -0x6A7C($gp)
/* F67D4 001F66D4 020B0046 */  mul.s      $f12, $f1, $f0
/* F67D8 001F66D8 2C44040C */  jal        fptosi
/* F67DC 001F66DC 00000000 */   nop
/* F67E0 001F66E0 81004128 */  slti       $at, $2, 0x81
/* F67E4 001F66E4 02002014 */  bnez       $at, .L001F66F0
/* F67E8 001F66E8 00000000 */   nop
/* F67EC 001F66EC 80000224 */  addiu      $2, $0, 0x80
.L001F66F0:
/* F67F0 001F66F0 28264070 */  paddub     $4, $2, $0
/* F67F4 001F66F4 A0B4080C */  jal        AllFadeForMenu__Fi
/* F67F8 001F66F8 00000000 */   nop
.L001F66FC:
/* F67FC 001F66FC 01000424 */  addiu      $4, $0, 0x1
/* F6800 001F6700 046F050C */  jal        setbilinear__Fi
/* F6804 001F6704 00000000 */   nop
.L001F6708:
/* F6808 001F6708 2000BF7B */  lq         $31, 0x20($sp)
/* F680C 001F670C 1000B17B */  lq         $17, 0x10($sp)
/* F6810 001F6710 0000B07B */  lq         $16, 0x0($sp)
/* F6814 001F6714 9000BD27 */  addiu      $sp, $sp, 0x90
/* F6818 001F6718 0800E003 */  jr         $31
/* F681C 001F671C 00000000 */   nop
