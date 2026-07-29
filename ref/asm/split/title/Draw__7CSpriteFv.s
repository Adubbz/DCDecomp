.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Draw__7CSpriteFv
/* 028A60 01DD4760 00FFBD27 */  addiu       $29, $29, -0x100
/* 028A64 01DD4764 5000BF7F */  sq          $31, 0x50($29)
/* 028A68 01DD4768 4000B37F */  sq          $19, 0x40($29)
/* 028A6C 01DD476C 3000B27F */  sq          $18, 0x30($29)
/* 028A70 01DD4770 2000B17F */  sq          $17, 0x20($29)
/* 028A74 01DD4774 1000B07F */  sq          $16, 0x10($29)
/* 028A78 01DD4778 0000B4E7 */  swc1        $f20, 0x0($29)
/* 028A7C 01DD477C 289E8070 */  paddub      $19, $4, $0
/* 028A80 01DD4780 000081C4 */  lwc1        $f1, 0x0($4)
/* 028A84 01DD4784 2F44033C */  lui         $3, (0x442F0000 >> 16)
/* 028A88 01DD4788 00008344 */  mtc1        $3, $f0
/* 028A8C 01DD478C 00000000 */  nop
/* 028A90 01DD4790 34080046 */  c.lt.s      $f1, $f0
/* 028A94 01DD4794 00000000 */  nop
/* 028A98 01DD4798 39010045 */  bc1f        .L01DD4C80_2DA480
/* 028A9C 01DD479C 00000000 */   nop
/* 028AA0 01DD47A0 E800A327 */  addiu       $3, $29, 0xE8
/* 028AA4 01DD47A4 E88A80C7 */  lwc1        $f0, -0x7518($28)
/* 028AA8 01DD47A8 EC8A8293 */  lbu         $2, -0x7514($28)
/* 028AAC 01DD47AC 000060E4 */  swc1        $f0, 0x0($3)
/* 028AB0 01DD47B0 040062A0 */  sb          $2, 0x4($3)
/* 028AB4 01DD47B4 288E0070 */  paddub      $17, $0, $0
/* 028AB8 01DD47B8 3C000010 */  b           .L01DD48AC_2DA0AC
/* 028ABC 01DD47BC 00000000 */   nop
.L01DD47C0_2D9FC0:
/* 028AC0 01DD47C0 7000A0AF */  sw          $0, 0x70($29)
/* 028AC4 01DD47C4 7400A0AF */  sw          $0, 0x74($29)
/* 028AC8 01DD47C8 40000224 */  addiu       $2, $0, 0x40
/* 028ACC 01DD47CC 7800A2AF */  sw          $2, 0x78($29)
/* 028AD0 01DD47D0 7C00A2AF */  sw          $2, 0x7C($29)
/* 028AD4 01DD47D4 80901100 */  sll         $18, $17, 2
/* 028AD8 01DD47D8 21105302 */  addu        $2, $18, $19
/* 028ADC 01DD47DC 300041C4 */  lwc1        $f1, 0x30($2)
/* 028AE0 01DD47E0 8041023C */  lui         $2, (0x41800000 >> 16)
/* 028AE4 01DD47E4 00008244 */  mtc1        $2, $f0
/* 028AE8 01DD47E8 00000000 */  nop
/* 028AEC 01DD47EC 010B0046 */  sub.s       $f12, $f1, $f0
/* 028AF0 01DD47F0 2C44040C */  jal         fptosi
/* 028AF4 01DD47F4 00000000 */   nop
/* 028AF8 01DD47F8 28864070 */  paddub      $16, $2, $0
/* 028AFC 01DD47FC 21107202 */  addu        $2, $19, $18
/* 028B00 01DD4800 000054C4 */  lwc1        $f20, 0x0($2)
/* 028B04 01DD4804 06A30046 */  mov.s       $f12, $f20
/* 028B08 01DD4808 2C44040C */  jal         fptosi
/* 028B0C 01DD480C 00000000 */   nop
/* 028B10 01DD4810 06A30046 */  mov.s       $f12, $f20
/* 028B14 01DD4814 2C44040C */  jal         fptosi
/* 028B18 01DD4818 00000000 */   nop
/* 028B1C 01DD481C 6000A2AF */  sw          $2, 0x60($29)
/* 028B20 01DD4820 6400B0AF */  sw          $16, 0x64($29)
/* 028B24 01DD4824 40000224 */  addiu       $2, $0, 0x40
/* 028B28 01DD4828 6800A2AF */  sw          $2, 0x68($29)
/* 028B2C 01DD482C 6C00A2AF */  sw          $2, 0x6C($29)
/* 028B30 01DD4830 A0B8040C */  jal         GetVif1Packet__Fv
/* 028B34 01DD4834 00000000 */   nop
/* 028B38 01DD4838 28864070 */  paddub      $16, $2, $0
/* 028B3C 01DD483C C701023C */  lui         $2, %hi(TexManager)
/* 028B40 01DD4840 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 028B44 01DD4844 DE01023C */  lui         $2, %hi(LIT_963__3)
/* 028B48 01DD4848 080F4524 */  addiu       $5, $2, %lo(LIT_963__3)
/* 028B4C 01DD484C FFFF0624 */  addiu       $6, $0, -0x1
/* 028B50 01DD4850 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 028B54 01DD4854 00000000 */   nop
/* 028B58 01DD4858 28964070 */  paddub      $18, $2, $0
/* 028B5C 01DD485C BE11040C */  jal         rand
/* 028B60 01DD4860 00000000 */   nop
/* 028B64 01DD4864 21183D02 */  addu        $3, $17, $29
/* 028B68 01DD4868 E8006390 */  lbu         $3, 0xE8($3)
/* 028B6C 01DD486C 1A004300 */  div         $0, $2, $3
/* 028B70 01DD4870 02006014 */  bnez        $3, .L01DD487C_2DA07C
/* 028B74 01DD4874 00000000 */   nop
/* 028B78 01DD4878 CD010000 */  break       0, 7
.L01DD487C_2DA07C:
/* 028B7C 01DD487C 10280000 */  mfhi        $5
/* 028B80 01DD4880 389C8427 */  addiu       $4, $28, -0x63C8
/* 028B84 01DD4884 7C54770C */  jal         Get__8CScFaderFi
/* 028B88 01DD4888 00000000 */   nop
/* 028B8C 01DD488C FF004830 */  andi        $8, $2, 0xFF
/* 028B90 01DD4890 28260072 */  paddub      $4, $16, $0
/* 028B94 01DD4894 282E4072 */  paddub      $5, $18, $0
/* 028B98 01DD4898 6000A627 */  addiu       $6, $29, 0x60
/* 028B9C 01DD489C 7000A727 */  addiu       $7, $29, 0x70
/* 028BA0 01DD48A0 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 028BA4 01DD48A4 00000000 */   nop
/* 028BA8 01DD48A8 01003126 */  addiu       $17, $17, 0x1
.L01DD48AC_2DA0AC:
/* 028BAC 01DD48AC 0500222A */  slti        $2, $17, 0x5
/* 028BB0 01DD48B0 C3FF4014 */  bnez        $2, .L01DD47C0_2D9FC0
/* 028BB4 01DD48B4 00000000 */   nop
/* 028BB8 01DD48B8 9000A0AF */  sw          $0, 0x90($29)
/* 028BBC 01DD48BC 9400A0AF */  sw          $0, 0x94($29)
/* 028BC0 01DD48C0 20000224 */  addiu       $2, $0, 0x20
/* 028BC4 01DD48C4 9800A2AF */  sw          $2, 0x98($29)
/* 028BC8 01DD48C8 9C00A2AF */  sw          $2, 0x9C($29)
/* 028BCC 01DD48CC BE11040C */  jal         rand
/* 028BD0 01DD48D0 00000000 */   nop
/* 028BD4 01DD48D4 0F004330 */  andi        $3, $2, 0xF
/* 028BD8 01DD48D8 04004104 */  bgez        $2, .L01DD48EC_2DA0EC
/* 028BDC 01DD48DC 00000000 */   nop
/* 028BE0 01DD48E0 02006010 */  beqz        $3, .L01DD48EC_2DA0EC
/* 028BE4 01DD48E4 00000000 */   nop
/* 028BE8 01DD48E8 F0FF6324 */  addiu       $3, $3, -0x10
.L01DD48EC_2DA0EC:
/* 028BEC 01DD48EC 00008344 */  mtc1        $3, $f0
/* 028BF0 01DD48F0 00000000 */  nop
/* 028BF4 01DD48F4 60008046 */  cvt.s.w     $f1, $f0
/* 028BF8 01DD48F8 300060C6 */  lwc1        $f0, 0x30($19)
/* 028BFC 01DD48FC 00030146 */  add.s       $f12, $f0, $f1
/* 028C00 01DD4900 2C44040C */  jal         fptosi
/* 028C04 01DD4904 00000000 */   nop
/* 028C08 01DD4908 28864070 */  paddub      $16, $2, $0
/* 028C0C 01DD490C BE11040C */  jal         rand
/* 028C10 01DD4910 00000000 */   nop
/* 028C14 01DD4914 07004330 */  andi        $3, $2, 0x7
/* 028C18 01DD4918 04004104 */  bgez        $2, .L01DD492C_2DA12C
/* 028C1C 01DD491C 00000000 */   nop
/* 028C20 01DD4920 02006010 */  beqz        $3, .L01DD492C_2DA12C
/* 028C24 01DD4924 00000000 */   nop
/* 028C28 01DD4928 F8FF6324 */  addiu       $3, $3, -0x8
.L01DD492C_2DA12C:
/* 028C2C 01DD492C 00008344 */  mtc1        $3, $f0
/* 028C30 01DD4930 00000000 */  nop
/* 028C34 01DD4934 60008046 */  cvt.s.w     $f1, $f0
/* 028C38 01DD4938 000060C6 */  lwc1        $f0, 0x0($19)
/* 028C3C 01DD493C 41000146 */  sub.s       $f1, $f0, $f1
/* 028C40 01DD4940 0041023C */  lui         $2, (0x41000000 >> 16)
/* 028C44 01DD4944 00008244 */  mtc1        $2, $f0
/* 028C48 01DD4948 00000000 */  nop
/* 028C4C 01DD494C 00030146 */  add.s       $f12, $f0, $f1
/* 028C50 01DD4950 2C44040C */  jal         fptosi
/* 028C54 01DD4954 00000000 */   nop
/* 028C58 01DD4958 8000A2AF */  sw          $2, 0x80($29)
/* 028C5C 01DD495C 8400B0AF */  sw          $16, 0x84($29)
/* 028C60 01DD4960 10000224 */  addiu       $2, $0, 0x10
/* 028C64 01DD4964 8800A2AF */  sw          $2, 0x88($29)
/* 028C68 01DD4968 8C00A2AF */  sw          $2, 0x8C($29)
/* 028C6C 01DD496C A0B8040C */  jal         GetVif1Packet__Fv
/* 028C70 01DD4970 00000000 */   nop
/* 028C74 01DD4974 288E4070 */  paddub      $17, $2, $0
/* 028C78 01DD4978 C701023C */  lui         $2, %hi(TexManager)
/* 028C7C 01DD497C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 028C80 01DD4980 DE01023C */  lui         $2, %hi(LIT_964__2)
/* 028C84 01DD4984 100F4524 */  addiu       $5, $2, %lo(LIT_964__2)
/* 028C88 01DD4988 FFFF0624 */  addiu       $6, $0, -0x1
/* 028C8C 01DD498C B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 028C90 01DD4990 00000000 */   nop
/* 028C94 01DD4994 28864070 */  paddub      $16, $2, $0
/* 028C98 01DD4998 BE11040C */  jal         rand
/* 028C9C 01DD499C 00000000 */   nop
/* 028CA0 01DD49A0 7F004530 */  andi        $5, $2, 0x7F
/* 028CA4 01DD49A4 04004104 */  bgez        $2, .L01DD49B8_2DA1B8
/* 028CA8 01DD49A8 00000000 */   nop
/* 028CAC 01DD49AC 0200A010 */  beqz        $5, .L01DD49B8_2DA1B8
/* 028CB0 01DD49B0 00000000 */   nop
/* 028CB4 01DD49B4 80FFA524 */  addiu       $5, $5, -0x80
.L01DD49B8_2DA1B8:
/* 028CB8 01DD49B8 389C8427 */  addiu       $4, $28, -0x63C8
/* 028CBC 01DD49BC 7C54770C */  jal         Get__8CScFaderFi
/* 028CC0 01DD49C0 00000000 */   nop
/* 028CC4 01DD49C4 FF004830 */  andi        $8, $2, 0xFF
/* 028CC8 01DD49C8 28262072 */  paddub      $4, $17, $0
/* 028CCC 01DD49CC 282E0072 */  paddub      $5, $16, $0
/* 028CD0 01DD49D0 8000A627 */  addiu       $6, $29, 0x80
/* 028CD4 01DD49D4 9000A727 */  addiu       $7, $29, 0x90
/* 028CD8 01DD49D8 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 028CDC 01DD49DC 00000000 */   nop
/* 028CE0 01DD49E0 B000A0AF */  sw          $0, 0xB0($29)
/* 028CE4 01DD49E4 B400A0AF */  sw          $0, 0xB4($29)
/* 028CE8 01DD49E8 20000224 */  addiu       $2, $0, 0x20
/* 028CEC 01DD49EC B800A2AF */  sw          $2, 0xB8($29)
/* 028CF0 01DD49F0 BC00A2AF */  sw          $2, 0xBC($29)
/* 028CF4 01DD49F4 BE11040C */  jal         rand
/* 028CF8 01DD49F8 00000000 */   nop
/* 028CFC 01DD49FC 18000324 */  addiu       $3, $0, 0x18
/* 028D00 01DD4A00 1A004300 */  div         $0, $2, $3
/* 028D04 01DD4A04 00000000 */  nop
/* 028D08 01DD4A08 00000000 */  nop
/* 028D0C 01DD4A0C 10100000 */  mfhi        $2
/* 028D10 01DD4A10 00008244 */  mtc1        $2, $f0
/* 028D14 01DD4A14 00000000 */  nop
/* 028D18 01DD4A18 60008046 */  cvt.s.w     $f1, $f0
/* 028D1C 01DD4A1C 300060C6 */  lwc1        $f0, 0x30($19)
/* 028D20 01DD4A20 40000146 */  add.s       $f1, $f0, $f1
/* 028D24 01DD4A24 C040023C */  lui         $2, (0x40C00000 >> 16)
/* 028D28 01DD4A28 00008244 */  mtc1        $2, $f0
/* 028D2C 01DD4A2C 00000000 */  nop
/* 028D30 01DD4A30 010B0046 */  sub.s       $f12, $f1, $f0
/* 028D34 01DD4A34 2C44040C */  jal         fptosi
/* 028D38 01DD4A38 00000000 */   nop
/* 028D3C 01DD4A3C 28864070 */  paddub      $16, $2, $0
/* 028D40 01DD4A40 BE11040C */  jal         rand
/* 028D44 01DD4A44 00000000 */   nop
/* 028D48 01DD4A48 0F004330 */  andi        $3, $2, 0xF
/* 028D4C 01DD4A4C 04004104 */  bgez        $2, .L01DD4A60_2DA260
/* 028D50 01DD4A50 00000000 */   nop
/* 028D54 01DD4A54 02006010 */  beqz        $3, .L01DD4A60_2DA260
/* 028D58 01DD4A58 00000000 */   nop
/* 028D5C 01DD4A5C F0FF6324 */  addiu       $3, $3, -0x10
.L01DD4A60_2DA260:
/* 028D60 01DD4A60 00008344 */  mtc1        $3, $f0
/* 028D64 01DD4A64 00000000 */  nop
/* 028D68 01DD4A68 60008046 */  cvt.s.w     $f1, $f0
/* 028D6C 01DD4A6C 000060C6 */  lwc1        $f0, 0x0($19)
/* 028D70 01DD4A70 41000146 */  sub.s       $f1, $f0, $f1
/* 028D74 01DD4A74 0041023C */  lui         $2, (0x41000000 >> 16)
/* 028D78 01DD4A78 00008244 */  mtc1        $2, $f0
/* 028D7C 01DD4A7C 00000000 */  nop
/* 028D80 01DD4A80 00030146 */  add.s       $f12, $f0, $f1
/* 028D84 01DD4A84 2C44040C */  jal         fptosi
/* 028D88 01DD4A88 00000000 */   nop
/* 028D8C 01DD4A8C A000A2AF */  sw          $2, 0xA0($29)
/* 028D90 01DD4A90 A400B0AF */  sw          $16, 0xA4($29)
/* 028D94 01DD4A94 10000224 */  addiu       $2, $0, 0x10
/* 028D98 01DD4A98 A800A2AF */  sw          $2, 0xA8($29)
/* 028D9C 01DD4A9C AC00A2AF */  sw          $2, 0xAC($29)
/* 028DA0 01DD4AA0 A0B8040C */  jal         GetVif1Packet__Fv
/* 028DA4 01DD4AA4 00000000 */   nop
/* 028DA8 01DD4AA8 288E4070 */  paddub      $17, $2, $0
/* 028DAC 01DD4AAC C701023C */  lui         $2, %hi(TexManager)
/* 028DB0 01DD4AB0 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 028DB4 01DD4AB4 DE01023C */  lui         $2, %hi(LIT_964__2)
/* 028DB8 01DD4AB8 100F4524 */  addiu       $5, $2, %lo(LIT_964__2)
/* 028DBC 01DD4ABC FFFF0624 */  addiu       $6, $0, -0x1
/* 028DC0 01DD4AC0 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 028DC4 01DD4AC4 00000000 */   nop
/* 028DC8 01DD4AC8 28864070 */  paddub      $16, $2, $0
/* 028DCC 01DD4ACC BE11040C */  jal         rand
/* 028DD0 01DD4AD0 00000000 */   nop
/* 028DD4 01DD4AD4 7F004530 */  andi        $5, $2, 0x7F
/* 028DD8 01DD4AD8 04004104 */  bgez        $2, .L01DD4AEC_2DA2EC
/* 028DDC 01DD4ADC 00000000 */   nop
/* 028DE0 01DD4AE0 0200A010 */  beqz        $5, .L01DD4AEC_2DA2EC
/* 028DE4 01DD4AE4 00000000 */   nop
/* 028DE8 01DD4AE8 80FFA524 */  addiu       $5, $5, -0x80
.L01DD4AEC_2DA2EC:
/* 028DEC 01DD4AEC 389C8427 */  addiu       $4, $28, -0x63C8
/* 028DF0 01DD4AF0 7C54770C */  jal         Get__8CScFaderFi
/* 028DF4 01DD4AF4 00000000 */   nop
/* 028DF8 01DD4AF8 FF004830 */  andi        $8, $2, 0xFF
/* 028DFC 01DD4AFC 28262072 */  paddub      $4, $17, $0
/* 028E00 01DD4B00 282E0072 */  paddub      $5, $16, $0
/* 028E04 01DD4B04 A000A627 */  addiu       $6, $29, 0xA0
/* 028E08 01DD4B08 B000A727 */  addiu       $7, $29, 0xB0
/* 028E0C 01DD4B0C C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 028E10 01DD4B10 00000000 */   nop
/* 028E14 01DD4B14 DE01033C */  lui         $3, %hi(LIT_929__5)
/* 028E18 01DD4B18 58BD6324 */  addiu       $3, $3, %lo(LIT_929__5)
/* 028E1C 01DD4B1C F000A627 */  addiu       $6, $29, 0xF0
/* 028E20 01DD4B20 000065DC */  ld          $5, 0x0($3)
/* 028E24 01DD4B24 08006484 */  lh          $4, 0x8($3)
/* 028E28 01DD4B28 0A006390 */  lbu         $3, 0xA($3)
/* 028E2C 01DD4B2C 0000C5FC */  sd          $5, 0x0($6)
/* 028E30 01DD4B30 0800C4A4 */  sh          $4, 0x8($6)
/* 028E34 01DD4B34 0A00C3A0 */  sb          $3, 0xA($6)
/* 028E38 01DD4B38 01001124 */  addiu       $17, $0, 0x1
/* 028E3C 01DD4B3C 4D000010 */  b           .L01DD4C74_2DA474
/* 028E40 01DD4B40 00000000 */   nop
.L01DD4B44_2DA344:
/* 028E44 01DD4B44 D000A0AF */  sw          $0, 0xD0($29)
/* 028E48 01DD4B48 D400A0AF */  sw          $0, 0xD4($29)
/* 028E4C 01DD4B4C 20000224 */  addiu       $2, $0, 0x20
/* 028E50 01DD4B50 D800A2AF */  sw          $2, 0xD8($29)
/* 028E54 01DD4B54 DC00A2AF */  sw          $2, 0xDC($29)
/* 028E58 01DD4B58 BE11040C */  jal         rand
/* 028E5C 01DD4B5C 00000000 */   nop
/* 028E60 01DD4B60 0F004330 */  andi        $3, $2, 0xF
/* 028E64 01DD4B64 04004104 */  bgez        $2, .L01DD4B78_2DA378
/* 028E68 01DD4B68 00000000 */   nop
/* 028E6C 01DD4B6C 02006010 */  beqz        $3, .L01DD4B78_2DA378
/* 028E70 01DD4B70 00000000 */   nop
/* 028E74 01DD4B74 F0FF6324 */  addiu       $3, $3, -0x10
.L01DD4B78_2DA378:
/* 028E78 01DD4B78 00008344 */  mtc1        $3, $f0
/* 028E7C 01DD4B7C 00000000 */  nop
/* 028E80 01DD4B80 60008046 */  cvt.s.w     $f1, $f0
/* 028E84 01DD4B84 80901100 */  sll         $18, $17, 2
/* 028E88 01DD4B88 21105302 */  addu        $2, $18, $19
/* 028E8C 01DD4B8C 300040C4 */  lwc1        $f0, 0x30($2)
/* 028E90 01DD4B90 40000146 */  add.s       $f1, $f0, $f1
/* 028E94 01DD4B94 8040023C */  lui         $2, (0x40800000 >> 16)
/* 028E98 01DD4B98 00008244 */  mtc1        $2, $f0
/* 028E9C 01DD4B9C 00000000 */  nop
/* 028EA0 01DD4BA0 00030146 */  add.s       $f12, $f0, $f1
/* 028EA4 01DD4BA4 2C44040C */  jal         fptosi
/* 028EA8 01DD4BA8 00000000 */   nop
/* 028EAC 01DD4BAC 28864070 */  paddub      $16, $2, $0
/* 028EB0 01DD4BB0 BE11040C */  jal         rand
/* 028EB4 01DD4BB4 00000000 */   nop
/* 028EB8 01DD4BB8 07004330 */  andi        $3, $2, 0x7
/* 028EBC 01DD4BBC 04004104 */  bgez        $2, .L01DD4BD0_2DA3D0
/* 028EC0 01DD4BC0 00000000 */   nop
/* 028EC4 01DD4BC4 02006010 */  beqz        $3, .L01DD4BD0_2DA3D0
/* 028EC8 01DD4BC8 00000000 */   nop
/* 028ECC 01DD4BCC F8FF6324 */  addiu       $3, $3, -0x8
.L01DD4BD0_2DA3D0:
/* 028ED0 01DD4BD0 00008344 */  mtc1        $3, $f0
/* 028ED4 01DD4BD4 00000000 */  nop
/* 028ED8 01DD4BD8 60008046 */  cvt.s.w     $f1, $f0
/* 028EDC 01DD4BDC 21107202 */  addu        $2, $19, $18
/* 028EE0 01DD4BE0 000040C4 */  lwc1        $f0, 0x0($2)
/* 028EE4 01DD4BE4 41000146 */  sub.s       $f1, $f0, $f1
/* 028EE8 01DD4BE8 0041023C */  lui         $2, (0x41000000 >> 16)
/* 028EEC 01DD4BEC 00008244 */  mtc1        $2, $f0
/* 028EF0 01DD4BF0 00000000 */  nop
/* 028EF4 01DD4BF4 00030146 */  add.s       $f12, $f0, $f1
/* 028EF8 01DD4BF8 2C44040C */  jal         fptosi
/* 028EFC 01DD4BFC 00000000 */   nop
/* 028F00 01DD4C00 C000A2AF */  sw          $2, 0xC0($29)
/* 028F04 01DD4C04 C400B0AF */  sw          $16, 0xC4($29)
/* 028F08 01DD4C08 08000224 */  addiu       $2, $0, 0x8
/* 028F0C 01DD4C0C C800A2AF */  sw          $2, 0xC8($29)
/* 028F10 01DD4C10 CC00A2AF */  sw          $2, 0xCC($29)
/* 028F14 01DD4C14 A0B8040C */  jal         GetVif1Packet__Fv
/* 028F18 01DD4C18 00000000 */   nop
/* 028F1C 01DD4C1C 28864070 */  paddub      $16, $2, $0
/* 028F20 01DD4C20 C701023C */  lui         $2, %hi(TexManager)
/* 028F24 01DD4C24 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 028F28 01DD4C28 DE01023C */  lui         $2, %hi(LIT_964__2)
/* 028F2C 01DD4C2C 100F4524 */  addiu       $5, $2, %lo(LIT_964__2)
/* 028F30 01DD4C30 FFFF0624 */  addiu       $6, $0, -0x1
/* 028F34 01DD4C34 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 028F38 01DD4C38 00000000 */   nop
/* 028F3C 01DD4C3C 28964070 */  paddub      $18, $2, $0
/* 028F40 01DD4C40 21103D02 */  addu        $2, $17, $29
/* 028F44 01DD4C44 F0004590 */  lbu         $5, 0xF0($2)
/* 028F48 01DD4C48 389C8427 */  addiu       $4, $28, -0x63C8
/* 028F4C 01DD4C4C 7C54770C */  jal         Get__8CScFaderFi
/* 028F50 01DD4C50 00000000 */   nop
/* 028F54 01DD4C54 FF004830 */  andi        $8, $2, 0xFF
/* 028F58 01DD4C58 28260072 */  paddub      $4, $16, $0
/* 028F5C 01DD4C5C 282E4072 */  paddub      $5, $18, $0
/* 028F60 01DD4C60 C000A627 */  addiu       $6, $29, 0xC0
/* 028F64 01DD4C64 D000A727 */  addiu       $7, $29, 0xD0
/* 028F68 01DD4C68 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 028F6C 01DD4C6C 00000000 */   nop
/* 028F70 01DD4C70 01003126 */  addiu       $17, $17, 0x1
.L01DD4C74_2DA474:
/* 028F74 01DD4C74 0C00232A */  slti        $3, $17, 0xC
/* 028F78 01DD4C78 B2FF6014 */  bnez        $3, .L01DD4B44_2DA344
/* 028F7C 01DD4C7C 00000000 */   nop
.L01DD4C80_2DA480:
/* 028F80 01DD4C80 5000BF7B */  lq          $31, 0x50($29)
/* 028F84 01DD4C84 4000B37B */  lq          $19, 0x40($29)
/* 028F88 01DD4C88 3000B27B */  lq          $18, 0x30($29)
/* 028F8C 01DD4C8C 2000B17B */  lq          $17, 0x20($29)
/* 028F90 01DD4C90 1000B07B */  lq          $16, 0x10($29)
/* 028F94 01DD4C94 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 028F98 01DD4C98 0001BD27 */  addiu       $29, $29, 0x100
/* 028F9C 01DD4C9C 0800E003 */  jr          $31
/* 028FA0 01DD4CA0 00000000 */   nop
/* 028FA4 01DD4CA4 00000000 */  nop
/* 028FA8 01DD4CA8 00000000 */  nop
/* 028FAC 01DD4CAC 00000000 */  nop
