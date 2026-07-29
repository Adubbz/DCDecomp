.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Draw__11CBombEffectFP7CCamerai
/* 001910 01DAD610 C0FEBD27 */  addiu       $29, $29, -0x140
/* 001914 01DAD614 9000BF7F */  sq          $31, 0x90($29)
/* 001918 01DAD618 8000BE7F */  sq          $30, 0x80($29)
/* 00191C 01DAD61C 7000B77F */  sq          $23, 0x70($29)
/* 001920 01DAD620 6000B67F */  sq          $22, 0x60($29)
/* 001924 01DAD624 5000B57F */  sq          $21, 0x50($29)
/* 001928 01DAD628 4000B47F */  sq          $20, 0x40($29)
/* 00192C 01DAD62C 3000B37F */  sq          $19, 0x30($29)
/* 001930 01DAD630 2000B27F */  sq          $18, 0x20($29)
/* 001934 01DAD634 1000B17F */  sq          $17, 0x10($29)
/* 001938 01DAD638 0000B07F */  sq          $16, 0x0($29)
/* 00193C 01DAD63C 28AE8070 */  paddub      $21, $4, $0
/* 001940 01DAD640 28B6C070 */  paddub      $22, $6, $0
/* 001944 01DAD644 2826A070 */  paddub      $4, $5, $0
/* 001948 01DAD648 A000A527 */  addiu       $5, $29, 0xA0
/* 00194C 01DAD64C 9C91040C */  jal         GetPos__7CCameraFPf
/* 001950 01DAD650 00000000 */   nop
/* 001954 01DAD654 3001A427 */  addiu       $4, $29, 0x130
/* 001958 01DAD658 F88B82DF */  ld          $2, -0x7408($28)
/* 00195C 01DAD65C 000082FC */  sd          $2, 0x0($4)
/* 001960 01DAD660 3001A393 */  lbu         $3, 0x130($29)
/* 001964 01DAD664 03000630 */  andi        $6, $0, 0x3
/* 001968 01DAD668 FCFF0224 */  addiu       $2, $0, -0x4
/* 00196C 01DAD66C 24106200 */  and         $2, $3, $2
/* 001970 01DAD670 25104600 */  or          $2, $2, $6
/* 001974 01DAD674 3001A2A3 */  sb          $2, 0x130($29)
/* 001978 01DAD678 3001A593 */  lbu         $5, 0x130($29)
/* 00197C 01DAD67C 08000364 */  daddiu      $3, $0, 0x8
/* 001980 01DAD680 F3FF0224 */  addiu       $2, $0, -0xD
/* 001984 01DAD684 2410A200 */  and         $2, $5, $2
/* 001988 01DAD688 25104300 */  or          $2, $2, $3
/* 00198C 01DAD68C 3001A2A3 */  sb          $2, 0x130($29)
/* 001990 01DAD690 3001A593 */  lbu         $5, 0x130($29)
/* 001994 01DAD694 00190600 */  sll         $3, $6, 4
/* 001998 01DAD698 CFFF0224 */  addiu       $2, $0, -0x31
/* 00199C 01DAD69C 2410A200 */  and         $2, $5, $2
/* 0019A0 01DAD6A0 25104300 */  or          $2, $2, $3
/* 0019A4 01DAD6A4 3001A2A3 */  sb          $2, 0x130($29)
/* 0019A8 01DAD6A8 3001A593 */  lbu         $5, 0x130($29)
/* 0019AC 01DAD6AC 40000364 */  daddiu      $3, $0, 0x40
/* 0019B0 01DAD6B0 3FFF0224 */  addiu       $2, $0, -0xC1
/* 0019B4 01DAD6B4 2410A200 */  and         $2, $5, $2
/* 0019B8 01DAD6B8 25104300 */  or          $2, $2, $3
/* 0019BC 01DAD6BC 3001A2A3 */  sb          $2, 0x130($29)
/* 0019C0 01DAD6C0 E4BB040C */  jal         MGSetGsALPHA__FP10sceGsAlpha
/* 0019C4 01DAD6C4 00000000 */   nop
/* 0019C8 01DAD6C8 3801A427 */  addiu       $4, $29, 0x138
/* 0019CC 01DAD6CC F08B82DF */  ld          $2, -0x7410($28)
/* 0019D0 01DAD6D0 000082FC */  sd          $2, 0x0($4)
/* 0019D4 01DAD6D4 3C01A593 */  lbu         $5, 0x13C($29)
/* 0019D8 01DAD6D8 01000364 */  daddiu      $3, $0, 0x1
/* 0019DC 01DAD6DC FEFF0224 */  addiu       $2, $0, -0x2
/* 0019E0 01DAD6E0 2410A200 */  and         $2, $5, $2
/* 0019E4 01DAD6E4 25104300 */  or          $2, $2, $3
/* 0019E8 01DAD6E8 3C01A2A3 */  sb          $2, 0x13C($29)
/* 0019EC 01DAD6EC B0BB040C */  jal         MGSetGsZBUF__FP9sceGsZbuf
/* 0019F0 01DAD6F0 00000000 */   nop
/* 0019F4 01DAD6F4 28860070 */  paddub      $16, $0, $0
/* 0019F8 01DAD6F8 9A000010 */  b           .L01DAD964_2B3164
/* 0019FC 01DAD6FC 00000000 */   nop
.L01DAD700_2B2F00:
/* 001A00 01DAD700 80881000 */  sll         $17, $16, 2
/* 001A04 01DAD704 21203502 */  addu        $4, $17, $21
/* 001A08 01DAD708 0001838C */  lw          $3, 0x100($4)
/* 001A0C 01DAD70C 01000224 */  addiu       $2, $0, 0x1
/* 001A10 01DAD710 93006214 */  bne         $3, $2, .L01DAD960_2B3160
/* 001A14 01DAD714 00000000 */   nop
/* 001A18 01DAD718 A000828C */  lw          $2, 0xA0($4)
/* 001A1C 01DAD71C 90004004 */  bltz        $2, .L01DAD960_2B3160
/* 001A20 01DAD720 00000000 */   nop
/* 001A24 01DAD724 00911000 */  sll         $18, $16, 4
/* 001A28 01DAD728 21A0B202 */  addu        $20, $21, $18
/* 001A2C 01DAD72C 000081C6 */  lwc1        $f1, 0x0($20)
/* 001A30 01DAD730 A000A0C7 */  lwc1        $f0, 0xA0($29)
/* 001A34 01DAD734 01000146 */  sub.s       $f0, $f0, $f1
/* 001A38 01DAD738 B000A0E7 */  swc1        $f0, 0xB0($29)
/* 001A3C 01DAD73C B400BE27 */  addiu       $30, $29, 0xB4
/* 001A40 01DAD740 0000C0AF */  sw          $0, 0x0($30)
/* 001A44 01DAD744 08009726 */  addiu       $23, $20, 0x8
/* 001A48 01DAD748 080081C6 */  lwc1        $f1, 0x8($20)
/* 001A4C 01DAD74C A800A0C7 */  lwc1        $f0, 0xA8($29)
/* 001A50 01DAD750 01000146 */  sub.s       $f0, $f0, $f1
/* 001A54 01DAD754 B800B327 */  addiu       $19, $29, 0xB8
/* 001A58 01DAD758 000060E6 */  swc1        $f0, 0x0($19)
/* 001A5C 01DAD75C B000A427 */  addiu       $4, $29, 0xB0
/* 001A60 01DAD760 282E8070 */  paddub      $5, $4, $0
/* 001A64 01DAD764 9285040C */  jal         sceVu0Normalize
/* 001A68 01DAD768 00000000 */   nop
/* 001A6C 01DAD76C 21183502 */  addu        $3, $17, $21
/* 001A70 01DAD770 800060C4 */  lwc1        $f0, 0x80($3)
/* 001A74 01DAD774 A0008046 */  cvt.s.w     $f2, $f0
/* 001A78 01DAD778 E040023C */  lui         $2, (0x40E00000 >> 16)
/* 001A7C 01DAD77C 00088244 */  mtc1        $2, $f1
/* 001A80 01DAD780 00009044 */  mtc1        $16, $f0
/* 001A84 01DAD784 00000000 */  nop
/* 001A88 01DAD788 20008046 */  cvt.s.w     $f0, $f0
/* 001A8C 01DAD78C C2080046 */  mul.s       $f3, $f1, $f0
/* 001A90 01DAD790 40180246 */  add.s       $f1, $f3, $f2
/* 001A94 01DAD794 B000A0C7 */  lwc1        $f0, 0xB0($29)
/* 001A98 01DAD798 02000146 */  mul.s       $f0, $f0, $f1
/* 001A9C 01DAD79C B000A0E7 */  swc1        $f0, 0xB0($29)
/* 001AA0 01DAD7A0 800060C4 */  lwc1        $f0, 0x80($3)
/* 001AA4 01DAD7A4 20008046 */  cvt.s.w     $f0, $f0
/* 001AA8 01DAD7A8 40180046 */  add.s       $f1, $f3, $f0
/* 001AAC 01DAD7AC 000060C6 */  lwc1        $f0, 0x0($19)
/* 001AB0 01DAD7B0 02000146 */  mul.s       $f0, $f0, $f1
/* 001AB4 01DAD7B4 000060E6 */  swc1        $f0, 0x0($19)
/* 001AB8 01DAD7B8 B000A1C7 */  lwc1        $f1, 0xB0($29)
/* 001ABC 01DAD7BC 000080C6 */  lwc1        $f0, 0x0($20)
/* 001AC0 01DAD7C0 00080046 */  add.s       $f0, $f1, $f0
/* 001AC4 01DAD7C4 C000A0E7 */  swc1        $f0, 0xC0($29)
/* 001AC8 01DAD7C8 28168072 */  paddub      $2, $20, $0
/* 001ACC 01DAD7CC 040041C4 */  lwc1        $f1, 0x4($2)
/* 001AD0 01DAD7D0 0000C0C7 */  lwc1        $f0, 0x0($30)
/* 001AD4 01DAD7D4 00000146 */  add.s       $f0, $f0, $f1
/* 001AD8 01DAD7D8 C400A0E7 */  swc1        $f0, 0xC4($29)
/* 001ADC 01DAD7DC 000061C6 */  lwc1        $f1, 0x0($19)
/* 001AE0 01DAD7E0 0000E0C6 */  lwc1        $f0, 0x0($23)
/* 001AE4 01DAD7E4 00080046 */  add.s       $f0, $f1, $f0
/* 001AE8 01DAD7E8 C800A0E7 */  swc1        $f0, 0xC8($29)
/* 001AEC 01DAD7EC 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 001AF0 01DAD7F0 CC00A2AF */  sw          $2, 0xCC($29)
/* 001AF4 01DAD7F4 C0006CC4 */  lwc1        $f12, 0xC0($3)
/* 001AF8 01DAD7F8 0040023C */  lui         $2, (0x40000000 >> 16)
/* 001AFC 01DAD7FC 00008244 */  mtc1        $2, $f0
/* 001B00 01DAD800 00000000 */  nop
/* 001B04 01DAD804 43630046 */  div.s       $f13, $f12, $f0
/* 001B08 01DAD808 D000A427 */  addiu       $4, $29, 0xD0
/* 001B0C 01DAD80C E000A527 */  addiu       $5, $29, 0xE0
/* 001B10 01DAD810 C000A627 */  addiu       $6, $29, 0xC0
/* 001B14 01DAD814 283E0070 */  paddub      $7, $0, $0
/* 001B18 01DAD818 D0B9040C */  jal         MGRotTransPers3DSprite__FPiPiPfffi
/* 001B1C 01DAD81C 00000000 */   nop
/* 001B20 01DAD820 01000324 */  addiu       $3, $0, 0x1
/* 001B24 01DAD824 4E004314 */  bne         $2, $3, .L01DAD960_2B3160
/* 001B28 01DAD828 00000000 */   nop
/* 001B2C 01DAD82C E000A28F */  lw          $2, 0xE0($29)
/* 001B30 01DAD830 F000A2AF */  sw          $2, 0xF0($29)
/* 001B34 01DAD834 D400A28F */  lw          $2, 0xD4($29)
/* 001B38 01DAD838 F400A2AF */  sw          $2, 0xF4($29)
/* 001B3C 01DAD83C D800A28F */  lw          $2, 0xD8($29)
/* 001B40 01DAD840 F800A2AF */  sw          $2, 0xF8($29)
/* 001B44 01DAD844 DC00A28F */  lw          $2, 0xDC($29)
/* 001B48 01DAD848 FC00A2AF */  sw          $2, 0xFC($29)
/* 001B4C 01DAD84C D000A28F */  lw          $2, 0xD0($29)
/* 001B50 01DAD850 0001A2AF */  sw          $2, 0x100($29)
/* 001B54 01DAD854 E400A28F */  lw          $2, 0xE4($29)
/* 001B58 01DAD858 0401A2AF */  sw          $2, 0x104($29)
/* 001B5C 01DAD85C E800A28F */  lw          $2, 0xE8($29)
/* 001B60 01DAD860 0801A2AF */  sw          $2, 0x108($29)
/* 001B64 01DAD864 EC00A28F */  lw          $2, 0xEC($29)
/* 001B68 01DAD868 0C01A2AF */  sw          $2, 0x10C($29)
/* 001B6C 01DAD86C 0500012A */  slti        $1, $16, 0x5
/* 001B70 01DAD870 20002010 */  beqz        $1, .L01DAD8F4_2B30F4
/* 001B74 01DAD874 00000000 */   nop
/* 001B78 01DAD878 3900C016 */  bnez        $22, .L01DAD960_2B3160
/* 001B7C 01DAD87C 00000000 */   nop
/* 001B80 01DAD880 1001A0AF */  sw          $0, 0x110($29)
/* 001B84 01DAD884 1401A0AF */  sw          $0, 0x114($29)
/* 001B88 01DAD888 80000224 */  addiu       $2, $0, 0x80
/* 001B8C 01DAD88C 1801A2AF */  sw          $2, 0x118($29)
/* 001B90 01DAD890 1C01A2AF */  sw          $2, 0x11C($29)
/* 001B94 01DAD894 C701023C */  lui         $2, %hi(TexManager)
/* 001B98 01DAD898 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 001B9C 01DAD89C DE01023C */  lui         $2, %hi(LIT_359__3)
/* 001BA0 01DAD8A0 48BF4524 */  addiu       $5, $2, %lo(LIT_359__3)
/* 001BA4 01DAD8A4 FFFF0624 */  addiu       $6, $0, -0x1
/* 001BA8 01DAD8A8 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 001BAC 01DAD8AC 00000000 */   nop
/* 001BB0 01DAD8B0 28964070 */  paddub      $18, $2, $0
/* 001BB4 01DAD8B4 21103502 */  addu        $2, $17, $21
/* 001BB8 01DAD8B8 E0004CC4 */  lwc1        $f12, 0xE0($2)
/* 001BBC 01DAD8BC 5044040C */  jal         fptoui
/* 001BC0 01DAD8C0 00000000 */   nop
/* 001BC4 01DAD8C4 D48B848F */  lw          $4, -0x742C($28)
/* 001BC8 01DAD8C8 282E4072 */  paddub      $5, $18, $0
/* 001BCC 01DAD8CC 1001A627 */  addiu       $6, $29, 0x110
/* 001BD0 01DAD8D0 D000A727 */  addiu       $7, $29, 0xD0
/* 001BD4 01DAD8D4 F000A827 */  addiu       $8, $29, 0xF0
/* 001BD8 01DAD8D8 0001A927 */  addiu       $9, $29, 0x100
/* 001BDC 01DAD8DC E000AA27 */  addiu       $10, $29, 0xE0
/* 001BE0 01DAD8E0 285E4070 */  paddub      $11, $2, $0
/* 001BE4 01DAD8E4 1C75050C */  jal         set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc
/* 001BE8 01DAD8E8 00000000 */   nop
/* 001BEC 01DAD8EC 1C000010 */  b           .L01DAD960_2B3160
/* 001BF0 01DAD8F0 00000000 */   nop
.L01DAD8F4_2B30F4:
/* 001BF4 01DAD8F4 2001A0AF */  sw          $0, 0x120($29)
/* 001BF8 01DAD8F8 2401A0AF */  sw          $0, 0x124($29)
/* 001BFC 01DAD8FC 80000224 */  addiu       $2, $0, 0x80
/* 001C00 01DAD900 2801A2AF */  sw          $2, 0x128($29)
/* 001C04 01DAD904 2C01A2AF */  sw          $2, 0x12C($29)
/* 001C08 01DAD908 C701023C */  lui         $2, %hi(TexManager)
/* 001C0C 01DAD90C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 001C10 01DAD910 DE01023C */  lui         $2, %hi(LIT_360__3)
/* 001C14 01DAD914 50BF4524 */  addiu       $5, $2, %lo(LIT_360__3)
/* 001C18 01DAD918 FFFF0624 */  addiu       $6, $0, -0x1
/* 001C1C 01DAD91C B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 001C20 01DAD920 00000000 */   nop
/* 001C24 01DAD924 28964070 */  paddub      $18, $2, $0
/* 001C28 01DAD928 21103502 */  addu        $2, $17, $21
/* 001C2C 01DAD92C E0004CC4 */  lwc1        $f12, 0xE0($2)
/* 001C30 01DAD930 5044040C */  jal         fptoui
/* 001C34 01DAD934 00000000 */   nop
/* 001C38 01DAD938 D48B848F */  lw          $4, -0x742C($28)
/* 001C3C 01DAD93C 282E4072 */  paddub      $5, $18, $0
/* 001C40 01DAD940 2001A627 */  addiu       $6, $29, 0x120
/* 001C44 01DAD944 D000A727 */  addiu       $7, $29, 0xD0
/* 001C48 01DAD948 F000A827 */  addiu       $8, $29, 0xF0
/* 001C4C 01DAD94C 0001A927 */  addiu       $9, $29, 0x100
/* 001C50 01DAD950 E000AA27 */  addiu       $10, $29, 0xE0
/* 001C54 01DAD954 285E4070 */  paddub      $11, $2, $0
/* 001C58 01DAD958 1C75050C */  jal         set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc
/* 001C5C 01DAD95C 00000000 */   nop
.L01DAD960_2B3160:
/* 001C60 01DAD960 01001026 */  addiu       $16, $16, 0x1
.L01DAD964_2B3164:
/* 001C64 01DAD964 0800022A */  slti        $2, $16, 0x8
/* 001C68 01DAD968 65FF4014 */  bnez        $2, .L01DAD700_2B2F00
/* 001C6C 01DAD96C 00000000 */   nop
/* 001C70 01DAD970 28260070 */  paddub      $4, $0, $0
/* 001C74 01DAD974 E4BB040C */  jal         MGSetGsALPHA__FP10sceGsAlpha
/* 001C78 01DAD978 00000000 */   nop
/* 001C7C 01DAD97C 28260070 */  paddub      $4, $0, $0
/* 001C80 01DAD980 B0BB040C */  jal         MGSetGsZBUF__FP9sceGsZbuf
/* 001C84 01DAD984 00000000 */   nop
/* 001C88 01DAD988 9000BF7B */  lq          $31, 0x90($29)
/* 001C8C 01DAD98C 8000BE7B */  lq          $30, 0x80($29)
/* 001C90 01DAD990 7000B77B */  lq          $23, 0x70($29)
/* 001C94 01DAD994 6000B67B */  lq          $22, 0x60($29)
/* 001C98 01DAD998 5000B57B */  lq          $21, 0x50($29)
/* 001C9C 01DAD99C 4000B47B */  lq          $20, 0x40($29)
/* 001CA0 01DAD9A0 3000B37B */  lq          $19, 0x30($29)
/* 001CA4 01DAD9A4 2000B27B */  lq          $18, 0x20($29)
/* 001CA8 01DAD9A8 1000B17B */  lq          $17, 0x10($29)
/* 001CAC 01DAD9AC 0000B07B */  lq          $16, 0x0($29)
/* 001CB0 01DAD9B0 4001BD27 */  addiu       $29, $29, 0x140
/* 001CB4 01DAD9B4 0800E003 */  jr          $31
/* 001CB8 01DAD9B8 00000000 */   nop
/* 001CBC 01DAD9BC 00000000 */  nop
