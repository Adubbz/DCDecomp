.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Draw2__11CSeireiKingFP7CCameraPfPf
/* 0030B0 01DAEDB0 C0FEBD27 */  addiu       $29, $29, -0x140
/* 0030B4 01DAEDB4 9000BF7F */  sq          $31, 0x90($29)
/* 0030B8 01DAEDB8 8000BE7F */  sq          $30, 0x80($29)
/* 0030BC 01DAEDBC 7000B77F */  sq          $23, 0x70($29)
/* 0030C0 01DAEDC0 6000B67F */  sq          $22, 0x60($29)
/* 0030C4 01DAEDC4 5000B57F */  sq          $21, 0x50($29)
/* 0030C8 01DAEDC8 4000B47F */  sq          $20, 0x40($29)
/* 0030CC 01DAEDCC 3000B37F */  sq          $19, 0x30($29)
/* 0030D0 01DAEDD0 2000B27F */  sq          $18, 0x20($29)
/* 0030D4 01DAEDD4 1000B17F */  sq          $17, 0x10($29)
/* 0030D8 01DAEDD8 0000B07F */  sq          $16, 0x0($29)
/* 0030DC 01DAEDDC 28AE8070 */  paddub      $21, $4, $0
/* 0030E0 01DAEDE0 2896C070 */  paddub      $18, $6, $0
/* 0030E4 01DAEDE4 288EE070 */  paddub      $17, $7, $0
/* 0030E8 01DAEDE8 2826A070 */  paddub      $4, $5, $0
/* 0030EC 01DAEDEC A000A527 */  addiu       $5, $29, 0xA0
/* 0030F0 01DAEDF0 9C91040C */  jal         GetPos__7CCameraFPf
/* 0030F4 01DAEDF4 00000000 */   nop
/* 0030F8 01DAEDF8 A000A1C7 */  lwc1        $f1, 0xA0($29)
/* 0030FC 01DAEDFC 000020C6 */  lwc1        $f0, 0x0($17)
/* 003100 01DAEE00 01080046 */  sub.s       $f0, $f1, $f0
/* 003104 01DAEE04 A000A0E7 */  swc1        $f0, 0xA0($29)
/* 003108 01DAEE08 040021C6 */  lwc1        $f1, 0x4($17)
/* 00310C 01DAEE0C A400B027 */  addiu       $16, $29, 0xA4
/* 003110 01DAEE10 000000C6 */  lwc1        $f0, 0x0($16)
/* 003114 01DAEE14 01000146 */  sub.s       $f0, $f0, $f1
/* 003118 01DAEE18 000000E6 */  swc1        $f0, 0x0($16)
/* 00311C 01DAEE1C 080021C6 */  lwc1        $f1, 0x8($17)
/* 003120 01DAEE20 A800B127 */  addiu       $17, $29, 0xA8
/* 003124 01DAEE24 000020C6 */  lwc1        $f0, 0x0($17)
/* 003128 01DAEE28 01000146 */  sub.s       $f0, $f0, $f1
/* 00312C 01DAEE2C 000020E6 */  swc1        $f0, 0x0($17)
/* 003130 01DAEE30 A000A427 */  addiu       $4, $29, 0xA0
/* 003134 01DAEE34 282E8070 */  paddub      $5, $4, $0
/* 003138 01DAEE38 9285040C */  jal         sceVu0Normalize
/* 00313C 01DAEE3C 00000000 */   nop
/* 003140 01DAEE40 C841023C */  lui         $2, (0x41C80000 >> 16)
/* 003144 01DAEE44 00088244 */  mtc1        $2, $f1
/* 003148 01DAEE48 A000A0C7 */  lwc1        $f0, 0xA0($29)
/* 00314C 01DAEE4C 02000146 */  mul.s       $f0, $f0, $f1
/* 003150 01DAEE50 A000A0E7 */  swc1        $f0, 0xA0($29)
/* 003154 01DAEE54 000000C6 */  lwc1        $f0, 0x0($16)
/* 003158 01DAEE58 02000146 */  mul.s       $f0, $f0, $f1
/* 00315C 01DAEE5C 000000E6 */  swc1        $f0, 0x0($16)
/* 003160 01DAEE60 000020C6 */  lwc1        $f0, 0x0($17)
/* 003164 01DAEE64 02000146 */  mul.s       $f0, $f0, $f1
/* 003168 01DAEE68 000020E6 */  swc1        $f0, 0x0($17)
/* 00316C 01DAEE6C 3001A427 */  addiu       $4, $29, 0x130
/* 003170 01DAEE70 F88B82DF */  ld          $2, -0x7408($28)
/* 003174 01DAEE74 000082FC */  sd          $2, 0x0($4)
/* 003178 01DAEE78 3001A393 */  lbu         $3, 0x130($29)
/* 00317C 01DAEE7C 03000630 */  andi        $6, $0, 0x3
/* 003180 01DAEE80 FCFF0224 */  addiu       $2, $0, -0x4
/* 003184 01DAEE84 24106200 */  and         $2, $3, $2
/* 003188 01DAEE88 25104600 */  or          $2, $2, $6
/* 00318C 01DAEE8C 3001A2A3 */  sb          $2, 0x130($29)
/* 003190 01DAEE90 3001A593 */  lbu         $5, 0x130($29)
/* 003194 01DAEE94 08000364 */  daddiu      $3, $0, 0x8
/* 003198 01DAEE98 F3FF0224 */  addiu       $2, $0, -0xD
/* 00319C 01DAEE9C 2410A200 */  and         $2, $5, $2
/* 0031A0 01DAEEA0 25104300 */  or          $2, $2, $3
/* 0031A4 01DAEEA4 3001A2A3 */  sb          $2, 0x130($29)
/* 0031A8 01DAEEA8 3001A593 */  lbu         $5, 0x130($29)
/* 0031AC 01DAEEAC 00190600 */  sll         $3, $6, 4
/* 0031B0 01DAEEB0 CFFF0224 */  addiu       $2, $0, -0x31
/* 0031B4 01DAEEB4 2410A200 */  and         $2, $5, $2
/* 0031B8 01DAEEB8 25104300 */  or          $2, $2, $3
/* 0031BC 01DAEEBC 3001A2A3 */  sb          $2, 0x130($29)
/* 0031C0 01DAEEC0 3001A593 */  lbu         $5, 0x130($29)
/* 0031C4 01DAEEC4 40000364 */  daddiu      $3, $0, 0x40
/* 0031C8 01DAEEC8 3FFF0224 */  addiu       $2, $0, -0xC1
/* 0031CC 01DAEECC 2410A200 */  and         $2, $5, $2
/* 0031D0 01DAEED0 25104300 */  or          $2, $2, $3
/* 0031D4 01DAEED4 3001A2A3 */  sb          $2, 0x130($29)
/* 0031D8 01DAEED8 E4BB040C */  jal         MGSetGsALPHA__FP10sceGsAlpha
/* 0031DC 01DAEEDC 00000000 */   nop
/* 0031E0 01DAEEE0 3801A427 */  addiu       $4, $29, 0x138
/* 0031E4 01DAEEE4 F08B82DF */  ld          $2, -0x7410($28)
/* 0031E8 01DAEEE8 000082FC */  sd          $2, 0x0($4)
/* 0031EC 01DAEEEC 3C01A593 */  lbu         $5, 0x13C($29)
/* 0031F0 01DAEEF0 01000364 */  daddiu      $3, $0, 0x1
/* 0031F4 01DAEEF4 FEFF0224 */  addiu       $2, $0, -0x2
/* 0031F8 01DAEEF8 2410A200 */  and         $2, $5, $2
/* 0031FC 01DAEEFC 25104300 */  or          $2, $2, $3
/* 003200 01DAEF00 3C01A2A3 */  sb          $2, 0x13C($29)
/* 003204 01DAEF04 B0BB040C */  jal         MGSetGsZBUF__FP9sceGsZbuf
/* 003208 01DAEF08 00000000 */   nop
/* 00320C 01DAEF0C DC01A1C6 */  lwc1        $f1, 0x1DC($21)
/* 003210 01DAEF10 00008044 */  mtc1        $0, $f0
/* 003214 01DAEF14 00000000 */  nop
/* 003218 01DAEF18 36080046 */  c.le.s      $f1, $f0
/* 00321C 01DAEF1C 00000000 */  nop
/* 003220 01DAEF20 6D000145 */  bc1t        .L01DAF0D8_2B48D8
/* 003224 01DAEF24 00000000 */   nop
/* 003228 01DAEF28 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 00322C 01DAEF2C 00008244 */  mtc1        $2, $f0
/* 003230 01DAEF30 00000000 */  nop
/* 003234 01DAEF34 01080046 */  sub.s       $f0, $f1, $f0
/* 003238 01DAEF38 DC01A0E6 */  swc1        $f0, 0x1DC($21)
/* 00323C 01DAEF3C 3001A426 */  addiu       $4, $21, 0x130
/* 003240 01DAEF40 282E4072 */  paddub      $5, $18, $0
/* 003244 01DAEF44 0C86040C */  jal         sceVu0CopyVector
/* 003248 01DAEF48 00000000 */   nop
/* 00324C 01DAEF4C 3001A0C6 */  lwc1        $f0, 0x130($21)
/* 003250 01DAEF50 B000A0E7 */  swc1        $f0, 0xB0($29)
/* 003254 01DAEF54 3401A0C6 */  lwc1        $f0, 0x134($21)
/* 003258 01DAEF58 B400B227 */  addiu       $18, $29, 0xB4
/* 00325C 01DAEF5C 000040E6 */  swc1        $f0, 0x0($18)
/* 003260 01DAEF60 3801A0C6 */  lwc1        $f0, 0x138($21)
/* 003264 01DAEF64 B800B327 */  addiu       $19, $29, 0xB8
/* 003268 01DAEF68 000060E6 */  swc1        $f0, 0x0($19)
/* 00326C 01DAEF6C 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 003270 01DAEF70 BC00A2AF */  sw          $2, 0xBC($29)
/* 003274 01DAEF74 A040023C */  lui         $2, (0x40A00000 >> 16)
/* 003278 01DAEF78 00608244 */  mtc1        $2, $f12
/* 00327C 01DAEF7C 2040023C */  lui         $2, (0x40200000 >> 16)
/* 003280 01DAEF80 00688244 */  mtc1        $2, $f13
/* 003284 01DAEF84 C000A427 */  addiu       $4, $29, 0xC0
/* 003288 01DAEF88 D000A527 */  addiu       $5, $29, 0xD0
/* 00328C 01DAEF8C B000A627 */  addiu       $6, $29, 0xB0
/* 003290 01DAEF90 283E0070 */  paddub      $7, $0, $0
/* 003294 01DAEF94 D0B9040C */  jal         MGRotTransPers3DSprite__FPiPiPfffi
/* 003298 01DAEF98 00000000 */   nop
/* 00329C 01DAEF9C 01000324 */  addiu       $3, $0, 0x1
/* 0032A0 01DAEFA0 4D004314 */  bne         $2, $3, .L01DAF0D8_2B48D8
/* 0032A4 01DAEFA4 00000000 */   nop
/* 0032A8 01DAEFA8 D000A28F */  lw          $2, 0xD0($29)
/* 0032AC 01DAEFAC 0001A2AF */  sw          $2, 0x100($29)
/* 0032B0 01DAEFB0 C400A28F */  lw          $2, 0xC4($29)
/* 0032B4 01DAEFB4 0401A2AF */  sw          $2, 0x104($29)
/* 0032B8 01DAEFB8 C800B627 */  addiu       $22, $29, 0xC8
/* 0032BC 01DAEFBC 0000C28E */  lw          $2, 0x0($22)
/* 0032C0 01DAEFC0 0801B427 */  addiu       $20, $29, 0x108
/* 0032C4 01DAEFC4 000082AE */  sw          $2, 0x0($20)
/* 0032C8 01DAEFC8 CC00A28F */  lw          $2, 0xCC($29)
/* 0032CC 01DAEFCC 0C01A2AF */  sw          $2, 0x10C($29)
/* 0032D0 01DAEFD0 C000A28F */  lw          $2, 0xC0($29)
/* 0032D4 01DAEFD4 1001A2AF */  sw          $2, 0x110($29)
/* 0032D8 01DAEFD8 D400A28F */  lw          $2, 0xD4($29)
/* 0032DC 01DAEFDC 1401A2AF */  sw          $2, 0x114($29)
/* 0032E0 01DAEFE0 D800BE27 */  addiu       $30, $29, 0xD8
/* 0032E4 01DAEFE4 0000C28F */  lw          $2, 0x0($30)
/* 0032E8 01DAEFE8 1801B727 */  addiu       $23, $29, 0x118
/* 0032EC 01DAEFEC 0000E2AE */  sw          $2, 0x0($23)
/* 0032F0 01DAEFF0 DC00A28F */  lw          $2, 0xDC($29)
/* 0032F4 01DAEFF4 1C01A2AF */  sw          $2, 0x11C($29)
/* 0032F8 01DAEFF8 B000A1C7 */  lwc1        $f1, 0xB0($29)
/* 0032FC 01DAEFFC A000A0C7 */  lwc1        $f0, 0xA0($29)
/* 003300 01DAF000 00080046 */  add.s       $f0, $f1, $f0
/* 003304 01DAF004 B000A0E7 */  swc1        $f0, 0xB0($29)
/* 003308 01DAF008 000041C6 */  lwc1        $f1, 0x0($18)
/* 00330C 01DAF00C 000000C6 */  lwc1        $f0, 0x0($16)
/* 003310 01DAF010 00080046 */  add.s       $f0, $f1, $f0
/* 003314 01DAF014 000040E6 */  swc1        $f0, 0x0($18)
/* 003318 01DAF018 000061C6 */  lwc1        $f1, 0x0($19)
/* 00331C 01DAF01C 000020C6 */  lwc1        $f0, 0x0($17)
/* 003320 01DAF020 00080046 */  add.s       $f0, $f1, $f0
/* 003324 01DAF024 000060E6 */  swc1        $f0, 0x0($19)
/* 003328 01DAF028 A040023C */  lui         $2, (0x40A00000 >> 16)
/* 00332C 01DAF02C 00608244 */  mtc1        $2, $f12
/* 003330 01DAF030 2040023C */  lui         $2, (0x40200000 >> 16)
/* 003334 01DAF034 00688244 */  mtc1        $2, $f13
/* 003338 01DAF038 E000A427 */  addiu       $4, $29, 0xE0
/* 00333C 01DAF03C F000A527 */  addiu       $5, $29, 0xF0
/* 003340 01DAF040 B000A627 */  addiu       $6, $29, 0xB0
/* 003344 01DAF044 283E0070 */  paddub      $7, $0, $0
/* 003348 01DAF048 D0B9040C */  jal         MGRotTransPers3DSprite__FPiPiPfffi
/* 00334C 01DAF04C 00000000 */   nop
/* 003350 01DAF050 01000324 */  addiu       $3, $0, 0x1
/* 003354 01DAF054 06004314 */  bne         $2, $3, .L01DAF070_2B4870
/* 003358 01DAF058 00000000 */   nop
/* 00335C 01DAF05C E800A28F */  lw          $2, 0xE8($29)
/* 003360 01DAF060 0000C2AF */  sw          $2, 0x0($30)
/* 003364 01DAF064 0000E2AE */  sw          $2, 0x0($23)
/* 003368 01DAF068 0000C2AE */  sw          $2, 0x0($22)
/* 00336C 01DAF06C 000082AE */  sw          $2, 0x0($20)
.L01DAF070_2B4870:
/* 003370 01DAF070 2001A0AF */  sw          $0, 0x120($29)
/* 003374 01DAF074 2401A0AF */  sw          $0, 0x124($29)
/* 003378 01DAF078 40000224 */  addiu       $2, $0, 0x40
/* 00337C 01DAF07C 2801A2AF */  sw          $2, 0x128($29)
/* 003380 01DAF080 2C01A2AF */  sw          $2, 0x12C($29)
/* 003384 01DAF084 C701023C */  lui         $2, %hi(TexManager)
/* 003388 01DAF088 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00338C 01DAF08C DE01023C */  lui         $2, %hi(LIT_514__3)
/* 003390 01DAF090 68BF4524 */  addiu       $5, $2, %lo(LIT_514__3)
/* 003394 01DAF094 FFFF0624 */  addiu       $6, $0, -0x1
/* 003398 01DAF098 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 00339C 01DAF09C 00000000 */   nop
/* 0033A0 01DAF0A0 28864070 */  paddub      $16, $2, $0
/* 0033A4 01DAF0A4 DC01ACC6 */  lwc1        $f12, 0x1DC($21)
/* 0033A8 01DAF0A8 5044040C */  jal         fptoui
/* 0033AC 01DAF0AC 00000000 */   nop
/* 0033B0 01DAF0B0 D48B848F */  lw          $4, -0x742C($28)
/* 0033B4 01DAF0B4 282E0072 */  paddub      $5, $16, $0
/* 0033B8 01DAF0B8 2001A627 */  addiu       $6, $29, 0x120
/* 0033BC 01DAF0BC C000A727 */  addiu       $7, $29, 0xC0
/* 0033C0 01DAF0C0 0001A827 */  addiu       $8, $29, 0x100
/* 0033C4 01DAF0C4 1001A927 */  addiu       $9, $29, 0x110
/* 0033C8 01DAF0C8 D000AA27 */  addiu       $10, $29, 0xD0
/* 0033CC 01DAF0CC 285E4070 */  paddub      $11, $2, $0
/* 0033D0 01DAF0D0 1C75050C */  jal         set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc
/* 0033D4 01DAF0D4 00000000 */   nop
.L01DAF0D8_2B48D8:
/* 0033D8 01DAF0D8 28260070 */  paddub      $4, $0, $0
/* 0033DC 01DAF0DC E4BB040C */  jal         MGSetGsALPHA__FP10sceGsAlpha
/* 0033E0 01DAF0E0 00000000 */   nop
/* 0033E4 01DAF0E4 28260070 */  paddub      $4, $0, $0
/* 0033E8 01DAF0E8 B0BB040C */  jal         MGSetGsZBUF__FP9sceGsZbuf
/* 0033EC 01DAF0EC 00000000 */   nop
/* 0033F0 01DAF0F0 9000BF7B */  lq          $31, 0x90($29)
/* 0033F4 01DAF0F4 8000BE7B */  lq          $30, 0x80($29)
/* 0033F8 01DAF0F8 7000B77B */  lq          $23, 0x70($29)
/* 0033FC 01DAF0FC 6000B67B */  lq          $22, 0x60($29)
/* 003400 01DAF100 5000B57B */  lq          $21, 0x50($29)
/* 003404 01DAF104 4000B47B */  lq          $20, 0x40($29)
/* 003408 01DAF108 3000B37B */  lq          $19, 0x30($29)
/* 00340C 01DAF10C 2000B27B */  lq          $18, 0x20($29)
/* 003410 01DAF110 1000B17B */  lq          $17, 0x10($29)
/* 003414 01DAF114 0000B07B */  lq          $16, 0x0($29)
/* 003418 01DAF118 4001BD27 */  addiu       $29, $29, 0x140
/* 00341C 01DAF11C 0800E003 */  jr          $31
/* 003420 01DAF120 00000000 */   nop
/* 003424 01DAF124 00000000 */  nop
/* 003428 01DAF128 00000000 */  nop
/* 00342C 01DAF12C 00000000 */  nop
