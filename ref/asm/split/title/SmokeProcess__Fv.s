.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SmokeProcess__Fv
/* 00AC40 01DB6940 C0FEBD27 */  addiu       $29, $29, -0x140
/* 00AC44 01DB6944 1000BF7F */  sq          $31, 0x10($29)
/* 00AC48 01DB6948 0000B07F */  sq          $16, 0x0($29)
/* 00AC4C 01DB694C 28998283 */  lb          $2, -0x66D8($28)
/* 00AC50 01DB6950 04004014 */  bnez        $2, .L01DB6964_2BC164
/* 00AC54 01DB6954 00000000 */   nop
/* 00AC58 01DB6958 249980AF */  sw          $0, -0x66DC($28)
/* 00AC5C 01DB695C 01000224 */  addiu       $2, $0, 0x1
/* 00AC60 01DB6960 289982A3 */  sb          $2, -0x66D8($28)
.L01DB6964_2BC164:
/* 00AC64 01DB6964 2499828F */  lw          $2, -0x66DC($28)
/* 00AC68 01DB6968 01004224 */  addiu       $2, $2, 0x1
/* 00AC6C 01DB696C 249982AF */  sw          $2, -0x66DC($28)
/* 00AC70 01DB6970 2499828F */  lw          $2, -0x66DC($28)
/* 00AC74 01DB6974 08004128 */  slti        $1, $2, 0x8
/* 00AC78 01DB6978 02002014 */  bnez        $1, .L01DB6984_2BC184
/* 00AC7C 01DB697C 00000000 */   nop
/* 00AC80 01DB6980 249980AF */  sw          $0, -0x66DC($28)
.L01DB6984_2BC184:
/* 00AC84 01DB6984 EC00A0AF */  sw          $0, 0xEC($29)
/* 00AC88 01DB6988 E800A0AF */  sw          $0, 0xE8($29)
/* 00AC8C 01DB698C E400A0AF */  sw          $0, 0xE4($29)
/* 00AC90 01DB6990 E000B027 */  addiu       $16, $29, 0xE0
/* 00AC94 01DB6994 000000AE */  sw          $0, 0x0($16)
/* 00AC98 01DB6998 2000A427 */  addiu       $4, $29, 0x20
/* 00AC9C 01DB699C DC91050C */  jal         Initialize__12CEffectParamFv
/* 00ACA0 01DB69A0 00000000 */   nop
/* 00ACA4 01DB69A4 2499828F */  lw          $2, -0x66DC($28)
/* 00ACA8 01DB69A8 70004014 */  bnez        $2, .L01DB6B6C_2BC36C
/* 00ACAC 01DB69AC 00000000 */   nop
/* 00ACB0 01DB69B0 DD01023C */  lui         $2, %hi(LIT_688__3)
/* 00ACB4 01DB69B4 70664224 */  addiu       $2, $2, %lo(LIT_688__3)
/* 00ACB8 01DB69B8 0001A527 */  addiu       $5, $29, 0x100
/* 00ACBC 01DB69BC 00004278 */  lq          $2, 0x0($2)
/* 00ACC0 01DB69C0 0000A27C */  sq          $2, 0x0($5)
/* 00ACC4 01DB69C4 DD01023C */  lui         $2, %hi(LIT_689__4)
/* 00ACC8 01DB69C8 80664224 */  addiu       $2, $2, %lo(LIT_689__4)
/* 00ACCC 01DB69CC 1001A627 */  addiu       $6, $29, 0x110
/* 00ACD0 01DB69D0 00004278 */  lq          $2, 0x0($2)
/* 00ACD4 01DB69D4 0000C27C */  sq          $2, 0x0($6)
/* 00ACD8 01DB69D8 DE01013C */  lui         $1, %hi(CScript__2)
/* 00ACDC 01DB69DC 001B238C */  lw          $3, %lo(CScript__2)($1)
/* 00ACE0 01DB69E0 13000224 */  addiu       $2, $0, 0x13
/* 00ACE4 01DB69E4 06006210 */  beq         $3, $2, .L01DB6A00_2BC200
/* 00ACE8 01DB69E8 00000000 */   nop
/* 00ACEC 01DB69EC 4000A427 */  addiu       $4, $29, 0x40
/* 00ACF0 01DB69F0 0C86040C */  jal         sceVu0CopyVector
/* 00ACF4 01DB69F4 00000000 */   nop
/* 00ACF8 01DB69F8 05000010 */  b           .L01DB6A10_2BC210
/* 00ACFC 01DB69FC 00000000 */   nop
.L01DB6A00_2BC200:
/* 00AD00 01DB6A00 4000A427 */  addiu       $4, $29, 0x40
/* 00AD04 01DB6A04 282EC070 */  paddub      $5, $6, $0
/* 00AD08 01DB6A08 0C86040C */  jal         sceVu0CopyVector
/* 00AD0C 01DB6A0C 00000000 */   nop
.L01DB6A10_2BC210:
/* 00AD10 01DB6A10 01000224 */  addiu       $2, $0, 0x1
/* 00AD14 01DB6A14 2400A2AF */  sw          $2, 0x24($29)
/* 00AD18 01DB6A18 BE11040C */  jal         rand
/* 00AD1C 01DB6A1C 00000000 */   nop
/* 00AD20 01DB6A20 00008244 */  mtc1        $2, $f0
/* 00AD24 01DB6A24 00000000 */  nop
/* 00AD28 01DB6A28 60008046 */  cvt.s.w     $f1, $f0
/* 00AD2C 01DB6A2C 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 00AD30 01DB6A30 00008244 */  mtc1        $2, $f0
/* 00AD34 01DB6A34 00000000 */  nop
/* 00AD38 01DB6A38 42000146 */  mul.s       $f1, $f0, $f1
/* 00AD3C 01DB6A3C 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 00AD40 01DB6A40 00008244 */  mtc1        $2, $f0
/* 00AD44 01DB6A44 00000000 */  nop
/* 00AD48 01DB6A48 03080046 */  div.s       $f0, $f1, $f0
/* 00AD4C 01DB6A4C 7000A0E7 */  swc1        $f0, 0x70($29)
/* 00AD50 01DB6A50 BE11040C */  jal         rand
/* 00AD54 01DB6A54 00000000 */   nop
/* 00AD58 01DB6A58 80180200 */  sll         $3, $2, 2
/* 00AD5C 01DB6A5C 21106200 */  addu        $2, $3, $2
/* 00AD60 01DB6A60 40100200 */  sll         $2, $2, 1
/* 00AD64 01DB6A64 00008244 */  mtc1        $2, $f0
/* 00AD68 01DB6A68 00000000 */  nop
/* 00AD6C 01DB6A6C 60008046 */  cvt.s.w     $f1, $f0
/* 00AD70 01DB6A70 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 00AD74 01DB6A74 00008244 */  mtc1        $2, $f0
/* 00AD78 01DB6A78 00000000 */  nop
/* 00AD7C 01DB6A7C 43080046 */  div.s       $f1, $f1, $f0
/* 00AD80 01DB6A80 A041023C */  lui         $2, (0x41A00000 >> 16)
/* 00AD84 01DB6A84 00008244 */  mtc1        $2, $f0
/* 00AD88 01DB6A88 00000000 */  nop
/* 00AD8C 01DB6A8C 40000146 */  add.s       $f1, $f0, $f1
/* 00AD90 01DB6A90 B08080C7 */  lwc1        $f0, -0x7F50($28)
/* 00AD94 01DB6A94 03000146 */  div.s       $f0, $f0, $f1
/* 00AD98 01DB6A98 8000A0E7 */  swc1        $f0, 0x80($29)
/* 00AD9C 01DB6A9C 02000224 */  addiu       $2, $0, 0x2
/* 00ADA0 01DB6AA0 D000A2AF */  sw          $2, 0xD0($29)
/* 00ADA4 01DB6AA4 D400A2AF */  sw          $2, 0xD4($29)
/* 00ADA8 01DB6AA8 E88380C7 */  lwc1        $f0, -0x7C18($28)
/* 00ADAC 01DB6AAC D800A0E7 */  swc1        $f0, 0xD8($29)
/* 00ADB0 01DB6AB0 BE11040C */  jal         rand
/* 00ADB4 01DB6AB4 00000000 */   nop
/* 00ADB8 01DB6AB8 00008244 */  mtc1        $2, $f0
/* 00ADBC 01DB6ABC 00000000 */  nop
/* 00ADC0 01DB6AC0 60008046 */  cvt.s.w     $f1, $f0
/* 00ADC4 01DB6AC4 9C8280C7 */  lwc1        $f0, -0x7D64($28)
/* 00ADC8 01DB6AC8 42000146 */  mul.s       $f1, $f0, $f1
/* 00ADCC 01DB6ACC 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 00ADD0 01DB6AD0 00008244 */  mtc1        $2, $f0
/* 00ADD4 01DB6AD4 00000000 */  nop
/* 00ADD8 01DB6AD8 43080046 */  div.s       $f1, $f1, $f0
/* 00ADDC 01DB6ADC C03F023C */  lui         $2, (0x3FC00000 >> 16)
/* 00ADE0 01DB6AE0 00008244 */  mtc1        $2, $f0
/* 00ADE4 01DB6AE4 00000000 */  nop
/* 00ADE8 01DB6AE8 00000146 */  add.s       $f0, $f0, $f1
/* 00ADEC 01DB6AEC 5400A0E7 */  swc1        $f0, 0x54($29)
/* 00ADF0 01DB6AF0 048280C7 */  lwc1        $f0, -0x7DFC($28)
/* 00ADF4 01DB6AF4 A000A0E7 */  swc1        $f0, 0xA0($29)
/* 00ADF8 01DB6AF8 A400A0E7 */  swc1        $f0, 0xA4($29)
/* 00ADFC 01DB6AFC 78000224 */  addiu       $2, $0, 0x78
/* 00AE00 01DB6B00 2000A2AF */  sw          $2, 0x20($29)
/* 00AE04 01DB6B04 C701023C */  lui         $2, %hi(TexManager)
/* 00AE08 01DB6B08 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00AE0C 01DB6B0C DE01023C */  lui         $2, %hi(LIT_704__4)
/* 00AE10 01DB6B10 B8DD4524 */  addiu       $5, $2, %lo(LIT_704__4)
/* 00AE14 01DB6B14 FFFF0624 */  addiu       $6, $0, -0x1
/* 00AE18 01DB6B18 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 00AE1C 01DB6B1C 00000000 */   nop
/* 00AE20 01DB6B20 DC00A2AF */  sw          $2, 0xDC($29)
/* 00AE24 01DB6B24 3001A0AF */  sw          $0, 0x130($29)
/* 00AE28 01DB6B28 3401A0AF */  sw          $0, 0x134($29)
/* 00AE2C 01DB6B2C 80000224 */  addiu       $2, $0, 0x80
/* 00AE30 01DB6B30 3801A2AF */  sw          $2, 0x138($29)
/* 00AE34 01DB6B34 3C01A2AF */  sw          $2, 0x13C($29)
/* 00AE38 01DB6B38 3001A227 */  addiu       $2, $29, 0x130
/* 00AE3C 01DB6B3C 00004278 */  lq          $2, 0x0($2)
/* 00AE40 01DB6B40 0000027E */  sq          $2, 0x0($16)
/* 00AE44 01DB6B44 F041023C */  lui         $2, (0x41F00000 >> 16)
/* 00AE48 01DB6B48 2800A2AF */  sw          $2, 0x28($29)
/* 00AE4C 01DB6B4C 5041023C */  lui         $2, (0x41500000 >> 16)
/* 00AE50 01DB6B50 2C00A2AF */  sw          $2, 0x2C($29)
/* 00AE54 01DB6B54 3C000224 */  addiu       $2, $0, 0x3C
/* 00AE58 01DB6B58 F400A2AF */  sw          $2, 0xF4($29)
/* 00AE5C 01DB6B5C D8988427 */  addiu       $4, $28, -0x6728
/* 00AE60 01DB6B60 2000A527 */  addiu       $5, $29, 0x20
/* 00AE64 01DB6B64 6092050C */  jal         EnterEffect__12CEffectGroupFP12CEffectParam
/* 00AE68 01DB6B68 00000000 */   nop
.L01DB6B6C_2BC36C:
/* 00AE6C 01DB6B6C D8988427 */  addiu       $4, $28, -0x6728
/* 00AE70 01DB6B70 01000524 */  addiu       $5, $0, 0x1
/* 00AE74 01DB6B74 7C92050C */  jal         Step__12CEffectGroupFi
/* 00AE78 01DB6B78 00000000 */   nop
/* 00AE7C 01DB6B7C D8988427 */  addiu       $4, $28, -0x6728
/* 00AE80 01DB6B80 9892050C */  jal         Draw__12CEffectGroupFv
/* 00AE84 01DB6B84 00000000 */   nop
/* 00AE88 01DB6B88 2499828F */  lw          $2, -0x66DC($28)
/* 00AE8C 01DB6B8C 0D004014 */  bnez        $2, .L01DB6BC4_2BC3C4
/* 00AE90 01DB6B90 00000000 */   nop
/* 00AE94 01DB6B94 DD01023C */  lui         $2, %hi(LIT_695__2)
/* 00AE98 01DB6B98 90664224 */  addiu       $2, $2, %lo(LIT_695__2)
/* 00AE9C 01DB6B9C 2001A527 */  addiu       $5, $29, 0x120
/* 00AEA0 01DB6BA0 00004278 */  lq          $2, 0x0($2)
/* 00AEA4 01DB6BA4 0000A27C */  sq          $2, 0x0($5)
/* 00AEA8 01DB6BA8 4000A427 */  addiu       $4, $29, 0x40
/* 00AEAC 01DB6BAC 0C86040C */  jal         sceVu0CopyVector
/* 00AEB0 01DB6BB0 00000000 */   nop
/* 00AEB4 01DB6BB4 D8988427 */  addiu       $4, $28, -0x6728
/* 00AEB8 01DB6BB8 2000A527 */  addiu       $5, $29, 0x20
/* 00AEBC 01DB6BBC 6092050C */  jal         EnterEffect__12CEffectGroupFP12CEffectParam
/* 00AEC0 01DB6BC0 00000000 */   nop
.L01DB6BC4_2BC3C4:
/* 00AEC4 01DB6BC4 D8988427 */  addiu       $4, $28, -0x6728
/* 00AEC8 01DB6BC8 9892050C */  jal         Draw__12CEffectGroupFv
/* 00AECC 01DB6BCC 00000000 */   nop
/* 00AED0 01DB6BD0 1000BF7B */  lq          $31, 0x10($29)
/* 00AED4 01DB6BD4 0000B07B */  lq          $16, 0x0($29)
/* 00AED8 01DB6BD8 4001BD27 */  addiu       $29, $29, 0x140
/* 00AEDC 01DB6BDC 0800E003 */  jr          $31
/* 00AEE0 01DB6BE0 00000000 */   nop
/* 00AEE4 01DB6BE4 00000000 */  nop
/* 00AEE8 01DB6BE8 00000000 */  nop
/* 00AEEC 01DB6BEC 00000000 */  nop
