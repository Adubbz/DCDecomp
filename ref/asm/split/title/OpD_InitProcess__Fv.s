.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel OpD_InitProcess__Fv
/* 018480 01DC4180 40FDBD27 */  addiu       $29, $29, -0x2C0
/* 018484 01DC4184 4000BF7F */  sq          $31, 0x40($29)
/* 018488 01DC4188 3000B37F */  sq          $19, 0x30($29)
/* 01848C 01DC418C 2000B27F */  sq          $18, 0x20($29)
/* 018490 01DC4190 1000B17F */  sq          $17, 0x10($29)
/* 018494 01DC4194 0000B07F */  sq          $16, 0x0($29)
.L01DC4198_2C9998:
/* 018498 01DC4198 8CFB040C */  jal         ReadBGSync__Fv
/* 01849C 01DC419C 00000000 */   nop
/* 0184A0 01DC41A0 FDFF4014 */  bnez        $2, .L01DC4198_2C9998
/* 0184A4 01DC41A4 00000000 */   nop
/* 0184A8 01DC41A8 28860070 */  paddub      $16, $0, $0
/* 0184AC 01DC41AC 07000010 */  b           .L01DC41CC_2C99CC
/* 0184B0 01DC41B0 00000000 */   nop
.L01DC41B4_2C99B4:
/* 0184B4 01DC41B4 C701023C */  lui         $2, %hi(TexManager)
/* 0184B8 01DC41B8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0184BC 01DC41BC 282E0072 */  paddub      $5, $16, $0
/* 0184C0 01DC41C0 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 0184C4 01DC41C4 00000000 */   nop
/* 0184C8 01DC41C8 01001026 */  addiu       $16, $16, 0x1
.L01DC41CC_2C99CC:
/* 0184CC 01DC41CC 1100022A */  slti        $2, $16, 0x11
/* 0184D0 01DC41D0 F8FF4014 */  bnez        $2, .L01DC41B4_2C99B4
/* 0184D4 01DC41D4 00000000 */   nop
/* 0184D8 01DC41D8 C701023C */  lui         $2, %hi(TexManager)
/* 0184DC 01DC41DC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0184E0 01DC41E0 FCCD040C */  jal         CleanUpBuffer__15CTextureManagerFv
/* 0184E4 01DC41E4 00000000 */   nop
/* 0184E8 01DC41E8 DE01023C */  lui         $2, %hi(LIT_382__2)
/* 0184EC 01DC41EC 60AD4624 */  addiu       $6, $2, %lo(LIT_382__2)
/* 0184F0 01DC41F0 5000A527 */  addiu       $5, $29, 0x50
/* 0184F4 01DC41F4 03000424 */  addiu       $4, $0, 0x3
.L01DC41F8_2C99F8:
/* 0184F8 01DC41F8 0000C378 */  lq          $3, 0x0($6)
/* 0184FC 01DC41FC 1000C278 */  lq          $2, 0x10($6)
/* 018500 01DC4200 2000C624 */  addiu       $6, $6, 0x20
/* 018504 01DC4204 FFFF8424 */  addiu       $4, $4, -0x1
/* 018508 01DC4208 0000A37C */  sq          $3, 0x0($5)
/* 01850C 01DC420C 1000A27C */  sq          $2, 0x10($5)
/* 018510 01DC4210 2000A524 */  addiu       $5, $5, 0x20
/* 018514 01DC4214 F8FF801C */  bgtz        $4, .L01DC41F8_2C99F8
/* 018518 01DC4218 00000000 */   nop
/* 01851C 01DC421C 0000C3DC */  ld          $3, 0x0($6)
/* 018520 01DC4220 0800C2C4 */  lwc1        $f2, 0x8($6)
/* 018524 01DC4224 0000A3FC */  sd          $3, 0x0($5)
/* 018528 01DC4228 0800A2E4 */  swc1        $f2, 0x8($5)
/* 01852C 01DC422C 948B848F */  lw          $4, -0x746C($28)
/* 018530 01DC4230 DE01023C */  lui         $2, %hi(LIT_416__5)
/* 018534 01DC4234 38FB4524 */  addiu       $5, $2, %lo(LIT_416__5)
/* 018538 01DC4238 28360070 */  paddub      $6, $0, $0
/* 01853C 01DC423C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 018540 01DC4240 00000000 */   nop
/* 018544 01DC4244 5C00B027 */  addiu       $16, $29, 0x5C
/* 018548 01DC4248 000002AE */  sw          $2, 0x0($16)
/* 01854C 01DC424C 948B848F */  lw          $4, -0x746C($28)
/* 018550 01DC4250 DE01023C */  lui         $2, %hi(LIT_417__6)
/* 018554 01DC4254 48FB4524 */  addiu       $5, $2, %lo(LIT_417__6)
/* 018558 01DC4258 28360070 */  paddub      $6, $0, $0
/* 01855C 01DC425C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 018560 01DC4260 00000000 */   nop
/* 018564 01DC4264 6800B127 */  addiu       $17, $29, 0x68
/* 018568 01DC4268 000022AE */  sw          $2, 0x0($17)
/* 01856C 01DC426C 948B848F */  lw          $4, -0x746C($28)
/* 018570 01DC4270 DE01023C */  lui         $2, %hi(LIT_418__5)
/* 018574 01DC4274 58FB4524 */  addiu       $5, $2, %lo(LIT_418__5)
/* 018578 01DC4278 28360070 */  paddub      $6, $0, $0
/* 01857C 01DC427C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 018580 01DC4280 00000000 */   nop
/* 018584 01DC4284 7400A2AF */  sw          $2, 0x74($29)
/* 018588 01DC4288 948B848F */  lw          $4, -0x746C($28)
/* 01858C 01DC428C DE01023C */  lui         $2, %hi(LIT_419__3)
/* 018590 01DC4290 68FB4524 */  addiu       $5, $2, %lo(LIT_419__3)
/* 018594 01DC4294 28360070 */  paddub      $6, $0, $0
/* 018598 01DC4298 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 01859C 01DC429C 00000000 */   nop
/* 0185A0 01DC42A0 8000A2AF */  sw          $2, 0x80($29)
/* 0185A4 01DC42A4 948B848F */  lw          $4, -0x746C($28)
/* 0185A8 01DC42A8 DE01023C */  lui         $2, %hi(LIT_420__4)
/* 0185AC 01DC42AC 78FB4524 */  addiu       $5, $2, %lo(LIT_420__4)
/* 0185B0 01DC42B0 28360070 */  paddub      $6, $0, $0
/* 0185B4 01DC42B4 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0185B8 01DC42B8 00000000 */   nop
/* 0185BC 01DC42BC 8C00A2AF */  sw          $2, 0x8C($29)
/* 0185C0 01DC42C0 948B848F */  lw          $4, -0x746C($28)
/* 0185C4 01DC42C4 DE01023C */  lui         $2, %hi(LIT_421__6)
/* 0185C8 01DC42C8 88FB4524 */  addiu       $5, $2, %lo(LIT_421__6)
/* 0185CC 01DC42CC 28360070 */  paddub      $6, $0, $0
/* 0185D0 01DC42D0 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0185D4 01DC42D4 00000000 */   nop
/* 0185D8 01DC42D8 9800A2AF */  sw          $2, 0x98($29)
/* 0185DC 01DC42DC 948B848F */  lw          $4, -0x746C($28)
/* 0185E0 01DC42E0 DE01023C */  lui         $2, %hi(LIT_422__4)
/* 0185E4 01DC42E4 98FB4524 */  addiu       $5, $2, %lo(LIT_422__4)
/* 0185E8 01DC42E8 28360070 */  paddub      $6, $0, $0
/* 0185EC 01DC42EC C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0185F0 01DC42F0 00000000 */   nop
/* 0185F4 01DC42F4 A400A2AF */  sw          $2, 0xA4($29)
/* 0185F8 01DC42F8 C701023C */  lui         $2, %hi(TexManager)
/* 0185FC 01DC42FC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 018600 01DC4300 FFFF0524 */  addiu       $5, $0, -0x1
/* 018604 01DC4304 5000A627 */  addiu       $6, $29, 0x50
/* 018608 01DC4308 C8CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 01860C 01DC430C 00000000 */   nop
/* 018610 01DC4310 948B848F */  lw          $4, -0x746C($28)
/* 018614 01DC4314 DE01023C */  lui         $2, %hi(LIT_423__3)
/* 018618 01DC4318 A8FB4524 */  addiu       $5, $2, %lo(LIT_423__3)
/* 01861C 01DC431C 28360070 */  paddub      $6, $0, $0
/* 018620 01DC4320 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 018624 01DC4324 00000000 */   nop
/* 018628 01DC4328 5000A2AF */  sw          $2, 0x50($29)
/* 01862C 01DC432C 01000224 */  addiu       $2, $0, 0x1
/* 018630 01DC4330 5400B227 */  addiu       $18, $29, 0x54
/* 018634 01DC4334 000042AE */  sw          $2, 0x0($18)
/* 018638 01DC4338 5800B327 */  addiu       $19, $29, 0x58
/* 01863C 01DC433C 000060AE */  sw          $0, 0x0($19)
/* 018640 01DC4340 948B848F */  lw          $4, -0x746C($28)
/* 018644 01DC4344 DE01023C */  lui         $2, %hi(LIT_424__4)
/* 018648 01DC4348 B8FB4524 */  addiu       $5, $2, %lo(LIT_424__4)
/* 01864C 01DC434C 28360070 */  paddub      $6, $0, $0
/* 018650 01DC4350 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 018654 01DC4354 00000000 */   nop
/* 018658 01DC4358 000002AE */  sw          $2, 0x0($16)
/* 01865C 01DC435C 01000524 */  addiu       $5, $0, 0x1
/* 018660 01DC4360 6000A5AF */  sw          $5, 0x60($29)
/* 018664 01DC4364 6400A0AF */  sw          $0, 0x64($29)
/* 018668 01DC4368 000020AE */  sw          $0, 0x0($17)
/* 01866C 01DC436C C701023C */  lui         $2, %hi(TexManager)
/* 018670 01DC4370 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 018674 01DC4374 5000A627 */  addiu       $6, $29, 0x50
/* 018678 01DC4378 C8CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 01867C 01DC437C 00000000 */   nop
/* 018680 01DC4380 948B848F */  lw          $4, -0x746C($28)
/* 018684 01DC4384 DE01023C */  lui         $2, %hi(LIT_425__5)
/* 018688 01DC4388 C8FB4524 */  addiu       $5, $2, %lo(LIT_425__5)
/* 01868C 01DC438C 28360070 */  paddub      $6, $0, $0
/* 018690 01DC4390 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 018694 01DC4394 00000000 */   nop
/* 018698 01DC4398 5000A2AF */  sw          $2, 0x50($29)
/* 01869C 01DC439C 02000524 */  addiu       $5, $0, 0x2
/* 0186A0 01DC43A0 000045AE */  sw          $5, 0x0($18)
/* 0186A4 01DC43A4 000060AE */  sw          $0, 0x0($19)
/* 0186A8 01DC43A8 000000AE */  sw          $0, 0x0($16)
/* 0186AC 01DC43AC C701023C */  lui         $2, %hi(TexManager)
/* 0186B0 01DC43B0 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0186B4 01DC43B4 5000A627 */  addiu       $6, $29, 0x50
/* 0186B8 01DC43B8 C8CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 0186BC 01DC43BC 00000000 */   nop
/* 0186C0 01DC43C0 DF01013C */  lui         $1, %hi(MapDataBuffer + 0x8)
/* 0186C4 01DC43C4 B8FE20AC */  sw          $0, %lo(MapDataBuffer + 0x8)($1)
/* 0186C8 01DC43C8 948B848F */  lw          $4, -0x746C($28)
/* 0186CC 01DC43CC DE01023C */  lui         $2, %hi(LIT_426__3)
/* 0186D0 01DC43D0 D8FB4524 */  addiu       $5, $2, %lo(LIT_426__3)
/* 0186D4 01DC43D4 28360070 */  paddub      $6, $0, $0
/* 0186D8 01DC43D8 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0186DC 01DC43DC 00000000 */   nop
/* 0186E0 01DC43E0 28264070 */  paddub      $4, $2, $0
/* 0186E4 01DC43E4 DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 0186E8 01DC43E8 B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 0186EC 01DC43EC 02000624 */  addiu       $6, $0, 0x2
/* 0186F0 01DC43F0 283E0070 */  paddub      $7, $0, $0
/* 0186F4 01DC43F4 28460070 */  paddub      $8, $0, $0
/* 0186F8 01DC43F8 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 0186FC 01DC43FC 00000000 */   nop
/* 018700 01DC4400 28864070 */  paddub      $16, $2, $0
/* 018704 01DC4404 E201023C */  lui         $2, %hi(OP_NornMapObj)
/* 018708 01DC4408 B0F64424 */  addiu       $4, $2, %lo(OP_NornMapObj)
/* 01870C 01DC440C 445E050C */  jal         Initialize__10CMapObjectFv
/* 018710 01DC4410 00000000 */   nop
/* 018714 01DC4414 E201023C */  lui         $2, %hi(OP_NornMapObj)
/* 018718 01DC4418 B0F64424 */  addiu       $4, $2, %lo(OP_NornMapObj)
/* 01871C 01DC441C 282E0072 */  paddub      $5, $16, $0
/* 018720 01DC4420 28360070 */  paddub      $6, $0, $0
/* 018724 01DC4424 305C050C */  jal         SetFrame__12CObjectFrameFP9CFrameVu1i
/* 018728 01DC4428 00000000 */   nop
/* 01872C 01DC442C E201013C */  lui         $1, %hi(OP_NornMapObj + 0xE8)
/* 018730 01DC4430 98F720AC */  sw          $0, %lo(OP_NornMapObj + 0xE8)($1)
/* 018734 01DC4434 E201013C */  lui         $1, %hi(OP_NornMapObj + 0xE4)
/* 018738 01DC4438 94F720AC */  sw          $0, %lo(OP_NornMapObj + 0xE4)($1)
/* 01873C 01DC443C A002A0AF */  sw          $0, 0x2A0($29)
/* 018740 01DC4440 A402A0AF */  sw          $0, 0x2A4($29)
/* 018744 01DC4444 A802A0AF */  sw          $0, 0x2A8($29)
/* 018748 01DC4448 E201023C */  lui         $2, %hi(OP_NornMapObj)
/* 01874C 01DC444C B0F64424 */  addiu       $4, $2, %lo(OP_NornMapObj)
/* 018750 01DC4450 A002A527 */  addiu       $5, $29, 0x2A0
/* 018754 01DC4454 A000998C */  lw          $25, 0xA0($4)
/* 018758 01DC4458 1000398F */  lw          $25, 0x10($25)
/* 01875C 01DC445C 09F82003 */  jalr        $25
/* 018760 01DC4460 00000000 */   nop
/* 018764 01DC4464 B002A0AF */  sw          $0, 0x2B0($29)
/* 018768 01DC4468 B402A0AF */  sw          $0, 0x2B4($29)
/* 01876C 01DC446C B802A0AF */  sw          $0, 0x2B8($29)
/* 018770 01DC4470 E201023C */  lui         $2, %hi(OP_NornMapObj)
/* 018774 01DC4474 B0F64424 */  addiu       $4, $2, %lo(OP_NornMapObj)
/* 018778 01DC4478 B002A527 */  addiu       $5, $29, 0x2B0
/* 01877C 01DC447C A000998C */  lw          $25, 0xA0($4)
/* 018780 01DC4480 2C00398F */  lw          $25, 0x2C($25)
/* 018784 01DC4484 09F82003 */  jalr        $25
/* 018788 01DC4488 00000000 */   nop
/* 01878C 01DC448C 948B848F */  lw          $4, -0x746C($28)
/* 018790 01DC4490 DE01023C */  lui         $2, %hi(LIT_427__3)
/* 018794 01DC4494 E8FB4524 */  addiu       $5, $2, %lo(LIT_427__3)
/* 018798 01DC4498 28360070 */  paddub      $6, $0, $0
/* 01879C 01DC449C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0187A0 01DC44A0 00000000 */   nop
/* 0187A4 01DC44A4 28264070 */  paddub      $4, $2, $0
/* 0187A8 01DC44A8 DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x60)
/* 0187AC 01DC44AC 60FE4524 */  addiu       $5, $2, %lo(CharaDataBuffer__2 + 0x60)
/* 0187B0 01DC44B0 02000624 */  addiu       $6, $0, 0x2
/* 0187B4 01DC44B4 283E0070 */  paddub      $7, $0, $0
/* 0187B8 01DC44B8 28460070 */  paddub      $8, $0, $0
/* 0187BC 01DC44BC AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 0187C0 01DC44C0 00000000 */   nop
/* 0187C4 01DC44C4 E301013C */  lui         $1, %hi(Hamon)
/* 0187C8 01DC44C8 B0D222AC */  sw          $2, %lo(Hamon)($1)
/* 0187CC 01DC44CC E301013C */  lui         $1, %hi(Hamon)
/* 0187D0 01DC44D0 B0D2228C */  lw          $2, %lo(Hamon)($1)
/* 0187D4 01DC44D4 E301013C */  lui         $1, %hi(Hamon + 0xC)
/* 0187D8 01DC44D8 BCD222AC */  sw          $2, %lo(Hamon + 0xC)($1)
/* 0187DC 01DC44DC E301013C */  lui         $1, %hi(Hamon + 0x8)
/* 0187E0 01DC44E0 B8D222AC */  sw          $2, %lo(Hamon + 0x8)($1)
/* 0187E4 01DC44E4 E301013C */  lui         $1, %hi(Hamon + 0x4)
/* 0187E8 01DC44E8 B4D222AC */  sw          $2, %lo(Hamon + 0x4)($1)
/* 0187EC 01DC44EC E301013C */  lui         $1, %hi(HScale)
/* 0187F0 01DC44F0 C0D220AC */  sw          $0, %lo(HScale)($1)
/* 0187F4 01DC44F4 8C8280C7 */  lwc1        $f0, -0x7D74($28)
/* 0187F8 01DC44F8 E301013C */  lui         $1, %hi(HScale + 0x4)
/* 0187FC 01DC44FC C4D220E4 */  swc1        $f0, %lo(HScale + 0x4)($1)
/* 018800 01DC4500 A88380C7 */  lwc1        $f0, -0x7C58($28)
/* 018804 01DC4504 E301013C */  lui         $1, %hi(HScale + 0x8)
/* 018808 01DC4508 C8D220E4 */  swc1        $f0, %lo(HScale + 0x8)($1)
/* 01880C 01DC450C AC8380C7 */  lwc1        $f0, -0x7C54($28)
/* 018810 01DC4510 E301013C */  lui         $1, %hi(HScale + 0xC)
/* 018814 01DC4514 CCD220E4 */  swc1        $f0, %lo(HScale + 0xC)($1)
/* 018818 01DC4518 B08380C7 */  lwc1        $f0, -0x7C50($28)
/* 01881C 01DC451C E301013C */  lui         $1, %hi(HScale + 0x10)
/* 018820 01DC4520 D0D220E4 */  swc1        $f0, %lo(HScale + 0x10)($1)
/* 018824 01DC4524 B89880AF */  sw          $0, -0x6748($28)
/* 018828 01DC4528 DE01023C */  lui         $2, %hi(LIT_432__3)
/* 01882C 01DC452C 00FC4424 */  addiu       $4, $2, %lo(LIT_432__3)
/* 018830 01DC4530 00C5760C */  jal         OPAnalyz__FPc
/* 018834 01DC4534 00000000 */   nop
/* 018838 01DC4538 4CCA760C */  jal         OPMdsLoad__Fv
/* 01883C 01DC453C 00000000 */   nop
/* 018840 01DC4540 DF01013C */  lui         $1, %hi(CharaDataBuffer__2 + 0x68)
/* 018844 01DC4544 68FE20AC */  sw          $0, %lo(CharaDataBuffer__2 + 0x68)($1)
/* 018848 01DC4548 E001023C */  lui         $2, %hi(MainMonstorUnit + 0x490)
/* 01884C 01DC454C 608C4424 */  addiu       $4, $2, %lo(MainMonstorUnit + 0x490)
/* 018850 01DC4550 948B858F */  lw          $5, -0x746C($28)
/* 018854 01DC4554 DE01023C */  lui         $2, %hi(LIT_433__3)
/* 018858 01DC4558 18FC4624 */  addiu       $6, $2, %lo(LIT_433__3)
/* 01885C 01DC455C DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x60)
/* 018860 01DC4560 60FE4724 */  addiu       $7, $2, %lo(CharaDataBuffer__2 + 0x60)
/* 018864 01DC4564 28460070 */  paddub      $8, $0, $0
/* 018868 01DC4568 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 01886C 01DC456C 00000000 */   nop
/* 018870 01DC4570 C000A427 */  addiu       $4, $29, 0xC0
/* 018874 01DC4574 509F040C */  jal         __ct__10CFrameAttrFv
/* 018878 01DC4578 00000000 */   nop
/* 01887C 01DC457C C800B027 */  addiu       $16, $29, 0xC8
/* 018880 01DC4580 000000A2 */  sb          $0, 0x0($16)
/* 018884 01DC4584 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x54C)
/* 018888 01DC4588 1C8D248C */  lw          $4, %lo(MainMonstorUnit + 0x54C)($1)
/* 01888C 01DC458C C000A527 */  addiu       $5, $29, 0xC0
/* 018890 01DC4590 01000624 */  addiu       $6, $0, 0x1
/* 018894 01DC4594 04000724 */  addiu       $7, $0, 0x4
/* 018898 01DC4598 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 01889C 01DC459C 00000000 */   nop
/* 0188A0 01DC45A0 7042023C */  lui         $2, (0x42700000 >> 16)
/* 0188A4 01DC45A4 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x780)
/* 0188A8 01DC45A8 508F22AC */  sw          $2, %lo(MainMonstorUnit + 0x780)($1)
/* 0188AC 01DC45AC 948280C7 */  lwc1        $f0, -0x7D6C($28)
/* 0188B0 01DC45B0 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x788)
/* 0188B4 01DC45B4 588F20E4 */  swc1        $f0, %lo(MainMonstorUnit + 0x788)($1)
/* 0188B8 01DC45B8 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x794)
/* 0188BC 01DC45BC 648F20AC */  sw          $0, %lo(MainMonstorUnit + 0x794)($1)
/* 0188C0 01DC45C0 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x798)
/* 0188C4 01DC45C4 688F20AC */  sw          $0, %lo(MainMonstorUnit + 0x798)($1)
/* 0188C8 01DC45C8 01000224 */  addiu       $2, $0, 0x1
/* 0188CC 01DC45CC E101013C */  lui         $1, %hi(CharaTex__2 + 0x8)
/* 0188D0 01DC45D0 B89522A0 */  sb          $2, %lo(CharaTex__2 + 0x8)($1)
/* 0188D4 01DC45D4 E001023C */  lui         $2, %hi(MainMonstorUnit + 0x39A0)
/* 0188D8 01DC45D8 70C14424 */  addiu       $4, $2, %lo(MainMonstorUnit + 0x39A0)
/* 0188DC 01DC45DC 948B858F */  lw          $5, -0x746C($28)
/* 0188E0 01DC45E0 DE01023C */  lui         $2, %hi(LIT_435__5)
/* 0188E4 01DC45E4 28FC4624 */  addiu       $6, $2, %lo(LIT_435__5)
/* 0188E8 01DC45E8 DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x60)
/* 0188EC 01DC45EC 60FE4724 */  addiu       $7, $2, %lo(CharaDataBuffer__2 + 0x60)
/* 0188F0 01DC45F0 28460070 */  paddub      $8, $0, $0
/* 0188F4 01DC45F4 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 0188F8 01DC45F8 00000000 */   nop
/* 0188FC 01DC45FC 000000A2 */  sb          $0, 0x0($16)
/* 018900 01DC4600 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x3A5C)
/* 018904 01DC4604 2CC2248C */  lw          $4, %lo(MainMonstorUnit + 0x3A5C)($1)
/* 018908 01DC4608 C000A527 */  addiu       $5, $29, 0xC0
/* 01890C 01DC460C 01000624 */  addiu       $6, $0, 0x1
/* 018910 01DC4610 04000724 */  addiu       $7, $0, 0x4
/* 018914 01DC4614 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 018918 01DC4618 00000000 */   nop
/* 01891C 01DC461C 9642023C */  lui         $2, (0x42960000 >> 16)
/* 018920 01DC4620 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x3C90)
/* 018924 01DC4624 60C422AC */  sw          $2, %lo(MainMonstorUnit + 0x3C90)($1)
/* 018928 01DC4628 948280C7 */  lwc1        $f0, -0x7D6C($28)
/* 01892C 01DC462C E001013C */  lui         $1, %hi(MainMonstorUnit + 0x3C98)
/* 018930 01DC4630 68C420E4 */  swc1        $f0, %lo(MainMonstorUnit + 0x3C98)($1)
/* 018934 01DC4634 01000224 */  addiu       $2, $0, 0x1
/* 018938 01DC4638 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x3CA4)
/* 01893C 01DC463C 74C422AC */  sw          $2, %lo(MainMonstorUnit + 0x3CA4)($1)
/* 018940 01DC4640 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x3CA8)
/* 018944 01DC4644 78C422AC */  sw          $2, %lo(MainMonstorUnit + 0x3CA8)($1)
/* 018948 01DC4648 E101013C */  lui         $1, %hi(CharaTex__2 + 0xB)
/* 01894C 01DC464C BB9522A0 */  sb          $2, %lo(CharaTex__2 + 0xB)($1)
/* 018950 01DC4650 E001023C */  lui         $2, %hi(MainMonstorUnit + 0xEA80)
/* 018954 01DC4654 50724424 */  addiu       $4, $2, %lo(MainMonstorUnit + 0xEA80)
/* 018958 01DC4658 948B858F */  lw          $5, -0x746C($28)
/* 01895C 01DC465C DE01023C */  lui         $2, %hi(LIT_436__4)
/* 018960 01DC4660 38FC4624 */  addiu       $6, $2, %lo(LIT_436__4)
/* 018964 01DC4664 DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x60)
/* 018968 01DC4668 60FE4724 */  addiu       $7, $2, %lo(CharaDataBuffer__2 + 0x60)
/* 01896C 01DC466C 28460070 */  paddub      $8, $0, $0
/* 018970 01DC4670 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 018974 01DC4674 00000000 */   nop
/* 018978 01DC4678 2001A427 */  addiu       $4, $29, 0x120
/* 01897C 01DC467C 509F040C */  jal         __ct__10CFrameAttrFv
/* 018980 01DC4680 00000000 */   nop
/* 018984 01DC4684 2801A0A3 */  sb          $0, 0x128($29)
/* 018988 01DC4688 E001013C */  lui         $1, %hi(MainMonstorUnit + 0xEB3C)
/* 01898C 01DC468C 0C73248C */  lw          $4, %lo(MainMonstorUnit + 0xEB3C)($1)
/* 018990 01DC4690 2001A527 */  addiu       $5, $29, 0x120
/* 018994 01DC4694 01000624 */  addiu       $6, $0, 0x1
/* 018998 01DC4698 04000724 */  addiu       $7, $0, 0x4
/* 01899C 01DC469C D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 0189A0 01DC46A0 00000000 */   nop
/* 0189A4 01DC46A4 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0189A8 01DC46A8 E001013C */  lui         $1, %hi(MainMonstorUnit + 0xED70)
/* 0189AC 01DC46AC 407522AC */  sw          $2, %lo(MainMonstorUnit + 0xED70)($1)
/* 0189B0 01DC46B0 948280C7 */  lwc1        $f0, -0x7D6C($28)
/* 0189B4 01DC46B4 E001013C */  lui         $1, %hi(MainMonstorUnit + 0xED78)
/* 0189B8 01DC46B8 487520E4 */  swc1        $f0, %lo(MainMonstorUnit + 0xED78)($1)
/* 0189BC 01DC46BC E001013C */  lui         $1, %hi(MainMonstorUnit + 0xED84)
/* 0189C0 01DC46C0 547520AC */  sw          $0, %lo(MainMonstorUnit + 0xED84)($1)
/* 0189C4 01DC46C4 E001013C */  lui         $1, %hi(MainMonstorUnit + 0xED88)
/* 0189C8 01DC46C8 587520AC */  sw          $0, %lo(MainMonstorUnit + 0xED88)($1)
/* 0189CC 01DC46CC 02000224 */  addiu       $2, $0, 0x2
/* 0189D0 01DC46D0 E101013C */  lui         $1, %hi(CharaTex__2 + 0x15)
/* 0189D4 01DC46D4 C59522A0 */  sb          $2, %lo(CharaTex__2 + 0x15)($1)
/* 0189D8 01DC46D8 E301023C */  lui         $2, %hi(Effect)
/* 0189DC 01DC46DC E0D24424 */  addiu       $4, $2, %lo(Effect)
/* 0189E0 01DC46E0 948B858F */  lw          $5, -0x746C($28)
/* 0189E4 01DC46E4 DE01023C */  lui         $2, %hi(LIT_437__4)
/* 0189E8 01DC46E8 48FC4624 */  addiu       $6, $2, %lo(LIT_437__4)
/* 0189EC 01DC46EC DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x60)
/* 0189F0 01DC46F0 60FE4724 */  addiu       $7, $2, %lo(CharaDataBuffer__2 + 0x60)
/* 0189F4 01DC46F4 28460070 */  paddub      $8, $0, $0
/* 0189F8 01DC46F8 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 0189FC 01DC46FC 00000000 */   nop
/* 018A00 01DC4700 8001A427 */  addiu       $4, $29, 0x180
/* 018A04 01DC4704 509F040C */  jal         __ct__10CFrameAttrFv
/* 018A08 01DC4708 00000000 */   nop
/* 018A0C 01DC470C 8801A0A3 */  sb          $0, 0x188($29)
/* 018A10 01DC4710 E301013C */  lui         $1, %hi(Effect + 0xBC)
/* 018A14 01DC4714 9CD3248C */  lw          $4, %lo(Effect + 0xBC)($1)
/* 018A18 01DC4718 8001A527 */  addiu       $5, $29, 0x180
/* 018A1C 01DC471C 01000624 */  addiu       $6, $0, 0x1
/* 018A20 01DC4720 04000724 */  addiu       $7, $0, 0x4
/* 018A24 01DC4724 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 018A28 01DC4728 00000000 */   nop
/* 018A2C 01DC472C 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 018A30 01DC4730 E301013C */  lui         $1, %hi(Effect + 0x2F0)
/* 018A34 01DC4734 D0D522AC */  sw          $2, %lo(Effect + 0x2F0)($1)
/* 018A38 01DC4738 E301013C */  lui         $1, %hi(Effect + 0x2F8)
/* 018A3C 01DC473C D8D522AC */  sw          $2, %lo(Effect + 0x2F8)($1)
/* 018A40 01DC4740 E301013C */  lui         $1, %hi(Effect + 0x304)
/* 018A44 01DC4744 E4D520AC */  sw          $0, %lo(Effect + 0x304)($1)
/* 018A48 01DC4748 E301013C */  lui         $1, %hi(Effect + 0x308)
/* 018A4C 01DC474C E8D520AC */  sw          $0, %lo(Effect + 0x308)($1)
/* 018A50 01DC4750 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 018A54 01DC4754 282E0070 */  paddub      $5, $0, $0
/* 018A58 01DC4758 04000624 */  addiu       $6, $0, 0x4
/* 018A5C 01DC475C 32000724 */  addiu       $7, $0, 0x32
/* 018A60 01DC4760 140F050C */  jal         SetReverb__6CSoundFiii
/* 018A64 01DC4764 00000000 */   nop
/* 018A68 01DC4768 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 018A6C 01DC476C 01000524 */  addiu       $5, $0, 0x1
/* 018A70 01DC4770 02000624 */  addiu       $6, $0, 0x2
/* 018A74 01DC4774 05000724 */  addiu       $7, $0, 0x5
/* 018A78 01DC4778 140F050C */  jal         SetReverb__6CSoundFiii
/* 018A7C 01DC477C 00000000 */   nop
/* 018A80 01DC4780 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 018A84 01DC4784 DE01023C */  lui         $2, %hi(LIT_438__2)
/* 018A88 01DC4788 58FC4524 */  addiu       $5, $2, %lo(LIT_438__2)
/* 018A8C 01DC478C 948B868F */  lw          $6, -0x746C($28)
/* 018A90 01DC4790 3410050C */  jal         LoadSoundFileFromPack__6CSoundFPcPUi
/* 018A94 01DC4794 00000000 */   nop
/* 018A98 01DC4798 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 018A9C 01DC479C 0F000524 */  addiu       $5, $0, 0xF
/* 018AA0 01DC47A0 00010624 */  addiu       $6, $0, 0x100
/* 018AA4 01DC47A4 581A050C */  jal         SetVol__6CSoundFii
/* 018AA8 01DC47A8 00000000 */   nop
/* 018AAC 01DC47AC 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 018AB0 01DC47B0 0E000524 */  addiu       $5, $0, 0xE
/* 018AB4 01DC47B4 00010624 */  addiu       $6, $0, 0x100
/* 018AB8 01DC47B8 581A050C */  jal         SetVol__6CSoundFii
/* 018ABC 01DC47BC 00000000 */   nop
/* 018AC0 01DC47C0 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 018AC4 01DC47C4 0D000524 */  addiu       $5, $0, 0xD
/* 018AC8 01DC47C8 00010624 */  addiu       $6, $0, 0x100
/* 018ACC 01DC47CC 581A050C */  jal         SetVol__6CSoundFii
/* 018AD0 01DC47D0 00000000 */   nop
/* 018AD4 01DC47D4 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 018AD8 01DC47D8 0C000524 */  addiu       $5, $0, 0xC
/* 018ADC 01DC47DC 00010624 */  addiu       $6, $0, 0x100
/* 018AE0 01DC47E0 581A050C */  jal         SetVol__6CSoundFii
/* 018AE4 01DC47E4 00000000 */   nop
/* 018AE8 01DC47E8 DE01023C */  lui         $2, %hi(LIT_388__4)
/* 018AEC 01DC47EC D0AD4524 */  addiu       $5, $2, %lo(LIT_388__4)
/* 018AF0 01DC47F0 E001A427 */  addiu       $4, $29, 0x1E0
/* 018AF4 01DC47F4 0B000324 */  addiu       $3, $0, 0xB
.L01DC47F8_2C9FF8:
/* 018AF8 01DC47F8 0000A278 */  lq          $2, 0x0($5)
/* 018AFC 01DC47FC 1000A524 */  addiu       $5, $5, 0x10
/* 018B00 01DC4800 FFFF6324 */  addiu       $3, $3, -0x1
/* 018B04 01DC4804 0000827C */  sq          $2, 0x0($4)
/* 018B08 01DC4808 10008424 */  addiu       $4, $4, 0x10
/* 018B0C 01DC480C FAFF601C */  bgtz        $3, .L01DC47F8_2C9FF8
/* 018B10 01DC4810 00000000 */   nop
/* 018B14 01DC4814 0000A2C4 */  lwc1        $f2, 0x0($5)
/* 018B18 01DC4818 000082E4 */  swc1        $f2, 0x0($4)
/* 018B1C 01DC481C C701023C */  lui         $2, %hi(TexManager)
/* 018B20 01DC4820 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 018B24 01DC4824 FFFF0524 */  addiu       $5, $0, -0x1
/* 018B28 01DC4828 E001A627 */  addiu       $6, $29, 0x1E0
/* 018B2C 01DC482C 948B878F */  lw          $7, -0x746C($28)
/* 018B30 01DC4830 58CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP16LOADTEXTURE_INFOPUi
/* 018B34 01DC4834 00000000 */   nop
/* 018B38 01DC4838 282E0070 */  paddub      $5, $0, $0
/* 018B3C 01DC483C 15000010 */  b           .L01DC4894_2CA094
/* 018B40 01DC4840 00000000 */   nop
.L01DC4844_2CA044:
/* 018B44 01DC4844 23200500 */  negu        $4, $5
/* 018B48 01DC4848 80300500 */  sll         $6, $5, 2
/* 018B4C 01DC484C E301033C */  lui         $3, %hi(SeireiKing + 0x140)
/* 018B50 01DC4850 D0E56324 */  addiu       $3, $3, %lo(SeireiKing + 0x140)
/* 018B54 01DC4854 21186600 */  addu        $3, $3, $6
/* 018B58 01DC4858 000064AC */  sw          $4, 0x0($3)
/* 018B5C 01DC485C 00008544 */  mtc1        $5, $f0
/* 018B60 01DC4860 00000000 */  nop
/* 018B64 01DC4864 60008046 */  cvt.s.w     $f1, $f0
/* 018B68 01DC4868 B48380C7 */  lwc1        $f0, -0x7C4C($28)
/* 018B6C 01DC486C 42000146 */  mul.s       $f1, $f0, $f1
/* 018B70 01DC4870 0043033C */  lui         $3, (0x43000000 >> 16)
/* 018B74 01DC4874 00008344 */  mtc1        $3, $f0
/* 018B78 01DC4878 00000000 */  nop
/* 018B7C 01DC487C 01000146 */  sub.s       $f0, $f0, $f1
/* 018B80 01DC4880 E301033C */  lui         $3, %hi(SeireiKing + 0x190)
/* 018B84 01DC4884 20E66324 */  addiu       $3, $3, %lo(SeireiKing + 0x190)
/* 018B88 01DC4888 21186600 */  addu        $3, $3, $6
/* 018B8C 01DC488C 000060E4 */  swc1        $f0, 0x0($3)
/* 018B90 01DC4890 0100A524 */  addiu       $5, $5, 0x1
.L01DC4894_2CA094:
/* 018B94 01DC4894 1400A328 */  slti        $3, $5, 0x14
/* 018B98 01DC4898 EAFF6014 */  bnez        $3, .L01DC4844_2CA044
/* 018B9C 01DC489C 00000000 */   nop
/* 018BA0 01DC48A0 0043033C */  lui         $3, (0x43000000 >> 16)
/* 018BA4 01DC48A4 E301013C */  lui         $1, %hi(SeireiKing + 0x1DC)
/* 018BA8 01DC48A8 6CE623AC */  sw          $3, %lo(SeireiKing + 0x1DC)($1)
/* 018BAC 01DC48AC 809A80AF */  sw          $0, -0x6580($28)
/* 018BB0 01DC48B0 DE01013C */  lui         $1, %hi(CScript__2 + 0x20)
/* 018BB4 01DC48B4 201B20AC */  sw          $0, %lo(CScript__2 + 0x20)($1)
/* 018BB8 01DC48B8 4000BF7B */  lq          $31, 0x40($29)
/* 018BBC 01DC48BC 3000B37B */  lq          $19, 0x30($29)
/* 018BC0 01DC48C0 2000B27B */  lq          $18, 0x20($29)
/* 018BC4 01DC48C4 1000B17B */  lq          $17, 0x10($29)
/* 018BC8 01DC48C8 0000B07B */  lq          $16, 0x0($29)
/* 018BCC 01DC48CC C002BD27 */  addiu       $29, $29, 0x2C0
/* 018BD0 01DC48D0 0800E003 */  jr          $31
/* 018BD4 01DC48D4 00000000 */   nop
/* 018BD8 01DC48D8 00000000 */  nop
/* 018BDC 01DC48DC 00000000 */  nop
