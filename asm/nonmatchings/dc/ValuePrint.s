.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ValuePrint__FiiiiUc
/* B0160 001B0060 10FFBD27 */  addiu      $sp, $sp, -0xF0
/* B0164 001B0064 8000BF7F */  sq         $31, 0x80($sp)
/* B0168 001B0068 7000B77F */  sq         $23, 0x70($sp)
/* B016C 001B006C 6000B67F */  sq         $22, 0x60($sp)
/* B0170 001B0070 5000B57F */  sq         $21, 0x50($sp)
/* B0174 001B0074 4000B47F */  sq         $20, 0x40($sp)
/* B0178 001B0078 3000B37F */  sq         $19, 0x30($sp)
/* B017C 001B007C 2000B27F */  sq         $18, 0x20($sp)
/* B0180 001B0080 1000B17F */  sq         $17, 0x10($sp)
/* B0184 001B0084 0000B07F */  sq         $16, 0x0($sp)
/* B0188 001B0088 28AE8070 */  paddub     $21, $4, $0
/* B018C 001B008C 28A6A070 */  paddub     $20, $5, $0
/* B0190 001B0090 289EC070 */  paddub     $19, $6, $0
/* B0194 001B0094 2886E070 */  paddub     $16, $7, $0
/* B0198 001B0098 28960071 */  paddub     $18, $8, $0
/* B019C 001B009C C701023C */  lui        $2, %hi(TexManager)
/* B01A0 001B00A0 70584424 */  addiu      $4, $2, %lo(TexManager)
/* B01A4 001B00A4 2A00023C */  lui        $2, %hi(_778)
/* B01A8 001B00A8 40B54524 */  addiu      $5, $2, %lo(_778)
/* B01AC 001B00AC FFFF0624 */  addiu      $6, $0, -0x1
/* B01B0 001B00B0 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* B01B4 001B00B4 00000000 */   nop
/* B01B8 001B00B8 28BE4070 */  paddub     $23, $2, $0
/* B01BC 001B00BC 40101000 */  sll        $2, $16, 1
/* B01C0 001B00C0 21105000 */  addu       $2, $2, $16
/* B01C4 001B00C4 80100200 */  sll        $2, $2, 2
/* B01C8 001B00C8 B0005624 */  addiu      $22, $2, 0xB0
/* B01CC 001B00CC 28860070 */  paddub     $16, $0, $0
/* B01D0 001B00D0 64000224 */  addiu      $2, $0, 0x64
/* B01D4 001B00D4 1A006202 */  div        $0, $19, $2
/* B01D8 001B00D8 02004014 */  bnez       $2, .L001B00E4
/* B01DC 001B00DC 00000000 */   nop
/* B01E0 001B00E0 CD010000 */  break      0, 7
.L001B00E4:
/* B01E4 001B00E4 12880000 */  mflo       $17
/* B01E8 001B00E8 1C00201A */  blez       $17, .L001B015C
/* B01EC 001B00EC 00000000 */   nop
/* B01F0 001B00F0 40101100 */  sll        $2, $17, 1
/* B01F4 001B00F4 21105100 */  addu       $2, $2, $17
/* B01F8 001B00F8 80100200 */  sll        $2, $2, 2
/* B01FC 001B00FC A000A2AF */  sw         $2, 0xA0($sp)
/* B0200 001B0100 A400B6AF */  sw         $22, 0xA4($sp)
/* B0204 001B0104 0C000224 */  addiu      $2, $0, 0xC
/* B0208 001B0108 A800A2AF */  sw         $2, 0xA8($sp)
/* B020C 001B010C AC00A2AF */  sw         $2, 0xAC($sp)
/* B0210 001B0110 9000B5AF */  sw         $21, 0x90($sp)
/* B0214 001B0114 9400B4AF */  sw         $20, 0x94($sp)
/* B0218 001B0118 9800A2AF */  sw         $2, 0x98($sp)
/* B021C 001B011C 9C00A2AF */  sw         $2, 0x9C($sp)
/* B0220 001B0120 D48B848F */  lw         $4, -0x742C($gp)
/* B0224 001B0124 282EE072 */  paddub     $5, $23, $0
/* B0228 001B0128 9000A627 */  addiu      $6, $sp, 0x90
/* B022C 001B012C A000A727 */  addiu      $7, $sp, 0xA0
/* B0230 001B0130 28464072 */  paddub     $8, $18, $0
/* B0234 001B0134 C470050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* B0238 001B0138 00000000 */   nop
/* B023C 001B013C 80101100 */  sll        $2, $17, 2
/* B0240 001B0140 21185100 */  addu       $3, $2, $17
/* B0244 001B0144 80100300 */  sll        $2, $3, 2
/* B0248 001B0148 21106200 */  addu       $2, $3, $2
/* B024C 001B014C 80100200 */  sll        $2, $2, 2
/* B0250 001B0150 23986202 */  subu       $19, $19, $2
/* B0254 001B0154 0C00B526 */  addiu      $21, $21, 0xC
/* B0258 001B0158 01001026 */  addiu      $16, $16, 0x1
.L001B015C:
/* B025C 001B015C 0A000224 */  addiu      $2, $0, 0xA
/* B0260 001B0160 1A006202 */  div        $0, $19, $2
/* B0264 001B0164 02004014 */  bnez       $2, .L001B0170
/* B0268 001B0168 00000000 */   nop
/* B026C 001B016C CD010000 */  break      0, 7
.L001B0170:
/* B0270 001B0170 12880000 */  mflo       $17
/* B0274 001B0174 40101100 */  sll        $2, $17, 1
/* B0278 001B0178 21105100 */  addu       $2, $2, $17
/* B027C 001B017C 80100200 */  sll        $2, $2, 2
/* B0280 001B0180 C000A2AF */  sw         $2, 0xC0($sp)
/* B0284 001B0184 C400B6AF */  sw         $22, 0xC4($sp)
/* B0288 001B0188 0C000224 */  addiu      $2, $0, 0xC
/* B028C 001B018C C800A2AF */  sw         $2, 0xC8($sp)
/* B0290 001B0190 CC00A2AF */  sw         $2, 0xCC($sp)
/* B0294 001B0194 B000B5AF */  sw         $21, 0xB0($sp)
/* B0298 001B0198 B400B4AF */  sw         $20, 0xB4($sp)
/* B029C 001B019C B800A2AF */  sw         $2, 0xB8($sp)
/* B02A0 001B01A0 BC00A2AF */  sw         $2, 0xBC($sp)
/* B02A4 001B01A4 D48B848F */  lw         $4, -0x742C($gp)
/* B02A8 001B01A8 282EE072 */  paddub     $5, $23, $0
/* B02AC 001B01AC B000A627 */  addiu      $6, $sp, 0xB0
/* B02B0 001B01B0 C000A727 */  addiu      $7, $sp, 0xC0
/* B02B4 001B01B4 28464072 */  paddub     $8, $18, $0
/* B02B8 001B01B8 C470050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* B02BC 001B01BC 00000000 */   nop
/* B02C0 001B01C0 0A000224 */  addiu      $2, $0, 0xA
/* B02C4 001B01C4 1A006202 */  div        $0, $19, $2
/* B02C8 001B01C8 00000000 */  nop
/* B02CC 001B01CC 00000000 */  nop
/* B02D0 001B01D0 10880000 */  mfhi       $17
/* B02D4 001B01D4 40101100 */  sll        $2, $17, 1
/* B02D8 001B01D8 21105100 */  addu       $2, $2, $17
/* B02DC 001B01DC 80100200 */  sll        $2, $2, 2
/* B02E0 001B01E0 E000A2AF */  sw         $2, 0xE0($sp)
/* B02E4 001B01E4 E400B6AF */  sw         $22, 0xE4($sp)
/* B02E8 001B01E8 0C000324 */  addiu      $3, $0, 0xC
/* B02EC 001B01EC E800A3AF */  sw         $3, 0xE8($sp)
/* B02F0 001B01F0 EC00A3AF */  sw         $3, 0xEC($sp)
/* B02F4 001B01F4 0C00A226 */  addiu      $2, $21, 0xC
/* B02F8 001B01F8 D000A2AF */  sw         $2, 0xD0($sp)
/* B02FC 001B01FC D400B4AF */  sw         $20, 0xD4($sp)
/* B0300 001B0200 D800A3AF */  sw         $3, 0xD8($sp)
/* B0304 001B0204 DC00A3AF */  sw         $3, 0xDC($sp)
/* B0308 001B0208 D48B848F */  lw         $4, -0x742C($gp)
/* B030C 001B020C 282EE072 */  paddub     $5, $23, $0
/* B0310 001B0210 D000A627 */  addiu      $6, $sp, 0xD0
/* B0314 001B0214 E000A727 */  addiu      $7, $sp, 0xE0
/* B0318 001B0218 28464072 */  paddub     $8, $18, $0
/* B031C 001B021C C470050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* B0320 001B0220 00000000 */   nop
/* B0324 001B0224 02000226 */  addiu      $2, $16, 0x2
/* B0328 001B0228 8000BF7B */  lq         $31, 0x80($sp)
/* B032C 001B022C 7000B77B */  lq         $23, 0x70($sp)
/* B0330 001B0230 6000B67B */  lq         $22, 0x60($sp)
/* B0334 001B0234 5000B57B */  lq         $21, 0x50($sp)
/* B0338 001B0238 4000B47B */  lq         $20, 0x40($sp)
/* B033C 001B023C 3000B37B */  lq         $19, 0x30($sp)
/* B0340 001B0240 2000B27B */  lq         $18, 0x20($sp)
/* B0344 001B0244 1000B17B */  lq         $17, 0x10($sp)
/* B0348 001B0248 0000B07B */  lq         $16, 0x0($sp)
/* B034C 001B024C F000BD27 */  addiu      $sp, $sp, 0xF0
/* B0350 001B0250 0800E003 */  jr         $31
/* B0354 001B0254 00000000 */   nop
/* B0358 001B0258 00000000 */  nop
/* B035C 001B025C 00000000 */  nop
