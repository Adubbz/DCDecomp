.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetBattleStyle__Fii
/* AFF90 001AFE90 70FFBD27 */  addiu      $sp, $sp, -0x90
/* AFF94 001AFE94 5000BF7F */  sq         $31, 0x50($sp)
/* AFF98 001AFE98 4000B37F */  sq         $19, 0x40($sp)
/* AFF9C 001AFE9C 3000B27F */  sq         $18, 0x30($sp)
/* AFFA0 001AFEA0 2000B17F */  sq         $17, 0x20($sp)
/* AFFA4 001AFEA4 1000B07F */  sq         $16, 0x10($sp)
/* AFFA8 001AFEA8 0000B4E7 */  swc1       $f20, 0x0($sp)
/* AFFAC 001AFEAC 289E8070 */  paddub     $19, $4, $0
/* AFFB0 001AFEB0 2896A070 */  paddub     $18, $5, $0
/* AFFB4 001AFEB4 10270224 */  addiu      $2, $0, 0x2710
/* AFFB8 001AFEB8 00008244 */  mtc1       $2, $f0
/* AFFBC 001AFEBC 00000000 */  nop
/* AFFC0 001AFEC0 20058046 */  cvt.s.w    $f20, $f0
/* AFFC4 001AFEC4 7000A427 */  addiu      $4, $sp, 0x70
/* AFFC8 001AFEC8 EA01023C */  lui        $2, %hi(D_1EA1D30)
/* AFFCC 001AFECC 301D4524 */  addiu      $5, $2, %lo(D_1EA1D30)
/* AFFD0 001AFED0 0C86040C */  jal        sceVu0CopyVector
/* AFFD4 001AFED4 00000000 */   nop
/* AFFD8 001AFED8 28860070 */  paddub     $16, $0, $0
/* AFFDC 001AFEDC 2E000010 */  b          .L001AFF98
/* AFFE0 001AFEE0 00000000 */   nop
.L001AFEE4:
/* AFFE4 001AFEE4 E09C858F */  lw         $5, -0x6320($gp)
/* AFFE8 001AFEE8 80101000 */  sll        $2, $16, 2
/* AFFEC 001AFEEC 21185000 */  addu       $3, $2, $16
/* AFFF0 001AFEF0 80100300 */  sll        $2, $3, 2
/* AFFF4 001AFEF4 21106200 */  addu       $2, $3, $2
/* AFFF8 001AFEF8 00110200 */  sll        $2, $2, 4
/* AFFFC 001AFEFC 21204500 */  addu       $4, $2, $5
/* B0000 001AFF00 0200013C */  lui        $at, (0x20000 >> 16)
/* B0004 001AFF04 21088100 */  addu       $at, $4, $at
/* B0008 001AFF08 D0E3238C */  lw         $3, -0x1C30($at)
/* B000C 001AFF0C FFFF0224 */  addiu      $2, $0, -0x1
/* B0010 001AFF10 20006210 */  beq        $3, $2, .L001AFF94
/* B0014 001AFF14 00000000 */   nop
/* B0018 001AFF18 08000006 */  bltz       $16, .L001AFF3C
/* B001C 001AFF1C 00000000 */   nop
/* B0020 001AFF20 1100012A */  slti       $at, $16, 0x11
/* B0024 001AFF24 05002010 */  beqz       $at, .L001AFF3C
/* B0028 001AFF28 00000000 */   nop
/* B002C 001AFF2C 0200013C */  lui        $at, (0x20000 >> 16)
/* B0030 001AFF30 21088100 */  addu       $at, $4, $at
/* B0034 001AFF34 A4E43184 */  lh         $17, -0x1B5C($at)
/* B0038 001AFF38 00000000 */  nop
.L001AFF3C:
/* B003C 001AFF3C 15002012 */  beqz       $17, .L001AFF94
/* B0040 001AFF40 00000000 */   nop
/* B0044 001AFF44 10350224 */  addiu      $2, $0, 0x3510
/* B0048 001AFF48 18100202 */  mult       $2, $16, $2
/* B004C 001AFF4C 2110A200 */  addu       $2, $5, $2
/* B0050 001AFF50 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* B0054 001AFF54 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* B0058 001AFF58 21204100 */  addu       $4, $2, $at
/* B005C 001AFF5C 6000A527 */  addiu      $5, $sp, 0x60
/* B0060 001AFF60 A000998C */  lw         $25, 0xA0($4)
/* B0064 001AFF64 A000398F */  lw         $25, 0xA0($25)
/* B0068 001AFF68 09F82003 */  jalr       $25
/* B006C 001AFF6C 00000000 */   nop
/* B0070 001AFF70 7000A427 */  addiu      $4, $sp, 0x70
/* B0074 001AFF74 6000A527 */  addiu      $5, $sp, 0x60
/* B0078 001AFF78 648D040C */  jal        DistVector__FPfPf
/* B007C 001AFF7C 00000000 */   nop
/* B0080 001AFF80 34001446 */  c.lt.s     $f0, $f20
/* B0084 001AFF84 00000000 */  nop
/* B0088 001AFF88 02000045 */  bc1f       .L001AFF94
/* B008C 001AFF8C 00000000 */   nop
/* B0090 001AFF90 06050046 */  mov.s      $f20, $f0
.L001AFF94:
/* B0094 001AFF94 01001026 */  addiu      $16, $16, 0x1
.L001AFF98:
/* B0098 001AFF98 1000022A */  slti       $2, $16, 0x10
/* B009C 001AFF9C D1FF4014 */  bnez       $2, .L001AFEE4
/* B00A0 001AFFA0 00000000 */   nop
/* B00A4 001AFFA4 05000224 */  addiu      $2, $0, 0x5
/* B00A8 001AFFA8 23006212 */  beq        $19, $2, .L001B0038
/* B00AC 001AFFAC 00000000 */   nop
/* B00B0 001AFFB0 80181300 */  sll        $3, $19, 2
/* B00B4 001AFFB4 2700023C */  lui        $2, %hi(maxFloorTbl)
/* B00B8 001AFFB8 00B04224 */  addiu      $2, $2, %lo(maxFloorTbl)
/* B00BC 001AFFBC 21104300 */  addu       $2, $2, $3
/* B00C0 001AFFC0 0000428C */  lw         $2, 0x0($2)
/* B00C4 001AFFC4 789C838F */  lw         $3, -0x6388($gp)
/* B00C8 001AFFC8 02006380 */  lb         $3, 0x2($3)
/* B00CC 001AFFCC FFFF4224 */  addiu      $2, $2, -0x1
/* B00D0 001AFFD0 2A086200 */  slt        $at, $3, $2
/* B00D4 001AFFD4 18002010 */  beqz       $at, .L001B0038
/* B00D8 001AFFD8 00000000 */   nop
/* B00DC 001AFFDC 06A30046 */  mov.s      $f12, $f20
/* B00E0 001AFFE0 8800A427 */  addiu      $4, $sp, 0x88
/* B00E4 001AFFE4 8C00A527 */  addiu      $5, $sp, 0x8C
/* B00E8 001AFFE8 A4DD060C */  jal        BtBattleMusic_Excg__FfPfPf
/* B00EC 001AFFEC 00000000 */   nop
/* B00F0 001AFFF0 8C00A1C7 */  lwc1       $f1, 0x8C($sp)
/* B00F4 001AFFF4 00008044 */  mtc1       $0, $f0
/* B00F8 001AFFF8 00000000 */  nop
/* B00FC 001AFFFC 36080046 */  c.le.s     $f1, $f0
/* B0100 001B0000 00000000 */  nop
/* B0104 001B0004 04000145 */  bc1t       .L001B0018
/* B0108 001B0008 00000000 */   nop
/* B010C 001B000C 28260070 */  paddub     $4, $0, $0
/* B0110 001B0010 446C050C */  jal        SndAmbientPlay__Fi
/* B0114 001B0014 00000000 */   nop
.L001B0018:
/* B0118 001B0018 04004016 */  bnez       $18, .L001B002C
/* B011C 001B001C 00000000 */   nop
/* B0120 001B0020 8800ACC7 */  lwc1       $f12, 0x88($sp)
/* B0124 001B0024 6467050C */  jal        SndSetBgmVolf__Ff
/* B0128 001B0028 00000000 */   nop
.L001B002C:
/* B012C 001B002C 8C00ACC7 */  lwc1       $f12, 0x8C($sp)
/* B0130 001B0030 906C050C */  jal        SndAmbientSetVolf__Ff
/* B0134 001B0034 00000000 */   nop
.L001B0038:
/* B0138 001B0038 06A00046 */  mov.s      $f0, $f20
/* B013C 001B003C 5000BF7B */  lq         $31, 0x50($sp)
/* B0140 001B0040 4000B37B */  lq         $19, 0x40($sp)
/* B0144 001B0044 3000B27B */  lq         $18, 0x30($sp)
/* B0148 001B0048 2000B17B */  lq         $17, 0x20($sp)
/* B014C 001B004C 1000B07B */  lq         $16, 0x10($sp)
/* B0150 001B0050 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* B0154 001B0054 9000BD27 */  addiu      $sp, $sp, 0x90
/* B0158 001B0058 0800E003 */  jr         $31
/* B015C 001B005C 00000000 */   nop
