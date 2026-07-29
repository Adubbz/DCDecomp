.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Draw_Thunder__14CWeaponElementFv
/* 0BAE00 001BAD00 D0FEBD27 */  addiu       $29, $29, -0x130
/* 0BAE04 001BAD04 8000BF7F */  sq          $31, 0x80($29)
/* 0BAE08 001BAD08 7000B77F */  sq          $23, 0x70($29)
/* 0BAE0C 001BAD0C 6000B67F */  sq          $22, 0x60($29)
/* 0BAE10 001BAD10 5000B57F */  sq          $21, 0x50($29)
/* 0BAE14 001BAD14 4000B47F */  sq          $20, 0x40($29)
/* 0BAE18 001BAD18 3000B37F */  sq          $19, 0x30($29)
/* 0BAE1C 001BAD1C 2000B27F */  sq          $18, 0x20($29)
/* 0BAE20 001BAD20 1000B17F */  sq          $17, 0x10($29)
/* 0BAE24 001BAD24 0000B07F */  sq          $16, 0x0($29)
/* 0BAE28 001BAD28 28AE8070 */  paddub      $21, $4, $0
/* 0BAE2C 001BAD2C C701023C */  lui         $2, %hi(TexManager)
/* 0BAE30 001BAD30 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0BAE34 001BAD34 2A00023C */  lui         $2, %hi(LIT_1182)
/* 0BAE38 001BAD38 88BC4524 */  addiu       $5, $2, %lo(LIT_1182)
/* 0BAE3C 001BAD3C FFFF0624 */  addiu       $6, $0, -0x1
/* 0BAE40 001BAD40 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0BAE44 001BAD44 00000000 */   nop
/* 0BAE48 001BAD48 28864070 */  paddub      $16, $2, $0
/* 0BAE4C 001BAD4C D000A427 */  addiu       $4, $29, 0xD0
/* 0BAE50 001BAD50 0000A58E */  lw          $5, 0x0($21)
/* 0BAE54 001BAD54 0C86040C */  jal         sceVu0CopyVector
/* 0BAE58 001BAD58 00000000 */   nop
/* 0BAE5C 001BAD5C 288E0070 */  paddub      $17, $0, $0
/* 0BAE60 001BAD60 3F000010 */  b           .L001BAE60
/* 0BAE64 001BAD64 00000000 */   nop
.L001BAD68:
/* 0BAE68 001BAD68 80181100 */  sll         $3, $17, 2
/* 0BAE6C 001BAD6C 21187500 */  addu        $3, $3, $21
/* 0BAE70 001BAD70 20057324 */  addiu       $19, $3, 0x520
/* 0BAE74 001BAD74 200561C4 */  lwc1        $f1, 0x520($3)
/* 0BAE78 001BAD78 00008044 */  mtc1        $0, $f0
/* 0BAE7C 001BAD7C 00000000 */  nop
/* 0BAE80 001BAD80 36080046 */  c.le.s      $f1, $f0
/* 0BAE84 001BAD84 00000000 */  nop
/* 0BAE88 001BAD88 34000145 */  bc1t        .L001BAE5C
/* 0BAE8C 001BAD8C 00000000 */   nop
/* 0BAE90 001BAD90 200461C4 */  lwc1        $f1, 0x420($3)
/* 0BAE94 001BAD94 A00460C4 */  lwc1        $f0, 0x4A0($3)
/* 0BAE98 001BAD98 020B0046 */  mul.s       $f12, $f1, $f0
/* 0BAE9C 001BAD9C C000B227 */  addiu       $18, $29, 0xC0
/* 0BAEA0 001BADA0 00111100 */  sll         $2, $17, 4
/* 0BAEA4 001BADA4 2118A202 */  addu        $3, $21, $2
/* 0BAEA8 001BADA8 0040023C */  lui         $2, (0x40000000 >> 16)
/* 0BAEAC 001BADAC 00008244 */  mtc1        $2, $f0
/* 0BAEB0 001BADB0 00000000 */  nop
/* 0BAEB4 001BADB4 43630046 */  div.s       $f13, $f12, $f0
/* 0BAEB8 001BADB8 9000A427 */  addiu       $4, $29, 0x90
/* 0BAEBC 001BADBC 282E4072 */  paddub      $5, $18, $0
/* 0BAEC0 001BADC0 20006624 */  addiu       $6, $3, 0x20
/* 0BAEC4 001BADC4 283E0070 */  paddub      $7, $0, $0
/* 0BAEC8 001BADC8 D0B9040C */  jal         MGRotTransPers3DSprite__FPiPiPfffi
/* 0BAECC 001BADCC 00000000 */   nop
/* 0BAED0 001BADD0 01000324 */  addiu       $3, $0, 0x1
/* 0BAED4 001BADD4 21004314 */  bne         $2, $3, .L001BAE5C
/* 0BAED8 001BADD8 00000000 */   nop
/* 0BAEDC 001BADDC 0000428E */  lw          $2, 0x0($18)
/* 0BAEE0 001BADE0 A000B427 */  addiu       $20, $29, 0xA0
/* 0BAEE4 001BADE4 000082AE */  sw          $2, 0x0($20)
/* 0BAEE8 001BADE8 9400A28F */  lw          $2, 0x94($29)
/* 0BAEEC 001BADEC A400A2AF */  sw          $2, 0xA4($29)
/* 0BAEF0 001BADF0 9800A28F */  lw          $2, 0x98($29)
/* 0BAEF4 001BADF4 A800A2AF */  sw          $2, 0xA8($29)
/* 0BAEF8 001BADF8 9000A28F */  lw          $2, 0x90($29)
/* 0BAEFC 001BADFC B000B627 */  addiu       $22, $29, 0xB0
/* 0BAF00 001BAE00 0000C2AE */  sw          $2, 0x0($22)
/* 0BAF04 001BAE04 C400A28F */  lw          $2, 0xC4($29)
/* 0BAF08 001BAE08 B400A2AF */  sw          $2, 0xB4($29)
/* 0BAF0C 001BAE0C C800A28F */  lw          $2, 0xC8($29)
/* 0BAF10 001BAE10 B800A2AF */  sw          $2, 0xB8($29)
/* 0BAF14 001BAE14 1001A0AF */  sw          $0, 0x110($29)
/* 0BAF18 001BAE18 1401A0AF */  sw          $0, 0x114($29)
/* 0BAF1C 001BAE1C 30000224 */  addiu       $2, $0, 0x30
/* 0BAF20 001BAE20 1801A2AF */  sw          $2, 0x118($29)
/* 0BAF24 001BAE24 1C01A2AF */  sw          $2, 0x11C($29)
/* 0BAF28 001BAE28 00006CC6 */  lwc1        $f12, 0x0($19)
/* 0BAF2C 001BAE2C 5044040C */  jal         fptoui
/* 0BAF30 001BAE30 00000000 */   nop
/* 0BAF34 001BAE34 D48B848F */  lw          $4, -0x742C($28)
/* 0BAF38 001BAE38 282E0072 */  paddub      $5, $16, $0
/* 0BAF3C 001BAE3C 1001A627 */  addiu       $6, $29, 0x110
/* 0BAF40 001BAE40 9000A727 */  addiu       $7, $29, 0x90
/* 0BAF44 001BAE44 28468072 */  paddub      $8, $20, $0
/* 0BAF48 001BAE48 284EC072 */  paddub      $9, $22, $0
/* 0BAF4C 001BAE4C 28564072 */  paddub      $10, $18, $0
/* 0BAF50 001BAE50 285E4070 */  paddub      $11, $2, $0
/* 0BAF54 001BAE54 1C75050C */  jal         set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc
/* 0BAF58 001BAE58 00000000 */   nop
.L001BAE5C:
/* 0BAF5C 001BAE5C 01003126 */  addiu       $17, $17, 0x1
.L001BAE60:
/* 0BAF60 001BAE60 AE05A386 */  lh          $3, 0x5AE($21)
/* 0BAF64 001BAE64 2A182302 */  slt         $3, $17, $3
/* 0BAF68 001BAE68 BFFF6014 */  bnez        $3, .L001BAD68
/* 0BAF6C 001BAE6C 00000000 */   nop
/* 0BAF70 001BAE70 2700033C */  lui         $3, %hi(LIT_1497__2)
/* 0BAF74 001BAE74 C0B26324 */  addiu       $3, $3, %lo(LIT_1497__2)
/* 0BAF78 001BAE78 E000A527 */  addiu       $5, $29, 0xE0
/* 0BAF7C 001BAE7C 00006478 */  lq          $4, 0x0($3)
/* 0BAF80 001BAE80 10006378 */  lq          $3, 0x10($3)
/* 0BAF84 001BAE84 0000A47C */  sq          $4, 0x0($5)
/* 0BAF88 001BAE88 1000A37C */  sq          $3, 0x10($5)
/* 0BAF8C 001BAE8C 288E0070 */  paddub      $17, $0, $0
/* 0BAF90 001BAE90 62000010 */  b           .L001BB01C
/* 0BAF94 001BAE94 00000000 */   nop
.L001BAE98:
/* 0BAF98 001BAE98 40981100 */  sll         $19, $17, 1
/* 0BAF9C 001BAE9C 21107502 */  addu        $2, $19, $21
/* 0BAFA0 001BAEA0 3C075424 */  addiu       $20, $2, 0x73C
/* 0BAFA4 001BAEA4 3C074284 */  lh          $2, 0x73C($2)
/* 0BAFA8 001BAEA8 00110200 */  sll         $2, $2, 4
/* 0BAFAC 001BAEAC 2110A202 */  addu        $2, $21, $2
/* 0BAFB0 001BAEB0 0001A427 */  addiu       $4, $29, 0x100
/* 0BAFB4 001BAEB4 20004524 */  addiu       $5, $2, 0x20
/* 0BAFB8 001BAEB8 0C86040C */  jal         sceVu0CopyVector
/* 0BAFBC 001BAEBC 00000000 */   nop
/* 0BAFC0 001BAEC0 0401B227 */  addiu       $18, $29, 0x104
/* 0BAFC4 001BAEC4 000041C6 */  lwc1        $f1, 0x0($18)
/* 0BAFC8 001BAEC8 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0BAFCC 001BAECC 00008244 */  mtc1        $2, $f0
/* 0BAFD0 001BAED0 00000000 */  nop
/* 0BAFD4 001BAED4 00080046 */  add.s       $f0, $f1, $f0
/* 0BAFD8 001BAED8 000040E6 */  swc1        $f0, 0x0($18)
/* 0BAFDC 001BAEDC 9000A427 */  addiu       $4, $29, 0x90
/* 0BAFE0 001BAEE0 0001A527 */  addiu       $5, $29, 0x100
/* 0BAFE4 001BAEE4 28360070 */  paddub      $6, $0, $0
/* 0BAFE8 001BAEE8 A4B8040C */  jal         MGRotTransPers__FPiPfi
/* 0BAFEC 001BAEEC 00000000 */   nop
/* 0BAFF0 001BAEF0 000041C6 */  lwc1        $f1, 0x0($18)
/* 0BAFF4 001BAEF4 0040023C */  lui         $2, (0x40000000 >> 16)
/* 0BAFF8 001BAEF8 00008244 */  mtc1        $2, $f0
/* 0BAFFC 001BAEFC 00000000 */  nop
/* 0BB000 001BAF00 01080046 */  sub.s       $f0, $f1, $f0
/* 0BB004 001BAF04 000040E6 */  swc1        $f0, 0x0($18)
/* 0BB008 001BAF08 A000B627 */  addiu       $22, $29, 0xA0
/* 0BB00C 001BAF0C 2826C072 */  paddub      $4, $22, $0
/* 0BB010 001BAF10 0001A527 */  addiu       $5, $29, 0x100
/* 0BB014 001BAF14 28360070 */  paddub      $6, $0, $0
/* 0BB018 001BAF18 A4B8040C */  jal         MGRotTransPers__FPiPfi
/* 0BB01C 001BAF1C 00000000 */   nop
/* 0BB020 001BAF20 21107502 */  addu        $2, $19, $21
/* 0BB024 001BAF24 5C074284 */  lh          $2, 0x75C($2)
/* 0BB028 001BAF28 00110200 */  sll         $2, $2, 4
/* 0BB02C 001BAF2C 2110A202 */  addu        $2, $21, $2
/* 0BB030 001BAF30 0001A427 */  addiu       $4, $29, 0x100
/* 0BB034 001BAF34 20004524 */  addiu       $5, $2, 0x20
/* 0BB038 001BAF38 0C86040C */  jal         sceVu0CopyVector
/* 0BB03C 001BAF3C 00000000 */   nop
/* 0BB040 001BAF40 000041C6 */  lwc1        $f1, 0x0($18)
/* 0BB044 001BAF44 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0BB048 001BAF48 00008244 */  mtc1        $2, $f0
/* 0BB04C 001BAF4C 00000000 */  nop
/* 0BB050 001BAF50 00080046 */  add.s       $f0, $f1, $f0
/* 0BB054 001BAF54 000040E6 */  swc1        $f0, 0x0($18)
/* 0BB058 001BAF58 B000B727 */  addiu       $23, $29, 0xB0
/* 0BB05C 001BAF5C 2826E072 */  paddub      $4, $23, $0
/* 0BB060 001BAF60 0001A527 */  addiu       $5, $29, 0x100
/* 0BB064 001BAF64 28360070 */  paddub      $6, $0, $0
/* 0BB068 001BAF68 A4B8040C */  jal         MGRotTransPers__FPiPfi
/* 0BB06C 001BAF6C 00000000 */   nop
/* 0BB070 001BAF70 000041C6 */  lwc1        $f1, 0x0($18)
/* 0BB074 001BAF74 0040023C */  lui         $2, (0x40000000 >> 16)
/* 0BB078 001BAF78 00008244 */  mtc1        $2, $f0
/* 0BB07C 001BAF7C 00000000 */  nop
/* 0BB080 001BAF80 01080046 */  sub.s       $f0, $f1, $f0
/* 0BB084 001BAF84 000040E6 */  swc1        $f0, 0x0($18)
/* 0BB088 001BAF88 C000B227 */  addiu       $18, $29, 0xC0
/* 0BB08C 001BAF8C 28264072 */  paddub      $4, $18, $0
/* 0BB090 001BAF90 0001A527 */  addiu       $5, $29, 0x100
/* 0BB094 001BAF94 28360070 */  paddub      $6, $0, $0
/* 0BB098 001BAF98 A4B8040C */  jal         MGRotTransPers__FPiPfi
/* 0BB09C 001BAF9C 00000000 */   nop
/* 0BB0A0 001BAFA0 21107502 */  addu        $2, $19, $21
/* 0BB0A4 001BAFA4 9C074284 */  lh          $2, 0x79C($2)
/* 0BB0A8 001BAFA8 C0100200 */  sll         $2, $2, 3
/* 0BB0AC 001BAFAC 21105D00 */  addu        $2, $2, $29
/* 0BB0B0 001BAFB0 E000438C */  lw          $3, 0xE0($2)
/* 0BB0B4 001BAFB4 E400428C */  lw          $2, 0xE4($2)
/* 0BB0B8 001BAFB8 2001A3AF */  sw          $3, 0x120($29)
/* 0BB0BC 001BAFBC 2401A2AF */  sw          $2, 0x124($29)
/* 0BB0C0 001BAFC0 18000224 */  addiu       $2, $0, 0x18
/* 0BB0C4 001BAFC4 2801A2AF */  sw          $2, 0x128($29)
/* 0BB0C8 001BAFC8 68000224 */  addiu       $2, $0, 0x68
/* 0BB0CC 001BAFCC 2C01A2AF */  sw          $2, 0x12C($29)
/* 0BB0D0 001BAFD0 00008286 */  lh          $2, 0x0($20)
/* 0BB0D4 001BAFD4 80100200 */  sll         $2, $2, 2
/* 0BB0D8 001BAFD8 21105500 */  addu        $2, $2, $21
/* 0BB0DC 001BAFDC 348481C7 */  lwc1        $f1, -0x7BCC($28)
/* 0BB0E0 001BAFE0 200540C4 */  lwc1        $f0, 0x520($2)
/* 0BB0E4 001BAFE4 020B0046 */  mul.s       $f12, $f1, $f0
/* 0BB0E8 001BAFE8 5044040C */  jal         fptoui
/* 0BB0EC 001BAFEC 00000000 */   nop
/* 0BB0F0 001BAFF0 D48B848F */  lw          $4, -0x742C($28)
/* 0BB0F4 001BAFF4 282E0072 */  paddub      $5, $16, $0
/* 0BB0F8 001BAFF8 2001A627 */  addiu       $6, $29, 0x120
/* 0BB0FC 001BAFFC 9000A727 */  addiu       $7, $29, 0x90
/* 0BB100 001BB000 2846C072 */  paddub      $8, $22, $0
/* 0BB104 001BB004 284EE072 */  paddub      $9, $23, $0
/* 0BB108 001BB008 28564072 */  paddub      $10, $18, $0
/* 0BB10C 001BB00C 285E4070 */  paddub      $11, $2, $0
/* 0BB110 001BB010 1C75050C */  jal         set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc
/* 0BB114 001BB014 00000000 */   nop
/* 0BB118 001BB018 01003126 */  addiu       $17, $17, 0x1
.L001BB01C:
/* 0BB11C 001BB01C BC07A386 */  lh          $3, 0x7BC($21)
/* 0BB120 001BB020 2A182302 */  slt         $3, $17, $3
/* 0BB124 001BB024 9CFF6014 */  bnez        $3, .L001BAE98
/* 0BB128 001BB028 00000000 */   nop
/* 0BB12C 001BB02C 8000BF7B */  lq          $31, 0x80($29)
/* 0BB130 001BB030 7000B77B */  lq          $23, 0x70($29)
/* 0BB134 001BB034 6000B67B */  lq          $22, 0x60($29)
/* 0BB138 001BB038 5000B57B */  lq          $21, 0x50($29)
/* 0BB13C 001BB03C 4000B47B */  lq          $20, 0x40($29)
/* 0BB140 001BB040 3000B37B */  lq          $19, 0x30($29)
/* 0BB144 001BB044 2000B27B */  lq          $18, 0x20($29)
/* 0BB148 001BB048 1000B17B */  lq          $17, 0x10($29)
/* 0BB14C 001BB04C 0000B07B */  lq          $16, 0x0($29)
/* 0BB150 001BB050 3001BD27 */  addiu       $29, $29, 0x130
/* 0BB154 001BB054 0800E003 */  jr          $31
/* 0BB158 001BB058 00000000 */   nop
/* 0BB15C 001BB05C 00000000 */  nop
