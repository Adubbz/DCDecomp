.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Draw_Thunder__14CWeaponElementFv
/* BAE00 001BAD00 D0FEBD27 */  addiu      $sp, $sp, -0x130
/* BAE04 001BAD04 8000BF7F */  sq         $31, 0x80($sp)
/* BAE08 001BAD08 7000B77F */  sq         $23, 0x70($sp)
/* BAE0C 001BAD0C 6000B67F */  sq         $22, 0x60($sp)
/* BAE10 001BAD10 5000B57F */  sq         $21, 0x50($sp)
/* BAE14 001BAD14 4000B47F */  sq         $20, 0x40($sp)
/* BAE18 001BAD18 3000B37F */  sq         $19, 0x30($sp)
/* BAE1C 001BAD1C 2000B27F */  sq         $18, 0x20($sp)
/* BAE20 001BAD20 1000B17F */  sq         $17, 0x10($sp)
/* BAE24 001BAD24 0000B07F */  sq         $16, 0x0($sp)
/* BAE28 001BAD28 28AE8070 */  paddub     $21, $4, $0
/* BAE2C 001BAD2C C701023C */  lui        $2, %hi(TexManager)
/* BAE30 001BAD30 70584424 */  addiu      $4, $2, %lo(TexManager)
/* BAE34 001BAD34 2A00023C */  lui        $2, %hi(_1182)
/* BAE38 001BAD38 88BC4524 */  addiu      $5, $2, %lo(_1182)
/* BAE3C 001BAD3C FFFF0624 */  addiu      $6, $0, -0x1
/* BAE40 001BAD40 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* BAE44 001BAD44 00000000 */   nop
/* BAE48 001BAD48 28864070 */  paddub     $16, $2, $0
/* BAE4C 001BAD4C D000A427 */  addiu      $4, $sp, 0xD0
/* BAE50 001BAD50 0000A58E */  lw         $5, 0x0($21)
/* BAE54 001BAD54 0C86040C */  jal        sceVu0CopyVector
/* BAE58 001BAD58 00000000 */   nop
/* BAE5C 001BAD5C 288E0070 */  paddub     $17, $0, $0
/* BAE60 001BAD60 3F000010 */  b          .L001BAE60
/* BAE64 001BAD64 00000000 */   nop
.L001BAD68:
/* BAE68 001BAD68 80181100 */  sll        $3, $17, 2
/* BAE6C 001BAD6C 21187500 */  addu       $3, $3, $21
/* BAE70 001BAD70 20057324 */  addiu      $19, $3, 0x520
/* BAE74 001BAD74 200561C4 */  lwc1       $f1, 0x520($3)
/* BAE78 001BAD78 00008044 */  mtc1       $0, $f0
/* BAE7C 001BAD7C 00000000 */  nop
/* BAE80 001BAD80 36080046 */  c.le.s     $f1, $f0
/* BAE84 001BAD84 00000000 */  nop
/* BAE88 001BAD88 34000145 */  bc1t       .L001BAE5C
/* BAE8C 001BAD8C 00000000 */   nop
/* BAE90 001BAD90 200461C4 */  lwc1       $f1, 0x420($3)
/* BAE94 001BAD94 A00460C4 */  lwc1       $f0, 0x4A0($3)
/* BAE98 001BAD98 020B0046 */  mul.s      $f12, $f1, $f0
/* BAE9C 001BAD9C C000B227 */  addiu      $18, $sp, 0xC0
/* BAEA0 001BADA0 00111100 */  sll        $2, $17, 4
/* BAEA4 001BADA4 2118A202 */  addu       $3, $21, $2
/* BAEA8 001BADA8 0040023C */  lui        $2, (0x40000000 >> 16)
/* BAEAC 001BADAC 00008244 */  mtc1       $2, $f0
/* BAEB0 001BADB0 00000000 */  nop
/* BAEB4 001BADB4 43630046 */  div.s      $f13, $f12, $f0
/* BAEB8 001BADB8 9000A427 */  addiu      $4, $sp, 0x90
/* BAEBC 001BADBC 282E4072 */  paddub     $5, $18, $0
/* BAEC0 001BADC0 20006624 */  addiu      $6, $3, 0x20
/* BAEC4 001BADC4 283E0070 */  paddub     $7, $0, $0
/* BAEC8 001BADC8 D0B9040C */  jal        MGRotTransPers3DSprite__FPiPiPfffi
/* BAECC 001BADCC 00000000 */   nop
/* BAED0 001BADD0 01000324 */  addiu      $3, $0, 0x1
/* BAED4 001BADD4 21004314 */  bne        $2, $3, .L001BAE5C
/* BAED8 001BADD8 00000000 */   nop
/* BAEDC 001BADDC 0000428E */  lw         $2, 0x0($18)
/* BAEE0 001BADE0 A000B427 */  addiu      $20, $sp, 0xA0
/* BAEE4 001BADE4 000082AE */  sw         $2, 0x0($20)
/* BAEE8 001BADE8 9400A28F */  lw         $2, 0x94($sp)
/* BAEEC 001BADEC A400A2AF */  sw         $2, 0xA4($sp)
/* BAEF0 001BADF0 9800A28F */  lw         $2, 0x98($sp)
/* BAEF4 001BADF4 A800A2AF */  sw         $2, 0xA8($sp)
/* BAEF8 001BADF8 9000A28F */  lw         $2, 0x90($sp)
/* BAEFC 001BADFC B000B627 */  addiu      $22, $sp, 0xB0
/* BAF00 001BAE00 0000C2AE */  sw         $2, 0x0($22)
/* BAF04 001BAE04 C400A28F */  lw         $2, 0xC4($sp)
/* BAF08 001BAE08 B400A2AF */  sw         $2, 0xB4($sp)
/* BAF0C 001BAE0C C800A28F */  lw         $2, 0xC8($sp)
/* BAF10 001BAE10 B800A2AF */  sw         $2, 0xB8($sp)
/* BAF14 001BAE14 1001A0AF */  sw         $0, 0x110($sp)
/* BAF18 001BAE18 1401A0AF */  sw         $0, 0x114($sp)
/* BAF1C 001BAE1C 30000224 */  addiu      $2, $0, 0x30
/* BAF20 001BAE20 1801A2AF */  sw         $2, 0x118($sp)
/* BAF24 001BAE24 1C01A2AF */  sw         $2, 0x11C($sp)
/* BAF28 001BAE28 00006CC6 */  lwc1       $f12, 0x0($19)
/* BAF2C 001BAE2C 5044040C */  jal        fptoui
/* BAF30 001BAE30 00000000 */   nop
/* BAF34 001BAE34 D48B848F */  lw         $4, -0x742C($gp)
/* BAF38 001BAE38 282E0072 */  paddub     $5, $16, $0
/* BAF3C 001BAE3C 1001A627 */  addiu      $6, $sp, 0x110
/* BAF40 001BAE40 9000A727 */  addiu      $7, $sp, 0x90
/* BAF44 001BAE44 28468072 */  paddub     $8, $20, $0
/* BAF48 001BAE48 284EC072 */  paddub     $9, $22, $0
/* BAF4C 001BAE4C 28564072 */  paddub     $10, $18, $0
/* BAF50 001BAE50 285E4070 */  paddub     $11, $2, $0
/* BAF54 001BAE54 1C75050C */  jal        set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc
/* BAF58 001BAE58 00000000 */   nop
.L001BAE5C:
/* BAF5C 001BAE5C 01003126 */  addiu      $17, $17, 0x1
.L001BAE60:
/* BAF60 001BAE60 AE05A386 */  lh         $3, 0x5AE($21)
/* BAF64 001BAE64 2A182302 */  slt        $3, $17, $3
/* BAF68 001BAE68 BFFF6014 */  bnez       $3, .L001BAD68
/* BAF6C 001BAE6C 00000000 */   nop
/* BAF70 001BAE70 2700033C */  lui        $3, %hi(_1497_2)
/* BAF74 001BAE74 C0B26324 */  addiu      $3, $3, %lo(_1497_2)
/* BAF78 001BAE78 E000A527 */  addiu      $5, $sp, 0xE0
/* BAF7C 001BAE7C 00006478 */  lq         $4, 0x0($3)
/* BAF80 001BAE80 10006378 */  lq         $3, 0x10($3)
/* BAF84 001BAE84 0000A47C */  sq         $4, 0x0($5)
/* BAF88 001BAE88 1000A37C */  sq         $3, 0x10($5)
/* BAF8C 001BAE8C 288E0070 */  paddub     $17, $0, $0
/* BAF90 001BAE90 62000010 */  b          .L001BB01C
/* BAF94 001BAE94 00000000 */   nop
.L001BAE98:
/* BAF98 001BAE98 40981100 */  sll        $19, $17, 1
/* BAF9C 001BAE9C 21107502 */  addu       $2, $19, $21
/* BAFA0 001BAEA0 3C075424 */  addiu      $20, $2, 0x73C
/* BAFA4 001BAEA4 3C074284 */  lh         $2, 0x73C($2)
/* BAFA8 001BAEA8 00110200 */  sll        $2, $2, 4
/* BAFAC 001BAEAC 2110A202 */  addu       $2, $21, $2
/* BAFB0 001BAEB0 0001A427 */  addiu      $4, $sp, 0x100
/* BAFB4 001BAEB4 20004524 */  addiu      $5, $2, 0x20
/* BAFB8 001BAEB8 0C86040C */  jal        sceVu0CopyVector
/* BAFBC 001BAEBC 00000000 */   nop
/* BAFC0 001BAEC0 0401B227 */  addiu      $18, $sp, 0x104
/* BAFC4 001BAEC4 000041C6 */  lwc1       $f1, 0x0($18)
/* BAFC8 001BAEC8 803F023C */  lui        $2, (0x3F800000 >> 16)
/* BAFCC 001BAECC 00008244 */  mtc1       $2, $f0
/* BAFD0 001BAED0 00000000 */  nop
/* BAFD4 001BAED4 00080046 */  add.s      $f0, $f1, $f0
/* BAFD8 001BAED8 000040E6 */  swc1       $f0, 0x0($18)
/* BAFDC 001BAEDC 9000A427 */  addiu      $4, $sp, 0x90
/* BAFE0 001BAEE0 0001A527 */  addiu      $5, $sp, 0x100
/* BAFE4 001BAEE4 28360070 */  paddub     $6, $0, $0
/* BAFE8 001BAEE8 A4B8040C */  jal        MGRotTransPers__FPiPfi
/* BAFEC 001BAEEC 00000000 */   nop
/* BAFF0 001BAEF0 000041C6 */  lwc1       $f1, 0x0($18)
/* BAFF4 001BAEF4 0040023C */  lui        $2, (0x40000000 >> 16)
/* BAFF8 001BAEF8 00008244 */  mtc1       $2, $f0
/* BAFFC 001BAEFC 00000000 */  nop
/* BB000 001BAF00 01080046 */  sub.s      $f0, $f1, $f0
/* BB004 001BAF04 000040E6 */  swc1       $f0, 0x0($18)
/* BB008 001BAF08 A000B627 */  addiu      $22, $sp, 0xA0
/* BB00C 001BAF0C 2826C072 */  paddub     $4, $22, $0
/* BB010 001BAF10 0001A527 */  addiu      $5, $sp, 0x100
/* BB014 001BAF14 28360070 */  paddub     $6, $0, $0
/* BB018 001BAF18 A4B8040C */  jal        MGRotTransPers__FPiPfi
/* BB01C 001BAF1C 00000000 */   nop
/* BB020 001BAF20 21107502 */  addu       $2, $19, $21
/* BB024 001BAF24 5C074284 */  lh         $2, 0x75C($2)
/* BB028 001BAF28 00110200 */  sll        $2, $2, 4
/* BB02C 001BAF2C 2110A202 */  addu       $2, $21, $2
/* BB030 001BAF30 0001A427 */  addiu      $4, $sp, 0x100
/* BB034 001BAF34 20004524 */  addiu      $5, $2, 0x20
/* BB038 001BAF38 0C86040C */  jal        sceVu0CopyVector
/* BB03C 001BAF3C 00000000 */   nop
/* BB040 001BAF40 000041C6 */  lwc1       $f1, 0x0($18)
/* BB044 001BAF44 803F023C */  lui        $2, (0x3F800000 >> 16)
/* BB048 001BAF48 00008244 */  mtc1       $2, $f0
/* BB04C 001BAF4C 00000000 */  nop
/* BB050 001BAF50 00080046 */  add.s      $f0, $f1, $f0
/* BB054 001BAF54 000040E6 */  swc1       $f0, 0x0($18)
/* BB058 001BAF58 B000B727 */  addiu      $23, $sp, 0xB0
/* BB05C 001BAF5C 2826E072 */  paddub     $4, $23, $0
/* BB060 001BAF60 0001A527 */  addiu      $5, $sp, 0x100
/* BB064 001BAF64 28360070 */  paddub     $6, $0, $0
/* BB068 001BAF68 A4B8040C */  jal        MGRotTransPers__FPiPfi
/* BB06C 001BAF6C 00000000 */   nop
/* BB070 001BAF70 000041C6 */  lwc1       $f1, 0x0($18)
/* BB074 001BAF74 0040023C */  lui        $2, (0x40000000 >> 16)
/* BB078 001BAF78 00008244 */  mtc1       $2, $f0
/* BB07C 001BAF7C 00000000 */  nop
/* BB080 001BAF80 01080046 */  sub.s      $f0, $f1, $f0
/* BB084 001BAF84 000040E6 */  swc1       $f0, 0x0($18)
/* BB088 001BAF88 C000B227 */  addiu      $18, $sp, 0xC0
/* BB08C 001BAF8C 28264072 */  paddub     $4, $18, $0
/* BB090 001BAF90 0001A527 */  addiu      $5, $sp, 0x100
/* BB094 001BAF94 28360070 */  paddub     $6, $0, $0
/* BB098 001BAF98 A4B8040C */  jal        MGRotTransPers__FPiPfi
/* BB09C 001BAF9C 00000000 */   nop
/* BB0A0 001BAFA0 21107502 */  addu       $2, $19, $21
/* BB0A4 001BAFA4 9C074284 */  lh         $2, 0x79C($2)
/* BB0A8 001BAFA8 C0100200 */  sll        $2, $2, 3
/* BB0AC 001BAFAC 21105D00 */  addu       $2, $2, $sp
/* BB0B0 001BAFB0 E000438C */  lw         $3, 0xE0($2)
/* BB0B4 001BAFB4 E400428C */  lw         $2, 0xE4($2)
/* BB0B8 001BAFB8 2001A3AF */  sw         $3, 0x120($sp)
/* BB0BC 001BAFBC 2401A2AF */  sw         $2, 0x124($sp)
/* BB0C0 001BAFC0 18000224 */  addiu      $2, $0, 0x18
/* BB0C4 001BAFC4 2801A2AF */  sw         $2, 0x128($sp)
/* BB0C8 001BAFC8 68000224 */  addiu      $2, $0, 0x68
/* BB0CC 001BAFCC 2C01A2AF */  sw         $2, 0x12C($sp)
/* BB0D0 001BAFD0 00008286 */  lh         $2, 0x0($20)
/* BB0D4 001BAFD4 80100200 */  sll        $2, $2, 2
/* BB0D8 001BAFD8 21105500 */  addu       $2, $2, $21
/* BB0DC 001BAFDC 348481C7 */  lwc1       $f1, -0x7BCC($gp)
/* BB0E0 001BAFE0 200540C4 */  lwc1       $f0, 0x520($2)
/* BB0E4 001BAFE4 020B0046 */  mul.s      $f12, $f1, $f0
/* BB0E8 001BAFE8 5044040C */  jal        fptoui
/* BB0EC 001BAFEC 00000000 */   nop
/* BB0F0 001BAFF0 D48B848F */  lw         $4, -0x742C($gp)
/* BB0F4 001BAFF4 282E0072 */  paddub     $5, $16, $0
/* BB0F8 001BAFF8 2001A627 */  addiu      $6, $sp, 0x120
/* BB0FC 001BAFFC 9000A727 */  addiu      $7, $sp, 0x90
/* BB100 001BB000 2846C072 */  paddub     $8, $22, $0
/* BB104 001BB004 284EE072 */  paddub     $9, $23, $0
/* BB108 001BB008 28564072 */  paddub     $10, $18, $0
/* BB10C 001BB00C 285E4070 */  paddub     $11, $2, $0
/* BB110 001BB010 1C75050C */  jal        set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc
/* BB114 001BB014 00000000 */   nop
/* BB118 001BB018 01003126 */  addiu      $17, $17, 0x1
.L001BB01C:
/* BB11C 001BB01C BC07A386 */  lh         $3, 0x7BC($21)
/* BB120 001BB020 2A182302 */  slt        $3, $17, $3
/* BB124 001BB024 9CFF6014 */  bnez       $3, .L001BAE98
/* BB128 001BB028 00000000 */   nop
/* BB12C 001BB02C 8000BF7B */  lq         $31, 0x80($sp)
/* BB130 001BB030 7000B77B */  lq         $23, 0x70($sp)
/* BB134 001BB034 6000B67B */  lq         $22, 0x60($sp)
/* BB138 001BB038 5000B57B */  lq         $21, 0x50($sp)
/* BB13C 001BB03C 4000B47B */  lq         $20, 0x40($sp)
/* BB140 001BB040 3000B37B */  lq         $19, 0x30($sp)
/* BB144 001BB044 2000B27B */  lq         $18, 0x20($sp)
/* BB148 001BB048 1000B17B */  lq         $17, 0x10($sp)
/* BB14C 001BB04C 0000B07B */  lq         $16, 0x0($sp)
/* BB150 001BB050 3001BD27 */  addiu      $sp, $sp, 0x130
/* BB154 001BB054 0800E003 */  jr         $31
/* BB158 001BB058 00000000 */   nop
/* BB15C 001BB05C 00000000 */  nop
