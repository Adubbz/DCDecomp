.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 263B0 001262B0 00FFBD27 */  addiu      $sp, $sp, -0x100
/* 263B4 001262B4 9000BF7F */  sq         $31, 0x90($sp)
/* 263B8 001262B8 8000BE7F */  sq         $fp, 0x80($sp)
/* 263BC 001262BC 7000B77F */  sq         $23, 0x70($sp)
/* 263C0 001262C0 6000B67F */  sq         $22, 0x60($sp)
/* 263C4 001262C4 5000B57F */  sq         $21, 0x50($sp)
/* 263C8 001262C8 4000B47F */  sq         $20, 0x40($sp)
/* 263CC 001262CC 3000B37F */  sq         $19, 0x30($sp)
/* 263D0 001262D0 2000B27F */  sq         $18, 0x20($sp)
/* 263D4 001262D4 1000B17F */  sq         $17, 0x10($sp)
/* 263D8 001262D8 0000B07F */  sq         $16, 0x0($sp)
/* 263DC 001262DC 28AE8070 */  paddub     $21, $4, $0
/* 263E0 001262E0 28F6A070 */  paddub     $fp, $5, $0
/* 263E4 001262E4 28A6C070 */  paddub     $20, $6, $0
/* 263E8 001262E8 AC00A7AF */  sw         $7, 0xAC($sp)
/* 263EC 001262EC A800A8AF */  sw         $8, 0xA8($sp)
/* 263F0 001262F0 0400A016 */  bnez       $21, .L00126304
/* 263F4 001262F4 00000000 */   nop
/* 263F8 001262F8 28160070 */  paddub     $2, $0, $0
/* 263FC 001262FC 0E010010 */  b          .L00126738
/* 26400 00126300 00000000 */   nop
.L00126304:
/* 26404 00126304 0F00A232 */  andi       $2, $21, 0xF
/* 26408 00126308 0400A106 */  bgez       $21, .L0012631C
/* 2640C 0012630C 00000000 */   nop
/* 26410 00126310 02004010 */  beqz       $2, .L0012631C
/* 26414 00126314 00000000 */   nop
/* 26418 00126318 F0FF4224 */  addiu      $2, $2, -0x10
.L0012631C:
/* 2641C 0012631C 06004010 */  beqz       $2, .L00126338
/* 26420 00126320 00000000 */   nop
/* 26424 00126324 2A00023C */  lui        $2, %hi(_394)
/* 26428 00126328 908D4424 */  addiu      $4, $2, %lo(_394)
/* 2642C 0012632C 282EA072 */  paddub     $5, $21, $0
/* 26430 00126330 A611040C */  jal        printf
/* 26434 00126334 00000000 */   nop
.L00126338:
/* 26438 00126338 28260070 */  paddub     $4, $0, $0
/* 2643C 0012633C 6851040C */  jal        FlushCache
/* 26440 00126340 00000000 */   nop
/* 26444 00126344 AC8B8283 */  lb         $2, -0x7454($gp)
/* 26448 00126348 04004014 */  bnez       $2, .L0012635C
/* 2644C 0012634C 00000000 */   nop
/* 26450 00126350 A88B80AF */  sw         $0, -0x7458($gp)
/* 26454 00126354 01000224 */  addiu      $2, $0, 0x1
/* 26458 00126358 AC8B82A3 */  sb         $2, -0x7454($gp)
.L0012635C:
/* 2645C 0012635C 288EA072 */  paddub     $17, $21, $0
/* 26460 00126360 1000B526 */  addiu      $21, $21, 0x10
/* 26464 00126364 A08B80AF */  sw         $0, -0x7460($gp)
/* 26468 00126368 0800228E */  lw         $2, 0x8($17)
/* 2646C 0012636C A48B82AF */  sw         $2, -0x745C($gp)
/* 26470 00126370 0800238E */  lw         $3, 0x8($17)
/* 26474 00126374 80100300 */  sll        $2, $3, 2
/* 26478 00126378 21104300 */  addu       $2, $2, $3
/* 2647C 0012637C C0100200 */  sll        $2, $2, 3
/* 26480 00126380 23104300 */  subu       $2, $2, $3
/* 26484 00126384 00110200 */  sll        $2, $2, 4
/* 26488 00126388 02290200 */  srl        $5, $2, 4
/* 2648C 0012638C 2826C073 */  paddub     $4, $fp, $0
/* 26490 00126390 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* 26494 00126394 00000000 */   nop
/* 26498 00126398 0800309E */  lwu        $16, 0x8($17)
/* 2649C 0012639C B8181000 */  dsll       $3, $16, 2
/* 264A0 001263A0 2D187000 */  daddu      $3, $3, $16
/* 264A4 001263A4 F8180300 */  dsll       $3, $3, 3
/* 264A8 001263A8 2F187000 */  dsubu      $3, $3, $16
/* 264AC 001263AC 38190300 */  dsll       $3, $3, 4
/* 264B0 001263B0 10006364 */  daddiu     $3, $3, 0x10
/* 264B4 001263B4 3C200300 */  dsll32     $4, $3, 0
/* 264B8 001263B8 3F200400 */  dsra32     $4, $4, 0
/* 264BC 001263BC 282E4070 */  paddub     $5, $2, $0
/* 264C0 001263C0 E49E040C */  jal        __nwa__FUiP1
/* 264C4 001263C4 00000000 */   nop
/* 264C8 001263C8 28264070 */  paddub     $4, $2, $0
/* 264CC 001263CC 1300023C */  lui        $2, %hi(__ct__9CFrameVu1Fv)
/* 264D0 001263D0 60A24524 */  addiu      $5, $2, %lo(__ct__9CFrameVu1Fv)
/* 264D4 001263D4 28360070 */  paddub     $6, $0, $0
/* 264D8 001263D8 70020724 */  addiu      $7, $0, 0x270
/* 264DC 001263DC 28460072 */  paddub     $8, $16, $0
/* 264E0 001263E0 0089040C */  jal        __construct_new_array
/* 264E4 001263E4 00000000 */   nop
/* 264E8 001263E8 28BE4070 */  paddub     $23, $2, $0
/* 264EC 001263EC 28860070 */  paddub     $16, $0, $0
/* 264F0 001263F0 CA000010 */  b          .L0012671C
/* 264F4 001263F4 00000000 */   nop
.L001263F8:
/* 264F8 001263F8 2896A072 */  paddub     $18, $21, $0
/* 264FC 001263FC 7000B526 */  addiu      $21, $21, 0x70
/* 26500 00126400 08004426 */  addiu      $4, $18, 0x8
/* 26504 00126404 2A00023C */  lui        $2, %hi(_395)
/* 26508 00126408 A88D4524 */  addiu      $5, $2, %lo(_395)
/* 2650C 0012640C 05000624 */  addiu      $6, $0, 0x5
/* 26510 00126410 C60C040C */  jal        memcmp
/* 26514 00126414 00000000 */   nop
/* 26518 00126418 BF004010 */  beqz       $2, .L00126718
/* 2651C 0012641C 00000000 */   nop
/* 26520 00126420 80101000 */  sll        $2, $16, 2
/* 26524 00126424 21105000 */  addu       $2, $2, $16
/* 26528 00126428 C0100200 */  sll        $2, $2, 3
/* 2652C 0012642C 23105000 */  subu       $2, $2, $16
/* 26530 00126430 00110200 */  sll        $2, $2, 4
/* 26534 00126434 2198E202 */  addu       $19, $23, $2
/* 26538 00126438 28266072 */  paddub     $4, $19, $0
/* 2653C 0012643C 5002798E */  lw         $25, 0x250($19)
/* 26540 00126440 1000398F */  lw         $25, 0x10($25)
/* 26544 00126444 09F82003 */  jalr       $25
/* 26548 00126448 00000000 */   nop
/* 2654C 0012644C 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 26550 00126450 00688244 */  mtc1       $2, $f13
/* 26554 00126454 00000000 */  nop
/* 26558 00126458 866B0046 */  mov.s      $f14, $f13
/* 2655C 0012645C 066B0046 */  mov.s      $f12, $f13
/* 26560 00126460 28266072 */  paddub     $4, $19, $0
/* 26564 00126464 D49F040C */  jal        SetScale__6CFrameFfff
/* 26568 00126468 00000000 */   nop
/* 2656C 0012646C 00688044 */  mtc1       $0, $f13
/* 26570 00126470 00000000 */  nop
/* 26574 00126474 066B0046 */  mov.s      $f12, $f13
/* 26578 00126478 866B0046 */  mov.s      $f14, $f13
/* 2657C 0012647C 28266072 */  paddub     $4, $19, $0
/* 26580 00126480 70A3040C */  jal        SetRotation__6CFrameFfff
/* 26584 00126484 00000000 */   nop
/* 26588 00126488 00608044 */  mtc1       $0, $f12
/* 2658C 0012648C 00000000 */  nop
/* 26590 00126490 46630046 */  mov.s      $f13, $f12
/* 26594 00126494 86630046 */  mov.s      $f14, $f12
/* 26598 00126498 28266072 */  paddub     $4, $19, $0
/* 2659C 0012649C A09F040C */  jal        SetPosition__6CFrameFfff
/* 265A0 001264A0 00000000 */   nop
/* 265A4 001264A4 281E0070 */  paddub     $3, $0, $0
/* 265A8 001264A8 11000010 */  b          .L001264F0
/* 265AC 001264AC 00000000 */   nop
.L001264B0:
/* 265B0 001264B0 28260070 */  paddub     $4, $0, $0
/* 265B4 001264B4 0A000010 */  b          .L001264E0
/* 265B8 001264B8 00000000 */   nop
.L001264BC:
/* 265BC 001264BC 80280300 */  sll        $5, $3, 2
/* 265C0 001264C0 00310400 */  sll        $6, $4, 4
/* 265C4 001264C4 2110D200 */  addu       $2, $6, $18
/* 265C8 001264C8 2110A200 */  addu       $2, $5, $2
/* 265CC 001264CC 300040C4 */  lwc1       $f0, 0x30($2)
/* 265D0 001264D0 2110DD00 */  addu       $2, $6, $sp
/* 265D4 001264D4 2110A200 */  addu       $2, $5, $2
/* 265D8 001264D8 B00040E4 */  swc1       $f0, 0xB0($2)
/* 265DC 001264DC 01008424 */  addiu      $4, $4, 0x1
.L001264E0:
/* 265E0 001264E0 04008228 */  slti       $2, $4, 0x4
/* 265E4 001264E4 F5FF4014 */  bnez       $2, .L001264BC
/* 265E8 001264E8 00000000 */   nop
/* 265EC 001264EC 01006324 */  addiu      $3, $3, 0x1
.L001264F0:
/* 265F0 001264F0 04006228 */  slti       $2, $3, 0x4
/* 265F4 001264F4 EEFF4014 */  bnez       $2, .L001264B0
/* 265F8 001264F8 00000000 */   nop
/* 265FC 001264FC 18016426 */  addiu      $4, $19, 0x118
/* 26600 00126500 08004526 */  addiu      $5, $18, 0x8
/* 26604 00126504 5A15040C */  jal        strcpy
/* 26608 00126508 00000000 */   nop
/* 2660C 0012650C 28266072 */  paddub     $4, $19, $0
/* 26610 00126510 B000A527 */  addiu      $5, $sp, 0xB0
/* 26614 00126514 58A1040C */  jal        SetTransMatrix__6CFrameFPA4_f
/* 26618 00126518 00000000 */   nop
/* 2661C 0012651C 28266072 */  paddub     $4, $19, $0
/* 26620 00126520 282E0070 */  paddub     $5, $0, $0
/* 26624 00126524 BC97040C */  jal        SetFrameAttr__FP6CFramei
/* 26628 00126528 00000000 */   nop
/* 2662C 0012652C 2C00438E */  lw         $3, 0x2C($18)
/* 26630 00126530 07006104 */  bgez       $3, .L00126550
/* 26634 00126534 00000000 */   nop
/* 26638 00126538 28266072 */  paddub     $4, $19, $0
/* 2663C 0012653C 282E0070 */  paddub     $5, $0, $0
/* 26640 00126540 20A0040C */  jal        SetParent__6CFrameFP6CFrame
/* 26644 00126544 00000000 */   nop
/* 26648 00126548 0A000010 */  b          .L00126574
/* 2664C 0012654C 00000000 */   nop
.L00126550:
/* 26650 00126550 80100300 */  sll        $2, $3, 2
/* 26654 00126554 21104300 */  addu       $2, $2, $3
/* 26658 00126558 C0100200 */  sll        $2, $2, 3
/* 2665C 0012655C 23104300 */  subu       $2, $2, $3
/* 26660 00126560 00110200 */  sll        $2, $2, 4
/* 26664 00126564 2128E202 */  addu       $5, $23, $2
/* 26668 00126568 28266072 */  paddub     $4, $19, $0
/* 2666C 0012656C 20A0040C */  jal        SetParent__6CFrameFP6CFrame
/* 26670 00126570 00000000 */   nop
.L00126574:
/* 26674 00126574 2800428E */  lw         $2, 0x28($18)
/* 26678 00126578 67004010 */  beqz       $2, .L00126718
/* 2667C 0012657C 00000000 */   nop
/* 26680 00126580 21182202 */  addu       $3, $17, $2
/* 26684 00126584 1000628C */  lw         $2, 0x10($3)
/* 26688 00126588 21286200 */  addu       $5, $3, $2
/* 2668C 0012658C 0C00668C */  lw         $6, 0xC($3)
/* 26690 00126590 10006426 */  addiu      $4, $19, 0x10
/* 26694 00126594 389D040C */  jal        CreateBBox__FP8CBox3_f_PA4_fi
/* 26698 00126598 00000000 */   nop
/* 2669C 0012659C 20006226 */  addiu      $2, $19, 0x20
/* 266A0 001265A0 F800A2AF */  sw         $2, 0xF8($sp)
/* 266A4 001265A4 10006226 */  addiu      $2, $19, 0x10
/* 266A8 001265A8 FC00A2AF */  sw         $2, 0xFC($sp)
/* 266AC 001265AC 281E0070 */  paddub     $3, $0, $0
/* 266B0 001265B0 1B000010 */  b          .L00126620
/* 266B4 001265B4 00000000 */   nop
.L001265B8:
/* 266B8 001265B8 803F043C */  lui        $4, (0x3F800000 >> 16)
/* 266BC 001265BC 00110300 */  sll        $2, $3, 4
/* 266C0 001265C0 21105300 */  addu       $2, $2, $19
/* 266C4 001265C4 3C0044AC */  sw         $4, 0x3C($2)
/* 266C8 001265C8 01006430 */  andi       $4, $3, 0x1
/* 266CC 001265CC 2B200400 */  sltu       $4, $0, $4
/* 266D0 001265D0 80200400 */  sll        $4, $4, 2
/* 266D4 001265D4 21209D00 */  addu       $4, $4, $sp
/* 266D8 001265D8 F800848C */  lw         $4, 0xF8($4)
/* 266DC 001265DC 000080C4 */  lwc1       $f0, 0x0($4)
/* 266E0 001265E0 300040E4 */  swc1       $f0, 0x30($2)
/* 266E4 001265E4 02006430 */  andi       $4, $3, 0x2
/* 266E8 001265E8 2B200400 */  sltu       $4, $0, $4
/* 266EC 001265EC 80200400 */  sll        $4, $4, 2
/* 266F0 001265F0 21209D00 */  addu       $4, $4, $sp
/* 266F4 001265F4 F800848C */  lw         $4, 0xF8($4)
/* 266F8 001265F8 040080C4 */  lwc1       $f0, 0x4($4)
/* 266FC 001265FC 340040E4 */  swc1       $f0, 0x34($2)
/* 26700 00126600 04006430 */  andi       $4, $3, 0x4
/* 26704 00126604 2B200400 */  sltu       $4, $0, $4
/* 26708 00126608 80200400 */  sll        $4, $4, 2
/* 2670C 0012660C 21209D00 */  addu       $4, $4, $sp
/* 26710 00126610 F800848C */  lw         $4, 0xF8($4)
/* 26714 00126614 080080C4 */  lwc1       $f0, 0x8($4)
/* 26718 00126618 380040E4 */  swc1       $f0, 0x38($2)
/* 2671C 0012661C 01006324 */  addiu      $3, $3, 0x1
.L00126620:
/* 26720 00126620 08006228 */  slti       $2, $3, 0x8
/* 26724 00126624 E4FF4014 */  bnez       $2, .L001265B8
/* 26728 00126628 00000000 */   nop
/* 2672C 0012662C A400B4AF */  sw         $20, 0xA4($sp)
/* 26730 00126630 AC00B68F */  lw         $22, 0xAC($sp)
/* 26734 00126634 2816C072 */  paddub     $2, $22, $0
/* 26738 00126638 10004010 */  beqz       $2, .L0012667C
/* 2673C 0012663C 00000000 */   nop
/* 26740 00126640 0B000010 */  b          .L00126670
/* 26744 00126644 00000000 */   nop
.L00126648:
/* 26748 00126648 18016426 */  addiu      $4, $19, 0x118
/* 2674C 0012664C B8A1040C */  jal        FrameNameComp__FPcPc
/* 26750 00126650 00000000 */   nop
/* 26754 00126654 05004010 */  beqz       $2, .L0012666C
/* 26758 00126658 00000000 */   nop
/* 2675C 0012665C 02009436 */  ori        $20, $20, 0x2
/* 26760 00126660 04009436 */  ori        $20, $20, 0x4
/* 26764 00126664 05000010 */  b          .L0012667C
/* 26768 00126668 00000000 */   nop
.L0012666C:
/* 2676C 0012666C 0400D626 */  addiu      $22, $22, 0x4
.L00126670:
/* 26770 00126670 0000C58E */  lw         $5, 0x0($22)
/* 26774 00126674 F4FFA014 */  bnez       $5, .L00126648
/* 26778 00126678 00000000 */   nop
.L0012667C:
/* 2677C 0012667C A800B68F */  lw         $22, 0xA8($sp)
/* 26780 00126680 2816C072 */  paddub     $2, $22, $0
/* 26784 00126684 0F004010 */  beqz       $2, .L001266C4
/* 26788 00126688 00000000 */   nop
/* 2678C 0012668C 0A000010 */  b          .L001266B8
/* 26790 00126690 00000000 */   nop
.L00126694:
/* 26794 00126694 18016426 */  addiu      $4, $19, 0x118
/* 26798 00126698 B8A1040C */  jal        FrameNameComp__FPcPc
/* 2679C 0012669C 00000000 */   nop
/* 267A0 001266A0 04004010 */  beqz       $2, .L001266B4
/* 267A4 001266A4 00000000 */   nop
/* 267A8 001266A8 02009436 */  ori        $20, $20, 0x2
/* 267AC 001266AC 05000010 */  b          .L001266C4
/* 267B0 001266B0 00000000 */   nop
.L001266B4:
/* 267B4 001266B4 0400D626 */  addiu      $22, $22, 0x4
.L001266B8:
/* 267B8 001266B8 0000C58E */  lw         $5, 0x0($22)
/* 267BC 001266BC F5FFA014 */  bnez       $5, .L00126694
/* 267C0 001266C0 00000000 */   nop
.L001266C4:
/* 267C4 001266C4 2800428E */  lw         $2, 0x28($18)
/* 267C8 001266C8 21202202 */  addu       $4, $17, $2
/* 267CC 001266CC 282EC073 */  paddub     $5, $fp, $0
/* 267D0 001266D0 28368072 */  paddub     $6, $20, $0
/* 267D4 001266D4 DC99040C */  jal        CreateVisual__FPUiP14CDataAlloc2_1_i
/* 267D8 001266D8 00000000 */   nop
/* 267DC 001266DC 02008332 */  andi       $3, $20, 0x2
/* 267E0 001266E0 07006010 */  beqz       $3, .L00126700
/* 267E4 001266E4 00000000 */   nop
/* 267E8 001266E8 28266072 */  paddub     $4, $19, $0
/* 267EC 001266EC 282E4070 */  paddub     $5, $2, $0
/* 267F0 001266F0 84A8040C */  jal        SetVisual__9CFrameVu1FP10CVisualVu1
/* 267F4 001266F4 00000000 */   nop
/* 267F8 001266F8 05000010 */  b          .L00126710
/* 267FC 001266FC 00000000 */   nop
.L00126700:
/* 26800 00126700 28266072 */  paddub     $4, $19, $0
/* 26804 00126704 282E4070 */  paddub     $5, $2, $0
/* 26808 00126708 84A8040C */  jal        SetVisual__9CFrameVu1FP10CVisualVu1
/* 2680C 0012670C 00000000 */   nop
.L00126710:
/* 26810 00126710 A400B48F */  lw         $20, 0xA4($sp)
/* 26814 00126714 00000000 */  nop
.L00126718:
/* 26818 00126718 01001026 */  addiu      $16, $16, 0x1
.L0012671C:
/* 2681C 0012671C 0800228E */  lw         $2, 0x8($17)
/* 26820 00126720 2B100202 */  sltu       $2, $16, $2
/* 26824 00126724 34FF4014 */  bnez       $2, .L001263F8
/* 26828 00126728 00000000 */   nop
/* 2682C 0012672C 01000224 */  addiu      $2, $0, 0x1
/* 26830 00126730 A88B82AF */  sw         $2, -0x7458($gp)
/* 26834 00126734 2816E072 */  paddub     $2, $23, $0
.L00126738:
/* 26838 00126738 9000BF7B */  lq         $31, 0x90($sp)
/* 2683C 0012673C 8000BE7B */  lq         $fp, 0x80($sp)
/* 26840 00126740 7000B77B */  lq         $23, 0x70($sp)
/* 26844 00126744 6000B67B */  lq         $22, 0x60($sp)
/* 26848 00126748 5000B57B */  lq         $21, 0x50($sp)
/* 2684C 0012674C 4000B47B */  lq         $20, 0x40($sp)
/* 26850 00126750 3000B37B */  lq         $19, 0x30($sp)
/* 26854 00126754 2000B27B */  lq         $18, 0x20($sp)
/* 26858 00126758 1000B17B */  lq         $17, 0x10($sp)
/* 2685C 0012675C 0000B07B */  lq         $16, 0x0($sp)
/* 26860 00126760 0001BD27 */  addiu      $sp, $sp, 0x100
/* 26864 00126764 0800E003 */  jr         $31
/* 26868 00126768 00000000 */   nop
/* 2686C 0012676C 00000000 */  nop
