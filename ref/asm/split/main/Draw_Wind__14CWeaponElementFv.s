.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Draw_Wind__14CWeaponElementFv
/* 0B9980 001B9880 70FEBD27 */  addiu       $29, $29, -0x190
/* 0B9984 001B9884 9000BF7F */  sq          $31, 0x90($29)
/* 0B9988 001B9888 8000B77F */  sq          $23, 0x80($29)
/* 0B998C 001B988C 7000B67F */  sq          $22, 0x70($29)
/* 0B9990 001B9890 6000B57F */  sq          $21, 0x60($29)
/* 0B9994 001B9894 5000B47F */  sq          $20, 0x50($29)
/* 0B9998 001B9898 4000B37F */  sq          $19, 0x40($29)
/* 0B999C 001B989C 3000B27F */  sq          $18, 0x30($29)
/* 0B99A0 001B98A0 2000B17F */  sq          $17, 0x20($29)
/* 0B99A4 001B98A4 1000B07F */  sq          $16, 0x10($29)
/* 0B99A8 001B98A8 0000B4E7 */  swc1        $f20, 0x0($29)
/* 0B99AC 001B98AC 28AE8070 */  paddub      $21, $4, $0
/* 0B99B0 001B98B0 C701023C */  lui         $2, %hi(TexManager)
/* 0B99B4 001B98B4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0B99B8 001B98B8 2A00023C */  lui         $2, %hi(LIT_1182)
/* 0B99BC 001B98BC 88BC4524 */  addiu       $5, $2, %lo(LIT_1182)
/* 0B99C0 001B98C0 FFFF0624 */  addiu       $6, $0, -0x1
/* 0B99C4 001B98C4 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0B99C8 001B98C8 00000000 */   nop
/* 0B99CC 001B98CC 28864070 */  paddub      $16, $2, $0
/* 0B99D0 001B98D0 E000A427 */  addiu       $4, $29, 0xE0
/* 0B99D4 001B98D4 0000A58E */  lw          $5, 0x0($21)
/* 0B99D8 001B98D8 0C86040C */  jal         sceVu0CopyVector
/* 0B99DC 001B98DC 00000000 */   nop
/* 0B99E0 001B98E0 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 0B99E4 001B98E4 FC00A3AF */  sw          $3, 0xFC($29)
/* 0B99E8 001B98E8 288E0070 */  paddub      $17, $0, $0
/* 0B99EC 001B98EC 61000010 */  b           .L001B9A74
/* 0B99F0 001B98F0 00000000 */   nop
.L001B98F4:
/* 0B99F4 001B98F4 40181100 */  sll         $3, $17, 1
/* 0B99F8 001B98F8 21187500 */  addu        $3, $3, $21
/* 0B99FC 001B98FC FA067284 */  lh          $18, 0x6FA($3)
/* 0B9A00 001B9900 80981100 */  sll         $19, $17, 2
/* 0B9A04 001B9904 21187502 */  addu        $3, $19, $21
/* 0B9A08 001B9908 20057424 */  addiu       $20, $3, 0x520
/* 0B9A0C 001B990C 200561C4 */  lwc1        $f1, 0x520($3)
/* 0B9A10 001B9910 00008044 */  mtc1        $0, $f0
/* 0B9A14 001B9914 00000000 */  nop
/* 0B9A18 001B9918 36080046 */  c.le.s      $f1, $f0
/* 0B9A1C 001B991C 00000000 */  nop
/* 0B9A20 001B9920 53000145 */  bc1t        .L001B9A70
/* 0B9A24 001B9924 00000000 */   nop
/* 0B9A28 001B9928 200461C4 */  lwc1        $f1, 0x420($3)
/* 0B9A2C 001B992C A00460C4 */  lwc1        $f0, 0x4A0($3)
/* 0B9A30 001B9930 42080046 */  mul.s       $f1, $f1, $f0
/* 0B9A34 001B9934 B005A0C6 */  lwc1        $f0, 0x5B0($21)
/* 0B9A38 001B9938 02050146 */  mul.s       $f20, $f0, $f1
/* 0B9A3C 001B993C 0001A427 */  addiu       $4, $29, 0x100
/* 0B9A40 001B9940 2A86040C */  jal         sceVu0UnitMatrix
/* 0B9A44 001B9944 00000000 */   nop
/* 0B9A48 001B9948 21107502 */  addu        $2, $19, $21
/* 0B9A4C 001B994C 4001A427 */  addiu       $4, $29, 0x140
/* 0B9A50 001B9950 0001A527 */  addiu       $5, $29, 0x100
/* 0B9A54 001B9954 B4054CC4 */  lwc1        $f12, 0x5B4($2)
/* 0B9A58 001B9958 A686040C */  jal         sceVu0RotMatrixY
/* 0B9A5C 001B995C 00000000 */   nop
/* 0B9A60 001B9960 00111100 */  sll         $2, $17, 4
/* 0B9A64 001B9964 2110A202 */  addu        $2, $21, $2
/* 0B9A68 001B9968 F000A427 */  addiu       $4, $29, 0xF0
/* 0B9A6C 001B996C 4001A527 */  addiu       $5, $29, 0x140
/* 0B9A70 001B9970 20004624 */  addiu       $6, $2, 0x20
/* 0B9A74 001B9974 6285040C */  jal         sceVu0ApplyMatrix
/* 0B9A78 001B9978 00000000 */   nop
/* 0B9A7C 001B997C F000A1C7 */  lwc1        $f1, 0xF0($29)
/* 0B9A80 001B9980 E000A0C7 */  lwc1        $f0, 0xE0($29)
/* 0B9A84 001B9984 00080046 */  add.s       $f0, $f1, $f0
/* 0B9A88 001B9988 F000A0E7 */  swc1        $f0, 0xF0($29)
/* 0B9A8C 001B998C F400A1C7 */  lwc1        $f1, 0xF4($29)
/* 0B9A90 001B9990 E400A0C7 */  lwc1        $f0, 0xE4($29)
/* 0B9A94 001B9994 00080046 */  add.s       $f0, $f1, $f0
/* 0B9A98 001B9998 F400A0E7 */  swc1        $f0, 0xF4($29)
/* 0B9A9C 001B999C F800A1C7 */  lwc1        $f1, 0xF8($29)
/* 0B9AA0 001B99A0 E800A0C7 */  lwc1        $f0, 0xE8($29)
/* 0B9AA4 001B99A4 00080046 */  add.s       $f0, $f1, $f0
/* 0B9AA8 001B99A8 F800A0E7 */  swc1        $f0, 0xF8($29)
/* 0B9AAC 001B99AC D000B327 */  addiu       $19, $29, 0xD0
/* 0B9AB0 001B99B0 0040023C */  lui         $2, (0x40000000 >> 16)
/* 0B9AB4 001B99B4 00008244 */  mtc1        $2, $f0
/* 0B9AB8 001B99B8 00000000 */  nop
/* 0B9ABC 001B99BC 43A30046 */  div.s       $f13, $f20, $f0
/* 0B9AC0 001B99C0 A000A427 */  addiu       $4, $29, 0xA0
/* 0B9AC4 001B99C4 282E6072 */  paddub      $5, $19, $0
/* 0B9AC8 001B99C8 F000A627 */  addiu       $6, $29, 0xF0
/* 0B9ACC 001B99CC 06A30046 */  mov.s       $f12, $f20
/* 0B9AD0 001B99D0 283E0070 */  paddub      $7, $0, $0
/* 0B9AD4 001B99D4 D0B9040C */  jal         MGRotTransPers3DSprite__FPiPiPfffi
/* 0B9AD8 001B99D8 00000000 */   nop
/* 0B9ADC 001B99DC 01000324 */  addiu       $3, $0, 0x1
/* 0B9AE0 001B99E0 23004314 */  bne         $2, $3, .L001B9A70
/* 0B9AE4 001B99E4 00000000 */   nop
/* 0B9AE8 001B99E8 0000628E */  lw          $2, 0x0($19)
/* 0B9AEC 001B99EC B000B627 */  addiu       $22, $29, 0xB0
/* 0B9AF0 001B99F0 0000C2AE */  sw          $2, 0x0($22)
/* 0B9AF4 001B99F4 A400A28F */  lw          $2, 0xA4($29)
/* 0B9AF8 001B99F8 B400A2AF */  sw          $2, 0xB4($29)
/* 0B9AFC 001B99FC A800A28F */  lw          $2, 0xA8($29)
/* 0B9B00 001B9A00 B800A2AF */  sw          $2, 0xB8($29)
/* 0B9B04 001B9A04 A000A28F */  lw          $2, 0xA0($29)
/* 0B9B08 001B9A08 C000B727 */  addiu       $23, $29, 0xC0
/* 0B9B0C 001B9A0C 0000E2AE */  sw          $2, 0x0($23)
/* 0B9B10 001B9A10 D400A28F */  lw          $2, 0xD4($29)
/* 0B9B14 001B9A14 C400A2AF */  sw          $2, 0xC4($29)
/* 0B9B18 001B9A18 D800A28F */  lw          $2, 0xD8($29)
/* 0B9B1C 001B9A1C C800A2AF */  sw          $2, 0xC8($29)
/* 0B9B20 001B9A20 60000224 */  addiu       $2, $0, 0x60
/* 0B9B24 001B9A24 8001A2AF */  sw          $2, 0x180($29)
/* 0B9B28 001B9A28 8401B2AF */  sw          $18, 0x184($29)
/* 0B9B2C 001B9A2C 40000224 */  addiu       $2, $0, 0x40
/* 0B9B30 001B9A30 8801A2AF */  sw          $2, 0x188($29)
/* 0B9B34 001B9A34 30000224 */  addiu       $2, $0, 0x30
/* 0B9B38 001B9A38 8C01A2AF */  sw          $2, 0x18C($29)
/* 0B9B3C 001B9A3C 00008CC6 */  lwc1        $f12, 0x0($20)
/* 0B9B40 001B9A40 5044040C */  jal         fptoui
/* 0B9B44 001B9A44 00000000 */   nop
/* 0B9B48 001B9A48 D48B848F */  lw          $4, -0x742C($28)
/* 0B9B4C 001B9A4C 282E0072 */  paddub      $5, $16, $0
/* 0B9B50 001B9A50 8001A627 */  addiu       $6, $29, 0x180
/* 0B9B54 001B9A54 A000A727 */  addiu       $7, $29, 0xA0
/* 0B9B58 001B9A58 2846C072 */  paddub      $8, $22, $0
/* 0B9B5C 001B9A5C 284EE072 */  paddub      $9, $23, $0
/* 0B9B60 001B9A60 28566072 */  paddub      $10, $19, $0
/* 0B9B64 001B9A64 285E4070 */  paddub      $11, $2, $0
/* 0B9B68 001B9A68 1C75050C */  jal         set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc
/* 0B9B6C 001B9A6C 00000000 */   nop
.L001B9A70:
/* 0B9B70 001B9A70 01003126 */  addiu       $17, $17, 0x1
.L001B9A74:
/* 0B9B74 001B9A74 2000232A */  slti        $3, $17, 0x20
/* 0B9B78 001B9A78 9EFF6014 */  bnez        $3, .L001B98F4
/* 0B9B7C 001B9A7C 00000000 */   nop
/* 0B9B80 001B9A80 9000BF7B */  lq          $31, 0x90($29)
/* 0B9B84 001B9A84 8000B77B */  lq          $23, 0x80($29)
/* 0B9B88 001B9A88 7000B67B */  lq          $22, 0x70($29)
/* 0B9B8C 001B9A8C 6000B57B */  lq          $21, 0x60($29)
/* 0B9B90 001B9A90 5000B47B */  lq          $20, 0x50($29)
/* 0B9B94 001B9A94 4000B37B */  lq          $19, 0x40($29)
/* 0B9B98 001B9A98 3000B27B */  lq          $18, 0x30($29)
/* 0B9B9C 001B9A9C 2000B17B */  lq          $17, 0x20($29)
/* 0B9BA0 001B9AA0 1000B07B */  lq          $16, 0x10($29)
/* 0B9BA4 001B9AA4 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 0B9BA8 001B9AA8 9001BD27 */  addiu       $29, $29, 0x190
/* 0B9BAC 001B9AAC 0800E003 */  jr          $31
/* 0B9BB0 001B9AB0 00000000 */   nop
/* 0B9BB4 001B9AB4 00000000 */  nop
/* 0B9BB8 001B9AB8 00000000 */  nop
/* 0B9BBC 001B9ABC 00000000 */  nop
