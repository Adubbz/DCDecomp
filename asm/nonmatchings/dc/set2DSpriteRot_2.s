.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel set2DSpriteRot__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_iifUc
/* 832D0 001831D0 00FFBD27 */  addiu      $sp, $sp, -0x100
/* 832D4 001831D4 B000BF7F */  sq         $31, 0xB0($sp)
/* 832D8 001831D8 A000BE7F */  sq         $fp, 0xA0($sp)
/* 832DC 001831DC 9000B77F */  sq         $23, 0x90($sp)
/* 832E0 001831E0 8000B67F */  sq         $22, 0x80($sp)
/* 832E4 001831E4 7000B57F */  sq         $21, 0x70($sp)
/* 832E8 001831E8 6000B47F */  sq         $20, 0x60($sp)
/* 832EC 001831EC 5000B37F */  sq         $19, 0x50($sp)
/* 832F0 001831F0 4000B27F */  sq         $18, 0x40($sp)
/* 832F4 001831F4 3000B17F */  sq         $17, 0x30($sp)
/* 832F8 001831F8 2000B07F */  sq         $16, 0x20($sp)
/* 832FC 001831FC 1000B8E7 */  swc1       $f24, 0x10($sp)
/* 83300 00183200 0C00B7E7 */  swc1       $f23, 0xC($sp)
/* 83304 00183204 0800B6E7 */  swc1       $f22, 0x8($sp)
/* 83308 00183208 0400B5E7 */  swc1       $f21, 0x4($sp)
/* 8330C 0018320C 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 83310 00183210 289E8070 */  paddub     $19, $4, $0
/* 83314 00183214 28B6A070 */  paddub     $22, $5, $0
/* 83318 00183218 2896C070 */  paddub     $18, $6, $0
/* 8331C 0018321C 288EE070 */  paddub     $17, $7, $0
/* 83320 00183220 28A60071 */  paddub     $20, $8, $0
/* 83324 00183224 28862071 */  paddub     $16, $9, $0
/* 83328 00183228 06650046 */  mov.s      $f20, $f12
/* 8332C 0018322C 28BE4071 */  paddub     $23, $10, $0
/* 83330 00183230 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 83334 00183234 FC00A2AF */  sw         $2, 0xFC($sp)
/* 83338 00183238 282E0070 */  paddub     $5, $0, $0
/* 8333C 0018323C 2083040C */  jal        sceVif1PkCnt
/* 83340 00183240 00000000 */   nop
/* 83344 00183244 28266072 */  paddub     $4, $19, $0
/* 83348 00183248 282E0070 */  paddub     $5, $0, $0
/* 8334C 0018324C 8E83040C */  jal        sceVif1PkOpenDirectCode
/* 83350 00183250 00000000 */   nop
/* 83354 00183254 C701023C */  lui        $2, %hi(GiftagAD)
/* 83358 00183258 C0524224 */  addiu      $2, $2, %lo(GiftagAD)
/* 8335C 0018325C 28266072 */  paddub     $4, $19, $0
/* 83360 00183260 00004578 */  lq         $5, 0x0($2)
/* 83364 00183264 B083040C */  jal        sceVif1PkOpenGifTag
/* 83368 00183268 00000000 */   nop
/* 8336C 0018326C 28266072 */  paddub     $4, $19, $0
/* 83370 00183270 14000524 */  addiu      $5, $0, 0x14
/* 83374 00183274 41000624 */  addiu      $6, $0, 0x41
/* 83378 00183278 0A84040C */  jal        sceVif1PkAddGsAD
/* 8337C 0018327C 00000000 */   nop
/* 83380 00183280 28266072 */  paddub     $4, $19, $0
/* 83384 00183284 282E0070 */  paddub     $5, $0, $0
/* 83388 00183288 D4010624 */  addiu      $6, $0, 0x1D4
/* 8338C 0018328C 0A84040C */  jal        sceVif1PkAddGsAD
/* 83390 00183290 00000000 */   nop
/* 83394 00183294 E800A327 */  addiu      $3, $sp, 0xE8
/* 83398 00183298 E88B82DF */  ld         $2, -0x7418($gp)
/* 8339C 0018329C 000062FC */  sd         $2, 0x0($3)
/* 833A0 001832A0 E800A493 */  lbu        $4, 0xE8($sp)
/* 833A4 001832A4 01000530 */  andi       $5, $0, 0x1
/* 833A8 001832A8 FEFF0224 */  addiu      $2, $0, -0x2
/* 833AC 001832AC 24208200 */  and        $4, $4, $2
/* 833B0 001832B0 25208500 */  or         $4, $4, $5
/* 833B4 001832B4 E800A4A3 */  sb         $4, 0xE8($sp)
/* 833B8 001832B8 E800A697 */  lhu        $6, 0xE8($sp)
/* 833BC 001832BC FF000430 */  andi       $4, $0, 0xFF
/* 833C0 001832C0 00290400 */  sll        $5, $4, 4
/* 833C4 001832C4 0FF00424 */  addiu      $4, $0, -0xFF1
/* 833C8 001832C8 2420C400 */  and        $4, $6, $4
/* 833CC 001832CC 25208500 */  or         $4, $4, $5
/* 833D0 001832D0 E800A4A7 */  sh         $4, 0xE8($sp)
/* 833D4 001832D4 E800A593 */  lbu        $5, 0xE8($sp)
/* 833D8 001832D8 02000664 */  daddiu     $6, $0, 0x2
/* 833DC 001832DC F1FF0424 */  addiu      $4, $0, -0xF
/* 833E0 001832E0 2420A400 */  and        $4, $5, $4
/* 833E4 001832E4 25208600 */  or         $4, $4, $6
/* 833E8 001832E8 E800A4A3 */  sb         $4, 0xE8($sp)
/* 833EC 001832EC EA00A727 */  addiu      $7, $sp, 0xEA
/* 833F0 001832F0 0000E590 */  lbu        $5, 0x0($7)
/* 833F4 001832F4 01000464 */  daddiu     $4, $0, 0x1
/* 833F8 001832F8 2410A200 */  and        $2, $5, $2
/* 833FC 001832FC 25104400 */  or         $2, $2, $4
/* 83400 00183300 0000E2A0 */  sb         $2, 0x0($7)
/* 83404 00183304 0000E490 */  lbu        $4, 0x0($7)
/* 83408 00183308 F9FF0224 */  addiu      $2, $0, -0x7
/* 8340C 0018330C 24108200 */  and        $2, $4, $2
/* 83410 00183310 25104600 */  or         $2, $2, $6
/* 83414 00183314 0000E2A0 */  sb         $2, 0x0($7)
/* 83418 00183318 28266072 */  paddub     $4, $19, $0
/* 8341C 0018331C 47000524 */  addiu      $5, $0, 0x47
/* 83420 00183320 000066DC */  ld         $6, 0x0($3)
/* 83424 00183324 0A84040C */  jal        sceVif1PkAddGsAD
/* 83428 00183328 00000000 */   nop
/* 8342C 0018332C F000A327 */  addiu      $3, $sp, 0xF0
/* 83430 00183330 F08B82DF */  ld         $2, -0x7410($gp)
/* 83434 00183334 000062FC */  sd         $2, 0x0($3)
/* 83438 00183338 F400A493 */  lbu        $4, 0xF4($sp)
/* 8343C 0018333C 01000364 */  daddiu     $3, $0, 0x1
/* 83440 00183340 FEFF0224 */  addiu      $2, $0, -0x2
/* 83444 00183344 24108200 */  and        $2, $4, $2
/* 83448 00183348 25104300 */  or         $2, $2, $3
/* 8344C 0018334C F400A2A3 */  sb         $2, 0xF4($sp)
/* 83450 00183350 23101400 */  negu       $2, $20
/* 83454 00183354 00110200 */  sll        $2, $2, 4
/* 83458 00183358 00008244 */  mtc1       $2, $f0
/* 8345C 0018335C 00000000 */  nop
/* 83460 00183360 20008046 */  cvt.s.w    $f0, $f0
/* 83464 00183364 C800A227 */  addiu      $2, $sp, 0xC8
/* 83468 00183368 000040E4 */  swc1       $f0, 0x0($2)
/* 8346C 0018336C C000A0E7 */  swc1       $f0, 0xC0($sp)
/* 83470 00183370 0800428E */  lw         $2, 0x8($18)
/* 83474 00183374 23105400 */  subu       $2, $2, $20
/* 83478 00183378 00110200 */  sll        $2, $2, 4
/* 8347C 0018337C FFFF4224 */  addiu      $2, $2, -0x1
/* 83480 00183380 00008244 */  mtc1       $2, $f0
/* 83484 00183384 00000000 */  nop
/* 83488 00183388 20008046 */  cvt.s.w    $f0, $f0
/* 8348C 0018338C CC00A227 */  addiu      $2, $sp, 0xCC
/* 83490 00183390 000040E4 */  swc1       $f0, 0x0($2)
/* 83494 00183394 C400A227 */  addiu      $2, $sp, 0xC4
/* 83498 00183398 000040E4 */  swc1       $f0, 0x0($2)
/* 8349C 0018339C 23101000 */  negu       $2, $16
/* 834A0 001833A0 00110200 */  sll        $2, $2, 4
/* 834A4 001833A4 00008244 */  mtc1       $2, $f0
/* 834A8 001833A8 00000000 */  nop
/* 834AC 001833AC 20008046 */  cvt.s.w    $f0, $f0
/* 834B0 001833B0 D400A227 */  addiu      $2, $sp, 0xD4
/* 834B4 001833B4 000040E4 */  swc1       $f0, 0x0($2)
/* 834B8 001833B8 D000A0E7 */  swc1       $f0, 0xD0($sp)
/* 834BC 001833BC 0C00428E */  lw         $2, 0xC($18)
/* 834C0 001833C0 23105000 */  subu       $2, $2, $16
/* 834C4 001833C4 00110200 */  sll        $2, $2, 4
/* 834C8 001833C8 FFFF4224 */  addiu      $2, $2, -0x1
/* 834CC 001833CC 00008244 */  mtc1       $2, $f0
/* 834D0 001833D0 00000000 */  nop
/* 834D4 001833D4 20008046 */  cvt.s.w    $f0, $f0
/* 834D8 001833D8 DC00BE27 */  addiu      $fp, $sp, 0xDC
/* 834DC 001833DC 0000C0E7 */  swc1       $f0, 0x0($fp)
/* 834E0 001833E0 D800A227 */  addiu      $2, $sp, 0xD8
/* 834E4 001833E4 000040E4 */  swc1       $f0, 0x0($2)
/* 834E8 001833E8 28AE0070 */  paddub     $21, $0, $0
/* 834EC 001833EC 34000010 */  b          .L001834C0
/* 834F0 001833F0 00000000 */   nop
.L001833F4:
/* 834F4 001833F4 80A01500 */  sll        $20, $21, 2
/* 834F8 001833F8 06A30046 */  mov.s      $f12, $f20
/* 834FC 001833FC AC75040C */  jal        cosf
/* 83500 00183400 00000000 */   nop
/* 83504 00183404 21109D02 */  addu       $2, $20, $sp
/* 83508 00183408 D0005024 */  addiu      $16, $2, 0xD0
/* 8350C 0018340C 000017C6 */  lwc1       $f23, 0x0($16)
/* 83510 00183410 42BD0046 */  mul.s      $f21, $f23, $f0
/* 83514 00183414 06A30046 */  mov.s      $f12, $f20
/* 83518 00183418 2876040C */  jal        sinf
/* 8351C 0018341C 00000000 */   nop
/* 83520 00183420 21109D02 */  addu       $2, $20, $sp
/* 83524 00183424 C0005424 */  addiu      $20, $2, 0xC0
/* 83528 00183428 000098C6 */  lwc1       $f24, 0x0($20)
/* 8352C 0018342C 02C00046 */  mul.s      $f0, $f24, $f0
/* 83530 00183430 80AD0046 */  add.s      $f22, $f21, $f0
/* 83534 00183434 06A30046 */  mov.s      $f12, $f20
/* 83538 00183438 AC75040C */  jal        cosf
/* 8353C 0018343C 00000000 */   nop
/* 83540 00183440 42C50046 */  mul.s      $f21, $f24, $f0
/* 83544 00183444 06A30046 */  mov.s      $f12, $f20
/* 83548 00183448 2876040C */  jal        sinf
/* 8354C 0018344C 00000000 */   nop
/* 83550 00183450 02B80046 */  mul.s      $f0, $f23, $f0
/* 83554 00183454 41AD0046 */  sub.s      $f21, $f21, $f0
/* 83558 00183458 06B30046 */  mov.s      $f12, $f22
/* 8355C 0018345C 2C44040C */  jal        fptosi
/* 83560 00183460 00000000 */   nop
/* 83564 00183464 0000438E */  lw         $3, 0x0($18)
/* 83568 00183468 00190300 */  sll        $3, $3, 4
/* 8356C 0018346C 21104300 */  addu       $2, $2, $3
/* 83570 00183470 006C4224 */  addiu      $2, $2, 0x6C00
/* 83574 00183474 00008244 */  mtc1       $2, $f0
/* 83578 00183478 00000000 */  nop
/* 8357C 0018347C 20008046 */  cvt.s.w    $f0, $f0
/* 83580 00183480 000080E6 */  swc1       $f0, 0x0($20)
/* 83584 00183484 0400428E */  lw         $2, 0x4($18)
/* 83588 00183488 C0A00200 */  sll        $20, $2, 3
/* 8358C 0018348C 003F023C */  lui        $2, (0x3F000000 >> 16)
/* 83590 00183490 00008244 */  mtc1       $2, $f0
/* 83594 00183494 00000000 */  nop
/* 83598 00183498 02031546 */  mul.s      $f12, $f0, $f21
/* 8359C 0018349C 2C44040C */  jal        fptosi
/* 835A0 001834A0 00000000 */   nop
/* 835A4 001834A4 21105400 */  addu       $2, $2, $20
/* 835A8 001834A8 00794224 */  addiu      $2, $2, 0x7900
/* 835AC 001834AC 00008244 */  mtc1       $2, $f0
/* 835B0 001834B0 00000000 */  nop
/* 835B4 001834B4 20008046 */  cvt.s.w    $f0, $f0
/* 835B8 001834B8 000000E6 */  swc1       $f0, 0x0($16)
/* 835BC 001834BC 0100B526 */  addiu      $21, $21, 0x1
.L001834C0:
/* 835C0 001834C0 0400A22A */  slti       $2, $21, 0x4
/* 835C4 001834C4 CBFF4014 */  bnez       $2, .L001833F4
/* 835C8 001834C8 00000000 */   nop
/* 835CC 001834CC F000A227 */  addiu      $2, $sp, 0xF0
/* 835D0 001834D0 28266072 */  paddub     $4, $19, $0
/* 835D4 001834D4 4E000524 */  addiu      $5, $0, 0x4E
/* 835D8 001834D8 000046DC */  ld         $6, 0x0($2)
/* 835DC 001834DC 0A84040C */  jal        sceVif1PkAddGsAD
/* 835E0 001834E0 00000000 */   nop
/* 835E4 001834E4 FF00E232 */  andi       $2, $23, 0xFF
/* 835E8 001834E8 381E0200 */  dsll       $3, $2, 24
/* 835EC 001834EC 8000023C */  lui        $2, (0x808080 >> 16)
/* 835F0 001834F0 80804234 */  ori        $2, $2, (0x808080 & 0xFFFF)
/* 835F4 001834F4 25186200 */  or         $3, $3, $2
/* 835F8 001834F8 FC00A227 */  addiu      $2, $sp, 0xFC
/* 835FC 001834FC 0000429C */  lwu        $2, 0x0($2)
/* 83600 00183500 3C100200 */  dsll32     $2, $2, 0
/* 83604 00183504 25306200 */  or         $6, $3, $2
/* 83608 00183508 28266072 */  paddub     $4, $19, $0
/* 8360C 0018350C 01000524 */  addiu      $5, $0, 0x1
/* 83610 00183510 0A84040C */  jal        sceVif1PkAddGsAD
/* 83614 00183514 00000000 */   nop
/* 83618 00183518 28266072 */  paddub     $4, $19, $0
/* 8361C 0018351C 06000524 */  addiu      $5, $0, 0x6
/* 83620 00183520 2800C6DE */  ld         $6, 0x28($22)
/* 83624 00183524 0A84040C */  jal        sceVif1PkAddGsAD
/* 83628 00183528 00000000 */   nop
/* 8362C 0018352C 0400228E */  lw         $2, 0x4($17)
/* 83630 00183530 00110200 */  sll        $2, $2, 4
/* 83634 00183534 381C0200 */  dsll       $3, $2, 16
/* 83638 00183538 0000228E */  lw         $2, 0x0($17)
/* 8363C 0018353C 00110200 */  sll        $2, $2, 4
/* 83640 00183540 25304300 */  or         $6, $2, $3
/* 83644 00183544 28266072 */  paddub     $4, $19, $0
/* 83648 00183548 03000524 */  addiu      $5, $0, 0x3
/* 8364C 0018354C 0A84040C */  jal        sceVif1PkAddGsAD
/* 83650 00183550 00000000 */   nop
/* 83654 00183554 C000ACC7 */  lwc1       $f12, 0xC0($sp)
/* 83658 00183558 9039040C */  jal        __fixunssfdi
/* 8365C 0018355C 00000000 */   nop
/* 83660 00183560 28864070 */  paddub     $16, $2, $0
/* 83664 00183564 D000ACC7 */  lwc1       $f12, 0xD0($sp)
/* 83668 00183568 9039040C */  jal        __fixunssfdi
/* 8366C 0018356C 00000000 */   nop
/* 83670 00183570 38140200 */  dsll       $2, $2, 16
/* 83674 00183574 25300202 */  or         $6, $16, $2
/* 83678 00183578 28266072 */  paddub     $4, $19, $0
/* 8367C 0018357C 04000524 */  addiu      $5, $0, 0x4
/* 83680 00183580 0A84040C */  jal        sceVif1PkAddGsAD
/* 83684 00183584 00000000 */   nop
/* 83688 00183588 0400228E */  lw         $2, 0x4($17)
/* 8368C 0018358C 00110200 */  sll        $2, $2, 4
/* 83690 00183590 38240200 */  dsll       $4, $2, 16
/* 83694 00183594 0000238E */  lw         $3, 0x0($17)
/* 83698 00183598 0800428E */  lw         $2, 0x8($18)
/* 8369C 0018359C 21106200 */  addu       $2, $3, $2
/* 836A0 001835A0 00110200 */  sll        $2, $2, 4
/* 836A4 001835A4 25308200 */  or         $6, $4, $2
/* 836A8 001835A8 28266072 */  paddub     $4, $19, $0
/* 836AC 001835AC 03000524 */  addiu      $5, $0, 0x3
/* 836B0 001835B0 0A84040C */  jal        sceVif1PkAddGsAD
/* 836B4 001835B4 00000000 */   nop
/* 836B8 001835B8 C400A227 */  addiu      $2, $sp, 0xC4
/* 836BC 001835BC 00004CC4 */  lwc1       $f12, 0x0($2)
/* 836C0 001835C0 9039040C */  jal        __fixunssfdi
/* 836C4 001835C4 00000000 */   nop
/* 836C8 001835C8 28864070 */  paddub     $16, $2, $0
/* 836CC 001835CC D400A227 */  addiu      $2, $sp, 0xD4
/* 836D0 001835D0 00004CC4 */  lwc1       $f12, 0x0($2)
/* 836D4 001835D4 9039040C */  jal        __fixunssfdi
/* 836D8 001835D8 00000000 */   nop
/* 836DC 001835DC 38140200 */  dsll       $2, $2, 16
/* 836E0 001835E0 25300202 */  or         $6, $16, $2
/* 836E4 001835E4 28266072 */  paddub     $4, $19, $0
/* 836E8 001835E8 04000524 */  addiu      $5, $0, 0x4
/* 836EC 001835EC 0A84040C */  jal        sceVif1PkAddGsAD
/* 836F0 001835F0 00000000 */   nop
/* 836F4 001835F4 0400238E */  lw         $3, 0x4($17)
/* 836F8 001835F8 0C00228E */  lw         $2, 0xC($17)
/* 836FC 001835FC 21106200 */  addu       $2, $3, $2
/* 83700 00183600 00110200 */  sll        $2, $2, 4
/* 83704 00183604 381C0200 */  dsll       $3, $2, 16
/* 83708 00183608 0000228E */  lw         $2, 0x0($17)
/* 8370C 0018360C 00110200 */  sll        $2, $2, 4
/* 83710 00183610 25304300 */  or         $6, $2, $3
/* 83714 00183614 28266072 */  paddub     $4, $19, $0
/* 83718 00183618 03000524 */  addiu      $5, $0, 0x3
/* 8371C 0018361C 0A84040C */  jal        sceVif1PkAddGsAD
/* 83720 00183620 00000000 */   nop
/* 83724 00183624 C800A227 */  addiu      $2, $sp, 0xC8
/* 83728 00183628 00004CC4 */  lwc1       $f12, 0x0($2)
/* 8372C 0018362C 9039040C */  jal        __fixunssfdi
/* 83730 00183630 00000000 */   nop
/* 83734 00183634 28864070 */  paddub     $16, $2, $0
/* 83738 00183638 D800A227 */  addiu      $2, $sp, 0xD8
/* 8373C 0018363C 00004CC4 */  lwc1       $f12, 0x0($2)
/* 83740 00183640 9039040C */  jal        __fixunssfdi
/* 83744 00183644 00000000 */   nop
/* 83748 00183648 38140200 */  dsll       $2, $2, 16
/* 8374C 0018364C 25300202 */  or         $6, $16, $2
/* 83750 00183650 28266072 */  paddub     $4, $19, $0
/* 83754 00183654 04000524 */  addiu      $5, $0, 0x4
/* 83758 00183658 0A84040C */  jal        sceVif1PkAddGsAD
/* 8375C 0018365C 00000000 */   nop
/* 83760 00183660 0400238E */  lw         $3, 0x4($17)
/* 83764 00183664 0C00228E */  lw         $2, 0xC($17)
/* 83768 00183668 21106200 */  addu       $2, $3, $2
/* 8376C 0018366C 00110200 */  sll        $2, $2, 4
/* 83770 00183670 38240200 */  dsll       $4, $2, 16
/* 83774 00183674 0000238E */  lw         $3, 0x0($17)
/* 83778 00183678 0800228E */  lw         $2, 0x8($17)
/* 8377C 0018367C 21106200 */  addu       $2, $3, $2
/* 83780 00183680 00110200 */  sll        $2, $2, 4
/* 83784 00183684 25304400 */  or         $6, $2, $4
/* 83788 00183688 28266072 */  paddub     $4, $19, $0
/* 8378C 0018368C 03000524 */  addiu      $5, $0, 0x3
/* 83790 00183690 0A84040C */  jal        sceVif1PkAddGsAD
/* 83794 00183694 00000000 */   nop
/* 83798 00183698 CC00A227 */  addiu      $2, $sp, 0xCC
/* 8379C 0018369C 00004CC4 */  lwc1       $f12, 0x0($2)
/* 837A0 001836A0 9039040C */  jal        __fixunssfdi
/* 837A4 001836A4 00000000 */   nop
/* 837A8 001836A8 28864070 */  paddub     $16, $2, $0
/* 837AC 001836AC 0000CCC7 */  lwc1       $f12, 0x0($fp)
/* 837B0 001836B0 9039040C */  jal        __fixunssfdi
/* 837B4 001836B4 00000000 */   nop
/* 837B8 001836B8 38140200 */  dsll       $2, $2, 16
/* 837BC 001836BC 25300202 */  or         $6, $16, $2
/* 837C0 001836C0 28266072 */  paddub     $4, $19, $0
/* 837C4 001836C4 04000524 */  addiu      $5, $0, 0x4
/* 837C8 001836C8 0A84040C */  jal        sceVif1PkAddGsAD
/* 837CC 001836CC 00000000 */   nop
/* 837D0 001836D0 E88B8227 */  addiu      $2, $gp, -0x7418
/* 837D4 001836D4 28266072 */  paddub     $4, $19, $0
/* 837D8 001836D8 47000524 */  addiu      $5, $0, 0x47
/* 837DC 001836DC 000046DC */  ld         $6, 0x0($2)
/* 837E0 001836E0 0A84040C */  jal        sceVif1PkAddGsAD
/* 837E4 001836E4 00000000 */   nop
/* 837E8 001836E8 F08B8227 */  addiu      $2, $gp, -0x7410
/* 837EC 001836EC 28266072 */  paddub     $4, $19, $0
/* 837F0 001836F0 4E000524 */  addiu      $5, $0, 0x4E
/* 837F4 001836F4 000046DC */  ld         $6, 0x0($2)
/* 837F8 001836F8 0A84040C */  jal        sceVif1PkAddGsAD
/* 837FC 001836FC 00000000 */   nop
/* 83800 00183700 28266072 */  paddub     $4, $19, $0
/* 83804 00183704 B683040C */  jal        sceVif1PkCloseGifTag
/* 83808 00183708 00000000 */   nop
/* 8380C 0018370C 28266072 */  paddub     $4, $19, $0
/* 83810 00183710 A483040C */  jal        sceVif1PkCloseDirectCode
/* 83814 00183714 00000000 */   nop
/* 83818 00183718 B000BF7B */  lq         $31, 0xB0($sp)
/* 8381C 0018371C A000BE7B */  lq         $fp, 0xA0($sp)
/* 83820 00183720 9000B77B */  lq         $23, 0x90($sp)
/* 83824 00183724 8000B67B */  lq         $22, 0x80($sp)
/* 83828 00183728 7000B57B */  lq         $21, 0x70($sp)
/* 8382C 0018372C 6000B47B */  lq         $20, 0x60($sp)
/* 83830 00183730 5000B37B */  lq         $19, 0x50($sp)
/* 83834 00183734 4000B27B */  lq         $18, 0x40($sp)
/* 83838 00183738 3000B17B */  lq         $17, 0x30($sp)
/* 8383C 0018373C 2000B07B */  lq         $16, 0x20($sp)
/* 83840 00183740 1000B8C7 */  lwc1       $f24, 0x10($sp)
/* 83844 00183744 0C00B7C7 */  lwc1       $f23, 0xC($sp)
/* 83848 00183748 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* 8384C 0018374C 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* 83850 00183750 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 83854 00183754 0001BD27 */  addiu      $sp, $sp, 0x100
/* 83858 00183758 0800E003 */  jr         $31
/* 8385C 0018375C 00000000 */   nop
