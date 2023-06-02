.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawAttachNumberOrWeapon__Fiiiiiiii
/* 12D880 0022D780 10FFBD27 */  addiu      $sp, $sp, -0xF0
/* 12D884 0022D784 9000BF7F */  sq         $31, 0x90($sp)
/* 12D888 0022D788 8000BE7F */  sq         $fp, 0x80($sp)
/* 12D88C 0022D78C 7000B77F */  sq         $23, 0x70($sp)
/* 12D890 0022D790 6000B67F */  sq         $22, 0x60($sp)
/* 12D894 0022D794 5000B57F */  sq         $21, 0x50($sp)
/* 12D898 0022D798 4000B47F */  sq         $20, 0x40($sp)
/* 12D89C 0022D79C 3000B37F */  sq         $19, 0x30($sp)
/* 12D8A0 0022D7A0 2000B27F */  sq         $18, 0x20($sp)
/* 12D8A4 0022D7A4 1000B17F */  sq         $17, 0x10($sp)
/* 12D8A8 0022D7A8 0000B07F */  sq         $16, 0x0($sp)
/* 12D8AC 0022D7AC 28AE8070 */  paddub     $21, $4, $0
/* 12D8B0 0022D7B0 28A6A070 */  paddub     $20, $5, $0
/* 12D8B4 0022D7B4 289EC070 */  paddub     $19, $6, $0
/* 12D8B8 0022D7B8 2896E070 */  paddub     $18, $7, $0
/* 12D8BC 0022D7BC 288E0071 */  paddub     $17, $8, $0
/* 12D8C0 0022D7C0 28862071 */  paddub     $16, $9, $0
/* 12D8C4 0022D7C4 28B64071 */  paddub     $22, $10, $0
/* 12D8C8 0022D7C8 28BE6071 */  paddub     $23, $11, $0
/* 12D8CC 0022D7CC C701023C */  lui        $2, %hi(TexManager)
/* 12D8D0 0022D7D0 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 12D8D4 0022D7D4 2A00023C */  lui        $2, %hi(_852_4)
/* 12D8D8 0022D7D8 A8F14524 */  addiu      $5, $2, %lo(_852_4)
/* 12D8DC 0022D7DC FFFF0624 */  addiu      $6, $0, -0x1
/* 12D8E0 0022D7E0 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 12D8E4 0022D7E4 00000000 */   nop
/* 12D8E8 0022D7E8 2A081000 */  slt        $at, $0, $16
/* 12D8EC 0022D7EC 3C002010 */  beqz       $at, .L0022D8E0
/* 12D8F0 0022D7F0 00000000 */   nop
/* 12D8F4 0022D7F4 5B00232A */  slti       $3, $17, 0x5B
/* 12D8F8 0022D7F8 39006014 */  bnez       $3, .L0022D8E0
/* 12D8FC 0022D7FC 00000000 */   nop
/* 12D900 0022D800 5F00212A */  slti       $at, $17, 0x5F
/* 12D904 0022D804 36002010 */  beqz       $at, .L0022D8E0
/* 12D908 0022D808 00000000 */   nop
/* 12D90C 0022D80C 0C00BE26 */  addiu      $fp, $21, 0xC
/* 12D910 0022D810 0A008226 */  addiu      $2, $20, 0xA
/* 12D914 0022D814 E000A2AF */  sw         $2, 0xE0($sp)
/* 12D918 0022D818 FFFF0326 */  addiu      $3, $16, -0x1
/* 12D91C 0022D81C C0100300 */  sll        $2, $3, 3
/* 12D920 0022D820 21104300 */  addu       $2, $2, $3
/* 12D924 0022D824 40100200 */  sll        $2, $2, 1
/* 12D928 0022D828 84004224 */  addiu      $2, $2, 0x84
/* 12D92C 0022D82C E400A2AF */  sw         $2, 0xE4($sp)
/* 12D930 0022D830 B0000224 */  addiu      $2, $0, 0xB0
/* 12D934 0022D834 E800A2AF */  sw         $2, 0xE8($sp)
/* 12D938 0022D838 14000224 */  addiu      $2, $0, 0x14
/* 12D93C 0022D83C EC00A2AF */  sw         $2, 0xEC($sp)
/* 12D940 0022D840 FEFF4826 */  addiu      $8, $18, -0x2
/* 12D944 0022D844 E000A427 */  addiu      $4, $sp, 0xE0
/* 12D948 0022D848 E800A527 */  addiu      $5, $sp, 0xE8
/* 12D94C 0022D84C EC00A627 */  addiu      $6, $sp, 0xEC
/* 12D950 0022D850 283E6072 */  paddub     $7, $19, $0
/* 12D954 0022D854 A0B7080C */  jal        MenuTextureClip__FRiRiRiii
/* 12D958 0022D858 00000000 */   nop
/* 12D95C 0022D85C E000A58F */  lw         $5, 0xE0($sp)
/* 12D960 0022D860 2A08B200 */  slt        $at, $5, $18
/* 12D964 0022D864 1E002010 */  beqz       $at, .L0022D8E0
/* 12D968 0022D868 00000000 */   nop
/* 12D96C 0022D86C EC00A48F */  lw         $4, 0xEC($sp)
/* 12D970 0022D870 E800A38F */  lw         $3, 0xE8($sp)
/* 12D974 0022D874 E400A28F */  lw         $2, 0xE4($sp)
/* 12D978 0022D878 A000A2AF */  sw         $2, 0xA0($sp)
/* 12D97C 0022D87C A400A3AF */  sw         $3, 0xA4($sp)
/* 12D980 0022D880 12000224 */  addiu      $2, $0, 0x12
/* 12D984 0022D884 A800A2AF */  sw         $2, 0xA8($sp)
/* 12D988 0022D888 AC00A4AF */  sw         $4, 0xAC($sp)
/* 12D98C 0022D88C 0A00E012 */  beqz       $23, .L0022D8B8
/* 12D990 0022D890 00000000 */   nop
/* 12D994 0022D894 2826C073 */  paddub     $4, $fp, $0
/* 12D998 0022D898 A096868F */  lw         $6, -0x6960($gp)
/* 12D99C 0022D89C A000A727 */  addiu      $7, $sp, 0xA0
/* 12D9A0 0022D8A0 80000824 */  addiu      $8, $0, 0x80
/* 12D9A4 0022D8A4 284E0071 */  paddub     $9, $8, $0
/* 12D9A8 0022D8A8 645B080C */  jal        DrawObjectVibe__FiiP8CTexture8CRect_i_Uci
/* 12D9AC 0022D8AC 00000000 */   nop
/* 12D9B0 0022D8B0 0B000010 */  b          .L0022D8E0
/* 12D9B4 0022D8B4 00000000 */   nop
.L0022D8B8:
/* 12D9B8 0022D8B8 C000BEAF */  sw         $fp, 0xC0($sp)
/* 12D9BC 0022D8BC C400A5AF */  sw         $5, 0xC4($sp)
/* 12D9C0 0022D8C0 C800A2AF */  sw         $2, 0xC8($sp)
/* 12D9C4 0022D8C4 CC00A4AF */  sw         $4, 0xCC($sp)
/* 12D9C8 0022D8C8 A096848F */  lw         $4, -0x6960($gp)
/* 12D9CC 0022D8CC C000A527 */  addiu      $5, $sp, 0xC0
/* 12D9D0 0022D8D0 A000A627 */  addiu      $6, $sp, 0xA0
/* 12D9D4 0022D8D4 283EC072 */  paddub     $7, $22, $0
/* 12D9D8 0022D8D8 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 12D9DC 0022D8DC 00000000 */   nop
.L0022D8E0:
/* 12D9E0 0022D8E0 5A000324 */  addiu      $3, $0, 0x5A
/* 12D9E4 0022D8E4 34002316 */  bne        $17, $3, .L0022D9B8
/* 12D9E8 0022D8E8 00000000 */   nop
/* 12D9EC 0022D8EC 3C241000 */  dsll32     $4, $16, 16
/* 12D9F0 0022D8F0 3F240400 */  dsra32     $4, $4, 16
/* 12D9F4 0022D8F4 E400A527 */  addiu      $5, $sp, 0xE4
/* 12D9F8 0022D8F8 E800A627 */  addiu      $6, $sp, 0xE8
/* 12D9FC 0022D8FC 64B7080C */  jal        RetCTex__FsRiRi
/* 12DA00 0022D900 00000000 */   nop
/* 12DA04 0022D904 28864070 */  paddub     $16, $2, $0
/* 12DA08 0022D908 2B000012 */  beqz       $16, .L0022D9B8
/* 12DA0C 0022D90C 00000000 */   nop
/* 12DA10 0022D910 20000224 */  addiu      $2, $0, 0x20
/* 12DA14 0022D914 EC00A2AF */  sw         $2, 0xEC($sp)
/* 12DA18 0022D918 E000B4AF */  sw         $20, 0xE0($sp)
/* 12DA1C 0022D91C E000A427 */  addiu      $4, $sp, 0xE0
/* 12DA20 0022D920 E800A527 */  addiu      $5, $sp, 0xE8
/* 12DA24 0022D924 EC00A627 */  addiu      $6, $sp, 0xEC
/* 12DA28 0022D928 283E6072 */  paddub     $7, $19, $0
/* 12DA2C 0022D92C 28464072 */  paddub     $8, $18, $0
/* 12DA30 0022D930 A0B7080C */  jal        MenuTextureClip__FRiRiRiii
/* 12DA34 0022D934 00000000 */   nop
/* 12DA38 0022D938 EC00A48F */  lw         $4, 0xEC($sp)
/* 12DA3C 0022D93C E800A38F */  lw         $3, 0xE8($sp)
/* 12DA40 0022D940 E400A28F */  lw         $2, 0xE4($sp)
/* 12DA44 0022D944 B000A2AF */  sw         $2, 0xB0($sp)
/* 12DA48 0022D948 B400A3AF */  sw         $3, 0xB4($sp)
/* 12DA4C 0022D94C 20000224 */  addiu      $2, $0, 0x20
/* 12DA50 0022D950 B800A2AF */  sw         $2, 0xB8($sp)
/* 12DA54 0022D954 BC00A4AF */  sw         $4, 0xBC($sp)
/* 12DA58 0022D958 0B00E012 */  beqz       $23, .L0022D988
/* 12DA5C 0022D95C 00000000 */   nop
/* 12DA60 0022D960 2826A072 */  paddub     $4, $21, $0
/* 12DA64 0022D964 E000A58F */  lw         $5, 0xE0($sp)
/* 12DA68 0022D968 28360072 */  paddub     $6, $16, $0
/* 12DA6C 0022D96C B000A727 */  addiu      $7, $sp, 0xB0
/* 12DA70 0022D970 80000824 */  addiu      $8, $0, 0x80
/* 12DA74 0022D974 284E0071 */  paddub     $9, $8, $0
/* 12DA78 0022D978 645B080C */  jal        DrawObjectVibe__FiiP8CTexture8CRect_i_Uci
/* 12DA7C 0022D97C 00000000 */   nop
/* 12DA80 0022D980 0D000010 */  b          .L0022D9B8
/* 12DA84 0022D984 00000000 */   nop
.L0022D988:
/* 12DA88 0022D988 E000A38F */  lw         $3, 0xE0($sp)
/* 12DA8C 0022D98C D000B5AF */  sw         $21, 0xD0($sp)
/* 12DA90 0022D990 D400A3AF */  sw         $3, 0xD4($sp)
/* 12DA94 0022D994 D800A2AF */  sw         $2, 0xD8($sp)
/* 12DA98 0022D998 DC00A4AF */  sw         $4, 0xDC($sp)
/* 12DA9C 0022D99C FC391600 */  dsll32     $7, $22, 7
/* 12DAA0 0022D9A0 FF390700 */  dsra32     $7, $7, 7
/* 12DAA4 0022D9A4 28260072 */  paddub     $4, $16, $0
/* 12DAA8 0022D9A8 D000A527 */  addiu      $5, $sp, 0xD0
/* 12DAAC 0022D9AC B000A627 */  addiu      $6, $sp, 0xB0
/* 12DAB0 0022D9B0 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 12DAB4 0022D9B4 00000000 */   nop
.L0022D9B8:
/* 12DAB8 0022D9B8 9000BF7B */  lq         $31, 0x90($sp)
/* 12DABC 0022D9BC 8000BE7B */  lq         $fp, 0x80($sp)
/* 12DAC0 0022D9C0 7000B77B */  lq         $23, 0x70($sp)
/* 12DAC4 0022D9C4 6000B67B */  lq         $22, 0x60($sp)
/* 12DAC8 0022D9C8 5000B57B */  lq         $21, 0x50($sp)
/* 12DACC 0022D9CC 4000B47B */  lq         $20, 0x40($sp)
/* 12DAD0 0022D9D0 3000B37B */  lq         $19, 0x30($sp)
/* 12DAD4 0022D9D4 2000B27B */  lq         $18, 0x20($sp)
/* 12DAD8 0022D9D8 1000B17B */  lq         $17, 0x10($sp)
/* 12DADC 0022D9DC 0000B07B */  lq         $16, 0x0($sp)
/* 12DAE0 0022D9E0 F000BD27 */  addiu      $sp, $sp, 0xF0
/* 12DAE4 0022D9E4 0800E003 */  jr         $31
/* 12DAE8 0022D9E8 00000000 */   nop
/* 12DAEC 0022D9EC 00000000 */  nop
