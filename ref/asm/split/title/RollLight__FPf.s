.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel RollLight__FPf
/* 01ABF0 01DC68F0 F0FEBD27 */  addiu       $29, $29, -0x110
/* 01ABF4 01DC68F4 3000BF7F */  sq          $31, 0x30($29)
/* 01ABF8 01DC68F8 2000B27F */  sq          $18, 0x20($29)
/* 01ABFC 01DC68FC 1000B17F */  sq          $17, 0x10($29)
/* 01AC00 01DC6900 0000B07F */  sq          $16, 0x0($29)
/* 01AC04 01DC6904 28868070 */  paddub      $16, $4, $0
/* 01AC08 01DC6908 DE01013C */  lui         $1, %hi(CScript__2)
/* 01AC0C 01DC690C 001B248C */  lw          $4, %lo(CScript__2)($1)
/* 01AC10 01DC6910 6F008328 */  slti        $3, $4, 0x6F
/* 01AC14 01DC6914 CD006014 */  bnez        $3, .L01DC6C4C_2CC44C
/* 01AC18 01DC6918 00000000 */   nop
/* 01AC1C 01DC691C 72008128 */  slti        $1, $4, 0x72
/* 01AC20 01DC6920 CA002010 */  beqz        $1, .L01DC6C4C_2CC44C
/* 01AC24 01DC6924 00000000 */   nop
/* 01AC28 01DC6928 6F000224 */  addiu       $2, $0, 0x6F
/* 01AC2C 01DC692C 0E008214 */  bne         $4, $2, .L01DC6968_2CC168
/* 01AC30 01DC6930 00000000 */   nop
/* 01AC34 01DC6934 0498838F */  lw          $3, -0x67FC($28)
/* 01AC38 01DC6938 B0110224 */  addiu       $2, $0, 0x11B0
/* 01AC3C 01DC693C 18186200 */  mult        $3, $3, $2
/* 01AC40 01DC6940 E101023C */  lui         $2, %hi(Cam__2 + 0xBC)
/* 01AC44 01DC6944 8C994224 */  addiu       $2, $2, %lo(Cam__2 + 0xBC)
/* 01AC48 01DC6948 21104300 */  addu        $2, $2, $3
/* 01AC4C 01DC694C 0000448C */  lw          $4, 0x0($2)
/* 01AC50 01DC6950 DE01023C */  lui         $2, %hi(LIT_986__4)
/* 01AC54 01DC6954 18FE4524 */  addiu       $5, $2, %lo(LIT_986__4)
/* 01AC58 01DC6958 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 01AC5C 01DC695C 00000000 */   nop
/* 01AC60 01DC6960 07000010 */  b           .L01DC6980_2CC180
/* 01AC64 01DC6964 00000000 */   nop
.L01DC6968_2CC168:
/* 01AC68 01DC6968 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x3A5C)
/* 01AC6C 01DC696C 2CC2248C */  lw          $4, %lo(MainMonstorUnit + 0x3A5C)($1)
/* 01AC70 01DC6970 DE01023C */  lui         $2, %hi(LIT_964)
/* 01AC74 01DC6974 10FE4524 */  addiu       $5, $2, %lo(LIT_964)
/* 01AC78 01DC6978 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 01AC7C 01DC697C 00000000 */   nop
.L01DC6980_2CC180:
/* 01AC80 01DC6980 28264070 */  paddub      $4, $2, $0
/* 01AC84 01DC6984 4000A527 */  addiu       $5, $29, 0x40
/* 01AC88 01DC6988 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 01AC8C 01DC698C 00000000 */   nop
/* 01AC90 01DC6990 DE01013C */  lui         $1, %hi(CScript__2)
/* 01AC94 01DC6994 001B238C */  lw          $3, %lo(CScript__2)($1)
/* 01AC98 01DC6998 71000224 */  addiu       $2, $0, 0x71
/* 01AC9C 01DC699C 2F006210 */  beq         $3, $2, .L01DC6A5C_2CC25C
/* 01ACA0 01DC69A0 00000000 */   nop
/* 01ACA4 01DC69A4 70000224 */  addiu       $2, $0, 0x70
/* 01ACA8 01DC69A8 06006210 */  beq         $3, $2, .L01DC69C4_2CC1C4
/* 01ACAC 01DC69AC 00000000 */   nop
/* 01ACB0 01DC69B0 6F000224 */  addiu       $2, $0, 0x6F
/* 01ACB4 01DC69B4 03006210 */  beq         $3, $2, .L01DC69C4_2CC1C4
/* 01ACB8 01DC69B8 00000000 */   nop
/* 01ACBC 01DC69BC 9F000010 */  b           .L01DC6C3C_2CC43C
/* 01ACC0 01DC69C0 00000000 */   nop
.L01DC69C4_2CC1C4:
/* 01ACC4 01DC69C4 7000A1C7 */  lwc1        $f1, 0x70($29)
/* 01ACC8 01DC69C8 000000C6 */  lwc1        $f0, 0x0($16)
/* 01ACCC 01DC69CC 01080046 */  sub.s       $f0, $f1, $f0
/* 01ACD0 01DC69D0 0001A0E7 */  swc1        $f0, 0x100($29)
/* 01ACD4 01DC69D4 7400A0C7 */  lwc1        $f0, 0x74($29)
/* 01ACD8 01DC69D8 0401B127 */  addiu       $17, $29, 0x104
/* 01ACDC 01DC69DC 000020E6 */  swc1        $f0, 0x0($17)
/* 01ACE0 01DC69E0 080001C6 */  lwc1        $f1, 0x8($16)
/* 01ACE4 01DC69E4 7800A0C7 */  lwc1        $f0, 0x78($29)
/* 01ACE8 01DC69E8 01000146 */  sub.s       $f0, $f0, $f1
/* 01ACEC 01DC69EC 0801B027 */  addiu       $16, $29, 0x108
/* 01ACF0 01DC69F0 000000E6 */  swc1        $f0, 0x0($16)
/* 01ACF4 01DC69F4 0001A427 */  addiu       $4, $29, 0x100
/* 01ACF8 01DC69F8 282E8070 */  paddub      $5, $4, $0
/* 01ACFC 01DC69FC 9285040C */  jal         sceVu0Normalize
/* 01AD00 01DC6A00 00000000 */   nop
/* 01AD04 01DC6A04 8000A427 */  addiu       $4, $29, 0x80
/* 01AD08 01DC6A08 2500023C */  lui         $2, %hi(light)
/* 01AD0C 01DC6A0C 801B4524 */  addiu       $5, $2, %lo(light)
/* 01AD10 01DC6A10 1086040C */  jal         sceVu0CopyMatrix
/* 01AD14 01DC6A14 00000000 */   nop
/* 01AD18 01DC6A18 C000A427 */  addiu       $4, $29, 0xC0
/* 01AD1C 01DC6A1C 2500023C */  lui         $2, %hi(lightcolor)
/* 01AD20 01DC6A20 C01B4524 */  addiu       $5, $2, %lo(lightcolor)
/* 01AD24 01DC6A24 1086040C */  jal         sceVu0CopyMatrix
/* 01AD28 01DC6A28 00000000 */   nop
/* 01AD2C 01DC6A2C 0001A0C7 */  lwc1        $f0, 0x100($29)
/* 01AD30 01DC6A30 8400A0E7 */  swc1        $f0, 0x84($29)
/* 01AD34 01DC6A34 000020C6 */  lwc1        $f0, 0x0($17)
/* 01AD38 01DC6A38 9400A0E7 */  swc1        $f0, 0x94($29)
/* 01AD3C 01DC6A3C 000000C6 */  lwc1        $f0, 0x0($16)
/* 01AD40 01DC6A40 A400A0E7 */  swc1        $f0, 0xA4($29)
/* 01AD44 01DC6A44 7F43023C */  lui         $2, (0x437F0000 >> 16)
/* 01AD48 01DC6A48 D000A2AF */  sw          $2, 0xD0($29)
/* 01AD4C 01DC6A4C D400A2AF */  sw          $2, 0xD4($29)
/* 01AD50 01DC6A50 D800A2AF */  sw          $2, 0xD8($29)
/* 01AD54 01DC6A54 79000010 */  b           .L01DC6C3C_2CC43C
/* 01AD58 01DC6A58 00000000 */   nop
.L01DC6A5C_2CC25C:
/* 01AD5C 01DC6A5C F49A8283 */  lb          $2, -0x650C($28)
/* 01AD60 01DC6A60 04004014 */  bnez        $2, .L01DC6A74_2CC274
/* 01AD64 01DC6A64 00000000 */   nop
/* 01AD68 01DC6A68 F09A80AF */  sw          $0, -0x6510($28)
/* 01AD6C 01DC6A6C 01000224 */  addiu       $2, $0, 0x1
/* 01AD70 01DC6A70 F49A82A3 */  sb          $2, -0x650C($28)
.L01DC6A74_2CC274:
/* 01AD74 01DC6A74 F09A81C7 */  lwc1        $f1, -0x6510($28)
/* 01AD78 01DC6A78 F08180C7 */  lwc1        $f0, -0x7E10($28)
/* 01AD7C 01DC6A7C 40080046 */  add.s       $f1, $f1, $f0
/* 01AD80 01DC6A80 F09A81E7 */  swc1        $f1, -0x6510($28)
/* 01AD84 01DC6A84 088480C7 */  lwc1        $f0, -0x7BF8($28)
/* 01AD88 01DC6A88 36080046 */  c.le.s      $f1, $f0
/* 01AD8C 01DC6A8C 00000000 */  nop
/* 01AD90 01DC6A90 05000145 */  bc1t        .L01DC6AA8_2CC2A8
/* 01AD94 01DC6A94 00000000 */   nop
/* 01AD98 01DC6A98 F09A81C7 */  lwc1        $f1, -0x6510($28)
/* 01AD9C 01DC6A9C C48380C7 */  lwc1        $f0, -0x7C3C($28)
/* 01ADA0 01DC6AA0 01080046 */  sub.s       $f0, $f1, $f0
/* 01ADA4 01DC6AA4 F09A80E7 */  swc1        $f0, -0x6510($28)
.L01DC6AA8_2CC2A8:
/* 01ADA8 01DC6AA8 F09A8CC7 */  lwc1        $f12, -0x6510($28)
/* 01ADAC 01DC6AAC 9044040C */  jal         fptodp
/* 01ADB0 01DC6AB0 00000000 */   nop
/* 01ADB4 01DC6AB4 28264070 */  paddub      $4, $2, $0
/* 01ADB8 01DC6AB8 C474040C */  jal         sin
/* 01ADBC 01DC6ABC 00000000 */   nop
/* 01ADC0 01DC6AC0 3940033C */  lui         $3, (0x40390000 >> 16)
/* 01ADC4 01DC6AC4 3C200300 */  dsll32      $4, $3, 0
/* 01ADC8 01DC6AC8 282E4070 */  paddub      $5, $2, $0
/* 01ADCC 01DC6ACC 9E3F040C */  jal         dpmul
/* 01ADD0 01DC6AD0 00000000 */   nop
/* 01ADD4 01DC6AD4 288E4070 */  paddub      $17, $2, $0
/* 01ADD8 01DC6AD8 7000ACC7 */  lwc1        $f12, 0x70($29)
/* 01ADDC 01DC6ADC 9044040C */  jal         fptodp
/* 01ADE0 01DC6AE0 00000000 */   nop
/* 01ADE4 01DC6AE4 28264070 */  paddub      $4, $2, $0
/* 01ADE8 01DC6AE8 282E2072 */  paddub      $5, $17, $0
/* 01ADEC 01DC6AEC 6E3F040C */  jal         dpadd
/* 01ADF0 01DC6AF0 00000000 */   nop
/* 01ADF4 01DC6AF4 288E4070 */  paddub      $17, $2, $0
/* 01ADF8 01DC6AF8 00000CC6 */  lwc1        $f12, 0x0($16)
/* 01ADFC 01DC6AFC 9044040C */  jal         fptodp
/* 01AE00 01DC6B00 00000000 */   nop
/* 01AE04 01DC6B04 28262072 */  paddub      $4, $17, $0
/* 01AE08 01DC6B08 282E4070 */  paddub      $5, $2, $0
/* 01AE0C 01DC6B0C 843F040C */  jal         dpsub
/* 01AE10 01DC6B10 00000000 */   nop
/* 01AE14 01DC6B14 28264070 */  paddub      $4, $2, $0
/* 01AE18 01DC6B18 9241040C */  jal         dptofp
/* 01AE1C 01DC6B1C 00000000 */   nop
/* 01AE20 01DC6B20 0001A0E7 */  swc1        $f0, 0x100($29)
/* 01AE24 01DC6B24 1440023C */  lui         $2, (0x40140000 >> 16)
/* 01AE28 01DC6B28 3C880200 */  dsll32      $17, $2, 0
/* 01AE2C 01DC6B2C 7400ACC7 */  lwc1        $f12, 0x74($29)
/* 01AE30 01DC6B30 9044040C */  jal         fptodp
/* 01AE34 01DC6B34 00000000 */   nop
/* 01AE38 01DC6B38 28262072 */  paddub      $4, $17, $0
/* 01AE3C 01DC6B3C 282E4070 */  paddub      $5, $2, $0
/* 01AE40 01DC6B40 6E3F040C */  jal         dpadd
/* 01AE44 01DC6B44 00000000 */   nop
/* 01AE48 01DC6B48 28264070 */  paddub      $4, $2, $0
/* 01AE4C 01DC6B4C 9241040C */  jal         dptofp
/* 01AE50 01DC6B50 00000000 */   nop
/* 01AE54 01DC6B54 0401B227 */  addiu       $18, $29, 0x104
/* 01AE58 01DC6B58 000040E6 */  swc1        $f0, 0x0($18)
/* 01AE5C 01DC6B5C F09A8CC7 */  lwc1        $f12, -0x6510($28)
/* 01AE60 01DC6B60 9044040C */  jal         fptodp
/* 01AE64 01DC6B64 00000000 */   nop
/* 01AE68 01DC6B68 28264070 */  paddub      $4, $2, $0
/* 01AE6C 01DC6B6C F473040C */  jal         cos
/* 01AE70 01DC6B70 00000000 */   nop
/* 01AE74 01DC6B74 3940033C */  lui         $3, (0x40390000 >> 16)
/* 01AE78 01DC6B78 3C200300 */  dsll32      $4, $3, 0
/* 01AE7C 01DC6B7C 282E4070 */  paddub      $5, $2, $0
/* 01AE80 01DC6B80 9E3F040C */  jal         dpmul
/* 01AE84 01DC6B84 00000000 */   nop
/* 01AE88 01DC6B88 288E4070 */  paddub      $17, $2, $0
/* 01AE8C 01DC6B8C 7800ACC7 */  lwc1        $f12, 0x78($29)
/* 01AE90 01DC6B90 9044040C */  jal         fptodp
/* 01AE94 01DC6B94 00000000 */   nop
/* 01AE98 01DC6B98 28264070 */  paddub      $4, $2, $0
/* 01AE9C 01DC6B9C 282E2072 */  paddub      $5, $17, $0
/* 01AEA0 01DC6BA0 6E3F040C */  jal         dpadd
/* 01AEA4 01DC6BA4 00000000 */   nop
/* 01AEA8 01DC6BA8 288E4070 */  paddub      $17, $2, $0
/* 01AEAC 01DC6BAC 08000CC6 */  lwc1        $f12, 0x8($16)
/* 01AEB0 01DC6BB0 9044040C */  jal         fptodp
/* 01AEB4 01DC6BB4 00000000 */   nop
/* 01AEB8 01DC6BB8 28262072 */  paddub      $4, $17, $0
/* 01AEBC 01DC6BBC 282E4070 */  paddub      $5, $2, $0
/* 01AEC0 01DC6BC0 843F040C */  jal         dpsub
/* 01AEC4 01DC6BC4 00000000 */   nop
/* 01AEC8 01DC6BC8 28264070 */  paddub      $4, $2, $0
/* 01AECC 01DC6BCC 9241040C */  jal         dptofp
/* 01AED0 01DC6BD0 00000000 */   nop
/* 01AED4 01DC6BD4 0801B027 */  addiu       $16, $29, 0x108
/* 01AED8 01DC6BD8 000000E6 */  swc1        $f0, 0x0($16)
/* 01AEDC 01DC6BDC 0001A427 */  addiu       $4, $29, 0x100
/* 01AEE0 01DC6BE0 282E8070 */  paddub      $5, $4, $0
/* 01AEE4 01DC6BE4 9285040C */  jal         sceVu0Normalize
/* 01AEE8 01DC6BE8 00000000 */   nop
/* 01AEEC 01DC6BEC 8000A427 */  addiu       $4, $29, 0x80
/* 01AEF0 01DC6BF0 2500023C */  lui         $2, %hi(light)
/* 01AEF4 01DC6BF4 801B4524 */  addiu       $5, $2, %lo(light)
/* 01AEF8 01DC6BF8 1086040C */  jal         sceVu0CopyMatrix
/* 01AEFC 01DC6BFC 00000000 */   nop
/* 01AF00 01DC6C00 C000A427 */  addiu       $4, $29, 0xC0
/* 01AF04 01DC6C04 2500023C */  lui         $2, %hi(lightcolor)
/* 01AF08 01DC6C08 C01B4524 */  addiu       $5, $2, %lo(lightcolor)
/* 01AF0C 01DC6C0C 1086040C */  jal         sceVu0CopyMatrix
/* 01AF10 01DC6C10 00000000 */   nop
/* 01AF14 01DC6C14 0001A0C7 */  lwc1        $f0, 0x100($29)
/* 01AF18 01DC6C18 8400A0E7 */  swc1        $f0, 0x84($29)
/* 01AF1C 01DC6C1C 000040C6 */  lwc1        $f0, 0x0($18)
/* 01AF20 01DC6C20 9400A0E7 */  swc1        $f0, 0x94($29)
/* 01AF24 01DC6C24 000000C6 */  lwc1        $f0, 0x0($16)
/* 01AF28 01DC6C28 A400A0E7 */  swc1        $f0, 0xA4($29)
/* 01AF2C 01DC6C2C 0043023C */  lui         $2, (0x43000000 >> 16)
/* 01AF30 01DC6C30 D000A2AF */  sw          $2, 0xD0($29)
/* 01AF34 01DC6C34 D400A2AF */  sw          $2, 0xD4($29)
/* 01AF38 01DC6C38 D800A2AF */  sw          $2, 0xD8($29)
.L01DC6C3C_2CC43C:
/* 01AF3C 01DC6C3C 8000A427 */  addiu       $4, $29, 0x80
/* 01AF40 01DC6C40 C000A527 */  addiu       $5, $29, 0xC0
/* 01AF44 01DC6C44 08B7040C */  jal         MGSetPLight__FPA4_fPA4_f
/* 01AF48 01DC6C48 00000000 */   nop
.L01DC6C4C_2CC44C:
/* 01AF4C 01DC6C4C 3000BF7B */  lq          $31, 0x30($29)
/* 01AF50 01DC6C50 2000B27B */  lq          $18, 0x20($29)
/* 01AF54 01DC6C54 1000B17B */  lq          $17, 0x10($29)
/* 01AF58 01DC6C58 0000B07B */  lq          $16, 0x0($29)
/* 01AF5C 01DC6C5C 1001BD27 */  addiu       $29, $29, 0x110
/* 01AF60 01DC6C60 0800E003 */  jr          $31
/* 01AF64 01DC6C64 00000000 */   nop
/* 01AF68 01DC6C68 00000000 */  nop
/* 01AF6C 01DC6C6C 00000000 */  nop
