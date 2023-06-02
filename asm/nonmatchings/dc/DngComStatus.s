.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DngComStatus__Fiiii
/* F4E00 001F4D00 B0FDBD27 */  addiu      $sp, $sp, -0x250
/* F4E04 001F4D04 A000BF7F */  sq         $31, 0xA0($sp)
/* F4E08 001F4D08 9000BE7F */  sq         $fp, 0x90($sp)
/* F4E0C 001F4D0C 8000B77F */  sq         $23, 0x80($sp)
/* F4E10 001F4D10 7000B67F */  sq         $22, 0x70($sp)
/* F4E14 001F4D14 6000B57F */  sq         $21, 0x60($sp)
/* F4E18 001F4D18 5000B47F */  sq         $20, 0x50($sp)
/* F4E1C 001F4D1C 4000B37F */  sq         $19, 0x40($sp)
/* F4E20 001F4D20 3000B27F */  sq         $18, 0x30($sp)
/* F4E24 001F4D24 2000B17F */  sq         $17, 0x20($sp)
/* F4E28 001F4D28 1000B07F */  sq         $16, 0x10($sp)
/* F4E2C 001F4D2C 0400B5E7 */  swc1       $f21, 0x4($sp)
/* F4E30 001F4D30 0000B4E7 */  swc1       $f20, 0x0($sp)
/* F4E34 001F4D34 FC00A4AF */  sw         $4, 0xFC($sp)
/* F4E38 001F4D38 28AEA070 */  paddub     $21, $5, $0
/* F4E3C 001F4D3C 28BEC070 */  paddub     $23, $6, $0
/* F4E40 001F4D40 28A6E070 */  paddub     $20, $7, $0
/* F4E44 001F4D44 C701023C */  lui        $2, %hi(TexManager)
/* F4E48 001F4D48 70584424 */  addiu      $4, $2, %lo(TexManager)
/* F4E4C 001F4D4C 2A00023C */  lui        $2, %hi(_885_2)
/* F4E50 001F4D50 D8D44524 */  addiu      $5, $2, %lo(_885_2)
/* F4E54 001F4D54 FFFF0624 */  addiu      $6, $0, -0x1
/* F4E58 001F4D58 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* F4E5C 001F4D5C 00000000 */   nop
/* F4E60 001F4D60 28864070 */  paddub     $16, $2, $0
/* F4E64 001F4D64 FC00A38F */  lw         $3, 0xFC($sp)
/* F4E68 001F4D68 FAFF7124 */  addiu      $17, $3, -0x6
/* F4E6C 001F4D6C 3002A627 */  addiu      $6, $sp, 0x230
/* F4E70 001F4D70 408883DF */  ld         $3, -0x77C0($gp)
/* F4E74 001F4D74 0000C3FC */  sd         $3, 0x0($6)
/* F4E78 001F4D78 D494878F */  lw         $7, -0x6B2C($gp)
/* F4E7C 001F4D7C 40181700 */  sll        $3, $23, 1
/* F4E80 001F4D80 21306700 */  addu       $6, $3, $7
/* F4E84 001F4D84 1200C384 */  lh         $3, 0x12($6)
/* F4E88 001F4D88 00008344 */  mtc1       $3, $f0
/* F4E8C 001F4D8C 00000000 */  nop
/* F4E90 001F4D90 20058046 */  cvt.s.w    $f20, $f0
/* F4E94 001F4D94 0600C384 */  lh         $3, 0x6($6)
/* F4E98 001F4D98 00008344 */  mtc1       $3, $f0
/* F4E9C 001F4D9C 00000000 */  nop
/* F4EA0 001F4DA0 60058046 */  cvt.s.w    $f21, $f0
/* F4EA4 001F4DA4 803F033C */  lui        $3, (0x3F800000 >> 16)
/* F4EA8 001F4DA8 00008344 */  mtc1       $3, $f0
/* F4EAC 001F4DAC 00000000 */  nop
/* F4EB0 001F4DB0 34A80046 */  c.lt.s     $f21, $f0
/* F4EB4 001F4DB4 00000000 */  nop
/* F4EB8 001F4DB8 03000045 */  bc1f       .L001F4DC8
/* F4EBC 001F4DBC 00000000 */   nop
/* F4EC0 001F4DC0 0042033C */  lui        $3, (0x42000000 >> 16)
/* F4EC4 001F4DC4 00A88344 */  mtc1       $3, $f21
.L001F4DC8:
/* F4EC8 001F4DC8 2118E702 */  addu       $3, $23, $7
/* F4ECC 001F4DCC 40436680 */  lb         $6, 0x4340($3)
/* F4ED0 001F4DD0 A80A0324 */  addiu      $3, $0, 0xAA8
/* F4ED4 001F4DD4 1818E302 */  mult       $3, $23, $3
/* F4ED8 001F4DD8 2118E300 */  addu       $3, $7, $3
/* F4EDC 001F4DDC 0C456724 */  addiu      $7, $3, 0x450C
/* F4EE0 001F4DE0 40190600 */  sll        $3, $6, 5
/* F4EE4 001F4DE4 23186600 */  subu       $3, $3, $6
/* F4EE8 001F4DE8 C0180300 */  sll        $3, $3, 3
/* F4EEC 001F4DEC 2118E300 */  addu       $3, $7, $3
/* F4EF0 001F4DF0 7C016010 */  beqz       $3, .L001F53E4
/* F4EF4 001F4DF4 00000000 */   nop
/* F4EF8 001F4DF8 100061C4 */  lwc1       $f1, 0x10($3)
/* F4EFC 001F4DFC 0C006284 */  lh         $2, 0xC($3)
/* F4F00 001F4E00 00008244 */  mtc1       $2, $f0
/* F4F04 001F4E04 00000000 */  nop
/* F4F08 001F4E08 A0008046 */  cvt.s.w    $f2, $f0
/* F4F0C 001F4E0C 803F023C */  lui        $2, (0x3F800000 >> 16)
/* F4F10 001F4E10 00008244 */  mtc1       $2, $f0
/* F4F14 001F4E14 00000000 */  nop
/* F4F18 001F4E18 34100046 */  c.lt.s     $f2, $f0
/* F4F1C 001F4E1C 00000000 */  nop
/* F4F20 001F4E20 03000045 */  bc1f       .L001F4E30
/* F4F24 001F4E24 00000000 */   nop
/* F4F28 001F4E28 0042023C */  lui        $2, (0x42000000 >> 16)
/* F4F2C 001F4E2C 00108244 */  mtc1       $2, $f2
.L001F4E30:
/* F4F30 001F4E30 2900023C */  lui        $2, %hi(_789_3)
/* F4F34 001F4E34 602E4224 */  addiu      $2, $2, %lo(_789_3)
/* F4F38 001F4E38 0001A327 */  addiu      $3, $sp, 0x100
/* F4F3C 001F4E3C 00004278 */  lq         $2, 0x0($2)
/* F4F40 001F4E40 0000627C */  sq         $2, 0x0($3)
/* F4F44 001F4E44 0001B4E7 */  swc1       $f20, 0x100($sp)
/* F4F48 001F4E48 0401B5E7 */  swc1       $f21, 0x104($sp)
/* F4F4C 001F4E4C 0801A1E7 */  swc1       $f1, 0x108($sp)
/* F4F50 001F4E50 0C01A2E7 */  swc1       $f2, 0x10C($sp)
/* F4F54 001F4E54 3802A327 */  addiu      $3, $sp, 0x238
/* F4F58 001F4E58 488882DF */  ld         $2, -0x77B8($gp)
/* F4F5C 001F4E5C 000062FC */  sd         $2, 0x0($3)
/* F4F60 001F4E60 2900023C */  lui        $2, %hi(_791_2)
/* F4F64 001F4E64 702E4224 */  addiu      $2, $2, %lo(_791_2)
/* F4F68 001F4E68 1001A627 */  addiu      $6, $sp, 0x110
/* F4F6C 001F4E6C 00004378 */  lq         $3, 0x0($2)
/* F4F70 001F4E70 100042DC */  ld         $2, 0x10($2)
/* F4F74 001F4E74 0000C37C */  sq         $3, 0x0($6)
/* F4F78 001F4E78 1000C2FC */  sd         $2, 0x10($6)
/* F4F7C 001F4E7C 4002A327 */  addiu      $3, $sp, 0x240
/* F4F80 001F4E80 508882DF */  ld         $2, -0x77B0($gp)
/* F4F84 001F4E84 000062FC */  sd         $2, 0x0($3)
/* F4F88 001F4E88 50000224 */  addiu      $2, $0, 0x50
/* F4F8C 001F4E8C C000A2AF */  sw         $2, 0xC0($sp)
/* F4F90 001F4E90 0100A232 */  andi       $2, $21, 0x1
/* F4F94 001F4E94 0400A106 */  bgez       $21, .L001F4EA8
/* F4F98 001F4E98 00000000 */   nop
/* F4F9C 001F4E9C 02004010 */  beqz       $2, .L001F4EA8
/* F4FA0 001F4EA0 00000000 */   nop
/* F4FA4 001F4EA4 FEFF4224 */  addiu      $2, $2, -0x2
.L001F4EA8:
/* F4FA8 001F4EA8 02004014 */  bnez       $2, .L001F4EB4
/* F4FAC 001F4EAC 00000000 */   nop
/* F4FB0 001F4EB0 FFFFB526 */  addiu      $21, $21, -0x1
.L001F4EB4:
/* F4FB4 001F4EB4 28960070 */  paddub     $18, $0, $0
/* F4FB8 001F4EB8 B0000010 */  b          .L001F517C
/* F4FBC 001F4EBC 00000000 */   nop
.L001F4EC0:
/* F4FC0 001F4EC0 C0101200 */  sll        $2, $18, 3
/* F4FC4 001F4EC4 D000A2AF */  sw         $2, 0xD0($sp)
/* F4FC8 001F4EC8 D000A28F */  lw         $2, 0xD0($sp)
/* F4FCC 001F4ECC 21105D00 */  addu       $2, $2, $sp
/* F4FD0 001F4ED0 04015E24 */  addiu      $fp, $2, 0x104
/* F4FD4 001F4ED4 1443023C */  lui        $2, (0x43140000 >> 16)
/* F4FD8 001F4ED8 00088244 */  mtc1       $2, $f1
/* F4FDC 001F4EDC 0000C0C7 */  lwc1       $f0, 0x0($fp)
/* F4FE0 001F4EE0 42080046 */  mul.s      $f1, $f1, $f0
/* F4FE4 001F4EE4 80981200 */  sll        $19, $18, 2
/* F4FE8 001F4EE8 21107D02 */  addu       $2, $19, $sp
/* F4FEC 001F4EEC 380240C4 */  lwc1       $f0, 0x238($2)
/* F4FF0 001F4EF0 030B0046 */  div.s      $f12, $f1, $f0
/* F4FF4 001F4EF4 2C44040C */  jal        fptosi
/* F4FF8 001F4EF8 00000000 */   nop
/* F4FFC 001F4EFC 28B64070 */  paddub     $22, $2, $0
/* F5000 001F4F00 10000424 */  addiu      $4, $0, 0x10
/* F5004 001F4F04 5001A4AF */  sw         $4, 0x150($sp)
/* F5008 001F4F08 B0000224 */  addiu      $2, $0, 0xB0
/* F500C 001F4F0C 5401A2AF */  sw         $2, 0x154($sp)
/* F5010 001F4F10 04000324 */  addiu      $3, $0, 0x4
/* F5014 001F4F14 5801A3AF */  sw         $3, 0x158($sp)
/* F5018 001F4F18 5C01A4AF */  sw         $4, 0x15C($sp)
/* F501C 001F4F1C 10002226 */  addiu      $2, $17, 0x10
/* F5020 001F4F20 4001A2AF */  sw         $2, 0x140($sp)
/* F5024 001F4F24 0500A226 */  addiu      $2, $21, 0x5
/* F5028 001F4F28 4401A2AF */  sw         $2, 0x144($sp)
/* F502C 001F4F2C 4801A3AF */  sw         $3, 0x148($sp)
/* F5030 001F4F30 0F000224 */  addiu      $2, $0, 0xF
/* F5034 001F4F34 4C01A2AF */  sw         $2, 0x14C($sp)
/* F5038 001F4F38 28260072 */  paddub     $4, $16, $0
/* F503C 001F4F3C 4001A527 */  addiu      $5, $sp, 0x140
/* F5040 001F4F40 5001A627 */  addiu      $6, $sp, 0x150
/* F5044 001F4F44 283E8072 */  paddub     $7, $20, $0
/* F5048 001F4F48 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* F504C 001F4F4C 00000000 */   nop
/* F5050 001F4F50 14000224 */  addiu      $2, $0, 0x14
/* F5054 001F4F54 7001A2AF */  sw         $2, 0x170($sp)
/* F5058 001F4F58 B0000224 */  addiu      $2, $0, 0xB0
/* F505C 001F4F5C 7401A2AF */  sw         $2, 0x174($sp)
/* F5060 001F4F60 04000224 */  addiu      $2, $0, 0x4
/* F5064 001F4F64 7801A2AF */  sw         $2, 0x178($sp)
/* F5068 001F4F68 10000224 */  addiu      $2, $0, 0x10
/* F506C 001F4F6C 7C01A2AF */  sw         $2, 0x17C($sp)
/* F5070 001F4F70 14002226 */  addiu      $2, $17, 0x14
/* F5074 001F4F74 6001A2AF */  sw         $2, 0x160($sp)
/* F5078 001F4F78 0500A226 */  addiu      $2, $21, 0x5
/* F507C 001F4F7C 6401A2AF */  sw         $2, 0x164($sp)
/* F5080 001F4F80 6801B6AF */  sw         $22, 0x168($sp)
/* F5084 001F4F84 0F000224 */  addiu      $2, $0, 0xF
/* F5088 001F4F88 6C01A2AF */  sw         $2, 0x16C($sp)
/* F508C 001F4F8C 28260072 */  paddub     $4, $16, $0
/* F5090 001F4F90 6001A527 */  addiu      $5, $sp, 0x160
/* F5094 001F4F94 7001A627 */  addiu      $6, $sp, 0x170
/* F5098 001F4F98 283E8072 */  paddub     $7, $20, $0
/* F509C 001F4F9C C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* F50A0 001F4FA0 00000000 */   nop
/* F50A4 001F4FA4 18000224 */  addiu      $2, $0, 0x18
/* F50A8 001F4FA8 9001A2AF */  sw         $2, 0x190($sp)
/* F50AC 001F4FAC B0000224 */  addiu      $2, $0, 0xB0
/* F50B0 001F4FB0 9401A2AF */  sw         $2, 0x194($sp)
/* F50B4 001F4FB4 04000324 */  addiu      $3, $0, 0x4
/* F50B8 001F4FB8 9801A3AF */  sw         $3, 0x198($sp)
/* F50BC 001F4FBC 10000224 */  addiu      $2, $0, 0x10
/* F50C0 001F4FC0 9C01A2AF */  sw         $2, 0x19C($sp)
/* F50C4 001F4FC4 13002226 */  addiu      $2, $17, 0x13
/* F50C8 001F4FC8 21105600 */  addu       $2, $2, $22
/* F50CC 001F4FCC 8001A2AF */  sw         $2, 0x180($sp)
/* F50D0 001F4FD0 0500A226 */  addiu      $2, $21, 0x5
/* F50D4 001F4FD4 8401A2AF */  sw         $2, 0x184($sp)
/* F50D8 001F4FD8 8801A3AF */  sw         $3, 0x188($sp)
/* F50DC 001F4FDC 0F000224 */  addiu      $2, $0, 0xF
/* F50E0 001F4FE0 8C01A2AF */  sw         $2, 0x18C($sp)
/* F50E4 001F4FE4 28260072 */  paddub     $4, $16, $0
/* F50E8 001F4FE8 8001A527 */  addiu      $5, $sp, 0x180
/* F50EC 001F4FEC 9001A627 */  addiu      $6, $sp, 0x190
/* F50F0 001F4FF0 283E8072 */  paddub     $7, $20, $0
/* F50F4 001F4FF4 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* F50F8 001F4FF8 00000000 */   nop
/* F50FC 001F4FFC 00009644 */  mtc1       $22, $f0
/* F5100 001F5000 00000000 */  nop
/* F5104 001F5004 60008046 */  cvt.s.w    $f1, $f0
/* F5108 001F5008 D000A28F */  lw         $2, 0xD0($sp)
/* F510C 001F500C 21105D00 */  addu       $2, $2, $sp
/* F5110 001F5010 00014224 */  addiu      $2, $2, 0x100
/* F5114 001F5014 E000A2AF */  sw         $2, 0xE0($sp)
/* F5118 001F5018 E000A28F */  lw         $2, 0xE0($sp)
/* F511C 001F501C 000040C4 */  lwc1       $f0, 0x0($2)
/* F5120 001F5020 42080046 */  mul.s      $f1, $f1, $f0
/* F5124 001F5024 0000C0C7 */  lwc1       $f0, 0x0($fp)
/* F5128 001F5028 030B0046 */  div.s      $f12, $f1, $f0
/* F512C 001F502C 2C44040C */  jal        fptosi
/* F5130 001F5030 00000000 */   nop
/* F5134 001F5034 BC00A2AF */  sw         $2, 0xBC($sp)
/* F5138 001F5038 15004016 */  bnez       $18, .L001F5090
/* F513C 001F503C 00000000 */   nop
/* F5140 001F5040 908280C7 */  lwc1       $f0, -0x7D70($gp)
/* F5144 001F5044 02001546 */  mul.s      $f0, $f0, $f21
/* F5148 001F5048 34A00046 */  c.lt.s     $f20, $f0
/* F514C 001F504C 00000000 */  nop
/* F5150 001F5050 05000045 */  bc1f       .L001F5068
/* F5154 001F5054 00000000 */   nop
/* F5158 001F5058 21187D02 */  addu       $3, $19, $sp
/* F515C 001F505C 4002628C */  lw         $2, 0x240($3)
/* F5160 001F5060 01004224 */  addiu      $2, $2, 0x1
/* F5164 001F5064 400262AC */  sw         $2, 0x240($3)
.L001F5068:
/* F5168 001F5068 488280C7 */  lwc1       $f0, -0x7DB8($gp)
/* F516C 001F506C 02001546 */  mul.s      $f0, $f0, $f21
/* F5170 001F5070 34A00046 */  c.lt.s     $f20, $f0
/* F5174 001F5074 00000000 */  nop
/* F5178 001F5078 05000045 */  bc1f       .L001F5090
/* F517C 001F507C 00000000 */   nop
/* F5180 001F5080 21187D02 */  addu       $3, $19, $sp
/* F5184 001F5084 4002628C */  lw         $2, 0x240($3)
/* F5188 001F5088 01004224 */  addiu      $2, $2, 0x1
/* F518C 001F508C 400262AC */  sw         $2, 0x240($3)
.L001F5090:
/* F5190 001F5090 21107D02 */  addu       $2, $19, $sp
/* F5194 001F5094 4002448C */  lw         $4, 0x240($2)
/* F5198 001F5098 B8CF070C */  jal        GetGradationColorInfo2__Fi
/* F519C 001F509C 00000000 */   nop
/* F51A0 001F50A0 3001A427 */  addiu      $4, $sp, 0x130
/* F51A4 001F50A4 282E4070 */  paddub     $5, $2, $0
/* F51A8 001F50A8 10000624 */  addiu      $6, $0, 0x10
/* F51AC 001F50AC EC0C040C */  jal        memcpy
/* F51B0 001F50B0 00000000 */   nop
/* F51B4 001F50B4 3F01B4A3 */  sb         $20, 0x13F($sp)
/* F51B8 001F50B8 3B01B4A3 */  sb         $20, 0x13B($sp)
/* F51BC 001F50BC 3701B4A3 */  sb         $20, 0x137($sp)
/* F51C0 001F50C0 3301B4A3 */  sb         $20, 0x133($sp)
/* F51C4 001F50C4 14002226 */  addiu      $2, $17, 0x14
/* F51C8 001F50C8 A001A2AF */  sw         $2, 0x1A0($sp)
/* F51CC 001F50CC 0600A226 */  addiu      $2, $21, 0x6
/* F51D0 001F50D0 A401A2AF */  sw         $2, 0x1A4($sp)
/* F51D4 001F50D4 BC00A28F */  lw         $2, 0xBC($sp)
/* F51D8 001F50D8 A801A2AF */  sw         $2, 0x1A8($sp)
/* F51DC 001F50DC 06000224 */  addiu      $2, $0, 0x6
/* F51E0 001F50E0 AC01A2AF */  sw         $2, 0x1AC($sp)
/* F51E4 001F50E4 A001A427 */  addiu      $4, $sp, 0x1A0
/* F51E8 001F50E8 3001A527 */  addiu      $5, $sp, 0x130
/* F51EC 001F50EC 3401A627 */  addiu      $6, $sp, 0x134
/* F51F0 001F50F0 3801A727 */  addiu      $7, $sp, 0x138
/* F51F4 001F50F4 3C01A827 */  addiu      $8, $sp, 0x13C
/* F51F8 001F50F8 F4B4080C */  jal        DrawMenuColorGradation__FR8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBA
/* F51FC 001F50FC 00000000 */   nop
/* F5200 001F5100 4C002226 */  addiu      $2, $17, 0x4C
/* F5204 001F5104 21985600 */  addu       $19, $2, $22
/* F5208 001F5108 02000010 */  b          .L001F5114
/* F520C 001F510C 00000000 */   nop
.L001F5110:
/* F5210 001F5110 FFFF7326 */  addiu      $19, $19, -0x1
.L001F5114:
/* F5214 001F5114 FC00A28F */  lw         $2, 0xFC($sp)
/* F5218 001F5118 9A004224 */  addiu      $2, $2, 0x9A
/* F521C 001F511C 2A105300 */  slt        $2, $2, $19
/* F5220 001F5120 FBFF4014 */  bnez       $2, .L001F5110
/* F5224 001F5124 00000000 */   nop
/* F5228 001F5128 E000A28F */  lw         $2, 0xE0($sp)
/* F522C 001F512C 00004CC4 */  lwc1       $f12, 0x0($2)
/* F5230 001F5130 F0AA080C */  jal        GetDispVolumeForFloat__Ff
/* F5234 001F5134 00000000 */   nop
/* F5238 001F5138 4802A2AF */  sw         $2, 0x248($sp)
/* F523C 001F513C 0000CCC7 */  lwc1       $f12, 0x0($fp)
/* F5240 001F5140 F0AA080C */  jal        GetDispVolumeForFloat__Ff
/* F5244 001F5144 00000000 */   nop
/* F5248 001F5148 4C02A2AF */  sw         $2, 0x24C($sp)
/* F524C 001F514C 0600A626 */  addiu      $6, $21, 0x6
/* F5250 001F5150 4802A427 */  addiu      $4, $sp, 0x248
/* F5254 001F5154 282E6072 */  paddub     $5, $19, $0
/* F5258 001F5158 01000724 */  addiu      $7, $0, 0x1
/* F525C 001F515C 28468072 */  paddub     $8, $20, $0
/* F5260 001F5160 6C2C080C */  jal        DrawStatusNumberNowAndMax__FPiiiii
/* F5264 001F5164 00000000 */   nop
/* F5268 001F5168 1000B526 */  addiu      $21, $21, 0x10
/* F526C 001F516C C000A28F */  lw         $2, 0xC0($sp)
/* F5270 001F5170 10004224 */  addiu      $2, $2, 0x10
/* F5274 001F5174 C000A2AF */  sw         $2, 0xC0($sp)
/* F5278 001F5178 01005226 */  addiu      $18, $18, 0x1
.L001F517C:
/* F527C 001F517C 0200422A */  slti       $2, $18, 0x2
/* F5280 001F5180 4FFF4014 */  bnez       $2, .L001F4EC0
/* F5284 001F5184 00000000 */   nop
/* F5288 001F5188 D494828F */  lw         $2, -0x6B2C($gp)
/* F528C 001F518C 80981700 */  sll        $19, $23, 2
/* F5290 001F5190 21106202 */  addu       $2, $19, $2
/* F5294 001F5194 EC424CC4 */  lwc1       $f12, 0x42EC($2)
/* F5298 001F5198 2C44040C */  jal        fptosi
/* F529C 001F519C 00000000 */   nop
/* F52A0 001F51A0 0A000324 */  addiu      $3, $0, 0xA
/* F52A4 001F51A4 1A004300 */  div        $0, $2, $3
/* F52A8 001F51A8 02006014 */  bnez       $3, .L001F51B4
/* F52AC 001F51AC 00000000 */   nop
/* F52B0 001F51B0 CD010000 */  break      0, 7
.L001F51B4:
/* F52B4 001F51B4 12B80000 */  mflo       $23
/* F52B8 001F51B8 12003226 */  addiu      $18, $17, 0x12
/* F52BC 001F51BC 28B60070 */  paddub     $22, $0, $0
/* F52C0 001F51C0 17000010 */  b          .L001F5220
/* F52C4 001F51C4 00000000 */   nop
.L001F51C8:
/* F52C8 001F51C8 22000224 */  addiu      $2, $0, 0x22
/* F52CC 001F51CC C001A2AF */  sw         $2, 0x1C0($sp)
/* F52D0 001F51D0 9C000224 */  addiu      $2, $0, 0x9C
/* F52D4 001F51D4 C401A2AF */  sw         $2, 0x1C4($sp)
/* F52D8 001F51D8 12000324 */  addiu      $3, $0, 0x12
/* F52DC 001F51DC C801A3AF */  sw         $3, 0x1C8($sp)
/* F52E0 001F51E0 14000224 */  addiu      $2, $0, 0x14
/* F52E4 001F51E4 CC01A2AF */  sw         $2, 0x1CC($sp)
/* F52E8 001F51E8 B001B2AF */  sw         $18, 0x1B0($sp)
/* F52EC 001F51EC 0500A226 */  addiu      $2, $21, 0x5
/* F52F0 001F51F0 B401A2AF */  sw         $2, 0x1B4($sp)
/* F52F4 001F51F4 B801A3AF */  sw         $3, 0x1B8($sp)
/* F52F8 001F51F8 13000224 */  addiu      $2, $0, 0x13
/* F52FC 001F51FC BC01A2AF */  sw         $2, 0x1BC($sp)
/* F5300 001F5200 28260072 */  paddub     $4, $16, $0
/* F5304 001F5204 B001A527 */  addiu      $5, $sp, 0x1B0
/* F5308 001F5208 C001A627 */  addiu      $6, $sp, 0x1C0
/* F530C 001F520C 283E8072 */  paddub     $7, $20, $0
/* F5310 001F5210 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* F5314 001F5214 00000000 */   nop
/* F5318 001F5218 12005226 */  addiu      $18, $18, 0x12
/* F531C 001F521C 0100D626 */  addiu      $22, $22, 0x1
.L001F5220:
/* F5320 001F5220 FFFFE226 */  addiu      $2, $23, -0x1
/* F5324 001F5224 2A10C202 */  slt        $2, $22, $2
/* F5328 001F5228 E7FF4014 */  bnez       $2, .L001F51C8
/* F532C 001F522C 00000000 */   nop
/* F5330 001F5230 34000224 */  addiu      $2, $0, 0x34
/* F5334 001F5234 E001A2AF */  sw         $2, 0x1E0($sp)
/* F5338 001F5238 9C000224 */  addiu      $2, $0, 0x9C
/* F533C 001F523C E401A2AF */  sw         $2, 0x1E4($sp)
/* F5340 001F5240 18000424 */  addiu      $4, $0, 0x18
/* F5344 001F5244 E801A4AF */  sw         $4, 0x1E8($sp)
/* F5348 001F5248 14000324 */  addiu      $3, $0, 0x14
/* F534C 001F524C EC01A3AF */  sw         $3, 0x1EC($sp)
/* F5350 001F5250 D001B2AF */  sw         $18, 0x1D0($sp)
/* F5354 001F5254 0500A226 */  addiu      $2, $21, 0x5
/* F5358 001F5258 D401A2AF */  sw         $2, 0x1D4($sp)
/* F535C 001F525C D801A4AF */  sw         $4, 0x1D8($sp)
/* F5360 001F5260 DC01A3AF */  sw         $3, 0x1DC($sp)
/* F5364 001F5264 28260072 */  paddub     $4, $16, $0
/* F5368 001F5268 D001A527 */  addiu      $5, $sp, 0x1D0
/* F536C 001F526C E001A627 */  addiu      $6, $sp, 0x1E0
/* F5370 001F5270 283E8072 */  paddub     $7, $20, $0
/* F5374 001F5274 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* F5378 001F5278 00000000 */   nop
/* F537C 001F527C 80101400 */  sll        $2, $20, 2
/* F5380 001F5280 21105400 */  addu       $2, $2, $20
/* F5384 001F5284 00110200 */  sll        $2, $2, 4
/* F5388 001F5288 C3B10200 */  sra        $22, $2, 7
/* F538C 001F528C D494828F */  lw         $2, -0x6B2C($gp)
/* F5390 001F5290 21106202 */  addu       $2, $19, $2
/* F5394 001F5294 04434CC4 */  lwc1       $f12, 0x4304($2)
/* F5398 001F5298 2C44040C */  jal        fptosi
/* F539C 001F529C 00000000 */   nop
/* F53A0 001F52A0 0A000324 */  addiu      $3, $0, 0xA
/* F53A4 001F52A4 1A004300 */  div        $0, $2, $3
/* F53A8 001F52A8 02006014 */  bnez       $3, .L001F52B4
/* F53AC 001F52AC 00000000 */   nop
/* F53B0 001F52B0 CD010000 */  break      0, 7
.L001F52B4:
/* F53B4 001F52B4 12900000 */  mflo       $18
/* F53B8 001F52B8 28A60070 */  paddub     $20, $0, $0
/* F53BC 001F52BC 18000010 */  b          .L001F5320
/* F53C0 001F52C0 00000000 */   nop
.L001F52C4:
/* F53C4 001F52C4 0002A0AF */  sw         $0, 0x200($sp)
/* F53C8 001F52C8 88000224 */  addiu      $2, $0, 0x88
/* F53CC 001F52CC 0402A2AF */  sw         $2, 0x204($sp)
/* F53D0 001F52D0 10000524 */  addiu      $5, $0, 0x10
/* F53D4 001F52D4 0802A5AF */  sw         $5, 0x208($sp)
/* F53D8 001F52D8 14000424 */  addiu      $4, $0, 0x14
/* F53DC 001F52DC 0C02A4AF */  sw         $4, 0x20C($sp)
/* F53E0 001F52E0 13002326 */  addiu      $3, $17, 0x13
/* F53E4 001F52E4 C0101400 */  sll        $2, $20, 3
/* F53E8 001F52E8 21105400 */  addu       $2, $2, $20
/* F53EC 001F52EC 40100200 */  sll        $2, $2, 1
/* F53F0 001F52F0 21106200 */  addu       $2, $3, $2
/* F53F4 001F52F4 F001A2AF */  sw         $2, 0x1F0($sp)
/* F53F8 001F52F8 F401B5AF */  sw         $21, 0x1F4($sp)
/* F53FC 001F52FC F801A5AF */  sw         $5, 0x1F8($sp)
/* F5400 001F5300 FC01A4AF */  sw         $4, 0x1FC($sp)
/* F5404 001F5304 28260072 */  paddub     $4, $16, $0
/* F5408 001F5308 F001A527 */  addiu      $5, $sp, 0x1F0
/* F540C 001F530C 0002A627 */  addiu      $6, $sp, 0x200
/* F5410 001F5310 283EC072 */  paddub     $7, $22, $0
/* F5414 001F5314 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* F5418 001F5318 00000000 */   nop
/* F541C 001F531C 01009426 */  addiu      $20, $20, 0x1
.L001F5320:
/* F5420 001F5320 2A109202 */  slt        $2, $20, $18
/* F5424 001F5324 E7FF4014 */  bnez       $2, .L001F52C4
/* F5428 001F5328 00000000 */   nop
/* F542C 001F532C D494828F */  lw         $2, -0x6B2C($gp)
/* F5430 001F5330 21106202 */  addu       $2, $19, $2
/* F5434 001F5334 04434CC4 */  lwc1       $f12, 0x4304($2)
/* F5438 001F5338 2C44040C */  jal        fptosi
/* F543C 001F533C 00000000 */   nop
/* F5440 001F5340 0A000324 */  addiu      $3, $0, 0xA
/* F5444 001F5344 1A004300 */  div        $0, $2, $3
/* F5448 001F5348 00000000 */  nop
/* F544C 001F534C 00000000 */  nop
/* F5450 001F5350 10180000 */  mfhi       $3
/* F5454 001F5354 23006010 */  beqz       $3, .L001F53E4
/* F5458 001F5358 00000000 */   nop
/* F545C 001F535C 00008344 */  mtc1       $3, $f0
/* F5460 001F5360 00000000 */  nop
/* F5464 001F5364 60008046 */  cvt.s.w    $f1, $f0
/* F5468 001F5368 2040023C */  lui        $2, (0x40200000 >> 16)
/* F546C 001F536C 00008244 */  mtc1       $2, $f0
/* F5470 001F5370 00000000 */  nop
/* F5474 001F5374 030B0046 */  div.s      $f12, $f1, $f0
/* F5478 001F5378 2C44040C */  jal        fptosi
/* F547C 001F537C 00000000 */   nop
/* F5480 001F5380 03000324 */  addiu      $3, $0, 0x3
/* F5484 001F5384 23106200 */  subu       $2, $3, $2
/* F5488 001F5388 00110200 */  sll        $2, $2, 4
/* F548C 001F538C 2002A2AF */  sw         $2, 0x220($sp)
/* F5490 001F5390 88000224 */  addiu      $2, $0, 0x88
/* F5494 001F5394 2402A2AF */  sw         $2, 0x224($sp)
/* F5498 001F5398 10000524 */  addiu      $5, $0, 0x10
/* F549C 001F539C 2802A5AF */  sw         $5, 0x228($sp)
/* F54A0 001F53A0 14000424 */  addiu      $4, $0, 0x14
/* F54A4 001F53A4 2C02A4AF */  sw         $4, 0x22C($sp)
/* F54A8 001F53A8 13002326 */  addiu      $3, $17, 0x13
/* F54AC 001F53AC C0101200 */  sll        $2, $18, 3
/* F54B0 001F53B0 21105200 */  addu       $2, $2, $18
/* F54B4 001F53B4 40100200 */  sll        $2, $2, 1
/* F54B8 001F53B8 21106200 */  addu       $2, $3, $2
/* F54BC 001F53BC 1002A2AF */  sw         $2, 0x210($sp)
/* F54C0 001F53C0 1402B5AF */  sw         $21, 0x214($sp)
/* F54C4 001F53C4 1802A5AF */  sw         $5, 0x218($sp)
/* F54C8 001F53C8 1C02A4AF */  sw         $4, 0x21C($sp)
/* F54CC 001F53CC 28260072 */  paddub     $4, $16, $0
/* F54D0 001F53D0 1002A527 */  addiu      $5, $sp, 0x210
/* F54D4 001F53D4 2002A627 */  addiu      $6, $sp, 0x220
/* F54D8 001F53D8 283EC072 */  paddub     $7, $22, $0
/* F54DC 001F53DC C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* F54E0 001F53E0 00000000 */   nop
.L001F53E4:
/* F54E4 001F53E4 A000BF7B */  lq         $31, 0xA0($sp)
/* F54E8 001F53E8 9000BE7B */  lq         $fp, 0x90($sp)
/* F54EC 001F53EC 8000B77B */  lq         $23, 0x80($sp)
/* F54F0 001F53F0 7000B67B */  lq         $22, 0x70($sp)
/* F54F4 001F53F4 6000B57B */  lq         $21, 0x60($sp)
/* F54F8 001F53F8 5000B47B */  lq         $20, 0x50($sp)
/* F54FC 001F53FC 4000B37B */  lq         $19, 0x40($sp)
/* F5500 001F5400 3000B27B */  lq         $18, 0x30($sp)
/* F5504 001F5404 2000B17B */  lq         $17, 0x20($sp)
/* F5508 001F5408 1000B07B */  lq         $16, 0x10($sp)
/* F550C 001F540C 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* F5510 001F5410 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* F5514 001F5414 5002BD27 */  addiu      $sp, $sp, 0x250
/* F5518 001F5418 0800E003 */  jr         $31
/* F551C 001F541C 00000000 */   nop
