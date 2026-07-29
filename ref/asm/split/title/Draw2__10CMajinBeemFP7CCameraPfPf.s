.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Draw2__10CMajinBeemFP7CCameraPfPf
/* 0022A0 01DADFA0 C0FEBD27 */  addiu       $29, $29, -0x140
/* 0022A4 01DADFA4 9000BF7F */  sq          $31, 0x90($29)
/* 0022A8 01DADFA8 8000BE7F */  sq          $30, 0x80($29)
/* 0022AC 01DADFAC 7000B77F */  sq          $23, 0x70($29)
/* 0022B0 01DADFB0 6000B67F */  sq          $22, 0x60($29)
/* 0022B4 01DADFB4 5000B57F */  sq          $21, 0x50($29)
/* 0022B8 01DADFB8 4000B47F */  sq          $20, 0x40($29)
/* 0022BC 01DADFBC 3000B37F */  sq          $19, 0x30($29)
/* 0022C0 01DADFC0 2000B27F */  sq          $18, 0x20($29)
/* 0022C4 01DADFC4 1000B17F */  sq          $17, 0x10($29)
/* 0022C8 01DADFC8 0000B07F */  sq          $16, 0x0($29)
/* 0022CC 01DADFCC 28AE8070 */  paddub      $21, $4, $0
/* 0022D0 01DADFD0 2896C070 */  paddub      $18, $6, $0
/* 0022D4 01DADFD4 288EE070 */  paddub      $17, $7, $0
/* 0022D8 01DADFD8 2826A070 */  paddub      $4, $5, $0
/* 0022DC 01DADFDC A000A527 */  addiu       $5, $29, 0xA0
/* 0022E0 01DADFE0 9C91040C */  jal         GetPos__7CCameraFPf
/* 0022E4 01DADFE4 00000000 */   nop
/* 0022E8 01DADFE8 A000A1C7 */  lwc1        $f1, 0xA0($29)
/* 0022EC 01DADFEC 000020C6 */  lwc1        $f0, 0x0($17)
/* 0022F0 01DADFF0 01080046 */  sub.s       $f0, $f1, $f0
/* 0022F4 01DADFF4 A000A0E7 */  swc1        $f0, 0xA0($29)
/* 0022F8 01DADFF8 040021C6 */  lwc1        $f1, 0x4($17)
/* 0022FC 01DADFFC A400B027 */  addiu       $16, $29, 0xA4
/* 002300 01DAE000 000000C6 */  lwc1        $f0, 0x0($16)
/* 002304 01DAE004 01000146 */  sub.s       $f0, $f0, $f1
/* 002308 01DAE008 000000E6 */  swc1        $f0, 0x0($16)
/* 00230C 01DAE00C 080021C6 */  lwc1        $f1, 0x8($17)
/* 002310 01DAE010 A800B127 */  addiu       $17, $29, 0xA8
/* 002314 01DAE014 000020C6 */  lwc1        $f0, 0x0($17)
/* 002318 01DAE018 01000146 */  sub.s       $f0, $f0, $f1
/* 00231C 01DAE01C 000020E6 */  swc1        $f0, 0x0($17)
/* 002320 01DAE020 A000A427 */  addiu       $4, $29, 0xA0
/* 002324 01DAE024 282E8070 */  paddub      $5, $4, $0
/* 002328 01DAE028 9285040C */  jal         sceVu0Normalize
/* 00232C 01DAE02C 00000000 */   nop
/* 002330 01DAE030 7041023C */  lui         $2, (0x41700000 >> 16)
/* 002334 01DAE034 00088244 */  mtc1        $2, $f1
/* 002338 01DAE038 A000A0C7 */  lwc1        $f0, 0xA0($29)
/* 00233C 01DAE03C 02000146 */  mul.s       $f0, $f0, $f1
/* 002340 01DAE040 A000A0E7 */  swc1        $f0, 0xA0($29)
/* 002344 01DAE044 000000C6 */  lwc1        $f0, 0x0($16)
/* 002348 01DAE048 02000146 */  mul.s       $f0, $f0, $f1
/* 00234C 01DAE04C 000000E6 */  swc1        $f0, 0x0($16)
/* 002350 01DAE050 000020C6 */  lwc1        $f0, 0x0($17)
/* 002354 01DAE054 02000146 */  mul.s       $f0, $f0, $f1
/* 002358 01DAE058 000020E6 */  swc1        $f0, 0x0($17)
/* 00235C 01DAE05C 3001A427 */  addiu       $4, $29, 0x130
/* 002360 01DAE060 F88B82DF */  ld          $2, -0x7408($28)
/* 002364 01DAE064 000082FC */  sd          $2, 0x0($4)
/* 002368 01DAE068 3001A393 */  lbu         $3, 0x130($29)
/* 00236C 01DAE06C 03000630 */  andi        $6, $0, 0x3
/* 002370 01DAE070 FCFF0224 */  addiu       $2, $0, -0x4
/* 002374 01DAE074 24106200 */  and         $2, $3, $2
/* 002378 01DAE078 25104600 */  or          $2, $2, $6
/* 00237C 01DAE07C 3001A2A3 */  sb          $2, 0x130($29)
/* 002380 01DAE080 3001A593 */  lbu         $5, 0x130($29)
/* 002384 01DAE084 08000364 */  daddiu      $3, $0, 0x8
/* 002388 01DAE088 F3FF0224 */  addiu       $2, $0, -0xD
/* 00238C 01DAE08C 2410A200 */  and         $2, $5, $2
/* 002390 01DAE090 25104300 */  or          $2, $2, $3
/* 002394 01DAE094 3001A2A3 */  sb          $2, 0x130($29)
/* 002398 01DAE098 3001A593 */  lbu         $5, 0x130($29)
/* 00239C 01DAE09C 00190600 */  sll         $3, $6, 4
/* 0023A0 01DAE0A0 CFFF0224 */  addiu       $2, $0, -0x31
/* 0023A4 01DAE0A4 2410A200 */  and         $2, $5, $2
/* 0023A8 01DAE0A8 25104300 */  or          $2, $2, $3
/* 0023AC 01DAE0AC 3001A2A3 */  sb          $2, 0x130($29)
/* 0023B0 01DAE0B0 3001A593 */  lbu         $5, 0x130($29)
/* 0023B4 01DAE0B4 40000364 */  daddiu      $3, $0, 0x40
/* 0023B8 01DAE0B8 3FFF0224 */  addiu       $2, $0, -0xC1
/* 0023BC 01DAE0BC 2410A200 */  and         $2, $5, $2
/* 0023C0 01DAE0C0 25104300 */  or          $2, $2, $3
/* 0023C4 01DAE0C4 3001A2A3 */  sb          $2, 0x130($29)
/* 0023C8 01DAE0C8 E4BB040C */  jal         MGSetGsALPHA__FP10sceGsAlpha
/* 0023CC 01DAE0CC 00000000 */   nop
/* 0023D0 01DAE0D0 3801A427 */  addiu       $4, $29, 0x138
/* 0023D4 01DAE0D4 F08B82DF */  ld          $2, -0x7410($28)
/* 0023D8 01DAE0D8 000082FC */  sd          $2, 0x0($4)
/* 0023DC 01DAE0DC 3C01A593 */  lbu         $5, 0x13C($29)
/* 0023E0 01DAE0E0 01000364 */  daddiu      $3, $0, 0x1
/* 0023E4 01DAE0E4 FEFF0224 */  addiu       $2, $0, -0x2
/* 0023E8 01DAE0E8 2410A200 */  and         $2, $5, $2
/* 0023EC 01DAE0EC 25104300 */  or          $2, $2, $3
/* 0023F0 01DAE0F0 3C01A2A3 */  sb          $2, 0x13C($29)
/* 0023F4 01DAE0F4 B0BB040C */  jal         MGSetGsZBUF__FP9sceGsZbuf
/* 0023F8 01DAE0F8 00000000 */   nop
/* 0023FC 01DAE0FC A006A1C6 */  lwc1        $f1, 0x6A0($21)
/* 002400 01DAE100 00008044 */  mtc1        $0, $f0
/* 002404 01DAE104 00000000 */  nop
/* 002408 01DAE108 36080046 */  c.le.s      $f1, $f0
/* 00240C 01DAE10C 00000000 */  nop
/* 002410 01DAE110 75000145 */  bc1t        .L01DAE2E8_2B3AE8
/* 002414 01DAE114 00000000 */   nop
/* 002418 01DAE118 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 00241C 01DAE11C 00008244 */  mtc1        $2, $f0
/* 002420 01DAE120 00000000 */  nop
/* 002424 01DAE124 01080046 */  sub.s       $f0, $f1, $f0
/* 002428 01DAE128 A006A0E6 */  swc1        $f0, 0x6A0($21)
/* 00242C 01DAE12C B005A1C6 */  lwc1        $f1, 0x5B0($21)
/* 002430 01DAE130 803E023C */  lui         $2, (0x3E800000 >> 16)
/* 002434 01DAE134 00008244 */  mtc1        $2, $f0
/* 002438 01DAE138 00000000 */  nop
/* 00243C 01DAE13C 01080046 */  sub.s       $f0, $f1, $f0
/* 002440 01DAE140 B005A0E6 */  swc1        $f0, 0x5B0($21)
/* 002444 01DAE144 B003A426 */  addiu       $4, $21, 0x3B0
/* 002448 01DAE148 282E4072 */  paddub      $5, $18, $0
/* 00244C 01DAE14C 0C86040C */  jal         sceVu0CopyVector
/* 002450 01DAE150 00000000 */   nop
/* 002454 01DAE154 B003A0C6 */  lwc1        $f0, 0x3B0($21)
/* 002458 01DAE158 B000A0E7 */  swc1        $f0, 0xB0($29)
/* 00245C 01DAE15C B403A0C6 */  lwc1        $f0, 0x3B4($21)
/* 002460 01DAE160 B400B227 */  addiu       $18, $29, 0xB4
/* 002464 01DAE164 000040E6 */  swc1        $f0, 0x0($18)
/* 002468 01DAE168 B803A0C6 */  lwc1        $f0, 0x3B8($21)
/* 00246C 01DAE16C B800B327 */  addiu       $19, $29, 0xB8
/* 002470 01DAE170 000060E6 */  swc1        $f0, 0x0($19)
/* 002474 01DAE174 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 002478 01DAE178 BC00A2AF */  sw          $2, 0xBC($29)
/* 00247C 01DAE17C B005ACC6 */  lwc1        $f12, 0x5B0($21)
/* 002480 01DAE180 0040023C */  lui         $2, (0x40000000 >> 16)
/* 002484 01DAE184 00008244 */  mtc1        $2, $f0
/* 002488 01DAE188 00000000 */  nop
/* 00248C 01DAE18C 43630046 */  div.s       $f13, $f12, $f0
/* 002490 01DAE190 C000A427 */  addiu       $4, $29, 0xC0
/* 002494 01DAE194 D000A527 */  addiu       $5, $29, 0xD0
/* 002498 01DAE198 B000A627 */  addiu       $6, $29, 0xB0
/* 00249C 01DAE19C 283E0070 */  paddub      $7, $0, $0
/* 0024A0 01DAE1A0 D0B9040C */  jal         MGRotTransPers3DSprite__FPiPiPfffi
/* 0024A4 01DAE1A4 00000000 */   nop
/* 0024A8 01DAE1A8 01000324 */  addiu       $3, $0, 0x1
/* 0024AC 01DAE1AC 4E004314 */  bne         $2, $3, .L01DAE2E8_2B3AE8
/* 0024B0 01DAE1B0 00000000 */   nop
/* 0024B4 01DAE1B4 D000A28F */  lw          $2, 0xD0($29)
/* 0024B8 01DAE1B8 0001A2AF */  sw          $2, 0x100($29)
/* 0024BC 01DAE1BC C400A28F */  lw          $2, 0xC4($29)
/* 0024C0 01DAE1C0 0401A2AF */  sw          $2, 0x104($29)
/* 0024C4 01DAE1C4 C800B627 */  addiu       $22, $29, 0xC8
/* 0024C8 01DAE1C8 0000C28E */  lw          $2, 0x0($22)
/* 0024CC 01DAE1CC 0801B427 */  addiu       $20, $29, 0x108
/* 0024D0 01DAE1D0 000082AE */  sw          $2, 0x0($20)
/* 0024D4 01DAE1D4 CC00A28F */  lw          $2, 0xCC($29)
/* 0024D8 01DAE1D8 0C01A2AF */  sw          $2, 0x10C($29)
/* 0024DC 01DAE1DC C000A28F */  lw          $2, 0xC0($29)
/* 0024E0 01DAE1E0 1001A2AF */  sw          $2, 0x110($29)
/* 0024E4 01DAE1E4 D400A28F */  lw          $2, 0xD4($29)
/* 0024E8 01DAE1E8 1401A2AF */  sw          $2, 0x114($29)
/* 0024EC 01DAE1EC D800BE27 */  addiu       $30, $29, 0xD8
/* 0024F0 01DAE1F0 0000C28F */  lw          $2, 0x0($30)
/* 0024F4 01DAE1F4 1801B727 */  addiu       $23, $29, 0x118
/* 0024F8 01DAE1F8 0000E2AE */  sw          $2, 0x0($23)
/* 0024FC 01DAE1FC DC00A28F */  lw          $2, 0xDC($29)
/* 002500 01DAE200 1C01A2AF */  sw          $2, 0x11C($29)
/* 002504 01DAE204 B000A1C7 */  lwc1        $f1, 0xB0($29)
/* 002508 01DAE208 A000A0C7 */  lwc1        $f0, 0xA0($29)
/* 00250C 01DAE20C 00080046 */  add.s       $f0, $f1, $f0
/* 002510 01DAE210 B000A0E7 */  swc1        $f0, 0xB0($29)
/* 002514 01DAE214 000041C6 */  lwc1        $f1, 0x0($18)
/* 002518 01DAE218 000000C6 */  lwc1        $f0, 0x0($16)
/* 00251C 01DAE21C 00080046 */  add.s       $f0, $f1, $f0
/* 002520 01DAE220 000040E6 */  swc1        $f0, 0x0($18)
/* 002524 01DAE224 000061C6 */  lwc1        $f1, 0x0($19)
/* 002528 01DAE228 000020C6 */  lwc1        $f0, 0x0($17)
/* 00252C 01DAE22C 00080046 */  add.s       $f0, $f1, $f0
/* 002530 01DAE230 000060E6 */  swc1        $f0, 0x0($19)
/* 002534 01DAE234 B005ACC6 */  lwc1        $f12, 0x5B0($21)
/* 002538 01DAE238 0040023C */  lui         $2, (0x40000000 >> 16)
/* 00253C 01DAE23C 00008244 */  mtc1        $2, $f0
/* 002540 01DAE240 00000000 */  nop
/* 002544 01DAE244 43630046 */  div.s       $f13, $f12, $f0
/* 002548 01DAE248 E000A427 */  addiu       $4, $29, 0xE0
/* 00254C 01DAE24C F000A527 */  addiu       $5, $29, 0xF0
/* 002550 01DAE250 B000A627 */  addiu       $6, $29, 0xB0
/* 002554 01DAE254 283E0070 */  paddub      $7, $0, $0
/* 002558 01DAE258 D0B9040C */  jal         MGRotTransPers3DSprite__FPiPiPfffi
/* 00255C 01DAE25C 00000000 */   nop
/* 002560 01DAE260 01000324 */  addiu       $3, $0, 0x1
/* 002564 01DAE264 06004314 */  bne         $2, $3, .L01DAE280_2B3A80
/* 002568 01DAE268 00000000 */   nop
/* 00256C 01DAE26C E800A28F */  lw          $2, 0xE8($29)
/* 002570 01DAE270 0000C2AF */  sw          $2, 0x0($30)
/* 002574 01DAE274 0000E2AE */  sw          $2, 0x0($23)
/* 002578 01DAE278 0000C2AE */  sw          $2, 0x0($22)
/* 00257C 01DAE27C 000082AE */  sw          $2, 0x0($20)
.L01DAE280_2B3A80:
/* 002580 01DAE280 2001A0AF */  sw          $0, 0x120($29)
/* 002584 01DAE284 2401A0AF */  sw          $0, 0x124($29)
/* 002588 01DAE288 80000224 */  addiu       $2, $0, 0x80
/* 00258C 01DAE28C 2801A2AF */  sw          $2, 0x128($29)
/* 002590 01DAE290 2C01A2AF */  sw          $2, 0x12C($29)
/* 002594 01DAE294 C701023C */  lui         $2, %hi(TexManager)
/* 002598 01DAE298 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00259C 01DAE29C DE01023C */  lui         $2, %hi(LIT_435__3)
/* 0025A0 01DAE2A0 60BF4524 */  addiu       $5, $2, %lo(LIT_435__3)
/* 0025A4 01DAE2A4 FFFF0624 */  addiu       $6, $0, -0x1
/* 0025A8 01DAE2A8 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0025AC 01DAE2AC 00000000 */   nop
/* 0025B0 01DAE2B0 28864070 */  paddub      $16, $2, $0
/* 0025B4 01DAE2B4 A006ACC6 */  lwc1        $f12, 0x6A0($21)
/* 0025B8 01DAE2B8 5044040C */  jal         fptoui
/* 0025BC 01DAE2BC 00000000 */   nop
/* 0025C0 01DAE2C0 D48B848F */  lw          $4, -0x742C($28)
/* 0025C4 01DAE2C4 282E0072 */  paddub      $5, $16, $0
/* 0025C8 01DAE2C8 2001A627 */  addiu       $6, $29, 0x120
/* 0025CC 01DAE2CC C000A727 */  addiu       $7, $29, 0xC0
/* 0025D0 01DAE2D0 0001A827 */  addiu       $8, $29, 0x100
/* 0025D4 01DAE2D4 1001A927 */  addiu       $9, $29, 0x110
/* 0025D8 01DAE2D8 D000AA27 */  addiu       $10, $29, 0xD0
/* 0025DC 01DAE2DC 285E4070 */  paddub      $11, $2, $0
/* 0025E0 01DAE2E0 1C75050C */  jal         set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc
/* 0025E4 01DAE2E4 00000000 */   nop
.L01DAE2E8_2B3AE8:
/* 0025E8 01DAE2E8 28260070 */  paddub      $4, $0, $0
/* 0025EC 01DAE2EC E4BB040C */  jal         MGSetGsALPHA__FP10sceGsAlpha
/* 0025F0 01DAE2F0 00000000 */   nop
/* 0025F4 01DAE2F4 28260070 */  paddub      $4, $0, $0
/* 0025F8 01DAE2F8 B0BB040C */  jal         MGSetGsZBUF__FP9sceGsZbuf
/* 0025FC 01DAE2FC 00000000 */   nop
/* 002600 01DAE300 9000BF7B */  lq          $31, 0x90($29)
/* 002604 01DAE304 8000BE7B */  lq          $30, 0x80($29)
/* 002608 01DAE308 7000B77B */  lq          $23, 0x70($29)
/* 00260C 01DAE30C 6000B67B */  lq          $22, 0x60($29)
/* 002610 01DAE310 5000B57B */  lq          $21, 0x50($29)
/* 002614 01DAE314 4000B47B */  lq          $20, 0x40($29)
/* 002618 01DAE318 3000B37B */  lq          $19, 0x30($29)
/* 00261C 01DAE31C 2000B27B */  lq          $18, 0x20($29)
/* 002620 01DAE320 1000B17B */  lq          $17, 0x10($29)
/* 002624 01DAE324 0000B07B */  lq          $16, 0x0($29)
/* 002628 01DAE328 4001BD27 */  addiu       $29, $29, 0x140
/* 00262C 01DAE32C 0800E003 */  jr          $31
/* 002630 01DAE330 00000000 */   nop
/* 002634 01DAE334 00000000 */  nop
/* 002638 01DAE338 00000000 */  nop
/* 00263C 01DAE33C 00000000 */  nop
