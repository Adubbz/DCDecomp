.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EditInLoop__Fv
/* 09C3B0 0019C2B0 D0FDBD27 */  addiu       $29, $29, -0x230
/* 09C3B4 0019C2B4 3000BF7F */  sq          $31, 0x30($29)
/* 09C3B8 0019C2B8 2000B17F */  sq          $17, 0x20($29)
/* 09C3BC 0019C2BC 1000B07F */  sq          $16, 0x10($29)
/* 09C3C0 0019C2C0 0C00B7E7 */  swc1        $f23, 0xC($29)
/* 09C3C4 0019C2C4 0800B6E7 */  swc1        $f22, 0x8($29)
/* 09C3C8 0019C2C8 0400B5E7 */  swc1        $f21, 0x4($29)
/* 09C3CC 0019C2CC 0000B4E7 */  swc1        $f20, 0x0($29)
/* 09C3D0 0019C2D0 90CD050C */  jal         EdSystemMesCheck__Fv
/* 09C3D4 0019C2D4 00000000 */   nop
/* 09C3D8 0019C2D8 05004014 */  bnez        $2, .L0019C2F0
/* 09C3DC 0019C2DC 00000000 */   nop
/* 09C3E0 0019C2E0 84CC050C */  jal         EdCheckItemOver__Fv
/* 09C3E4 0019C2E4 00000000 */   nop
/* 09C3E8 0019C2E8 06004010 */  beqz        $2, .L0019C304
/* 09C3EC 0019C2EC 00000000 */   nop
.L0019C2F0:
/* 09C3F0 0019C2F0 28260070 */  paddub      $4, $0, $0
/* 09C3F4 0019C2F4 FCA5050C */  jal         EdSetKeyMode__Fi
/* 09C3F8 0019C2F8 00000000 */   nop
/* 09C3FC 0019C2FC 04000010 */  b           .L0019C310
/* 09C400 0019C300 00000000 */   nop
.L0019C304:
/* 09C404 0019C304 FFFF0434 */  ori         $4, $0, 0xFFFF
/* 09C408 0019C308 FCA5050C */  jal         EdSetKeyMode__Fi
/* 09C40C 0019C30C 00000000 */   nop
.L0019C310:
/* 09C410 0019C310 00080424 */  addiu       $4, $0, 0x800
/* 09C414 0019C314 04000524 */  addiu       $5, $0, 0x4
/* 09C418 0019C318 64A6050C */  jal         EdPadDown__Fii
/* 09C41C 0019C31C 00000000 */   nop
/* 09C420 0019C320 03004010 */  beqz        $2, .L0019C330
/* 09C424 0019C324 00000000 */   nop
/* 09C428 0019C328 01000224 */  addiu       $2, $0, 0x1
/* 09C42C 0019C32C D49282AF */  sw          $2, -0x6D2C($28)
.L0019C330:
/* 09C430 0019C330 4040023C */  lui         $2, (0x40400000 >> 16)
/* 09C434 0019C334 00088244 */  mtc1        $2, $f1
/* 09C438 0019C338 B09280C7 */  lwc1        $f0, -0x6D50($28)
/* 09C43C 0019C33C 03030146 */  div.s       $f12, $f0, $f1
/* 09C440 0019C340 2C44040C */  jal         fptosi
/* 09C444 0019C344 00000000 */   nop
/* 09C448 0019C348 9492838F */  lw          $3, -0x6D6C($28)
/* 09C44C 0019C34C 0E000224 */  addiu       $2, $0, 0xE
/* 09C450 0019C350 1B006210 */  beq         $3, $2, .L0019C3C0
/* 09C454 0019C354 00000000 */   nop
/* 09C458 0019C358 48A8050C */  jal         EdCheckViewMode__Fv
/* 09C45C 0019C35C 00000000 */   nop
/* 09C460 0019C360 0D004014 */  bnez        $2, .L0019C398
/* 09C464 0019C364 00000000 */   nop
/* 09C468 0019C368 A040023C */  lui         $2, (0x40A00000 >> 16)
/* 09C46C 0019C36C 00688244 */  mtc1        $2, $f13
/* 09C470 0019C370 FFFF0234 */  ori         $2, $0, 0xFFFF
/* 09C474 0019C374 00008244 */  mtc1        $2, $f0
/* 09C478 0019C378 00000000 */  nop
/* 09C47C 0019C37C A0038046 */  cvt.s.w     $f14, $f0
/* 09C480 0019C380 9092828F */  lw          $2, -0x6D70($28)
/* 09C484 0019C384 C0044CC4 */  lwc1        $f12, 0x4C0($2)
/* 09C488 0019C388 B8B5040C */  jal         MGSetRenderInfo__Ffff
/* 09C48C 0019C38C 00000000 */   nop
/* 09C490 0019C390 0B000010 */  b           .L0019C3C0
/* 09C494 0019C394 00000000 */   nop
.L0019C398:
/* 09C498 0019C398 1644023C */  lui         $2, (0x44160000 >> 16)
/* 09C49C 0019C39C 00608244 */  mtc1        $2, $f12
/* 09C4A0 0019C3A0 8040023C */  lui         $2, (0x40800000 >> 16)
/* 09C4A4 0019C3A4 00688244 */  mtc1        $2, $f13
/* 09C4A8 0019C3A8 FFFF0234 */  ori         $2, $0, 0xFFFF
/* 09C4AC 0019C3AC 00008244 */  mtc1        $2, $f0
/* 09C4B0 0019C3B0 00000000 */  nop
/* 09C4B4 0019C3B4 A0038046 */  cvt.s.w     $f14, $f0
/* 09C4B8 0019C3B8 B8B5040C */  jal         MGSetRenderInfo__Ffff
/* 09C4BC 0019C3BC 00000000 */   nop
.L0019C3C0:
/* 09C4C0 0019C3C0 AC92848F */  lw          $4, -0x6D54($28)
/* 09C4C4 0019C3C4 8000A527 */  addiu       $5, $29, 0x80
/* 09C4C8 0019C3C8 A000998C */  lw          $25, 0xA0($4)
/* 09C4CC 0019C3CC A000398F */  lw          $25, 0xA0($25)
/* 09C4D0 0019C3D0 09F82003 */  jalr        $25
/* 09C4D4 0019C3D4 00000000 */   nop
/* 09C4D8 0019C3D8 9492838F */  lw          $3, -0x6D6C($28)
/* 09C4DC 0019C3DC 05000224 */  addiu       $2, $0, 0x5
/* 09C4E0 0019C3E0 20006210 */  beq         $3, $2, .L0019C464
/* 09C4E4 0019C3E4 00000000 */   nop
/* 09C4E8 0019C3E8 07000224 */  addiu       $2, $0, 0x7
/* 09C4EC 0019C3EC 1D006210 */  beq         $3, $2, .L0019C464
/* 09C4F0 0019C3F0 00000000 */   nop
/* 09C4F4 0019C3F4 06000224 */  addiu       $2, $0, 0x6
/* 09C4F8 0019C3F8 1A006210 */  beq         $3, $2, .L0019C464
/* 09C4FC 0019C3FC 00000000 */   nop
/* 09C500 0019C400 01000010 */  b           .L0019C408
/* 09C504 0019C404 00000000 */   nop
.L0019C408:
/* 09C508 0019C408 9092828F */  lw          $2, -0x6D70($28)
/* 09C50C 0019C40C 300B5124 */  addiu       $17, $2, 0xB30
/* 09C510 0019C410 28860070 */  paddub      $16, $0, $0
/* 09C514 0019C414 0D000010 */  b           .L0019C44C
/* 09C518 0019C418 00000000 */   nop
.L0019C41C:
/* 09C51C 0019C41C 8800248E */  lw          $4, 0x88($17)
/* 09C520 0019C420 05008018 */  blez        $4, .L0019C438
/* 09C524 0019C424 00000000 */   nop
/* 09C528 0019C428 14E0050C */  jal         EdGetMapFlag__Fi
/* 09C52C 0019C42C 00000000 */   nop
/* 09C530 0019C430 04004014 */  bnez        $2, .L0019C444
/* 09C534 0019C434 00000000 */   nop
.L0019C438:
/* 09C538 0019C438 28262072 */  paddub      $4, $17, $0
/* 09C53C 0019C43C 7898050C */  jal         ObjAnimePlay__FP13OBJ_ANIME_SEQ
/* 09C540 0019C440 00000000 */   nop
.L0019C444:
/* 09C544 0019C444 01001026 */  addiu       $16, $16, 0x1
/* 09C548 0019C448 90003126 */  addiu       $17, $17, 0x90
.L0019C44C:
/* 09C54C 0019C44C B492828F */  lw          $2, -0x6D4C($28)
/* 09C550 0019C450 2A100202 */  slt         $2, $16, $2
/* 09C554 0019C454 F1FF4014 */  bnez        $2, .L0019C41C
/* 09C558 0019C458 00000000 */   nop
/* 09C55C 0019C45C B876060C */  jal         StepWater__Fv
/* 09C560 0019C460 00000000 */   nop
.L0019C464:
/* 09C564 0019C464 A087828F */  lw          $2, -0x7860($28)
/* 09C568 0019C468 0E004010 */  beqz        $2, .L0019C4A4
/* 09C56C 0019C46C 00000000 */   nop
/* 09C570 0019C470 A092828F */  lw          $2, -0x6D60($28)
/* 09C574 0019C474 0B004018 */  blez        $2, .L0019C4A4
/* 09C578 0019C478 00000000 */   nop
/* 09C57C 0019C47C 9492828F */  lw          $2, -0x6D6C($28)
/* 09C580 0019C480 08004014 */  bnez        $2, .L0019C4A4
/* 09C584 0019C484 00000000 */   nop
/* 09C588 0019C488 D501013C */  lui         $1, %hi(InteriorParts + 0xB0)
/* 09C58C 0019C48C A0D6248C */  lw          $4, %lo(InteriorParts + 0xB0)($1)
/* 09C590 0019C490 D501023C */  lui         $2, %hi(MainCamera__2)
/* 09C594 0019C494 B03A4524 */  addiu       $5, $2, %lo(MainCamera__2)
/* 09C598 0019C498 AC92868F */  lw          $6, -0x6D54($28)
/* 09C59C 0019C49C 4879060C */  jal         SetCameraPos__FP6CFrameP7CCameraP10CCharacter
/* 09C5A0 0019C4A0 00000000 */   nop
.L0019C4A4:
/* 09C5A4 0019C4A4 28260070 */  paddub      $4, $0, $0
/* 09C5A8 0019C4A8 F8F2050C */  jal         EdSetCharaCursor__Fi
/* 09C5AC 0019C4AC 00000000 */   nop
/* 09C5B0 0019C4B0 9492848F */  lw          $4, -0x6D6C($28)
/* 09C5B4 0019C4B4 0800812C */  sltiu       $1, $4, 0x8
/* 09C5B8 0019C4B8 36022010 */  beqz        $1, .L.L0019CD94$b
/* 09C5BC 0019C4BC 00000000 */   nop
/* 09C5C0 0019C4C0 2A00023C */  lui         $2, %hi(LIT_893__2)
/* 09C5C4 0019C4C4 F0B24324 */  addiu       $3, $2, %lo(LIT_893__2)
/* 09C5C8 0019C4C8 80100400 */  sll         $2, $4, 2
/* 09C5CC 0019C4CC 21104300 */  addu        $2, $2, $3
/* 09C5D0 0019C4D0 0000428C */  lw          $2, 0x0($2)
/* 09C5D4 0019C4D4 08004000 */  jr          $2
/* 09C5D8 0019C4D8 00000000 */   nop
jlabel .L0019C4DC
/* 09C5DC 0019C4DC DC92828F */  lw          $2, -0x6D24($28)
/* 09C5E0 0019C4E0 03004018 */  blez        $2, .L0019C4F0
/* 09C5E4 0019C4E4 00000000 */   nop
/* 09C5E8 0019C4E8 3C77060C */  jal         MoveCharacter__Fv
/* 09C5EC 0019C4EC 00000000 */   nop
.L0019C4F0:
/* 09C5F0 0019C4F0 01000424 */  addiu       $4, $0, 0x1
/* 09C5F4 0019C4F4 F8F2050C */  jal         EdSetCharaCursor__Fi
/* 09C5F8 0019C4F8 00000000 */   nop
/* 09C5FC 0019C4FC 28860070 */  paddub      $16, $0, $0
/* 09C600 0019C500 14000010 */  b           .L0019C554
/* 09C604 0019C504 00000000 */   nop
.L0019C508:
/* 09C608 0019C508 40111000 */  sll         $2, $16, 5
/* 09C60C 0019C50C 21185000 */  addu        $3, $2, $16
/* 09C610 0019C510 80100300 */  sll         $2, $3, 2
/* 09C614 0019C514 21106200 */  addu        $2, $3, $2
/* 09C618 0019C518 40190200 */  sll         $3, $2, 5
/* 09C61C 0019C51C D201023C */  lui         $2, %hi(EdVillager)
/* 09C620 0019C520 905B4224 */  addiu       $2, $2, %lo(EdVillager)
/* 09C624 0019C524 21884300 */  addu        $17, $2, $3
/* 09C628 0019C528 28262072 */  paddub      $4, $17, $0
/* 09C62C 0019C52C EC57050C */  jal         Step__12CNPCharacterFv
/* 09C630 0019C530 00000000 */   nop
/* 09C634 0019C534 28262072 */  paddub      $4, $17, $0
/* 09C638 0019C538 3C58050C */  jal         ShadowStep__12CNPCharacterFv
/* 09C63C 0019C53C 00000000 */   nop
/* 09C640 0019C540 28262072 */  paddub      $4, $17, $0
/* 09C644 0019C544 282E0070 */  paddub      $5, $0, $0
/* 09C648 0019C548 94E3040C */  jal         ClothStep__10CCharacterFi
/* 09C64C 0019C54C 00000000 */   nop
/* 09C650 0019C550 01001026 */  addiu       $16, $16, 0x1
.L0019C554:
/* 09C654 0019C554 0A00022A */  slti        $2, $16, 0xA
/* 09C658 0019C558 EBFF4014 */  bnez        $2, .L0019C508
/* 09C65C 0019C55C 00000000 */   nop
/* 09C660 0019C560 D501023C */  lui         $2, %hi(MainCamera__2)
/* 09C664 0019C564 B03A4224 */  addiu       $2, $2, %lo(MainCamera__2)
/* 09C668 0019C568 A89282AF */  sw          $2, -0x6D58($28)
/* 09C66C 0019C56C 48A8050C */  jal         EdCheckViewMode__Fv
/* 09C670 0019C570 00000000 */   nop
/* 09C674 0019C574 07024010 */  beqz        $2, .L.L0019CD94$b
/* 09C678 0019C578 00000000 */   nop
/* 09C67C 0019C57C D501023C */  lui         $2, %hi(ViewCamera__2)
/* 09C680 0019C580 B0434224 */  addiu       $2, $2, %lo(ViewCamera__2)
/* 09C684 0019C584 A89282AF */  sw          $2, -0x6D58($28)
/* 09C688 0019C588 02020010 */  b           .L.L0019CD94$b
/* 09C68C 0019C58C 00000000 */   nop
jlabel .L0019C590
/* 09C690 0019C590 D501023C */  lui         $2, %hi(EventCamera__2)
/* 09C694 0019C594 B0404224 */  addiu       $2, $2, %lo(EventCamera__2)
/* 09C698 0019C598 A89282AF */  sw          $2, -0x6D58($28)
/* 09C69C 0019C59C 0002A0AF */  sw          $0, 0x200($29)
/* 09C6A0 0019C5A0 0402A0AF */  sw          $0, 0x204($29)
/* 09C6A4 0019C5A4 0802A0AF */  sw          $0, 0x208($29)
/* 09C6A8 0019C5A8 AC92848F */  lw          $4, -0x6D54($28)
/* 09C6AC 0019C5AC 0002A527 */  addiu       $5, $29, 0x200
/* 09C6B0 0019C5B0 A000998C */  lw          $25, 0xA0($4)
/* 09C6B4 0019C5B4 1C00398F */  lw          $25, 0x1C($25)
/* 09C6B8 0019C5B8 09F82003 */  jalr        $25
/* 09C6BC 0019C5BC 00000000 */   nop
/* 09C6C0 0019C5C0 B09280C7 */  lwc1        $f0, -0x6D50($28)
/* 09C6C4 0019C5C4 D401013C */  lui         $1, %hi(EdEventInfo + 0x220)
/* 09C6C8 0019C5C8 F0D320E4 */  swc1        $f0, %lo(EdEventInfo + 0x220)($1)
/* 09C6CC 0019C5CC D501023C */  lui         $2, %hi(EventCamera__2)
/* 09C6D0 0019C5D0 B0404424 */  addiu       $4, $2, %lo(EventCamera__2)
/* 09C6D4 0019C5D4 282E0070 */  paddub      $5, $0, $0
/* 09C6D8 0019C5D8 B45E060C */  jal         EdEventMode__FP13CCameraFollowi
/* 09C6DC 0019C5DC 00000000 */   nop
/* 09C6E0 0019C5E0 3D004010 */  beqz        $2, .L0019C6D8
/* 09C6E4 0019C5E4 00000000 */   nop
/* 09C6E8 0019C5E8 949280AF */  sw          $0, -0x6D6C($28)
/* 09C6EC 0019C5EC D501033C */  lui         $3, %hi(MainCamera__2)
/* 09C6F0 0019C5F0 B03A6324 */  addiu       $3, $3, %lo(MainCamera__2)
/* 09C6F4 0019C5F4 A89283AF */  sw          $3, -0x6D58($28)
/* 09C6F8 0019C5F8 07000324 */  addiu       $3, $0, 0x7
/* 09C6FC 0019C5FC 12004314 */  bne         $2, $3, .L0019C648
/* 09C700 0019C600 00000000 */   nop
/* 09C704 0019C604 288D838F */  lw          $3, -0x72D8($28)
/* 09C708 0019C608 03000224 */  addiu       $2, $0, 0x3
/* 09C70C 0019C60C 0B006214 */  bne         $3, $2, .L0019C63C
/* 09C710 0019C610 00000000 */   nop
/* 09C714 0019C614 D201023C */  lui         $2, %hi(EdInteriorName)
/* 09C718 0019C618 00B54424 */  addiu       $4, $2, %lo(EdInteriorName)
/* 09C71C 0019C61C 2A00023C */  lui         $2, %hi(LIT_886__2)
/* 09C720 0019C620 C8B24524 */  addiu       $5, $2, %lo(LIT_886__2)
/* 09C724 0019C624 0815040C */  jal         strcmp
/* 09C728 0019C628 00000000 */   nop
/* 09C72C 0019C62C 03004014 */  bnez        $2, .L0019C63C
/* 09C730 0019C630 00000000 */   nop
/* 09C734 0019C634 FFFF0224 */  addiu       $2, $0, -0x1
/* 09C738 0019C638 389082AF */  sw          $2, -0x6FC8($28)
.L0019C63C:
/* 09C73C 0019C63C 01000224 */  addiu       $2, $0, 0x1
/* 09C740 0019C640 16030010 */  b           .L0019D29C
/* 09C744 0019C644 00000000 */   nop
.L0019C648:
/* 09C748 0019C648 08000324 */  addiu       $3, $0, 0x8
/* 09C74C 0019C64C 04004314 */  bne         $2, $3, .L0019C660
/* 09C750 0019C650 00000000 */   nop
/* 09C754 0019C654 63000224 */  addiu       $2, $0, 0x63
/* 09C758 0019C658 10030010 */  b           .L0019D29C
/* 09C75C 0019C65C 00000000 */   nop
.L0019C660:
/* 09C760 0019C660 09000324 */  addiu       $3, $0, 0x9
/* 09C764 0019C664 03004314 */  bne         $2, $3, .L0019C674
/* 09C768 0019C668 00000000 */   nop
/* 09C76C 0019C66C 03000224 */  addiu       $2, $0, 0x3
/* 09C770 0019C670 949282AF */  sw          $2, -0x6D6C($28)
.L0019C674:
/* 09C774 0019C674 D401013C */  lui         $1, %hi(EdEventInfo + 0x44)
/* 09C778 0019C678 14D2228C */  lw          $2, %lo(EdEventInfo + 0x44)($1)
/* 09C77C 0019C67C 15004104 */  bgez        $2, .L0019C6D4
/* 09C780 0019C680 00000000 */   nop
/* 09C784 0019C684 D501023C */  lui         $2, %hi(EventCamera__2)
/* 09C788 0019C688 B0404424 */  addiu       $4, $2, %lo(EventCamera__2)
/* 09C78C 0019C68C 9000A527 */  addiu       $5, $29, 0x90
/* 09C790 0019C690 9C91040C */  jal         GetPos__7CCameraFPf
/* 09C794 0019C694 00000000 */   nop
/* 09C798 0019C698 D501023C */  lui         $2, %hi(EventCamera__2)
/* 09C79C 0019C69C B0404424 */  addiu       $4, $2, %lo(EventCamera__2)
/* 09C7A0 0019C6A0 A000A527 */  addiu       $5, $29, 0xA0
/* 09C7A4 0019C6A4 A891040C */  jal         GetRef__7CCameraFPf
/* 09C7A8 0019C6A8 00000000 */   nop
/* 09C7AC 0019C6AC D501023C */  lui         $2, %hi(MainCamera__2)
/* 09C7B0 0019C6B0 B03A4424 */  addiu       $4, $2, %lo(MainCamera__2)
/* 09C7B4 0019C6B4 9000A527 */  addiu       $5, $29, 0x90
/* 09C7B8 0019C6B8 A490040C */  jal         SetPos__7CCameraFPf
/* 09C7BC 0019C6BC 00000000 */   nop
/* 09C7C0 0019C6C0 D501023C */  lui         $2, %hi(MainCamera__2)
/* 09C7C4 0019C6C4 B03A4424 */  addiu       $4, $2, %lo(MainCamera__2)
/* 09C7C8 0019C6C8 A000A527 */  addiu       $5, $29, 0xA0
/* 09C7CC 0019C6CC C490040C */  jal         SetRef__7CCameraFPf
/* 09C7D0 0019C6D0 00000000 */   nop
.L0019C6D4:
/* 09C7D4 0019C6D4 9C9280AF */  sw          $0, -0x6D64($28)
.L0019C6D8:
/* 09C7D8 0019C6D8 787A060C */  jal         VillagerCollision__Fv__2
/* 09C7DC 0019C6DC 00000000 */   nop
/* 09C7E0 0019C6E0 F461060C */  jal         EdEventNPCStep__Fv
/* 09C7E4 0019C6E4 00000000 */   nop
/* 09C7E8 0019C6E8 D49280AF */  sw          $0, -0x6D2C($28)
/* 09C7EC 0019C6EC A9010010 */  b           .L.L0019CD94$b
/* 09C7F0 0019C6F0 00000000 */   nop
jlabel .L0019C6F4
/* 09C7F4 0019C6F4 D501023C */  lui         $2, %hi(MainCamera__2)
/* 09C7F8 0019C6F8 B03A4224 */  addiu       $2, $2, %lo(MainCamera__2)
/* 09C7FC 0019C6FC A89282AF */  sw          $2, -0x6D58($28)
/* 09C800 0019C700 B000A0AF */  sw          $0, 0xB0($29)
/* 09C804 0019C704 B400A0AF */  sw          $0, 0xB4($29)
/* 09C808 0019C708 B800A0AF */  sw          $0, 0xB8($29)
/* 09C80C 0019C70C AC92848F */  lw          $4, -0x6D54($28)
/* 09C810 0019C710 B000A527 */  addiu       $5, $29, 0xB0
/* 09C814 0019C714 A000998C */  lw          $25, 0xA0($4)
/* 09C818 0019C718 1C00398F */  lw          $25, 0x1C($25)
/* 09C81C 0019C71C 09F82003 */  jalr        $25
/* 09C820 0019C720 00000000 */   nop
/* 09C824 0019C724 AC92848F */  lw          $4, -0x6D54($28)
/* 09C828 0019C728 A000998C */  lw          $25, 0xA0($4)
/* 09C82C 0019C72C 0800398F */  lw          $25, 0x8($25)
/* 09C830 0019C730 09F82003 */  jalr        $25
/* 09C834 0019C734 00000000 */   nop
/* 09C838 0019C738 AC92848F */  lw          $4, -0x6D54($28)
/* 09C83C 0019C73C A000998C */  lw          $25, 0xA0($4)
/* 09C840 0019C740 9000398F */  lw          $25, 0x90($25)
/* 09C844 0019C744 09F82003 */  jalr        $25
/* 09C848 0019C748 00000000 */   nop
/* 09C84C 0019C74C AC92848F */  lw          $4, -0x6D54($28)
/* 09C850 0019C750 D501023C */  lui         $2, %hi(fix_chara_pos__2)
/* 09C854 0019C754 D0D54524 */  addiu       $5, $2, %lo(fix_chara_pos__2)
/* 09C858 0019C758 A000998C */  lw          $25, 0xA0($4)
/* 09C85C 0019C75C 1400398F */  lw          $25, 0x14($25)
/* 09C860 0019C760 09F82003 */  jalr        $25
/* 09C864 0019C764 00000000 */   nop
/* 09C868 0019C768 AC92848F */  lw          $4, -0x6D54($28)
/* 09C86C 0019C76C D501013C */  lui         $1, %hi(fix_chara_rot__2)
/* 09C870 0019C770 E0D52CC4 */  lwc1        $f12, %lo(fix_chara_rot__2)($1)
/* 09C874 0019C774 D501013C */  lui         $1, %hi(fix_chara_rot__2 + 0x4)
/* 09C878 0019C778 E4D52DC4 */  lwc1        $f13, %lo(fix_chara_rot__2 + 0x4)($1)
/* 09C87C 0019C77C D501013C */  lui         $1, %hi(fix_chara_rot__2 + 0x8)
/* 09C880 0019C780 E8D52EC4 */  lwc1        $f14, %lo(fix_chara_rot__2 + 0x8)($1)
/* 09C884 0019C784 A000998C */  lw          $25, 0xA0($4)
/* 09C888 0019C788 3000398F */  lw          $25, 0x30($25)
/* 09C88C 0019C78C 09F82003 */  jalr        $25
/* 09C890 0019C790 00000000 */   nop
/* 09C894 0019C794 AC92848F */  lw          $4, -0x6D54($28)
/* 09C898 0019C798 282E0070 */  paddub      $5, $0, $0
/* 09C89C 0019C79C A000998C */  lw          $25, 0xA0($4)
/* 09C8A0 0019C7A0 9400398F */  lw          $25, 0x94($25)
/* 09C8A4 0019C7A4 09F82003 */  jalr        $25
/* 09C8A8 0019C7A8 00000000 */   nop
/* 09C8AC 0019C7AC 28860070 */  paddub      $16, $0, $0
/* 09C8B0 0019C7B0 14000010 */  b           .L0019C804
/* 09C8B4 0019C7B4 00000000 */   nop
.L0019C7B8:
/* 09C8B8 0019C7B8 40111000 */  sll         $2, $16, 5
/* 09C8BC 0019C7BC 21185000 */  addu        $3, $2, $16
/* 09C8C0 0019C7C0 80100300 */  sll         $2, $3, 2
/* 09C8C4 0019C7C4 21106200 */  addu        $2, $3, $2
/* 09C8C8 0019C7C8 40190200 */  sll         $3, $2, 5
/* 09C8CC 0019C7CC D201023C */  lui         $2, %hi(EdVillager)
/* 09C8D0 0019C7D0 905B4224 */  addiu       $2, $2, %lo(EdVillager)
/* 09C8D4 0019C7D4 21884300 */  addu        $17, $2, $3
/* 09C8D8 0019C7D8 28262072 */  paddub      $4, $17, $0
/* 09C8DC 0019C7DC EC57050C */  jal         Step__12CNPCharacterFv
/* 09C8E0 0019C7E0 00000000 */   nop
/* 09C8E4 0019C7E4 28262072 */  paddub      $4, $17, $0
/* 09C8E8 0019C7E8 3C58050C */  jal         ShadowStep__12CNPCharacterFv
/* 09C8EC 0019C7EC 00000000 */   nop
/* 09C8F0 0019C7F0 28262072 */  paddub      $4, $17, $0
/* 09C8F4 0019C7F4 282E0070 */  paddub      $5, $0, $0
/* 09C8F8 0019C7F8 94E3040C */  jal         ClothStep__10CCharacterFi
/* 09C8FC 0019C7FC 00000000 */   nop
/* 09C900 0019C800 01001026 */  addiu       $16, $16, 0x1
.L0019C804:
/* 09C904 0019C804 0A00022A */  slti        $2, $16, 0xA
/* 09C908 0019C808 EBFF4014 */  bnez        $2, .L0019C7B8
/* 09C90C 0019C80C 00000000 */   nop
/* 09C910 0019C810 A492828F */  lw          $2, -0x6D5C($28)
/* 09C914 0019C814 FFFF4224 */  addiu       $2, $2, -0x1
/* 09C918 0019C818 A49282AF */  sw          $2, -0x6D5C($28)
/* 09C91C 0019C81C A492838F */  lw          $3, -0x6D5C($28)
/* 09C920 0019C820 64000224 */  addiu       $2, $0, 0x64
/* 09C924 0019C824 0E006214 */  bne         $3, $2, .L0019C860
/* 09C928 0019C828 00000000 */   nop
/* 09C92C 0019C82C 3890828F */  lw          $2, -0x6FC8($28)
/* 09C930 0019C830 0B004004 */  bltz        $2, .L0019C860
/* 09C934 0019C834 00000000 */   nop
/* 09C938 0019C838 AC92848F */  lw          $4, -0x6D54($28)
/* 09C93C 0019C83C C000A527 */  addiu       $5, $29, 0xC0
/* 09C940 0019C840 A000998C */  lw          $25, 0xA0($4)
/* 09C944 0019C844 A000398F */  lw          $25, 0xA0($25)
/* 09C948 0019C848 09F82003 */  jalr        $25
/* 09C94C 0019C84C 00000000 */   nop
/* 09C950 0019C850 3890848F */  lw          $4, -0x6FC8($28)
/* 09C954 0019C854 C000A527 */  addiu       $5, $29, 0xC0
/* 09C958 0019C858 40C8050C */  jal         EdDoorOpenSe__FiPf
/* 09C95C 0019C85C 00000000 */   nop
.L0019C860:
/* 09C960 0019C860 A492828F */  lw          $2, -0x6D5C($28)
/* 09C964 0019C864 4B014104 */  bgez        $2, .L.L0019CD94$b
/* 09C968 0019C868 00000000 */   nop
/* 09C96C 0019C86C A49280AF */  sw          $0, -0x6D5C($28)
/* 09C970 0019C870 02000224 */  addiu       $2, $0, 0x2
/* 09C974 0019C874 949282AF */  sw          $2, -0x6D6C($28)
/* 09C978 0019C878 46010010 */  b           .L.L0019CD94$b
/* 09C97C 0019C87C 00000000 */   nop
jlabel .L0019C880
/* 09C980 0019C880 D501023C */  lui         $2, %hi(MainCamera__2)
/* 09C984 0019C884 B03A4224 */  addiu       $2, $2, %lo(MainCamera__2)
/* 09C988 0019C888 A89282AF */  sw          $2, -0x6D58($28)
/* 09C98C 0019C88C B4C6050C */  jal         EdStopSoundSrc__Fv
/* 09C990 0019C890 00000000 */   nop
/* 09C994 0019C894 D401013C */  lui         $1, %hi(EdEventInfo + 0x30)
/* 09C998 0019C898 00D2228C */  lw          $2, %lo(EdEventInfo + 0x30)($1)
/* 09C99C 0019C89C 05004010 */  beqz        $2, .L0019C8B4
/* 09C9A0 0019C8A0 00000000 */   nop
/* 09C9A4 0019C8A4 1467050C */  jal         SndBgmFadeOutStop__Fv
/* 09C9A8 0019C8A8 00000000 */   nop
/* 09C9AC 0019C8AC 03000010 */  b           .L0019C8BC
/* 09C9B0 0019C8B0 00000000 */   nop
.L0019C8B4:
/* 09C9B4 0019C8B4 FFFF0224 */  addiu       $2, $0, -0x1
/* 09C9B8 0019C8B8 409082AF */  sw          $2, -0x6FC0($28)
.L0019C8BC:
/* 09C9BC 0019C8BC 01000224 */  addiu       $2, $0, 0x1
/* 09C9C0 0019C8C0 76020010 */  b           .L0019D29C
/* 09C9C4 0019C8C4 00000000 */   nop
jlabel .L0019C8C8
/* 09C9C8 0019C8C8 D501023C */  lui         $2, %hi(MainCamera__2)
/* 09C9CC 0019C8CC B03A4224 */  addiu       $2, $2, %lo(MainCamera__2)
/* 09C9D0 0019C8D0 A89282AF */  sw          $2, -0x6D58($28)
/* 09C9D4 0019C8D4 48A8050C */  jal         EdCheckViewMode__Fv
/* 09C9D8 0019C8D8 00000000 */   nop
/* 09C9DC 0019C8DC 04004010 */  beqz        $2, .L0019C8F0
/* 09C9E0 0019C8E0 00000000 */   nop
/* 09C9E4 0019C8E4 D501023C */  lui         $2, %hi(ViewCamera__2)
/* 09C9E8 0019C8E8 B0434224 */  addiu       $2, $2, %lo(ViewCamera__2)
/* 09C9EC 0019C8EC A89282AF */  sw          $2, -0x6D58($28)
.L0019C8F0:
/* 09C9F0 0019C8F0 AC92838F */  lw          $3, -0x6D54($28)
/* 09C9F4 0019C8F4 680C60AC */  sw          $0, 0xC68($3)
/* 09C9F8 0019C8F8 640C60AC */  sw          $0, 0xC64($3)
/* 09C9FC 0019C8FC 80BF023C */  lui         $2, (0xBF800000 >> 16)
/* 09CA00 0019C900 600C62AC */  sw          $2, 0xC60($3)
/* 09CA04 0019C904 1002A0AF */  sw          $0, 0x210($29)
/* 09CA08 0019C908 1402A0AF */  sw          $0, 0x214($29)
/* 09CA0C 0019C90C 1802A0AF */  sw          $0, 0x218($29)
/* 09CA10 0019C910 AC92848F */  lw          $4, -0x6D54($28)
/* 09CA14 0019C914 1002A527 */  addiu       $5, $29, 0x210
/* 09CA18 0019C918 A000998C */  lw          $25, 0xA0($4)
/* 09CA1C 0019C91C 1C00398F */  lw          $25, 0x1C($25)
/* 09CA20 0019C920 09F82003 */  jalr        $25
/* 09CA24 0019C924 00000000 */   nop
/* 09CA28 0019C928 AC92848F */  lw          $4, -0x6D54($28)
/* 09CA2C 0019C92C A000998C */  lw          $25, 0xA0($4)
/* 09CA30 0019C930 0800398F */  lw          $25, 0x8($25)
/* 09CA34 0019C934 09F82003 */  jalr        $25
/* 09CA38 0019C938 00000000 */   nop
/* 09CA3C 0019C93C AC92848F */  lw          $4, -0x6D54($28)
/* 09CA40 0019C940 A000998C */  lw          $25, 0xA0($4)
/* 09CA44 0019C944 9000398F */  lw          $25, 0x90($25)
/* 09CA48 0019C948 09F82003 */  jalr        $25
/* 09CA4C 0019C94C 00000000 */   nop
/* 09CA50 0019C950 AC92848F */  lw          $4, -0x6D54($28)
/* 09CA54 0019C954 282E0070 */  paddub      $5, $0, $0
/* 09CA58 0019C958 A000998C */  lw          $25, 0xA0($4)
/* 09CA5C 0019C95C 9400398F */  lw          $25, 0x94($25)
/* 09CA60 0019C960 09F82003 */  jalr        $25
/* 09CA64 0019C964 00000000 */   nop
/* 09CA68 0019C968 28860070 */  paddub      $16, $0, $0
/* 09CA6C 0019C96C 14000010 */  b           .L0019C9C0
/* 09CA70 0019C970 00000000 */   nop
.L0019C974:
/* 09CA74 0019C974 40111000 */  sll         $2, $16, 5
/* 09CA78 0019C978 21185000 */  addu        $3, $2, $16
/* 09CA7C 0019C97C 80100300 */  sll         $2, $3, 2
/* 09CA80 0019C980 21106200 */  addu        $2, $3, $2
/* 09CA84 0019C984 40190200 */  sll         $3, $2, 5
/* 09CA88 0019C988 D201023C */  lui         $2, %hi(EdVillager)
/* 09CA8C 0019C98C 905B4224 */  addiu       $2, $2, %lo(EdVillager)
/* 09CA90 0019C990 21884300 */  addu        $17, $2, $3
/* 09CA94 0019C994 28262072 */  paddub      $4, $17, $0
/* 09CA98 0019C998 EC57050C */  jal         Step__12CNPCharacterFv
/* 09CA9C 0019C99C 00000000 */   nop
/* 09CAA0 0019C9A0 28262072 */  paddub      $4, $17, $0
/* 09CAA4 0019C9A4 3C58050C */  jal         ShadowStep__12CNPCharacterFv
/* 09CAA8 0019C9A8 00000000 */   nop
/* 09CAAC 0019C9AC 28262072 */  paddub      $4, $17, $0
/* 09CAB0 0019C9B0 282E0070 */  paddub      $5, $0, $0
/* 09CAB4 0019C9B4 94E3040C */  jal         ClothStep__10CCharacterFi
/* 09CAB8 0019C9B8 00000000 */   nop
/* 09CABC 0019C9BC 01001026 */  addiu       $16, $16, 0x1
.L0019C9C0:
/* 09CAC0 0019C9C0 0A00022A */  slti        $2, $16, 0xA
/* 09CAC4 0019C9C4 EBFF4014 */  bnez        $2, .L0019C974
/* 09CAC8 0019C9C8 00000000 */   nop
/* 09CACC 0019C9CC 1C64060C */  jal         EdNowTalkChara__Fv
/* 09CAD0 0019C9D0 00000000 */   nop
/* 09CAD4 0019C9D4 28864070 */  paddub      $16, $2, $0
/* 09CAD8 0019C9D8 AC92848F */  lw          $4, -0x6D54($28)
/* 09CADC 0019C9DC 282E0072 */  paddub      $5, $16, $0
/* 09CAE0 0019C9E0 EC5A050C */  jal         GetDistance__7CObjectFR7CObject
/* 09CAE4 0019C9E4 00000000 */   nop
/* 09CAE8 0019C9E8 06050046 */  mov.s       $f20, $f0
/* 09CAEC 0019C9EC AC92848F */  lw          $4, -0x6D54($28)
/* 09CAF0 0019C9F0 282E0072 */  paddub      $5, $16, $0
/* 09CAF4 0019C9F4 D000A627 */  addiu       $6, $29, 0xD0
/* 09CAF8 0019C9F8 045B050C */  jal         GetDir__7CObjectFR7CObjectPf
/* 09CAFC 0019C9FC 00000000 */   nop
/* 09CB00 0019CA00 B40001C6 */  lwc1        $f1, 0xB4($16)
/* 09CB04 0019CA04 D08180C7 */  lwc1        $f0, -0x7E30($28)
/* 09CB08 0019CA08 40000146 */  add.s       $f1, $f0, $f1
/* 09CB0C 0019CA0C D400A0C7 */  lwc1        $f0, 0xD4($29)
/* 09CB10 0019CA10 40080046 */  add.s       $f1, $f1, $f0
/* 09CB14 0019CA14 AC92828F */  lw          $2, -0x6D54($28)
/* 09CB18 0019CA18 B40040C4 */  lwc1        $f0, 0xB4($2)
/* 09CB1C 0019CA1C 07000046 */  neg.s       $f0, $f0
/* 09CB20 0019CA20 00030146 */  add.s       $f12, $f0, $f1
/* 09CB24 0019CA24 46A30046 */  mov.s       $f13, $f20
/* 09CB28 0019CA28 5077040C */  jal         atan2f
/* 09CB2C 0019CA2C 00000000 */   nop
/* 09CB30 0019CA30 07050046 */  neg.s       $f20, $f0
/* 09CB34 0019CA34 D000ACC7 */  lwc1        $f12, 0xD0($29)
/* 09CB38 0019CA38 D800ADC7 */  lwc1        $f13, 0xD8($29)
/* 09CB3C 0019CA3C 5077040C */  jal         atan2f
/* 09CB40 0019CA40 00000000 */   nop
/* 09CB44 0019CA44 46050046 */  mov.s       $f21, $f0
/* 09CB48 0019CA48 4CA8050C */  jal         EdAGetViewAngleH__Fv
/* 09CB4C 0019CA4C 00000000 */   nop
/* 09CB50 0019CA50 86050046 */  mov.s       $f22, $f0
/* 09CB54 0019CA54 50A8050C */  jal         EdAGetViewAngleV__Fv
/* 09CB58 0019CA58 00000000 */   nop
/* 09CB5C 0019CA5C C6050046 */  mov.s       $f23, $f0
/* 09CB60 0019CA60 06B30046 */  mov.s       $f12, $f22
/* 09CB64 0019CA64 46AB0046 */  mov.s       $f13, $f21
/* 09CB68 0019CA68 94828EC7 */  lwc1        $f14, -0x7D6C($28)
/* 09CB6C 0019CA6C 28260070 */  paddub      $4, $0, $0
/* 09CB70 0019CA70 748E040C */  jal         AngleInterpolate__Ffffi
/* 09CB74 0019CA74 00000000 */   nop
/* 09CB78 0019CA78 86050046 */  mov.s       $f22, $f0
/* 09CB7C 0019CA7C 06BB0046 */  mov.s       $f12, $f23
/* 09CB80 0019CA80 46A30046 */  mov.s       $f13, $f20
/* 09CB84 0019CA84 F0818EC7 */  lwc1        $f14, -0x7E10($28)
/* 09CB88 0019CA88 28260070 */  paddub      $4, $0, $0
/* 09CB8C 0019CA8C 748E040C */  jal         AngleInterpolate__Ffffi
/* 09CB90 0019CA90 00000000 */   nop
/* 09CB94 0019CA94 C6050046 */  mov.s       $f23, $f0
/* 09CB98 0019CA98 06B30046 */  mov.s       $f12, $f22
/* 09CB9C 0019CA9C 46BB0046 */  mov.s       $f13, $f23
/* 09CBA0 0019CAA0 54A8050C */  jal         EdASetViewAngle__Fff
/* 09CBA4 0019CAA4 00000000 */   nop
/* 09CBA8 0019CAA8 D501023C */  lui         $2, %hi(ViewCamera__2)
/* 09CBAC 0019CAAC B0434424 */  addiu       $4, $2, %lo(ViewCamera__2)
/* 09CBB0 0019CAB0 AC92858F */  lw          $5, -0x6D54($28)
/* 09CBB4 0019CAB4 FCA7050C */  jal         EdEyeCamera__FP7CCameraP10CCharacter
/* 09CBB8 0019CAB8 00000000 */   nop
/* 09CBBC 0019CABC 48A8050C */  jal         EdCheckViewMode__Fv
/* 09CBC0 0019CAC0 00000000 */   nop
/* 09CBC4 0019CAC4 1F004010 */  beqz        $2, .L0019CB44
/* 09CBC8 0019CAC8 00000000 */   nop
/* 09CBCC 0019CACC 41B01546 */  sub.s       $f1, $f22, $f21
/* 09CBD0 0019CAD0 00008044 */  mtc1        $0, $f0
/* 09CBD4 0019CAD4 00000000 */  nop
/* 09CBD8 0019CAD8 34080046 */  c.lt.s      $f1, $f0
/* 09CBDC 0019CADC 00000000 */  nop
/* 09CBE0 0019CAE0 04000045 */  bc1f        .L0019CAF4
/* 09CBE4 0019CAE4 00000000 */   nop
/* 09CBE8 0019CAE8 47080046 */  neg.s       $f1, $f1
/* 09CBEC 0019CAEC 01000010 */  b           .L0019CAF4
/* 09CBF0 0019CAF0 00000000 */   nop
.L0019CAF4:
/* 09CBF4 0019CAF4 A48080C7 */  lwc1        $f0, -0x7F5C($28)
/* 09CBF8 0019CAF8 34080046 */  c.lt.s      $f1, $f0
/* 09CBFC 0019CAFC 00000000 */  nop
/* 09CC00 0019CB00 A4000045 */  bc1f        .L.L0019CD94$b
/* 09CC04 0019CB04 00000000 */   nop
/* 09CC08 0019CB08 41B81446 */  sub.s       $f1, $f23, $f20
/* 09CC0C 0019CB0C 00008044 */  mtc1        $0, $f0
/* 09CC10 0019CB10 00000000 */  nop
/* 09CC14 0019CB14 34080046 */  c.lt.s      $f1, $f0
/* 09CC18 0019CB18 00000000 */  nop
/* 09CC1C 0019CB1C 04000045 */  bc1f        .L0019CB30
/* 09CC20 0019CB20 00000000 */   nop
/* 09CC24 0019CB24 47080046 */  neg.s       $f1, $f1
/* 09CC28 0019CB28 01000010 */  b           .L0019CB30
/* 09CC2C 0019CB2C 00000000 */   nop
.L0019CB30:
/* 09CC30 0019CB30 A48080C7 */  lwc1        $f0, -0x7F5C($28)
/* 09CC34 0019CB34 34080046 */  c.lt.s      $f1, $f0
/* 09CC38 0019CB38 00000000 */  nop
/* 09CC3C 0019CB3C 95000045 */  bc1f        .L.L0019CD94$b
/* 09CC40 0019CB40 00000000 */   nop
.L0019CB44:
/* 09CC44 0019CB44 06AB0046 */  mov.s       $f12, $f21
/* 09CC48 0019CB48 46A30046 */  mov.s       $f13, $f20
/* 09CC4C 0019CB4C 54A8050C */  jal         EdASetViewAngle__Fff
/* 09CC50 0019CB50 00000000 */   nop
/* 09CC54 0019CB54 2C02A0AF */  sw          $0, 0x22C($29)
/* 09CC58 0019CB58 48A8050C */  jal         EdCheckViewMode__Fv
/* 09CC5C 0019CB5C 00000000 */   nop
/* 09CC60 0019CB60 AC92848F */  lw          $4, -0x6D54($28)
/* 09CC64 0019CB64 282E0070 */  paddub      $5, $0, $0
/* 09CC68 0019CB68 28364070 */  paddub      $6, $2, $0
/* 09CC6C 0019CB6C 2C02A727 */  addiu       $7, $29, 0x22C
/* 09CC70 0019CB70 2464060C */  jal         EdTalkMode__FP10CCharacterP13CCameraFollowiPi
/* 09CC74 0019CB74 00000000 */   nop
/* 09CC78 0019CB78 86004010 */  beqz        $2, .L.L0019CD94$b
/* 09CC7C 0019CB7C 00000000 */   nop
/* 09CC80 0019CB80 02000324 */  addiu       $3, $0, 0x2
/* 09CC84 0019CB84 03004314 */  bne         $2, $3, .L0019CB94
/* 09CC88 0019CB88 00000000 */   nop
/* 09CC8C 0019CB8C 03000324 */  addiu       $3, $0, 0x3
/* 09CC90 0019CB90 D09283AF */  sw          $3, -0x6D30($28)
.L0019CB94:
/* 09CC94 0019CB94 03000324 */  addiu       $3, $0, 0x3
/* 09CC98 0019CB98 03004314 */  bne         $2, $3, .L0019CBA8
/* 09CC9C 0019CB9C 00000000 */   nop
/* 09CCA0 0019CBA0 04000324 */  addiu       $3, $0, 0x4
/* 09CCA4 0019CBA4 D09283AF */  sw          $3, -0x6D30($28)
.L0019CBA8:
/* 09CCA8 0019CBA8 04000324 */  addiu       $3, $0, 0x4
/* 09CCAC 0019CBAC 07004314 */  bne         $2, $3, .L0019CBCC
/* 09CCB0 0019CBB0 00000000 */   nop
/* 09CCB4 0019CBB4 2C02A48F */  lw          $4, 0x22C($29)
/* 09CCB8 0019CBB8 04008018 */  blez        $4, .L0019CBCC
/* 09CCBC 0019CBBC 00000000 */   nop
/* 09CCC0 0019CBC0 A892858F */  lw          $5, -0x6D58($28)
/* 09CCC4 0019CBC4 106F060C */  jal         RunEvent__FiP7CCamera__2
/* 09CCC8 0019CBC8 00000000 */   nop
.L0019CBCC:
/* 09CCCC 0019CBCC 949280AF */  sw          $0, -0x6D6C($28)
/* 09CCD0 0019CBD0 70000010 */  b           .L.L0019CD94$b
/* 09CCD4 0019CBD4 00000000 */   nop
jlabel .L0019CBD8
/* 09CCD8 0019CBD8 AC92838F */  lw          $3, -0x6D54($28)
/* 09CCDC 0019CBDC 680C628C */  lw          $2, 0xC68($3)
/* 09CCE0 0019CBE0 680C62AC */  sw          $2, 0xC68($3)
/* 09CCE4 0019CBE4 01000224 */  addiu       $2, $0, 0x1
/* 09CCE8 0019CBE8 640C62AC */  sw          $2, 0xC64($3)
/* 09CCEC 0019CBEC 80BF023C */  lui         $2, (0xBF800000 >> 16)
/* 09CCF0 0019CBF0 600C62AC */  sw          $2, 0xC60($3)
/* 09CCF4 0019CBF4 AC92848F */  lw          $4, -0x6D54($28)
/* 09CCF8 0019CBF8 A000998C */  lw          $25, 0xA0($4)
/* 09CCFC 0019CBFC 0800398F */  lw          $25, 0x8($25)
/* 09CD00 0019CC00 09F82003 */  jalr        $25
/* 09CD04 0019CC04 00000000 */   nop
/* 09CD08 0019CC08 AC92848F */  lw          $4, -0x6D54($28)
/* 09CD0C 0019CC0C A000998C */  lw          $25, 0xA0($4)
/* 09CD10 0019CC10 9000398F */  lw          $25, 0x90($25)
/* 09CD14 0019CC14 09F82003 */  jalr        $25
/* 09CD18 0019CC18 00000000 */   nop
/* 09CD1C 0019CC1C 28860070 */  paddub      $16, $0, $0
/* 09CD20 0019CC20 1F000010 */  b           .L0019CCA0
/* 09CD24 0019CC24 00000000 */   nop
.L0019CC28:
/* 09CD28 0019CC28 40111000 */  sll         $2, $16, 5
/* 09CD2C 0019CC2C 21185000 */  addu        $3, $2, $16
/* 09CD30 0019CC30 80100300 */  sll         $2, $3, 2
/* 09CD34 0019CC34 21106200 */  addu        $2, $3, $2
/* 09CD38 0019CC38 40210200 */  sll         $4, $2, 5
/* 09CD3C 0019CC3C D201023C */  lui         $2, %hi(EdVillager + 0xC68)
/* 09CD40 0019CC40 F8674224 */  addiu       $2, $2, %lo(EdVillager + 0xC68)
/* 09CD44 0019CC44 21184400 */  addu        $3, $2, $4
/* 09CD48 0019CC48 0000628C */  lw          $2, 0x0($3)
/* 09CD4C 0019CC4C 000062AC */  sw          $2, 0x0($3)
/* 09CD50 0019CC50 01000324 */  addiu       $3, $0, 0x1
/* 09CD54 0019CC54 D201023C */  lui         $2, %hi(EdVillager + 0xC64)
/* 09CD58 0019CC58 F4674224 */  addiu       $2, $2, %lo(EdVillager + 0xC64)
/* 09CD5C 0019CC5C 21104400 */  addu        $2, $2, $4
/* 09CD60 0019CC60 000043AC */  sw          $3, 0x0($2)
/* 09CD64 0019CC64 80BF033C */  lui         $3, (0xBF800000 >> 16)
/* 09CD68 0019CC68 D201023C */  lui         $2, %hi(EdVillager + 0xC60)
/* 09CD6C 0019CC6C F0674224 */  addiu       $2, $2, %lo(EdVillager + 0xC60)
/* 09CD70 0019CC70 21104400 */  addu        $2, $2, $4
/* 09CD74 0019CC74 000043AC */  sw          $3, 0x0($2)
/* 09CD78 0019CC78 D201023C */  lui         $2, %hi(EdVillager)
/* 09CD7C 0019CC7C 905B4224 */  addiu       $2, $2, %lo(EdVillager)
/* 09CD80 0019CC80 21884400 */  addu        $17, $2, $4
/* 09CD84 0019CC84 28262072 */  paddub      $4, $17, $0
/* 09CD88 0019CC88 EC57050C */  jal         Step__12CNPCharacterFv
/* 09CD8C 0019CC8C 00000000 */   nop
/* 09CD90 0019CC90 28262072 */  paddub      $4, $17, $0
/* 09CD94 0019CC94 3C58050C */  jal         ShadowStep__12CNPCharacterFv
/* 09CD98 0019CC98 00000000 */   nop
/* 09CD9C 0019CC9C 01001026 */  addiu       $16, $16, 0x1
.L0019CCA0:
/* 09CDA0 0019CCA0 0A00022A */  slti        $2, $16, 0xA
/* 09CDA4 0019CCA4 E0FF4014 */  bnez        $2, .L0019CC28
/* 09CDA8 0019CCA8 00000000 */   nop
/* 09CDAC 0019CCAC 39000010 */  b           .L.L0019CD94$b
/* 09CDB0 0019CCB0 00000000 */   nop
jlabel .L0019CCB4
/* 09CDB4 0019CCB4 FFFF0224 */  addiu       $2, $0, -0x1
/* 09CDB8 0019CCB8 CC9482AF */  sw          $2, -0x6B34($28)
/* 09CDBC 0019CCBC E0CB050C */  jal         EdMenuMode__Fv
/* 09CDC0 0019CCC0 00000000 */   nop
/* 09CDC4 0019CCC4 33004010 */  beqz        $2, .L.L0019CD94$b
/* 09CDC8 0019CCC8 00000000 */   nop
/* 09CDCC 0019CCCC 949280AF */  sw          $0, -0x6D6C($28)
/* 09CDD0 0019CCD0 CCCB050C */  jal         EdExitMenu__Fv
/* 09CDD4 0019CCD4 00000000 */   nop
/* 09CDD8 0019CCD8 F4CF070C */  jal         GetInteriorOutFlag__Fv
/* 09CDDC 0019CCDC 00000000 */   nop
/* 09CDE0 0019CCE0 06004010 */  beqz        $2, .L0019CCFC
/* 09CDE4 0019CCE4 00000000 */   nop
/* 09CDE8 0019CCE8 60A7050C */  jal         EdViewModeOff__Fv
/* 09CDEC 0019CCEC 00000000 */   nop
/* 09CDF0 0019CCF0 01000224 */  addiu       $2, $0, 0x1
/* 09CDF4 0019CCF4 69010010 */  b           .L0019D29C
/* 09CDF8 0019CCF8 00000000 */   nop
.L0019CCFC:
/* 09CDFC 0019CCFC 28860070 */  paddub      $16, $0, $0
/* 09CE00 0019CD00 1E000010 */  b           .L0019CD7C
/* 09CE04 0019CD04 00000000 */   nop
.L0019CD08:
/* 09CE08 0019CD08 40111000 */  sll         $2, $16, 5
/* 09CE0C 0019CD0C 21185000 */  addu        $3, $2, $16
/* 09CE10 0019CD10 80100300 */  sll         $2, $3, 2
/* 09CE14 0019CD14 21106200 */  addu        $2, $3, $2
/* 09CE18 0019CD18 40210200 */  sll         $4, $2, 5
/* 09CE1C 0019CD1C D201023C */  lui         $2, %hi(EdVillager + 0xC68)
/* 09CE20 0019CD20 F8674224 */  addiu       $2, $2, %lo(EdVillager + 0xC68)
/* 09CE24 0019CD24 21184400 */  addu        $3, $2, $4
/* 09CE28 0019CD28 0000628C */  lw          $2, 0x0($3)
/* 09CE2C 0019CD2C 000062AC */  sw          $2, 0x0($3)
/* 09CE30 0019CD30 D201023C */  lui         $2, %hi(EdVillager + 0xC64)
/* 09CE34 0019CD34 F4674224 */  addiu       $2, $2, %lo(EdVillager + 0xC64)
/* 09CE38 0019CD38 21104400 */  addu        $2, $2, $4
/* 09CE3C 0019CD3C 000040AC */  sw          $0, 0x0($2)
/* 09CE40 0019CD40 80BF033C */  lui         $3, (0xBF800000 >> 16)
/* 09CE44 0019CD44 D201023C */  lui         $2, %hi(EdVillager + 0xC60)
/* 09CE48 0019CD48 F0674224 */  addiu       $2, $2, %lo(EdVillager + 0xC60)
/* 09CE4C 0019CD4C 21104400 */  addu        $2, $2, $4
/* 09CE50 0019CD50 000043AC */  sw          $3, 0x0($2)
/* 09CE54 0019CD54 D201023C */  lui         $2, %hi(EdVillager)
/* 09CE58 0019CD58 905B4224 */  addiu       $2, $2, %lo(EdVillager)
/* 09CE5C 0019CD5C 21884400 */  addu        $17, $2, $4
/* 09CE60 0019CD60 28262072 */  paddub      $4, $17, $0
/* 09CE64 0019CD64 EC57050C */  jal         Step__12CNPCharacterFv
/* 09CE68 0019CD68 00000000 */   nop
/* 09CE6C 0019CD6C 28262072 */  paddub      $4, $17, $0
/* 09CE70 0019CD70 3C58050C */  jal         ShadowStep__12CNPCharacterFv
/* 09CE74 0019CD74 00000000 */   nop
/* 09CE78 0019CD78 01001026 */  addiu       $16, $16, 0x1
.L0019CD7C:
/* 09CE7C 0019CD7C 0A00022A */  slti        $2, $16, 0xA
/* 09CE80 0019CD80 E1FF4014 */  bnez        $2, .L0019CD08
/* 09CE84 0019CD84 00000000 */   nop
/* 09CE88 0019CD88 28160070 */  paddub      $2, $0, $0
/* 09CE8C 0019CD8C 43010010 */  b           .L0019D29C
/* 09CE90 0019CD90 00000000 */   nop
jlabel .L0019CD94
.L.L0019CD94$b:
/* 09CE94 0019CD94 D401013C */  lui         $1, %hi(EdEventInfo + 0x320)
/* 09CE98 0019CD98 F0D4228C */  lw          $2, %lo(EdEventInfo + 0x320)($1)
/* 09CE9C 0019CD9C 0B004010 */  beqz        $2, .L0019CDCC
/* 09CEA0 0019CDA0 00000000 */   nop
/* 09CEA4 0019CDA4 D401023C */  lui         $2, %hi(EdEventInfo + 0x330)
/* 09CEA8 0019CDA8 00D54424 */  addiu       $4, $2, %lo(EdEventInfo + 0x330)
/* 09CEAC 0019CDAC D401023C */  lui         $2, %hi(EdEventInfo + 0x370)
/* 09CEB0 0019CDB0 40D54524 */  addiu       $5, $2, %lo(EdEventInfo + 0x370)
/* 09CEB4 0019CDB4 08B7040C */  jal         MGSetPLight__FPA4_fPA4_f
/* 09CEB8 0019CDB8 00000000 */   nop
/* 09CEBC 0019CDBC D401023C */  lui         $2, %hi(EdEventInfo + 0x3B0)
/* 09CEC0 0019CDC0 80D54424 */  addiu       $4, $2, %lo(EdEventInfo + 0x3B0)
/* 09CEC4 0019CDC4 40B7040C */  jal         MGSetAmbient__FPf
/* 09CEC8 0019CDC8 00000000 */   nop
.L0019CDCC:
/* 09CECC 0019CDCC A892848F */  lw          $4, -0x6D58($28)
/* 09CED0 0019CDD0 01000524 */  addiu       $5, $0, 0x1
/* 09CED4 0019CDD4 B802998C */  lw          $25, 0x2B8($4)
/* 09CED8 0019CDD8 0800398F */  lw          $25, 0x8($25)
/* 09CEDC 0019CDDC 09F82003 */  jalr        $25
/* 09CEE0 0019CDE0 00000000 */   nop
/* 09CEE4 0019CDE4 A892848F */  lw          $4, -0x6D58($28)
/* 09CEE8 0019CDE8 4000A527 */  addiu       $5, $29, 0x40
/* 09CEEC 0019CDEC F890040C */  jal         GetCameraMatrix__7CCameraFPA4_f
/* 09CEF0 0019CDF0 00000000 */   nop
/* 09CEF4 0019CDF4 A892848F */  lw          $4, -0x6D58($28)
/* 09CEF8 0019CDF8 E000A527 */  addiu       $5, $29, 0xE0
/* 09CEFC 0019CDFC 9C91040C */  jal         GetPos__7CCameraFPf
/* 09CF00 0019CE00 00000000 */   nop
/* 09CF04 0019CE04 A892848F */  lw          $4, -0x6D58($28)
/* 09CF08 0019CE08 F000A527 */  addiu       $5, $29, 0xF0
/* 09CF0C 0019CE0C E890040C */  jal         GetDir__7CCameraFPf
/* 09CF10 0019CE10 00000000 */   nop
/* 09CF14 0019CE14 4000A427 */  addiu       $4, $29, 0x40
/* 09CF18 0019CE18 E000A527 */  addiu       $5, $29, 0xE0
/* 09CF1C 0019CE1C E8B7040C */  jal         MGSetViewMatrix__FPA4_fPf
/* 09CF20 0019CE20 00000000 */   nop
/* 09CF24 0019CE24 28260070 */  paddub      $4, $0, $0
/* 09CF28 0019CE28 0D000010 */  b           .L0019CE60
/* 09CF2C 0019CE2C 00000000 */   nop
.L0019CE30:
/* 09CF30 0019CE30 C0100400 */  sll         $2, $4, 3
/* 09CF34 0019CE34 23184400 */  subu        $3, $2, $4
/* 09CF38 0019CE38 80100300 */  sll         $2, $3, 2
/* 09CF3C 0019CE3C 23104300 */  subu        $2, $2, $3
/* 09CF40 0019CE40 40190200 */  sll         $3, $2, 5
/* 09CF44 0019CE44 D501023C */  lui         $2, %hi(InteriorParts)
/* 09CF48 0019CE48 F0D54224 */  addiu       $2, $2, %lo(InteriorParts)
/* 09CF4C 0019CE4C 21184300 */  addu        $3, $2, $3
/* 09CF50 0019CE50 80100400 */  sll         $2, $4, 2
/* 09CF54 0019CE54 21105D00 */  addu        $2, $2, $29
/* 09CF58 0019CE58 000143AC */  sw          $3, 0x100($2)
/* 09CF5C 0019CE5C 01008424 */  addiu       $4, $4, 0x1
.L0019CE60:
/* 09CF60 0019CE60 BC92858F */  lw          $5, -0x6D44($28)
/* 09CF64 0019CE64 2A108500 */  slt         $2, $4, $5
/* 09CF68 0019CE68 F1FF4014 */  bnez        $2, .L0019CE30
/* 09CF6C 0019CE6C 00000000 */   nop
/* 09CF70 0019CE70 B0928CC7 */  lwc1        $f12, -0x6D50($28)
/* 09CF74 0019CE74 0001A427 */  addiu       $4, $29, 0x100
/* 09CF78 0019CE78 E000A627 */  addiu       $6, $29, 0xE0
/* 09CF7C 0019CE7C F000A727 */  addiu       $7, $29, 0xF0
/* 09CF80 0019CE80 48C7050C */  jal         EdSetSoundSrcVol__FfPP9CMapPartsiPfPf
/* 09CF84 0019CE84 00000000 */   nop
/* 09CF88 0019CE88 9492838F */  lw          $3, -0x6D6C($28)
/* 09CF8C 0019CE8C 07000224 */  addiu       $2, $0, 0x7
/* 09CF90 0019CE90 05006210 */  beq         $3, $2, .L0019CEA8
/* 09CF94 0019CE94 00000000 */   nop
/* 09CF98 0019CE98 B474060C */  jal         MainDraw__Fv__2
/* 09CF9C 0019CE9C 00000000 */   nop
/* 09CFA0 0019CEA0 03000010 */  b           .L0019CEB0
/* 09CFA4 0019CEA4 00000000 */   nop
.L0019CEA8:
/* 09CFA8 0019CEA8 1826060C */  jal         EdFadeInOut__Fv
/* 09CFAC 0019CEAC 00000000 */   nop
.L0019CEB0:
/* 09CFB0 0019CEB0 9492838F */  lw          $3, -0x6D6C($28)
/* 09CFB4 0019CEB4 06000224 */  addiu       $2, $0, 0x6
/* 09CFB8 0019CEB8 10006214 */  bne         $3, $2, .L0019CEFC
/* 09CFBC 0019CEBC 00000000 */   nop
/* 09CFC0 0019CEC0 C701023C */  lui         $2, %hi(TexManager)
/* 09CFC4 0019CEC4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 09CFC8 0019CEC8 2A00023C */  lui         $2, %hi(LIT_891__2)
/* 09CFCC 0019CECC D0B24524 */  addiu       $5, $2, %lo(LIT_891__2)
/* 09CFD0 0019CED0 FFFF0624 */  addiu       $6, $0, -0x1
/* 09CFD4 0019CED4 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 09CFD8 0019CED8 00000000 */   nop
/* 09CFDC 0019CEDC A892848F */  lw          $4, -0x6D58($28)
/* 09CFE0 0019CEE0 282E4070 */  paddub      $5, $2, $0
/* 09CFE4 0019CEE4 4CCB050C */  jal         EdInitModeFinish__FP7CCameraP8CTexture
/* 09CFE8 0019CEE8 00000000 */   nop
/* 09CFEC 0019CEEC 03004010 */  beqz        $2, .L0019CEFC
/* 09CFF0 0019CEF0 00000000 */   nop
/* 09CFF4 0019CEF4 07000224 */  addiu       $2, $0, 0x7
/* 09CFF8 0019CEF8 949282AF */  sw          $2, -0x6D6C($28)
.L0019CEFC:
/* 09CFFC 0019CEFC 9CCF050C */  jal         EdSaveFrameImageTask__Fv
/* 09D000 0019CF00 00000000 */   nop
/* 09D004 0019CF04 9492828F */  lw          $2, -0x6D6C($28)
/* 09D008 0019CF08 2C004014 */  bnez        $2, .L0019CFBC
/* 09D00C 0019CF0C 00000000 */   nop
/* 09D010 0019CF10 10000424 */  addiu       $4, $0, 0x10
/* 09D014 0019CF14 01000524 */  addiu       $5, $0, 0x1
/* 09D018 0019CF18 64A6050C */  jal         EdPadDown__Fii
/* 09D01C 0019CF1C 00000000 */   nop
/* 09D020 0019CF20 05004010 */  beqz        $2, .L0019CF38
/* 09D024 0019CF24 00000000 */   nop
/* 09D028 0019CF28 DC92828F */  lw          $2, -0x6D24($28)
/* 09D02C 0019CF2C 02004128 */  slti        $1, $2, 0x2
/* 09D030 0019CF30 0C002010 */  beqz        $1, .L0019CF64
/* 09D034 0019CF34 00000000 */   nop
.L0019CF38:
/* 09D038 0019CF38 D092828F */  lw          $2, -0x6D30($28)
/* 09D03C 0019CF3C 09004014 */  bnez        $2, .L0019CF64
/* 09D040 0019CF40 00000000 */   nop
/* 09D044 0019CF44 4480050C */  jal         SystemMesCheck__Fv
/* 09D048 0019CF48 00000000 */   nop
/* 09D04C 0019CF4C 1B004014 */  bnez        $2, .L0019CFBC
/* 09D050 0019CF50 00000000 */   nop
/* 09D054 0019CF54 84CC050C */  jal         EdCheckItemOver__Fv
/* 09D058 0019CF58 00000000 */   nop
/* 09D05C 0019CF5C 17004010 */  beqz        $2, .L0019CFBC
/* 09D060 0019CF60 00000000 */   nop
.L0019CF64:
/* 09D064 0019CF64 02001024 */  addiu       $16, $0, 0x2
/* 09D068 0019CF68 D092858F */  lw          $5, -0x6D30($28)
/* 09D06C 0019CF6C 0700A010 */  beqz        $5, .L0019CF8C
/* 09D070 0019CF70 00000000 */   nop
/* 09D074 0019CF74 2886A070 */  paddub      $16, $5, $0
/* 09D078 0019CF78 D09280AF */  sw          $0, -0x6D30($28)
/* 09D07C 0019CF7C 2A00023C */  lui         $2, %hi(LIT_892__2)
/* 09D080 0019CF80 E0B24424 */  addiu       $4, $2, %lo(LIT_892__2)
/* 09D084 0019CF84 A611040C */  jal         printf
/* 09D088 0019CF88 00000000 */   nop
.L0019CF8C:
/* 09D08C 0019CF8C 28260072 */  paddub      $4, $16, $0
/* 09D090 0019CF90 34CB050C */  jal         EdInitMenu__Fi
/* 09D094 0019CF94 00000000 */   nop
/* 09D098 0019CF98 08004010 */  beqz        $2, .L0019CFBC
/* 09D09C 0019CF9C 00000000 */   nop
/* 09D0A0 0019CFA0 01000424 */  addiu       $4, $0, 0x1
/* 09D0A4 0019CFA4 FFFF0524 */  addiu       $5, $0, -0x1
/* 09D0A8 0019CFA8 28360070 */  paddub      $6, $0, $0
/* 09D0AC 0019CFAC AC69050C */  jal         SndSePlay__Fiii
/* 09D0B0 0019CFB0 00000000 */   nop
/* 09D0B4 0019CFB4 06000224 */  addiu       $2, $0, 0x6
/* 09D0B8 0019CFB8 949282AF */  sw          $2, -0x6D6C($28)
.L0019CFBC:
/* 09D0BC 0019CFBC E4928283 */  lb          $2, -0x6D1C($28)
/* 09D0C0 0019CFC0 04004014 */  bnez        $2, .L0019CFD4
/* 09D0C4 0019CFC4 00000000 */   nop
/* 09D0C8 0019CFC8 E09280AF */  sw          $0, -0x6D20($28)
/* 09D0CC 0019CFCC 01000224 */  addiu       $2, $0, 0x1
/* 09D0D0 0019CFD0 E49282A3 */  sb          $2, -0x6D1C($28)
.L0019CFD4:
/* 09D0D4 0019CFD4 CC01023C */  lui         $2, %hi(GamePad)
/* 09D0D8 0019CFD8 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 09D0DC 0019CFDC 80000524 */  addiu       $5, $0, 0x80
/* 09D0E0 0019CFE0 2CAE040C */  jal         Down2__8CGamePadFi
/* 09D0E4 0019CFE4 00000000 */   nop
/* 09D0E8 0019CFE8 06004010 */  beqz        $2, .L0019D004
/* 09D0EC 0019CFEC 00000000 */   nop
/* 09D0F0 0019CFF0 04000224 */  addiu       $2, $0, 0x4
/* 09D0F4 0019CFF4 E09282AF */  sw          $2, -0x6D20($28)
/* 09D0F8 0019CFF8 045E060C */  jal         EdEventAllClear__Fv
/* 09D0FC 0019CFFC 00000000 */   nop
/* 09D100 0019D000 149280AF */  sw          $0, -0x6DEC($28)
.L0019D004:
/* 09D104 0019D004 E092828F */  lw          $2, -0x6D20($28)
/* 09D108 0019D008 FFFF4224 */  addiu       $2, $2, -0x1
/* 09D10C 0019D00C E09282AF */  sw          $2, -0x6D20($28)
/* 09D110 0019D010 E092828F */  lw          $2, -0x6D20($28)
/* 09D114 0019D014 02004104 */  bgez        $2, .L0019D020
/* 09D118 0019D018 00000000 */   nop
/* 09D11C 0019D01C E09280AF */  sw          $0, -0x6D20($28)
.L0019D020:
/* 09D120 0019D020 E092838F */  lw          $3, -0x6D20($28)
/* 09D124 0019D024 01000224 */  addiu       $2, $0, 0x1
/* 09D128 0019D028 03006214 */  bne         $3, $2, .L0019D038
/* 09D12C 0019D02C 00000000 */   nop
/* 09D130 0019D030 96000224 */  addiu       $2, $0, 0x96
/* 09D134 0019D034 C89282AF */  sw          $2, -0x6D38($28)
.L0019D038:
/* 09D138 0019D038 9492838F */  lw          $3, -0x6D6C($28)
/* 09D13C 0019D03C 04000224 */  addiu       $2, $0, 0x4
/* 09D140 0019D040 09006210 */  beq         $3, $2, .L0019D068
/* 09D144 0019D044 00000000 */   nop
/* 09D148 0019D048 AC92838F */  lw          $3, -0x6D54($28)
/* 09D14C 0019D04C D011628C */  lw          $2, 0x11D0($3)
/* 09D150 0019D050 05004010 */  beqz        $2, .L0019D068
/* 09D154 0019D054 00000000 */   nop
/* 09D158 0019D058 20126284 */  lh          $2, 0x1220($3)
/* 09D15C 0019D05C 02004018 */  blez        $2, .L0019D068
/* 09D160 0019D060 00000000 */   nop
/* 09D164 0019D064 C89282AF */  sw          $2, -0x6D38($28)
.L0019D068:
/* 09D168 0019D068 3087828F */  lw          $2, -0x78D0($28)
/* 09D16C 0019D06C 34004010 */  beqz        $2, .L0019D140
/* 09D170 0019D070 00000000 */   nop
/* 09D174 0019D074 C892838F */  lw          $3, -0x6D38($28)
/* 09D178 0019D078 0400601C */  bgtz        $3, .L0019D08C
/* 09D17C 0019D07C 00000000 */   nop
/* 09D180 0019D080 CC92828F */  lw          $2, -0x6D34($28)
/* 09D184 0019D084 2E004018 */  blez        $2, .L0019D140
/* 09D188 0019D088 00000000 */   nop
.L0019D08C:
/* 09D18C 0019D08C CC92848F */  lw          $4, -0x6D34($28)
/* 09D190 0019D090 0E008018 */  blez        $4, .L0019D0CC
/* 09D194 0019D094 00000000 */   nop
/* 09D198 0019D098 6890868F */  lw          $6, -0x6F98($28)
/* 09D19C 0019D09C D201023C */  lui         $2, %hi(EdNPCBuffer)
/* 09D1A0 0019D0A0 50B34524 */  addiu       $5, $2, %lo(EdNPCBuffer)
/* 09D1A4 0019D0A4 EC5C060C */  jal         EdEventInit__FiP14CDataAlloc2_1_Pc
/* 09D1A8 0019D0A8 00000000 */   nop
/* 09D1AC 0019D0AC 1F004010 */  beqz        $2, .L0019D12C
/* 09D1B0 0019D0B0 00000000 */   nop
/* 09D1B4 0019D0B4 74E0050C */  jal         EdInitMesParam__Fv
/* 09D1B8 0019D0B8 00000000 */   nop
/* 09D1BC 0019D0BC 04000224 */  addiu       $2, $0, 0x4
/* 09D1C0 0019D0C0 949282AF */  sw          $2, -0x6D6C($28)
/* 09D1C4 0019D0C4 19000010 */  b           .L0019D12C
/* 09D1C8 0019D0C8 00000000 */   nop
.L0019D0CC:
/* 09D1CC 0019D0CC 6490868F */  lw          $6, -0x6F9C($28)
/* 09D1D0 0019D0D0 28266070 */  paddub      $4, $3, $0
/* 09D1D4 0019D0D4 D201023C */  lui         $2, %hi(EdNPCBuffer)
/* 09D1D8 0019D0D8 50B34524 */  addiu       $5, $2, %lo(EdNPCBuffer)
/* 09D1DC 0019D0DC EC5C060C */  jal         EdEventInit__FiP14CDataAlloc2_1_Pc
/* 09D1E0 0019D0E0 00000000 */   nop
/* 09D1E4 0019D0E4 07004010 */  beqz        $2, .L0019D104
/* 09D1E8 0019D0E8 00000000 */   nop
/* 09D1EC 0019D0EC 74E0050C */  jal         EdInitMesParam__Fv
/* 09D1F0 0019D0F0 00000000 */   nop
/* 09D1F4 0019D0F4 04000224 */  addiu       $2, $0, 0x4
/* 09D1F8 0019D0F8 949282AF */  sw          $2, -0x6D6C($28)
/* 09D1FC 0019D0FC 0B000010 */  b           .L0019D12C
/* 09D200 0019D100 00000000 */   nop
.L0019D104:
/* 09D204 0019D104 D401013C */  lui         $1, %hi(EdEventInfo + 0x448)
/* 09D208 0019D108 18D6238C */  lw          $3, %lo(EdEventInfo + 0x448)($1)
/* 09D20C 0019D10C 09000224 */  addiu       $2, $0, 0x9
/* 09D210 0019D110 06006214 */  bne         $3, $2, .L0019D12C
/* 09D214 0019D114 00000000 */   nop
/* 09D218 0019D118 74E0050C */  jal         EdInitMesParam__Fv
/* 09D21C 0019D11C 00000000 */   nop
/* 09D220 0019D120 03000224 */  addiu       $2, $0, 0x3
/* 09D224 0019D124 949282AF */  sw          $2, -0x6D6C($28)
/* 09D228 0019D128 149280AF */  sw          $0, -0x6DEC($28)
.L0019D12C:
/* 09D22C 0019D12C FFFF0224 */  addiu       $2, $0, -0x1
/* 09D230 0019D130 C89282AF */  sw          $2, -0x6D38($28)
/* 09D234 0019D134 CC9282AF */  sw          $2, -0x6D34($28)
/* 09D238 0019D138 02000010 */  b           .L0019D144
/* 09D23C 0019D13C 00000000 */   nop
.L0019D140:
/* 09D240 0019D140 149280AF */  sw          $0, -0x6DEC($28)
.L0019D144:
/* 09D244 0019D144 9492838F */  lw          $3, -0x6D6C($28)
/* 09D248 0019D148 05000224 */  addiu       $2, $0, 0x5
/* 09D24C 0019D14C 13006214 */  bne         $3, $2, .L0019D19C
/* 09D250 0019D150 00000000 */   nop
/* 09D254 0019D154 CC01023C */  lui         $2, %hi(GamePad)
/* 09D258 0019D158 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 09D25C 0019D15C 00080524 */  addiu       $5, $0, 0x800
/* 09D260 0019D160 1CAE040C */  jal         Down__8CGamePadFi
/* 09D264 0019D164 00000000 */   nop
/* 09D268 0019D168 0C004010 */  beqz        $2, .L0019D19C
/* 09D26C 0019D16C 00000000 */   nop
/* 09D270 0019D170 E892828F */  lw          $2, -0x6D18($28)
/* 09D274 0019D174 949282AF */  sw          $2, -0x6D6C($28)
/* 09D278 0019D178 02000424 */  addiu       $4, $0, 0x2
/* 09D27C 0019D17C FFFF0524 */  addiu       $5, $0, -0x1
/* 09D280 0019D180 4428060C */  jal         EdSePlay__F11ED_SOUND_IDi
/* 09D284 0019D184 00000000 */   nop
/* 09D288 0019D188 01000424 */  addiu       $4, $0, 0x1
/* 09D28C 0019D18C C803050C */  jal         PlayTimeCountFlag__Fi
/* 09D290 0019D190 00000000 */   nop
/* 09D294 0019D194 18000010 */  b           .L0019D1F8
/* 09D298 0019D198 00000000 */   nop
.L0019D19C:
/* 09D29C 0019D19C 9492838F */  lw          $3, -0x6D6C($28)
/* 09D2A0 0019D1A0 04000224 */  addiu       $2, $0, 0x4
/* 09D2A4 0019D1A4 14006210 */  beq         $3, $2, .L0019D1F8
/* 09D2A8 0019D1A8 00000000 */   nop
/* 09D2AC 0019D1AC D492828F */  lw          $2, -0x6D2C($28)
/* 09D2B0 0019D1B0 11004010 */  beqz        $2, .L0019D1F8
/* 09D2B4 0019D1B4 00000000 */   nop
/* 09D2B8 0019D1B8 DC92828F */  lw          $2, -0x6D24($28)
/* 09D2BC 0019D1BC 02004128 */  slti        $1, $2, 0x2
/* 09D2C0 0019D1C0 0D002014 */  bnez        $1, .L0019D1F8
/* 09D2C4 0019D1C4 00000000 */   nop
/* 09D2C8 0019D1C8 0B006014 */  bnez        $3, .L0019D1F8
/* 09D2CC 0019D1CC 00000000 */   nop
/* 09D2D0 0019D1D0 E89283AF */  sw          $3, -0x6D18($28)
/* 09D2D4 0019D1D4 05000224 */  addiu       $2, $0, 0x5
/* 09D2D8 0019D1D8 949282AF */  sw          $2, -0x6D6C($28)
/* 09D2DC 0019D1DC 01000424 */  addiu       $4, $0, 0x1
/* 09D2E0 0019D1E0 FFFF0524 */  addiu       $5, $0, -0x1
/* 09D2E4 0019D1E4 4428060C */  jal         EdSePlay__F11ED_SOUND_IDi
/* 09D2E8 0019D1E8 00000000 */   nop
/* 09D2EC 0019D1EC 28260070 */  paddub      $4, $0, $0
/* 09D2F0 0019D1F0 C803050C */  jal         PlayTimeCountFlag__Fi
/* 09D2F4 0019D1F4 00000000 */   nop
.L0019D1F8:
/* 09D2F8 0019D1F8 D49280AF */  sw          $0, -0x6D2C($28)
/* 09D2FC 0019D1FC F0928283 */  lb          $2, -0x6D10($28)
/* 09D300 0019D200 04004014 */  bnez        $2, .L0019D214
/* 09D304 0019D204 00000000 */   nop
/* 09D308 0019D208 EC9280AF */  sw          $0, -0x6D14($28)
/* 09D30C 0019D20C 01000224 */  addiu       $2, $0, 0x1
/* 09D310 0019D210 F09282A3 */  sb          $2, -0x6D10($28)
.L0019D214:
/* 09D314 0019D214 CC01023C */  lui         $2, %hi(GamePad)
/* 09D318 0019D218 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 09D31C 0019D21C 0CAD040C */  jal         AllOn__8CGamePadFv
/* 09D320 0019D220 00000000 */   nop
/* 09D324 0019D224 02004010 */  beqz        $2, .L0019D230
/* 09D328 0019D228 00000000 */   nop
/* 09D32C 0019D22C D89280AF */  sw          $0, -0x6D28($28)
.L0019D230:
/* 09D330 0019D230 EC92838F */  lw          $3, -0x6D14($28)
/* 09D334 0019D234 01000224 */  addiu       $2, $0, 0x1
/* 09D338 0019D238 09006214 */  bne         $3, $2, .L0019D260
/* 09D33C 0019D23C 00000000 */   nop
/* 09D340 0019D240 EC9280AF */  sw          $0, -0x6D14($28)
/* 09D344 0019D244 20030424 */  addiu       $4, $0, 0x320
/* 09D348 0019D248 FFFF0524 */  addiu       $5, $0, -0x1
/* 09D34C 0019D24C 4C07050C */  jal         MapJump__Fii
/* 09D350 0019D250 00000000 */   nop
/* 09D354 0019D254 63000224 */  addiu       $2, $0, 0x63
/* 09D358 0019D258 10000010 */  b           .L0019D29C
/* 09D35C 0019D25C 00000000 */   nop
.L0019D260:
/* 09D360 0019D260 FFFF6224 */  addiu       $2, $3, -0x1
/* 09D364 0019D264 EC9282AF */  sw          $2, -0x6D14($28)
/* 09D368 0019D268 EC92828F */  lw          $2, -0x6D14($28)
/* 09D36C 0019D26C 02004104 */  bgez        $2, .L0019D278
/* 09D370 0019D270 00000000 */   nop
/* 09D374 0019D274 EC9280AF */  sw          $0, -0x6D14($28)
.L0019D278:
/* 09D378 0019D278 D892828F */  lw          $2, -0x6D28($28)
/* 09D37C 0019D27C 01004224 */  addiu       $2, $2, 0x1
/* 09D380 0019D280 D89282AF */  sw          $2, -0x6D28($28)
/* 09D384 0019D284 DC92828F */  lw          $2, -0x6D24($28)
/* 09D388 0019D288 01004224 */  addiu       $2, $2, 0x1
/* 09D38C 0019D28C DC9282AF */  sw          $2, -0x6D24($28)
/* 09D390 0019D290 D464050C */  jal         SndStep__Fv
/* 09D394 0019D294 00000000 */   nop
/* 09D398 0019D298 28160070 */  paddub      $2, $0, $0
.L0019D29C:
/* 09D39C 0019D29C 3000BF7B */  lq          $31, 0x30($29)
/* 09D3A0 0019D2A0 2000B17B */  lq          $17, 0x20($29)
/* 09D3A4 0019D2A4 1000B07B */  lq          $16, 0x10($29)
/* 09D3A8 0019D2A8 0C00B7C7 */  lwc1        $f23, 0xC($29)
/* 09D3AC 0019D2AC 0800B6C7 */  lwc1        $f22, 0x8($29)
/* 09D3B0 0019D2B0 0400B5C7 */  lwc1        $f21, 0x4($29)
/* 09D3B4 0019D2B4 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 09D3B8 0019D2B8 3002BD27 */  addiu       $29, $29, 0x230
/* 09D3BC 0019D2BC 0800E003 */  jr          $31
/* 09D3C0 0019D2C0 00000000 */   nop
/* 09D3C4 0019D2C4 00000000 */  nop
/* 09D3C8 0019D2C8 00000000 */  nop
/* 09D3CC 0019D2CC 00000000 */  nop
