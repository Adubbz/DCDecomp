.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawIconParts__Fiiiiiii
/* 12D6A0 0022D5A0 30FFBD27 */  addiu      $sp, $sp, -0xD0
/* 12D6A4 0022D5A4 8000BF7F */  sq         $31, 0x80($sp)
/* 12D6A8 0022D5A8 7000B77F */  sq         $23, 0x70($sp)
/* 12D6AC 0022D5AC 6000B67F */  sq         $22, 0x60($sp)
/* 12D6B0 0022D5B0 5000B57F */  sq         $21, 0x50($sp)
/* 12D6B4 0022D5B4 4000B47F */  sq         $20, 0x40($sp)
/* 12D6B8 0022D5B8 3000B37F */  sq         $19, 0x30($sp)
/* 12D6BC 0022D5BC 2000B27F */  sq         $18, 0x20($sp)
/* 12D6C0 0022D5C0 1000B17F */  sq         $17, 0x10($sp)
/* 12D6C4 0022D5C4 0000B07F */  sq         $16, 0x0($sp)
/* 12D6C8 0022D5C8 28B68070 */  paddub     $22, $4, $0
/* 12D6CC 0022D5CC 28AEA070 */  paddub     $21, $5, $0
/* 12D6D0 0022D5D0 28A6C070 */  paddub     $20, $6, $0
/* 12D6D4 0022D5D4 289EE070 */  paddub     $19, $7, $0
/* 12D6D8 0022D5D8 28960071 */  paddub     $18, $8, $0
/* 12D6DC 0022D5DC 288E2071 */  paddub     $17, $9, $0
/* 12D6E0 0022D5E0 28BE4071 */  paddub     $23, $10, $0
/* 12D6E4 0022D5E4 E1FF6326 */  addiu      $3, $19, -0x1F
/* 12D6E8 0022D5E8 2A188302 */  slt        $3, $20, $3
/* 12D6EC 0022D5EC 05006014 */  bnez       $3, .L0022D604
/* 12D6F0 0022D5F0 00000000 */   nop
/* 12D6F4 0022D5F4 FFFF4326 */  addiu      $3, $18, -0x1
/* 12D6F8 0022D5F8 2A087400 */  slt        $at, $3, $20
/* 12D6FC 0022D5FC 03002010 */  beqz       $at, .L0022D60C
/* 12D700 0022D600 00000000 */   nop
.L0022D604:
/* 12D704 0022D604 51000010 */  b          .L0022D74C
/* 12D708 0022D608 00000000 */   nop
.L0022D60C:
/* 12D70C 0022D60C C000B4AF */  sw         $20, 0xC0($sp)
/* 12D710 0022D610 7443070C */  jal        GetCommonItemInfo__Fi
/* 12D714 0022D614 00000000 */   nop
/* 12D718 0022D618 4C004010 */  beqz       $2, .L0022D74C
/* 12D71C 0022D61C 00000000 */   nop
/* 12D720 0022D620 04004384 */  lh         $3, 0x4($2)
/* 12D724 0022D624 49006004 */  bltz       $3, .L0022D74C
/* 12D728 0022D628 00000000 */   nop
/* 12D72C 0022D62C 3C241600 */  dsll32     $4, $22, 16
/* 12D730 0022D630 3F240400 */  dsra32     $4, $4, 16
/* 12D734 0022D634 C400A527 */  addiu      $5, $sp, 0xC4
/* 12D738 0022D638 C800A627 */  addiu      $6, $sp, 0xC8
/* 12D73C 0022D63C 64B7080C */  jal        RetCTex__FsRiRi
/* 12D740 0022D640 00000000 */   nop
/* 12D744 0022D644 28864070 */  paddub     $16, $2, $0
/* 12D748 0022D648 40000012 */  beqz       $16, .L0022D74C
/* 12D74C 0022D64C 00000000 */   nop
/* 12D750 0022D650 20000224 */  addiu      $2, $0, 0x20
/* 12D754 0022D654 CC00A2AF */  sw         $2, 0xCC($sp)
/* 12D758 0022D658 C000A427 */  addiu      $4, $sp, 0xC0
/* 12D75C 0022D65C C800A527 */  addiu      $5, $sp, 0xC8
/* 12D760 0022D660 CC00A627 */  addiu      $6, $sp, 0xCC
/* 12D764 0022D664 283E6072 */  paddub     $7, $19, $0
/* 12D768 0022D668 28464072 */  paddub     $8, $18, $0
/* 12D76C 0022D66C A0B7080C */  jal        MenuTextureClip__FRiRiRiii
/* 12D770 0022D670 00000000 */   nop
/* 12D774 0022D674 CC00A48F */  lw         $4, 0xCC($sp)
/* 12D778 0022D678 C800A38F */  lw         $3, 0xC8($sp)
/* 12D77C 0022D67C C400A28F */  lw         $2, 0xC4($sp)
/* 12D780 0022D680 9000A2AF */  sw         $2, 0x90($sp)
/* 12D784 0022D684 9400A3AF */  sw         $3, 0x94($sp)
/* 12D788 0022D688 20000324 */  addiu      $3, $0, 0x20
/* 12D78C 0022D68C 9800A3AF */  sw         $3, 0x98($sp)
/* 12D790 0022D690 9C00A4AF */  sw         $4, 0x9C($sp)
/* 12D794 0022D694 C000A28F */  lw         $2, 0xC0($sp)
/* 12D798 0022D698 01004524 */  addiu      $5, $2, 0x1
/* 12D79C 0022D69C 0200A226 */  addiu      $2, $21, 0x2
/* 12D7A0 0022D6A0 A000A2AF */  sw         $2, 0xA0($sp)
/* 12D7A4 0022D6A4 A400A5AF */  sw         $5, 0xA4($sp)
/* 12D7A8 0022D6A8 A800A3AF */  sw         $3, 0xA8($sp)
/* 12D7AC 0022D6AC AC00A4AF */  sw         $4, 0xAC($sp)
/* 12D7B0 0022D6B0 A0B8040C */  jal        GetVif1Packet__Fv
/* 12D7B4 0022D6B4 00000000 */   nop
/* 12D7B8 0022D6B8 80181100 */  sll        $3, $17, 2
/* 12D7BC 0022D6BC 21187100 */  addu       $3, $3, $17
/* 12D7C0 0022D6C0 00190300 */  sll        $3, $3, 4
/* 12D7C4 0022D6C4 C3190300 */  sra        $3, $3, 7
/* 12D7C8 0022D6C8 FF006B30 */  andi       $11, $3, 0xFF
/* 12D7CC 0022D6CC 28264070 */  paddub     $4, $2, $0
/* 12D7D0 0022D6D0 282E0072 */  paddub     $5, $16, $0
/* 12D7D4 0022D6D4 A000A627 */  addiu      $6, $sp, 0xA0
/* 12D7D8 0022D6D8 9000A727 */  addiu      $7, $sp, 0x90
/* 12D7DC 0022D6DC 28460070 */  paddub     $8, $0, $0
/* 12D7E0 0022D6E0 284E0070 */  paddub     $9, $0, $0
/* 12D7E4 0022D6E4 28560070 */  paddub     $10, $0, $0
/* 12D7E8 0022D6E8 8C71050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_UcUcUcUc
/* 12D7EC 0022D6EC 00000000 */   nop
/* 12D7F0 0022D6F0 CC00A38F */  lw         $3, 0xCC($sp)
/* 12D7F4 0022D6F4 C000A28F */  lw         $2, 0xC0($sp)
/* 12D7F8 0022D6F8 B000B5AF */  sw         $21, 0xB0($sp)
/* 12D7FC 0022D6FC B400A2AF */  sw         $2, 0xB4($sp)
/* 12D800 0022D700 20000224 */  addiu      $2, $0, 0x20
/* 12D804 0022D704 B800A2AF */  sw         $2, 0xB8($sp)
/* 12D808 0022D708 BC00A3AF */  sw         $3, 0xBC($sp)
/* 12D80C 0022D70C 28260072 */  paddub     $4, $16, $0
/* 12D810 0022D710 B000A527 */  addiu      $5, $sp, 0xB0
/* 12D814 0022D714 9000A627 */  addiu      $6, $sp, 0x90
/* 12D818 0022D718 283E2072 */  paddub     $7, $17, $0
/* 12D81C 0022D71C C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 12D820 0022D720 00000000 */   nop
/* 12D824 0022D724 2826A072 */  paddub     $4, $21, $0
/* 12D828 0022D728 282E8072 */  paddub     $5, $20, $0
/* 12D82C 0022D72C 28366072 */  paddub     $6, $19, $0
/* 12D830 0022D730 283E4072 */  paddub     $7, $18, $0
/* 12D834 0022D734 2846C072 */  paddub     $8, $22, $0
/* 12D838 0022D738 284EE072 */  paddub     $9, $23, $0
/* 12D83C 0022D73C 28562072 */  paddub     $10, $17, $0
/* 12D840 0022D740 285E0070 */  paddub     $11, $0, $0
/* 12D844 0022D744 E0B5080C */  jal        DrawAttachNumberOrWeapon__Fiiiiiiii
/* 12D848 0022D748 00000000 */   nop
.L0022D74C:
/* 12D84C 0022D74C 8000BF7B */  lq         $31, 0x80($sp)
/* 12D850 0022D750 7000B77B */  lq         $23, 0x70($sp)
/* 12D854 0022D754 6000B67B */  lq         $22, 0x60($sp)
/* 12D858 0022D758 5000B57B */  lq         $21, 0x50($sp)
/* 12D85C 0022D75C 4000B47B */  lq         $20, 0x40($sp)
/* 12D860 0022D760 3000B37B */  lq         $19, 0x30($sp)
/* 12D864 0022D764 2000B27B */  lq         $18, 0x20($sp)
/* 12D868 0022D768 1000B17B */  lq         $17, 0x10($sp)
/* 12D86C 0022D76C 0000B07B */  lq         $16, 0x0($sp)
/* 12D870 0022D770 D000BD27 */  addiu      $sp, $sp, 0xD0
/* 12D874 0022D774 0800E003 */  jr         $31
/* 12D878 0022D778 00000000 */   nop
/* 12D87C 0022D77C 00000000 */  nop
