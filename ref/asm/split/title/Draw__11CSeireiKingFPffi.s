.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Draw__11CSeireiKingFPffi
/* 002890 01DAE590 90FEBD27 */  addiu       $29, $29, -0x170
/* 002894 01DAE594 9000BF7F */  sq          $31, 0x90($29)
/* 002898 01DAE598 8000B77F */  sq          $23, 0x80($29)
/* 00289C 01DAE59C 7000B67F */  sq          $22, 0x70($29)
/* 0028A0 01DAE5A0 6000B57F */  sq          $21, 0x60($29)
/* 0028A4 01DAE5A4 5000B47F */  sq          $20, 0x50($29)
/* 0028A8 01DAE5A8 4000B37F */  sq          $19, 0x40($29)
/* 0028AC 01DAE5AC 3000B27F */  sq          $18, 0x30($29)
/* 0028B0 01DAE5B0 2000B17F */  sq          $17, 0x20($29)
/* 0028B4 01DAE5B4 1000B07F */  sq          $16, 0x10($29)
/* 0028B8 01DAE5B8 0400B5E7 */  swc1        $f21, 0x4($29)
/* 0028BC 01DAE5BC 0000B4E7 */  swc1        $f20, 0x0($29)
/* 0028C0 01DAE5C0 28A68070 */  paddub      $20, $4, $0
/* 0028C4 01DAE5C4 288EA070 */  paddub      $17, $5, $0
/* 0028C8 01DAE5C8 46650046 */  mov.s       $f21, $f12
/* 0028CC 01DAE5CC 2886C070 */  paddub      $16, $6, $0
/* 0028D0 01DAE5D0 6001A427 */  addiu       $4, $29, 0x160
/* 0028D4 01DAE5D4 F88B82DF */  ld          $2, -0x7408($28)
/* 0028D8 01DAE5D8 000082FC */  sd          $2, 0x0($4)
/* 0028DC 01DAE5DC 6001A393 */  lbu         $3, 0x160($29)
/* 0028E0 01DAE5E0 03000630 */  andi        $6, $0, 0x3
/* 0028E4 01DAE5E4 FCFF0224 */  addiu       $2, $0, -0x4
/* 0028E8 01DAE5E8 24106200 */  and         $2, $3, $2
/* 0028EC 01DAE5EC 25104600 */  or          $2, $2, $6
/* 0028F0 01DAE5F0 6001A2A3 */  sb          $2, 0x160($29)
/* 0028F4 01DAE5F4 6001A593 */  lbu         $5, 0x160($29)
/* 0028F8 01DAE5F8 08000364 */  daddiu      $3, $0, 0x8
/* 0028FC 01DAE5FC F3FF0224 */  addiu       $2, $0, -0xD
/* 002900 01DAE600 2410A200 */  and         $2, $5, $2
/* 002904 01DAE604 25104300 */  or          $2, $2, $3
/* 002908 01DAE608 6001A2A3 */  sb          $2, 0x160($29)
/* 00290C 01DAE60C 6001A593 */  lbu         $5, 0x160($29)
/* 002910 01DAE610 00190600 */  sll         $3, $6, 4
/* 002914 01DAE614 CFFF0224 */  addiu       $2, $0, -0x31
/* 002918 01DAE618 2410A200 */  and         $2, $5, $2
/* 00291C 01DAE61C 25104300 */  or          $2, $2, $3
/* 002920 01DAE620 6001A2A3 */  sb          $2, 0x160($29)
/* 002924 01DAE624 6001A593 */  lbu         $5, 0x160($29)
/* 002928 01DAE628 40000364 */  daddiu      $3, $0, 0x40
/* 00292C 01DAE62C 3FFF0224 */  addiu       $2, $0, -0xC1
/* 002930 01DAE630 2410A200 */  and         $2, $5, $2
/* 002934 01DAE634 25104300 */  or          $2, $2, $3
/* 002938 01DAE638 6001A2A3 */  sb          $2, 0x160($29)
/* 00293C 01DAE63C E4BB040C */  jal         MGSetGsALPHA__FP10sceGsAlpha
/* 002940 01DAE640 00000000 */   nop
/* 002944 01DAE644 6801A427 */  addiu       $4, $29, 0x168
/* 002948 01DAE648 F08B82DF */  ld          $2, -0x7410($28)
/* 00294C 01DAE64C 000082FC */  sd          $2, 0x0($4)
/* 002950 01DAE650 6C01A593 */  lbu         $5, 0x16C($29)
/* 002954 01DAE654 01000364 */  daddiu      $3, $0, 0x1
/* 002958 01DAE658 FEFF0224 */  addiu       $2, $0, -0x2
/* 00295C 01DAE65C 2410A200 */  and         $2, $5, $2
/* 002960 01DAE660 25104300 */  or          $2, $2, $3
/* 002964 01DAE664 6C01A2A3 */  sb          $2, 0x16C($29)
/* 002968 01DAE668 B0BB040C */  jal         MGSetGsZBUF__FP9sceGsZbuf
/* 00296C 01DAE66C 00000000 */   nop
/* 002970 01DAE670 28268072 */  paddub      $4, $20, $0
/* 002974 01DAE674 282E2072 */  paddub      $5, $17, $0
/* 002978 01DAE678 0C86040C */  jal         sceVu0CopyVector
/* 00297C 01DAE67C 00000000 */   nop
/* 002980 01DAE680 BE11040C */  jal         rand
/* 002984 01DAE684 00000000 */   nop
/* 002988 01DAE688 80181000 */  sll         $3, $16, 2
/* 00298C 01DAE68C 21207000 */  addu        $4, $3, $16
/* 002990 01DAE690 80180400 */  sll         $3, $4, 2
/* 002994 01DAE694 21188300 */  addu        $3, $4, $3
/* 002998 01DAE698 C0880300 */  sll         $17, $3, 3
/* 00299C 01DAE69C 1A005100 */  div         $0, $2, $17
/* 0029A0 01DAE6A0 02002016 */  bnez        $17, .L01DAE6AC_2B3EAC
/* 0029A4 01DAE6A4 00000000 */   nop
/* 0029A8 01DAE6A8 CD010000 */  break       0, 7
.L01DAE6AC_2B3EAC:
/* 0029AC 01DAE6AC 10200000 */  mfhi        $4
/* 0029B0 01DAE6B0 80101000 */  sll         $2, $16, 2
/* 0029B4 01DAE6B4 21185000 */  addu        $3, $2, $16
/* 0029B8 01DAE6B8 80100300 */  sll         $2, $3, 2
/* 0029BC 01DAE6BC 21106200 */  addu        $2, $3, $2
/* 0029C0 01DAE6C0 80900200 */  sll         $18, $2, 2
/* 0029C4 01DAE6C4 23104402 */  subu        $2, $18, $4
/* 0029C8 01DAE6C8 00008244 */  mtc1        $2, $f0
/* 0029CC 01DAE6CC 00000000 */  nop
/* 0029D0 01DAE6D0 60008046 */  cvt.s.w     $f1, $f0
/* 0029D4 01DAE6D4 C842023C */  lui         $2, (0x42C80000 >> 16)
/* 0029D8 01DAE6D8 00008244 */  mtc1        $2, $f0
/* 0029DC 01DAE6DC 00000000 */  nop
/* 0029E0 01DAE6E0 43080046 */  div.s       $f1, $f1, $f0
/* 0029E4 01DAE6E4 000080C6 */  lwc1        $f0, 0x0($20)
/* 0029E8 01DAE6E8 00000146 */  add.s       $f0, $f0, $f1
/* 0029EC 01DAE6EC 000080E6 */  swc1        $f0, 0x0($20)
/* 0029F0 01DAE6F0 BE11040C */  jal         rand
/* 0029F4 01DAE6F4 00000000 */   nop
/* 0029F8 01DAE6F8 1A005100 */  div         $0, $2, $17
/* 0029FC 01DAE6FC 02002016 */  bnez        $17, .L01DAE708_2B3F08
/* 002A00 01DAE700 00000000 */   nop
/* 002A04 01DAE704 CD010000 */  break       0, 7
.L01DAE708_2B3F08:
/* 002A08 01DAE708 10100000 */  mfhi        $2
/* 002A0C 01DAE70C 23104202 */  subu        $2, $18, $2
/* 002A10 01DAE710 00008244 */  mtc1        $2, $f0
/* 002A14 01DAE714 00000000 */  nop
/* 002A18 01DAE718 60008046 */  cvt.s.w     $f1, $f0
/* 002A1C 01DAE71C C842023C */  lui         $2, (0x42C80000 >> 16)
/* 002A20 01DAE720 00008244 */  mtc1        $2, $f0
/* 002A24 01DAE724 00000000 */  nop
/* 002A28 01DAE728 43080046 */  div.s       $f1, $f1, $f0
/* 002A2C 01DAE72C 040080C6 */  lwc1        $f0, 0x4($20)
/* 002A30 01DAE730 00000146 */  add.s       $f0, $f0, $f1
/* 002A34 01DAE734 040080E6 */  swc1        $f0, 0x4($20)
/* 002A38 01DAE738 BE11040C */  jal         rand
/* 002A3C 01DAE73C 00000000 */   nop
/* 002A40 01DAE740 1A005100 */  div         $0, $2, $17
/* 002A44 01DAE744 02002016 */  bnez        $17, .L01DAE750_2B3F50
/* 002A48 01DAE748 00000000 */   nop
/* 002A4C 01DAE74C CD010000 */  break       0, 7
.L01DAE750_2B3F50:
/* 002A50 01DAE750 10100000 */  mfhi        $2
/* 002A54 01DAE754 23104202 */  subu        $2, $18, $2
/* 002A58 01DAE758 00008244 */  mtc1        $2, $f0
/* 002A5C 01DAE75C 00000000 */  nop
/* 002A60 01DAE760 60008046 */  cvt.s.w     $f1, $f0
/* 002A64 01DAE764 C842023C */  lui         $2, (0x42C80000 >> 16)
/* 002A68 01DAE768 00008244 */  mtc1        $2, $f0
/* 002A6C 01DAE76C 00000000 */  nop
/* 002A70 01DAE770 43080046 */  div.s       $f1, $f1, $f0
/* 002A74 01DAE774 080080C6 */  lwc1        $f0, 0x8($20)
/* 002A78 01DAE778 00000146 */  add.s       $f0, $f0, $f1
/* 002A7C 01DAE77C 080080E6 */  swc1        $f0, 0x8($20)
/* 002A80 01DAE780 28860070 */  paddub      $16, $0, $0
/* 002A84 01DAE784 70010010 */  b           .L01DAED48_2B4548
/* 002A88 01DAE788 00000000 */   nop
.L01DAE78C_2B3F8C:
/* 002A8C 01DAE78C 80981000 */  sll         $19, $16, 2
/* 002A90 01DAE790 21107402 */  addu        $2, $19, $20
/* 002A94 01DAE794 4001428C */  lw          $2, 0x140($2)
/* 002A98 01DAE798 6A014004 */  bltz        $2, .L01DAED44_2B4544
/* 002A9C 01DAE79C 00000000 */   nop
/* 002AA0 01DAE7A0 00111000 */  sll         $2, $16, 4
/* 002AA4 01DAE7A4 21108202 */  addu        $2, $20, $2
/* 002AA8 01DAE7A8 000040C4 */  lwc1        $f0, 0x0($2)
/* 002AAC 01DAE7AC A000A0E7 */  swc1        $f0, 0xA0($29)
/* 002AB0 01DAE7B0 040040C4 */  lwc1        $f0, 0x4($2)
/* 002AB4 01DAE7B4 A400B727 */  addiu       $23, $29, 0xA4
/* 002AB8 01DAE7B8 0000E0E6 */  swc1        $f0, 0x0($23)
/* 002ABC 01DAE7BC 080040C4 */  lwc1        $f0, 0x8($2)
/* 002AC0 01DAE7C0 A800B627 */  addiu       $22, $29, 0xA8
/* 002AC4 01DAE7C4 0000C0E6 */  swc1        $f0, 0x0($22)
/* 002AC8 01DAE7C8 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 002ACC 01DAE7CC AC00A2AF */  sw          $2, 0xAC($29)
/* 002AD0 01DAE7D0 0040023C */  lui         $2, (0x40000000 >> 16)
/* 002AD4 01DAE7D4 00008244 */  mtc1        $2, $f0
/* 002AD8 01DAE7D8 00000000 */  nop
/* 002ADC 01DAE7DC 03AD0046 */  div.s       $f20, $f21, $f0
/* 002AE0 01DAE7E0 B000A427 */  addiu       $4, $29, 0xB0
/* 002AE4 01DAE7E4 C000A527 */  addiu       $5, $29, 0xC0
/* 002AE8 01DAE7E8 A000A627 */  addiu       $6, $29, 0xA0
/* 002AEC 01DAE7EC 06AB0046 */  mov.s       $f12, $f21
/* 002AF0 01DAE7F0 46A30046 */  mov.s       $f13, $f20
/* 002AF4 01DAE7F4 283E0070 */  paddub      $7, $0, $0
/* 002AF8 01DAE7F8 D0B9040C */  jal         MGRotTransPers3DSprite__FPiPiPfffi
/* 002AFC 01DAE7FC 00000000 */   nop
/* 002B00 01DAE800 01000324 */  addiu       $3, $0, 0x1
/* 002B04 01DAE804 77004314 */  bne         $2, $3, .L01DAE9E4_2B41E4
/* 002B08 01DAE808 00000000 */   nop
/* 002B0C 01DAE80C C000A28F */  lw          $2, 0xC0($29)
/* 002B10 01DAE810 D000A2AF */  sw          $2, 0xD0($29)
/* 002B14 01DAE814 B400A28F */  lw          $2, 0xB4($29)
/* 002B18 01DAE818 D400A2AF */  sw          $2, 0xD4($29)
/* 002B1C 01DAE81C B800A28F */  lw          $2, 0xB8($29)
/* 002B20 01DAE820 D800A2AF */  sw          $2, 0xD8($29)
/* 002B24 01DAE824 BC00A28F */  lw          $2, 0xBC($29)
/* 002B28 01DAE828 DC00A2AF */  sw          $2, 0xDC($29)
/* 002B2C 01DAE82C B000A28F */  lw          $2, 0xB0($29)
/* 002B30 01DAE830 E000A2AF */  sw          $2, 0xE0($29)
/* 002B34 01DAE834 C400A28F */  lw          $2, 0xC4($29)
/* 002B38 01DAE838 E400A2AF */  sw          $2, 0xE4($29)
/* 002B3C 01DAE83C C800A28F */  lw          $2, 0xC8($29)
/* 002B40 01DAE840 E800A2AF */  sw          $2, 0xE8($29)
/* 002B44 01DAE844 CC00A28F */  lw          $2, 0xCC($29)
/* 002B48 01DAE848 EC00A2AF */  sw          $2, 0xEC($29)
/* 002B4C 01DAE84C BE11040C */  jal         rand
/* 002B50 01DAE850 00000000 */   nop
/* 002B54 01DAE854 03000324 */  addiu       $3, $0, 0x3
/* 002B58 01DAE858 1A004300 */  div         $0, $2, $3
/* 002B5C 01DAE85C 00000000 */  nop
/* 002B60 01DAE860 00000000 */  nop
/* 002B64 01DAE864 10180000 */  mfhi        $3
/* 002B68 01DAE868 02000224 */  addiu       $2, $0, 0x2
/* 002B6C 01DAE86C 42006210 */  beq         $3, $2, .L01DAE978_2B4178
/* 002B70 01DAE870 00000000 */   nop
/* 002B74 01DAE874 01000224 */  addiu       $2, $0, 0x1
/* 002B78 01DAE878 22006210 */  beq         $3, $2, .L01DAE904_2B4104
/* 002B7C 01DAE87C 00000000 */   nop
/* 002B80 01DAE880 03006010 */  beqz        $3, .L01DAE890_2B4090
/* 002B84 01DAE884 00000000 */   nop
/* 002B88 01DAE888 56000010 */  b           .L01DAE9E4_2B41E4
/* 002B8C 01DAE88C 00000000 */   nop
.L01DAE890_2B4090:
/* 002B90 01DAE890 F000A0AF */  sw          $0, 0xF0($29)
/* 002B94 01DAE894 F400A0AF */  sw          $0, 0xF4($29)
/* 002B98 01DAE898 40000224 */  addiu       $2, $0, 0x40
/* 002B9C 01DAE89C F800A2AF */  sw          $2, 0xF8($29)
/* 002BA0 01DAE8A0 FC00A2AF */  sw          $2, 0xFC($29)
/* 002BA4 01DAE8A4 C701023C */  lui         $2, %hi(TexManager)
/* 002BA8 01DAE8A8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 002BAC 01DAE8AC DE01023C */  lui         $2, %hi(LIT_514__3)
/* 002BB0 01DAE8B0 68BF4524 */  addiu       $5, $2, %lo(LIT_514__3)
/* 002BB4 01DAE8B4 FFFF0624 */  addiu       $6, $0, -0x1
/* 002BB8 01DAE8B8 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 002BBC 01DAE8BC 00000000 */   nop
/* 002BC0 01DAE8C0 28AE4070 */  paddub      $21, $2, $0
/* 002BC4 01DAE8C4 21107402 */  addu        $2, $19, $20
/* 002BC8 01DAE8C8 90014CC4 */  lwc1        $f12, 0x190($2)
/* 002BCC 01DAE8CC 5044040C */  jal         fptoui
/* 002BD0 01DAE8D0 00000000 */   nop
/* 002BD4 01DAE8D4 D48B848F */  lw          $4, -0x742C($28)
/* 002BD8 01DAE8D8 282EA072 */  paddub      $5, $21, $0
/* 002BDC 01DAE8DC F000A627 */  addiu       $6, $29, 0xF0
/* 002BE0 01DAE8E0 B000A727 */  addiu       $7, $29, 0xB0
/* 002BE4 01DAE8E4 D000A827 */  addiu       $8, $29, 0xD0
/* 002BE8 01DAE8E8 E000A927 */  addiu       $9, $29, 0xE0
/* 002BEC 01DAE8EC C000AA27 */  addiu       $10, $29, 0xC0
/* 002BF0 01DAE8F0 285E4070 */  paddub      $11, $2, $0
/* 002BF4 01DAE8F4 1C75050C */  jal         set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc
/* 002BF8 01DAE8F8 00000000 */   nop
/* 002BFC 01DAE8FC 39000010 */  b           .L01DAE9E4_2B41E4
/* 002C00 01DAE900 00000000 */   nop
.L01DAE904_2B4104:
/* 002C04 01DAE904 0001A0AF */  sw          $0, 0x100($29)
/* 002C08 01DAE908 0401A0AF */  sw          $0, 0x104($29)
/* 002C0C 01DAE90C 40000224 */  addiu       $2, $0, 0x40
/* 002C10 01DAE910 0801A2AF */  sw          $2, 0x108($29)
/* 002C14 01DAE914 0C01A2AF */  sw          $2, 0x10C($29)
/* 002C18 01DAE918 C701023C */  lui         $2, %hi(TexManager)
/* 002C1C 01DAE91C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 002C20 01DAE920 DE01023C */  lui         $2, %hi(LIT_515__3)
/* 002C24 01DAE924 70BF4524 */  addiu       $5, $2, %lo(LIT_515__3)
/* 002C28 01DAE928 FFFF0624 */  addiu       $6, $0, -0x1
/* 002C2C 01DAE92C B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 002C30 01DAE930 00000000 */   nop
/* 002C34 01DAE934 28AE4070 */  paddub      $21, $2, $0
/* 002C38 01DAE938 21107402 */  addu        $2, $19, $20
/* 002C3C 01DAE93C 90014CC4 */  lwc1        $f12, 0x190($2)
/* 002C40 01DAE940 5044040C */  jal         fptoui
/* 002C44 01DAE944 00000000 */   nop
/* 002C48 01DAE948 D48B848F */  lw          $4, -0x742C($28)
/* 002C4C 01DAE94C 282EA072 */  paddub      $5, $21, $0
/* 002C50 01DAE950 0001A627 */  addiu       $6, $29, 0x100
/* 002C54 01DAE954 B000A727 */  addiu       $7, $29, 0xB0
/* 002C58 01DAE958 D000A827 */  addiu       $8, $29, 0xD0
/* 002C5C 01DAE95C E000A927 */  addiu       $9, $29, 0xE0
/* 002C60 01DAE960 C000AA27 */  addiu       $10, $29, 0xC0
/* 002C64 01DAE964 285E4070 */  paddub      $11, $2, $0
/* 002C68 01DAE968 1C75050C */  jal         set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc
/* 002C6C 01DAE96C 00000000 */   nop
/* 002C70 01DAE970 1C000010 */  b           .L01DAE9E4_2B41E4
/* 002C74 01DAE974 00000000 */   nop
.L01DAE978_2B4178:
/* 002C78 01DAE978 1001A0AF */  sw          $0, 0x110($29)
/* 002C7C 01DAE97C 1401A0AF */  sw          $0, 0x114($29)
/* 002C80 01DAE980 40000224 */  addiu       $2, $0, 0x40
/* 002C84 01DAE984 1801A2AF */  sw          $2, 0x118($29)
/* 002C88 01DAE988 1C01A2AF */  sw          $2, 0x11C($29)
/* 002C8C 01DAE98C C701023C */  lui         $2, %hi(TexManager)
/* 002C90 01DAE990 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 002C94 01DAE994 DE01023C */  lui         $2, %hi(LIT_516__2)
/* 002C98 01DAE998 78BF4524 */  addiu       $5, $2, %lo(LIT_516__2)
/* 002C9C 01DAE99C FFFF0624 */  addiu       $6, $0, -0x1
/* 002CA0 01DAE9A0 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 002CA4 01DAE9A4 00000000 */   nop
/* 002CA8 01DAE9A8 28AE4070 */  paddub      $21, $2, $0
/* 002CAC 01DAE9AC 21107402 */  addu        $2, $19, $20
/* 002CB0 01DAE9B0 90014CC4 */  lwc1        $f12, 0x190($2)
/* 002CB4 01DAE9B4 5044040C */  jal         fptoui
/* 002CB8 01DAE9B8 00000000 */   nop
/* 002CBC 01DAE9BC D48B848F */  lw          $4, -0x742C($28)
/* 002CC0 01DAE9C0 282EA072 */  paddub      $5, $21, $0
/* 002CC4 01DAE9C4 1001A627 */  addiu       $6, $29, 0x110
/* 002CC8 01DAE9C8 B000A727 */  addiu       $7, $29, 0xB0
/* 002CCC 01DAE9CC D000A827 */  addiu       $8, $29, 0xD0
/* 002CD0 01DAE9D0 E000A927 */  addiu       $9, $29, 0xE0
/* 002CD4 01DAE9D4 C000AA27 */  addiu       $10, $29, 0xC0
/* 002CD8 01DAE9D8 285E4070 */  paddub      $11, $2, $0
/* 002CDC 01DAE9DC 1C75050C */  jal         set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc
/* 002CE0 01DAE9E0 00000000 */   nop
.L01DAE9E4_2B41E4:
/* 002CE4 01DAE9E4 BE11040C */  jal         rand
/* 002CE8 01DAE9E8 00000000 */   nop
/* 002CEC 01DAE9EC 1A005100 */  div         $0, $2, $17
/* 002CF0 01DAE9F0 02002016 */  bnez        $17, .L01DAE9FC_2B41FC
/* 002CF4 01DAE9F4 00000000 */   nop
/* 002CF8 01DAE9F8 CD010000 */  break       0, 7
.L01DAE9FC_2B41FC:
/* 002CFC 01DAE9FC 10100000 */  mfhi        $2
/* 002D00 01DAEA00 23104202 */  subu        $2, $18, $2
/* 002D04 01DAEA04 00008244 */  mtc1        $2, $f0
/* 002D08 01DAEA08 00000000 */  nop
/* 002D0C 01DAEA0C 60008046 */  cvt.s.w     $f1, $f0
/* 002D10 01DAEA10 C842023C */  lui         $2, (0x42C80000 >> 16)
/* 002D14 01DAEA14 00008244 */  mtc1        $2, $f0
/* 002D18 01DAEA18 00000000 */  nop
/* 002D1C 01DAEA1C 43080046 */  div.s       $f1, $f1, $f0
/* 002D20 01DAEA20 A000A0C7 */  lwc1        $f0, 0xA0($29)
/* 002D24 01DAEA24 00000146 */  add.s       $f0, $f0, $f1
/* 002D28 01DAEA28 A000A0E7 */  swc1        $f0, 0xA0($29)
/* 002D2C 01DAEA2C BE11040C */  jal         rand
/* 002D30 01DAEA30 00000000 */   nop
/* 002D34 01DAEA34 1A005100 */  div         $0, $2, $17
/* 002D38 01DAEA38 02002016 */  bnez        $17, .L01DAEA44_2B4244
/* 002D3C 01DAEA3C 00000000 */   nop
/* 002D40 01DAEA40 CD010000 */  break       0, 7
.L01DAEA44_2B4244:
/* 002D44 01DAEA44 10100000 */  mfhi        $2
/* 002D48 01DAEA48 23104202 */  subu        $2, $18, $2
/* 002D4C 01DAEA4C 00008244 */  mtc1        $2, $f0
/* 002D50 01DAEA50 00000000 */  nop
/* 002D54 01DAEA54 60008046 */  cvt.s.w     $f1, $f0
/* 002D58 01DAEA58 C842023C */  lui         $2, (0x42C80000 >> 16)
/* 002D5C 01DAEA5C 00008244 */  mtc1        $2, $f0
/* 002D60 01DAEA60 00000000 */  nop
/* 002D64 01DAEA64 43080046 */  div.s       $f1, $f1, $f0
/* 002D68 01DAEA68 0000E0C6 */  lwc1        $f0, 0x0($23)
/* 002D6C 01DAEA6C 00000146 */  add.s       $f0, $f0, $f1
/* 002D70 01DAEA70 0000E0E6 */  swc1        $f0, 0x0($23)
/* 002D74 01DAEA74 BE11040C */  jal         rand
/* 002D78 01DAEA78 00000000 */   nop
/* 002D7C 01DAEA7C 1A005100 */  div         $0, $2, $17
/* 002D80 01DAEA80 02002016 */  bnez        $17, .L01DAEA8C_2B428C
/* 002D84 01DAEA84 00000000 */   nop
/* 002D88 01DAEA88 CD010000 */  break       0, 7
.L01DAEA8C_2B428C:
/* 002D8C 01DAEA8C 10100000 */  mfhi        $2
/* 002D90 01DAEA90 23104202 */  subu        $2, $18, $2
/* 002D94 01DAEA94 00008244 */  mtc1        $2, $f0
/* 002D98 01DAEA98 00000000 */  nop
/* 002D9C 01DAEA9C 60008046 */  cvt.s.w     $f1, $f0
/* 002DA0 01DAEAA0 C842023C */  lui         $2, (0x42C80000 >> 16)
/* 002DA4 01DAEAA4 00008244 */  mtc1        $2, $f0
/* 002DA8 01DAEAA8 00000000 */  nop
/* 002DAC 01DAEAAC 43080046 */  div.s       $f1, $f1, $f0
/* 002DB0 01DAEAB0 0000C0C6 */  lwc1        $f0, 0x0($22)
/* 002DB4 01DAEAB4 00000146 */  add.s       $f0, $f0, $f1
/* 002DB8 01DAEAB8 0000C0E6 */  swc1        $f0, 0x0($22)
/* 002DBC 01DAEABC B000A427 */  addiu       $4, $29, 0xB0
/* 002DC0 01DAEAC0 C000A527 */  addiu       $5, $29, 0xC0
/* 002DC4 01DAEAC4 A000A627 */  addiu       $6, $29, 0xA0
/* 002DC8 01DAEAC8 06AB0046 */  mov.s       $f12, $f21
/* 002DCC 01DAEACC 46A30046 */  mov.s       $f13, $f20
/* 002DD0 01DAEAD0 283E0070 */  paddub      $7, $0, $0
/* 002DD4 01DAEAD4 D0B9040C */  jal         MGRotTransPers3DSprite__FPiPiPfffi
/* 002DD8 01DAEAD8 00000000 */   nop
/* 002DDC 01DAEADC 01000324 */  addiu       $3, $0, 0x1
/* 002DE0 01DAEAE0 98004314 */  bne         $2, $3, .L01DAED44_2B4544
/* 002DE4 01DAEAE4 00000000 */   nop
/* 002DE8 01DAEAE8 C000A28F */  lw          $2, 0xC0($29)
/* 002DEC 01DAEAEC D000A2AF */  sw          $2, 0xD0($29)
/* 002DF0 01DAEAF0 B400A28F */  lw          $2, 0xB4($29)
/* 002DF4 01DAEAF4 D400A2AF */  sw          $2, 0xD4($29)
/* 002DF8 01DAEAF8 B800A28F */  lw          $2, 0xB8($29)
/* 002DFC 01DAEAFC D800A2AF */  sw          $2, 0xD8($29)
/* 002E00 01DAEB00 BC00A28F */  lw          $2, 0xBC($29)
/* 002E04 01DAEB04 DC00A2AF */  sw          $2, 0xDC($29)
/* 002E08 01DAEB08 B000A28F */  lw          $2, 0xB0($29)
/* 002E0C 01DAEB0C E000A2AF */  sw          $2, 0xE0($29)
/* 002E10 01DAEB10 C400A28F */  lw          $2, 0xC4($29)
/* 002E14 01DAEB14 E400A2AF */  sw          $2, 0xE4($29)
/* 002E18 01DAEB18 C800A28F */  lw          $2, 0xC8($29)
/* 002E1C 01DAEB1C E800A2AF */  sw          $2, 0xE8($29)
/* 002E20 01DAEB20 CC00A28F */  lw          $2, 0xCC($29)
/* 002E24 01DAEB24 EC00A2AF */  sw          $2, 0xEC($29)
/* 002E28 01DAEB28 BE11040C */  jal         rand
/* 002E2C 01DAEB2C 00000000 */   nop
/* 002E30 01DAEB30 03004330 */  andi        $3, $2, 0x3
/* 002E34 01DAEB34 04004104 */  bgez        $2, .L01DAEB48_2B4348
/* 002E38 01DAEB38 00000000 */   nop
/* 002E3C 01DAEB3C 02006010 */  beqz        $3, .L01DAEB48_2B4348
/* 002E40 01DAEB40 00000000 */   nop
/* 002E44 01DAEB44 FCFF6324 */  addiu       $3, $3, -0x4
.L01DAEB48_2B4348:
/* 002E48 01DAEB48 03000224 */  addiu       $2, $0, 0x3
/* 002E4C 01DAEB4C 62006210 */  beq         $3, $2, .L01DAECD8_2B44D8
/* 002E50 01DAEB50 00000000 */   nop
/* 002E54 01DAEB54 02000224 */  addiu       $2, $0, 0x2
/* 002E58 01DAEB58 42006210 */  beq         $3, $2, .L01DAEC64_2B4464
/* 002E5C 01DAEB5C 00000000 */   nop
/* 002E60 01DAEB60 01000224 */  addiu       $2, $0, 0x1
/* 002E64 01DAEB64 22006210 */  beq         $3, $2, .L01DAEBF0_2B43F0
/* 002E68 01DAEB68 00000000 */   nop
/* 002E6C 01DAEB6C 03006010 */  beqz        $3, .L01DAEB7C_2B437C
/* 002E70 01DAEB70 00000000 */   nop
/* 002E74 01DAEB74 73000010 */  b           .L01DAED44_2B4544
/* 002E78 01DAEB78 00000000 */   nop
.L01DAEB7C_2B437C:
/* 002E7C 01DAEB7C 2001A0AF */  sw          $0, 0x120($29)
/* 002E80 01DAEB80 2401A0AF */  sw          $0, 0x124($29)
/* 002E84 01DAEB84 20000224 */  addiu       $2, $0, 0x20
/* 002E88 01DAEB88 2801A2AF */  sw          $2, 0x128($29)
/* 002E8C 01DAEB8C 2C01A2AF */  sw          $2, 0x12C($29)
/* 002E90 01DAEB90 C701023C */  lui         $2, %hi(TexManager)
/* 002E94 01DAEB94 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 002E98 01DAEB98 DE01023C */  lui         $2, %hi(LIT_517__3)
/* 002E9C 01DAEB9C 80BF4524 */  addiu       $5, $2, %lo(LIT_517__3)
/* 002EA0 01DAEBA0 FFFF0624 */  addiu       $6, $0, -0x1
/* 002EA4 01DAEBA4 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 002EA8 01DAEBA8 00000000 */   nop
/* 002EAC 01DAEBAC 28AE4070 */  paddub      $21, $2, $0
/* 002EB0 01DAEBB0 21107402 */  addu        $2, $19, $20
/* 002EB4 01DAEBB4 90014CC4 */  lwc1        $f12, 0x190($2)
/* 002EB8 01DAEBB8 5044040C */  jal         fptoui
/* 002EBC 01DAEBBC 00000000 */   nop
/* 002EC0 01DAEBC0 D48B848F */  lw          $4, -0x742C($28)
/* 002EC4 01DAEBC4 282EA072 */  paddub      $5, $21, $0
/* 002EC8 01DAEBC8 2001A627 */  addiu       $6, $29, 0x120
/* 002ECC 01DAEBCC B000A727 */  addiu       $7, $29, 0xB0
/* 002ED0 01DAEBD0 D000A827 */  addiu       $8, $29, 0xD0
/* 002ED4 01DAEBD4 E000A927 */  addiu       $9, $29, 0xE0
/* 002ED8 01DAEBD8 C000AA27 */  addiu       $10, $29, 0xC0
/* 002EDC 01DAEBDC 285E4070 */  paddub      $11, $2, $0
/* 002EE0 01DAEBE0 1C75050C */  jal         set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc
/* 002EE4 01DAEBE4 00000000 */   nop
/* 002EE8 01DAEBE8 56000010 */  b           .L01DAED44_2B4544
/* 002EEC 01DAEBEC 00000000 */   nop
.L01DAEBF0_2B43F0:
/* 002EF0 01DAEBF0 20000224 */  addiu       $2, $0, 0x20
/* 002EF4 01DAEBF4 3001A2AF */  sw          $2, 0x130($29)
/* 002EF8 01DAEBF8 3401A0AF */  sw          $0, 0x134($29)
/* 002EFC 01DAEBFC 3801A2AF */  sw          $2, 0x138($29)
/* 002F00 01DAEC00 3C01A2AF */  sw          $2, 0x13C($29)
/* 002F04 01DAEC04 C701023C */  lui         $2, %hi(TexManager)
/* 002F08 01DAEC08 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 002F0C 01DAEC0C DE01023C */  lui         $2, %hi(LIT_517__3)
/* 002F10 01DAEC10 80BF4524 */  addiu       $5, $2, %lo(LIT_517__3)
/* 002F14 01DAEC14 FFFF0624 */  addiu       $6, $0, -0x1
/* 002F18 01DAEC18 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 002F1C 01DAEC1C 00000000 */   nop
/* 002F20 01DAEC20 28AE4070 */  paddub      $21, $2, $0
/* 002F24 01DAEC24 21107402 */  addu        $2, $19, $20
/* 002F28 01DAEC28 90014CC4 */  lwc1        $f12, 0x190($2)
/* 002F2C 01DAEC2C 5044040C */  jal         fptoui
/* 002F30 01DAEC30 00000000 */   nop
/* 002F34 01DAEC34 D48B848F */  lw          $4, -0x742C($28)
/* 002F38 01DAEC38 282EA072 */  paddub      $5, $21, $0
/* 002F3C 01DAEC3C 3001A627 */  addiu       $6, $29, 0x130
/* 002F40 01DAEC40 B000A727 */  addiu       $7, $29, 0xB0
/* 002F44 01DAEC44 D000A827 */  addiu       $8, $29, 0xD0
/* 002F48 01DAEC48 E000A927 */  addiu       $9, $29, 0xE0
/* 002F4C 01DAEC4C C000AA27 */  addiu       $10, $29, 0xC0
/* 002F50 01DAEC50 285E4070 */  paddub      $11, $2, $0
/* 002F54 01DAEC54 1C75050C */  jal         set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc
/* 002F58 01DAEC58 00000000 */   nop
/* 002F5C 01DAEC5C 39000010 */  b           .L01DAED44_2B4544
/* 002F60 01DAEC60 00000000 */   nop
.L01DAEC64_2B4464:
/* 002F64 01DAEC64 4001A0AF */  sw          $0, 0x140($29)
/* 002F68 01DAEC68 20000224 */  addiu       $2, $0, 0x20
/* 002F6C 01DAEC6C 4401A2AF */  sw          $2, 0x144($29)
/* 002F70 01DAEC70 4801A2AF */  sw          $2, 0x148($29)
/* 002F74 01DAEC74 4C01A2AF */  sw          $2, 0x14C($29)
/* 002F78 01DAEC78 C701023C */  lui         $2, %hi(TexManager)
/* 002F7C 01DAEC7C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 002F80 01DAEC80 DE01023C */  lui         $2, %hi(LIT_517__3)
/* 002F84 01DAEC84 80BF4524 */  addiu       $5, $2, %lo(LIT_517__3)
/* 002F88 01DAEC88 FFFF0624 */  addiu       $6, $0, -0x1
/* 002F8C 01DAEC8C B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 002F90 01DAEC90 00000000 */   nop
/* 002F94 01DAEC94 28AE4070 */  paddub      $21, $2, $0
/* 002F98 01DAEC98 21107402 */  addu        $2, $19, $20
/* 002F9C 01DAEC9C 90014CC4 */  lwc1        $f12, 0x190($2)
/* 002FA0 01DAECA0 5044040C */  jal         fptoui
/* 002FA4 01DAECA4 00000000 */   nop
/* 002FA8 01DAECA8 D48B848F */  lw          $4, -0x742C($28)
/* 002FAC 01DAECAC 282EA072 */  paddub      $5, $21, $0
/* 002FB0 01DAECB0 4001A627 */  addiu       $6, $29, 0x140
/* 002FB4 01DAECB4 B000A727 */  addiu       $7, $29, 0xB0
/* 002FB8 01DAECB8 D000A827 */  addiu       $8, $29, 0xD0
/* 002FBC 01DAECBC E000A927 */  addiu       $9, $29, 0xE0
/* 002FC0 01DAECC0 C000AA27 */  addiu       $10, $29, 0xC0
/* 002FC4 01DAECC4 285E4070 */  paddub      $11, $2, $0
/* 002FC8 01DAECC8 1C75050C */  jal         set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc
/* 002FCC 01DAECCC 00000000 */   nop
/* 002FD0 01DAECD0 1C000010 */  b           .L01DAED44_2B4544
/* 002FD4 01DAECD4 00000000 */   nop
.L01DAECD8_2B44D8:
/* 002FD8 01DAECD8 20000224 */  addiu       $2, $0, 0x20
/* 002FDC 01DAECDC 5001A2AF */  sw          $2, 0x150($29)
/* 002FE0 01DAECE0 5401A2AF */  sw          $2, 0x154($29)
/* 002FE4 01DAECE4 5801A2AF */  sw          $2, 0x158($29)
/* 002FE8 01DAECE8 5C01A2AF */  sw          $2, 0x15C($29)
/* 002FEC 01DAECEC C701023C */  lui         $2, %hi(TexManager)
/* 002FF0 01DAECF0 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 002FF4 01DAECF4 DE01023C */  lui         $2, %hi(LIT_517__3)
/* 002FF8 01DAECF8 80BF4524 */  addiu       $5, $2, %lo(LIT_517__3)
/* 002FFC 01DAECFC FFFF0624 */  addiu       $6, $0, -0x1
/* 003000 01DAED00 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 003004 01DAED04 00000000 */   nop
/* 003008 01DAED08 28AE4070 */  paddub      $21, $2, $0
/* 00300C 01DAED0C 21107402 */  addu        $2, $19, $20
/* 003010 01DAED10 90014CC4 */  lwc1        $f12, 0x190($2)
/* 003014 01DAED14 5044040C */  jal         fptoui
/* 003018 01DAED18 00000000 */   nop
/* 00301C 01DAED1C D48B848F */  lw          $4, -0x742C($28)
/* 003020 01DAED20 282EA072 */  paddub      $5, $21, $0
/* 003024 01DAED24 5001A627 */  addiu       $6, $29, 0x150
/* 003028 01DAED28 B000A727 */  addiu       $7, $29, 0xB0
/* 00302C 01DAED2C D000A827 */  addiu       $8, $29, 0xD0
/* 003030 01DAED30 E000A927 */  addiu       $9, $29, 0xE0
/* 003034 01DAED34 C000AA27 */  addiu       $10, $29, 0xC0
/* 003038 01DAED38 285E4070 */  paddub      $11, $2, $0
/* 00303C 01DAED3C 1C75050C */  jal         set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc
/* 003040 01DAED40 00000000 */   nop
.L01DAED44_2B4544:
/* 003044 01DAED44 01001026 */  addiu       $16, $16, 0x1
.L01DAED48_2B4548:
/* 003048 01DAED48 1300022A */  slti        $2, $16, 0x13
/* 00304C 01DAED4C 8FFE4014 */  bnez        $2, .L01DAE78C_2B3F8C
/* 003050 01DAED50 00000000 */   nop
/* 003054 01DAED54 28260070 */  paddub      $4, $0, $0
/* 003058 01DAED58 E4BB040C */  jal         MGSetGsALPHA__FP10sceGsAlpha
/* 00305C 01DAED5C 00000000 */   nop
/* 003060 01DAED60 28260070 */  paddub      $4, $0, $0
/* 003064 01DAED64 B0BB040C */  jal         MGSetGsZBUF__FP9sceGsZbuf
/* 003068 01DAED68 00000000 */   nop
/* 00306C 01DAED6C 9000BF7B */  lq          $31, 0x90($29)
/* 003070 01DAED70 8000B77B */  lq          $23, 0x80($29)
/* 003074 01DAED74 7000B67B */  lq          $22, 0x70($29)
/* 003078 01DAED78 6000B57B */  lq          $21, 0x60($29)
/* 00307C 01DAED7C 5000B47B */  lq          $20, 0x50($29)
/* 003080 01DAED80 4000B37B */  lq          $19, 0x40($29)
/* 003084 01DAED84 3000B27B */  lq          $18, 0x30($29)
/* 003088 01DAED88 2000B17B */  lq          $17, 0x20($29)
/* 00308C 01DAED8C 1000B07B */  lq          $16, 0x10($29)
/* 003090 01DAED90 0400B5C7 */  lwc1        $f21, 0x4($29)
/* 003094 01DAED94 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 003098 01DAED98 7001BD27 */  addiu       $29, $29, 0x170
/* 00309C 01DAED9C 0800E003 */  jr          $31
/* 0030A0 01DAEDA0 00000000 */   nop
/* 0030A4 01DAEDA4 00000000 */  nop
/* 0030A8 01DAEDA8 00000000 */  nop
/* 0030AC 01DAEDAC 00000000 */  nop
