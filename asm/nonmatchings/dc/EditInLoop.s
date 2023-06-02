.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EditInLoop__Fv
/* 9C3B0 0019C2B0 D0FDBD27 */  addiu      $sp, $sp, -0x230
/* 9C3B4 0019C2B4 3000BF7F */  sq         $31, 0x30($sp)
/* 9C3B8 0019C2B8 2000B17F */  sq         $17, 0x20($sp)
/* 9C3BC 0019C2BC 1000B07F */  sq         $16, 0x10($sp)
/* 9C3C0 0019C2C0 0C00B7E7 */  swc1       $f23, 0xC($sp)
/* 9C3C4 0019C2C4 0800B6E7 */  swc1       $f22, 0x8($sp)
/* 9C3C8 0019C2C8 0400B5E7 */  swc1       $f21, 0x4($sp)
/* 9C3CC 0019C2CC 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 9C3D0 0019C2D0 90CD050C */  jal        EdSystemMesCheck__Fv
/* 9C3D4 0019C2D4 00000000 */   nop
/* 9C3D8 0019C2D8 05004014 */  bnez       $2, .L0019C2F0
/* 9C3DC 0019C2DC 00000000 */   nop
/* 9C3E0 0019C2E0 84CC050C */  jal        EdCheckItemOver__Fv
/* 9C3E4 0019C2E4 00000000 */   nop
/* 9C3E8 0019C2E8 06004010 */  beqz       $2, .L0019C304
/* 9C3EC 0019C2EC 00000000 */   nop
.L0019C2F0:
/* 9C3F0 0019C2F0 28260070 */  paddub     $4, $0, $0
/* 9C3F4 0019C2F4 FCA5050C */  jal        EdSetKeyMode__Fi
/* 9C3F8 0019C2F8 00000000 */   nop
/* 9C3FC 0019C2FC 04000010 */  b          .L0019C310
/* 9C400 0019C300 00000000 */   nop
.L0019C304:
/* 9C404 0019C304 FFFF0434 */  ori        $4, $0, 0xFFFF
/* 9C408 0019C308 FCA5050C */  jal        EdSetKeyMode__Fi
/* 9C40C 0019C30C 00000000 */   nop
.L0019C310:
/* 9C410 0019C310 00080424 */  addiu      $4, $0, 0x800
/* 9C414 0019C314 04000524 */  addiu      $5, $0, 0x4
/* 9C418 0019C318 64A6050C */  jal        EdPadDown__Fii
/* 9C41C 0019C31C 00000000 */   nop
/* 9C420 0019C320 03004010 */  beqz       $2, .L0019C330
/* 9C424 0019C324 00000000 */   nop
/* 9C428 0019C328 01000224 */  addiu      $2, $0, 0x1
/* 9C42C 0019C32C D49282AF */  sw         $2, -0x6D2C($gp)
.L0019C330:
/* 9C430 0019C330 4040023C */  lui        $2, (0x40400000 >> 16)
/* 9C434 0019C334 00088244 */  mtc1       $2, $f1
/* 9C438 0019C338 B09280C7 */  lwc1       $f0, -0x6D50($gp)
/* 9C43C 0019C33C 03030146 */  div.s      $f12, $f0, $f1
/* 9C440 0019C340 2C44040C */  jal        fptosi
/* 9C444 0019C344 00000000 */   nop
/* 9C448 0019C348 9492838F */  lw         $3, -0x6D6C($gp)
/* 9C44C 0019C34C 0E000224 */  addiu      $2, $0, 0xE
/* 9C450 0019C350 1B006210 */  beq        $3, $2, .L0019C3C0
/* 9C454 0019C354 00000000 */   nop
/* 9C458 0019C358 48A8050C */  jal        EdCheckViewMode__Fv
/* 9C45C 0019C35C 00000000 */   nop
/* 9C460 0019C360 0D004014 */  bnez       $2, .L0019C398
/* 9C464 0019C364 00000000 */   nop
/* 9C468 0019C368 A040023C */  lui        $2, (0x40A00000 >> 16)
/* 9C46C 0019C36C 00688244 */  mtc1       $2, $f13
/* 9C470 0019C370 FFFF0234 */  ori        $2, $0, 0xFFFF
/* 9C474 0019C374 00008244 */  mtc1       $2, $f0
/* 9C478 0019C378 00000000 */  nop
/* 9C47C 0019C37C A0038046 */  cvt.s.w    $f14, $f0
/* 9C480 0019C380 9092828F */  lw         $2, -0x6D70($gp)
/* 9C484 0019C384 C0044CC4 */  lwc1       $f12, 0x4C0($2)
/* 9C488 0019C388 B8B5040C */  jal        MGSetRenderInfo__Ffff
/* 9C48C 0019C38C 00000000 */   nop
/* 9C490 0019C390 0B000010 */  b          .L0019C3C0
/* 9C494 0019C394 00000000 */   nop
.L0019C398:
/* 9C498 0019C398 1644023C */  lui        $2, (0x44160000 >> 16)
/* 9C49C 0019C39C 00608244 */  mtc1       $2, $f12
/* 9C4A0 0019C3A0 8040023C */  lui        $2, (0x40800000 >> 16)
/* 9C4A4 0019C3A4 00688244 */  mtc1       $2, $f13
/* 9C4A8 0019C3A8 FFFF0234 */  ori        $2, $0, 0xFFFF
/* 9C4AC 0019C3AC 00008244 */  mtc1       $2, $f0
/* 9C4B0 0019C3B0 00000000 */  nop
/* 9C4B4 0019C3B4 A0038046 */  cvt.s.w    $f14, $f0
/* 9C4B8 0019C3B8 B8B5040C */  jal        MGSetRenderInfo__Ffff
/* 9C4BC 0019C3BC 00000000 */   nop
.L0019C3C0:
/* 9C4C0 0019C3C0 AC92848F */  lw         $4, -0x6D54($gp)
/* 9C4C4 0019C3C4 8000A527 */  addiu      $5, $sp, 0x80
/* 9C4C8 0019C3C8 A000998C */  lw         $25, 0xA0($4)
/* 9C4CC 0019C3CC A000398F */  lw         $25, 0xA0($25)
/* 9C4D0 0019C3D0 09F82003 */  jalr       $25
/* 9C4D4 0019C3D4 00000000 */   nop
/* 9C4D8 0019C3D8 9492838F */  lw         $3, -0x6D6C($gp)
/* 9C4DC 0019C3DC 05000224 */  addiu      $2, $0, 0x5
/* 9C4E0 0019C3E0 20006210 */  beq        $3, $2, .L0019C464
/* 9C4E4 0019C3E4 00000000 */   nop
/* 9C4E8 0019C3E8 07000224 */  addiu      $2, $0, 0x7
/* 9C4EC 0019C3EC 1D006210 */  beq        $3, $2, .L0019C464
/* 9C4F0 0019C3F0 00000000 */   nop
/* 9C4F4 0019C3F4 06000224 */  addiu      $2, $0, 0x6
/* 9C4F8 0019C3F8 1A006210 */  beq        $3, $2, .L0019C464
/* 9C4FC 0019C3FC 00000000 */   nop
/* 9C500 0019C400 01000010 */  b          .L0019C408
/* 9C504 0019C404 00000000 */   nop
.L0019C408:
/* 9C508 0019C408 9092828F */  lw         $2, -0x6D70($gp)
/* 9C50C 0019C40C 300B5124 */  addiu      $17, $2, 0xB30
/* 9C510 0019C410 28860070 */  paddub     $16, $0, $0
/* 9C514 0019C414 0D000010 */  b          .L0019C44C
/* 9C518 0019C418 00000000 */   nop
.L0019C41C:
/* 9C51C 0019C41C 8800248E */  lw         $4, 0x88($17)
/* 9C520 0019C420 05008018 */  blez       $4, .L0019C438
/* 9C524 0019C424 00000000 */   nop
/* 9C528 0019C428 14E0050C */  jal        EdGetMapFlag__Fi
/* 9C52C 0019C42C 00000000 */   nop
/* 9C530 0019C430 04004014 */  bnez       $2, .L0019C444
/* 9C534 0019C434 00000000 */   nop
.L0019C438:
/* 9C538 0019C438 28262072 */  paddub     $4, $17, $0
/* 9C53C 0019C43C 7898050C */  jal        ObjAnimePlay__FP13OBJ_ANIME_SEQ
/* 9C540 0019C440 00000000 */   nop
.L0019C444:
/* 9C544 0019C444 01001026 */  addiu      $16, $16, 0x1
/* 9C548 0019C448 90003126 */  addiu      $17, $17, 0x90
.L0019C44C:
/* 9C54C 0019C44C B492828F */  lw         $2, -0x6D4C($gp)
/* 9C550 0019C450 2A100202 */  slt        $2, $16, $2
/* 9C554 0019C454 F1FF4014 */  bnez       $2, .L0019C41C
/* 9C558 0019C458 00000000 */   nop
/* 9C55C 0019C45C B876060C */  jal        StepWater__Fv
/* 9C560 0019C460 00000000 */   nop
.L0019C464:
/* 9C564 0019C464 A087828F */  lw         $2, -0x7860($gp)
/* 9C568 0019C468 0E004010 */  beqz       $2, .L0019C4A4
/* 9C56C 0019C46C 00000000 */   nop
/* 9C570 0019C470 A092828F */  lw         $2, -0x6D60($gp)
/* 9C574 0019C474 0B004018 */  blez       $2, .L0019C4A4
/* 9C578 0019C478 00000000 */   nop
/* 9C57C 0019C47C 9492828F */  lw         $2, -0x6D6C($gp)
/* 9C580 0019C480 08004014 */  bnez       $2, .L0019C4A4
/* 9C584 0019C484 00000000 */   nop
/* 9C588 0019C488 D501013C */  lui        $at, (0x1D50000 >> 16)
/* 9C58C 0019C48C A0D6248C */  lw         $4, -0x2960($at)
/* 9C590 0019C490 D501023C */  lui        $2, %hi(MainCamera_2)
/* 9C594 0019C494 B03A4524 */  addiu      $5, $2, %lo(MainCamera_2)
/* 9C598 0019C498 AC92868F */  lw         $6, -0x6D54($gp)
/* 9C59C 0019C49C 4879060C */  jal        SetCameraPos__FP6CFrameP7CCameraP10CCharacter
/* 9C5A0 0019C4A0 00000000 */   nop
.L0019C4A4:
/* 9C5A4 0019C4A4 28260070 */  paddub     $4, $0, $0
/* 9C5A8 0019C4A8 F8F2050C */  jal        EdSetCharaCursor__Fi
/* 9C5AC 0019C4AC 00000000 */   nop
/* 9C5B0 0019C4B0 9492848F */  lw         $4, -0x6D6C($gp)
/* 9C5B4 0019C4B4 0800812C */  sltiu      $at, $4, 0x8
/* 9C5B8 0019C4B8 36022010 */  beqz       $at, .L0019CD94
/* 9C5BC 0019C4BC 00000000 */   nop
/* 9C5C0 0019C4C0 2A00023C */  lui        $2, %hi(_893_2)
/* 9C5C4 0019C4C4 F0B24324 */  addiu      $3, $2, %lo(_893_2)
/* 9C5C8 0019C4C8 80100400 */  sll        $2, $4, 2
/* 9C5CC 0019C4CC 21104300 */  addu       $2, $2, $3
/* 9C5D0 0019C4D0 0000428C */  lw         $2, 0x0($2)
/* 9C5D4 0019C4D4 08004000 */  jr         $2
/* 9C5D8 0019C4D8 00000000 */   nop
/* 9C5DC 0019C4DC DC92828F */  lw         $2, -0x6D24($gp)
/* 9C5E0 0019C4E0 03004018 */  blez       $2, .L0019C4F0
/* 9C5E4 0019C4E4 00000000 */   nop
/* 9C5E8 0019C4E8 3C77060C */  jal        MoveCharacter__Fv
/* 9C5EC 0019C4EC 00000000 */   nop
.L0019C4F0:
/* 9C5F0 0019C4F0 01000424 */  addiu      $4, $0, 0x1
/* 9C5F4 0019C4F4 F8F2050C */  jal        EdSetCharaCursor__Fi
/* 9C5F8 0019C4F8 00000000 */   nop
/* 9C5FC 0019C4FC 28860070 */  paddub     $16, $0, $0
/* 9C600 0019C500 14000010 */  b          .L0019C554
/* 9C604 0019C504 00000000 */   nop
.L0019C508:
/* 9C608 0019C508 40111000 */  sll        $2, $16, 5
/* 9C60C 0019C50C 21185000 */  addu       $3, $2, $16
/* 9C610 0019C510 80100300 */  sll        $2, $3, 2
/* 9C614 0019C514 21106200 */  addu       $2, $3, $2
/* 9C618 0019C518 40190200 */  sll        $3, $2, 5
/* 9C61C 0019C51C D201023C */  lui        $2, %hi(EdVillager)
/* 9C620 0019C520 905B4224 */  addiu      $2, $2, %lo(EdVillager)
/* 9C624 0019C524 21884300 */  addu       $17, $2, $3
/* 9C628 0019C528 28262072 */  paddub     $4, $17, $0
/* 9C62C 0019C52C EC57050C */  jal        Step__12CNPCharacterFv
/* 9C630 0019C530 00000000 */   nop
/* 9C634 0019C534 28262072 */  paddub     $4, $17, $0
/* 9C638 0019C538 3C58050C */  jal        ShadowStep__12CNPCharacterFv
/* 9C63C 0019C53C 00000000 */   nop
/* 9C640 0019C540 28262072 */  paddub     $4, $17, $0
/* 9C644 0019C544 282E0070 */  paddub     $5, $0, $0
/* 9C648 0019C548 94E3040C */  jal        ClothStep__10CCharacterFi
/* 9C64C 0019C54C 00000000 */   nop
/* 9C650 0019C550 01001026 */  addiu      $16, $16, 0x1
.L0019C554:
/* 9C654 0019C554 0A00022A */  slti       $2, $16, 0xA
/* 9C658 0019C558 EBFF4014 */  bnez       $2, .L0019C508
/* 9C65C 0019C55C 00000000 */   nop
/* 9C660 0019C560 D501023C */  lui        $2, %hi(MainCamera_2)
/* 9C664 0019C564 B03A4224 */  addiu      $2, $2, %lo(MainCamera_2)
/* 9C668 0019C568 A89282AF */  sw         $2, -0x6D58($gp)
/* 9C66C 0019C56C 48A8050C */  jal        EdCheckViewMode__Fv
/* 9C670 0019C570 00000000 */   nop
/* 9C674 0019C574 07024010 */  beqz       $2, .L0019CD94
/* 9C678 0019C578 00000000 */   nop
/* 9C67C 0019C57C D501023C */  lui        $2, %hi(ViewCamera_2)
/* 9C680 0019C580 B0434224 */  addiu      $2, $2, %lo(ViewCamera_2)
/* 9C684 0019C584 A89282AF */  sw         $2, -0x6D58($gp)
/* 9C688 0019C588 02020010 */  b          .L0019CD94
/* 9C68C 0019C58C 00000000 */   nop
/* 9C690 0019C590 D501023C */  lui        $2, %hi(EventCamera_2)
/* 9C694 0019C594 B0404224 */  addiu      $2, $2, %lo(EventCamera_2)
/* 9C698 0019C598 A89282AF */  sw         $2, -0x6D58($gp)
/* 9C69C 0019C59C 0002A0AF */  sw         $0, 0x200($sp)
/* 9C6A0 0019C5A0 0402A0AF */  sw         $0, 0x204($sp)
/* 9C6A4 0019C5A4 0802A0AF */  sw         $0, 0x208($sp)
/* 9C6A8 0019C5A8 AC92848F */  lw         $4, -0x6D54($gp)
/* 9C6AC 0019C5AC 0002A527 */  addiu      $5, $sp, 0x200
/* 9C6B0 0019C5B0 A000998C */  lw         $25, 0xA0($4)
/* 9C6B4 0019C5B4 1C00398F */  lw         $25, 0x1C($25)
/* 9C6B8 0019C5B8 09F82003 */  jalr       $25
/* 9C6BC 0019C5BC 00000000 */   nop
/* 9C6C0 0019C5C0 B09280C7 */  lwc1       $f0, -0x6D50($gp)
/* 9C6C4 0019C5C4 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 9C6C8 0019C5C8 F0D320E4 */  swc1       $f0, -0x2C10($at)
/* 9C6CC 0019C5CC D501023C */  lui        $2, %hi(EventCamera_2)
/* 9C6D0 0019C5D0 B0404424 */  addiu      $4, $2, %lo(EventCamera_2)
/* 9C6D4 0019C5D4 282E0070 */  paddub     $5, $0, $0
/* 9C6D8 0019C5D8 B45E060C */  jal        EdEventMode__FP13CCameraFollowi
/* 9C6DC 0019C5DC 00000000 */   nop
/* 9C6E0 0019C5E0 3D004010 */  beqz       $2, .L0019C6D8
/* 9C6E4 0019C5E4 00000000 */   nop
/* 9C6E8 0019C5E8 949280AF */  sw         $0, -0x6D6C($gp)
/* 9C6EC 0019C5EC D501033C */  lui        $3, %hi(MainCamera_2)
/* 9C6F0 0019C5F0 B03A6324 */  addiu      $3, $3, %lo(MainCamera_2)
/* 9C6F4 0019C5F4 A89283AF */  sw         $3, -0x6D58($gp)
/* 9C6F8 0019C5F8 07000324 */  addiu      $3, $0, 0x7
/* 9C6FC 0019C5FC 12004314 */  bne        $2, $3, .L0019C648
/* 9C700 0019C600 00000000 */   nop
/* 9C704 0019C604 288D838F */  lw         $3, -0x72D8($gp)
/* 9C708 0019C608 03000224 */  addiu      $2, $0, 0x3
/* 9C70C 0019C60C 0B006214 */  bne        $3, $2, .L0019C63C
/* 9C710 0019C610 00000000 */   nop
/* 9C714 0019C614 D201023C */  lui        $2, %hi(EdInteriorName)
/* 9C718 0019C618 00B54424 */  addiu      $4, $2, %lo(EdInteriorName)
/* 9C71C 0019C61C 2A00023C */  lui        $2, %hi(_886_2)
/* 9C720 0019C620 C8B24524 */  addiu      $5, $2, %lo(_886_2)
/* 9C724 0019C624 0815040C */  jal        strcmp
/* 9C728 0019C628 00000000 */   nop
/* 9C72C 0019C62C 03004014 */  bnez       $2, .L0019C63C
/* 9C730 0019C630 00000000 */   nop
/* 9C734 0019C634 FFFF0224 */  addiu      $2, $0, -0x1
/* 9C738 0019C638 389082AF */  sw         $2, -0x6FC8($gp)
.L0019C63C:
/* 9C73C 0019C63C 01000224 */  addiu      $2, $0, 0x1
/* 9C740 0019C640 16030010 */  b          .L0019D29C
/* 9C744 0019C644 00000000 */   nop
.L0019C648:
/* 9C748 0019C648 08000324 */  addiu      $3, $0, 0x8
/* 9C74C 0019C64C 04004314 */  bne        $2, $3, .L0019C660
/* 9C750 0019C650 00000000 */   nop
/* 9C754 0019C654 63000224 */  addiu      $2, $0, 0x63
/* 9C758 0019C658 10030010 */  b          .L0019D29C
/* 9C75C 0019C65C 00000000 */   nop
.L0019C660:
/* 9C760 0019C660 09000324 */  addiu      $3, $0, 0x9
/* 9C764 0019C664 03004314 */  bne        $2, $3, .L0019C674
/* 9C768 0019C668 00000000 */   nop
/* 9C76C 0019C66C 03000224 */  addiu      $2, $0, 0x3
/* 9C770 0019C670 949282AF */  sw         $2, -0x6D6C($gp)
.L0019C674:
/* 9C774 0019C674 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 9C778 0019C678 14D2228C */  lw         $2, -0x2DEC($at)
/* 9C77C 0019C67C 15004104 */  bgez       $2, .L0019C6D4
/* 9C780 0019C680 00000000 */   nop
/* 9C784 0019C684 D501023C */  lui        $2, %hi(EventCamera_2)
/* 9C788 0019C688 B0404424 */  addiu      $4, $2, %lo(EventCamera_2)
/* 9C78C 0019C68C 9000A527 */  addiu      $5, $sp, 0x90
/* 9C790 0019C690 9C91040C */  jal        GetPos__7CCameraFPf
/* 9C794 0019C694 00000000 */   nop
/* 9C798 0019C698 D501023C */  lui        $2, %hi(EventCamera_2)
/* 9C79C 0019C69C B0404424 */  addiu      $4, $2, %lo(EventCamera_2)
/* 9C7A0 0019C6A0 A000A527 */  addiu      $5, $sp, 0xA0
/* 9C7A4 0019C6A4 A891040C */  jal        GetRef__7CCameraFPf
/* 9C7A8 0019C6A8 00000000 */   nop
/* 9C7AC 0019C6AC D501023C */  lui        $2, %hi(MainCamera_2)
/* 9C7B0 0019C6B0 B03A4424 */  addiu      $4, $2, %lo(MainCamera_2)
/* 9C7B4 0019C6B4 9000A527 */  addiu      $5, $sp, 0x90
/* 9C7B8 0019C6B8 A490040C */  jal        SetPos__7CCameraFPf
/* 9C7BC 0019C6BC 00000000 */   nop
/* 9C7C0 0019C6C0 D501023C */  lui        $2, %hi(MainCamera_2)
/* 9C7C4 0019C6C4 B03A4424 */  addiu      $4, $2, %lo(MainCamera_2)
/* 9C7C8 0019C6C8 A000A527 */  addiu      $5, $sp, 0xA0
/* 9C7CC 0019C6CC C490040C */  jal        SetRef__7CCameraFPf
/* 9C7D0 0019C6D0 00000000 */   nop
.L0019C6D4:
/* 9C7D4 0019C6D4 9C9280AF */  sw         $0, -0x6D64($gp)
.L0019C6D8:
/* 9C7D8 0019C6D8 787A060C */  jal        VillagerCollision__Fv_2
/* 9C7DC 0019C6DC 00000000 */   nop
/* 9C7E0 0019C6E0 F461060C */  jal        EdEventNPCStep__Fv
/* 9C7E4 0019C6E4 00000000 */   nop
/* 9C7E8 0019C6E8 D49280AF */  sw         $0, -0x6D2C($gp)
/* 9C7EC 0019C6EC A9010010 */  b          .L0019CD94
/* 9C7F0 0019C6F0 00000000 */   nop
/* 9C7F4 0019C6F4 D501023C */  lui        $2, %hi(MainCamera_2)
/* 9C7F8 0019C6F8 B03A4224 */  addiu      $2, $2, %lo(MainCamera_2)
/* 9C7FC 0019C6FC A89282AF */  sw         $2, -0x6D58($gp)
/* 9C800 0019C700 B000A0AF */  sw         $0, 0xB0($sp)
/* 9C804 0019C704 B400A0AF */  sw         $0, 0xB4($sp)
/* 9C808 0019C708 B800A0AF */  sw         $0, 0xB8($sp)
/* 9C80C 0019C70C AC92848F */  lw         $4, -0x6D54($gp)
/* 9C810 0019C710 B000A527 */  addiu      $5, $sp, 0xB0
/* 9C814 0019C714 A000998C */  lw         $25, 0xA0($4)
/* 9C818 0019C718 1C00398F */  lw         $25, 0x1C($25)
/* 9C81C 0019C71C 09F82003 */  jalr       $25
/* 9C820 0019C720 00000000 */   nop
/* 9C824 0019C724 AC92848F */  lw         $4, -0x6D54($gp)
/* 9C828 0019C728 A000998C */  lw         $25, 0xA0($4)
/* 9C82C 0019C72C 0800398F */  lw         $25, 0x8($25)
/* 9C830 0019C730 09F82003 */  jalr       $25
/* 9C834 0019C734 00000000 */   nop
/* 9C838 0019C738 AC92848F */  lw         $4, -0x6D54($gp)
/* 9C83C 0019C73C A000998C */  lw         $25, 0xA0($4)
/* 9C840 0019C740 9000398F */  lw         $25, 0x90($25)
/* 9C844 0019C744 09F82003 */  jalr       $25
/* 9C848 0019C748 00000000 */   nop
/* 9C84C 0019C74C AC92848F */  lw         $4, -0x6D54($gp)
/* 9C850 0019C750 D501023C */  lui        $2, %hi(fix_chara_pos_2)
/* 9C854 0019C754 D0D54524 */  addiu      $5, $2, %lo(fix_chara_pos_2)
/* 9C858 0019C758 A000998C */  lw         $25, 0xA0($4)
/* 9C85C 0019C75C 1400398F */  lw         $25, 0x14($25)
/* 9C860 0019C760 09F82003 */  jalr       $25
/* 9C864 0019C764 00000000 */   nop
/* 9C868 0019C768 AC92848F */  lw         $4, -0x6D54($gp)
/* 9C86C 0019C76C D501013C */  lui        $at, (0x1D50000 >> 16)
/* 9C870 0019C770 E0D52CC4 */  lwc1       $f12, -0x2A20($at)
/* 9C874 0019C774 D501013C */  lui        $at, (0x1D50000 >> 16)
/* 9C878 0019C778 E4D52DC4 */  lwc1       $f13, -0x2A1C($at)
/* 9C87C 0019C77C D501013C */  lui        $at, (0x1D50000 >> 16)
/* 9C880 0019C780 E8D52EC4 */  lwc1       $f14, -0x2A18($at)
/* 9C884 0019C784 A000998C */  lw         $25, 0xA0($4)
/* 9C888 0019C788 3000398F */  lw         $25, 0x30($25)
/* 9C88C 0019C78C 09F82003 */  jalr       $25
/* 9C890 0019C790 00000000 */   nop
/* 9C894 0019C794 AC92848F */  lw         $4, -0x6D54($gp)
/* 9C898 0019C798 282E0070 */  paddub     $5, $0, $0
/* 9C89C 0019C79C A000998C */  lw         $25, 0xA0($4)
/* 9C8A0 0019C7A0 9400398F */  lw         $25, 0x94($25)
/* 9C8A4 0019C7A4 09F82003 */  jalr       $25
/* 9C8A8 0019C7A8 00000000 */   nop
/* 9C8AC 0019C7AC 28860070 */  paddub     $16, $0, $0
/* 9C8B0 0019C7B0 14000010 */  b          .L0019C804
/* 9C8B4 0019C7B4 00000000 */   nop
.L0019C7B8:
/* 9C8B8 0019C7B8 40111000 */  sll        $2, $16, 5
/* 9C8BC 0019C7BC 21185000 */  addu       $3, $2, $16
/* 9C8C0 0019C7C0 80100300 */  sll        $2, $3, 2
/* 9C8C4 0019C7C4 21106200 */  addu       $2, $3, $2
/* 9C8C8 0019C7C8 40190200 */  sll        $3, $2, 5
/* 9C8CC 0019C7CC D201023C */  lui        $2, %hi(EdVillager)
/* 9C8D0 0019C7D0 905B4224 */  addiu      $2, $2, %lo(EdVillager)
/* 9C8D4 0019C7D4 21884300 */  addu       $17, $2, $3
/* 9C8D8 0019C7D8 28262072 */  paddub     $4, $17, $0
/* 9C8DC 0019C7DC EC57050C */  jal        Step__12CNPCharacterFv
/* 9C8E0 0019C7E0 00000000 */   nop
/* 9C8E4 0019C7E4 28262072 */  paddub     $4, $17, $0
/* 9C8E8 0019C7E8 3C58050C */  jal        ShadowStep__12CNPCharacterFv
/* 9C8EC 0019C7EC 00000000 */   nop
/* 9C8F0 0019C7F0 28262072 */  paddub     $4, $17, $0
/* 9C8F4 0019C7F4 282E0070 */  paddub     $5, $0, $0
/* 9C8F8 0019C7F8 94E3040C */  jal        ClothStep__10CCharacterFi
/* 9C8FC 0019C7FC 00000000 */   nop
/* 9C900 0019C800 01001026 */  addiu      $16, $16, 0x1
.L0019C804:
/* 9C904 0019C804 0A00022A */  slti       $2, $16, 0xA
/* 9C908 0019C808 EBFF4014 */  bnez       $2, .L0019C7B8
/* 9C90C 0019C80C 00000000 */   nop
/* 9C910 0019C810 A492828F */  lw         $2, -0x6D5C($gp)
/* 9C914 0019C814 FFFF4224 */  addiu      $2, $2, -0x1
/* 9C918 0019C818 A49282AF */  sw         $2, -0x6D5C($gp)
/* 9C91C 0019C81C A492838F */  lw         $3, -0x6D5C($gp)
/* 9C920 0019C820 64000224 */  addiu      $2, $0, 0x64
/* 9C924 0019C824 0E006214 */  bne        $3, $2, .L0019C860
/* 9C928 0019C828 00000000 */   nop
/* 9C92C 0019C82C 3890828F */  lw         $2, -0x6FC8($gp)
/* 9C930 0019C830 0B004004 */  bltz       $2, .L0019C860
/* 9C934 0019C834 00000000 */   nop
/* 9C938 0019C838 AC92848F */  lw         $4, -0x6D54($gp)
/* 9C93C 0019C83C C000A527 */  addiu      $5, $sp, 0xC0
/* 9C940 0019C840 A000998C */  lw         $25, 0xA0($4)
/* 9C944 0019C844 A000398F */  lw         $25, 0xA0($25)
/* 9C948 0019C848 09F82003 */  jalr       $25
/* 9C94C 0019C84C 00000000 */   nop
/* 9C950 0019C850 3890848F */  lw         $4, -0x6FC8($gp)
/* 9C954 0019C854 C000A527 */  addiu      $5, $sp, 0xC0
/* 9C958 0019C858 40C8050C */  jal        EdDoorOpenSe__FiPf
/* 9C95C 0019C85C 00000000 */   nop
.L0019C860:
/* 9C960 0019C860 A492828F */  lw         $2, -0x6D5C($gp)
/* 9C964 0019C864 4B014104 */  bgez       $2, .L0019CD94
/* 9C968 0019C868 00000000 */   nop
/* 9C96C 0019C86C A49280AF */  sw         $0, -0x6D5C($gp)
/* 9C970 0019C870 02000224 */  addiu      $2, $0, 0x2
/* 9C974 0019C874 949282AF */  sw         $2, -0x6D6C($gp)
/* 9C978 0019C878 46010010 */  b          .L0019CD94
/* 9C97C 0019C87C 00000000 */   nop
/* 9C980 0019C880 D501023C */  lui        $2, %hi(MainCamera_2)
/* 9C984 0019C884 B03A4224 */  addiu      $2, $2, %lo(MainCamera_2)
/* 9C988 0019C888 A89282AF */  sw         $2, -0x6D58($gp)
/* 9C98C 0019C88C B4C6050C */  jal        EdStopSoundSrc__Fv
/* 9C990 0019C890 00000000 */   nop
/* 9C994 0019C894 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 9C998 0019C898 00D2228C */  lw         $2, -0x2E00($at)
/* 9C99C 0019C89C 05004010 */  beqz       $2, .L0019C8B4
/* 9C9A0 0019C8A0 00000000 */   nop
/* 9C9A4 0019C8A4 1467050C */  jal        SndBgmFadeOutStop__Fv
/* 9C9A8 0019C8A8 00000000 */   nop
/* 9C9AC 0019C8AC 03000010 */  b          .L0019C8BC
/* 9C9B0 0019C8B0 00000000 */   nop
.L0019C8B4:
/* 9C9B4 0019C8B4 FFFF0224 */  addiu      $2, $0, -0x1
/* 9C9B8 0019C8B8 409082AF */  sw         $2, -0x6FC0($gp)
.L0019C8BC:
/* 9C9BC 0019C8BC 01000224 */  addiu      $2, $0, 0x1
/* 9C9C0 0019C8C0 76020010 */  b          .L0019D29C
/* 9C9C4 0019C8C4 00000000 */   nop
/* 9C9C8 0019C8C8 D501023C */  lui        $2, %hi(MainCamera_2)
/* 9C9CC 0019C8CC B03A4224 */  addiu      $2, $2, %lo(MainCamera_2)
/* 9C9D0 0019C8D0 A89282AF */  sw         $2, -0x6D58($gp)
/* 9C9D4 0019C8D4 48A8050C */  jal        EdCheckViewMode__Fv
/* 9C9D8 0019C8D8 00000000 */   nop
/* 9C9DC 0019C8DC 04004010 */  beqz       $2, .L0019C8F0
/* 9C9E0 0019C8E0 00000000 */   nop
/* 9C9E4 0019C8E4 D501023C */  lui        $2, %hi(ViewCamera_2)
/* 9C9E8 0019C8E8 B0434224 */  addiu      $2, $2, %lo(ViewCamera_2)
/* 9C9EC 0019C8EC A89282AF */  sw         $2, -0x6D58($gp)
.L0019C8F0:
/* 9C9F0 0019C8F0 AC92838F */  lw         $3, -0x6D54($gp)
/* 9C9F4 0019C8F4 680C60AC */  sw         $0, 0xC68($3)
/* 9C9F8 0019C8F8 640C60AC */  sw         $0, 0xC64($3)
/* 9C9FC 0019C8FC 80BF023C */  lui        $2, (0xBF800000 >> 16)
/* 9CA00 0019C900 600C62AC */  sw         $2, 0xC60($3)
/* 9CA04 0019C904 1002A0AF */  sw         $0, 0x210($sp)
/* 9CA08 0019C908 1402A0AF */  sw         $0, 0x214($sp)
/* 9CA0C 0019C90C 1802A0AF */  sw         $0, 0x218($sp)
/* 9CA10 0019C910 AC92848F */  lw         $4, -0x6D54($gp)
/* 9CA14 0019C914 1002A527 */  addiu      $5, $sp, 0x210
/* 9CA18 0019C918 A000998C */  lw         $25, 0xA0($4)
/* 9CA1C 0019C91C 1C00398F */  lw         $25, 0x1C($25)
/* 9CA20 0019C920 09F82003 */  jalr       $25
/* 9CA24 0019C924 00000000 */   nop
/* 9CA28 0019C928 AC92848F */  lw         $4, -0x6D54($gp)
/* 9CA2C 0019C92C A000998C */  lw         $25, 0xA0($4)
/* 9CA30 0019C930 0800398F */  lw         $25, 0x8($25)
/* 9CA34 0019C934 09F82003 */  jalr       $25
/* 9CA38 0019C938 00000000 */   nop
/* 9CA3C 0019C93C AC92848F */  lw         $4, -0x6D54($gp)
/* 9CA40 0019C940 A000998C */  lw         $25, 0xA0($4)
/* 9CA44 0019C944 9000398F */  lw         $25, 0x90($25)
/* 9CA48 0019C948 09F82003 */  jalr       $25
/* 9CA4C 0019C94C 00000000 */   nop
/* 9CA50 0019C950 AC92848F */  lw         $4, -0x6D54($gp)
/* 9CA54 0019C954 282E0070 */  paddub     $5, $0, $0
/* 9CA58 0019C958 A000998C */  lw         $25, 0xA0($4)
/* 9CA5C 0019C95C 9400398F */  lw         $25, 0x94($25)
/* 9CA60 0019C960 09F82003 */  jalr       $25
/* 9CA64 0019C964 00000000 */   nop
/* 9CA68 0019C968 28860070 */  paddub     $16, $0, $0
/* 9CA6C 0019C96C 14000010 */  b          .L0019C9C0
/* 9CA70 0019C970 00000000 */   nop
.L0019C974:
/* 9CA74 0019C974 40111000 */  sll        $2, $16, 5
/* 9CA78 0019C978 21185000 */  addu       $3, $2, $16
/* 9CA7C 0019C97C 80100300 */  sll        $2, $3, 2
/* 9CA80 0019C980 21106200 */  addu       $2, $3, $2
/* 9CA84 0019C984 40190200 */  sll        $3, $2, 5
/* 9CA88 0019C988 D201023C */  lui        $2, %hi(EdVillager)
/* 9CA8C 0019C98C 905B4224 */  addiu      $2, $2, %lo(EdVillager)
/* 9CA90 0019C990 21884300 */  addu       $17, $2, $3
/* 9CA94 0019C994 28262072 */  paddub     $4, $17, $0
/* 9CA98 0019C998 EC57050C */  jal        Step__12CNPCharacterFv
/* 9CA9C 0019C99C 00000000 */   nop
/* 9CAA0 0019C9A0 28262072 */  paddub     $4, $17, $0
/* 9CAA4 0019C9A4 3C58050C */  jal        ShadowStep__12CNPCharacterFv
/* 9CAA8 0019C9A8 00000000 */   nop
/* 9CAAC 0019C9AC 28262072 */  paddub     $4, $17, $0
/* 9CAB0 0019C9B0 282E0070 */  paddub     $5, $0, $0
/* 9CAB4 0019C9B4 94E3040C */  jal        ClothStep__10CCharacterFi
/* 9CAB8 0019C9B8 00000000 */   nop
/* 9CABC 0019C9BC 01001026 */  addiu      $16, $16, 0x1
.L0019C9C0:
/* 9CAC0 0019C9C0 0A00022A */  slti       $2, $16, 0xA
/* 9CAC4 0019C9C4 EBFF4014 */  bnez       $2, .L0019C974
/* 9CAC8 0019C9C8 00000000 */   nop
/* 9CACC 0019C9CC 1C64060C */  jal        EdNowTalkChara__Fv
/* 9CAD0 0019C9D0 00000000 */   nop
/* 9CAD4 0019C9D4 28864070 */  paddub     $16, $2, $0
/* 9CAD8 0019C9D8 AC92848F */  lw         $4, -0x6D54($gp)
/* 9CADC 0019C9DC 282E0072 */  paddub     $5, $16, $0
/* 9CAE0 0019C9E0 EC5A050C */  jal        GetDistance__7CObjectFR7CObject
/* 9CAE4 0019C9E4 00000000 */   nop
/* 9CAE8 0019C9E8 06050046 */  mov.s      $f20, $f0
/* 9CAEC 0019C9EC AC92848F */  lw         $4, -0x6D54($gp)
/* 9CAF0 0019C9F0 282E0072 */  paddub     $5, $16, $0
/* 9CAF4 0019C9F4 D000A627 */  addiu      $6, $sp, 0xD0
/* 9CAF8 0019C9F8 045B050C */  jal        GetDir__7CObjectFR7CObjectPf
/* 9CAFC 0019C9FC 00000000 */   nop
/* 9CB00 0019CA00 B40001C6 */  lwc1       $f1, 0xB4($16)
/* 9CB04 0019CA04 D08180C7 */  lwc1       $f0, -0x7E30($gp)
/* 9CB08 0019CA08 40000146 */  add.s      $f1, $f0, $f1
/* 9CB0C 0019CA0C D400A0C7 */  lwc1       $f0, 0xD4($sp)
/* 9CB10 0019CA10 40080046 */  add.s      $f1, $f1, $f0
/* 9CB14 0019CA14 AC92828F */  lw         $2, -0x6D54($gp)
/* 9CB18 0019CA18 B40040C4 */  lwc1       $f0, 0xB4($2)
/* 9CB1C 0019CA1C 07000046 */  neg.s      $f0, $f0
/* 9CB20 0019CA20 00030146 */  add.s      $f12, $f0, $f1
/* 9CB24 0019CA24 46A30046 */  mov.s      $f13, $f20
/* 9CB28 0019CA28 5077040C */  jal        atan2f
/* 9CB2C 0019CA2C 00000000 */   nop
/* 9CB30 0019CA30 07050046 */  neg.s      $f20, $f0
/* 9CB34 0019CA34 D000ACC7 */  lwc1       $f12, 0xD0($sp)
/* 9CB38 0019CA38 D800ADC7 */  lwc1       $f13, 0xD8($sp)
/* 9CB3C 0019CA3C 5077040C */  jal        atan2f
/* 9CB40 0019CA40 00000000 */   nop
/* 9CB44 0019CA44 46050046 */  mov.s      $f21, $f0
/* 9CB48 0019CA48 4CA8050C */  jal        EdAGetViewAngleH__Fv
/* 9CB4C 0019CA4C 00000000 */   nop
/* 9CB50 0019CA50 86050046 */  mov.s      $f22, $f0
/* 9CB54 0019CA54 50A8050C */  jal        EdAGetViewAngleV__Fv
/* 9CB58 0019CA58 00000000 */   nop
/* 9CB5C 0019CA5C C6050046 */  mov.s      $f23, $f0
/* 9CB60 0019CA60 06B30046 */  mov.s      $f12, $f22
/* 9CB64 0019CA64 46AB0046 */  mov.s      $f13, $f21
/* 9CB68 0019CA68 94828EC7 */  lwc1       $f14, -0x7D6C($gp)
/* 9CB6C 0019CA6C 28260070 */  paddub     $4, $0, $0
/* 9CB70 0019CA70 748E040C */  jal        AngleInterpolate__Ffffi
/* 9CB74 0019CA74 00000000 */   nop
/* 9CB78 0019CA78 86050046 */  mov.s      $f22, $f0
/* 9CB7C 0019CA7C 06BB0046 */  mov.s      $f12, $f23
/* 9CB80 0019CA80 46A30046 */  mov.s      $f13, $f20
/* 9CB84 0019CA84 F0818EC7 */  lwc1       $f14, -0x7E10($gp)
/* 9CB88 0019CA88 28260070 */  paddub     $4, $0, $0
/* 9CB8C 0019CA8C 748E040C */  jal        AngleInterpolate__Ffffi
/* 9CB90 0019CA90 00000000 */   nop
/* 9CB94 0019CA94 C6050046 */  mov.s      $f23, $f0
/* 9CB98 0019CA98 06B30046 */  mov.s      $f12, $f22
/* 9CB9C 0019CA9C 46BB0046 */  mov.s      $f13, $f23
/* 9CBA0 0019CAA0 54A8050C */  jal        EdASetViewAngle__Fff
/* 9CBA4 0019CAA4 00000000 */   nop
/* 9CBA8 0019CAA8 D501023C */  lui        $2, %hi(ViewCamera_2)
/* 9CBAC 0019CAAC B0434424 */  addiu      $4, $2, %lo(ViewCamera_2)
/* 9CBB0 0019CAB0 AC92858F */  lw         $5, -0x6D54($gp)
/* 9CBB4 0019CAB4 FCA7050C */  jal        EdEyeCamera__FP7CCameraP10CCharacter
/* 9CBB8 0019CAB8 00000000 */   nop
/* 9CBBC 0019CABC 48A8050C */  jal        EdCheckViewMode__Fv
/* 9CBC0 0019CAC0 00000000 */   nop
/* 9CBC4 0019CAC4 1F004010 */  beqz       $2, .L0019CB44
/* 9CBC8 0019CAC8 00000000 */   nop
/* 9CBCC 0019CACC 41B01546 */  sub.s      $f1, $f22, $f21
/* 9CBD0 0019CAD0 00008044 */  mtc1       $0, $f0
/* 9CBD4 0019CAD4 00000000 */  nop
/* 9CBD8 0019CAD8 34080046 */  c.lt.s     $f1, $f0
/* 9CBDC 0019CADC 00000000 */  nop
/* 9CBE0 0019CAE0 04000045 */  bc1f       .L0019CAF4
/* 9CBE4 0019CAE4 00000000 */   nop
/* 9CBE8 0019CAE8 47080046 */  neg.s      $f1, $f1
/* 9CBEC 0019CAEC 01000010 */  b          .L0019CAF4
/* 9CBF0 0019CAF0 00000000 */   nop
.L0019CAF4:
/* 9CBF4 0019CAF4 A48080C7 */  lwc1       $f0, -0x7F5C($gp)
/* 9CBF8 0019CAF8 34080046 */  c.lt.s     $f1, $f0
/* 9CBFC 0019CAFC 00000000 */  nop
/* 9CC00 0019CB00 A4000045 */  bc1f       .L0019CD94
/* 9CC04 0019CB04 00000000 */   nop
/* 9CC08 0019CB08 41B81446 */  sub.s      $f1, $f23, $f20
/* 9CC0C 0019CB0C 00008044 */  mtc1       $0, $f0
/* 9CC10 0019CB10 00000000 */  nop
/* 9CC14 0019CB14 34080046 */  c.lt.s     $f1, $f0
/* 9CC18 0019CB18 00000000 */  nop
/* 9CC1C 0019CB1C 04000045 */  bc1f       .L0019CB30
/* 9CC20 0019CB20 00000000 */   nop
/* 9CC24 0019CB24 47080046 */  neg.s      $f1, $f1
/* 9CC28 0019CB28 01000010 */  b          .L0019CB30
/* 9CC2C 0019CB2C 00000000 */   nop
.L0019CB30:
/* 9CC30 0019CB30 A48080C7 */  lwc1       $f0, -0x7F5C($gp)
/* 9CC34 0019CB34 34080046 */  c.lt.s     $f1, $f0
/* 9CC38 0019CB38 00000000 */  nop
/* 9CC3C 0019CB3C 95000045 */  bc1f       .L0019CD94
/* 9CC40 0019CB40 00000000 */   nop
.L0019CB44:
/* 9CC44 0019CB44 06AB0046 */  mov.s      $f12, $f21
/* 9CC48 0019CB48 46A30046 */  mov.s      $f13, $f20
/* 9CC4C 0019CB4C 54A8050C */  jal        EdASetViewAngle__Fff
/* 9CC50 0019CB50 00000000 */   nop
/* 9CC54 0019CB54 2C02A0AF */  sw         $0, 0x22C($sp)
/* 9CC58 0019CB58 48A8050C */  jal        EdCheckViewMode__Fv
/* 9CC5C 0019CB5C 00000000 */   nop
/* 9CC60 0019CB60 AC92848F */  lw         $4, -0x6D54($gp)
/* 9CC64 0019CB64 282E0070 */  paddub     $5, $0, $0
/* 9CC68 0019CB68 28364070 */  paddub     $6, $2, $0
/* 9CC6C 0019CB6C 2C02A727 */  addiu      $7, $sp, 0x22C
/* 9CC70 0019CB70 2464060C */  jal        EdTalkMode__FP10CCharacterP13CCameraFollowiPi
/* 9CC74 0019CB74 00000000 */   nop
/* 9CC78 0019CB78 86004010 */  beqz       $2, .L0019CD94
/* 9CC7C 0019CB7C 00000000 */   nop
/* 9CC80 0019CB80 02000324 */  addiu      $3, $0, 0x2
/* 9CC84 0019CB84 03004314 */  bne        $2, $3, .L0019CB94
/* 9CC88 0019CB88 00000000 */   nop
/* 9CC8C 0019CB8C 03000324 */  addiu      $3, $0, 0x3
/* 9CC90 0019CB90 D09283AF */  sw         $3, -0x6D30($gp)
.L0019CB94:
/* 9CC94 0019CB94 03000324 */  addiu      $3, $0, 0x3
/* 9CC98 0019CB98 03004314 */  bne        $2, $3, .L0019CBA8
/* 9CC9C 0019CB9C 00000000 */   nop
/* 9CCA0 0019CBA0 04000324 */  addiu      $3, $0, 0x4
/* 9CCA4 0019CBA4 D09283AF */  sw         $3, -0x6D30($gp)
.L0019CBA8:
/* 9CCA8 0019CBA8 04000324 */  addiu      $3, $0, 0x4
/* 9CCAC 0019CBAC 07004314 */  bne        $2, $3, .L0019CBCC
/* 9CCB0 0019CBB0 00000000 */   nop
/* 9CCB4 0019CBB4 2C02A48F */  lw         $4, 0x22C($sp)
/* 9CCB8 0019CBB8 04008018 */  blez       $4, .L0019CBCC
/* 9CCBC 0019CBBC 00000000 */   nop
/* 9CCC0 0019CBC0 A892858F */  lw         $5, -0x6D58($gp)
/* 9CCC4 0019CBC4 106F060C */  jal        RunEvent__FiP7CCamera_2
/* 9CCC8 0019CBC8 00000000 */   nop
.L0019CBCC:
/* 9CCCC 0019CBCC 949280AF */  sw         $0, -0x6D6C($gp)
/* 9CCD0 0019CBD0 70000010 */  b          .L0019CD94
/* 9CCD4 0019CBD4 00000000 */   nop
/* 9CCD8 0019CBD8 AC92838F */  lw         $3, -0x6D54($gp)
/* 9CCDC 0019CBDC 680C628C */  lw         $2, 0xC68($3)
/* 9CCE0 0019CBE0 680C62AC */  sw         $2, 0xC68($3)
/* 9CCE4 0019CBE4 01000224 */  addiu      $2, $0, 0x1
/* 9CCE8 0019CBE8 640C62AC */  sw         $2, 0xC64($3)
/* 9CCEC 0019CBEC 80BF023C */  lui        $2, (0xBF800000 >> 16)
/* 9CCF0 0019CBF0 600C62AC */  sw         $2, 0xC60($3)
/* 9CCF4 0019CBF4 AC92848F */  lw         $4, -0x6D54($gp)
/* 9CCF8 0019CBF8 A000998C */  lw         $25, 0xA0($4)
/* 9CCFC 0019CBFC 0800398F */  lw         $25, 0x8($25)
/* 9CD00 0019CC00 09F82003 */  jalr       $25
/* 9CD04 0019CC04 00000000 */   nop
/* 9CD08 0019CC08 AC92848F */  lw         $4, -0x6D54($gp)
/* 9CD0C 0019CC0C A000998C */  lw         $25, 0xA0($4)
/* 9CD10 0019CC10 9000398F */  lw         $25, 0x90($25)
/* 9CD14 0019CC14 09F82003 */  jalr       $25
/* 9CD18 0019CC18 00000000 */   nop
/* 9CD1C 0019CC1C 28860070 */  paddub     $16, $0, $0
/* 9CD20 0019CC20 1F000010 */  b          .L0019CCA0
/* 9CD24 0019CC24 00000000 */   nop
.L0019CC28:
/* 9CD28 0019CC28 40111000 */  sll        $2, $16, 5
/* 9CD2C 0019CC2C 21185000 */  addu       $3, $2, $16
/* 9CD30 0019CC30 80100300 */  sll        $2, $3, 2
/* 9CD34 0019CC34 21106200 */  addu       $2, $3, $2
/* 9CD38 0019CC38 40210200 */  sll        $4, $2, 5
/* 9CD3C 0019CC3C D201023C */  lui        $2, %hi(D_1D267F8)
/* 9CD40 0019CC40 F8674224 */  addiu      $2, $2, %lo(D_1D267F8)
/* 9CD44 0019CC44 21184400 */  addu       $3, $2, $4
/* 9CD48 0019CC48 0000628C */  lw         $2, 0x0($3)
/* 9CD4C 0019CC4C 000062AC */  sw         $2, 0x0($3)
/* 9CD50 0019CC50 01000324 */  addiu      $3, $0, 0x1
/* 9CD54 0019CC54 D201023C */  lui        $2, %hi(D_1D267F4)
/* 9CD58 0019CC58 F4674224 */  addiu      $2, $2, %lo(D_1D267F4)
/* 9CD5C 0019CC5C 21104400 */  addu       $2, $2, $4
/* 9CD60 0019CC60 000043AC */  sw         $3, 0x0($2)
/* 9CD64 0019CC64 80BF033C */  lui        $3, (0xBF800000 >> 16)
/* 9CD68 0019CC68 D201023C */  lui        $2, %hi(D_1D267F0)
/* 9CD6C 0019CC6C F0674224 */  addiu      $2, $2, %lo(D_1D267F0)
/* 9CD70 0019CC70 21104400 */  addu       $2, $2, $4
/* 9CD74 0019CC74 000043AC */  sw         $3, 0x0($2)
/* 9CD78 0019CC78 D201023C */  lui        $2, %hi(EdVillager)
/* 9CD7C 0019CC7C 905B4224 */  addiu      $2, $2, %lo(EdVillager)
/* 9CD80 0019CC80 21884400 */  addu       $17, $2, $4
/* 9CD84 0019CC84 28262072 */  paddub     $4, $17, $0
/* 9CD88 0019CC88 EC57050C */  jal        Step__12CNPCharacterFv
/* 9CD8C 0019CC8C 00000000 */   nop
/* 9CD90 0019CC90 28262072 */  paddub     $4, $17, $0
/* 9CD94 0019CC94 3C58050C */  jal        ShadowStep__12CNPCharacterFv
/* 9CD98 0019CC98 00000000 */   nop
/* 9CD9C 0019CC9C 01001026 */  addiu      $16, $16, 0x1
.L0019CCA0:
/* 9CDA0 0019CCA0 0A00022A */  slti       $2, $16, 0xA
/* 9CDA4 0019CCA4 E0FF4014 */  bnez       $2, .L0019CC28
/* 9CDA8 0019CCA8 00000000 */   nop
/* 9CDAC 0019CCAC 39000010 */  b          .L0019CD94
/* 9CDB0 0019CCB0 00000000 */   nop
/* 9CDB4 0019CCB4 FFFF0224 */  addiu      $2, $0, -0x1
/* 9CDB8 0019CCB8 CC9482AF */  sw         $2, -0x6B34($gp)
/* 9CDBC 0019CCBC E0CB050C */  jal        EdMenuMode__Fv
/* 9CDC0 0019CCC0 00000000 */   nop
/* 9CDC4 0019CCC4 33004010 */  beqz       $2, .L0019CD94
/* 9CDC8 0019CCC8 00000000 */   nop
/* 9CDCC 0019CCCC 949280AF */  sw         $0, -0x6D6C($gp)
/* 9CDD0 0019CCD0 CCCB050C */  jal        EdExitMenu__Fv
/* 9CDD4 0019CCD4 00000000 */   nop
/* 9CDD8 0019CCD8 F4CF070C */  jal        GetInteriorOutFlag__Fv
/* 9CDDC 0019CCDC 00000000 */   nop
/* 9CDE0 0019CCE0 06004010 */  beqz       $2, .L0019CCFC
/* 9CDE4 0019CCE4 00000000 */   nop
/* 9CDE8 0019CCE8 60A7050C */  jal        EdViewModeOff__Fv
/* 9CDEC 0019CCEC 00000000 */   nop
/* 9CDF0 0019CCF0 01000224 */  addiu      $2, $0, 0x1
/* 9CDF4 0019CCF4 69010010 */  b          .L0019D29C
/* 9CDF8 0019CCF8 00000000 */   nop
.L0019CCFC:
/* 9CDFC 0019CCFC 28860070 */  paddub     $16, $0, $0
/* 9CE00 0019CD00 1E000010 */  b          .L0019CD7C
/* 9CE04 0019CD04 00000000 */   nop
.L0019CD08:
/* 9CE08 0019CD08 40111000 */  sll        $2, $16, 5
/* 9CE0C 0019CD0C 21185000 */  addu       $3, $2, $16
/* 9CE10 0019CD10 80100300 */  sll        $2, $3, 2
/* 9CE14 0019CD14 21106200 */  addu       $2, $3, $2
/* 9CE18 0019CD18 40210200 */  sll        $4, $2, 5
/* 9CE1C 0019CD1C D201023C */  lui        $2, %hi(D_1D267F8)
/* 9CE20 0019CD20 F8674224 */  addiu      $2, $2, %lo(D_1D267F8)
/* 9CE24 0019CD24 21184400 */  addu       $3, $2, $4
/* 9CE28 0019CD28 0000628C */  lw         $2, 0x0($3)
/* 9CE2C 0019CD2C 000062AC */  sw         $2, 0x0($3)
/* 9CE30 0019CD30 D201023C */  lui        $2, %hi(D_1D267F4)
/* 9CE34 0019CD34 F4674224 */  addiu      $2, $2, %lo(D_1D267F4)
/* 9CE38 0019CD38 21104400 */  addu       $2, $2, $4
/* 9CE3C 0019CD3C 000040AC */  sw         $0, 0x0($2)
/* 9CE40 0019CD40 80BF033C */  lui        $3, (0xBF800000 >> 16)
/* 9CE44 0019CD44 D201023C */  lui        $2, %hi(D_1D267F0)
/* 9CE48 0019CD48 F0674224 */  addiu      $2, $2, %lo(D_1D267F0)
/* 9CE4C 0019CD4C 21104400 */  addu       $2, $2, $4
/* 9CE50 0019CD50 000043AC */  sw         $3, 0x0($2)
/* 9CE54 0019CD54 D201023C */  lui        $2, %hi(EdVillager)
/* 9CE58 0019CD58 905B4224 */  addiu      $2, $2, %lo(EdVillager)
/* 9CE5C 0019CD5C 21884400 */  addu       $17, $2, $4
/* 9CE60 0019CD60 28262072 */  paddub     $4, $17, $0
/* 9CE64 0019CD64 EC57050C */  jal        Step__12CNPCharacterFv
/* 9CE68 0019CD68 00000000 */   nop
/* 9CE6C 0019CD6C 28262072 */  paddub     $4, $17, $0
/* 9CE70 0019CD70 3C58050C */  jal        ShadowStep__12CNPCharacterFv
/* 9CE74 0019CD74 00000000 */   nop
/* 9CE78 0019CD78 01001026 */  addiu      $16, $16, 0x1
.L0019CD7C:
/* 9CE7C 0019CD7C 0A00022A */  slti       $2, $16, 0xA
/* 9CE80 0019CD80 E1FF4014 */  bnez       $2, .L0019CD08
/* 9CE84 0019CD84 00000000 */   nop
/* 9CE88 0019CD88 28160070 */  paddub     $2, $0, $0
/* 9CE8C 0019CD8C 43010010 */  b          .L0019D29C
/* 9CE90 0019CD90 00000000 */   nop
.L0019CD94:
/* 9CE94 0019CD94 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 9CE98 0019CD98 F0D4228C */  lw         $2, -0x2B10($at)
/* 9CE9C 0019CD9C 0B004010 */  beqz       $2, .L0019CDCC
/* 9CEA0 0019CDA0 00000000 */   nop
/* 9CEA4 0019CDA4 D401023C */  lui        $2, %hi(D_1D3D500)
/* 9CEA8 0019CDA8 00D54424 */  addiu      $4, $2, %lo(D_1D3D500)
/* 9CEAC 0019CDAC D401023C */  lui        $2, %hi(D_1D3D540)
/* 9CEB0 0019CDB0 40D54524 */  addiu      $5, $2, %lo(D_1D3D540)
/* 9CEB4 0019CDB4 08B7040C */  jal        MGSetPLight__FPA4_fPA4_f
/* 9CEB8 0019CDB8 00000000 */   nop
/* 9CEBC 0019CDBC D401023C */  lui        $2, %hi(D_1D3D580)
/* 9CEC0 0019CDC0 80D54424 */  addiu      $4, $2, %lo(D_1D3D580)
/* 9CEC4 0019CDC4 40B7040C */  jal        MGSetAmbient__FPf
/* 9CEC8 0019CDC8 00000000 */   nop
.L0019CDCC:
/* 9CECC 0019CDCC A892848F */  lw         $4, -0x6D58($gp)
/* 9CED0 0019CDD0 01000524 */  addiu      $5, $0, 0x1
/* 9CED4 0019CDD4 B802998C */  lw         $25, 0x2B8($4)
/* 9CED8 0019CDD8 0800398F */  lw         $25, 0x8($25)
/* 9CEDC 0019CDDC 09F82003 */  jalr       $25
/* 9CEE0 0019CDE0 00000000 */   nop
/* 9CEE4 0019CDE4 A892848F */  lw         $4, -0x6D58($gp)
/* 9CEE8 0019CDE8 4000A527 */  addiu      $5, $sp, 0x40
/* 9CEEC 0019CDEC F890040C */  jal        GetCameraMatrix__7CCameraFPA4_f
/* 9CEF0 0019CDF0 00000000 */   nop
/* 9CEF4 0019CDF4 A892848F */  lw         $4, -0x6D58($gp)
/* 9CEF8 0019CDF8 E000A527 */  addiu      $5, $sp, 0xE0
/* 9CEFC 0019CDFC 9C91040C */  jal        GetPos__7CCameraFPf
/* 9CF00 0019CE00 00000000 */   nop
/* 9CF04 0019CE04 A892848F */  lw         $4, -0x6D58($gp)
/* 9CF08 0019CE08 F000A527 */  addiu      $5, $sp, 0xF0
/* 9CF0C 0019CE0C E890040C */  jal        GetDir__7CCameraFPf
/* 9CF10 0019CE10 00000000 */   nop
/* 9CF14 0019CE14 4000A427 */  addiu      $4, $sp, 0x40
/* 9CF18 0019CE18 E000A527 */  addiu      $5, $sp, 0xE0
/* 9CF1C 0019CE1C E8B7040C */  jal        MGSetViewMatrix__FPA4_fPf
/* 9CF20 0019CE20 00000000 */   nop
/* 9CF24 0019CE24 28260070 */  paddub     $4, $0, $0
/* 9CF28 0019CE28 0D000010 */  b          .L0019CE60
/* 9CF2C 0019CE2C 00000000 */   nop
.L0019CE30:
/* 9CF30 0019CE30 C0100400 */  sll        $2, $4, 3
/* 9CF34 0019CE34 23184400 */  subu       $3, $2, $4
/* 9CF38 0019CE38 80100300 */  sll        $2, $3, 2
/* 9CF3C 0019CE3C 23104300 */  subu       $2, $2, $3
/* 9CF40 0019CE40 40190200 */  sll        $3, $2, 5
/* 9CF44 0019CE44 D501023C */  lui        $2, %hi(InteriorParts)
/* 9CF48 0019CE48 F0D54224 */  addiu      $2, $2, %lo(InteriorParts)
/* 9CF4C 0019CE4C 21184300 */  addu       $3, $2, $3
/* 9CF50 0019CE50 80100400 */  sll        $2, $4, 2
/* 9CF54 0019CE54 21105D00 */  addu       $2, $2, $sp
/* 9CF58 0019CE58 000143AC */  sw         $3, 0x100($2)
/* 9CF5C 0019CE5C 01008424 */  addiu      $4, $4, 0x1
.L0019CE60:
/* 9CF60 0019CE60 BC92858F */  lw         $5, -0x6D44($gp)
/* 9CF64 0019CE64 2A108500 */  slt        $2, $4, $5
/* 9CF68 0019CE68 F1FF4014 */  bnez       $2, .L0019CE30
/* 9CF6C 0019CE6C 00000000 */   nop
/* 9CF70 0019CE70 B0928CC7 */  lwc1       $f12, -0x6D50($gp)
/* 9CF74 0019CE74 0001A427 */  addiu      $4, $sp, 0x100
/* 9CF78 0019CE78 E000A627 */  addiu      $6, $sp, 0xE0
/* 9CF7C 0019CE7C F000A727 */  addiu      $7, $sp, 0xF0
/* 9CF80 0019CE80 48C7050C */  jal        EdSetSoundSrcVol__FfPP9CMapPartsiPfPf
/* 9CF84 0019CE84 00000000 */   nop
/* 9CF88 0019CE88 9492838F */  lw         $3, -0x6D6C($gp)
/* 9CF8C 0019CE8C 07000224 */  addiu      $2, $0, 0x7
/* 9CF90 0019CE90 05006210 */  beq        $3, $2, .L0019CEA8
/* 9CF94 0019CE94 00000000 */   nop
/* 9CF98 0019CE98 B474060C */  jal        MainDraw__Fv_2
/* 9CF9C 0019CE9C 00000000 */   nop
/* 9CFA0 0019CEA0 03000010 */  b          .L0019CEB0
/* 9CFA4 0019CEA4 00000000 */   nop
.L0019CEA8:
/* 9CFA8 0019CEA8 1826060C */  jal        EdFadeInOut__Fv
/* 9CFAC 0019CEAC 00000000 */   nop
.L0019CEB0:
/* 9CFB0 0019CEB0 9492838F */  lw         $3, -0x6D6C($gp)
/* 9CFB4 0019CEB4 06000224 */  addiu      $2, $0, 0x6
/* 9CFB8 0019CEB8 10006214 */  bne        $3, $2, .L0019CEFC
/* 9CFBC 0019CEBC 00000000 */   nop
/* 9CFC0 0019CEC0 C701023C */  lui        $2, %hi(TexManager)
/* 9CFC4 0019CEC4 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 9CFC8 0019CEC8 2A00023C */  lui        $2, %hi(_891_2)
/* 9CFCC 0019CECC D0B24524 */  addiu      $5, $2, %lo(_891_2)
/* 9CFD0 0019CED0 FFFF0624 */  addiu      $6, $0, -0x1
/* 9CFD4 0019CED4 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 9CFD8 0019CED8 00000000 */   nop
/* 9CFDC 0019CEDC A892848F */  lw         $4, -0x6D58($gp)
/* 9CFE0 0019CEE0 282E4070 */  paddub     $5, $2, $0
/* 9CFE4 0019CEE4 4CCB050C */  jal        EdInitModeFinish__FP7CCameraP8CTexture
/* 9CFE8 0019CEE8 00000000 */   nop
/* 9CFEC 0019CEEC 03004010 */  beqz       $2, .L0019CEFC
/* 9CFF0 0019CEF0 00000000 */   nop
/* 9CFF4 0019CEF4 07000224 */  addiu      $2, $0, 0x7
/* 9CFF8 0019CEF8 949282AF */  sw         $2, -0x6D6C($gp)
.L0019CEFC:
/* 9CFFC 0019CEFC 9CCF050C */  jal        EdSaveFrameImageTask__Fv
/* 9D000 0019CF00 00000000 */   nop
/* 9D004 0019CF04 9492828F */  lw         $2, -0x6D6C($gp)
/* 9D008 0019CF08 2C004014 */  bnez       $2, .L0019CFBC
/* 9D00C 0019CF0C 00000000 */   nop
/* 9D010 0019CF10 10000424 */  addiu      $4, $0, 0x10
/* 9D014 0019CF14 01000524 */  addiu      $5, $0, 0x1
/* 9D018 0019CF18 64A6050C */  jal        EdPadDown__Fii
/* 9D01C 0019CF1C 00000000 */   nop
/* 9D020 0019CF20 05004010 */  beqz       $2, .L0019CF38
/* 9D024 0019CF24 00000000 */   nop
/* 9D028 0019CF28 DC92828F */  lw         $2, -0x6D24($gp)
/* 9D02C 0019CF2C 02004128 */  slti       $at, $2, 0x2
/* 9D030 0019CF30 0C002010 */  beqz       $at, .L0019CF64
/* 9D034 0019CF34 00000000 */   nop
.L0019CF38:
/* 9D038 0019CF38 D092828F */  lw         $2, -0x6D30($gp)
/* 9D03C 0019CF3C 09004014 */  bnez       $2, .L0019CF64
/* 9D040 0019CF40 00000000 */   nop
/* 9D044 0019CF44 4480050C */  jal        SystemMesCheck__Fv
/* 9D048 0019CF48 00000000 */   nop
/* 9D04C 0019CF4C 1B004014 */  bnez       $2, .L0019CFBC
/* 9D050 0019CF50 00000000 */   nop
/* 9D054 0019CF54 84CC050C */  jal        EdCheckItemOver__Fv
/* 9D058 0019CF58 00000000 */   nop
/* 9D05C 0019CF5C 17004010 */  beqz       $2, .L0019CFBC
/* 9D060 0019CF60 00000000 */   nop
.L0019CF64:
/* 9D064 0019CF64 02001024 */  addiu      $16, $0, 0x2
/* 9D068 0019CF68 D092858F */  lw         $5, -0x6D30($gp)
/* 9D06C 0019CF6C 0700A010 */  beqz       $5, .L0019CF8C
/* 9D070 0019CF70 00000000 */   nop
/* 9D074 0019CF74 2886A070 */  paddub     $16, $5, $0
/* 9D078 0019CF78 D09280AF */  sw         $0, -0x6D30($gp)
/* 9D07C 0019CF7C 2A00023C */  lui        $2, %hi(_892_2)
/* 9D080 0019CF80 E0B24424 */  addiu      $4, $2, %lo(_892_2)
/* 9D084 0019CF84 A611040C */  jal        printf
/* 9D088 0019CF88 00000000 */   nop
.L0019CF8C:
/* 9D08C 0019CF8C 28260072 */  paddub     $4, $16, $0
/* 9D090 0019CF90 34CB050C */  jal        EdInitMenu__Fi
/* 9D094 0019CF94 00000000 */   nop
/* 9D098 0019CF98 08004010 */  beqz       $2, .L0019CFBC
/* 9D09C 0019CF9C 00000000 */   nop
/* 9D0A0 0019CFA0 01000424 */  addiu      $4, $0, 0x1
/* 9D0A4 0019CFA4 FFFF0524 */  addiu      $5, $0, -0x1
/* 9D0A8 0019CFA8 28360070 */  paddub     $6, $0, $0
/* 9D0AC 0019CFAC AC69050C */  jal        SndSePlay__Fiii
/* 9D0B0 0019CFB0 00000000 */   nop
/* 9D0B4 0019CFB4 06000224 */  addiu      $2, $0, 0x6
/* 9D0B8 0019CFB8 949282AF */  sw         $2, -0x6D6C($gp)
.L0019CFBC:
/* 9D0BC 0019CFBC E4928283 */  lb         $2, -0x6D1C($gp)
/* 9D0C0 0019CFC0 04004014 */  bnez       $2, .L0019CFD4
/* 9D0C4 0019CFC4 00000000 */   nop
/* 9D0C8 0019CFC8 E09280AF */  sw         $0, -0x6D20($gp)
/* 9D0CC 0019CFCC 01000224 */  addiu      $2, $0, 0x1
/* 9D0D0 0019CFD0 E49282A3 */  sb         $2, -0x6D1C($gp)
.L0019CFD4:
/* 9D0D4 0019CFD4 CC01023C */  lui        $2, %hi(GamePad)
/* 9D0D8 0019CFD8 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 9D0DC 0019CFDC 80000524 */  addiu      $5, $0, 0x80
/* 9D0E0 0019CFE0 2CAE040C */  jal        Down2__8CGamePadFi
/* 9D0E4 0019CFE4 00000000 */   nop
/* 9D0E8 0019CFE8 06004010 */  beqz       $2, .L0019D004
/* 9D0EC 0019CFEC 00000000 */   nop
/* 9D0F0 0019CFF0 04000224 */  addiu      $2, $0, 0x4
/* 9D0F4 0019CFF4 E09282AF */  sw         $2, -0x6D20($gp)
/* 9D0F8 0019CFF8 045E060C */  jal        EdEventAllClear__Fv
/* 9D0FC 0019CFFC 00000000 */   nop
/* 9D100 0019D000 149280AF */  sw         $0, -0x6DEC($gp)
.L0019D004:
/* 9D104 0019D004 E092828F */  lw         $2, -0x6D20($gp)
/* 9D108 0019D008 FFFF4224 */  addiu      $2, $2, -0x1
/* 9D10C 0019D00C E09282AF */  sw         $2, -0x6D20($gp)
/* 9D110 0019D010 E092828F */  lw         $2, -0x6D20($gp)
/* 9D114 0019D014 02004104 */  bgez       $2, .L0019D020
/* 9D118 0019D018 00000000 */   nop
/* 9D11C 0019D01C E09280AF */  sw         $0, -0x6D20($gp)
.L0019D020:
/* 9D120 0019D020 E092838F */  lw         $3, -0x6D20($gp)
/* 9D124 0019D024 01000224 */  addiu      $2, $0, 0x1
/* 9D128 0019D028 03006214 */  bne        $3, $2, .L0019D038
/* 9D12C 0019D02C 00000000 */   nop
/* 9D130 0019D030 96000224 */  addiu      $2, $0, 0x96
/* 9D134 0019D034 C89282AF */  sw         $2, -0x6D38($gp)
.L0019D038:
/* 9D138 0019D038 9492838F */  lw         $3, -0x6D6C($gp)
/* 9D13C 0019D03C 04000224 */  addiu      $2, $0, 0x4
/* 9D140 0019D040 09006210 */  beq        $3, $2, .L0019D068
/* 9D144 0019D044 00000000 */   nop
/* 9D148 0019D048 AC92838F */  lw         $3, -0x6D54($gp)
/* 9D14C 0019D04C D011628C */  lw         $2, 0x11D0($3)
/* 9D150 0019D050 05004010 */  beqz       $2, .L0019D068
/* 9D154 0019D054 00000000 */   nop
/* 9D158 0019D058 20126284 */  lh         $2, 0x1220($3)
/* 9D15C 0019D05C 02004018 */  blez       $2, .L0019D068
/* 9D160 0019D060 00000000 */   nop
/* 9D164 0019D064 C89282AF */  sw         $2, -0x6D38($gp)
.L0019D068:
/* 9D168 0019D068 3087828F */  lw         $2, -0x78D0($gp)
/* 9D16C 0019D06C 34004010 */  beqz       $2, .L0019D140
/* 9D170 0019D070 00000000 */   nop
/* 9D174 0019D074 C892838F */  lw         $3, -0x6D38($gp)
/* 9D178 0019D078 0400601C */  bgtz       $3, .L0019D08C
/* 9D17C 0019D07C 00000000 */   nop
/* 9D180 0019D080 CC92828F */  lw         $2, -0x6D34($gp)
/* 9D184 0019D084 2E004018 */  blez       $2, .L0019D140
/* 9D188 0019D088 00000000 */   nop
.L0019D08C:
/* 9D18C 0019D08C CC92848F */  lw         $4, -0x6D34($gp)
/* 9D190 0019D090 0E008018 */  blez       $4, .L0019D0CC
/* 9D194 0019D094 00000000 */   nop
/* 9D198 0019D098 6890868F */  lw         $6, -0x6F98($gp)
/* 9D19C 0019D09C D201023C */  lui        $2, %hi(EdNPCBuffer)
/* 9D1A0 0019D0A0 50B34524 */  addiu      $5, $2, %lo(EdNPCBuffer)
/* 9D1A4 0019D0A4 EC5C060C */  jal        EdEventInit__FiP14CDataAlloc2_1_Pc
/* 9D1A8 0019D0A8 00000000 */   nop
/* 9D1AC 0019D0AC 1F004010 */  beqz       $2, .L0019D12C
/* 9D1B0 0019D0B0 00000000 */   nop
/* 9D1B4 0019D0B4 74E0050C */  jal        EdInitMesParam__Fv
/* 9D1B8 0019D0B8 00000000 */   nop
/* 9D1BC 0019D0BC 04000224 */  addiu      $2, $0, 0x4
/* 9D1C0 0019D0C0 949282AF */  sw         $2, -0x6D6C($gp)
/* 9D1C4 0019D0C4 19000010 */  b          .L0019D12C
/* 9D1C8 0019D0C8 00000000 */   nop
.L0019D0CC:
/* 9D1CC 0019D0CC 6490868F */  lw         $6, -0x6F9C($gp)
/* 9D1D0 0019D0D0 28266070 */  paddub     $4, $3, $0
/* 9D1D4 0019D0D4 D201023C */  lui        $2, %hi(EdNPCBuffer)
/* 9D1D8 0019D0D8 50B34524 */  addiu      $5, $2, %lo(EdNPCBuffer)
/* 9D1DC 0019D0DC EC5C060C */  jal        EdEventInit__FiP14CDataAlloc2_1_Pc
/* 9D1E0 0019D0E0 00000000 */   nop
/* 9D1E4 0019D0E4 07004010 */  beqz       $2, .L0019D104
/* 9D1E8 0019D0E8 00000000 */   nop
/* 9D1EC 0019D0EC 74E0050C */  jal        EdInitMesParam__Fv
/* 9D1F0 0019D0F0 00000000 */   nop
/* 9D1F4 0019D0F4 04000224 */  addiu      $2, $0, 0x4
/* 9D1F8 0019D0F8 949282AF */  sw         $2, -0x6D6C($gp)
/* 9D1FC 0019D0FC 0B000010 */  b          .L0019D12C
/* 9D200 0019D100 00000000 */   nop
.L0019D104:
/* 9D204 0019D104 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 9D208 0019D108 18D6238C */  lw         $3, -0x29E8($at)
/* 9D20C 0019D10C 09000224 */  addiu      $2, $0, 0x9
/* 9D210 0019D110 06006214 */  bne        $3, $2, .L0019D12C
/* 9D214 0019D114 00000000 */   nop
/* 9D218 0019D118 74E0050C */  jal        EdInitMesParam__Fv
/* 9D21C 0019D11C 00000000 */   nop
/* 9D220 0019D120 03000224 */  addiu      $2, $0, 0x3
/* 9D224 0019D124 949282AF */  sw         $2, -0x6D6C($gp)
/* 9D228 0019D128 149280AF */  sw         $0, -0x6DEC($gp)
.L0019D12C:
/* 9D22C 0019D12C FFFF0224 */  addiu      $2, $0, -0x1
/* 9D230 0019D130 C89282AF */  sw         $2, -0x6D38($gp)
/* 9D234 0019D134 CC9282AF */  sw         $2, -0x6D34($gp)
/* 9D238 0019D138 02000010 */  b          .L0019D144
/* 9D23C 0019D13C 00000000 */   nop
.L0019D140:
/* 9D240 0019D140 149280AF */  sw         $0, -0x6DEC($gp)
.L0019D144:
/* 9D244 0019D144 9492838F */  lw         $3, -0x6D6C($gp)
/* 9D248 0019D148 05000224 */  addiu      $2, $0, 0x5
/* 9D24C 0019D14C 13006214 */  bne        $3, $2, .L0019D19C
/* 9D250 0019D150 00000000 */   nop
/* 9D254 0019D154 CC01023C */  lui        $2, %hi(GamePad)
/* 9D258 0019D158 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 9D25C 0019D15C 00080524 */  addiu      $5, $0, 0x800
/* 9D260 0019D160 1CAE040C */  jal        Down__8CGamePadFi
/* 9D264 0019D164 00000000 */   nop
/* 9D268 0019D168 0C004010 */  beqz       $2, .L0019D19C
/* 9D26C 0019D16C 00000000 */   nop
/* 9D270 0019D170 E892828F */  lw         $2, -0x6D18($gp)
/* 9D274 0019D174 949282AF */  sw         $2, -0x6D6C($gp)
/* 9D278 0019D178 02000424 */  addiu      $4, $0, 0x2
/* 9D27C 0019D17C FFFF0524 */  addiu      $5, $0, -0x1
/* 9D280 0019D180 4428060C */  jal        EdSePlay__F11ED_SOUND_IDi
/* 9D284 0019D184 00000000 */   nop
/* 9D288 0019D188 01000424 */  addiu      $4, $0, 0x1
/* 9D28C 0019D18C C803050C */  jal        PlayTimeCountFlag__Fi
/* 9D290 0019D190 00000000 */   nop
/* 9D294 0019D194 18000010 */  b          .L0019D1F8
/* 9D298 0019D198 00000000 */   nop
.L0019D19C:
/* 9D29C 0019D19C 9492838F */  lw         $3, -0x6D6C($gp)
/* 9D2A0 0019D1A0 04000224 */  addiu      $2, $0, 0x4
/* 9D2A4 0019D1A4 14006210 */  beq        $3, $2, .L0019D1F8
/* 9D2A8 0019D1A8 00000000 */   nop
/* 9D2AC 0019D1AC D492828F */  lw         $2, -0x6D2C($gp)
/* 9D2B0 0019D1B0 11004010 */  beqz       $2, .L0019D1F8
/* 9D2B4 0019D1B4 00000000 */   nop
/* 9D2B8 0019D1B8 DC92828F */  lw         $2, -0x6D24($gp)
/* 9D2BC 0019D1BC 02004128 */  slti       $at, $2, 0x2
/* 9D2C0 0019D1C0 0D002014 */  bnez       $at, .L0019D1F8
/* 9D2C4 0019D1C4 00000000 */   nop
/* 9D2C8 0019D1C8 0B006014 */  bnez       $3, .L0019D1F8
/* 9D2CC 0019D1CC 00000000 */   nop
/* 9D2D0 0019D1D0 E89283AF */  sw         $3, -0x6D18($gp)
/* 9D2D4 0019D1D4 05000224 */  addiu      $2, $0, 0x5
/* 9D2D8 0019D1D8 949282AF */  sw         $2, -0x6D6C($gp)
/* 9D2DC 0019D1DC 01000424 */  addiu      $4, $0, 0x1
/* 9D2E0 0019D1E0 FFFF0524 */  addiu      $5, $0, -0x1
/* 9D2E4 0019D1E4 4428060C */  jal        EdSePlay__F11ED_SOUND_IDi
/* 9D2E8 0019D1E8 00000000 */   nop
/* 9D2EC 0019D1EC 28260070 */  paddub     $4, $0, $0
/* 9D2F0 0019D1F0 C803050C */  jal        PlayTimeCountFlag__Fi
/* 9D2F4 0019D1F4 00000000 */   nop
.L0019D1F8:
/* 9D2F8 0019D1F8 D49280AF */  sw         $0, -0x6D2C($gp)
/* 9D2FC 0019D1FC F0928283 */  lb         $2, -0x6D10($gp)
/* 9D300 0019D200 04004014 */  bnez       $2, .L0019D214
/* 9D304 0019D204 00000000 */   nop
/* 9D308 0019D208 EC9280AF */  sw         $0, -0x6D14($gp)
/* 9D30C 0019D20C 01000224 */  addiu      $2, $0, 0x1
/* 9D310 0019D210 F09282A3 */  sb         $2, -0x6D10($gp)
.L0019D214:
/* 9D314 0019D214 CC01023C */  lui        $2, %hi(GamePad)
/* 9D318 0019D218 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 9D31C 0019D21C 0CAD040C */  jal        AllOn__8CGamePadFv
/* 9D320 0019D220 00000000 */   nop
/* 9D324 0019D224 02004010 */  beqz       $2, .L0019D230
/* 9D328 0019D228 00000000 */   nop
/* 9D32C 0019D22C D89280AF */  sw         $0, -0x6D28($gp)
.L0019D230:
/* 9D330 0019D230 EC92838F */  lw         $3, -0x6D14($gp)
/* 9D334 0019D234 01000224 */  addiu      $2, $0, 0x1
/* 9D338 0019D238 09006214 */  bne        $3, $2, .L0019D260
/* 9D33C 0019D23C 00000000 */   nop
/* 9D340 0019D240 EC9280AF */  sw         $0, -0x6D14($gp)
/* 9D344 0019D244 20030424 */  addiu      $4, $0, 0x320
/* 9D348 0019D248 FFFF0524 */  addiu      $5, $0, -0x1
/* 9D34C 0019D24C 4C07050C */  jal        MapJump__Fii
/* 9D350 0019D250 00000000 */   nop
/* 9D354 0019D254 63000224 */  addiu      $2, $0, 0x63
/* 9D358 0019D258 10000010 */  b          .L0019D29C
/* 9D35C 0019D25C 00000000 */   nop
.L0019D260:
/* 9D360 0019D260 FFFF6224 */  addiu      $2, $3, -0x1
/* 9D364 0019D264 EC9282AF */  sw         $2, -0x6D14($gp)
/* 9D368 0019D268 EC92828F */  lw         $2, -0x6D14($gp)
/* 9D36C 0019D26C 02004104 */  bgez       $2, .L0019D278
/* 9D370 0019D270 00000000 */   nop
/* 9D374 0019D274 EC9280AF */  sw         $0, -0x6D14($gp)
.L0019D278:
/* 9D378 0019D278 D892828F */  lw         $2, -0x6D28($gp)
/* 9D37C 0019D27C 01004224 */  addiu      $2, $2, 0x1
/* 9D380 0019D280 D89282AF */  sw         $2, -0x6D28($gp)
/* 9D384 0019D284 DC92828F */  lw         $2, -0x6D24($gp)
/* 9D388 0019D288 01004224 */  addiu      $2, $2, 0x1
/* 9D38C 0019D28C DC9282AF */  sw         $2, -0x6D24($gp)
/* 9D390 0019D290 D464050C */  jal        SndStep__Fv
/* 9D394 0019D294 00000000 */   nop
/* 9D398 0019D298 28160070 */  paddub     $2, $0, $0
.L0019D29C:
/* 9D39C 0019D29C 3000BF7B */  lq         $31, 0x30($sp)
/* 9D3A0 0019D2A0 2000B17B */  lq         $17, 0x20($sp)
/* 9D3A4 0019D2A4 1000B07B */  lq         $16, 0x10($sp)
/* 9D3A8 0019D2A8 0C00B7C7 */  lwc1       $f23, 0xC($sp)
/* 9D3AC 0019D2AC 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* 9D3B0 0019D2B0 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* 9D3B4 0019D2B4 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 9D3B8 0019D2B8 3002BD27 */  addiu      $sp, $sp, 0x230
/* 9D3BC 0019D2BC 0800E003 */  jr         $31
/* 9D3C0 0019D2C0 00000000 */   nop
/* 9D3C4 0019D2C4 00000000 */  nop
/* 9D3C8 0019D2C8 00000000 */  nop
/* 9D3CC 0019D2CC 00000000 */  nop
