.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Draw__10CShockWaveFP7CCamera
/* D62E0 001D61E0 10FFBD27 */  addiu      $sp, $sp, -0xF0
/* D62E4 001D61E4 2000BF7F */  sq         $31, 0x20($sp)
/* D62E8 001D61E8 1000B17F */  sq         $17, 0x10($sp)
/* D62EC 001D61EC 0000B07F */  sq         $16, 0x0($sp)
/* D62F0 001D61F0 28868070 */  paddub     $16, $4, $0
/* D62F4 001D61F4 2800838C */  lw         $3, 0x28($4)
/* D62F8 001D61F8 B1006010 */  beqz       $3, .L001D64C0
/* D62FC 001D61FC 00000000 */   nop
/* D6300 001D6200 2826A070 */  paddub     $4, $5, $0
/* D6304 001D6204 B000A527 */  addiu      $5, $sp, 0xB0
/* D6308 001D6208 9C91040C */  jal        GetPos__7CCameraFPf
/* D630C 001D620C 00000000 */   nop
/* D6310 001D6210 B000A1C7 */  lwc1       $f1, 0xB0($sp)
/* D6314 001D6214 000000C6 */  lwc1       $f0, 0x0($16)
/* D6318 001D6218 01080046 */  sub.s      $f0, $f1, $f0
/* D631C 001D621C C000A0E7 */  swc1       $f0, 0xC0($sp)
/* D6320 001D6220 C400A227 */  addiu      $2, $sp, 0xC4
/* D6324 001D6224 000040AC */  sw         $0, 0x0($2)
/* D6328 001D6228 080001C6 */  lwc1       $f1, 0x8($16)
/* D632C 001D622C B800A0C7 */  lwc1       $f0, 0xB8($sp)
/* D6330 001D6230 01000146 */  sub.s      $f0, $f0, $f1
/* D6334 001D6234 C800B127 */  addiu      $17, $sp, 0xC8
/* D6338 001D6238 000020E6 */  swc1       $f0, 0x0($17)
/* D633C 001D623C C000A427 */  addiu      $4, $sp, 0xC0
/* D6340 001D6240 282E8070 */  paddub     $5, $4, $0
/* D6344 001D6244 9285040C */  jal        sceVu0Normalize
/* D6348 001D6248 00000000 */   nop
/* D634C 001D624C 2041023C */  lui        $2, (0x41200000 >> 16)
/* D6350 001D6250 00088244 */  mtc1       $2, $f1
/* D6354 001D6254 C000A0C7 */  lwc1       $f0, 0xC0($sp)
/* D6358 001D6258 02000146 */  mul.s      $f0, $f0, $f1
/* D635C 001D625C C000A0E7 */  swc1       $f0, 0xC0($sp)
/* D6360 001D6260 000020C6 */  lwc1       $f0, 0x0($17)
/* D6364 001D6264 02000146 */  mul.s      $f0, $f0, $f1
/* D6368 001D6268 000020E6 */  swc1       $f0, 0x0($17)
/* D636C 001D626C 3000A427 */  addiu      $4, $sp, 0x30
/* D6370 001D6270 282E0072 */  paddub     $5, $16, $0
/* D6374 001D6274 0C86040C */  jal        sceVu0CopyVector
/* D6378 001D6278 00000000 */   nop
/* D637C 001D627C 180001C6 */  lwc1       $f1, 0x18($16)
/* D6380 001D6280 3000A0C7 */  lwc1       $f0, 0x30($sp)
/* D6384 001D6284 01000146 */  sub.s      $f0, $f0, $f1
/* D6388 001D6288 3000A0E7 */  swc1       $f0, 0x30($sp)
/* D638C 001D628C 180001C6 */  lwc1       $f1, 0x18($16)
/* D6390 001D6290 3800A0C7 */  lwc1       $f0, 0x38($sp)
/* D6394 001D6294 01000146 */  sub.s      $f0, $f0, $f1
/* D6398 001D6298 3800A0E7 */  swc1       $f0, 0x38($sp)
/* D639C 001D629C 4000A427 */  addiu      $4, $sp, 0x40
/* D63A0 001D62A0 282E0072 */  paddub     $5, $16, $0
/* D63A4 001D62A4 0C86040C */  jal        sceVu0CopyVector
/* D63A8 001D62A8 00000000 */   nop
/* D63AC 001D62AC 180001C6 */  lwc1       $f1, 0x18($16)
/* D63B0 001D62B0 4000A0C7 */  lwc1       $f0, 0x40($sp)
/* D63B4 001D62B4 00000146 */  add.s      $f0, $f0, $f1
/* D63B8 001D62B8 4000A0E7 */  swc1       $f0, 0x40($sp)
/* D63BC 001D62BC 180001C6 */  lwc1       $f1, 0x18($16)
/* D63C0 001D62C0 4800A0C7 */  lwc1       $f0, 0x48($sp)
/* D63C4 001D62C4 01000146 */  sub.s      $f0, $f0, $f1
/* D63C8 001D62C8 4800A0E7 */  swc1       $f0, 0x48($sp)
/* D63CC 001D62CC 5000A427 */  addiu      $4, $sp, 0x50
/* D63D0 001D62D0 282E0072 */  paddub     $5, $16, $0
/* D63D4 001D62D4 0C86040C */  jal        sceVu0CopyVector
/* D63D8 001D62D8 00000000 */   nop
/* D63DC 001D62DC 180001C6 */  lwc1       $f1, 0x18($16)
/* D63E0 001D62E0 5000A0C7 */  lwc1       $f0, 0x50($sp)
/* D63E4 001D62E4 01000146 */  sub.s      $f0, $f0, $f1
/* D63E8 001D62E8 5000A0E7 */  swc1       $f0, 0x50($sp)
/* D63EC 001D62EC 180001C6 */  lwc1       $f1, 0x18($16)
/* D63F0 001D62F0 5800A0C7 */  lwc1       $f0, 0x58($sp)
/* D63F4 001D62F4 00000146 */  add.s      $f0, $f0, $f1
/* D63F8 001D62F8 5800A0E7 */  swc1       $f0, 0x58($sp)
/* D63FC 001D62FC 6000A427 */  addiu      $4, $sp, 0x60
/* D6400 001D6300 282E0072 */  paddub     $5, $16, $0
/* D6404 001D6304 0C86040C */  jal        sceVu0CopyVector
/* D6408 001D6308 00000000 */   nop
/* D640C 001D630C 180001C6 */  lwc1       $f1, 0x18($16)
/* D6410 001D6310 6000A0C7 */  lwc1       $f0, 0x60($sp)
/* D6414 001D6314 00000146 */  add.s      $f0, $f0, $f1
/* D6418 001D6318 6000A0E7 */  swc1       $f0, 0x60($sp)
/* D641C 001D631C 180001C6 */  lwc1       $f1, 0x18($16)
/* D6420 001D6320 6800A0C7 */  lwc1       $f0, 0x68($sp)
/* D6424 001D6324 00000146 */  add.s      $f0, $f0, $f1
/* D6428 001D6328 6800A0E7 */  swc1       $f0, 0x68($sp)
/* D642C 001D632C 7000A427 */  addiu      $4, $sp, 0x70
/* D6430 001D6330 3000A527 */  addiu      $5, $sp, 0x30
/* D6434 001D6334 28360070 */  paddub     $6, $0, $0
/* D6438 001D6338 A4B8040C */  jal        MGRotTransPers__FPiPfi
/* D643C 001D633C 00000000 */   nop
/* D6440 001D6340 5F004010 */  beqz       $2, .L001D64C0
/* D6444 001D6344 00000000 */   nop
/* D6448 001D6348 8000A427 */  addiu      $4, $sp, 0x80
/* D644C 001D634C 4000A527 */  addiu      $5, $sp, 0x40
/* D6450 001D6350 28360070 */  paddub     $6, $0, $0
/* D6454 001D6354 A4B8040C */  jal        MGRotTransPers__FPiPfi
/* D6458 001D6358 00000000 */   nop
/* D645C 001D635C 58004010 */  beqz       $2, .L001D64C0
/* D6460 001D6360 00000000 */   nop
/* D6464 001D6364 9000A427 */  addiu      $4, $sp, 0x90
/* D6468 001D6368 5000A527 */  addiu      $5, $sp, 0x50
/* D646C 001D636C 28360070 */  paddub     $6, $0, $0
/* D6470 001D6370 A4B8040C */  jal        MGRotTransPers__FPiPfi
/* D6474 001D6374 00000000 */   nop
/* D6478 001D6378 51004010 */  beqz       $2, .L001D64C0
/* D647C 001D637C 00000000 */   nop
/* D6480 001D6380 A000A427 */  addiu      $4, $sp, 0xA0
/* D6484 001D6384 6000A527 */  addiu      $5, $sp, 0x60
/* D6488 001D6388 28360070 */  paddub     $6, $0, $0
/* D648C 001D638C A4B8040C */  jal        MGRotTransPers__FPiPfi
/* D6490 001D6390 00000000 */   nop
/* D6494 001D6394 4A004010 */  beqz       $2, .L001D64C0
/* D6498 001D6398 00000000 */   nop
/* D649C 001D639C E000A427 */  addiu      $4, $sp, 0xE0
/* D64A0 001D63A0 F88B82DF */  ld         $2, -0x7408($gp)
/* D64A4 001D63A4 000082FC */  sd         $2, 0x0($4)
/* D64A8 001D63A8 E000A393 */  lbu        $3, 0xE0($sp)
/* D64AC 001D63AC 03000630 */  andi       $6, $0, 0x3
/* D64B0 001D63B0 FCFF0224 */  addiu      $2, $0, -0x4
/* D64B4 001D63B4 24106200 */  and        $2, $3, $2
/* D64B8 001D63B8 25104600 */  or         $2, $2, $6
/* D64BC 001D63BC E000A2A3 */  sb         $2, 0xE0($sp)
/* D64C0 001D63C0 E000A593 */  lbu        $5, 0xE0($sp)
/* D64C4 001D63C4 08000364 */  daddiu     $3, $0, 0x8
/* D64C8 001D63C8 F3FF0224 */  addiu      $2, $0, -0xD
/* D64CC 001D63CC 2410A200 */  and        $2, $5, $2
/* D64D0 001D63D0 25104300 */  or         $2, $2, $3
/* D64D4 001D63D4 E000A2A3 */  sb         $2, 0xE0($sp)
/* D64D8 001D63D8 E000A593 */  lbu        $5, 0xE0($sp)
/* D64DC 001D63DC 00190600 */  sll        $3, $6, 4
/* D64E0 001D63E0 CFFF0224 */  addiu      $2, $0, -0x31
/* D64E4 001D63E4 2410A200 */  and        $2, $5, $2
/* D64E8 001D63E8 25104300 */  or         $2, $2, $3
/* D64EC 001D63EC E000A2A3 */  sb         $2, 0xE0($sp)
/* D64F0 001D63F0 E000A593 */  lbu        $5, 0xE0($sp)
/* D64F4 001D63F4 40000364 */  daddiu     $3, $0, 0x40
/* D64F8 001D63F8 3FFF0224 */  addiu      $2, $0, -0xC1
/* D64FC 001D63FC 2410A200 */  and        $2, $5, $2
/* D6500 001D6400 25104300 */  or         $2, $2, $3
/* D6504 001D6404 E000A2A3 */  sb         $2, 0xE0($sp)
/* D6508 001D6408 E4BB040C */  jal        MGSetGsALPHA__FP10sceGsAlpha
/* D650C 001D640C 00000000 */   nop
/* D6510 001D6410 E800A427 */  addiu      $4, $sp, 0xE8
/* D6514 001D6414 F08B82DF */  ld         $2, -0x7410($gp)
/* D6518 001D6418 000082FC */  sd         $2, 0x0($4)
/* D651C 001D641C EC00A593 */  lbu        $5, 0xEC($sp)
/* D6520 001D6420 01000364 */  daddiu     $3, $0, 0x1
/* D6524 001D6424 FEFF0224 */  addiu      $2, $0, -0x2
/* D6528 001D6428 2410A200 */  and        $2, $5, $2
/* D652C 001D642C 25104300 */  or         $2, $2, $3
/* D6530 001D6430 EC00A2A3 */  sb         $2, 0xEC($sp)
/* D6534 001D6434 B0BB040C */  jal        MGSetGsZBUF__FP9sceGsZbuf
/* D6538 001D6438 00000000 */   nop
/* D653C 001D643C 80000224 */  addiu      $2, $0, 0x80
/* D6540 001D6440 D000A2AF */  sw         $2, 0xD0($sp)
/* D6544 001D6444 D400A0AF */  sw         $0, 0xD4($sp)
/* D6548 001D6448 40000224 */  addiu      $2, $0, 0x40
/* D654C 001D644C D800A2AF */  sw         $2, 0xD8($sp)
/* D6550 001D6450 DC00A2AF */  sw         $2, 0xDC($sp)
/* D6554 001D6454 C701023C */  lui        $2, %hi(TexManager)
/* D6558 001D6458 70584424 */  addiu      $4, $2, %lo(TexManager)
/* D655C 001D645C 2A00023C */  lui        $2, %hi(_1169_2)
/* D6560 001D6460 B8CE4524 */  addiu      $5, $2, %lo(_1169_2)
/* D6564 001D6464 FFFF0624 */  addiu      $6, $0, -0x1
/* D6568 001D6468 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* D656C 001D646C 00000000 */   nop
/* D6570 001D6470 288E4070 */  paddub     $17, $2, $0
/* D6574 001D6474 24000CC6 */  lwc1       $f12, 0x24($16)
/* D6578 001D6478 5044040C */  jal        fptoui
/* D657C 001D647C 00000000 */   nop
/* D6580 001D6480 D48B848F */  lw         $4, -0x742C($gp)
/* D6584 001D6484 282E2072 */  paddub     $5, $17, $0
/* D6588 001D6488 D000A627 */  addiu      $6, $sp, 0xD0
/* D658C 001D648C 7000A727 */  addiu      $7, $sp, 0x70
/* D6590 001D6490 8000A827 */  addiu      $8, $sp, 0x80
/* D6594 001D6494 9000A927 */  addiu      $9, $sp, 0x90
/* D6598 001D6498 A000AA27 */  addiu      $10, $sp, 0xA0
/* D659C 001D649C 285E4070 */  paddub     $11, $2, $0
/* D65A0 001D64A0 1C75050C */  jal        set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc
/* D65A4 001D64A4 00000000 */   nop
/* D65A8 001D64A8 28260070 */  paddub     $4, $0, $0
/* D65AC 001D64AC E4BB040C */  jal        MGSetGsALPHA__FP10sceGsAlpha
/* D65B0 001D64B0 00000000 */   nop
/* D65B4 001D64B4 28260070 */  paddub     $4, $0, $0
/* D65B8 001D64B8 B0BB040C */  jal        MGSetGsZBUF__FP9sceGsZbuf
/* D65BC 001D64BC 00000000 */   nop
.L001D64C0:
/* D65C0 001D64C0 2000BF7B */  lq         $31, 0x20($sp)
/* D65C4 001D64C4 1000B17B */  lq         $17, 0x10($sp)
/* D65C8 001D64C8 0000B07B */  lq         $16, 0x0($sp)
/* D65CC 001D64CC F000BD27 */  addiu      $sp, $sp, 0xF0
/* D65D0 001D64D0 0800E003 */  jr         $31
/* D65D4 001D64D4 00000000 */   nop
/* D65D8 001D64D8 00000000 */  nop
/* D65DC 001D64DC 00000000 */  nop
