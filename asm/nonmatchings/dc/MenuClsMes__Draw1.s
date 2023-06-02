.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Draw1__10MenuClsMesFiii
/* 10BAE0 0020B9E0 90FEBD27 */  addiu      $sp, $sp, -0x170
/* 10BAE4 0020B9E4 9000BF7F */  sq         $31, 0x90($sp)
/* 10BAE8 0020B9E8 8000BE7F */  sq         $fp, 0x80($sp)
/* 10BAEC 0020B9EC 7000B77F */  sq         $23, 0x70($sp)
/* 10BAF0 0020B9F0 6000B67F */  sq         $22, 0x60($sp)
/* 10BAF4 0020B9F4 5000B57F */  sq         $21, 0x50($sp)
/* 10BAF8 0020B9F8 4000B47F */  sq         $20, 0x40($sp)
/* 10BAFC 0020B9FC 3000B37F */  sq         $19, 0x30($sp)
/* 10BB00 0020BA00 2000B27F */  sq         $18, 0x20($sp)
/* 10BB04 0020BA04 1000B17F */  sq         $17, 0x10($sp)
/* 10BB08 0020BA08 0000B07F */  sq         $16, 0x0($sp)
/* 10BB0C 0020BA0C 28AE8070 */  paddub     $21, $4, $0
/* 10BB10 0020BA10 28A6A070 */  paddub     $20, $5, $0
/* 10BB14 0020BA14 289EC070 */  paddub     $19, $6, $0
/* 10BB18 0020BA18 1C00838C */  lw         $3, 0x1C($4)
/* 10BB1C 0020BA1C 1A016010 */  beqz       $3, .L0020BE88
/* 10BB20 0020BA20 00000000 */   nop
/* 10BB24 0020BA24 1400A38E */  lw         $3, 0x14($21)
/* 10BB28 0020BA28 17016010 */  beqz       $3, .L0020BE88
/* 10BB2C 0020BA2C 00000000 */   nop
/* 10BB30 0020BA30 28866072 */  paddub     $16, $19, $0
/* 10BB34 0020BA34 0000A482 */  lb         $4, 0x0($21)
/* 10BB38 0020BA38 02000324 */  addiu      $3, $0, 0x2
/* 10BB3C 0020BA3C 08008310 */  beq        $4, $3, .L0020BA60
/* 10BB40 0020BA40 00000000 */   nop
/* 10BB44 0020BA44 01000324 */  addiu      $3, $0, 0x1
/* 10BB48 0020BA48 05008310 */  beq        $4, $3, .L0020BA60
/* 10BB4C 0020BA4C 00000000 */   nop
/* 10BB50 0020BA50 0D018010 */  beqz       $4, .L0020BE88
/* 10BB54 0020BA54 00000000 */   nop
/* 10BB58 0020BA58 0B010010 */  b          .L0020BE88
/* 10BB5C 0020BA5C 00000000 */   nop
.L0020BA60:
/* 10BB60 0020BA60 1000A48E */  lw         $4, 0x10($21)
/* 10BB64 0020BA64 04008010 */  beqz       $4, .L0020BA78
/* 10BB68 0020BA68 00000000 */   nop
/* 10BB6C 0020BA6C 01000324 */  addiu      $3, $0, 0x1
/* 10BB70 0020BA70 03008314 */  bne        $4, $3, .L0020BA80
/* 10BB74 0020BA74 00000000 */   nop
.L0020BA78:
/* 10BB78 0020BA78 03010010 */  b          .L0020BE88
/* 10BB7C 0020BA7C 00000000 */   nop
.L0020BA80:
/* 10BB80 0020BA80 0400A386 */  lh         $3, 0x4($21)
/* 10BB84 0020BA84 80100300 */  sll        $2, $3, 2
/* 10BB88 0020BA88 21104300 */  addu       $2, $2, $3
/* 10BB8C 0020BA8C 40100200 */  sll        $2, $2, 1
/* 10BB90 0020BA90 23800202 */  subu       $16, $16, $2
/* 10BB94 0020BA94 80000224 */  addiu      $2, $0, 0x80
/* 10BB98 0020BA98 0001A2AF */  sw         $2, 0x100($sp)
/* 10BB9C 0020BA9C 68000224 */  addiu      $2, $0, 0x68
/* 10BBA0 0020BAA0 0401A2AF */  sw         $2, 0x104($sp)
/* 10BBA4 0020BAA4 52000324 */  addiu      $3, $0, 0x52
/* 10BBA8 0020BAA8 0801A3AF */  sw         $3, 0x108($sp)
/* 10BBAC 0020BAAC 18000224 */  addiu      $2, $0, 0x18
/* 10BBB0 0020BAB0 0C01A2AF */  sw         $2, 0x10C($sp)
/* 10BBB4 0020BAB4 1E008226 */  addiu      $2, $20, 0x1E
/* 10BBB8 0020BAB8 F000A2AF */  sw         $2, 0xF0($sp)
/* 10BBBC 0020BABC E9FF0226 */  addiu      $2, $16, -0x17
/* 10BBC0 0020BAC0 F400A2AF */  sw         $2, 0xF4($sp)
/* 10BBC4 0020BAC4 F800A3AF */  sw         $3, 0xF8($sp)
/* 10BBC8 0020BAC8 17000224 */  addiu      $2, $0, 0x17
/* 10BBCC 0020BACC FC00A2AF */  sw         $2, 0xFC($sp)
/* 10BBD0 0020BAD0 0200A786 */  lh         $7, 0x2($21)
/* 10BBD4 0020BAD4 A497848F */  lw         $4, -0x685C($gp)
/* 10BBD8 0020BAD8 F000A527 */  addiu      $5, $sp, 0xF0
/* 10BBDC 0020BADC 0001A627 */  addiu      $6, $sp, 0x100
/* 10BBE0 0020BAE0 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 10BBE4 0020BAE4 00000000 */   nop
/* 10BBE8 0020BAE8 80000224 */  addiu      $2, $0, 0x80
/* 10BBEC 0020BAEC 2001A2AF */  sw         $2, 0x120($sp)
/* 10BBF0 0020BAF0 2401A2AF */  sw         $2, 0x124($sp)
/* 10BBF4 0020BAF4 20000324 */  addiu      $3, $0, 0x20
/* 10BBF8 0020BAF8 2801A3AF */  sw         $3, 0x128($sp)
/* 10BBFC 0020BAFC 2C01A3AF */  sw         $3, 0x12C($sp)
/* 10BC00 0020BB00 DCFF8226 */  addiu      $2, $20, -0x24
/* 10BC04 0020BB04 1001A2AF */  sw         $2, 0x110($sp)
/* 10BC08 0020BB08 F6FF6226 */  addiu      $2, $19, -0xA
/* 10BC0C 0020BB0C 1401A2AF */  sw         $2, 0x114($sp)
/* 10BC10 0020BB10 1801A3AF */  sw         $3, 0x118($sp)
/* 10BC14 0020BB14 1C01A3AF */  sw         $3, 0x11C($sp)
/* 10BC18 0020BB18 0200A786 */  lh         $7, 0x2($21)
/* 10BC1C 0020BB1C A497848F */  lw         $4, -0x685C($gp)
/* 10BC20 0020BB20 1001A527 */  addiu      $5, $sp, 0x110
/* 10BC24 0020BB24 2001A627 */  addiu      $6, $sp, 0x120
/* 10BC28 0020BB28 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 10BC2C 0020BB2C 00000000 */   nop
/* 10BC30 0020BB30 20000224 */  addiu      $2, $0, 0x20
/* 10BC34 0020BB34 B000A2AF */  sw         $2, 0xB0($sp)
/* 10BC38 0020BB38 80000324 */  addiu      $3, $0, 0x80
/* 10BC3C 0020BB3C B400B727 */  addiu      $23, $sp, 0xB4
/* 10BC40 0020BB40 0000E3AE */  sw         $3, 0x0($23)
/* 10BC44 0020BB44 B800B227 */  addiu      $18, $sp, 0xB8
/* 10BC48 0020BB48 000042AE */  sw         $2, 0x0($18)
/* 10BC4C 0020BB4C 18000524 */  addiu      $5, $0, 0x18
/* 10BC50 0020BB50 BC00B627 */  addiu      $22, $sp, 0xBC
/* 10BC54 0020BB54 0000C5AE */  sw         $5, 0x0($22)
/* 10BC58 0020BB58 40000224 */  addiu      $2, $0, 0x40
/* 10BC5C 0020BB5C C000A2AF */  sw         $2, 0xC0($sp)
/* 10BC60 0020BB60 C400BE27 */  addiu      $fp, $sp, 0xC4
/* 10BC64 0020BB64 0000C3AF */  sw         $3, 0x0($fp)
/* 10BC68 0020BB68 14000424 */  addiu      $4, $0, 0x14
/* 10BC6C 0020BB6C C800A4AF */  sw         $4, 0xC8($sp)
/* 10BC70 0020BB70 CC00A227 */  addiu      $2, $sp, 0xCC
/* 10BC74 0020BB74 000045AC */  sw         $5, 0x0($2)
/* 10BC78 0020BB78 78000224 */  addiu      $2, $0, 0x78
/* 10BC7C 0020BB7C D000A2AF */  sw         $2, 0xD0($sp)
/* 10BC80 0020BB80 D400A227 */  addiu      $2, $sp, 0xD4
/* 10BC84 0020BB84 000043AC */  sw         $3, 0x0($2)
/* 10BC88 0020BB88 08000324 */  addiu      $3, $0, 0x8
/* 10BC8C 0020BB8C D800A227 */  addiu      $2, $sp, 0xD8
/* 10BC90 0020BB90 000043AC */  sw         $3, 0x0($2)
/* 10BC94 0020BB94 DC00A227 */  addiu      $2, $sp, 0xDC
/* 10BC98 0020BB98 000045AC */  sw         $5, 0x0($2)
/* 10BC9C 0020BB9C EC000224 */  addiu      $2, $0, 0xEC
/* 10BCA0 0020BBA0 E000A2AF */  sw         $2, 0xE0($sp)
/* 10BCA4 0020BBA4 50000324 */  addiu      $3, $0, 0x50
/* 10BCA8 0020BBA8 E400A227 */  addiu      $2, $sp, 0xE4
/* 10BCAC 0020BBAC 000043AC */  sw         $3, 0x0($2)
/* 10BCB0 0020BBB0 E800A227 */  addiu      $2, $sp, 0xE8
/* 10BCB4 0020BBB4 000044AC */  sw         $4, 0x0($2)
/* 10BCB8 0020BBB8 EC00A227 */  addiu      $2, $sp, 0xEC
/* 10BCBC 0020BBBC 000044AC */  sw         $4, 0x0($2)
/* 10BCC0 0020BBC0 C701023C */  lui        $2, %hi(TexManager)
/* 10BCC4 0020BBC4 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 10BCC8 0020BBC8 2A00023C */  lui        $2, %hi(_926_2)
/* 10BCCC 0020BBCC F8D44524 */  addiu      $5, $2, %lo(_926_2)
/* 10BCD0 0020BBD0 FFFF0624 */  addiu      $6, $0, -0x1
/* 10BCD4 0020BBD4 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 10BCD8 0020BBD8 00000000 */   nop
/* 10BCDC 0020BBDC AC00A2AF */  sw         $2, 0xAC($sp)
/* 10BCE0 0020BBE0 01001124 */  addiu      $17, $0, 0x1
/* 10BCE4 0020BBE4 77000010 */  b          .L0020BDC4
/* 10BCE8 0020BBE8 00000000 */   nop
.L0020BBEC:
/* 10BCEC 0020BBEC 08000224 */  addiu      $2, $0, 0x8
/* 10BCF0 0020BBF0 06002216 */  bne        $17, $2, .L0020BC0C
/* 10BCF4 0020BBF4 00000000 */   nop
/* 10BCF8 0020BBF8 E000A38F */  lw         $3, 0xE0($sp)
/* 10BCFC 0020BBFC E800A227 */  addiu      $2, $sp, 0xE8
/* 10BD00 0020BC00 0000428C */  lw         $2, 0x0($2)
/* 10BD04 0020BC04 23106200 */  subu       $2, $3, $2
/* 10BD08 0020BC08 E000A2AF */  sw         $2, 0xE0($sp)
.L0020BC0C:
/* 10BD0C 0020BC0C 01000224 */  addiu      $2, $0, 0x1
/* 10BD10 0020BC10 04182202 */  sllv       $3, $2, $17
/* 10BD14 0020BC14 1000A28E */  lw         $2, 0x10($21)
/* 10BD18 0020BC18 24104300 */  and        $2, $2, $3
/* 10BD1C 0020BC1C 68004010 */  beqz       $2, .L0020BDC0
/* 10BD20 0020BC20 00000000 */   nop
/* 10BD24 0020BC24 28262072 */  paddub     $4, $17, $0
/* 10BD28 0020BC28 DC3D080C */  jal        IsWeaponOptionGoodOrBad__Fi
/* 10BD2C 0020BC2C 00000000 */   nop
/* 10BD30 0020BC30 08004010 */  beqz       $2, .L0020BC54
/* 10BD34 0020BC34 00000000 */   nop
/* 10BD38 0020BC38 80000324 */  addiu      $3, $0, 0x80
/* 10BD3C 0020BC3C D400A227 */  addiu      $2, $sp, 0xD4
/* 10BD40 0020BC40 000043AC */  sw         $3, 0x0($2)
/* 10BD44 0020BC44 0000C3AF */  sw         $3, 0x0($fp)
/* 10BD48 0020BC48 0000E3AE */  sw         $3, 0x0($23)
/* 10BD4C 0020BC4C 06000010 */  b          .L0020BC68
/* 10BD50 0020BC50 00000000 */   nop
.L0020BC54:
/* 10BD54 0020BC54 68000324 */  addiu      $3, $0, 0x68
/* 10BD58 0020BC58 D400A227 */  addiu      $2, $sp, 0xD4
/* 10BD5C 0020BC5C 000043AC */  sw         $3, 0x0($2)
/* 10BD60 0020BC60 0000C3AF */  sw         $3, 0x0($fp)
/* 10BD64 0020BC64 0000E3AE */  sw         $3, 0x0($23)
.L0020BC68:
/* 10BD68 0020BC68 281E2072 */  paddub     $3, $17, $0
/* 10BD6C 0020BC6C 0800212A */  slti       $at, $17, 0x8
/* 10BD70 0020BC70 02002014 */  bnez       $at, .L0020BC7C
/* 10BD74 0020BC74 00000000 */   nop
/* 10BD78 0020BC78 F9FF2326 */  addiu      $3, $17, -0x7
.L0020BC7C:
/* 10BD7C 0020BC7C 08000224 */  addiu      $2, $0, 0x8
/* 10BD80 0020BC80 05002216 */  bne        $17, $2, .L0020BC98
/* 10BD84 0020BC84 00000000 */   nop
/* 10BD88 0020BC88 01000224 */  addiu      $2, $0, 0x1
/* 10BD8C 0020BC8C 02006214 */  bne        $3, $2, .L0020BC98
/* 10BD90 0020BC90 00000000 */   nop
/* 10BD94 0020BC94 01006324 */  addiu      $3, $3, 0x1
.L0020BC98:
/* 10BD98 0020BC98 09000224 */  addiu      $2, $0, 0x9
/* 10BD9C 0020BC9C 05002216 */  bne        $17, $2, .L0020BCB4
/* 10BDA0 0020BCA0 00000000 */   nop
/* 10BDA4 0020BCA4 02000224 */  addiu      $2, $0, 0x2
/* 10BDA8 0020BCA8 02006214 */  bne        $3, $2, .L0020BCB4
/* 10BDAC 0020BCAC 00000000 */   nop
/* 10BDB0 0020BCB0 FFFF6324 */  addiu      $3, $3, -0x1
.L0020BCB4:
/* 10BDB4 0020BCB4 FFFF6324 */  addiu      $3, $3, -0x1
/* 10BDB8 0020BCB8 EC00A227 */  addiu      $2, $sp, 0xEC
/* 10BDBC 0020BCBC 0000428C */  lw         $2, 0x0($2)
/* 10BDC0 0020BCC0 18104300 */  mult       $2, $2, $3
/* 10BDC4 0020BCC4 50004324 */  addiu      $3, $2, 0x50
/* 10BDC8 0020BCC8 E400A227 */  addiu      $2, $sp, 0xE4
/* 10BDCC 0020BCCC 000043AC */  sw         $3, 0x0($2)
/* 10BDD0 0020BCD0 0000C38E */  lw         $3, 0x0($22)
/* 10BDD4 0020BCD4 0000428E */  lw         $2, 0x0($18)
/* 10BDD8 0020BCD8 3001B4AF */  sw         $20, 0x130($sp)
/* 10BDDC 0020BCDC 3401B0AF */  sw         $16, 0x134($sp)
/* 10BDE0 0020BCE0 3801A2AF */  sw         $2, 0x138($sp)
/* 10BDE4 0020BCE4 3C01A3AF */  sw         $3, 0x13C($sp)
/* 10BDE8 0020BCE8 0200A786 */  lh         $7, 0x2($21)
/* 10BDEC 0020BCEC A497848F */  lw         $4, -0x685C($gp)
/* 10BDF0 0020BCF0 3001A527 */  addiu      $5, $sp, 0x130
/* 10BDF4 0020BCF4 B000A627 */  addiu      $6, $sp, 0xB0
/* 10BDF8 0020BCF8 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 10BDFC 0020BCFC 00000000 */   nop
/* 10BE00 0020BD00 CC00A227 */  addiu      $2, $sp, 0xCC
/* 10BE04 0020BD04 0000438C */  lw         $3, 0x0($2)
/* 10BE08 0020BD08 0000428E */  lw         $2, 0x0($18)
/* 10BE0C 0020BD0C 21108202 */  addu       $2, $20, $2
/* 10BE10 0020BD10 4001A2AF */  sw         $2, 0x140($sp)
/* 10BE14 0020BD14 4401B0AF */  sw         $16, 0x144($sp)
/* 10BE18 0020BD18 64000224 */  addiu      $2, $0, 0x64
/* 10BE1C 0020BD1C 4801A2AF */  sw         $2, 0x148($sp)
/* 10BE20 0020BD20 4C01A3AF */  sw         $3, 0x14C($sp)
/* 10BE24 0020BD24 0200A786 */  lh         $7, 0x2($21)
/* 10BE28 0020BD28 A497848F */  lw         $4, -0x685C($gp)
/* 10BE2C 0020BD2C 4001A527 */  addiu      $5, $sp, 0x140
/* 10BE30 0020BD30 C000A627 */  addiu      $6, $sp, 0xC0
/* 10BE34 0020BD34 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 10BE38 0020BD38 00000000 */   nop
/* 10BE3C 0020BD3C DC00A227 */  addiu      $2, $sp, 0xDC
/* 10BE40 0020BD40 0000448C */  lw         $4, 0x0($2)
/* 10BE44 0020BD44 D800A227 */  addiu      $2, $sp, 0xD8
/* 10BE48 0020BD48 0000438C */  lw         $3, 0x0($2)
/* 10BE4C 0020BD4C 0000428E */  lw         $2, 0x0($18)
/* 10BE50 0020BD50 21108202 */  addu       $2, $20, $2
/* 10BE54 0020BD54 64004224 */  addiu      $2, $2, 0x64
/* 10BE58 0020BD58 5001A2AF */  sw         $2, 0x150($sp)
/* 10BE5C 0020BD5C 5401B0AF */  sw         $16, 0x154($sp)
/* 10BE60 0020BD60 5801A3AF */  sw         $3, 0x158($sp)
/* 10BE64 0020BD64 5C01A4AF */  sw         $4, 0x15C($sp)
/* 10BE68 0020BD68 0200A786 */  lh         $7, 0x2($21)
/* 10BE6C 0020BD6C A497848F */  lw         $4, -0x685C($gp)
/* 10BE70 0020BD70 5001A527 */  addiu      $5, $sp, 0x150
/* 10BE74 0020BD74 D000A627 */  addiu      $6, $sp, 0xD0
/* 10BE78 0020BD78 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 10BE7C 0020BD7C 00000000 */   nop
/* 10BE80 0020BD80 02008226 */  addiu      $2, $20, 0x2
/* 10BE84 0020BD84 6001A2AF */  sw         $2, 0x160($sp)
/* 10BE88 0020BD88 02000226 */  addiu      $2, $16, 0x2
/* 10BE8C 0020BD8C 6401A2AF */  sw         $2, 0x164($sp)
/* 10BE90 0020BD90 14000224 */  addiu      $2, $0, 0x14
/* 10BE94 0020BD94 6801A2AF */  sw         $2, 0x168($sp)
/* 10BE98 0020BD98 15000224 */  addiu      $2, $0, 0x15
/* 10BE9C 0020BD9C 6C01A2AF */  sw         $2, 0x16C($sp)
/* 10BEA0 0020BDA0 0200A786 */  lh         $7, 0x2($21)
/* 10BEA4 0020BDA4 AC00A48F */  lw         $4, 0xAC($sp)
/* 10BEA8 0020BDA8 6001A527 */  addiu      $5, $sp, 0x160
/* 10BEAC 0020BDAC E000A627 */  addiu      $6, $sp, 0xE0
/* 10BEB0 0020BDB0 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 10BEB4 0020BDB4 00000000 */   nop
/* 10BEB8 0020BDB8 0000C28E */  lw         $2, 0x0($22)
/* 10BEBC 0020BDBC 21800202 */  addu       $16, $16, $2
.L0020BDC0:
/* 10BEC0 0020BDC0 01003126 */  addiu      $17, $17, 0x1
.L0020BDC4:
/* 10BEC4 0020BDC4 0E00212A */  slti       $at, $17, 0xE
/* 10BEC8 0020BDC8 88FF2014 */  bnez       $at, .L0020BBEC
/* 10BECC 0020BDCC 00000000 */   nop
/* 10BED0 0020BDD0 1C00A28E */  lw         $2, 0x1C($21)
/* 10BED4 0020BDD4 4C17448C */  lw         $4, 0x174C($2)
/* 10BED8 0020BDD8 38B4080C */  jal        MenuTextureReload__Fi
/* 10BEDC 0020BDDC 00000000 */   nop
/* 10BEE0 0020BDE0 0B009426 */  addiu      $20, $20, 0xB
/* 10BEE4 0020BDE4 0400A386 */  lh         $3, 0x4($21)
/* 10BEE8 0020BDE8 80100300 */  sll        $2, $3, 2
/* 10BEEC 0020BDEC 21104300 */  addu       $2, $2, $3
/* 10BEF0 0020BDF0 40100200 */  sll        $2, $2, 1
/* 10BEF4 0020BDF4 23806202 */  subu       $16, $19, $2
/* 10BEF8 0020BDF8 288E0070 */  paddub     $17, $0, $0
/* 10BEFC 0020BDFC 18000010 */  b          .L0020BE60
/* 10BF00 0020BE00 00000000 */   nop
.L0020BE04:
/* 10BF04 0020BE04 1C00A48E */  lw         $4, 0x1C($21)
/* 10BF08 0020BE08 80101100 */  sll        $2, $17, 2
/* 10BF0C 0020BE0C 21104400 */  addu       $2, $2, $4
/* 10BF10 0020BE10 E016458C */  lw         $5, 0x16E0($2)
/* 10BF14 0020BE14 FC3B050C */  jal        GetMesLen_system__6ClsMesFi
/* 10BF18 0020BE18 00000000 */   nop
/* 10BF1C 0020BE1C 11008426 */  addiu      $4, $20, 0x11
/* 10BF20 0020BE20 80180200 */  sll        $3, $2, 2
/* 10BF24 0020BE24 21106200 */  addu       $2, $3, $2
/* 10BF28 0020BE28 23188200 */  subu       $3, $4, $2
/* 10BF2C 0020BE2C 1C00A28E */  lw         $2, 0x1C($21)
/* 10BF30 0020BE30 08002006 */  bltz       $17, .L0020BE54
/* 10BF34 0020BE34 00000000 */   nop
/* 10BF38 0020BE38 0A00212A */  slti       $at, $17, 0xA
/* 10BF3C 0020BE3C 05002010 */  beqz       $at, .L0020BE54
/* 10BF40 0020BE40 00000000 */   nop
/* 10BF44 0020BE44 C0201100 */  sll        $4, $17, 3
/* 10BF48 0020BE48 21108200 */  addu       $2, $4, $2
/* 10BF4C 0020BE4C 501743AC */  sw         $3, 0x1750($2)
/* 10BF50 0020BE50 541750AC */  sw         $16, 0x1754($2)
.L0020BE54:
/* 10BF54 0020BE54 01003126 */  addiu      $17, $17, 0x1
/* 10BF58 0020BE58 0000C28E */  lw         $2, 0x0($22)
/* 10BF5C 0020BE5C 21800202 */  addu       $16, $16, $2
.L0020BE60:
/* 10BF60 0020BE60 0400A286 */  lh         $2, 0x4($21)
/* 10BF64 0020BE64 2A102202 */  slt        $2, $17, $2
/* 10BF68 0020BE68 E6FF4014 */  bnez       $2, .L0020BE04
/* 10BF6C 0020BE6C 00000000 */   nop
/* 10BF70 0020BE70 0200A386 */  lh         $3, 0x2($21)
/* 10BF74 0020BE74 1C00A28E */  lw         $2, 0x1C($21)
/* 10BF78 0020BE78 D41643AC */  sw         $3, 0x16D4($2)
/* 10BF7C 0020BE7C 1C00A48E */  lw         $4, 0x1C($21)
/* 10BF80 0020BE80 C44C050C */  jal        DrawMesWin__6ClsMesFv
/* 10BF84 0020BE84 00000000 */   nop
.L0020BE88:
/* 10BF88 0020BE88 9000BF7B */  lq         $31, 0x90($sp)
/* 10BF8C 0020BE8C 8000BE7B */  lq         $fp, 0x80($sp)
/* 10BF90 0020BE90 7000B77B */  lq         $23, 0x70($sp)
/* 10BF94 0020BE94 6000B67B */  lq         $22, 0x60($sp)
/* 10BF98 0020BE98 5000B57B */  lq         $21, 0x50($sp)
/* 10BF9C 0020BE9C 4000B47B */  lq         $20, 0x40($sp)
/* 10BFA0 0020BEA0 3000B37B */  lq         $19, 0x30($sp)
/* 10BFA4 0020BEA4 2000B27B */  lq         $18, 0x20($sp)
/* 10BFA8 0020BEA8 1000B17B */  lq         $17, 0x10($sp)
/* 10BFAC 0020BEAC 0000B07B */  lq         $16, 0x0($sp)
/* 10BFB0 0020BEB0 7001BD27 */  addiu      $sp, $sp, 0x170
/* 10BFB4 0020BEB4 0800E003 */  jr         $31
/* 10BFB8 0020BEB8 00000000 */   nop
/* 10BFBC 0020BEBC 00000000 */  nop
