.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel OpB_InitProcess2__Fv
/* 00E4C0 01DBA1C0 C0FDBD27 */  addiu       $29, $29, -0x240
/* 00E4C4 01DBA1C4 1000BF7F */  sq          $31, 0x10($29)
/* 00E4C8 01DBA1C8 0000B07F */  sq          $16, 0x0($29)
/* 00E4CC 01DBA1CC DD01023C */  lui         $2, %hi(LIT_537__4)
/* 00E4D0 01DBA1D0 A0764524 */  addiu       $5, $2, %lo(LIT_537__4)
/* 00E4D4 01DBA1D4 2000A427 */  addiu       $4, $29, 0x20
/* 00E4D8 01DBA1D8 0F000324 */  addiu       $3, $0, 0xF
.L01DBA1DC_2BF9DC:
/* 00E4DC 01DBA1DC 0000A278 */  lq          $2, 0x0($5)
/* 00E4E0 01DBA1E0 1000A524 */  addiu       $5, $5, 0x10
/* 00E4E4 01DBA1E4 FFFF6324 */  addiu       $3, $3, -0x1
/* 00E4E8 01DBA1E8 0000827C */  sq          $2, 0x0($4)
/* 00E4EC 01DBA1EC 10008424 */  addiu       $4, $4, 0x10
/* 00E4F0 01DBA1F0 FAFF601C */  bgtz        $3, .L01DBA1DC_2BF9DC
/* 00E4F4 01DBA1F4 00000000 */   nop
.L01DBA1F8_2BF9F8:
/* 00E4F8 01DBA1F8 8CFB040C */  jal         ReadBGSync__Fv
/* 00E4FC 01DBA1FC 00000000 */   nop
/* 00E500 01DBA200 FDFF4014 */  bnez        $2, .L01DBA1F8_2BF9F8
/* 00E504 01DBA204 00000000 */   nop
/* 00E508 01DBA208 948B848F */  lw          $4, -0x746C($28)
/* 00E50C 01DBA20C DE01023C */  lui         $2, %hi(LIT_515__5)
/* 00E510 01DBA210 E8E84524 */  addiu       $5, $2, %lo(LIT_515__5)
/* 00E514 01DBA214 28360070 */  paddub      $6, $0, $0
/* 00E518 01DBA218 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00E51C 01DBA21C 00000000 */   nop
/* 00E520 01DBA220 5C00A2AF */  sw          $2, 0x5C($29)
/* 00E524 01DBA224 948B848F */  lw          $4, -0x746C($28)
/* 00E528 01DBA228 DE01023C */  lui         $2, %hi(LIT_516__4)
/* 00E52C 01DBA22C F8E84524 */  addiu       $5, $2, %lo(LIT_516__4)
/* 00E530 01DBA230 28360070 */  paddub      $6, $0, $0
/* 00E534 01DBA234 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00E538 01DBA238 00000000 */   nop
/* 00E53C 01DBA23C 6800A2AF */  sw          $2, 0x68($29)
/* 00E540 01DBA240 948B848F */  lw          $4, -0x746C($28)
/* 00E544 01DBA244 DE01023C */  lui         $2, %hi(LIT_517__5)
/* 00E548 01DBA248 08E94524 */  addiu       $5, $2, %lo(LIT_517__5)
/* 00E54C 01DBA24C 28360070 */  paddub      $6, $0, $0
/* 00E550 01DBA250 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00E554 01DBA254 00000000 */   nop
/* 00E558 01DBA258 7400A2AF */  sw          $2, 0x74($29)
/* 00E55C 01DBA25C 948B848F */  lw          $4, -0x746C($28)
/* 00E560 01DBA260 DE01023C */  lui         $2, %hi(LIT_548__4)
/* 00E564 01DBA264 D8E94524 */  addiu       $5, $2, %lo(LIT_548__4)
/* 00E568 01DBA268 28360070 */  paddub      $6, $0, $0
/* 00E56C 01DBA26C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00E570 01DBA270 00000000 */   nop
/* 00E574 01DBA274 8000A2AF */  sw          $2, 0x80($29)
/* 00E578 01DBA278 948B848F */  lw          $4, -0x746C($28)
/* 00E57C 01DBA27C DE01023C */  lui         $2, %hi(LIT_505__5)
/* 00E580 01DBA280 48E84524 */  addiu       $5, $2, %lo(LIT_505__5)
/* 00E584 01DBA284 28360070 */  paddub      $6, $0, $0
/* 00E588 01DBA288 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00E58C 01DBA28C 00000000 */   nop
/* 00E590 01DBA290 8C00A2AF */  sw          $2, 0x8C($29)
/* 00E594 01DBA294 948B848F */  lw          $4, -0x746C($28)
/* 00E598 01DBA298 DE01023C */  lui         $2, %hi(LIT_549__6)
/* 00E59C 01DBA29C E8E94524 */  addiu       $5, $2, %lo(LIT_549__6)
/* 00E5A0 01DBA2A0 28360070 */  paddub      $6, $0, $0
/* 00E5A4 01DBA2A4 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00E5A8 01DBA2A8 00000000 */   nop
/* 00E5AC 01DBA2AC 9800A2AF */  sw          $2, 0x98($29)
/* 00E5B0 01DBA2B0 948B848F */  lw          $4, -0x746C($28)
/* 00E5B4 01DBA2B4 DE01023C */  lui         $2, %hi(LIT_550__4)
/* 00E5B8 01DBA2B8 F8E94524 */  addiu       $5, $2, %lo(LIT_550__4)
/* 00E5BC 01DBA2BC 28360070 */  paddub      $6, $0, $0
/* 00E5C0 01DBA2C0 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00E5C4 01DBA2C4 00000000 */   nop
/* 00E5C8 01DBA2C8 A400A2AF */  sw          $2, 0xA4($29)
/* 00E5CC 01DBA2CC 948B848F */  lw          $4, -0x746C($28)
/* 00E5D0 01DBA2D0 DE01023C */  lui         $2, %hi(LIT_551__2)
/* 00E5D4 01DBA2D4 08EA4524 */  addiu       $5, $2, %lo(LIT_551__2)
/* 00E5D8 01DBA2D8 28360070 */  paddub      $6, $0, $0
/* 00E5DC 01DBA2DC C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00E5E0 01DBA2E0 00000000 */   nop
/* 00E5E4 01DBA2E4 B000A2AF */  sw          $2, 0xB0($29)
/* 00E5E8 01DBA2E8 948B848F */  lw          $4, -0x746C($28)
/* 00E5EC 01DBA2EC DE01023C */  lui         $2, %hi(LIT_552__2)
/* 00E5F0 01DBA2F0 18EA4524 */  addiu       $5, $2, %lo(LIT_552__2)
/* 00E5F4 01DBA2F4 28360070 */  paddub      $6, $0, $0
/* 00E5F8 01DBA2F8 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00E5FC 01DBA2FC 00000000 */   nop
/* 00E600 01DBA300 BC00A2AF */  sw          $2, 0xBC($29)
/* 00E604 01DBA304 948B848F */  lw          $4, -0x746C($28)
/* 00E608 01DBA308 DE01023C */  lui         $2, %hi(LIT_518__3)
/* 00E60C 01DBA30C 18E94524 */  addiu       $5, $2, %lo(LIT_518__3)
/* 00E610 01DBA310 28360070 */  paddub      $6, $0, $0
/* 00E614 01DBA314 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00E618 01DBA318 00000000 */   nop
/* 00E61C 01DBA31C C800A2AF */  sw          $2, 0xC8($29)
/* 00E620 01DBA320 948B848F */  lw          $4, -0x746C($28)
/* 00E624 01DBA324 DE01023C */  lui         $2, %hi(LIT_519__3)
/* 00E628 01DBA328 28E94524 */  addiu       $5, $2, %lo(LIT_519__3)
/* 00E62C 01DBA32C 28360070 */  paddub      $6, $0, $0
/* 00E630 01DBA330 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00E634 01DBA334 00000000 */   nop
/* 00E638 01DBA338 D400A2AF */  sw          $2, 0xD4($29)
/* 00E63C 01DBA33C 948B848F */  lw          $4, -0x746C($28)
/* 00E640 01DBA340 DE01023C */  lui         $2, %hi(LIT_520__3)
/* 00E644 01DBA344 38E94524 */  addiu       $5, $2, %lo(LIT_520__3)
/* 00E648 01DBA348 28360070 */  paddub      $6, $0, $0
/* 00E64C 01DBA34C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00E650 01DBA350 00000000 */   nop
/* 00E654 01DBA354 E000A2AF */  sw          $2, 0xE0($29)
/* 00E658 01DBA358 948B848F */  lw          $4, -0x746C($28)
/* 00E65C 01DBA35C DE01023C */  lui         $2, %hi(LIT_521__4)
/* 00E660 01DBA360 48E94524 */  addiu       $5, $2, %lo(LIT_521__4)
/* 00E664 01DBA364 28360070 */  paddub      $6, $0, $0
/* 00E668 01DBA368 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00E66C 01DBA36C 00000000 */   nop
/* 00E670 01DBA370 EC00A2AF */  sw          $2, 0xEC($29)
/* 00E674 01DBA374 948B848F */  lw          $4, -0x746C($28)
/* 00E678 01DBA378 DE01023C */  lui         $2, %hi(LIT_522__4)
/* 00E67C 01DBA37C 58E94524 */  addiu       $5, $2, %lo(LIT_522__4)
/* 00E680 01DBA380 28360070 */  paddub      $6, $0, $0
/* 00E684 01DBA384 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00E688 01DBA388 00000000 */   nop
/* 00E68C 01DBA38C F800A2AF */  sw          $2, 0xF8($29)
/* 00E690 01DBA390 C701023C */  lui         $2, %hi(TexManager)
/* 00E694 01DBA394 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00E698 01DBA398 E03F0524 */  addiu       $5, $0, 0x3FE0
/* 00E69C 01DBA39C F0C3040C */  jal         Initialize__15CTextureManagerFi
/* 00E6A0 01DBA3A0 00000000 */   nop
/* 00E6A4 01DBA3A4 C701023C */  lui         $2, %hi(TexManager)
/* 00E6A8 01DBA3A8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00E6AC 01DBA3AC FFFF0524 */  addiu       $5, $0, -0x1
/* 00E6B0 01DBA3B0 2000A627 */  addiu       $6, $29, 0x20
/* 00E6B4 01DBA3B4 C8CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 00E6B8 01DBA3B8 00000000 */   nop
/* 00E6BC 01DBA3BC B89880AF */  sw          $0, -0x6748($28)
/* 00E6C0 01DBA3C0 DE01023C */  lui         $2, %hi(LIT_553__3)
/* 00E6C4 01DBA3C4 28EA4424 */  addiu       $4, $2, %lo(LIT_553__3)
/* 00E6C8 01DBA3C8 00C5760C */  jal         OPAnalyz__FPc
/* 00E6CC 01DBA3CC 00000000 */   nop
/* 00E6D0 01DBA3D0 4CCA760C */  jal         OPMdsLoad__Fv
/* 00E6D4 01DBA3D4 00000000 */   nop
/* 00E6D8 01DBA3D8 948B858F */  lw          $5, -0x746C($28)
/* 00E6DC 01DBA3DC DE01023C */  lui         $2, %hi(LIT_554__4)
/* 00E6E0 01DBA3E0 40EA4424 */  addiu       $4, $2, %lo(LIT_554__4)
/* 00E6E4 01DBA3E4 28360070 */  paddub      $6, $0, $0
/* 00E6E8 01DBA3E8 D8FC040C */  jal         LoadFile__FPcPvPi
/* 00E6EC 01DBA3EC 00000000 */   nop
/* 00E6F0 01DBA3F0 DF01013C */  lui         $1, %hi(MapDataBuffer + 0x8)
/* 00E6F4 01DBA3F4 B8FE20AC */  sw          $0, %lo(MapDataBuffer + 0x8)($1)
/* 00E6F8 01DBA3F8 948B848F */  lw          $4, -0x746C($28)
/* 00E6FC 01DBA3FC DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 00E700 01DBA400 B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 00E704 01DBA404 02000624 */  addiu       $6, $0, 0x2
/* 00E708 01DBA408 283E0070 */  paddub      $7, $0, $0
/* 00E70C 01DBA40C 28460070 */  paddub      $8, $0, $0
/* 00E710 01DBA410 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 00E714 01DBA414 00000000 */   nop
/* 00E718 01DBA418 A49982AF */  sw          $2, -0x665C($28)
/* 00E71C 01DBA41C E301023C */  lui         $2, %hi(OP_ToanMapObj)
/* 00E720 01DBA420 40AA4424 */  addiu       $4, $2, %lo(OP_ToanMapObj)
/* 00E724 01DBA424 445E050C */  jal         Initialize__10CMapObjectFv
/* 00E728 01DBA428 00000000 */   nop
/* 00E72C 01DBA42C E301023C */  lui         $2, %hi(OP_ToanMapObj)
/* 00E730 01DBA430 40AA4424 */  addiu       $4, $2, %lo(OP_ToanMapObj)
/* 00E734 01DBA434 A499858F */  lw          $5, -0x665C($28)
/* 00E738 01DBA438 28360070 */  paddub      $6, $0, $0
/* 00E73C 01DBA43C 305C050C */  jal         SetFrame__12CObjectFrameFP9CFrameVu1i
/* 00E740 01DBA440 00000000 */   nop
/* 00E744 01DBA444 E301013C */  lui         $1, %hi(OP_ToanMapObj + 0xE8)
/* 00E748 01DBA448 28AB20AC */  sw          $0, %lo(OP_ToanMapObj + 0xE8)($1)
/* 00E74C 01DBA44C E301013C */  lui         $1, %hi(OP_ToanMapObj + 0xE4)
/* 00E750 01DBA450 24AB20AC */  sw          $0, %lo(OP_ToanMapObj + 0xE4)($1)
/* 00E754 01DBA454 948B858F */  lw          $5, -0x746C($28)
/* 00E758 01DBA458 DE01023C */  lui         $2, %hi(LIT_555__3)
/* 00E75C 01DBA45C 60EA4424 */  addiu       $4, $2, %lo(LIT_555__3)
/* 00E760 01DBA460 28360070 */  paddub      $6, $0, $0
/* 00E764 01DBA464 D8FC040C */  jal         LoadFile__FPcPvPi
/* 00E768 01DBA468 00000000 */   nop
/* 00E76C 01DBA46C E301023C */  lui         $2, %hi(Komono)
/* 00E770 01DBA470 C08F4424 */  addiu       $4, $2, %lo(Komono)
/* 00E774 01DBA474 948B858F */  lw          $5, -0x746C($28)
/* 00E778 01DBA478 DE01023C */  lui         $2, %hi(LIT_556__3)
/* 00E77C 01DBA47C 78EA4624 */  addiu       $6, $2, %lo(LIT_556__3)
/* 00E780 01DBA480 DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 00E784 01DBA484 B0FE4724 */  addiu       $7, $2, %lo(MapDataBuffer)
/* 00E788 01DBA488 28460070 */  paddub      $8, $0, $0
/* 00E78C 01DBA48C FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 00E790 01DBA490 00000000 */   nop
/* 00E794 01DBA494 1001A427 */  addiu       $4, $29, 0x110
/* 00E798 01DBA498 509F040C */  jal         __ct__10CFrameAttrFv
/* 00E79C 01DBA49C 00000000 */   nop
/* 00E7A0 01DBA4A0 1801A0A3 */  sb          $0, 0x118($29)
/* 00E7A4 01DBA4A4 E301013C */  lui         $1, %hi(Komono + 0xBC)
/* 00E7A8 01DBA4A8 7C90248C */  lw          $4, %lo(Komono + 0xBC)($1)
/* 00E7AC 01DBA4AC 1001A527 */  addiu       $5, $29, 0x110
/* 00E7B0 01DBA4B0 01000624 */  addiu       $6, $0, 0x1
/* 00E7B4 01DBA4B4 04000724 */  addiu       $7, $0, 0x4
/* 00E7B8 01DBA4B8 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 00E7BC 01DBA4BC 00000000 */   nop
/* 00E7C0 01DBA4C0 2041023C */  lui         $2, (0x41200000 >> 16)
/* 00E7C4 01DBA4C4 E301013C */  lui         $1, %hi(Komono + 0x2F0)
/* 00E7C8 01DBA4C8 B09222AC */  sw          $2, %lo(Komono + 0x2F0)($1)
/* 00E7CC 01DBA4CC 948280C7 */  lwc1        $f0, -0x7D6C($28)
/* 00E7D0 01DBA4D0 E301013C */  lui         $1, %hi(Komono + 0x2F8)
/* 00E7D4 01DBA4D4 B89220E4 */  swc1        $f0, %lo(Komono + 0x2F8)($1)
/* 00E7D8 01DBA4D8 E301013C */  lui         $1, %hi(Komono + 0x304)
/* 00E7DC 01DBA4DC C49220AC */  sw          $0, %lo(Komono + 0x304)($1)
/* 00E7E0 01DBA4E0 E301013C */  lui         $1, %hi(Komono + 0x308)
/* 00E7E4 01DBA4E4 C89220AC */  sw          $0, %lo(Komono + 0x308)($1)
/* 00E7E8 01DBA4E8 948B858F */  lw          $5, -0x746C($28)
/* 00E7EC 01DBA4EC DE01023C */  lui         $2, %hi(LIT_557__3)
/* 00E7F0 01DBA4F0 90EA4424 */  addiu       $4, $2, %lo(LIT_557__3)
/* 00E7F4 01DBA4F4 28360070 */  paddub      $6, $0, $0
/* 00E7F8 01DBA4F8 D8FC040C */  jal         LoadFile__FPcPvPi
/* 00E7FC 01DBA4FC 00000000 */   nop
/* 00E800 01DBA500 E001023C */  lui         $2, %hi(MainMonstorUnit + 0x27F0)
/* 00E804 01DBA504 C0AF4424 */  addiu       $4, $2, %lo(MainMonstorUnit + 0x27F0)
/* 00E808 01DBA508 948B858F */  lw          $5, -0x746C($28)
/* 00E80C 01DBA50C DE01023C */  lui         $2, %hi(LIT_558__3)
/* 00E810 01DBA510 A8EA4624 */  addiu       $6, $2, %lo(LIT_558__3)
/* 00E814 01DBA514 DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x60)
/* 00E818 01DBA518 60FE4724 */  addiu       $7, $2, %lo(CharaDataBuffer__2 + 0x60)
/* 00E81C 01DBA51C 28460070 */  paddub      $8, $0, $0
/* 00E820 01DBA520 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 00E824 01DBA524 00000000 */   nop
/* 00E828 01DBA528 7001A427 */  addiu       $4, $29, 0x170
/* 00E82C 01DBA52C 509F040C */  jal         __ct__10CFrameAttrFv
/* 00E830 01DBA530 00000000 */   nop
/* 00E834 01DBA534 7801A0A3 */  sb          $0, 0x178($29)
/* 00E838 01DBA538 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x28AC)
/* 00E83C 01DBA53C 7CB0248C */  lw          $4, %lo(MainMonstorUnit + 0x28AC)($1)
/* 00E840 01DBA540 7001A527 */  addiu       $5, $29, 0x170
/* 00E844 01DBA544 01000624 */  addiu       $6, $0, 0x1
/* 00E848 01DBA548 04000724 */  addiu       $7, $0, 0x4
/* 00E84C 01DBA54C D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 00E850 01DBA550 00000000 */   nop
/* 00E854 01DBA554 2041023C */  lui         $2, (0x41200000 >> 16)
/* 00E858 01DBA558 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x2AE0)
/* 00E85C 01DBA55C B0B222AC */  sw          $2, %lo(MainMonstorUnit + 0x2AE0)($1)
/* 00E860 01DBA560 948280C7 */  lwc1        $f0, -0x7D6C($28)
/* 00E864 01DBA564 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x2AE8)
/* 00E868 01DBA568 B8B220E4 */  swc1        $f0, %lo(MainMonstorUnit + 0x2AE8)($1)
/* 00E86C 01DBA56C E001013C */  lui         $1, %hi(MainMonstorUnit + 0x2AF4)
/* 00E870 01DBA570 C4B220AC */  sw          $0, %lo(MainMonstorUnit + 0x2AF4)($1)
/* 00E874 01DBA574 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x2AF8)
/* 00E878 01DBA578 C8B220AC */  sw          $0, %lo(MainMonstorUnit + 0x2AF8)($1)
/* 00E87C 01DBA57C E001013C */  lui         $1, %hi(MainMonstorUnit + 0x28AC)
/* 00E880 01DBA580 7CB0248C */  lw          $4, %lo(MainMonstorUnit + 0x28AC)($1)
/* 00E884 01DBA584 DE01023C */  lui         $2, %hi(LIT_559__4)
/* 00E888 01DBA588 B8EA4524 */  addiu       $5, $2, %lo(LIT_559__4)
/* 00E88C 01DBA58C C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 00E890 01DBA590 00000000 */   nop
/* 00E894 01DBA594 02004010 */  beqz        $2, .L01DBA5A0_2BFDA0
/* 00E898 01DBA598 00000000 */   nop
/* 00E89C 01DBA59C B00040A4 */  sh          $0, 0xB0($2)
.L01DBA5A0_2BFDA0:
/* 00E8A0 01DBA5A0 948B858F */  lw          $5, -0x746C($28)
/* 00E8A4 01DBA5A4 DE01023C */  lui         $2, %hi(LIT_560__2)
/* 00E8A8 01DBA5A8 D0EA4424 */  addiu       $4, $2, %lo(LIT_560__2)
/* 00E8AC 01DBA5AC 28360070 */  paddub      $6, $0, $0
/* 00E8B0 01DBA5B0 D8FC040C */  jal         LoadFile__FPcPvPi
/* 00E8B4 01DBA5B4 00000000 */   nop
/* 00E8B8 01DBA5B8 E001023C */  lui         $2, %hi(MainMonstorUnit + 0x490)
/* 00E8BC 01DBA5BC 608C4424 */  addiu       $4, $2, %lo(MainMonstorUnit + 0x490)
/* 00E8C0 01DBA5C0 948B858F */  lw          $5, -0x746C($28)
/* 00E8C4 01DBA5C4 DE01023C */  lui         $2, %hi(LIT_561__2)
/* 00E8C8 01DBA5C8 E8EA4624 */  addiu       $6, $2, %lo(LIT_561__2)
/* 00E8CC 01DBA5CC DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x60)
/* 00E8D0 01DBA5D0 60FE4724 */  addiu       $7, $2, %lo(CharaDataBuffer__2 + 0x60)
/* 00E8D4 01DBA5D4 28460070 */  paddub      $8, $0, $0
/* 00E8D8 01DBA5D8 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 00E8DC 01DBA5DC 00000000 */   nop
/* 00E8E0 01DBA5E0 D001A427 */  addiu       $4, $29, 0x1D0
/* 00E8E4 01DBA5E4 509F040C */  jal         __ct__10CFrameAttrFv
/* 00E8E8 01DBA5E8 00000000 */   nop
/* 00E8EC 01DBA5EC D801B027 */  addiu       $16, $29, 0x1D8
/* 00E8F0 01DBA5F0 000000A2 */  sb          $0, 0x0($16)
/* 00E8F4 01DBA5F4 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x54C)
/* 00E8F8 01DBA5F8 1C8D248C */  lw          $4, %lo(MainMonstorUnit + 0x54C)($1)
/* 00E8FC 01DBA5FC D001A527 */  addiu       $5, $29, 0x1D0
/* 00E900 01DBA600 01000624 */  addiu       $6, $0, 0x1
/* 00E904 01DBA604 04000724 */  addiu       $7, $0, 0x4
/* 00E908 01DBA608 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 00E90C 01DBA60C 00000000 */   nop
/* 00E910 01DBA610 2041023C */  lui         $2, (0x41200000 >> 16)
/* 00E914 01DBA614 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x780)
/* 00E918 01DBA618 508F22AC */  sw          $2, %lo(MainMonstorUnit + 0x780)($1)
/* 00E91C 01DBA61C 948280C7 */  lwc1        $f0, -0x7D6C($28)
/* 00E920 01DBA620 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x788)
/* 00E924 01DBA624 588F20E4 */  swc1        $f0, %lo(MainMonstorUnit + 0x788)($1)
/* 00E928 01DBA628 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x794)
/* 00E92C 01DBA62C 648F20AC */  sw          $0, %lo(MainMonstorUnit + 0x794)($1)
/* 00E930 01DBA630 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x798)
/* 00E934 01DBA634 688F20AC */  sw          $0, %lo(MainMonstorUnit + 0x798)($1)
/* 00E938 01DBA638 3C02A0AF */  sw          $0, 0x23C($29)
/* 00E93C 01DBA63C 3402A0AF */  sw          $0, 0x234($29)
/* 00E940 01DBA640 3802A0AF */  sw          $0, 0x238($29)
/* 00E944 01DBA644 3002A0AF */  sw          $0, 0x230($29)
/* 00E948 01DBA648 E301023C */  lui         $2, %hi(Wind)
/* 00E94C 01DBA64C 20A34424 */  addiu       $4, $2, %lo(Wind)
/* 00E950 01DBA650 3002A527 */  addiu       $5, $29, 0x230
/* 00E954 01DBA654 20ED040C */  jal         SetDir__5CWindFPf
/* 00E958 01DBA658 00000000 */   nop
/* 00E95C 01DBA65C 00608044 */  mtc1        $0, $f12
/* 00E960 01DBA660 E301023C */  lui         $2, %hi(Wind)
/* 00E964 01DBA664 20A34424 */  addiu       $4, $2, %lo(Wind)
/* 00E968 01DBA668 2CED040C */  jal         SetVelocity__5CWindFf
/* 00E96C 01DBA66C 00000000 */   nop
/* 00E970 01DBA670 E301023C */  lui         $2, %hi(Wind)
/* 00E974 01DBA674 20A34224 */  addiu       $2, $2, %lo(Wind)
/* 00E978 01DBA678 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x1128)
/* 00E97C 01DBA67C F89822AC */  sw          $2, %lo(MainMonstorUnit + 0x1128)($1)
/* 00E980 01DBA680 E001023C */  lui         $2, %hi(MainMonstorUnit + 0x490)
/* 00E984 01DBA684 608C4424 */  addiu       $4, $2, %lo(MainMonstorUnit + 0x490)
/* 00E988 01DBA688 FFFF0524 */  addiu       $5, $0, -0x1
/* 00E98C 01DBA68C 94E3040C */  jal         ClothStep__10CCharacterFi
/* 00E990 01DBA690 00000000 */   nop
/* 00E994 01DBA694 948B858F */  lw          $5, -0x746C($28)
/* 00E998 01DBA698 DE01023C */  lui         $2, %hi(LIT_562__2)
/* 00E99C 01DBA69C 00EB4424 */  addiu       $4, $2, %lo(LIT_562__2)
/* 00E9A0 01DBA6A0 28360070 */  paddub      $6, $0, $0
/* 00E9A4 01DBA6A4 D8FC040C */  jal         LoadFile__FPcPvPi
/* 00E9A8 01DBA6A8 00000000 */   nop
/* 00E9AC 01DBA6AC E001023C */  lui         $2, %hi(MainMonstorUnit + 0x39A0)
/* 00E9B0 01DBA6B0 70C14424 */  addiu       $4, $2, %lo(MainMonstorUnit + 0x39A0)
/* 00E9B4 01DBA6B4 948B858F */  lw          $5, -0x746C($28)
/* 00E9B8 01DBA6B8 DE01023C */  lui         $2, %hi(LIT_563__2)
/* 00E9BC 01DBA6BC 18EB4624 */  addiu       $6, $2, %lo(LIT_563__2)
/* 00E9C0 01DBA6C0 DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x60)
/* 00E9C4 01DBA6C4 60FE4724 */  addiu       $7, $2, %lo(CharaDataBuffer__2 + 0x60)
/* 00E9C8 01DBA6C8 28460070 */  paddub      $8, $0, $0
/* 00E9CC 01DBA6CC FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 00E9D0 01DBA6D0 00000000 */   nop
/* 00E9D4 01DBA6D4 000000A2 */  sb          $0, 0x0($16)
/* 00E9D8 01DBA6D8 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x3A5C)
/* 00E9DC 01DBA6DC 2CC2248C */  lw          $4, %lo(MainMonstorUnit + 0x3A5C)($1)
/* 00E9E0 01DBA6E0 D001A527 */  addiu       $5, $29, 0x1D0
/* 00E9E4 01DBA6E4 01000624 */  addiu       $6, $0, 0x1
/* 00E9E8 01DBA6E8 04000724 */  addiu       $7, $0, 0x4
/* 00E9EC 01DBA6EC D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 00E9F0 01DBA6F0 00000000 */   nop
/* 00E9F4 01DBA6F4 2043023C */  lui         $2, (0x43200000 >> 16)
/* 00E9F8 01DBA6F8 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x3C90)
/* 00E9FC 01DBA6FC 60C422AC */  sw          $2, %lo(MainMonstorUnit + 0x3C90)($1)
/* 00EA00 01DBA700 808080C7 */  lwc1        $f0, -0x7F80($28)
/* 00EA04 01DBA704 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x3C98)
/* 00EA08 01DBA708 68C420E4 */  swc1        $f0, %lo(MainMonstorUnit + 0x3C98)($1)
/* 00EA0C 01DBA70C E001013C */  lui         $1, %hi(MainMonstorUnit + 0x3CA4)
/* 00EA10 01DBA710 74C420AC */  sw          $0, %lo(MainMonstorUnit + 0x3CA4)($1)
/* 00EA14 01DBA714 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x3CA8)
/* 00EA18 01DBA718 78C420AC */  sw          $0, %lo(MainMonstorUnit + 0x3CA8)($1)
/* 00EA1C 01DBA71C E301023C */  lui         $2, %hi(Door)
/* 00EA20 01DBA720 70A14424 */  addiu       $4, $2, %lo(Door)
/* 00EA24 01DBA724 2497050C */  jal         Initialize__13OBJ_ANIME_SEQFv
/* 00EA28 01DBA728 00000000 */   nop
/* 00EA2C 01DBA72C E301013C */  lui         $1, %hi(Door + 0x10)
/* 00EA30 01DBA730 80A120AC */  sw          $0, %lo(Door + 0x10)($1)
/* 00EA34 01DBA734 03000224 */  addiu       $2, $0, 0x3
/* 00EA38 01DBA738 E301013C */  lui         $1, %hi(Door + 0x14)
/* 00EA3C 01DBA73C 84A122AC */  sw          $2, %lo(Door + 0x14)($1)
/* 00EA40 01DBA740 E301013C */  lui         $1, %hi(Door + 0x20)
/* 00EA44 01DBA744 90A120AC */  sw          $0, %lo(Door + 0x20)($1)
/* 00EA48 01DBA748 E301013C */  lui         $1, %hi(Door + 0x24)
/* 00EA4C 01DBA74C 94A120AC */  sw          $0, %lo(Door + 0x24)($1)
/* 00EA50 01DBA750 E301013C */  lui         $1, %hi(Door + 0x28)
/* 00EA54 01DBA754 98A120AC */  sw          $0, %lo(Door + 0x28)($1)
/* 00EA58 01DBA758 E301013C */  lui         $1, %hi(Door + 0x30)
/* 00EA5C 01DBA75C A0A120AC */  sw          $0, %lo(Door + 0x30)($1)
/* 00EA60 01DBA760 E301013C */  lui         $1, %hi(Door + 0x34)
/* 00EA64 01DBA764 A4A120AC */  sw          $0, %lo(Door + 0x34)($1)
/* 00EA68 01DBA768 E301013C */  lui         $1, %hi(Door + 0x38)
/* 00EA6C 01DBA76C A8A120AC */  sw          $0, %lo(Door + 0x38)($1)
/* 00EA70 01DBA770 E301013C */  lui         $1, %hi(Door + 0x40)
/* 00EA74 01DBA774 B0A120AC */  sw          $0, %lo(Door + 0x40)($1)
/* 00EA78 01DBA778 E301013C */  lui         $1, %hi(Door + 0x44)
/* 00EA7C 01DBA77C B4A120AC */  sw          $0, %lo(Door + 0x44)($1)
/* 00EA80 01DBA780 E301013C */  lui         $1, %hi(Door + 0x48)
/* 00EA84 01DBA784 B8A120AC */  sw          $0, %lo(Door + 0x48)($1)
/* 00EA88 01DBA788 E301023C */  lui         $2, %hi(Door)
/* 00EA8C 01DBA78C 70A14424 */  addiu       $4, $2, %lo(Door)
/* 00EA90 01DBA790 DE01023C */  lui         $2, %hi(LIT_565__4)
/* 00EA94 01DBA794 28EB4524 */  addiu       $5, $2, %lo(LIT_565__4)
/* 00EA98 01DBA798 5A15040C */  jal         strcpy
/* 00EA9C 01DBA79C 00000000 */   nop
/* 00EAA0 01DBA7A0 A499848F */  lw          $4, -0x665C($28)
/* 00EAA4 01DBA7A4 E301023C */  lui         $2, %hi(Door)
/* 00EAA8 01DBA7A8 70A14524 */  addiu       $5, $2, %lo(Door)
/* 00EAAC 01DBA7AC 4097050C */  jal         InitObjAnime__FP6CFrameP13OBJ_ANIME_SEQ
/* 00EAB0 01DBA7B0 00000000 */   nop
/* 00EAB4 01DBA7B4 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 00EAB8 01DBA7B8 0F000524 */  addiu       $5, $0, 0xF
/* 00EABC 01DBA7BC 10000624 */  addiu       $6, $0, 0x10
/* 00EAC0 01DBA7C0 16000724 */  addiu       $7, $0, 0x16
/* 00EAC4 01DBA7C4 28460070 */  paddub      $8, $0, $0
/* 00EAC8 01DBA7C8 BC16050C */  jal         SE_Stop__6CSoundFiiii
/* 00EACC 01DBA7CC 00000000 */   nop
/* 00EAD0 01DBA7D0 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 00EAD4 01DBA7D4 0F000524 */  addiu       $5, $0, 0xF
/* 00EAD8 01DBA7D8 10000624 */  addiu       $6, $0, 0x10
/* 00EADC 01DBA7DC 15000724 */  addiu       $7, $0, 0x15
/* 00EAE0 01DBA7E0 28460070 */  paddub      $8, $0, $0
/* 00EAE4 01DBA7E4 BC16050C */  jal         SE_Stop__6CSoundFiiii
/* 00EAE8 01DBA7E8 00000000 */   nop
/* 00EAEC 01DBA7EC 28260070 */  paddub      $4, $0, $0
/* 00EAF0 01DBA7F0 BCC4760C */  jal         OpGetVolSQ__Fi
/* 00EAF4 01DBA7F4 00000000 */   nop
/* 00EAF8 01DBA7F8 28264070 */  paddub      $4, $2, $0
/* 00EAFC 01DBA7FC FC40040C */  jal         litodp
/* 00EB00 01DBA800 00000000 */   nop
/* 00EB04 01DBA804 E03F033C */  lui         $3, (0x3FE00000 >> 16)
/* 00EB08 01DBA808 3C200300 */  dsll32      $4, $3, 0
/* 00EB0C 01DBA80C 282E4070 */  paddub      $5, $2, $0
/* 00EB10 01DBA810 9E3F040C */  jal         dpmul
/* 00EB14 01DBA814 00000000 */   nop
/* 00EB18 01DBA818 28264070 */  paddub      $4, $2, $0
/* 00EB1C 01DBA81C 9241040C */  jal         dptofp
/* 00EB20 01DBA820 00000000 */   nop
/* 00EB24 01DBA824 06030046 */  mov.s       $f12, $f0
/* 00EB28 01DBA828 2C44040C */  jal         fptosi
/* 00EB2C 01DBA82C 00000000 */   nop
/* 00EB30 01DBA830 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 00EB34 01DBA834 282E0070 */  paddub      $5, $0, $0
/* 00EB38 01DBA838 28364070 */  paddub      $6, $2, $0
/* 00EB3C 01DBA83C 581A050C */  jal         SetVol__6CSoundFii
/* 00EB40 01DBA840 00000000 */   nop
/* 00EB44 01DBA844 01000424 */  addiu       $4, $0, 0x1
/* 00EB48 01DBA848 BCC4760C */  jal         OpGetVolSQ__Fi
/* 00EB4C 01DBA84C 00000000 */   nop
/* 00EB50 01DBA850 28264070 */  paddub      $4, $2, $0
/* 00EB54 01DBA854 FC40040C */  jal         litodp
/* 00EB58 01DBA858 00000000 */   nop
/* 00EB5C 01DBA85C 408084DF */  ld          $4, -0x7FC0($28)
/* 00EB60 01DBA860 282E4070 */  paddub      $5, $2, $0
/* 00EB64 01DBA864 9E3F040C */  jal         dpmul
/* 00EB68 01DBA868 00000000 */   nop
/* 00EB6C 01DBA86C 28264070 */  paddub      $4, $2, $0
/* 00EB70 01DBA870 9241040C */  jal         dptofp
/* 00EB74 01DBA874 00000000 */   nop
/* 00EB78 01DBA878 06030046 */  mov.s       $f12, $f0
/* 00EB7C 01DBA87C 2C44040C */  jal         fptosi
/* 00EB80 01DBA880 00000000 */   nop
/* 00EB84 01DBA884 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 00EB88 01DBA888 01000524 */  addiu       $5, $0, 0x1
/* 00EB8C 01DBA88C 28364070 */  paddub      $6, $2, $0
/* 00EB90 01DBA890 581A050C */  jal         SetVol__6CSoundFii
/* 00EB94 01DBA894 00000000 */   nop
/* 00EB98 01DBA898 DE01013C */  lui         $1, %hi(CScript__2 + 0x20)
/* 00EB9C 01DBA89C 201B20AC */  sw          $0, %lo(CScript__2 + 0x20)($1)
/* 00EBA0 01DBA8A0 1000BF7B */  lq          $31, 0x10($29)
/* 00EBA4 01DBA8A4 0000B07B */  lq          $16, 0x0($29)
/* 00EBA8 01DBA8A8 4002BD27 */  addiu       $29, $29, 0x240
/* 00EBAC 01DBA8AC 0800E003 */  jr          $31
/* 00EBB0 01DBA8B0 00000000 */   nop
/* 00EBB4 01DBA8B4 00000000 */  nop
/* 00EBB8 01DBA8B8 00000000 */  nop
/* 00EBBC 01DBA8BC 00000000 */  nop
