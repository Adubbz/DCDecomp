.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetBattleStyle__Fii
/* 0AFF90 001AFE90 70FFBD27 */  addiu       $29, $29, -0x90
/* 0AFF94 001AFE94 5000BF7F */  sq          $31, 0x50($29)
/* 0AFF98 001AFE98 4000B37F */  sq          $19, 0x40($29)
/* 0AFF9C 001AFE9C 3000B27F */  sq          $18, 0x30($29)
/* 0AFFA0 001AFEA0 2000B17F */  sq          $17, 0x20($29)
/* 0AFFA4 001AFEA4 1000B07F */  sq          $16, 0x10($29)
/* 0AFFA8 001AFEA8 0000B4E7 */  swc1        $f20, 0x0($29)
/* 0AFFAC 001AFEAC 289E8070 */  paddub      $19, $4, $0
/* 0AFFB0 001AFEB0 2896A070 */  paddub      $18, $5, $0
/* 0AFFB4 001AFEB4 10270224 */  addiu       $2, $0, 0x2710
/* 0AFFB8 001AFEB8 00008244 */  mtc1        $2, $f0
/* 0AFFBC 001AFEBC 00000000 */  nop
/* 0AFFC0 001AFEC0 20058046 */  cvt.s.w     $f20, $f0
/* 0AFFC4 001AFEC4 7000A427 */  addiu       $4, $29, 0x70
/* 0AFFC8 001AFEC8 EA01023C */  lui         $2, %hi(CharaMain + 0x10)
/* 0AFFCC 001AFECC 301D4524 */  addiu       $5, $2, %lo(CharaMain + 0x10)
/* 0AFFD0 001AFED0 0C86040C */  jal         sceVu0CopyVector
/* 0AFFD4 001AFED4 00000000 */   nop
/* 0AFFD8 001AFED8 28860070 */  paddub      $16, $0, $0
/* 0AFFDC 001AFEDC 2E000010 */  b           .L001AFF98
/* 0AFFE0 001AFEE0 00000000 */   nop
.L001AFEE4:
/* 0AFFE4 001AFEE4 E09C858F */  lw          $5, -0x6320($28)
/* 0AFFE8 001AFEE8 80101000 */  sll         $2, $16, 2
/* 0AFFEC 001AFEEC 21185000 */  addu        $3, $2, $16
/* 0AFFF0 001AFEF0 80100300 */  sll         $2, $3, 2
/* 0AFFF4 001AFEF4 21106200 */  addu        $2, $3, $2
/* 0AFFF8 001AFEF8 00110200 */  sll         $2, $2, 4
/* 0AFFFC 001AFEFC 21204500 */  addu        $4, $2, $5
/* 0B0000 001AFF00 0200013C */  lui         $1, (0x20000 >> 16)
/* 0B0004 001AFF04 21088100 */  addu        $1, $4, $1
/* 0B0008 001AFF08 D0E3238C */  lw          $3, -0x1C30($1)
/* 0B000C 001AFF0C FFFF0224 */  addiu       $2, $0, -0x1
/* 0B0010 001AFF10 20006210 */  beq         $3, $2, .L001AFF94
/* 0B0014 001AFF14 00000000 */   nop
/* 0B0018 001AFF18 08000006 */  bltz        $16, .L001AFF3C
/* 0B001C 001AFF1C 00000000 */   nop
/* 0B0020 001AFF20 1100012A */  slti        $1, $16, 0x11
/* 0B0024 001AFF24 05002010 */  beqz        $1, .L001AFF3C
/* 0B0028 001AFF28 00000000 */   nop
/* 0B002C 001AFF2C 0200013C */  lui         $1, (0x20000 >> 16)
/* 0B0030 001AFF30 21088100 */  addu        $1, $4, $1
/* 0B0034 001AFF34 A4E43184 */  lh          $17, -0x1B5C($1)
/* 0B0038 001AFF38 00000000 */  nop
.L001AFF3C:
/* 0B003C 001AFF3C 15002012 */  beqz        $17, .L001AFF94
/* 0B0040 001AFF40 00000000 */   nop
/* 0B0044 001AFF44 10350224 */  addiu       $2, $0, 0x3510
/* 0B0048 001AFF48 18100202 */  mult        $2, $16, $2
/* 0B004C 001AFF4C 2110A200 */  addu        $2, $5, $2
/* 0B0050 001AFF50 0100013C */  lui         $1, (0x1FCD0 >> 16)
/* 0B0054 001AFF54 D0FC2134 */  ori         $1, $1, (0x1FCD0 & 0xFFFF)
/* 0B0058 001AFF58 21204100 */  addu        $4, $2, $1
/* 0B005C 001AFF5C 6000A527 */  addiu       $5, $29, 0x60
/* 0B0060 001AFF60 A000998C */  lw          $25, 0xA0($4)
/* 0B0064 001AFF64 A000398F */  lw          $25, 0xA0($25)
/* 0B0068 001AFF68 09F82003 */  jalr        $25
/* 0B006C 001AFF6C 00000000 */   nop
/* 0B0070 001AFF70 7000A427 */  addiu       $4, $29, 0x70
/* 0B0074 001AFF74 6000A527 */  addiu       $5, $29, 0x60
/* 0B0078 001AFF78 648D040C */  jal         DistVector__FPfPf
/* 0B007C 001AFF7C 00000000 */   nop
/* 0B0080 001AFF80 34001446 */  c.lt.s      $f0, $f20
/* 0B0084 001AFF84 00000000 */  nop
/* 0B0088 001AFF88 02000045 */  bc1f        .L001AFF94
/* 0B008C 001AFF8C 00000000 */   nop
/* 0B0090 001AFF90 06050046 */  mov.s       $f20, $f0
.L001AFF94:
/* 0B0094 001AFF94 01001026 */  addiu       $16, $16, 0x1
.L001AFF98:
/* 0B0098 001AFF98 1000022A */  slti        $2, $16, 0x10
/* 0B009C 001AFF9C D1FF4014 */  bnez        $2, .L001AFEE4
/* 0B00A0 001AFFA0 00000000 */   nop
/* 0B00A4 001AFFA4 05000224 */  addiu       $2, $0, 0x5
/* 0B00A8 001AFFA8 23006212 */  beq         $19, $2, .L001B0038
/* 0B00AC 001AFFAC 00000000 */   nop
/* 0B00B0 001AFFB0 80181300 */  sll         $3, $19, 2
/* 0B00B4 001AFFB4 2700023C */  lui         $2, %hi(maxFloorTbl)
/* 0B00B8 001AFFB8 00B04224 */  addiu       $2, $2, %lo(maxFloorTbl)
/* 0B00BC 001AFFBC 21104300 */  addu        $2, $2, $3
/* 0B00C0 001AFFC0 0000428C */  lw          $2, 0x0($2)
/* 0B00C4 001AFFC4 789C838F */  lw          $3, -0x6388($28)
/* 0B00C8 001AFFC8 02006380 */  lb          $3, 0x2($3)
/* 0B00CC 001AFFCC FFFF4224 */  addiu       $2, $2, -0x1
/* 0B00D0 001AFFD0 2A086200 */  slt         $1, $3, $2
/* 0B00D4 001AFFD4 18002010 */  beqz        $1, .L001B0038
/* 0B00D8 001AFFD8 00000000 */   nop
/* 0B00DC 001AFFDC 06A30046 */  mov.s       $f12, $f20
/* 0B00E0 001AFFE0 8800A427 */  addiu       $4, $29, 0x88
/* 0B00E4 001AFFE4 8C00A527 */  addiu       $5, $29, 0x8C
/* 0B00E8 001AFFE8 A4DD060C */  jal         BtBattleMusic_Excg__FfPfPf
/* 0B00EC 001AFFEC 00000000 */   nop
/* 0B00F0 001AFFF0 8C00A1C7 */  lwc1        $f1, 0x8C($29)
/* 0B00F4 001AFFF4 00008044 */  mtc1        $0, $f0
/* 0B00F8 001AFFF8 00000000 */  nop
/* 0B00FC 001AFFFC 36080046 */  c.le.s      $f1, $f0
/* 0B0100 001B0000 00000000 */  nop
/* 0B0104 001B0004 04000145 */  bc1t        .L001B0018
/* 0B0108 001B0008 00000000 */   nop
/* 0B010C 001B000C 28260070 */  paddub      $4, $0, $0
/* 0B0110 001B0010 446C050C */  jal         SndAmbientPlay__Fi
/* 0B0114 001B0014 00000000 */   nop
.L001B0018:
/* 0B0118 001B0018 04004016 */  bnez        $18, .L001B002C
/* 0B011C 001B001C 00000000 */   nop
/* 0B0120 001B0020 8800ACC7 */  lwc1        $f12, 0x88($29)
/* 0B0124 001B0024 6467050C */  jal         SndSetBgmVolf__Ff
/* 0B0128 001B0028 00000000 */   nop
.L001B002C:
/* 0B012C 001B002C 8C00ACC7 */  lwc1        $f12, 0x8C($29)
/* 0B0130 001B0030 906C050C */  jal         SndAmbientSetVolf__Ff
/* 0B0134 001B0034 00000000 */   nop
.L001B0038:
/* 0B0138 001B0038 06A00046 */  mov.s       $f0, $f20
/* 0B013C 001B003C 5000BF7B */  lq          $31, 0x50($29)
/* 0B0140 001B0040 4000B37B */  lq          $19, 0x40($29)
/* 0B0144 001B0044 3000B27B */  lq          $18, 0x30($29)
/* 0B0148 001B0048 2000B17B */  lq          $17, 0x20($29)
/* 0B014C 001B004C 1000B07B */  lq          $16, 0x10($29)
/* 0B0150 001B0050 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 0B0154 001B0054 9000BD27 */  addiu       $29, $29, 0x90
/* 0B0158 001B0058 0800E003 */  jr          $31
/* 0B015C 001B005C 00000000 */   nop
