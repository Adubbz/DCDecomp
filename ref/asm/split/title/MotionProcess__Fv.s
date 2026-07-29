.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MotionProcess__Fv
/* 004390 01DB0090 F0FFBD27 */  addiu       $29, $29, -0x10
/* 004394 01DB0094 0000BF7F */  sq          $31, 0x0($29)
/* 004398 01DB0098 DE01013C */  lui         $1, %hi(CScript__2 + 0x8)
/* 00439C 01DB009C 081B248C */  lw          $4, %lo(CScript__2 + 0x8)($1)
/* 0043A0 01DB00A0 04000324 */  addiu       $3, $0, 0x4
/* 0043A4 01DB00A4 2D008310 */  beq         $4, $3, .L01DB015C_2B595C
/* 0043A8 01DB00A8 00000000 */   nop
/* 0043AC 01DB00AC 03000324 */  addiu       $3, $0, 0x3
/* 0043B0 01DB00B0 1F008310 */  beq         $4, $3, .L01DB0130_2B5930
/* 0043B4 01DB00B4 00000000 */   nop
/* 0043B8 01DB00B8 02000324 */  addiu       $3, $0, 0x2
/* 0043BC 01DB00BC 11008310 */  beq         $4, $3, .L01DB0104_2B5904
/* 0043C0 01DB00C0 00000000 */   nop
/* 0043C4 01DB00C4 01000324 */  addiu       $3, $0, 0x1
/* 0043C8 01DB00C8 03008310 */  beq         $4, $3, .L01DB00D8_2B58D8
/* 0043CC 01DB00CC 00000000 */   nop
/* 0043D0 01DB00D0 2B000010 */  b           .L01DB0180_2B5980
/* 0043D4 01DB00D4 00000000 */   nop
.L01DB00D8_2B58D8:
/* 0043D8 01DB00D8 E101023C */  lui         $2, %hi(DispFade)
/* 0043DC 01DB00DC B0E54424 */  addiu       $4, $2, %lo(DispFade)
/* 0043E0 01DB00E0 DE01013C */  lui         $1, %hi(CScript__2 + 0xC)
/* 0043E4 01DB00E4 0C1B2CC4 */  lwc1        $f12, %lo(CScript__2 + 0xC)($1)
/* 0043E8 01DB00E8 282E0070 */  paddub      $5, $0, $0
/* 0043EC 01DB00EC 80B4760C */  jal         FadeInStart__9CDispFadeFfi
/* 0043F0 01DB00F0 00000000 */   nop
/* 0043F4 01DB00F4 DE01013C */  lui         $1, %hi(CScript__2 + 0x8)
/* 0043F8 01DB00F8 081B20AC */  sw          $0, %lo(CScript__2 + 0x8)($1)
/* 0043FC 01DB00FC 20000010 */  b           .L01DB0180_2B5980
/* 004400 01DB0100 00000000 */   nop
.L01DB0104_2B5904:
/* 004404 01DB0104 E101023C */  lui         $2, %hi(DispFade)
/* 004408 01DB0108 B0E54424 */  addiu       $4, $2, %lo(DispFade)
/* 00440C 01DB010C DE01013C */  lui         $1, %hi(CScript__2 + 0xC)
/* 004410 01DB0110 0C1B2CC4 */  lwc1        $f12, %lo(CScript__2 + 0xC)($1)
/* 004414 01DB0114 282E0070 */  paddub      $5, $0, $0
/* 004418 01DB0118 78B4760C */  jal         FadeOutStart__9CDispFadeFfi
/* 00441C 01DB011C 00000000 */   nop
/* 004420 01DB0120 DE01013C */  lui         $1, %hi(CScript__2 + 0x8)
/* 004424 01DB0124 081B20AC */  sw          $0, %lo(CScript__2 + 0x8)($1)
/* 004428 01DB0128 15000010 */  b           .L01DB0180_2B5980
/* 00442C 01DB012C 00000000 */   nop
.L01DB0130_2B5930:
/* 004430 01DB0130 E101023C */  lui         $2, %hi(DispFade)
/* 004434 01DB0134 B0E54424 */  addiu       $4, $2, %lo(DispFade)
/* 004438 01DB0138 DE01013C */  lui         $1, %hi(CScript__2 + 0xC)
/* 00443C 01DB013C 0C1B2CC4 */  lwc1        $f12, %lo(CScript__2 + 0xC)($1)
/* 004440 01DB0140 01000524 */  addiu       $5, $0, 0x1
/* 004444 01DB0144 80B4760C */  jal         FadeInStart__9CDispFadeFfi
/* 004448 01DB0148 00000000 */   nop
/* 00444C 01DB014C DE01013C */  lui         $1, %hi(CScript__2 + 0x8)
/* 004450 01DB0150 081B20AC */  sw          $0, %lo(CScript__2 + 0x8)($1)
/* 004454 01DB0154 0A000010 */  b           .L01DB0180_2B5980
/* 004458 01DB0158 00000000 */   nop
.L01DB015C_2B595C:
/* 00445C 01DB015C E101023C */  lui         $2, %hi(DispFade)
/* 004460 01DB0160 B0E54424 */  addiu       $4, $2, %lo(DispFade)
/* 004464 01DB0164 DE01013C */  lui         $1, %hi(CScript__2 + 0xC)
/* 004468 01DB0168 0C1B2CC4 */  lwc1        $f12, %lo(CScript__2 + 0xC)($1)
/* 00446C 01DB016C 01000524 */  addiu       $5, $0, 0x1
/* 004470 01DB0170 78B4760C */  jal         FadeOutStart__9CDispFadeFfi
/* 004474 01DB0174 00000000 */   nop
/* 004478 01DB0178 DE01013C */  lui         $1, %hi(CScript__2 + 0x8)
/* 00447C 01DB017C 081B20AC */  sw          $0, %lo(CScript__2 + 0x8)($1)
.L01DB0180_2B5980:
/* 004480 01DB0180 DE01013C */  lui         $1, %hi(CScript__2 + 0x4E8)
/* 004484 01DB0184 E81F2390 */  lbu         $3, %lo(CScript__2 + 0x4E8)($1)
/* 004488 01DB0188 32006010 */  beqz        $3, .L01DB0254_2B5A54
/* 00448C 01DB018C 00000000 */   nop
/* 004490 01DB0190 8CFB040C */  jal         ReadBGSync__Fv
/* 004494 01DB0194 00000000 */   nop
/* 004498 01DB0198 2A004014 */  bnez        $2, .L01DB0244_2B5A44
/* 00449C 01DB019C 00000000 */   nop
/* 0044A0 01DB01A0 DE01013C */  lui         $1, %hi(CScript__2 + 0x4DC)
/* 0044A4 01DB01A4 DC1F238C */  lw          $3, %lo(CScript__2 + 0x4DC)($1)
/* 0044A8 01DB01A8 E101013C */  lui         $1, %hi(Op_MotionInfo)
/* 0044AC 01DB01AC E0CD23AC */  sw          $3, %lo(Op_MotionInfo)($1)
/* 0044B0 01DB01B0 DE01013C */  lui         $1, %hi(CScript__2 + 0x4E0)
/* 0044B4 01DB01B4 E01F238C */  lw          $3, %lo(CScript__2 + 0x4E0)($1)
/* 0044B8 01DB01B8 E101013C */  lui         $1, %hi(Op_MotionInfo + 0x4)
/* 0044BC 01DB01BC E4CD23AC */  sw          $3, %lo(Op_MotionInfo + 0x4)($1)
/* 0044C0 01DB01C0 DE01013C */  lui         $1, %hi(CScript__2 + 0x4E4)
/* 0044C4 01DB01C4 E41F20C4 */  lwc1        $f0, %lo(CScript__2 + 0x4E4)($1)
/* 0044C8 01DB01C8 E101013C */  lui         $1, %hi(Op_MotionInfo + 0x8)
/* 0044CC 01DB01CC E8CD20E4 */  swc1        $f0, %lo(Op_MotionInfo + 0x8)($1)
/* 0044D0 01DB01D0 DE01013C */  lui         $1, %hi(CScript__2 + 0x4E8)
/* 0044D4 01DB01D4 E81F20A0 */  sb          $0, %lo(CScript__2 + 0x4E8)($1)
/* 0044D8 01DB01D8 1C98848F */  lw          $4, -0x67E4($28)
/* 0044DC 01DB01DC 01000324 */  addiu       $3, $0, 0x1
/* 0044E0 01DB01E0 0A008314 */  bne         $4, $3, .L01DB020C_2B5A0C
/* 0044E4 01DB01E4 00000000 */   nop
/* 0044E8 01DB01E8 0498838F */  lw          $3, -0x67FC($28)
/* 0044EC 01DB01EC 01006324 */  addiu       $3, $3, 0x1
/* 0044F0 01DB01F0 049883AF */  sw          $3, -0x67FC($28)
/* 0044F4 01DB01F4 0498838F */  lw          $3, -0x67FC($28)
/* 0044F8 01DB01F8 03006128 */  slti        $1, $3, 0x3
/* 0044FC 01DB01FC 02002014 */  bnez        $1, .L01DB0208_2B5A08
/* 004500 01DB0200 00000000 */   nop
/* 004504 01DB0204 049880AF */  sw          $0, -0x67FC($28)
.L01DB0208_2B5A08:
/* 004508 01DB0208 189880AF */  sw          $0, -0x67E8($28)
.L01DB020C_2B5A0C:
/* 00450C 01DB020C 01000324 */  addiu       $3, $0, 0x1
/* 004510 01DB0210 1C9883AF */  sw          $3, -0x67E4($28)
/* 004514 01DB0214 DE01013C */  lui         $1, %hi(CScript__2 + 0x4DC)
/* 004518 01DB0218 DC1F20C4 */  lwc1        $f0, %lo(CScript__2 + 0x4DC)($1)
/* 00451C 01DB021C 20008046 */  cvt.s.w     $f0, $f0
/* 004520 01DB0220 0498848F */  lw          $4, -0x67FC($28)
/* 004524 01DB0224 B0110324 */  addiu       $3, $0, 0x11B0
/* 004528 01DB0228 18208300 */  mult        $4, $4, $3
/* 00452C 01DB022C E101033C */  lui         $3, %hi(Cam__2 + 0x2F0)
/* 004530 01DB0230 C09B6324 */  addiu       $3, $3, %lo(Cam__2 + 0x2F0)
/* 004534 01DB0234 21186400 */  addu        $3, $3, $4
/* 004538 01DB0238 000060E4 */  swc1        $f0, 0x0($3)
/* 00453C 01DB023C 05000010 */  b           .L01DB0254_2B5A54
/* 004540 01DB0240 00000000 */   nop
.L01DB0244_2B5A44:
/* 004544 01DB0244 8CFB040C */  jal         ReadBGSync__Fv
/* 004548 01DB0248 00000000 */   nop
/* 00454C 01DB024C FDFF4014 */  bnez        $2, .L01DB0244_2B5A44
/* 004550 01DB0250 00000000 */   nop
.L01DB0254_2B5A54:
/* 004554 01DB0254 0498848F */  lw          $4, -0x67FC($28)
/* 004558 01DB0258 B0110324 */  addiu       $3, $0, 0x11B0
/* 00455C 01DB025C 18308300 */  mult        $6, $4, $3
/* 004560 01DB0260 E101033C */  lui         $3, %hi(Cam__2 + 0x2F0)
/* 004564 01DB0264 C09B6324 */  addiu       $3, $3, %lo(Cam__2 + 0x2F0)
/* 004568 01DB0268 21286600 */  addu        $5, $3, $6
/* 00456C 01DB026C 0000A1C4 */  lwc1        $f1, 0x0($5)
/* 004570 01DB0270 DE01013C */  lui         $1, %hi(CScript__2 + 0x4E0)
/* 004574 01DB0274 E01F238C */  lw          $3, %lo(CScript__2 + 0x4E0)($1)
/* 004578 01DB0278 FFFF6424 */  addiu       $4, $3, -0x1
/* 00457C 01DB027C 00008444 */  mtc1        $4, $f0
/* 004580 01DB0280 00000000 */  nop
/* 004584 01DB0284 20008046 */  cvt.s.w     $f0, $f0
/* 004588 01DB0288 36080046 */  c.le.s      $f1, $f0
/* 00458C 01DB028C 00000000 */  nop
/* 004590 01DB0290 02000145 */  bc1t        .L01DB029C_2B5A9C
/* 004594 01DB0294 00000000 */   nop
/* 004598 01DB0298 0000A0E4 */  swc1        $f0, 0x0($5)
.L01DB029C_2B5A9C:
/* 00459C 01DB029C 0C98838F */  lw          $3, -0x67F4($28)
/* 0045A0 01DB02A0 32006014 */  bnez        $3, .L01DB036C_2B5B6C
/* 0045A4 01DB02A4 00000000 */   nop
/* 0045A8 01DB02A8 E101023C */  lui         $2, %hi(OP_MainCamera)
/* 0045AC 01DB02AC E0954324 */  addiu       $3, $2, %lo(OP_MainCamera)
/* 0045B0 01DB02B0 E101023C */  lui         $2, %hi(Cam__2 + 0x310)
/* 0045B4 01DB02B4 E09B4224 */  addiu       $2, $2, %lo(Cam__2 + 0x310)
/* 0045B8 01DB02B8 21104600 */  addu        $2, $2, $6
/* 0045BC 01DB02BC 000043AC */  sw          $3, 0x0($2)
/* 0045C0 01DB02C0 209881C7 */  lwc1        $f1, -0x67E0($28)
/* 0045C4 01DB02C4 00008444 */  mtc1        $4, $f0
/* 0045C8 01DB02C8 00000000 */  nop
/* 0045CC 01DB02CC 20008046 */  cvt.s.w     $f0, $f0
/* 0045D0 01DB02D0 36080046 */  c.le.s      $f1, $f0
/* 0045D4 01DB02D4 00000000 */  nop
/* 0045D8 01DB02D8 02000145 */  bc1t        .L01DB02E4_2B5AE4
/* 0045DC 01DB02DC 00000000 */   nop
/* 0045E0 01DB02E0 209880E7 */  swc1        $f0, -0x67E0($28)
.L01DB02E4_2B5AE4:
/* 0045E4 01DB02E4 0898828F */  lw          $2, -0x67F8($28)
/* 0045E8 01DB02E8 06004010 */  beqz        $2, .L01DB0304_2B5B04
/* 0045EC 01DB02EC 00000000 */   nop
/* 0045F0 01DB02F0 209881C7 */  lwc1        $f1, -0x67E0($28)
/* 0045F4 01DB02F4 DE01013C */  lui         $1, %hi(CScript__2 + 0x4E4)
/* 0045F8 01DB02F8 E41F20C4 */  lwc1        $f0, %lo(CScript__2 + 0x4E4)($1)
/* 0045FC 01DB02FC 01080046 */  sub.s       $f0, $f1, $f0
/* 004600 01DB0300 0000A0E4 */  swc1        $f0, 0x0($5)
.L01DB0304_2B5B04:
/* 004604 01DB0304 DE01013C */  lui         $1, %hi(CScript__2 + 0x24)
/* 004608 01DB0308 241B238C */  lw          $3, %lo(CScript__2 + 0x24)($1)
/* 00460C 01DB030C 01000224 */  addiu       $2, $0, 0x1
/* 004610 01DB0310 06006214 */  bne         $3, $2, .L01DB032C_2B5B2C
/* 004614 01DB0314 00000000 */   nop
/* 004618 01DB0318 209881C7 */  lwc1        $f1, -0x67E0($28)
/* 00461C 01DB031C DE01013C */  lui         $1, %hi(CScript__2 + 0x4E4)
/* 004620 01DB0320 E41F20C4 */  lwc1        $f0, %lo(CScript__2 + 0x4E4)($1)
/* 004624 01DB0324 01080046 */  sub.s       $f0, $f1, $f0
/* 004628 01DB0328 0000A0E4 */  swc1        $f0, 0x0($5)
.L01DB032C_2B5B2C:
/* 00462C 01DB032C E101023C */  lui         $2, %hi(Cam__2)
/* 004630 01DB0330 D0984224 */  addiu       $2, $2, %lo(Cam__2)
/* 004634 01DB0334 21184600 */  addu        $3, $2, $6
/* 004638 01DB0338 E101023C */  lui         $2, %hi(Cam__2 + 0xBC)
/* 00463C 01DB033C 8C994224 */  addiu       $2, $2, %lo(Cam__2 + 0xBC)
/* 004640 01DB0340 21104600 */  addu        $2, $2, $6
/* 004644 01DB0344 0000448C */  lw          $4, 0x0($2)
/* 004648 01DB0348 E0026524 */  addiu       $5, $3, 0x2E0
/* 00464C 01DB034C E101023C */  lui         $2, %hi(Op_MotionInfo)
/* 004650 01DB0350 E0CD4624 */  addiu       $6, $2, %lo(Op_MotionInfo)
/* 004654 01DB0354 F0026724 */  addiu       $7, $3, 0x2F0
/* 004658 01DB0358 0098888F */  lw          $8, -0x6800($28)
/* 00465C 01DB035C 4023050C */  jal         SetMotionEX__FP6CFrameP14tagMOTION_TYPEP11MOTION_INFOP12MOTION_STATEP12tagFRAME_INF
/* 004660 01DB0360 00000000 */   nop
/* 004664 01DB0364 F8BD760C */  jal         LoadSceneBG__Fv
/* 004668 01DB0368 00000000 */   nop
.L01DB036C_2B5B6C:
/* 00466C 01DB036C 0898838F */  lw          $3, -0x67F8($28)
/* 004670 01DB0370 33006014 */  bnez        $3, .L01DB0440_2B5C40
/* 004674 01DB0374 00000000 */   nop
/* 004678 01DB0378 DE01013C */  lui         $1, %hi(CScript__2 + 0x18)
/* 00467C 01DB037C 181B258C */  lw          $5, %lo(CScript__2 + 0x18)($1)
/* 004680 01DB0380 0A00A12C */  sltiu       $1, $5, 0xA
/* 004684 01DB0384 2E002010 */  beqz        $1, .L01DB0440_2B5C40
/* 004688 01DB0388 00000000 */   nop
/* 00468C 01DB038C DE01033C */  lui         $3, %hi(LIT_833__2)
/* 004690 01DB0390 A0D76424 */  addiu       $4, $3, %lo(LIT_833__2)
/* 004694 01DB0394 80180500 */  sll         $3, $5, 2
/* 004698 01DB0398 21186400 */  addu        $3, $3, $4
/* 00469C 01DB039C 0000638C */  lw          $3, 0x0($3)
/* 0046A0 01DB03A0 08006000 */  jr          $3
/* 0046A4 01DB03A4 00000000 */   nop
/* 0046A8 01DB03A8 FCDA760C */  jal         OpA_MotionProcess__Fv
/* 0046AC 01DB03AC 00000000 */   nop
/* 0046B0 01DB03B0 23000010 */  b           .L01DB0440_2B5C40
/* 0046B4 01DB03B4 00000000 */   nop
/* 0046B8 01DB03B8 30EA760C */  jal         OpB_MotionProcess__Fv
/* 0046BC 01DB03BC 00000000 */   nop
/* 0046C0 01DB03C0 1F000010 */  b           .L01DB0440_2B5C40
/* 0046C4 01DB03C4 00000000 */   nop
/* 0046C8 01DB03C8 30EA760C */  jal         OpB_MotionProcess__Fv
/* 0046CC 01DB03CC 00000000 */   nop
/* 0046D0 01DB03D0 1B000010 */  b           .L01DB0440_2B5C40
/* 0046D4 01DB03D4 00000000 */   nop
/* 0046D8 01DB03D8 C0FC760C */  jal         OpC_MotionProcess__Fv
/* 0046DC 01DB03DC 00000000 */   nop
/* 0046E0 01DB03E0 17000010 */  b           .L01DB0440_2B5C40
/* 0046E4 01DB03E4 00000000 */   nop
/* 0046E8 01DB03E8 C0FC760C */  jal         OpC_MotionProcess__Fv
/* 0046EC 01DB03EC 00000000 */   nop
/* 0046F0 01DB03F0 13000010 */  b           .L01DB0440_2B5C40
/* 0046F4 01DB03F4 00000000 */   nop
/* 0046F8 01DB03F8 C0FC760C */  jal         OpC_MotionProcess__Fv
/* 0046FC 01DB03FC 00000000 */   nop
/* 004700 01DB0400 0F000010 */  b           .L01DB0440_2B5C40
/* 004704 01DB0404 00000000 */   nop
/* 004708 01DB0408 C0FC760C */  jal         OpC_MotionProcess__Fv
/* 00470C 01DB040C 00000000 */   nop
/* 004710 01DB0410 0B000010 */  b           .L01DB0440_2B5C40
/* 004714 01DB0414 00000000 */   nop
/* 004718 01DB0418 C0FC760C */  jal         OpC_MotionProcess__Fv
/* 00471C 01DB041C 00000000 */   nop
/* 004720 01DB0420 07000010 */  b           .L01DB0440_2B5C40
/* 004724 01DB0424 00000000 */   nop
/* 004728 01DB0428 3414770C */  jal         OpD_MotionProcess__Fv
/* 00472C 01DB042C 00000000 */   nop
/* 004730 01DB0430 03000010 */  b           .L01DB0440_2B5C40
/* 004734 01DB0434 00000000 */   nop
/* 004738 01DB0438 3414770C */  jal         OpD_MotionProcess__Fv
/* 00473C 01DB043C 00000000 */   nop
.L01DB0440_2B5C40:
/* 004740 01DB0440 0000BF7B */  lq          $31, 0x0($29)
/* 004744 01DB0444 1000BD27 */  addiu       $29, $29, 0x10
/* 004748 01DB0448 0800E003 */  jr          $31
/* 00474C 01DB044C 00000000 */   nop
