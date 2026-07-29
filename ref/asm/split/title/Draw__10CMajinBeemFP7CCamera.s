.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Draw__10CMajinBeemFP7CCamera
/* 002050 01DADD50 30FFBD27 */  addiu       $29, $29, -0xD0
/* 002054 01DADD54 4000BF7F */  sq          $31, 0x40($29)
/* 002058 01DADD58 3000B37F */  sq          $19, 0x30($29)
/* 00205C 01DADD5C 2000B27F */  sq          $18, 0x20($29)
/* 002060 01DADD60 1000B17F */  sq          $17, 0x10($29)
/* 002064 01DADD64 0000B07F */  sq          $16, 0x0($29)
/* 002068 01DADD68 28968070 */  paddub      $18, $4, $0
/* 00206C 01DADD6C 2826A070 */  paddub      $4, $5, $0
/* 002070 01DADD70 5000A527 */  addiu       $5, $29, 0x50
/* 002074 01DADD74 9C91040C */  jal         GetPos__7CCameraFPf
/* 002078 01DADD78 00000000 */   nop
/* 00207C 01DADD7C C000A427 */  addiu       $4, $29, 0xC0
/* 002080 01DADD80 F88B82DF */  ld          $2, -0x7408($28)
/* 002084 01DADD84 000082FC */  sd          $2, 0x0($4)
/* 002088 01DADD88 C000A393 */  lbu         $3, 0xC0($29)
/* 00208C 01DADD8C 03000630 */  andi        $6, $0, 0x3
/* 002090 01DADD90 FCFF0224 */  addiu       $2, $0, -0x4
/* 002094 01DADD94 24106200 */  and         $2, $3, $2
/* 002098 01DADD98 25104600 */  or          $2, $2, $6
/* 00209C 01DADD9C C000A2A3 */  sb          $2, 0xC0($29)
/* 0020A0 01DADDA0 C000A593 */  lbu         $5, 0xC0($29)
/* 0020A4 01DADDA4 08000364 */  daddiu      $3, $0, 0x8
/* 0020A8 01DADDA8 F3FF0224 */  addiu       $2, $0, -0xD
/* 0020AC 01DADDAC 2410A200 */  and         $2, $5, $2
/* 0020B0 01DADDB0 25104300 */  or          $2, $2, $3
/* 0020B4 01DADDB4 C000A2A3 */  sb          $2, 0xC0($29)
/* 0020B8 01DADDB8 C000A593 */  lbu         $5, 0xC0($29)
/* 0020BC 01DADDBC 00190600 */  sll         $3, $6, 4
/* 0020C0 01DADDC0 CFFF0224 */  addiu       $2, $0, -0x31
/* 0020C4 01DADDC4 2410A200 */  and         $2, $5, $2
/* 0020C8 01DADDC8 25104300 */  or          $2, $2, $3
/* 0020CC 01DADDCC C000A2A3 */  sb          $2, 0xC0($29)
/* 0020D0 01DADDD0 C000A593 */  lbu         $5, 0xC0($29)
/* 0020D4 01DADDD4 40000364 */  daddiu      $3, $0, 0x40
/* 0020D8 01DADDD8 3FFF0224 */  addiu       $2, $0, -0xC1
/* 0020DC 01DADDDC 2410A200 */  and         $2, $5, $2
/* 0020E0 01DADDE0 25104300 */  or          $2, $2, $3
/* 0020E4 01DADDE4 C000A2A3 */  sb          $2, 0xC0($29)
/* 0020E8 01DADDE8 E4BB040C */  jal         MGSetGsALPHA__FP10sceGsAlpha
/* 0020EC 01DADDEC 00000000 */   nop
/* 0020F0 01DADDF0 C800A427 */  addiu       $4, $29, 0xC8
/* 0020F4 01DADDF4 F08B82DF */  ld          $2, -0x7410($28)
/* 0020F8 01DADDF8 000082FC */  sd          $2, 0x0($4)
/* 0020FC 01DADDFC CC00A593 */  lbu         $5, 0xCC($29)
/* 002100 01DADE00 01000364 */  daddiu      $3, $0, 0x1
/* 002104 01DADE04 FEFF0224 */  addiu       $2, $0, -0x2
/* 002108 01DADE08 2410A200 */  and         $2, $5, $2
/* 00210C 01DADE0C 25104300 */  or          $2, $2, $3
/* 002110 01DADE10 CC00A2A3 */  sb          $2, 0xCC($29)
/* 002114 01DADE14 B0BB040C */  jal         MGSetGsZBUF__FP9sceGsZbuf
/* 002118 01DADE18 00000000 */   nop
/* 00211C 01DADE1C 28860070 */  paddub      $16, $0, $0
/* 002120 01DADE20 4E000010 */  b           .L01DADF5C_2B375C
/* 002124 01DADE24 00000000 */   nop
.L01DADE28_2B3628:
/* 002128 01DADE28 A406438E */  lw          $3, 0x6A4($18)
/* 00212C 01DADE2C 01000224 */  addiu       $2, $0, 0x1
/* 002130 01DADE30 49006214 */  bne         $3, $2, .L01DADF58_2B3758
/* 002134 01DADE34 00000000 */   nop
/* 002138 01DADE38 80881000 */  sll         $17, $16, 2
/* 00213C 01DADE3C 21183202 */  addu        $3, $17, $18
/* 002140 01DADE40 D403628C */  lw          $2, 0x3D4($3)
/* 002144 01DADE44 44004004 */  bltz        $2, .L01DADF58_2B3758
/* 002148 01DADE48 00000000 */   nop
/* 00214C 01DADE4C 00111000 */  sll         $2, $16, 4
/* 002150 01DADE50 21104202 */  addu        $2, $18, $2
/* 002154 01DADE54 000040C4 */  lwc1        $f0, 0x0($2)
/* 002158 01DADE58 6000A0E7 */  swc1        $f0, 0x60($29)
/* 00215C 01DADE5C 040040C4 */  lwc1        $f0, 0x4($2)
/* 002160 01DADE60 6400A0E7 */  swc1        $f0, 0x64($29)
/* 002164 01DADE64 080040C4 */  lwc1        $f0, 0x8($2)
/* 002168 01DADE68 6800A0E7 */  swc1        $f0, 0x68($29)
/* 00216C 01DADE6C 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 002170 01DADE70 6C00A2AF */  sw          $2, 0x6C($29)
/* 002174 01DADE74 C4046CC4 */  lwc1        $f12, 0x4C4($3)
/* 002178 01DADE78 0040023C */  lui         $2, (0x40000000 >> 16)
/* 00217C 01DADE7C 00008244 */  mtc1        $2, $f0
/* 002180 01DADE80 00000000 */  nop
/* 002184 01DADE84 43630046 */  div.s       $f13, $f12, $f0
/* 002188 01DADE88 7000A427 */  addiu       $4, $29, 0x70
/* 00218C 01DADE8C 8000A527 */  addiu       $5, $29, 0x80
/* 002190 01DADE90 6000A627 */  addiu       $6, $29, 0x60
/* 002194 01DADE94 283E0070 */  paddub      $7, $0, $0
/* 002198 01DADE98 D0B9040C */  jal         MGRotTransPers3DSprite__FPiPiPfffi
/* 00219C 01DADE9C 00000000 */   nop
/* 0021A0 01DADEA0 01000324 */  addiu       $3, $0, 0x1
/* 0021A4 01DADEA4 2C004314 */  bne         $2, $3, .L01DADF58_2B3758
/* 0021A8 01DADEA8 00000000 */   nop
/* 0021AC 01DADEAC 8000A28F */  lw          $2, 0x80($29)
/* 0021B0 01DADEB0 9000A2AF */  sw          $2, 0x90($29)
/* 0021B4 01DADEB4 7400A28F */  lw          $2, 0x74($29)
/* 0021B8 01DADEB8 9400A2AF */  sw          $2, 0x94($29)
/* 0021BC 01DADEBC 7800A28F */  lw          $2, 0x78($29)
/* 0021C0 01DADEC0 9800A2AF */  sw          $2, 0x98($29)
/* 0021C4 01DADEC4 7C00A28F */  lw          $2, 0x7C($29)
/* 0021C8 01DADEC8 9C00A2AF */  sw          $2, 0x9C($29)
/* 0021CC 01DADECC 7000A28F */  lw          $2, 0x70($29)
/* 0021D0 01DADED0 A000A2AF */  sw          $2, 0xA0($29)
/* 0021D4 01DADED4 8400A28F */  lw          $2, 0x84($29)
/* 0021D8 01DADED8 A400A2AF */  sw          $2, 0xA4($29)
/* 0021DC 01DADEDC 8800A28F */  lw          $2, 0x88($29)
/* 0021E0 01DADEE0 A800A2AF */  sw          $2, 0xA8($29)
/* 0021E4 01DADEE4 8C00A28F */  lw          $2, 0x8C($29)
/* 0021E8 01DADEE8 AC00A2AF */  sw          $2, 0xAC($29)
/* 0021EC 01DADEEC B000A0AF */  sw          $0, 0xB0($29)
/* 0021F0 01DADEF0 B400A0AF */  sw          $0, 0xB4($29)
/* 0021F4 01DADEF4 80000224 */  addiu       $2, $0, 0x80
/* 0021F8 01DADEF8 B800A2AF */  sw          $2, 0xB8($29)
/* 0021FC 01DADEFC BC00A2AF */  sw          $2, 0xBC($29)
/* 002200 01DADF00 C701023C */  lui         $2, %hi(TexManager)
/* 002204 01DADF04 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 002208 01DADF08 DE01023C */  lui         $2, %hi(LIT_435__3)
/* 00220C 01DADF0C 60BF4524 */  addiu       $5, $2, %lo(LIT_435__3)
/* 002210 01DADF10 FFFF0624 */  addiu       $6, $0, -0x1
/* 002214 01DADF14 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 002218 01DADF18 00000000 */   nop
/* 00221C 01DADF1C 289E4070 */  paddub      $19, $2, $0
/* 002220 01DADF20 21103202 */  addu        $2, $17, $18
/* 002224 01DADF24 B4054CC4 */  lwc1        $f12, 0x5B4($2)
/* 002228 01DADF28 5044040C */  jal         fptoui
/* 00222C 01DADF2C 00000000 */   nop
/* 002230 01DADF30 D48B848F */  lw          $4, -0x742C($28)
/* 002234 01DADF34 282E6072 */  paddub      $5, $19, $0
/* 002238 01DADF38 B000A627 */  addiu       $6, $29, 0xB0
/* 00223C 01DADF3C 7000A727 */  addiu       $7, $29, 0x70
/* 002240 01DADF40 9000A827 */  addiu       $8, $29, 0x90
/* 002244 01DADF44 A000A927 */  addiu       $9, $29, 0xA0
/* 002248 01DADF48 8000AA27 */  addiu       $10, $29, 0x80
/* 00224C 01DADF4C 285E4070 */  paddub      $11, $2, $0
/* 002250 01DADF50 1C75050C */  jal         set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc
/* 002254 01DADF54 00000000 */   nop
.L01DADF58_2B3758:
/* 002258 01DADF58 01001026 */  addiu       $16, $16, 0x1
.L01DADF5C_2B375C:
/* 00225C 01DADF5C 3B00022A */  slti        $2, $16, 0x3B
/* 002260 01DADF60 B1FF4014 */  bnez        $2, .L01DADE28_2B3628
/* 002264 01DADF64 00000000 */   nop
/* 002268 01DADF68 28260070 */  paddub      $4, $0, $0
/* 00226C 01DADF6C E4BB040C */  jal         MGSetGsALPHA__FP10sceGsAlpha
/* 002270 01DADF70 00000000 */   nop
/* 002274 01DADF74 28260070 */  paddub      $4, $0, $0
/* 002278 01DADF78 B0BB040C */  jal         MGSetGsZBUF__FP9sceGsZbuf
/* 00227C 01DADF7C 00000000 */   nop
/* 002280 01DADF80 4000BF7B */  lq          $31, 0x40($29)
/* 002284 01DADF84 3000B37B */  lq          $19, 0x30($29)
/* 002288 01DADF88 2000B27B */  lq          $18, 0x20($29)
/* 00228C 01DADF8C 1000B17B */  lq          $17, 0x10($29)
/* 002290 01DADF90 0000B07B */  lq          $16, 0x0($29)
/* 002294 01DADF94 D000BD27 */  addiu       $29, $29, 0xD0
/* 002298 01DADF98 0800E003 */  jr          $31
/* 00229C 01DADF9C 00000000 */   nop
