.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Step__12CSHOT_EFFECTFv
/* AC280 001AC180 90FEBD27 */  addiu      $sp, $sp, -0x170
/* AC284 001AC184 A000BF7F */  sq         $31, 0xA0($sp)
/* AC288 001AC188 9000BE7F */  sq         $fp, 0x90($sp)
/* AC28C 001AC18C 8000B77F */  sq         $23, 0x80($sp)
/* AC290 001AC190 7000B67F */  sq         $22, 0x70($sp)
/* AC294 001AC194 6000B57F */  sq         $21, 0x60($sp)
/* AC298 001AC198 5000B47F */  sq         $20, 0x50($sp)
/* AC29C 001AC19C 4000B37F */  sq         $19, 0x40($sp)
/* AC2A0 001AC1A0 3000B27F */  sq         $18, 0x30($sp)
/* AC2A4 001AC1A4 2000B17F */  sq         $17, 0x20($sp)
/* AC2A8 001AC1A8 1000B07F */  sq         $16, 0x10($sp)
/* AC2AC 001AC1AC 0000B4E7 */  swc1       $f20, 0x0($sp)
/* AC2B0 001AC1B0 28AE8070 */  paddub     $21, $4, $0
/* AC2B4 001AC1B4 28860070 */  paddub     $16, $0, $0
/* AC2B8 001AC1B8 4C020010 */  b          .L001ACAEC
/* AC2BC 001AC1BC 00000000 */   nop
.L001AC1C0:
/* AC2C0 001AC1C0 40181000 */  sll        $3, $16, 1
/* AC2C4 001AC1C4 E000A3AF */  sw         $3, 0xE0($sp)
/* AC2C8 001AC1C8 E000A38F */  lw         $3, 0xE0($sp)
/* AC2CC 001AC1CC 21207500 */  addu       $4, $3, $21
/* AC2D0 001AC1D0 08209224 */  addiu      $18, $4, 0x2008
/* AC2D4 001AC1D4 F87F5226 */  addiu      $18, $18, 0x7FF8
/* AC2D8 001AC1D8 00004386 */  lh         $3, 0x0($18)
/* AC2DC 001AC1DC 42026010 */  beqz       $3, .L001ACAE8
/* AC2E0 001AC1E0 00000000 */   nop
/* AC2E4 001AC1E4 F81F9124 */  addiu      $17, $4, 0x1FF8
/* AC2E8 001AC1E8 F87F3126 */  addiu      $17, $17, 0x7FF8
/* AC2EC 001AC1EC 00002786 */  lh         $7, 0x0($17)
/* AC2F0 001AC1F0 40200700 */  sll        $4, $7, 1
/* AC2F4 001AC1F4 0000A38E */  lw         $3, 0x0($21)
/* AC2F8 001AC1F8 21188300 */  addu       $3, $4, $3
/* AC2FC 001AC1FC 4C006584 */  lh         $5, 0x4C($3)
/* AC300 001AC200 B0110324 */  addiu      $3, $0, 0x11B0
/* AC304 001AC204 18F00302 */  mult       $fp, $16, $3
/* AC308 001AC208 2118D503 */  addu       $3, $fp, $21
/* AC30C 001AC20C B0147724 */  addiu      $23, $3, 0x14B0
/* AC310 001AC210 B01461C4 */  lwc1       $f1, 0x14B0($3)
/* AC314 001AC214 04156424 */  addiu      $4, $3, 0x1504
/* AC318 001AC218 F000A4AF */  sw         $4, 0xF0($sp)
/* AC31C 001AC21C 0415668C */  lw         $6, 0x1504($3)
/* AC320 001AC220 00210500 */  sll        $4, $5, 4
/* AC324 001AC224 21208600 */  addu       $4, $4, $6
/* AC328 001AC228 040080C4 */  lwc1       $f0, 0x4($4)
/* AC32C 001AC22C 20058046 */  cvt.s.w    $f20, $f0
/* AC330 001AC230 80A01000 */  sll        $20, $16, 2
/* AC334 001AC234 21209502 */  addu       $4, $20, $21
/* AC338 001AC238 0100013C */  lui        $at, (0x10000 >> 16)
/* AC33C 001AC23C 21088100 */  addu       $at, $4, $at
/* AC340 001AC240 B0A0248C */  lw         $4, -0x5F50($at)
/* AC344 001AC244 FFFF0624 */  addiu      $6, $0, -0x1
/* AC348 001AC248 1E008610 */  beq        $4, $6, .L001AC2C4
/* AC34C 001AC24C 00000000 */   nop
/* AC350 001AC250 2A08E400 */  slt        $at, $7, $4
/* AC354 001AC254 24022010 */  beqz       $at, .L001ACAE8
/* AC358 001AC258 00000000 */   nop
/* AC35C 001AC25C 803F043C */  lui        $4, (0x3F800000 >> 16)
/* AC360 001AC260 00008444 */  mtc1       $4, $f0
/* AC364 001AC264 00000000 */  nop
/* AC368 001AC268 01A00046 */  sub.s      $f0, $f20, $f0
/* AC36C 001AC26C 34080046 */  c.lt.s     $f1, $f0
/* AC370 001AC270 00000000 */  nop
/* AC374 001AC274 1C020145 */  bc1t       .L001ACAE8
/* AC378 001AC278 00000000 */   nop
/* AC37C 001AC27C 36081446 */  c.le.s     $f1, $f20
/* AC380 001AC280 00000000 */  nop
/* AC384 001AC284 18020045 */  bc1f       .L001ACAE8
/* AC388 001AC288 00000000 */   nop
/* AC38C 001AC28C 0100E424 */  addiu      $4, $7, 0x1
/* AC390 001AC290 000024A6 */  sh         $4, 0x0($17)
/* AC394 001AC294 0000A58E */  lw         $5, 0x0($21)
/* AC398 001AC298 00002486 */  lh         $4, 0x0($17)
/* AC39C 001AC29C 40200400 */  sll        $4, $4, 1
/* AC3A0 001AC2A0 21208500 */  addu       $4, $4, $5
/* AC3A4 001AC2A4 4C008484 */  lh         $4, 0x4C($4)
/* AC3A8 001AC2A8 281E64AC */  sw         $4, 0x1E28($3)
/* AC3AC 001AC2AC 04000424 */  addiu      $4, $0, 0x4
/* AC3B0 001AC2B0 241E64AC */  sw         $4, 0x1E24($3)
/* AC3B4 001AC2B4 80BF043C */  lui        $4, (0xBF800000 >> 16)
/* AC3B8 001AC2B8 201E64AC */  sw         $4, 0x1E20($3)
/* AC3BC 001AC2BC 0A020010 */  b          .L001ACAE8
/* AC3C0 001AC2C0 00000000 */   nop
.L001AC2C4:
/* AC3C4 001AC2C4 2A00E014 */  bnez       $7, .L001AC370
/* AC3C8 001AC2C8 00000000 */   nop
/* AC3CC 001AC2CC 803F043C */  lui        $4, (0x3F800000 >> 16)
/* AC3D0 001AC2D0 00008444 */  mtc1       $4, $f0
/* AC3D4 001AC2D4 00000000 */  nop
/* AC3D8 001AC2D8 01A00046 */  sub.s      $f0, $f20, $f0
/* AC3DC 001AC2DC 34080046 */  c.lt.s     $f1, $f0
/* AC3E0 001AC2E0 00000000 */  nop
/* AC3E4 001AC2E4 22000145 */  bc1t       .L001AC370
/* AC3E8 001AC2E8 00000000 */   nop
/* AC3EC 001AC2EC 36081446 */  c.le.s     $f1, $f20
/* AC3F0 001AC2F0 00000000 */  nop
/* AC3F4 001AC2F4 1E000045 */  bc1f       .L001AC370
/* AC3F8 001AC2F8 00000000 */   nop
/* AC3FC 001AC2FC 0100E424 */  addiu      $4, $7, 0x1
/* AC400 001AC300 000024A6 */  sh         $4, 0x0($17)
/* AC404 001AC304 0000A58E */  lw         $5, 0x0($21)
/* AC408 001AC308 00002486 */  lh         $4, 0x0($17)
/* AC40C 001AC30C 40200400 */  sll        $4, $4, 1
/* AC410 001AC310 21208500 */  addu       $4, $4, $5
/* AC414 001AC314 4C008484 */  lh         $4, 0x4C($4)
/* AC418 001AC318 04008614 */  bne        $4, $6, .L001AC32C
/* AC41C 001AC31C 00000000 */   nop
/* AC420 001AC320 000040A6 */  sh         $0, 0x0($18)
/* AC424 001AC324 F0010010 */  b          .L001ACAE8
/* AC428 001AC328 00000000 */   nop
.L001AC32C:
/* AC42C 001AC32C 00210400 */  sll        $4, $4, 4
/* AC430 001AC330 F000A28F */  lw         $2, 0xF0($sp)
/* AC434 001AC334 0000428C */  lw         $2, 0x0($2)
/* AC438 001AC338 21104400 */  addu       $2, $2, $4
/* AC43C 001AC33C 000040C4 */  lwc1       $f0, 0x0($2)
/* AC440 001AC340 20008046 */  cvt.s.w    $f0, $f0
/* AC444 001AC344 0000E0E6 */  swc1       $f0, 0x0($23)
/* AC448 001AC348 0000A48E */  lw         $4, 0x0($21)
/* AC44C 001AC34C 00002286 */  lh         $2, 0x0($17)
/* AC450 001AC350 40100200 */  sll        $2, $2, 1
/* AC454 001AC354 21104400 */  addu       $2, $2, $4
/* AC458 001AC358 4C004284 */  lh         $2, 0x4C($2)
/* AC45C 001AC35C 281E62AC */  sw         $2, 0x1E28($3)
/* AC460 001AC360 04000224 */  addiu      $2, $0, 0x4
/* AC464 001AC364 241E62AC */  sw         $2, 0x1E24($3)
/* AC468 001AC368 80BF023C */  lui        $2, (0xBF800000 >> 16)
/* AC46C 001AC36C 201E62AC */  sw         $2, 0x1E20($3)
.L001AC370:
/* AC470 001AC370 2110BE02 */  addu       $2, $21, $fp
/* AC474 001AC374 C0115324 */  addiu      $19, $2, 0x11C0
/* AC478 001AC378 28266072 */  paddub     $4, $19, $0
/* AC47C 001AC37C 2001A527 */  addiu      $5, $sp, 0x120
/* AC480 001AC380 6012598C */  lw         $25, 0x1260($2)
/* AC484 001AC384 A000398F */  lw         $25, 0xA0($25)
/* AC488 001AC388 09F82003 */  jalr       $25
/* AC48C 001AC38C 00000000 */   nop
/* AC490 001AC390 28266072 */  paddub     $4, $19, $0
/* AC494 001AC394 1001A527 */  addiu      $5, $sp, 0x110
/* AC498 001AC398 A000798E */  lw         $25, 0xA0($19)
/* AC49C 001AC39C A000398F */  lw         $25, 0xA0($25)
/* AC4A0 001AC3A0 09F82003 */  jalr       $25
/* AC4A4 001AC3A4 00000000 */   nop
/* AC4A8 001AC3A8 BC00A0AF */  sw         $0, 0xBC($sp)
/* AC4AC 001AC3AC 00002486 */  lh         $4, 0x0($17)
/* AC4B0 001AC3B0 02008128 */  slti       $at, $4, 0x2
/* AC4B4 001AC3B4 0F002010 */  beqz       $at, .L001AC3F4
/* AC4B8 001AC3B8 00000000 */   nop
/* AC4BC 001AC3BC 0000A78E */  lw         $7, 0x0($21)
/* AC4C0 001AC3C0 00111000 */  sll        $2, $16, 4
/* AC4C4 001AC3C4 2118A202 */  addu       $3, $21, $2
/* AC4C8 001AC3C8 80100400 */  sll        $2, $4, 2
/* AC4CC 001AC3CC 21104700 */  addu       $2, $2, $7
/* AC4D0 001AC3D0 1001A427 */  addiu      $4, $sp, 0x110
/* AC4D4 001AC3D4 2001A527 */  addiu      $5, $sp, 0x120
/* AC4D8 001AC3D8 481F6624 */  addiu      $6, $3, 0x1F48
/* AC4DC 001AC3DC F87FC624 */  addiu      $6, $6, 0x7FF8
/* AC4E0 001AC3E0 4800E78C */  lw         $7, 0x48($7)
/* AC4E4 001AC3E4 28004CC4 */  lwc1       $f12, 0x28($2)
/* AC4E8 001AC3E8 D0AD060C */  jal        checkCollision__FPfPfPfif
/* AC4EC 001AC3EC 00000000 */   nop
/* AC4F0 001AC3F0 BC00A2AF */  sw         $2, 0xBC($sp)
.L001AC3F4:
/* AC4F4 001AC3F4 21189502 */  addu       $3, $20, $21
/* AC4F8 001AC3F8 F8206524 */  addiu      $5, $3, 0x20F8
/* AC4FC 001AC3FC F87FA524 */  addiu      $5, $5, 0x7FF8
/* AC500 001AC400 0000A38C */  lw         $3, 0x0($5)
/* AC504 001AC404 03006018 */  blez       $3, .L001AC414
/* AC508 001AC408 00000000 */   nop
/* AC50C 001AC40C FFFF6324 */  addiu      $3, $3, -0x1
/* AC510 001AC410 0000A3AC */  sw         $3, 0x0($5)
.L001AC414:
/* AC514 001AC414 0000A38E */  lw         $3, 0x0($21)
/* AC518 001AC418 00002486 */  lh         $4, 0x0($17)
/* AC51C 001AC41C 80200400 */  sll        $4, $4, 2
/* AC520 001AC420 21208300 */  addu       $4, $4, $3
/* AC524 001AC424 28008CC4 */  lwc1       $f12, 0x28($4)
/* AC528 001AC428 00008044 */  mtc1       $0, $f0
/* AC52C 001AC42C 00000000 */  nop
/* AC530 001AC430 36600046 */  c.le.s     $f12, $f0
/* AC534 001AC434 00000000 */  nop
/* AC538 001AC438 B7000145 */  bc1t       .L001AC718
/* AC53C 001AC43C 00000000 */   nop
/* AC540 001AC440 0000A48C */  lw         $4, 0x0($5)
/* AC544 001AC444 B4008010 */  beqz       $4, .L001AC718
/* AC548 001AC448 00000000 */   nop
/* AC54C 001AC44C 21201502 */  addu       $4, $16, $21
/* AC550 001AC450 48218424 */  addiu      $4, $4, 0x2148
/* AC554 001AC454 F87F8424 */  addiu      $4, $4, 0x7FF8
/* AC558 001AC458 0001A4AF */  sw         $4, 0x100($sp)
/* AC55C 001AC45C 0001A48F */  lw         $4, 0x100($sp)
/* AC560 001AC460 00008480 */  lb         $4, 0x0($4)
/* AC564 001AC464 A900801C */  bgtz       $4, .L001AC70C
/* AC568 001AC468 00000000 */   nop
/* AC56C 001AC46C 21309502 */  addu       $6, $20, $21
/* AC570 001AC470 803F023C */  lui        $2, (0x3F800000 >> 16)
/* AC574 001AC474 00688244 */  mtc1       $2, $f13
/* AC578 001AC478 F09D848F */  lw         $4, -0x6210($gp)
/* AC57C 001AC47C 1001A527 */  addiu      $5, $sp, 0x110
/* AC580 001AC480 0100013C */  lui        $at, (0x10000 >> 16)
/* AC584 001AC484 2108C100 */  addu       $at, $6, $at
/* AC588 001AC488 10A0268C */  lw         $6, -0x5FF0($at)
/* AC58C 001AC48C 02000724 */  addiu      $7, $0, 0x2
/* AC590 001AC490 4800688C */  lw         $8, 0x48($3)
/* AC594 001AC494 4400698C */  lw         $9, 0x44($3)
/* AC598 001AC498 40006A8C */  lw         $10, 0x40($3)
/* AC59C 001AC49C 285E0070 */  paddub     $11, $0, $0
/* AC5A0 001AC4A0 E8D5060C */  jal        Set__14CCollisionDataFPfiiffiiii
/* AC5A4 001AC4A4 00000000 */   nop
/* AC5A8 001AC4A8 28B64070 */  paddub     $22, $2, $0
/* AC5AC 001AC4AC FFFF0324 */  addiu      $3, $0, -0x1
/* AC5B0 001AC4B0 9900C312 */  beq        $22, $3, .L001AC718
/* AC5B4 001AC4B4 00000000 */   nop
/* AC5B8 001AC4B8 21209502 */  addu       $4, $20, $21
/* AC5BC 001AC4BC 0100013C */  lui        $at, (0x10000 >> 16)
/* AC5C0 001AC4C0 21088100 */  addu       $at, $4, $at
/* AC5C4 001AC4C4 70A0258C */  lw         $5, -0x5F90($at)
/* AC5C8 001AC4C8 E000A38F */  lw         $3, 0xE0($sp)
/* AC5CC 001AC4CC 21187500 */  addu       $3, $3, $21
/* AC5D0 001AC4D0 0100013C */  lui        $at, (0x10000 >> 16)
/* AC5D4 001AC4D4 21086100 */  addu       $at, $3, $at
/* AC5D8 001AC4D8 50A02984 */  lh         $9, -0x5FB0($at)
/* AC5DC 001AC4DC F09D868F */  lw         $6, -0x6210($gp)
/* AC5E0 001AC4E0 803DC88C */  lw         $8, 0x3D80($6)
/* AC5E4 001AC4E4 80380800 */  sll        $7, $8, 2
/* AC5E8 001AC4E8 2138E800 */  addu       $7, $7, $8
/* AC5EC 001AC4EC 40390700 */  sll        $7, $7, 5
/* AC5F0 001AC4F0 2138E600 */  addu       $7, $7, $6
/* AC5F4 001AC4F4 5800E9AC */  sw         $9, 0x58($7)
/* AC5F8 001AC4F8 803DC88C */  lw         $8, 0x3D80($6)
/* AC5FC 001AC4FC 80380800 */  sll        $7, $8, 2
/* AC600 001AC500 2138E800 */  addu       $7, $7, $8
/* AC604 001AC504 40390700 */  sll        $7, $7, 5
/* AC608 001AC508 2130E600 */  addu       $6, $7, $6
/* AC60C 001AC50C 6000C5AC */  sw         $5, 0x60($6)
/* AC610 001AC510 0100013C */  lui        $at, (0x10000 >> 16)
/* AC614 001AC514 21088100 */  addu       $at, $4, $at
/* AC618 001AC518 30A0278C */  lw         $7, -0x5FD0($at)
/* AC61C 001AC51C F09D888F */  lw         $8, -0x6210($gp)
/* AC620 001AC520 803D068D */  lw         $6, 0x3D80($8)
/* AC624 001AC524 80280600 */  sll        $5, $6, 2
/* AC628 001AC528 2128A600 */  addu       $5, $5, $6
/* AC62C 001AC52C 40290500 */  sll        $5, $5, 5
/* AC630 001AC530 2128A800 */  addu       $5, $5, $8
/* AC634 001AC534 6C00A7AC */  sw         $7, 0x6C($5)
/* AC638 001AC538 0100013C */  lui        $at, (0x10000 >> 16)
/* AC63C 001AC53C 21088100 */  addu       $at, $4, $at
/* AC640 001AC540 90A0278C */  lw         $7, -0x5F70($at)
/* AC644 001AC544 F09D888F */  lw         $8, -0x6210($gp)
/* AC648 001AC548 803D068D */  lw         $6, 0x3D80($8)
/* AC64C 001AC54C 80280600 */  sll        $5, $6, 2
/* AC650 001AC550 2128A600 */  addu       $5, $5, $6
/* AC654 001AC554 40290500 */  sll        $5, $5, 5
/* AC658 001AC558 2128A800 */  addu       $5, $5, $8
/* AC65C 001AC55C 6400A7AC */  sw         $7, 0x64($5)
/* AC660 001AC560 0100013C */  lui        $at, (0x10000 >> 16)
/* AC664 001AC564 21086100 */  addu       $at, $3, $at
/* AC668 001AC568 60A02684 */  lh         $6, -0x5FA0($at)
/* AC66C 001AC56C F09D878F */  lw         $7, -0x6210($gp)
/* AC670 001AC570 803DE58C */  lw         $5, 0x3D80($7)
/* AC674 001AC574 80180500 */  sll        $3, $5, 2
/* AC678 001AC578 21186500 */  addu       $3, $3, $5
/* AC67C 001AC57C 40190300 */  sll        $3, $3, 5
/* AC680 001AC580 21186700 */  addu       $3, $3, $7
/* AC684 001AC584 5C0066AC */  sw         $6, 0x5C($3)
/* AC688 001AC588 0100013C */  lui        $at, (0x10000 >> 16)
/* AC68C 001AC58C 21088100 */  addu       $at, $4, $at
/* AC690 001AC590 10A1258C */  lw         $5, -0x5EF0($at)
/* AC694 001AC594 F09D868F */  lw         $6, -0x6210($gp)
/* AC698 001AC598 803DC48C */  lw         $4, 0x3D80($6)
/* AC69C 001AC59C 80180400 */  sll        $3, $4, 2
/* AC6A0 001AC5A0 21186400 */  addu       $3, $3, $4
/* AC6A4 001AC5A4 40190300 */  sll        $3, $3, 5
/* AC6A8 001AC5A8 21186600 */  addu       $3, $3, $6
/* AC6AC 001AC5AC 680065AC */  sw         $5, 0x68($3)
/* AC6B0 001AC5B0 0000A38E */  lw         $3, 0x0($21)
/* AC6B4 001AC5B4 4400648C */  lw         $4, 0x44($3)
/* AC6B8 001AC5B8 03000324 */  addiu      $3, $0, 0x3
/* AC6BC 001AC5BC 4B008314 */  bne        $4, $3, .L001AC6EC
/* AC6C0 001AC5C0 00000000 */   nop
/* AC6C4 001AC5C4 803F023C */  lui        $2, (0x3F800000 >> 16)
/* AC6C8 001AC5C8 00191000 */  sll        $3, $16, 4
/* AC6CC 001AC5CC 21287500 */  addu       $5, $3, $21
/* AC6D0 001AC5D0 0100013C */  lui        $at, (0x10000 >> 16)
/* AC6D4 001AC5D4 2108A100 */  addu       $at, $5, $at
/* AC6D8 001AC5D8 4C9F22AC */  sw         $2, -0x60B4($at)
/* AC6DC 001AC5DC 0000A38E */  lw         $3, 0x0($21)
/* AC6E0 001AC5E0 00002286 */  lh         $2, 0x0($17)
/* AC6E4 001AC5E4 80100200 */  sll        $2, $2, 2
/* AC6E8 001AC5E8 21104300 */  addu       $2, $2, $3
/* AC6EC 001AC5EC 180041C4 */  lwc1       $f1, 0x18($2)
/* AC6F0 001AC5F0 00008044 */  mtc1       $0, $f0
/* AC6F4 001AC5F4 00000000 */  nop
/* AC6F8 001AC5F8 36080046 */  c.le.s     $f1, $f0
/* AC6FC 001AC5FC 00000000 */  nop
/* AC700 001AC600 28000045 */  bc1f       .L001AC6A4
/* AC704 001AC604 00000000 */   nop
/* AC708 001AC608 3001A427 */  addiu      $4, $sp, 0x130
/* AC70C 001AC60C EA01023C */  lui        $2, %hi(D_1EA1D30)
/* AC710 001AC610 301D4524 */  addiu      $5, $2, %lo(D_1EA1D30)
/* AC714 001AC614 0C86040C */  jal        sceVu0CopyVector
/* AC718 001AC618 00000000 */   nop
/* AC71C 001AC61C 3001A1C7 */  lwc1       $f1, 0x130($sp)
/* AC720 001AC620 2001A0C7 */  lwc1       $f0, 0x120($sp)
/* AC724 001AC624 01080046 */  sub.s      $f0, $f1, $f0
/* AC728 001AC628 4001A0E7 */  swc1       $f0, 0x140($sp)
/* AC72C 001AC62C 4401A0AF */  sw         $0, 0x144($sp)
/* AC730 001AC630 3801A1C7 */  lwc1       $f1, 0x138($sp)
/* AC734 001AC634 2801A0C7 */  lwc1       $f0, 0x128($sp)
/* AC738 001AC638 01080046 */  sub.s      $f0, $f1, $f0
/* AC73C 001AC63C 4801A0E7 */  swc1       $f0, 0x148($sp)
/* AC740 001AC640 803F023C */  lui        $2, (0x3F800000 >> 16)
/* AC744 001AC644 4C01A2AF */  sw         $2, 0x14C($sp)
/* AC748 001AC648 4001A427 */  addiu      $4, $sp, 0x140
/* AC74C 001AC64C 282E8070 */  paddub     $5, $4, $0
/* AC750 001AC650 9285040C */  jal        sceVu0Normalize
/* AC754 001AC654 00000000 */   nop
/* AC758 001AC658 F09D828F */  lw         $2, -0x6210($gp)
/* AC75C 001AC65C C000A2AF */  sw         $2, 0xC0($sp)
/* AC760 001AC660 5001A427 */  addiu      $4, $sp, 0x150
/* AC764 001AC664 4001A527 */  addiu      $5, $sp, 0x140
/* AC768 001AC668 9285040C */  jal        sceVu0Normalize
/* AC76C 001AC66C 00000000 */   nop
/* AC770 001AC670 80101600 */  sll        $2, $22, 2
/* AC774 001AC674 21105600 */  addu       $2, $2, $22
/* AC778 001AC678 40190200 */  sll        $3, $2, 5
/* AC77C 001AC67C C000A28F */  lw         $2, 0xC0($sp)
/* AC780 001AC680 21184300 */  addu       $3, $2, $3
/* AC784 001AC684 803F023C */  lui        $2, (0x3F800000 >> 16)
/* AC788 001AC688 00608244 */  mtc1       $2, $f12
/* AC78C 001AC68C 20006424 */  addiu      $4, $3, 0x20
/* AC790 001AC690 5001A527 */  addiu      $5, $sp, 0x150
/* AC794 001AC694 4688040C */  jal        sceVu0ScaleVectorXYZ
/* AC798 001AC698 00000000 */   nop
/* AC79C 001AC69C 13000010 */  b          .L001AC6EC
/* AC7A0 001AC6A0 00000000 */   nop
.L001AC6A4:
/* AC7A4 001AC6A4 F09D828F */  lw         $2, -0x6210($gp)
/* AC7A8 001AC6A8 D000A2AF */  sw         $2, 0xD0($sp)
/* AC7AC 001AC6AC 6001A427 */  addiu      $4, $sp, 0x160
/* AC7B0 001AC6B0 481FA524 */  addiu      $5, $5, 0x1F48
/* AC7B4 001AC6B4 F87FA524 */  addiu      $5, $5, 0x7FF8
/* AC7B8 001AC6B8 9285040C */  jal        sceVu0Normalize
/* AC7BC 001AC6BC 00000000 */   nop
/* AC7C0 001AC6C0 80101600 */  sll        $2, $22, 2
/* AC7C4 001AC6C4 21105600 */  addu       $2, $2, $22
/* AC7C8 001AC6C8 40190200 */  sll        $3, $2, 5
/* AC7CC 001AC6CC D000A28F */  lw         $2, 0xD0($sp)
/* AC7D0 001AC6D0 21184300 */  addu       $3, $2, $3
/* AC7D4 001AC6D4 803F023C */  lui        $2, (0x3F800000 >> 16)
/* AC7D8 001AC6D8 00608244 */  mtc1       $2, $f12
/* AC7DC 001AC6DC 20006424 */  addiu      $4, $3, 0x20
/* AC7E0 001AC6E0 6001A527 */  addiu      $5, $sp, 0x160
/* AC7E4 001AC6E4 4688040C */  jal        sceVu0ScaleVectorXYZ
/* AC7E8 001AC6E8 00000000 */   nop
.L001AC6EC:
/* AC7EC 001AC6EC 21181502 */  addu       $3, $16, $21
/* AC7F0 001AC6F0 0100013C */  lui        $at, (0x10000 >> 16)
/* AC7F4 001AC6F4 21086100 */  addu       $at, $3, $at
/* AC7F8 001AC6F8 38A12480 */  lb         $4, -0x5EC8($at)
/* AC7FC 001AC6FC 0001A38F */  lw         $3, 0x100($sp)
/* AC800 001AC700 000064A0 */  sb         $4, 0x0($3)
/* AC804 001AC704 04000010 */  b          .L001AC718
/* AC808 001AC708 00000000 */   nop
.L001AC70C:
/* AC80C 001AC70C FFFF8424 */  addiu      $4, $4, -0x1
/* AC810 001AC710 0001A38F */  lw         $3, 0x100($sp)
/* AC814 001AC714 000064A0 */  sb         $4, 0x0($3)
.L001AC718:
/* AC818 001AC718 BC00A38F */  lw         $3, 0xBC($sp)
/* AC81C 001AC71C 7C006014 */  bnez       $3, .L001AC910
/* AC820 001AC720 00000000 */   nop
/* AC824 001AC724 00B11000 */  sll        $22, $16, 4
/* AC828 001AC728 2110D502 */  addu       $2, $22, $21
/* AC82C 001AC72C 0100013C */  lui        $at, (0x10000 >> 16)
/* AC830 001AC730 21084100 */  addu       $at, $2, $at
/* AC834 001AC734 409F21C4 */  lwc1       $f1, -0x60C0($at)
/* AC838 001AC738 2001A0C7 */  lwc1       $f0, 0x120($sp)
/* AC83C 001AC73C 00000146 */  add.s      $f0, $f0, $f1
/* AC840 001AC740 2001A0E7 */  swc1       $f0, 0x120($sp)
/* AC844 001AC744 0100013C */  lui        $at, (0x10000 >> 16)
/* AC848 001AC748 21084100 */  addu       $at, $2, $at
/* AC84C 001AC74C 449F21C4 */  lwc1       $f1, -0x60BC($at)
/* AC850 001AC750 2401A0C7 */  lwc1       $f0, 0x124($sp)
/* AC854 001AC754 00000146 */  add.s      $f0, $f0, $f1
/* AC858 001AC758 2401A0E7 */  swc1       $f0, 0x124($sp)
/* AC85C 001AC75C 0100013C */  lui        $at, (0x10000 >> 16)
/* AC860 001AC760 21084100 */  addu       $at, $2, $at
/* AC864 001AC764 489F21C4 */  lwc1       $f1, -0x60B8($at)
/* AC868 001AC768 2801A0C7 */  lwc1       $f0, 0x128($sp)
/* AC86C 001AC76C 00000146 */  add.s      $f0, $f0, $f1
/* AC870 001AC770 2801A0E7 */  swc1       $f0, 0x128($sp)
/* AC874 001AC774 28266072 */  paddub     $4, $19, $0
/* AC878 001AC778 2001A527 */  addiu      $5, $sp, 0x120
/* AC87C 001AC77C A000798E */  lw         $25, 0xA0($19)
/* AC880 001AC780 1400398F */  lw         $25, 0x14($25)
/* AC884 001AC784 09F82003 */  jalr       $25
/* AC888 001AC788 00000000 */   nop
/* AC88C 001AC78C 00002486 */  lh         $4, 0x0($17)
/* AC890 001AC790 01000324 */  addiu      $3, $0, 0x1
/* AC894 001AC794 B2008314 */  bne        $4, $3, .L001ACA60
/* AC898 001AC798 00000000 */   nop
/* AC89C 001AC79C 21189502 */  addu       $3, $20, $21
/* AC8A0 001AC7A0 D81F6424 */  addiu      $4, $3, 0x1FD8
/* AC8A4 001AC7A4 F87F8424 */  addiu      $4, $4, 0x7FF8
/* AC8A8 001AC7A8 0000838C */  lw         $3, 0x0($4)
/* AC8AC 001AC7AC FFFF0624 */  addiu      $6, $0, -0x1
/* AC8B0 001AC7B0 AB006610 */  beq        $3, $6, .L001ACA60
/* AC8B4 001AC7B4 00000000 */   nop
/* AC8B8 001AC7B8 FFFF6324 */  addiu      $3, $3, -0x1
/* AC8BC 001AC7BC 000083AC */  sw         $3, 0x0($4)
/* AC8C0 001AC7C0 0000838C */  lw         $3, 0x0($4)
/* AC8C4 001AC7C4 A6006614 */  bne        $3, $6, .L001ACA60
/* AC8C8 001AC7C8 00000000 */   nop
/* AC8CC 001AC7CC 00002386 */  lh         $3, 0x0($17)
/* AC8D0 001AC7D0 02006324 */  addiu      $3, $3, 0x2
/* AC8D4 001AC7D4 000023A6 */  sh         $3, 0x0($17)
/* AC8D8 001AC7D8 0000A58E */  lw         $5, 0x0($21)
/* AC8DC 001AC7DC 00002486 */  lh         $4, 0x0($17)
/* AC8E0 001AC7E0 40180400 */  sll        $3, $4, 1
/* AC8E4 001AC7E4 21186500 */  addu       $3, $3, $5
/* AC8E8 001AC7E8 4C006384 */  lh         $3, 0x4C($3)
/* AC8EC 001AC7EC 11006614 */  bne        $3, $6, .L001AC834
/* AC8F0 001AC7F0 00000000 */   nop
/* AC8F4 001AC7F4 000040A6 */  sh         $0, 0x0($18)
/* AC8F8 001AC7F8 0000A78E */  lw         $7, 0x0($21)
/* AC8FC 001AC7FC 5400E484 */  lh         $4, 0x54($7)
/* AC900 001AC800 64000324 */  addiu      $3, $0, 0x64
/* AC904 001AC804 03008310 */  beq        $4, $3, .L001AC814
/* AC908 001AC808 00000000 */   nop
/* AC90C 001AC80C B6000010 */  b          .L001ACAE8
/* AC910 001AC810 00000000 */   nop
.L001AC814:
/* AC914 001AC814 1001A427 */  addiu      $4, $sp, 0x110
/* AC918 001AC818 4800E58C */  lw         $5, 0x48($7)
/* AC91C 001AC81C 5C00E68C */  lw         $6, 0x5C($7)
/* AC920 001AC820 5800ECC4 */  lwc1       $f12, 0x58($7)
/* AC924 001AC824 5056070C */  jal        SetBombEffect__FPfiif
/* AC928 001AC828 00000000 */   nop
/* AC92C 001AC82C AE000010 */  b          .L001ACAE8
/* AC930 001AC830 00000000 */   nop
.L001AC834:
/* AC934 001AC834 8A008610 */  beq        $4, $6, .L001ACA60
/* AC938 001AC838 00000000 */   nop
/* AC93C 001AC83C 00190300 */  sll        $3, $3, 4
/* AC940 001AC840 F000A28F */  lw         $2, 0xF0($sp)
/* AC944 001AC844 0000428C */  lw         $2, 0x0($2)
/* AC948 001AC848 21104300 */  addu       $2, $2, $3
/* AC94C 001AC84C 000040C4 */  lwc1       $f0, 0x0($2)
/* AC950 001AC850 20008046 */  cvt.s.w    $f0, $f0
/* AC954 001AC854 0000E0E6 */  swc1       $f0, 0x0($23)
/* AC958 001AC858 0000A38E */  lw         $3, 0x0($21)
/* AC95C 001AC85C 00002286 */  lh         $2, 0x0($17)
/* AC960 001AC860 40100200 */  sll        $2, $2, 1
/* AC964 001AC864 21104300 */  addu       $2, $2, $3
/* AC968 001AC868 4C004284 */  lh         $2, 0x4C($2)
/* AC96C 001AC86C 2118D503 */  addu       $3, $fp, $21
/* AC970 001AC870 281E62AC */  sw         $2, 0x1E28($3)
/* AC974 001AC874 06000224 */  addiu      $2, $0, 0x6
/* AC978 001AC878 241E62AC */  sw         $2, 0x1E24($3)
/* AC97C 001AC87C 80BF023C */  lui        $2, (0xBF800000 >> 16)
/* AC980 001AC880 201E62AC */  sw         $2, 0x1E20($3)
/* AC984 001AC884 2110B602 */  addu       $2, $21, $22
/* AC988 001AC888 481F5324 */  addiu      $19, $2, 0x1F48
/* AC98C 001AC88C F87F7326 */  addiu      $19, $19, 0x7FF8
/* AC990 001AC890 28266072 */  paddub     $4, $19, $0
/* AC994 001AC894 282E6072 */  paddub     $5, $19, $0
/* AC998 001AC898 9285040C */  jal        sceVu0Normalize
/* AC99C 001AC89C 00000000 */   nop
/* AC9A0 001AC8A0 0000A38E */  lw         $3, 0x0($21)
/* AC9A4 001AC8A4 00002286 */  lh         $2, 0x0($17)
/* AC9A8 001AC8A8 80100200 */  sll        $2, $2, 2
/* AC9AC 001AC8AC 21104300 */  addu       $2, $2, $3
/* AC9B0 001AC8B0 28266072 */  paddub     $4, $19, $0
/* AC9B4 001AC8B4 282E6072 */  paddub     $5, $19, $0
/* AC9B8 001AC8B8 18004CC4 */  lwc1       $f12, 0x18($2)
/* AC9BC 001AC8BC 4688040C */  jal        sceVu0ScaleVectorXYZ
/* AC9C0 001AC8C0 00000000 */   nop
/* AC9C4 001AC8C4 0000A48E */  lw         $4, 0x0($21)
/* AC9C8 001AC8C8 00002386 */  lh         $3, 0x0($17)
/* AC9CC 001AC8CC 80180300 */  sll        $3, $3, 2
/* AC9D0 001AC8D0 21186400 */  addu       $3, $3, $4
/* AC9D4 001AC8D4 6000648C */  lw         $4, 0x60($3)
/* AC9D8 001AC8D8 FFFF0524 */  addiu      $5, $0, -0x1
/* AC9DC 001AC8DC 60008510 */  beq        $4, $5, .L001ACA60
/* AC9E0 001AC8E0 00000000 */   nop
/* AC9E4 001AC8E4 21181502 */  addu       $3, $16, $21
/* AC9E8 001AC8E8 0100013C */  lui        $at, (0x10000 >> 16)
/* AC9EC 001AC8EC 21086100 */  addu       $at, $3, $at
/* AC9F0 001AC8F0 30A12380 */  lb         $3, -0x5ED0($at)
/* AC9F4 001AC8F4 5A006014 */  bnez       $3, .L001ACA60
/* AC9F8 001AC8F8 00000000 */   nop
/* AC9FC 001AC8FC 28360070 */  paddub     $6, $0, $0
/* ACA00 001AC900 AC69050C */  jal        SndSePlay__Fiii
/* ACA04 001AC904 00000000 */   nop
/* ACA08 001AC908 55000010 */  b          .L001ACA60
/* ACA0C 001AC90C 00000000 */   nop
.L001AC910:
/* ACA10 001AC910 00002486 */  lh         $4, 0x0($17)
/* ACA14 001AC914 01000324 */  addiu      $3, $0, 0x1
/* ACA18 001AC918 51008314 */  bne        $4, $3, .L001ACA60
/* ACA1C 001AC91C 00000000 */   nop
/* ACA20 001AC920 01008324 */  addiu      $3, $4, 0x1
/* ACA24 001AC924 000023A6 */  sh         $3, 0x0($17)
/* ACA28 001AC928 0000A48E */  lw         $4, 0x0($21)
/* ACA2C 001AC92C 00002386 */  lh         $3, 0x0($17)
/* ACA30 001AC930 40180300 */  sll        $3, $3, 1
/* ACA34 001AC934 21186400 */  addu       $3, $3, $4
/* ACA38 001AC938 4C006484 */  lh         $4, 0x4C($3)
/* ACA3C 001AC93C FFFF0324 */  addiu      $3, $0, -0x1
/* ACA40 001AC940 11008314 */  bne        $4, $3, .L001AC988
/* ACA44 001AC944 00000000 */   nop
/* ACA48 001AC948 000040A6 */  sh         $0, 0x0($18)
/* ACA4C 001AC94C 0000A78E */  lw         $7, 0x0($21)
/* ACA50 001AC950 5400E484 */  lh         $4, 0x54($7)
/* ACA54 001AC954 64000324 */  addiu      $3, $0, 0x64
/* ACA58 001AC958 03008310 */  beq        $4, $3, .L001AC968
/* ACA5C 001AC95C 00000000 */   nop
/* ACA60 001AC960 61000010 */  b          .L001ACAE8
/* ACA64 001AC964 00000000 */   nop
.L001AC968:
/* ACA68 001AC968 1001A427 */  addiu      $4, $sp, 0x110
/* ACA6C 001AC96C 4800E58C */  lw         $5, 0x48($7)
/* ACA70 001AC970 5C00E68C */  lw         $6, 0x5C($7)
/* ACA74 001AC974 5800ECC4 */  lwc1       $f12, 0x58($7)
/* ACA78 001AC978 5056070C */  jal        SetBombEffect__FPfiif
/* ACA7C 001AC97C 00000000 */   nop
/* ACA80 001AC980 59000010 */  b          .L001ACAE8
/* ACA84 001AC984 00000000 */   nop
.L001AC988:
/* ACA88 001AC988 35008310 */  beq        $4, $3, .L001ACA60
/* ACA8C 001AC98C 00000000 */   nop
/* ACA90 001AC990 00190400 */  sll        $3, $4, 4
/* ACA94 001AC994 F000A28F */  lw         $2, 0xF0($sp)
/* ACA98 001AC998 0000428C */  lw         $2, 0x0($2)
/* ACA9C 001AC99C 21104300 */  addu       $2, $2, $3
/* ACAA0 001AC9A0 000040C4 */  lwc1       $f0, 0x0($2)
/* ACAA4 001AC9A4 20008046 */  cvt.s.w    $f0, $f0
/* ACAA8 001AC9A8 0000E0E6 */  swc1       $f0, 0x0($23)
/* ACAAC 001AC9AC 0000A38E */  lw         $3, 0x0($21)
/* ACAB0 001AC9B0 00002286 */  lh         $2, 0x0($17)
/* ACAB4 001AC9B4 40100200 */  sll        $2, $2, 1
/* ACAB8 001AC9B8 21104300 */  addu       $2, $2, $3
/* ACABC 001AC9BC 4C004284 */  lh         $2, 0x4C($2)
/* ACAC0 001AC9C0 2118D503 */  addu       $3, $fp, $21
/* ACAC4 001AC9C4 281E62AC */  sw         $2, 0x1E28($3)
/* ACAC8 001AC9C8 06000224 */  addiu      $2, $0, 0x6
/* ACACC 001AC9CC 241E62AC */  sw         $2, 0x1E24($3)
/* ACAD0 001AC9D0 80BF023C */  lui        $2, (0xBF800000 >> 16)
/* ACAD4 001AC9D4 201E62AC */  sw         $2, 0x1E20($3)
/* ACAD8 001AC9D8 00111000 */  sll        $2, $16, 4
/* ACADC 001AC9DC 2110A202 */  addu       $2, $21, $2
/* ACAE0 001AC9E0 481F5324 */  addiu      $19, $2, 0x1F48
/* ACAE4 001AC9E4 F87F7326 */  addiu      $19, $19, 0x7FF8
/* ACAE8 001AC9E8 28266072 */  paddub     $4, $19, $0
/* ACAEC 001AC9EC 282E6072 */  paddub     $5, $19, $0
/* ACAF0 001AC9F0 9285040C */  jal        sceVu0Normalize
/* ACAF4 001AC9F4 00000000 */   nop
/* ACAF8 001AC9F8 0000A38E */  lw         $3, 0x0($21)
/* ACAFC 001AC9FC 00002286 */  lh         $2, 0x0($17)
/* ACB00 001ACA00 80100200 */  sll        $2, $2, 2
/* ACB04 001ACA04 21104300 */  addu       $2, $2, $3
/* ACB08 001ACA08 28266072 */  paddub     $4, $19, $0
/* ACB0C 001ACA0C 282E6072 */  paddub     $5, $19, $0
/* ACB10 001ACA10 18004CC4 */  lwc1       $f12, 0x18($2)
/* ACB14 001ACA14 4688040C */  jal        sceVu0ScaleVectorXYZ
/* ACB18 001ACA18 00000000 */   nop
/* ACB1C 001ACA1C 0000A48E */  lw         $4, 0x0($21)
/* ACB20 001ACA20 00002386 */  lh         $3, 0x0($17)
/* ACB24 001ACA24 80180300 */  sll        $3, $3, 2
/* ACB28 001ACA28 21186400 */  addu       $3, $3, $4
/* ACB2C 001ACA2C 6000648C */  lw         $4, 0x60($3)
/* ACB30 001ACA30 FFFF0524 */  addiu      $5, $0, -0x1
/* ACB34 001ACA34 0A008510 */  beq        $4, $5, .L001ACA60
/* ACB38 001ACA38 00000000 */   nop
/* ACB3C 001ACA3C 21181502 */  addu       $3, $16, $21
/* ACB40 001ACA40 0100013C */  lui        $at, (0x10000 >> 16)
/* ACB44 001ACA44 21086100 */  addu       $at, $3, $at
/* ACB48 001ACA48 30A12380 */  lb         $3, -0x5ED0($at)
/* ACB4C 001ACA4C 04006014 */  bnez       $3, .L001ACA60
/* ACB50 001ACA50 00000000 */   nop
/* ACB54 001ACA54 28360070 */  paddub     $6, $0, $0
/* ACB58 001ACA58 AC69050C */  jal        SndSePlay__Fiii
/* ACB5C 001ACA5C 00000000 */   nop
.L001ACA60:
/* ACB60 001ACA60 00002486 */  lh         $4, 0x0($17)
/* ACB64 001ACA64 02000324 */  addiu      $3, $0, 0x2
/* ACB68 001ACA68 04008310 */  beq        $4, $3, .L001ACA7C
/* ACB6C 001ACA6C 00000000 */   nop
/* ACB70 001ACA70 03000324 */  addiu      $3, $0, 0x3
/* ACB74 001ACA74 1C008314 */  bne        $4, $3, .L001ACAE8
/* ACB78 001ACA78 00000000 */   nop
.L001ACA7C:
/* ACB7C 001ACA7C 0000E1C6 */  lwc1       $f1, 0x0($23)
/* ACB80 001ACA80 803F033C */  lui        $3, (0x3F800000 >> 16)
/* ACB84 001ACA84 00008344 */  mtc1       $3, $f0
/* ACB88 001ACA88 00000000 */  nop
/* ACB8C 001ACA8C 01A00046 */  sub.s      $f0, $f20, $f0
/* ACB90 001ACA90 34080046 */  c.lt.s     $f1, $f0
/* ACB94 001ACA94 00000000 */  nop
/* ACB98 001ACA98 13000145 */  bc1t       .L001ACAE8
/* ACB9C 001ACA9C 00000000 */   nop
/* ACBA0 001ACAA0 34081446 */  c.lt.s     $f1, $f20
/* ACBA4 001ACAA4 00000000 */  nop
/* ACBA8 001ACAA8 0F000045 */  bc1f       .L001ACAE8
/* ACBAC 001ACAAC 00000000 */   nop
/* ACBB0 001ACAB0 000040A6 */  sh         $0, 0x0($18)
/* ACBB4 001ACAB4 0000A78E */  lw         $7, 0x0($21)
/* ACBB8 001ACAB8 5400E484 */  lh         $4, 0x54($7)
/* ACBBC 001ACABC 64000324 */  addiu      $3, $0, 0x64
/* ACBC0 001ACAC0 03008310 */  beq        $4, $3, .L001ACAD0
/* ACBC4 001ACAC4 00000000 */   nop
/* ACBC8 001ACAC8 07000010 */  b          .L001ACAE8
/* ACBCC 001ACACC 00000000 */   nop
.L001ACAD0:
/* ACBD0 001ACAD0 1001A427 */  addiu      $4, $sp, 0x110
/* ACBD4 001ACAD4 4800E58C */  lw         $5, 0x48($7)
/* ACBD8 001ACAD8 5C00E68C */  lw         $6, 0x5C($7)
/* ACBDC 001ACADC 5800ECC4 */  lwc1       $f12, 0x58($7)
/* ACBE0 001ACAE0 5056070C */  jal        SetBombEffect__FPfiif
/* ACBE4 001ACAE4 00000000 */   nop
.L001ACAE8:
/* ACBE8 001ACAE8 01001026 */  addiu      $16, $16, 0x1
.L001ACAEC:
/* ACBEC 001ACAEC 0800032A */  slti       $3, $16, 0x8
/* ACBF0 001ACAF0 B3FD6014 */  bnez       $3, .L001AC1C0
/* ACBF4 001ACAF4 00000000 */   nop
/* ACBF8 001ACAF8 A000BF7B */  lq         $31, 0xA0($sp)
/* ACBFC 001ACAFC 9000BE7B */  lq         $fp, 0x90($sp)
/* ACC00 001ACB00 8000B77B */  lq         $23, 0x80($sp)
/* ACC04 001ACB04 7000B67B */  lq         $22, 0x70($sp)
/* ACC08 001ACB08 6000B57B */  lq         $21, 0x60($sp)
/* ACC0C 001ACB0C 5000B47B */  lq         $20, 0x50($sp)
/* ACC10 001ACB10 4000B37B */  lq         $19, 0x40($sp)
/* ACC14 001ACB14 3000B27B */  lq         $18, 0x30($sp)
/* ACC18 001ACB18 2000B17B */  lq         $17, 0x20($sp)
/* ACC1C 001ACB1C 1000B07B */  lq         $16, 0x10($sp)
/* ACC20 001ACB20 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* ACC24 001ACB24 7001BD27 */  addiu      $sp, $sp, 0x170
/* ACC28 001ACB28 0800E003 */  jr         $31
/* ACC2C 001ACB2C 00000000 */   nop
