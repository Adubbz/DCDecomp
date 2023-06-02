.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel OpeningBookDraw__Fv
/* 13D680 0023D580 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 13D684 0023D584 0000BF7F */  sq         $31, 0x0($sp)
/* 13D688 0023D588 28260070 */  paddub     $4, $0, $0
/* 13D68C 0023D58C 046F050C */  jal        setbilinear__Fi
/* 13D690 0023D590 00000000 */   nop
/* 13D694 0023D594 80000424 */  addiu      $4, $0, 0x80
/* 13D698 0023D598 A0B4080C */  jal        AllFadeForMenu__Fi
/* 13D69C 0023D59C 00000000 */   nop
/* 13D6A0 0023D5A0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D6A4 0023D5A4 70BC2384 */  lh         $3, -0x4390($at)
/* 13D6A8 0023D5A8 3E006010 */  beqz       $3, .L0023D6A4
/* 13D6AC 0023D5AC 00000000 */   nop
/* 13D6B0 0023D5B0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D6B4 0023D5B4 72BC2484 */  lh         $4, -0x438E($at)
/* 13D6B8 0023D5B8 38B4080C */  jal        MenuTextureReload__Fi
/* 13D6BC 0023D5BC 00000000 */   nop
/* 13D6C0 0023D5C0 C701023C */  lui        $2, %hi(TexManager)
/* 13D6C4 0023D5C4 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 13D6C8 0023D5C8 2A00023C */  lui        $2, %hi(_1573)
/* 13D6CC 0023D5CC 38F74524 */  addiu      $5, $2, %lo(_1573)
/* 13D6D0 0023D5D0 FFFF0624 */  addiu      $6, $0, -0x1
/* 13D6D4 0023D5D4 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 13D6D8 0023D5D8 00000000 */   nop
/* 13D6DC 0023D5DC 28264070 */  paddub     $4, $2, $0
/* 13D6E0 0023D5E0 282E0070 */  paddub     $5, $0, $0
/* 13D6E4 0023D5E4 28360070 */  paddub     $6, $0, $0
/* 13D6E8 0023D5E8 80000724 */  addiu      $7, $0, 0x80
/* 13D6EC 0023D5EC F4C9080C */  jal        DrawFullSizePicture__FP8CTextureiii
/* 13D6F0 0023D5F0 00000000 */   nop
/* 13D6F4 0023D5F4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D6F8 0023D5F8 78BC2584 */  lh         $5, -0x4388($at)
/* 13D6FC 0023D5FC 0700A12C */  sltiu      $at, $5, 0x7
/* 13D700 0023D600 28002010 */  beqz       $at, .L0023D6A4
/* 13D704 0023D604 00000000 */   nop
/* 13D708 0023D608 2A00033C */  lui        $3, %hi(_1574)
/* 13D70C 0023D60C 50F76424 */  addiu      $4, $3, %lo(_1574)
/* 13D710 0023D610 80180500 */  sll        $3, $5, 2
/* 13D714 0023D614 21186400 */  addu       $3, $3, $4
/* 13D718 0023D618 0000638C */  lw         $3, 0x0($3)
/* 13D71C 0023D61C 08006000 */  jr         $3
/* 13D720 0023D620 00000000 */   nop
/* 13D724 0023D624 DA01013C */  lui        $at, (0x1DA3A9C >> 16)
/* 13D728 0023D628 9C3A248C */  lw         $4, (0x1DA3A9C & 0xFFFF)($at)
/* 13D72C 0023D62C 38B4080C */  jal        MenuTextureReload__Fi
/* 13D730 0023D630 00000000 */   nop
/* 13D734 0023D634 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D738 0023D638 7CBC2284 */  lh         $2, -0x4384($at)
/* 13D73C 0023D63C DA01013C */  lui        $at, (0x1DA3A24 >> 16)
/* 13D740 0023D640 243A22AC */  sw         $2, (0x1DA3A24 & 0xFFFF)($at)
/* 13D744 0023D644 4C010324 */  addiu      $3, $0, 0x14C
/* 13D748 0023D648 DA01013C */  lui        $at, (0x1DA2358 >> 16)
/* 13D74C 0023D64C 5823228C */  lw         $2, (0x1DA2358 & 0xFFFF)($at)
/* 13D750 0023D650 23286200 */  subu       $5, $3, $2
/* 13D754 0023D654 DA01023C */  lui        $2, %hi(CommonMenuMes2)
/* 13D758 0023D658 50234424 */  addiu      $4, $2, %lo(CommonMenuMes2)
/* 13D75C 0023D65C 34B0080C */  jal        GetMenuCommonPutXY__FP6ClsMesi
/* 13D760 0023D660 00000000 */   nop
/* 13D764 0023D664 DA01023C */  lui        $2, %hi(CommonMenuMes2)
/* 13D768 0023D668 50234424 */  addiu      $4, $2, %lo(CommonMenuMes2)
/* 13D76C 0023D66C 6437050C */  jal        Step__6ClsMesFv
/* 13D770 0023D670 00000000 */   nop
/* 13D774 0023D674 DA01023C */  lui        $2, %hi(CommonMenuMes2)
/* 13D778 0023D678 50234424 */  addiu      $4, $2, %lo(CommonMenuMes2)
/* 13D77C 0023D67C C44C050C */  jal        DrawMesWin__6ClsMesFv
/* 13D780 0023D680 00000000 */   nop
/* 13D784 0023D684 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13D788 0023D688 7ABC2484 */  lh         $4, -0x4386($at)
/* 13D78C 0023D68C A0B4080C */  jal        AllFadeForMenu__Fi
/* 13D790 0023D690 00000000 */   nop
/* 13D794 0023D694 03000010 */  b          .L0023D6A4
/* 13D798 0023D698 00000000 */   nop
/* 13D79C 0023D69C E8E6080C */  jal        NameEnterDraw__Fv
/* 13D7A0 0023D6A0 00000000 */   nop
.L0023D6A4:
/* 13D7A4 0023D6A4 0000BF7B */  lq         $31, 0x0($sp)
/* 13D7A8 0023D6A8 1000BD27 */  addiu      $sp, $sp, 0x10
/* 13D7AC 0023D6AC 0800E003 */  jr         $31
/* 13D7B0 0023D6B0 00000000 */   nop
/* 13D7B4 0023D6B4 00000000 */  nop
/* 13D7B8 0023D6B8 00000000 */  nop
/* 13D7BC 0023D6BC 00000000 */  nop
