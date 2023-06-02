.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel joinRoom__Fii
/* C62C0 001C61C0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* C62C4 001C61C4 0000BF7F */  sq         $31, 0x0($sp)
/* C62C8 001C61C8 28668070 */  paddub     $12, $4, $0
/* C62CC 001C61CC 2876A070 */  paddub     $14, $5, $0
/* C62D0 001C61D0 D601033C */  lui        $3, %hi(buildMapWork)
/* C62D4 001C61D4 60E46424 */  addiu      $4, $3, %lo(buildMapWork)
/* C62D8 001C61D8 D501033C */  lui        $3, %hi(buildMapDat)
/* C62DC 001C61DC A06D6524 */  addiu      $5, $3, %lo(buildMapDat)
/* C62E0 001C61E0 4C18070C */  jal        copyMapInfo__FP14BUILD_MAP_INFOP14BUILD_MAP_INFO
/* C62E4 001C61E4 00000000 */   nop
/* C62E8 001C61E8 00390C00 */  sll        $7, $12, 4
/* C62EC 001C61EC D601033C */  lui        $3, %hi(roomStack)
/* C62F0 001C61F0 205B6324 */  addiu      $3, $3, %lo(roomStack)
/* C62F4 001C61F4 21186700 */  addu       $3, $3, $7
/* C62F8 001C61F8 0000648C */  lw         $4, 0x0($3)
/* C62FC 001C61FC 00290E00 */  sll        $5, $14, 4
/* C6300 001C6200 D601033C */  lui        $3, %hi(roomStack)
/* C6304 001C6204 205B6324 */  addiu      $3, $3, %lo(roomStack)
/* C6308 001C6208 21186500 */  addu       $3, $3, $5
/* C630C 001C620C 00006A8C */  lw         $10, 0x0($3)
/* C6310 001C6210 23708A00 */  subu       $14, $4, $10
/* C6314 001C6214 D601033C */  lui        $3, %hi(D_1D65B24)
/* C6318 001C6218 245B6324 */  addiu      $3, $3, %lo(D_1D65B24)
/* C631C 001C621C 21186700 */  addu       $3, $3, $7
/* C6320 001C6220 0000688C */  lw         $8, 0x0($3)
/* C6324 001C6224 D601033C */  lui        $3, %hi(D_1D65B24)
/* C6328 001C6228 245B6324 */  addiu      $3, $3, %lo(D_1D65B24)
/* C632C 001C622C 21186500 */  addu       $3, $3, $5
/* C6330 001C6230 0000698C */  lw         $9, 0x0($3)
/* C6334 001C6234 23780901 */  subu       $15, $8, $9
/* C6338 001C6238 1830CE01 */  mult       $6, $14, $14
/* C633C 001C623C 1818EF71 */  mult1      $3, $15, $15
/* C6340 001C6240 2A086600 */  slt        $at, $3, $6
/* C6344 001C6244 09002010 */  beqz       $at, .L001C626C
/* C6348 001C6248 00000000 */   nop
/* C634C 001C624C 0400C105 */  bgez       $14, .L001C6260
/* C6350 001C6250 00000000 */   nop
/* C6354 001C6254 02000624 */  addiu      $6, $0, 0x2
/* C6358 001C6258 0A000010 */  b          .L001C6284
/* C635C 001C625C 00000000 */   nop
.L001C6260:
/* C6360 001C6260 04000624 */  addiu      $6, $0, 0x4
/* C6364 001C6264 07000010 */  b          .L001C6284
/* C6368 001C6268 00000000 */   nop
.L001C626C:
/* C636C 001C626C 0400E105 */  bgez       $15, .L001C6280
/* C6370 001C6270 00000000 */   nop
/* C6374 001C6274 08000624 */  addiu      $6, $0, 0x8
/* C6378 001C6278 02000010 */  b          .L001C6284
/* C637C 001C627C 00000000 */   nop
.L001C6280:
/* C6380 001C6280 01000624 */  addiu      $6, $0, 0x1
.L001C6284:
/* C6384 001C6284 04000324 */  addiu      $3, $0, 0x4
/* C6388 001C6288 7A00C310 */  beq        $6, $3, .L001C6474
/* C638C 001C628C 00000000 */   nop
/* C6390 001C6290 02000324 */  addiu      $3, $0, 0x2
/* C6394 001C6294 5300C310 */  beq        $6, $3, .L001C63E4
/* C6398 001C6298 00000000 */   nop
/* C639C 001C629C 08000324 */  addiu      $3, $0, 0x8
/* C63A0 001C62A0 2B00C310 */  beq        $6, $3, .L001C6350
/* C63A4 001C62A4 00000000 */   nop
/* C63A8 001C62A8 01000324 */  addiu      $3, $0, 0x1
/* C63AC 001C62AC 0300C310 */  beq        $6, $3, .L001C62BC
/* C63B0 001C62B0 00000000 */   nop
/* C63B4 001C62B4 92000010 */  b          .L001C6500
/* C63B8 001C62B8 00000000 */   nop
.L001C62BC:
/* C63BC 001C62BC D601023C */  lui        $2, %hi(D_1D65B28)
/* C63C0 001C62C0 285B4224 */  addiu      $2, $2, %lo(D_1D65B28)
/* C63C4 001C62C4 21104700 */  addu       $2, $2, $7
/* C63C8 001C62C8 0000428C */  lw         $2, 0x0($2)
/* C63CC 001C62CC 43100200 */  sra        $2, $2, 1
/* C63D0 001C62D0 21588200 */  addu       $11, $4, $2
/* C63D4 001C62D4 FFFF0225 */  addiu      $2, $8, -0x1
/* C63D8 001C62D8 01004D24 */  addiu      $13, $2, 0x1
/* C63DC 001C62DC 80200D00 */  sll        $4, $13, 2
/* C63E0 001C62E0 21208D00 */  addu       $4, $4, $13
/* C63E4 001C62E4 80200400 */  sll        $4, $4, 2
/* C63E8 001C62E8 21686401 */  addu       $13, $11, $4
/* C63EC 001C62EC C0200D00 */  sll        $4, $13, 3
/* C63F0 001C62F0 21208D00 */  addu       $4, $4, $13
/* C63F4 001C62F4 40200400 */  sll        $4, $4, 1
/* C63F8 001C62F8 21208D00 */  addu       $4, $4, $13
/* C63FC 001C62FC 80700400 */  sll        $14, $4, 2
/* C6400 001C6300 D601043C */  lui        $4, %hi(D_1D5E4A8)
/* C6404 001C6304 A8E48424 */  addiu      $4, $4, %lo(D_1D5E4A8)
/* C6408 001C6308 21688E00 */  addu       $13, $4, $14
/* C640C 001C630C 0000A48D */  lw         $4, 0x0($13)
/* C6410 001C6310 04008434 */  ori        $4, $4, 0x4
/* C6414 001C6314 0000A4AD */  sw         $4, 0x0($13)
/* C6418 001C6318 D601043C */  lui        $4, %hi(D_1D5E468)
/* C641C 001C631C 68E48424 */  addiu      $4, $4, %lo(D_1D5E468)
/* C6420 001C6320 21688E00 */  addu       $13, $4, $14
/* C6424 001C6324 80200C00 */  sll        $4, $12, 2
/* C6428 001C6328 21208D00 */  addu       $4, $4, $13
/* C642C 001C632C 000083AC */  sw         $3, 0x0($4)
/* C6430 001C6330 D601033C */  lui        $3, %hi(D_1D65B2C)
/* C6434 001C6334 2C5B6324 */  addiu      $3, $3, %lo(D_1D65B2C)
/* C6438 001C6338 21186500 */  addu       $3, $3, $5
/* C643C 001C633C 0000638C */  lw         $3, 0x0($3)
/* C6440 001C6340 21182301 */  addu       $3, $9, $3
/* C6444 001C6344 23680301 */  subu       $13, $8, $3
/* C6448 001C6348 6D000010 */  b          .L001C6500
/* C644C 001C634C 00000000 */   nop
.L001C6350:
/* C6450 001C6350 D601023C */  lui        $2, %hi(D_1D65B28)
/* C6454 001C6354 285B4224 */  addiu      $2, $2, %lo(D_1D65B28)
/* C6458 001C6358 21104700 */  addu       $2, $2, $7
/* C645C 001C635C 0000428C */  lw         $2, 0x0($2)
/* C6460 001C6360 43100200 */  sra        $2, $2, 1
/* C6464 001C6364 21588200 */  addu       $11, $4, $2
/* C6468 001C6368 D601023C */  lui        $2, %hi(D_1D65B2C)
/* C646C 001C636C 2C5B4224 */  addiu      $2, $2, %lo(D_1D65B2C)
/* C6470 001C6370 21104700 */  addu       $2, $2, $7
/* C6474 001C6374 0000428C */  lw         $2, 0x0($2)
/* C6478 001C6378 21100201 */  addu       $2, $8, $2
/* C647C 001C637C FFFF4424 */  addiu      $4, $2, -0x1
/* C6480 001C6380 80180400 */  sll        $3, $4, 2
/* C6484 001C6384 21186400 */  addu       $3, $3, $4
/* C6488 001C6388 80180300 */  sll        $3, $3, 2
/* C648C 001C638C 21206301 */  addu       $4, $11, $3
/* C6490 001C6390 C0180400 */  sll        $3, $4, 3
/* C6494 001C6394 21186400 */  addu       $3, $3, $4
/* C6498 001C6398 40180300 */  sll        $3, $3, 1
/* C649C 001C639C 21186400 */  addu       $3, $3, $4
/* C64A0 001C63A0 80700300 */  sll        $14, $3, 2
/* C64A4 001C63A4 D601033C */  lui        $3, %hi(D_1D5E4A8)
/* C64A8 001C63A8 A8E46324 */  addiu      $3, $3, %lo(D_1D5E4A8)
/* C64AC 001C63AC 21206E00 */  addu       $4, $3, $14
/* C64B0 001C63B0 0000838C */  lw         $3, 0x0($4)
/* C64B4 001C63B4 04006334 */  ori        $3, $3, 0x4
/* C64B8 001C63B8 000083AC */  sw         $3, 0x0($4)
/* C64BC 001C63BC 01000D24 */  addiu      $13, $0, 0x1
/* C64C0 001C63C0 D601033C */  lui        $3, %hi(D_1D5E468)
/* C64C4 001C63C4 68E46324 */  addiu      $3, $3, %lo(D_1D5E468)
/* C64C8 001C63C8 21206E00 */  addu       $4, $3, $14
/* C64CC 001C63CC 80180C00 */  sll        $3, $12, 2
/* C64D0 001C63D0 21186400 */  addu       $3, $3, $4
/* C64D4 001C63D4 00006DAC */  sw         $13, 0x0($3)
/* C64D8 001C63D8 23682201 */  subu       $13, $9, $2
/* C64DC 001C63DC 48000010 */  b          .L001C6500
/* C64E0 001C63E0 00000000 */   nop
.L001C63E4:
/* C64E4 001C63E4 D601023C */  lui        $2, %hi(D_1D65B28)
/* C64E8 001C63E8 285B4224 */  addiu      $2, $2, %lo(D_1D65B28)
/* C64EC 001C63EC 21104700 */  addu       $2, $2, $7
/* C64F0 001C63F0 0000428C */  lw         $2, 0x0($2)
/* C64F4 001C63F4 21588200 */  addu       $11, $4, $2
/* C64F8 001C63F8 D601023C */  lui        $2, %hi(D_1D65B2C)
/* C64FC 001C63FC 2C5B4224 */  addiu      $2, $2, %lo(D_1D65B2C)
/* C6500 001C6400 21104700 */  addu       $2, $2, $7
/* C6504 001C6404 0000428C */  lw         $2, 0x0($2)
/* C6508 001C6408 43100200 */  sra        $2, $2, 1
/* C650C 001C640C 21100201 */  addu       $2, $8, $2
/* C6510 001C6410 80180200 */  sll        $3, $2, 2
/* C6514 001C6414 21186200 */  addu       $3, $3, $2
/* C6518 001C6418 80180300 */  sll        $3, $3, 2
/* C651C 001C641C 21206301 */  addu       $4, $11, $3
/* C6520 001C6420 C0180400 */  sll        $3, $4, 3
/* C6524 001C6424 21186400 */  addu       $3, $3, $4
/* C6528 001C6428 40180300 */  sll        $3, $3, 1
/* C652C 001C642C 21186400 */  addu       $3, $3, $4
/* C6530 001C6430 80700300 */  sll        $14, $3, 2
/* C6534 001C6434 D601033C */  lui        $3, %hi(D_1D5E45C)
/* C6538 001C6438 5CE46324 */  addiu      $3, $3, %lo(D_1D5E45C)
/* C653C 001C643C 21206E00 */  addu       $4, $3, $14
/* C6540 001C6440 0000838C */  lw         $3, 0x0($4)
/* C6544 001C6444 04006334 */  ori        $3, $3, 0x4
/* C6548 001C6448 000083AC */  sw         $3, 0x0($4)
/* C654C 001C644C 01000D24 */  addiu      $13, $0, 0x1
/* C6550 001C6450 D601033C */  lui        $3, %hi(D_1D5E41C)
/* C6554 001C6454 1CE46324 */  addiu      $3, $3, %lo(D_1D5E41C)
/* C6558 001C6458 21206E00 */  addu       $4, $3, $14
/* C655C 001C645C 80180C00 */  sll        $3, $12, 2
/* C6560 001C6460 21186400 */  addu       $3, $3, $4
/* C6564 001C6464 00006DAC */  sw         $13, 0x0($3)
/* C6568 001C6468 23684B01 */  subu       $13, $10, $11
/* C656C 001C646C 24000010 */  b          .L001C6500
/* C6570 001C6470 00000000 */   nop
.L001C6474:
/* C6574 001C6474 FFFF8B24 */  addiu      $11, $4, -0x1
/* C6578 001C6478 D601023C */  lui        $2, %hi(D_1D65B2C)
/* C657C 001C647C 2C5B4224 */  addiu      $2, $2, %lo(D_1D65B2C)
/* C6580 001C6480 21104700 */  addu       $2, $2, $7
/* C6584 001C6484 0000428C */  lw         $2, 0x0($2)
/* C6588 001C6488 43100200 */  sra        $2, $2, 1
/* C658C 001C648C 21100201 */  addu       $2, $8, $2
/* C6590 001C6490 80180200 */  sll        $3, $2, 2
/* C6594 001C6494 21186200 */  addu       $3, $3, $2
/* C6598 001C6498 80180300 */  sll        $3, $3, 2
/* C659C 001C649C 21686301 */  addu       $13, $11, $3
/* C65A0 001C64A0 C0180D00 */  sll        $3, $13, 3
/* C65A4 001C64A4 21186D00 */  addu       $3, $3, $13
/* C65A8 001C64A8 40180300 */  sll        $3, $3, 1
/* C65AC 001C64AC 21186D00 */  addu       $3, $3, $13
/* C65B0 001C64B0 80780300 */  sll        $15, $3, 2
/* C65B4 001C64B4 D601033C */  lui        $3, %hi(D_1D5E4F4)
/* C65B8 001C64B8 F4E46324 */  addiu      $3, $3, %lo(D_1D5E4F4)
/* C65BC 001C64BC 21686F00 */  addu       $13, $3, $15
/* C65C0 001C64C0 0000A38D */  lw         $3, 0x0($13)
/* C65C4 001C64C4 04006334 */  ori        $3, $3, 0x4
/* C65C8 001C64C8 0000A3AD */  sw         $3, 0x0($13)
/* C65CC 001C64CC 01000E24 */  addiu      $14, $0, 0x1
/* C65D0 001C64D0 D601033C */  lui        $3, %hi(D_1D5E4B4)
/* C65D4 001C64D4 B4E46324 */  addiu      $3, $3, %lo(D_1D5E4B4)
/* C65D8 001C64D8 21686F00 */  addu       $13, $3, $15
/* C65DC 001C64DC 80180C00 */  sll        $3, $12, 2
/* C65E0 001C64E0 21186D00 */  addu       $3, $3, $13
/* C65E4 001C64E4 00006EAC */  sw         $14, 0x0($3)
/* C65E8 001C64E8 D601033C */  lui        $3, %hi(D_1D65B28)
/* C65EC 001C64EC 285B6324 */  addiu      $3, $3, %lo(D_1D65B28)
/* C65F0 001C64F0 21186500 */  addu       $3, $3, $5
/* C65F4 001C64F4 0000638C */  lw         $3, 0x0($3)
/* C65F8 001C64F8 21184301 */  addu       $3, $10, $3
/* C65FC 001C64FC 23688300 */  subu       $13, $4, $3
.L001C6500:
/* C6600 001C6500 D601033C */  lui        $3, %hi(D_1D65B28)
/* C6604 001C6504 285B6324 */  addiu      $3, $3, %lo(D_1D65B28)
/* C6608 001C6508 21186500 */  addu       $3, $3, $5
/* C660C 001C650C 0000638C */  lw         $3, 0x0($3)
/* C6610 001C6510 43180300 */  sra        $3, $3, 1
/* C6614 001C6514 21204301 */  addu       $4, $10, $3
/* C6618 001C6518 D601033C */  lui        $3, %hi(D_1D65B2C)
/* C661C 001C651C 2C5B6324 */  addiu      $3, $3, %lo(D_1D65B2C)
/* C6620 001C6520 21186500 */  addu       $3, $3, $5
/* C6624 001C6524 00006A8C */  lw         $10, 0x0($3)
/* C6628 001C6528 43180A00 */  sra        $3, $10, 1
/* C662C 001C652C 21282301 */  addu       $5, $9, $3
/* C6630 001C6530 43180D00 */  sra        $3, $13, 1
/* C6634 001C6534 01006D24 */  addiu      $13, $3, 0x1
/* C6638 001C6538 21182A01 */  addu       $3, $9, $10
/* C663C 001C653C 0B000315 */  bne        $8, $3, .L001C656C
/* C6640 001C6540 00000000 */   nop
/* C6644 001C6544 01000324 */  addiu      $3, $0, 0x1
/* C6648 001C6548 0400C310 */  beq        $6, $3, .L001C655C
/* C664C 001C654C 00000000 */   nop
/* C6650 001C6550 08000324 */  addiu      $3, $0, 0x8
/* C6654 001C6554 0500C314 */  bne        $6, $3, .L001C656C
/* C6658 001C6558 00000000 */   nop
.L001C655C:
/* C665C 001C655C 0200A129 */  slti       $at, $13, 0x2
/* C6660 001C6560 02002010 */  beqz       $at, .L001C656C
/* C6664 001C6564 00000000 */   nop
/* C6668 001C6568 02000D24 */  addiu      $13, $0, 0x2
.L001C656C:
/* C666C 001C656C D601033C */  lui        $3, %hi(D_1D65B2C)
/* C6670 001C6570 2C5B6324 */  addiu      $3, $3, %lo(D_1D65B2C)
/* C6674 001C6574 21186700 */  addu       $3, $3, $7
/* C6678 001C6578 0000638C */  lw         $3, 0x0($3)
/* C667C 001C657C 21180301 */  addu       $3, $8, $3
/* C6680 001C6580 0B002315 */  bne        $9, $3, .L001C65B0
/* C6684 001C6584 00000000 */   nop
/* C6688 001C6588 01000324 */  addiu      $3, $0, 0x1
/* C668C 001C658C 0400C310 */  beq        $6, $3, .L001C65A0
/* C6690 001C6590 00000000 */   nop
/* C6694 001C6594 08000324 */  addiu      $3, $0, 0x8
/* C6698 001C6598 0500C314 */  bne        $6, $3, .L001C65B0
/* C669C 001C659C 00000000 */   nop
.L001C65A0:
/* C66A0 001C65A0 0200A129 */  slti       $at, $13, 0x2
/* C66A4 001C65A4 02002010 */  beqz       $at, .L001C65B0
/* C66A8 001C65A8 00000000 */   nop
/* C66AC 001C65AC 02000D24 */  addiu      $13, $0, 0x2
.L001C65B0:
/* C66B0 001C65B0 281E0070 */  paddub     $3, $0, $0
/* C66B4 001C65B4 13010010 */  b          .L001C6A04
/* C66B8 001C65B8 00000000 */   nop
.L001C65BC:
/* C66BC 001C65BC 5600A011 */  beqz       $13, .L001C6718
/* C66C0 001C65C0 00000000 */   nop
/* C66C4 001C65C4 80380200 */  sll        $7, $2, 2
/* C66C8 001C65C8 2138E200 */  addu       $7, $7, $2
/* C66CC 001C65CC 80380700 */  sll        $7, $7, 2
/* C66D0 001C65D0 21406701 */  addu       $8, $11, $7
/* C66D4 001C65D4 C0380800 */  sll        $7, $8, 3
/* C66D8 001C65D8 2138E800 */  addu       $7, $7, $8
/* C66DC 001C65DC 40380700 */  sll        $7, $7, 1
/* C66E0 001C65E0 2138E800 */  addu       $7, $7, $8
/* C66E4 001C65E4 80380700 */  sll        $7, $7, 2
/* C66E8 001C65E8 D601083C */  lui        $8, %hi(buildMapWork)
/* C66EC 001C65EC 60E40825 */  addiu      $8, $8, %lo(buildMapWork)
/* C66F0 001C65F0 21500701 */  addu       $10, $8, $7
/* C66F4 001C65F4 0000498D */  lw         $9, 0x0($10)
/* C66F8 001C65F8 FFFF0824 */  addiu      $8, $0, -0x1
/* C66FC 001C65FC 2B002815 */  bne        $9, $8, .L001C66AC
/* C6700 001C6600 00000000 */   nop
/* C6704 001C6604 00004CAD */  sw         $12, 0x0($10)
/* C6708 001C6608 01000A24 */  addiu      $10, $0, 0x1
/* C670C 001C660C D601083C */  lui        $8, %hi(D_1D5E468)
/* C6710 001C6610 68E40825 */  addiu      $8, $8, %lo(D_1D5E468)
/* C6714 001C6614 21480701 */  addu       $9, $8, $7
/* C6718 001C6618 80400C00 */  sll        $8, $12, 2
/* C671C 001C661C 21400901 */  addu       $8, $8, $9
/* C6720 001C6620 00000AAD */  sw         $10, 0x0($8)
/* C6724 001C6624 D601083C */  lui        $8, %hi(D_1D5E4A8)
/* C6728 001C6628 A8E40825 */  addiu      $8, $8, %lo(D_1D5E4A8)
/* C672C 001C662C 21400701 */  addu       $8, $8, $7
/* C6730 001C6630 0000078D */  lw         $7, 0x0($8)
/* C6734 001C6634 0200E734 */  ori        $7, $7, 0x2
/* C6738 001C6638 000007AD */  sw         $7, 0x0($8)
/* C673C 001C663C FFFFAD25 */  addiu      $13, $13, -0x1
/* C6740 001C6640 F000A011 */  beqz       $13, .L001C6A04
/* C6744 001C6644 00000000 */   nop
/* C6748 001C6648 04000724 */  addiu      $7, $0, 0x4
/* C674C 001C664C 1400C710 */  beq        $6, $7, .L001C66A0
/* C6750 001C6650 00000000 */   nop
/* C6754 001C6654 02000724 */  addiu      $7, $0, 0x2
/* C6758 001C6658 0E00C710 */  beq        $6, $7, .L001C6694
/* C675C 001C665C 00000000 */   nop
/* C6760 001C6660 08000724 */  addiu      $7, $0, 0x8
/* C6764 001C6664 0800C710 */  beq        $6, $7, .L001C6688
/* C6768 001C6668 00000000 */   nop
/* C676C 001C666C 0300CA10 */  beq        $6, $10, .L001C667C
/* C6770 001C6670 00000000 */   nop
/* C6774 001C6674 E3000010 */  b          .L001C6A04
/* C6778 001C6678 00000000 */   nop
.L001C667C:
/* C677C 001C667C FFFF4224 */  addiu      $2, $2, -0x1
/* C6780 001C6680 E0000010 */  b          .L001C6A04
/* C6784 001C6684 00000000 */   nop
.L001C6688:
/* C6788 001C6688 01004224 */  addiu      $2, $2, 0x1
/* C678C 001C668C DD000010 */  b          .L001C6A04
/* C6790 001C6690 00000000 */   nop
.L001C6694:
/* C6794 001C6694 01006B25 */  addiu      $11, $11, 0x1
/* C6798 001C6698 DA000010 */  b          .L001C6A04
/* C679C 001C669C 00000000 */   nop
.L001C66A0:
/* C67A0 001C66A0 FFFF6B25 */  addiu      $11, $11, -0x1
/* C67A4 001C66A4 D7000010 */  b          .L001C6A04
/* C67A8 001C66A8 00000000 */   nop
.L001C66AC:
/* C67AC 001C66AC D601033C */  lui        $3, %hi(D_1D5E4A8)
/* C67B0 001C66B0 A8E46324 */  addiu      $3, $3, %lo(D_1D5E4A8)
/* C67B4 001C66B4 21506700 */  addu       $10, $3, $7
/* C67B8 001C66B8 0000498D */  lw         $9, 0x0($10)
/* C67BC 001C66BC 01002331 */  andi       $3, $9, 0x1
/* C67C0 001C66C0 01000824 */  addiu      $8, $0, 0x1
/* C67C4 001C66C4 0B006814 */  bne        $3, $8, .L001C66F4
/* C67C8 001C66C8 00000000 */   nop
/* C67CC 001C66CC 04002335 */  ori        $3, $9, 0x4
/* C67D0 001C66D0 000043AD */  sw         $3, 0x0($10)
/* C67D4 001C66D4 D601033C */  lui        $3, %hi(D_1D5E468)
/* C67D8 001C66D8 68E46324 */  addiu      $3, $3, %lo(D_1D5E468)
/* C67DC 001C66DC 21386700 */  addu       $7, $3, $7
/* C67E0 001C66E0 80180C00 */  sll        $3, $12, 2
/* C67E4 001C66E4 21186700 */  addu       $3, $3, $7
/* C67E8 001C66E8 000068AC */  sw         $8, 0x0($3)
/* C67EC 001C66EC 07000010 */  b          .L001C670C
/* C67F0 001C66F0 00000000 */   nop
.L001C66F4:
/* C67F4 001C66F4 D601033C */  lui        $3, %hi(D_1D5E468)
/* C67F8 001C66F8 68E46324 */  addiu      $3, $3, %lo(D_1D5E468)
/* C67FC 001C66FC 21386700 */  addu       $7, $3, $7
/* C6800 001C6700 80180C00 */  sll        $3, $12, 2
/* C6804 001C6704 21186700 */  addu       $3, $3, $7
/* C6808 001C6708 000068AC */  sw         $8, 0x0($3)
.L001C670C:
/* C680C 001C670C 01000324 */  addiu      $3, $0, 0x1
/* C6810 001C6710 BC000010 */  b          .L001C6A04
/* C6814 001C6714 00000000 */   nop
.L001C6718:
/* C6818 001C6718 04000724 */  addiu      $7, $0, 0x4
/* C681C 001C671C 5700C710 */  beq        $6, $7, .L001C687C
/* C6820 001C6720 00000000 */   nop
/* C6824 001C6724 02000724 */  addiu      $7, $0, 0x2
/* C6828 001C6728 5400C710 */  beq        $6, $7, .L001C687C
/* C682C 001C672C 00000000 */   nop
/* C6830 001C6730 08000724 */  addiu      $7, $0, 0x8
/* C6834 001C6734 0600C710 */  beq        $6, $7, .L001C6750
/* C6838 001C6738 00000000 */   nop
/* C683C 001C673C 01000724 */  addiu      $7, $0, 0x1
/* C6840 001C6740 0300C710 */  beq        $6, $7, .L001C6750
/* C6844 001C6744 00000000 */   nop
/* C6848 001C6748 95000010 */  b          .L001C69A0
/* C684C 001C674C 00000000 */   nop
.L001C6750:
/* C6850 001C6750 23388B00 */  subu       $7, $4, $11
/* C6854 001C6754 0500E104 */  bgez       $7, .L001C676C
/* C6858 001C6758 00000000 */   nop
/* C685C 001C675C 23380700 */  negu       $7, $7
/* C6860 001C6760 FFFF0824 */  addiu      $8, $0, -0x1
/* C6864 001C6764 02000010 */  b          .L001C6770
/* C6868 001C6768 00000000 */   nop
.L001C676C:
/* C686C 001C676C 01000824 */  addiu      $8, $0, 0x1
.L001C6770:
/* C6870 001C6770 284E0070 */  paddub     $9, $0, $0
/* C6874 001C6774 3C000010 */  b          .L001C6868
/* C6878 001C6778 00000000 */   nop
.L001C677C:
/* C687C 001C677C 21586801 */  addu       $11, $11, $8
/* C6880 001C6780 80500200 */  sll        $10, $2, 2
/* C6884 001C6784 21504201 */  addu       $10, $10, $2
/* C6888 001C6788 80500A00 */  sll        $10, $10, 2
/* C688C 001C678C 21686A01 */  addu       $13, $11, $10
/* C6890 001C6790 C0500D00 */  sll        $10, $13, 3
/* C6894 001C6794 21504D01 */  addu       $10, $10, $13
/* C6898 001C6798 40500A00 */  sll        $10, $10, 1
/* C689C 001C679C 21504D01 */  addu       $10, $10, $13
/* C68A0 001C67A0 80500A00 */  sll        $10, $10, 2
/* C68A4 001C67A4 D6010D3C */  lui        $13, %hi(buildMapWork)
/* C68A8 001C67A8 60E4AD25 */  addiu      $13, $13, %lo(buildMapWork)
/* C68AC 001C67AC 2178AA01 */  addu       $15, $13, $10
/* C68B0 001C67B0 0000EE8D */  lw         $14, 0x0($15)
/* C68B4 001C67B4 FFFF0D24 */  addiu      $13, $0, -0x1
/* C68B8 001C67B8 1100CD15 */  bne        $14, $13, .L001C6800
/* C68BC 001C67BC 00000000 */   nop
/* C68C0 001C67C0 0000ECAD */  sw         $12, 0x0($15)
/* C68C4 001C67C4 01000F24 */  addiu      $15, $0, 0x1
/* C68C8 001C67C8 D6010D3C */  lui        $13, %hi(D_1D5E468)
/* C68CC 001C67CC 68E4AD25 */  addiu      $13, $13, %lo(D_1D5E468)
/* C68D0 001C67D0 2170AA01 */  addu       $14, $13, $10
/* C68D4 001C67D4 80680C00 */  sll        $13, $12, 2
/* C68D8 001C67D8 2168AE01 */  addu       $13, $13, $14
/* C68DC 001C67DC 0000AFAD */  sw         $15, 0x0($13)
/* C68E0 001C67E0 D6010D3C */  lui        $13, %hi(D_1D5E4A8)
/* C68E4 001C67E4 A8E4AD25 */  addiu      $13, $13, %lo(D_1D5E4A8)
/* C68E8 001C67E8 2168AA01 */  addu       $13, $13, $10
/* C68EC 001C67EC 0000AA8D */  lw         $10, 0x0($13)
/* C68F0 001C67F0 02004A35 */  ori        $10, $10, 0x2
/* C68F4 001C67F4 0000AAAD */  sw         $10, 0x0($13)
/* C68F8 001C67F8 1A000010 */  b          .L001C6864
/* C68FC 001C67FC 00000000 */   nop
.L001C6800:
/* C6900 001C6800 D601033C */  lui        $3, %hi(D_1D5E4A8)
/* C6904 001C6804 A8E46324 */  addiu      $3, $3, %lo(D_1D5E4A8)
/* C6908 001C6808 21786A00 */  addu       $15, $3, $10
/* C690C 001C680C 0000EE8D */  lw         $14, 0x0($15)
/* C6910 001C6810 0100C331 */  andi       $3, $14, 0x1
/* C6914 001C6814 01000D24 */  addiu      $13, $0, 0x1
/* C6918 001C6818 0B006D14 */  bne        $3, $13, .L001C6848
/* C691C 001C681C 00000000 */   nop
/* C6920 001C6820 0400C335 */  ori        $3, $14, 0x4
/* C6924 001C6824 0000E3AD */  sw         $3, 0x0($15)
/* C6928 001C6828 D601033C */  lui        $3, %hi(D_1D5E468)
/* C692C 001C682C 68E46324 */  addiu      $3, $3, %lo(D_1D5E468)
/* C6930 001C6830 21506A00 */  addu       $10, $3, $10
/* C6934 001C6834 80180C00 */  sll        $3, $12, 2
/* C6938 001C6838 21186A00 */  addu       $3, $3, $10
/* C693C 001C683C 00006DAC */  sw         $13, 0x0($3)
/* C6940 001C6840 07000010 */  b          .L001C6860
/* C6944 001C6844 00000000 */   nop
.L001C6848:
/* C6948 001C6848 D601033C */  lui        $3, %hi(D_1D5E468)
/* C694C 001C684C 68E46324 */  addiu      $3, $3, %lo(D_1D5E468)
/* C6950 001C6850 21506A00 */  addu       $10, $3, $10
/* C6954 001C6854 80180C00 */  sll        $3, $12, 2
/* C6958 001C6858 21186A00 */  addu       $3, $3, $10
/* C695C 001C685C 00006DAC */  sw         $13, 0x0($3)
.L001C6860:
/* C6960 001C6860 01000324 */  addiu      $3, $0, 0x1
.L001C6864:
/* C6964 001C6864 01002925 */  addiu      $9, $9, 0x1
.L001C6868:
/* C6968 001C6868 2A502701 */  slt        $10, $9, $7
/* C696C 001C686C C3FF4015 */  bnez       $10, .L001C677C
/* C6970 001C6870 00000000 */   nop
/* C6974 001C6874 4A000010 */  b          .L001C69A0
/* C6978 001C6878 00000000 */   nop
.L001C687C:
/* C697C 001C687C 2338A200 */  subu       $7, $5, $2
/* C6980 001C6880 0500E104 */  bgez       $7, .L001C6898
/* C6984 001C6884 00000000 */   nop
/* C6988 001C6888 23380700 */  negu       $7, $7
/* C698C 001C688C FFFF0824 */  addiu      $8, $0, -0x1
/* C6990 001C6890 02000010 */  b          .L001C689C
/* C6994 001C6894 00000000 */   nop
.L001C6898:
/* C6998 001C6898 01000824 */  addiu      $8, $0, 0x1
.L001C689C:
/* C699C 001C689C 284E0070 */  paddub     $9, $0, $0
/* C69A0 001C68A0 3C000010 */  b          .L001C6994
/* C69A4 001C68A4 00000000 */   nop
.L001C68A8:
/* C69A8 001C68A8 21104800 */  addu       $2, $2, $8
/* C69AC 001C68AC 80500200 */  sll        $10, $2, 2
/* C69B0 001C68B0 21504201 */  addu       $10, $10, $2
/* C69B4 001C68B4 80500A00 */  sll        $10, $10, 2
/* C69B8 001C68B8 21686A01 */  addu       $13, $11, $10
/* C69BC 001C68BC C0500D00 */  sll        $10, $13, 3
/* C69C0 001C68C0 21504D01 */  addu       $10, $10, $13
/* C69C4 001C68C4 40500A00 */  sll        $10, $10, 1
/* C69C8 001C68C8 21504D01 */  addu       $10, $10, $13
/* C69CC 001C68CC 80500A00 */  sll        $10, $10, 2
/* C69D0 001C68D0 D6010D3C */  lui        $13, %hi(buildMapWork)
/* C69D4 001C68D4 60E4AD25 */  addiu      $13, $13, %lo(buildMapWork)
/* C69D8 001C68D8 2178AA01 */  addu       $15, $13, $10
/* C69DC 001C68DC 0000EE8D */  lw         $14, 0x0($15)
/* C69E0 001C68E0 FFFF0D24 */  addiu      $13, $0, -0x1
/* C69E4 001C68E4 1100CD15 */  bne        $14, $13, .L001C692C
/* C69E8 001C68E8 00000000 */   nop
/* C69EC 001C68EC 0000ECAD */  sw         $12, 0x0($15)
/* C69F0 001C68F0 01000F24 */  addiu      $15, $0, 0x1
/* C69F4 001C68F4 D6010D3C */  lui        $13, %hi(D_1D5E468)
/* C69F8 001C68F8 68E4AD25 */  addiu      $13, $13, %lo(D_1D5E468)
/* C69FC 001C68FC 2170AA01 */  addu       $14, $13, $10
/* C6A00 001C6900 80680C00 */  sll        $13, $12, 2
/* C6A04 001C6904 2168AE01 */  addu       $13, $13, $14
/* C6A08 001C6908 0000AFAD */  sw         $15, 0x0($13)
/* C6A0C 001C690C D6010D3C */  lui        $13, %hi(D_1D5E4A8)
/* C6A10 001C6910 A8E4AD25 */  addiu      $13, $13, %lo(D_1D5E4A8)
/* C6A14 001C6914 2168AA01 */  addu       $13, $13, $10
/* C6A18 001C6918 0000AA8D */  lw         $10, 0x0($13)
/* C6A1C 001C691C 02004A35 */  ori        $10, $10, 0x2
/* C6A20 001C6920 0000AAAD */  sw         $10, 0x0($13)
/* C6A24 001C6924 1A000010 */  b          .L001C6990
/* C6A28 001C6928 00000000 */   nop
.L001C692C:
/* C6A2C 001C692C D601033C */  lui        $3, %hi(D_1D5E4A8)
/* C6A30 001C6930 A8E46324 */  addiu      $3, $3, %lo(D_1D5E4A8)
/* C6A34 001C6934 21786A00 */  addu       $15, $3, $10
/* C6A38 001C6938 0000EE8D */  lw         $14, 0x0($15)
/* C6A3C 001C693C 0100C331 */  andi       $3, $14, 0x1
/* C6A40 001C6940 01000D24 */  addiu      $13, $0, 0x1
/* C6A44 001C6944 0B006D14 */  bne        $3, $13, .L001C6974
/* C6A48 001C6948 00000000 */   nop
/* C6A4C 001C694C 0400C335 */  ori        $3, $14, 0x4
/* C6A50 001C6950 0000E3AD */  sw         $3, 0x0($15)
/* C6A54 001C6954 D601033C */  lui        $3, %hi(D_1D5E468)
/* C6A58 001C6958 68E46324 */  addiu      $3, $3, %lo(D_1D5E468)
/* C6A5C 001C695C 21506A00 */  addu       $10, $3, $10
/* C6A60 001C6960 80180C00 */  sll        $3, $12, 2
/* C6A64 001C6964 21186A00 */  addu       $3, $3, $10
/* C6A68 001C6968 00006DAC */  sw         $13, 0x0($3)
/* C6A6C 001C696C 07000010 */  b          .L001C698C
/* C6A70 001C6970 00000000 */   nop
.L001C6974:
/* C6A74 001C6974 D601033C */  lui        $3, %hi(D_1D5E468)
/* C6A78 001C6978 68E46324 */  addiu      $3, $3, %lo(D_1D5E468)
/* C6A7C 001C697C 21506A00 */  addu       $10, $3, $10
/* C6A80 001C6980 80180C00 */  sll        $3, $12, 2
/* C6A84 001C6984 21186A00 */  addu       $3, $3, $10
/* C6A88 001C6988 00006DAC */  sw         $13, 0x0($3)
.L001C698C:
/* C6A8C 001C698C 01000324 */  addiu      $3, $0, 0x1
.L001C6990:
/* C6A90 001C6990 01002925 */  addiu      $9, $9, 0x1
.L001C6994:
/* C6A94 001C6994 2A502701 */  slt        $10, $9, $7
/* C6A98 001C6998 C3FF4015 */  bnez       $10, .L001C68A8
/* C6A9C 001C699C 00000000 */   nop
.L001C69A0:
/* C6AA0 001C69A0 04000724 */  addiu      $7, $0, 0x4
/* C6AA4 001C69A4 1500C710 */  beq        $6, $7, .L001C69FC
/* C6AA8 001C69A8 00000000 */   nop
/* C6AAC 001C69AC 02000724 */  addiu      $7, $0, 0x2
/* C6AB0 001C69B0 0F00C710 */  beq        $6, $7, .L001C69F0
/* C6AB4 001C69B4 00000000 */   nop
/* C6AB8 001C69B8 08000724 */  addiu      $7, $0, 0x8
/* C6ABC 001C69BC 0900C710 */  beq        $6, $7, .L001C69E4
/* C6AC0 001C69C0 00000000 */   nop
/* C6AC4 001C69C4 01000724 */  addiu      $7, $0, 0x1
/* C6AC8 001C69C8 0300C710 */  beq        $6, $7, .L001C69D8
/* C6ACC 001C69CC 00000000 */   nop
/* C6AD0 001C69D0 0B000010 */  b          .L001C6A00
/* C6AD4 001C69D4 00000000 */   nop
.L001C69D8:
/* C6AD8 001C69D8 FFFF4224 */  addiu      $2, $2, -0x1
/* C6ADC 001C69DC 08000010 */  b          .L001C6A00
/* C6AE0 001C69E0 00000000 */   nop
.L001C69E4:
/* C6AE4 001C69E4 01004224 */  addiu      $2, $2, 0x1
/* C6AE8 001C69E8 05000010 */  b          .L001C6A00
/* C6AEC 001C69EC 00000000 */   nop
.L001C69F0:
/* C6AF0 001C69F0 01006B25 */  addiu      $11, $11, 0x1
/* C6AF4 001C69F4 02000010 */  b          .L001C6A00
/* C6AF8 001C69F8 00000000 */   nop
.L001C69FC:
/* C6AFC 001C69FC FFFF6B25 */  addiu      $11, $11, -0x1
.L001C6A00:
/* C6B00 001C6A00 E7030D24 */  addiu      $13, $0, 0x3E7
.L001C6A04:
/* C6B04 001C6A04 EDFE6010 */  beqz       $3, .L001C65BC
/* C6B08 001C6A08 00000000 */   nop
/* C6B0C 001C6A0C D501023C */  lui        $2, %hi(buildMapDat)
/* C6B10 001C6A10 A06D4424 */  addiu      $4, $2, %lo(buildMapDat)
/* C6B14 001C6A14 D601023C */  lui        $2, %hi(buildMapWork)
/* C6B18 001C6A18 60E44524 */  addiu      $5, $2, %lo(buildMapWork)
/* C6B1C 001C6A1C 4C18070C */  jal        copyMapInfo__FP14BUILD_MAP_INFOP14BUILD_MAP_INFO
/* C6B20 001C6A20 00000000 */   nop
/* C6B24 001C6A24 01000224 */  addiu      $2, $0, 0x1
/* C6B28 001C6A28 0000BF7B */  lq         $31, 0x0($sp)
/* C6B2C 001C6A2C 1000BD27 */  addiu      $sp, $sp, 0x10
/* C6B30 001C6A30 0800E003 */  jr         $31
/* C6B34 001C6A34 00000000 */   nop
/* C6B38 001C6A38 00000000 */  nop
/* C6B3C 001C6A3C 00000000 */  nop
