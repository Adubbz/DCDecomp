.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel OpC_InitProcess3__Fv
/* 0115E0 01DBD2E0 F0FDBD27 */  addiu       $29, $29, -0x210
/* 0115E4 01DBD2E4 3000BF7F */  sq          $31, 0x30($29)
/* 0115E8 01DBD2E8 2000B27F */  sq          $18, 0x20($29)
/* 0115EC 01DBD2EC 1000B17F */  sq          $17, 0x10($29)
/* 0115F0 01DBD2F0 0000B07F */  sq          $16, 0x0($29)
.L01DBD2F4_2C2AF4:
/* 0115F4 01DBD2F4 8CFB040C */  jal         ReadBGSync__Fv
/* 0115F8 01DBD2F8 00000000 */   nop
/* 0115FC 01DBD2FC FDFF4014 */  bnez        $2, .L01DBD2F4_2C2AF4
/* 011600 01DBD300 00000000 */   nop
/* 011604 01DBD304 C701023C */  lui         $2, %hi(TexManager)
/* 011608 01DBD308 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01160C 01DBD30C 07000524 */  addiu       $5, $0, 0x7
/* 011610 01DBD310 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 011614 01DBD314 00000000 */   nop
/* 011618 01DBD318 C701023C */  lui         $2, %hi(TexManager)
/* 01161C 01DBD31C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 011620 01DBD320 05000524 */  addiu       $5, $0, 0x5
/* 011624 01DBD324 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 011628 01DBD328 00000000 */   nop
/* 01162C 01DBD32C C701023C */  lui         $2, %hi(TexManager)
/* 011630 01DBD330 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 011634 01DBD334 06000524 */  addiu       $5, $0, 0x6
/* 011638 01DBD338 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 01163C 01DBD33C 00000000 */   nop
/* 011640 01DBD340 C701023C */  lui         $2, %hi(TexManager)
/* 011644 01DBD344 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 011648 01DBD348 04000524 */  addiu       $5, $0, 0x4
/* 01164C 01DBD34C C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 011650 01DBD350 00000000 */   nop
/* 011654 01DBD354 C701023C */  lui         $2, %hi(TexManager)
/* 011658 01DBD358 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01165C 01DBD35C 09000524 */  addiu       $5, $0, 0x9
/* 011660 01DBD360 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 011664 01DBD364 00000000 */   nop
/* 011668 01DBD368 C701023C */  lui         $2, %hi(TexManager)
/* 01166C 01DBD36C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 011670 01DBD370 0A000524 */  addiu       $5, $0, 0xA
/* 011674 01DBD374 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 011678 01DBD378 00000000 */   nop
/* 01167C 01DBD37C C701023C */  lui         $2, %hi(TexManager)
/* 011680 01DBD380 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 011684 01DBD384 FCCD040C */  jal         CleanUpBuffer__15CTextureManagerFv
/* 011688 01DBD388 00000000 */   nop
/* 01168C 01DBD38C 948B848F */  lw          $4, -0x746C($28)
/* 011690 01DBD390 DE01023C */  lui         $2, %hi(LIT_568__3)
/* 011694 01DBD394 18F04524 */  addiu       $5, $2, %lo(LIT_568__3)
/* 011698 01DBD398 28360070 */  paddub      $6, $0, $0
/* 01169C 01DBD39C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0116A0 01DBD3A0 00000000 */   nop
/* 0116A4 01DBD3A4 4000A2AF */  sw          $2, 0x40($29)
/* 0116A8 01DBD3A8 0A000224 */  addiu       $2, $0, 0xA
/* 0116AC 01DBD3AC 4400B027 */  addiu       $16, $29, 0x44
/* 0116B0 01DBD3B0 000002AE */  sw          $2, 0x0($16)
/* 0116B4 01DBD3B4 4800B127 */  addiu       $17, $29, 0x48
/* 0116B8 01DBD3B8 000020AE */  sw          $0, 0x0($17)
/* 0116BC 01DBD3BC 948B848F */  lw          $4, -0x746C($28)
/* 0116C0 01DBD3C0 DE01023C */  lui         $2, %hi(LIT_569__3)
/* 0116C4 01DBD3C4 28F04524 */  addiu       $5, $2, %lo(LIT_569__3)
/* 0116C8 01DBD3C8 28360070 */  paddub      $6, $0, $0
/* 0116CC 01DBD3CC C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0116D0 01DBD3D0 00000000 */   nop
/* 0116D4 01DBD3D4 4C00B227 */  addiu       $18, $29, 0x4C
/* 0116D8 01DBD3D8 000042AE */  sw          $2, 0x0($18)
/* 0116DC 01DBD3DC 0A000224 */  addiu       $2, $0, 0xA
/* 0116E0 01DBD3E0 5000A2AF */  sw          $2, 0x50($29)
/* 0116E4 01DBD3E4 5400A0AF */  sw          $0, 0x54($29)
/* 0116E8 01DBD3E8 948B848F */  lw          $4, -0x746C($28)
/* 0116EC 01DBD3EC DE01023C */  lui         $2, %hi(LIT_570__2)
/* 0116F0 01DBD3F0 38F04524 */  addiu       $5, $2, %lo(LIT_570__2)
/* 0116F4 01DBD3F4 28360070 */  paddub      $6, $0, $0
/* 0116F8 01DBD3F8 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0116FC 01DBD3FC 00000000 */   nop
/* 011700 01DBD400 5800A2AF */  sw          $2, 0x58($29)
/* 011704 01DBD404 0A000524 */  addiu       $5, $0, 0xA
/* 011708 01DBD408 5C00A5AF */  sw          $5, 0x5C($29)
/* 01170C 01DBD40C 6000A0AF */  sw          $0, 0x60($29)
/* 011710 01DBD410 6400A0AF */  sw          $0, 0x64($29)
/* 011714 01DBD414 C701023C */  lui         $2, %hi(TexManager)
/* 011718 01DBD418 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01171C 01DBD41C 4000A627 */  addiu       $6, $29, 0x40
/* 011720 01DBD420 C8CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 011724 01DBD424 00000000 */   nop
/* 011728 01DBD428 948B848F */  lw          $4, -0x746C($28)
/* 01172C 01DBD42C DE01023C */  lui         $2, %hi(LIT_571__2)
/* 011730 01DBD430 48F04524 */  addiu       $5, $2, %lo(LIT_571__2)
/* 011734 01DBD434 28360070 */  paddub      $6, $0, $0
/* 011738 01DBD438 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 01173C 01DBD43C 00000000 */   nop
/* 011740 01DBD440 4000A2AF */  sw          $2, 0x40($29)
/* 011744 01DBD444 0F000524 */  addiu       $5, $0, 0xF
/* 011748 01DBD448 000005AE */  sw          $5, 0x0($16)
/* 01174C 01DBD44C 000020AE */  sw          $0, 0x0($17)
/* 011750 01DBD450 000040AE */  sw          $0, 0x0($18)
/* 011754 01DBD454 C701023C */  lui         $2, %hi(TexManager)
/* 011758 01DBD458 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01175C 01DBD45C 4000A627 */  addiu       $6, $29, 0x40
/* 011760 01DBD460 C8CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 011764 01DBD464 00000000 */   nop
/* 011768 01DBD468 948B848F */  lw          $4, -0x746C($28)
/* 01176C 01DBD46C DE01023C */  lui         $2, %hi(LIT_572__2)
/* 011770 01DBD470 58F04524 */  addiu       $5, $2, %lo(LIT_572__2)
/* 011774 01DBD474 28360070 */  paddub      $6, $0, $0
/* 011778 01DBD478 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 01177C 01DBD47C 00000000 */   nop
/* 011780 01DBD480 4000A2AF */  sw          $2, 0x40($29)
/* 011784 01DBD484 10000524 */  addiu       $5, $0, 0x10
/* 011788 01DBD488 000005AE */  sw          $5, 0x0($16)
/* 01178C 01DBD48C 000020AE */  sw          $0, 0x0($17)
/* 011790 01DBD490 000040AE */  sw          $0, 0x0($18)
/* 011794 01DBD494 C701023C */  lui         $2, %hi(TexManager)
/* 011798 01DBD498 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01179C 01DBD49C 4000A627 */  addiu       $6, $29, 0x40
/* 0117A0 01DBD4A0 C8CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 0117A4 01DBD4A4 00000000 */   nop
/* 0117A8 01DBD4A8 948B848F */  lw          $4, -0x746C($28)
/* 0117AC 01DBD4AC DE01023C */  lui         $2, %hi(LIT_573__4)
/* 0117B0 01DBD4B0 68F04524 */  addiu       $5, $2, %lo(LIT_573__4)
/* 0117B4 01DBD4B4 28360070 */  paddub      $6, $0, $0
/* 0117B8 01DBD4B8 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0117BC 01DBD4BC 00000000 */   nop
/* 0117C0 01DBD4C0 4000A2AF */  sw          $2, 0x40($29)
/* 0117C4 01DBD4C4 11000524 */  addiu       $5, $0, 0x11
/* 0117C8 01DBD4C8 000005AE */  sw          $5, 0x0($16)
/* 0117CC 01DBD4CC 000020AE */  sw          $0, 0x0($17)
/* 0117D0 01DBD4D0 000040AE */  sw          $0, 0x0($18)
/* 0117D4 01DBD4D4 C701023C */  lui         $2, %hi(TexManager)
/* 0117D8 01DBD4D8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0117DC 01DBD4DC 4000A627 */  addiu       $6, $29, 0x40
/* 0117E0 01DBD4E0 C8CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 0117E4 01DBD4E4 00000000 */   nop
/* 0117E8 01DBD4E8 DF01013C */  lui         $1, %hi(CharaDataBuffer__2 + 0x68)
/* 0117EC 01DBD4EC 68FE20AC */  sw          $0, %lo(CharaDataBuffer__2 + 0x68)($1)
/* 0117F0 01DBD4F0 DF01023C */  lui         $2, %hi(Chara__3 + 0x11B0)
/* 0117F4 01DBD4F4 90104424 */  addiu       $4, $2, %lo(Chara__3 + 0x11B0)
/* 0117F8 01DBD4F8 948B858F */  lw          $5, -0x746C($28)
/* 0117FC 01DBD4FC DE01023C */  lui         $2, %hi(LIT_574__3)
/* 011800 01DBD500 78F04624 */  addiu       $6, $2, %lo(LIT_574__3)
/* 011804 01DBD504 DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x60)
/* 011808 01DBD508 60FE4724 */  addiu       $7, $2, %lo(CharaDataBuffer__2 + 0x60)
/* 01180C 01DBD50C 28460070 */  paddub      $8, $0, $0
/* 011810 01DBD510 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 011814 01DBD514 00000000 */   nop
/* 011818 01DBD518 7000A427 */  addiu       $4, $29, 0x70
/* 01181C 01DBD51C 509F040C */  jal         __ct__10CFrameAttrFv
/* 011820 01DBD520 00000000 */   nop
/* 011824 01DBD524 7800A0A3 */  sb          $0, 0x78($29)
/* 011828 01DBD528 DF01013C */  lui         $1, %hi(Chara__3 + 0x126C)
/* 01182C 01DBD52C 4C11248C */  lw          $4, %lo(Chara__3 + 0x126C)($1)
/* 011830 01DBD530 7000A527 */  addiu       $5, $29, 0x70
/* 011834 01DBD534 01000624 */  addiu       $6, $0, 0x1
/* 011838 01DBD538 04000724 */  addiu       $7, $0, 0x4
/* 01183C 01DBD53C D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 011840 01DBD540 00000000 */   nop
/* 011844 01DBD544 2041023C */  lui         $2, (0x41200000 >> 16)
/* 011848 01DBD548 DF01013C */  lui         $1, %hi(Chara__3 + 0x14A0)
/* 01184C 01DBD54C 801322AC */  sw          $2, %lo(Chara__3 + 0x14A0)($1)
/* 011850 01DBD550 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 011854 01DBD554 DF01013C */  lui         $1, %hi(Chara__3 + 0x14A8)
/* 011858 01DBD558 881322AC */  sw          $2, %lo(Chara__3 + 0x14A8)($1)
/* 01185C 01DBD55C DF01013C */  lui         $1, %hi(Chara__3 + 0x14B4)
/* 011860 01DBD560 941320AC */  sw          $0, %lo(Chara__3 + 0x14B4)($1)
/* 011864 01DBD564 DF01013C */  lui         $1, %hi(Chara__3 + 0x14B8)
/* 011868 01DBD568 981320AC */  sw          $0, %lo(Chara__3 + 0x14B8)($1)
/* 01186C 01DBD56C DF01023C */  lui         $2, %hi(Chara__3 + 0x3510)
/* 011870 01DBD570 F0334424 */  addiu       $4, $2, %lo(Chara__3 + 0x3510)
/* 011874 01DBD574 948B858F */  lw          $5, -0x746C($28)
/* 011878 01DBD578 DE01023C */  lui         $2, %hi(LIT_575__5)
/* 01187C 01DBD57C 88F04624 */  addiu       $6, $2, %lo(LIT_575__5)
/* 011880 01DBD580 DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x60)
/* 011884 01DBD584 60FE4724 */  addiu       $7, $2, %lo(CharaDataBuffer__2 + 0x60)
/* 011888 01DBD588 28460070 */  paddub      $8, $0, $0
/* 01188C 01DBD58C FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 011890 01DBD590 00000000 */   nop
/* 011894 01DBD594 D000A427 */  addiu       $4, $29, 0xD0
/* 011898 01DBD598 509F040C */  jal         __ct__10CFrameAttrFv
/* 01189C 01DBD59C 00000000 */   nop
/* 0118A0 01DBD5A0 D800A0A3 */  sb          $0, 0xD8($29)
/* 0118A4 01DBD5A4 DF01013C */  lui         $1, %hi(Chara__3 + 0x35CC)
/* 0118A8 01DBD5A8 AC34248C */  lw          $4, %lo(Chara__3 + 0x35CC)($1)
/* 0118AC 01DBD5AC D000A527 */  addiu       $5, $29, 0xD0
/* 0118B0 01DBD5B0 01000624 */  addiu       $6, $0, 0x1
/* 0118B4 01DBD5B4 04000724 */  addiu       $7, $0, 0x4
/* 0118B8 01DBD5B8 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 0118BC 01DBD5BC 00000000 */   nop
/* 0118C0 01DBD5C0 2041023C */  lui         $2, (0x41200000 >> 16)
/* 0118C4 01DBD5C4 DF01013C */  lui         $1, %hi(DngEventMan + 0x30)
/* 0118C8 01DBD5C8 E03622AC */  sw          $2, %lo(DngEventMan + 0x30)($1)
/* 0118CC 01DBD5CC 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 0118D0 01DBD5D0 DF01013C */  lui         $1, %hi(DngEventMan + 0x38)
/* 0118D4 01DBD5D4 E83622AC */  sw          $2, %lo(DngEventMan + 0x38)($1)
/* 0118D8 01DBD5D8 DF01013C */  lui         $1, %hi(DngEventMan + 0x44)
/* 0118DC 01DBD5DC F43620AC */  sw          $0, %lo(DngEventMan + 0x44)($1)
/* 0118E0 01DBD5E0 DF01013C */  lui         $1, %hi(DngEventMan + 0x48)
/* 0118E4 01DBD5E4 F83620AC */  sw          $0, %lo(DngEventMan + 0x48)($1)
/* 0118E8 01DBD5E8 3001A427 */  addiu       $4, $29, 0x130
/* 0118EC 01DBD5EC 509F040C */  jal         __ct__10CFrameAttrFv
/* 0118F0 01DBD5F0 00000000 */   nop
/* 0118F4 01DBD5F4 01000224 */  addiu       $2, $0, 0x1
/* 0118F8 01DBD5F8 4401A2A3 */  sb          $2, 0x144($29)
/* 0118FC 01DBD5FC 8401A0A3 */  sb          $0, 0x184($29)
/* 011900 01DBD600 948B848F */  lw          $4, -0x746C($28)
/* 011904 01DBD604 DE01023C */  lui         $2, %hi(LIT_576__2)
/* 011908 01DBD608 98F04524 */  addiu       $5, $2, %lo(LIT_576__2)
/* 01190C 01DBD60C 28360070 */  paddub      $6, $0, $0
/* 011910 01DBD610 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 011914 01DBD614 00000000 */   nop
/* 011918 01DBD618 28264070 */  paddub      $4, $2, $0
/* 01191C 01DBD61C DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 011920 01DBD620 B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 011924 01DBD624 02000624 */  addiu       $6, $0, 0x2
/* 011928 01DBD628 283E0070 */  paddub      $7, $0, $0
/* 01192C 01DBD62C 28460070 */  paddub      $8, $0, $0
/* 011930 01DBD630 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 011934 01DBD634 00000000 */   nop
/* 011938 01DBD638 28864070 */  paddub      $16, $2, $0
/* 01193C 01DBD63C 28260072 */  paddub      $4, $16, $0
/* 011940 01DBD640 3001A527 */  addiu       $5, $29, 0x130
/* 011944 01DBD644 01000624 */  addiu       $6, $0, 0x1
/* 011948 01DBD648 00120724 */  addiu       $7, $0, 0x1200
/* 01194C 01DBD64C D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 011950 01DBD650 00000000 */   nop
/* 011954 01DBD654 E301023C */  lui         $2, %hi(OP_NornMapObj3)
/* 011958 01DBD658 D0B64424 */  addiu       $4, $2, %lo(OP_NornMapObj3)
/* 01195C 01DBD65C 445E050C */  jal         Initialize__10CMapObjectFv
/* 011960 01DBD660 00000000 */   nop
/* 011964 01DBD664 E301023C */  lui         $2, %hi(OP_NornMapObj3)
/* 011968 01DBD668 D0B64424 */  addiu       $4, $2, %lo(OP_NornMapObj3)
/* 01196C 01DBD66C 282E0072 */  paddub      $5, $16, $0
/* 011970 01DBD670 28360070 */  paddub      $6, $0, $0
/* 011974 01DBD674 305C050C */  jal         SetFrame__12CObjectFrameFP9CFrameVu1i
/* 011978 01DBD678 00000000 */   nop
/* 01197C 01DBD67C E301013C */  lui         $1, %hi(OP_NornMapObj3 + 0xE8)
/* 011980 01DBD680 B8B720AC */  sw          $0, %lo(OP_NornMapObj3 + 0xE8)($1)
/* 011984 01DBD684 E301013C */  lui         $1, %hi(OP_NornMapObj3 + 0xE4)
/* 011988 01DBD688 B4B720AC */  sw          $0, %lo(OP_NornMapObj3 + 0xE4)($1)
/* 01198C 01DBD68C 9001A0AF */  sw          $0, 0x190($29)
/* 011990 01DBD690 9401A0AF */  sw          $0, 0x194($29)
/* 011994 01DBD694 9801A0AF */  sw          $0, 0x198($29)
/* 011998 01DBD698 E301023C */  lui         $2, %hi(OP_NornMapObj3)
/* 01199C 01DBD69C D0B64424 */  addiu       $4, $2, %lo(OP_NornMapObj3)
/* 0119A0 01DBD6A0 9001A527 */  addiu       $5, $29, 0x190
/* 0119A4 01DBD6A4 A000998C */  lw          $25, 0xA0($4)
/* 0119A8 01DBD6A8 1000398F */  lw          $25, 0x10($25)
/* 0119AC 01DBD6AC 09F82003 */  jalr        $25
/* 0119B0 01DBD6B0 00000000 */   nop
/* 0119B4 01DBD6B4 A001A0AF */  sw          $0, 0x1A0($29)
/* 0119B8 01DBD6B8 A401A0AF */  sw          $0, 0x1A4($29)
/* 0119BC 01DBD6BC A801A0AF */  sw          $0, 0x1A8($29)
/* 0119C0 01DBD6C0 E301023C */  lui         $2, %hi(OP_NornMapObj3)
/* 0119C4 01DBD6C4 D0B64424 */  addiu       $4, $2, %lo(OP_NornMapObj3)
/* 0119C8 01DBD6C8 A001A527 */  addiu       $5, $29, 0x1A0
/* 0119CC 01DBD6CC A000998C */  lw          $25, 0xA0($4)
/* 0119D0 01DBD6D0 2C00398F */  lw          $25, 0x2C($25)
/* 0119D4 01DBD6D4 09F82003 */  jalr        $25
/* 0119D8 01DBD6D8 00000000 */   nop
/* 0119DC 01DBD6DC 948B848F */  lw          $4, -0x746C($28)
/* 0119E0 01DBD6E0 DE01023C */  lui         $2, %hi(LIT_577__3)
/* 0119E4 01DBD6E4 A8F04524 */  addiu       $5, $2, %lo(LIT_577__3)
/* 0119E8 01DBD6E8 28360070 */  paddub      $6, $0, $0
/* 0119EC 01DBD6EC C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0119F0 01DBD6F0 00000000 */   nop
/* 0119F4 01DBD6F4 28264070 */  paddub      $4, $2, $0
/* 0119F8 01DBD6F8 DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 0119FC 01DBD6FC B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 011A00 01DBD700 02000624 */  addiu       $6, $0, 0x2
/* 011A04 01DBD704 283E0070 */  paddub      $7, $0, $0
/* 011A08 01DBD708 28460070 */  paddub      $8, $0, $0
/* 011A0C 01DBD70C AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 011A10 01DBD710 00000000 */   nop
/* 011A14 01DBD714 28864070 */  paddub      $16, $2, $0
/* 011A18 01DBD718 28260072 */  paddub      $4, $16, $0
/* 011A1C 01DBD71C 3001A527 */  addiu       $5, $29, 0x130
/* 011A20 01DBD720 01000624 */  addiu       $6, $0, 0x1
/* 011A24 01DBD724 00120724 */  addiu       $7, $0, 0x1200
/* 011A28 01DBD728 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 011A2C 01DBD72C 00000000 */   nop
/* 011A30 01DBD730 E301023C */  lui         $2, %hi(OP_NornMapObj3 + 0xF0)
/* 011A34 01DBD734 C0B74424 */  addiu       $4, $2, %lo(OP_NornMapObj3 + 0xF0)
/* 011A38 01DBD738 445E050C */  jal         Initialize__10CMapObjectFv
/* 011A3C 01DBD73C 00000000 */   nop
/* 011A40 01DBD740 E301023C */  lui         $2, %hi(OP_NornMapObj3 + 0xF0)
/* 011A44 01DBD744 C0B74424 */  addiu       $4, $2, %lo(OP_NornMapObj3 + 0xF0)
/* 011A48 01DBD748 282E0072 */  paddub      $5, $16, $0
/* 011A4C 01DBD74C 28360070 */  paddub      $6, $0, $0
/* 011A50 01DBD750 305C050C */  jal         SetFrame__12CObjectFrameFP9CFrameVu1i
/* 011A54 01DBD754 00000000 */   nop
/* 011A58 01DBD758 E301013C */  lui         $1, %hi(OP_NornMapObj3 + 0x1D8)
/* 011A5C 01DBD75C A8B820AC */  sw          $0, %lo(OP_NornMapObj3 + 0x1D8)($1)
/* 011A60 01DBD760 E301013C */  lui         $1, %hi(OP_NornMapObj3 + 0x1D4)
/* 011A64 01DBD764 A4B820AC */  sw          $0, %lo(OP_NornMapObj3 + 0x1D4)($1)
/* 011A68 01DBD768 E301023C */  lui         $2, %hi(OP_NornMapObj3 + 0xF0)
/* 011A6C 01DBD76C C0B75024 */  addiu       $16, $2, %lo(OP_NornMapObj3 + 0xF0)
/* 011A70 01DBD770 B001A0AF */  sw          $0, 0x1B0($29)
/* 011A74 01DBD774 B401A0AF */  sw          $0, 0x1B4($29)
/* 011A78 01DBD778 B801A0AF */  sw          $0, 0x1B8($29)
/* 011A7C 01DBD77C 28260072 */  paddub      $4, $16, $0
/* 011A80 01DBD780 B001A527 */  addiu       $5, $29, 0x1B0
/* 011A84 01DBD784 A000198E */  lw          $25, 0xA0($16)
/* 011A88 01DBD788 1000398F */  lw          $25, 0x10($25)
/* 011A8C 01DBD78C 09F82003 */  jalr        $25
/* 011A90 01DBD790 00000000 */   nop
/* 011A94 01DBD794 C001A0AF */  sw          $0, 0x1C0($29)
/* 011A98 01DBD798 C401A0AF */  sw          $0, 0x1C4($29)
/* 011A9C 01DBD79C C801A0AF */  sw          $0, 0x1C8($29)
/* 011AA0 01DBD7A0 28260072 */  paddub      $4, $16, $0
/* 011AA4 01DBD7A4 C001A527 */  addiu       $5, $29, 0x1C0
/* 011AA8 01DBD7A8 A000198E */  lw          $25, 0xA0($16)
/* 011AAC 01DBD7AC 2C00398F */  lw          $25, 0x2C($25)
/* 011AB0 01DBD7B0 09F82003 */  jalr        $25
/* 011AB4 01DBD7B4 00000000 */   nop
/* 011AB8 01DBD7B8 948B848F */  lw          $4, -0x746C($28)
/* 011ABC 01DBD7BC DE01023C */  lui         $2, %hi(LIT_578__6)
/* 011AC0 01DBD7C0 B8F04524 */  addiu       $5, $2, %lo(LIT_578__6)
/* 011AC4 01DBD7C4 28360070 */  paddub      $6, $0, $0
/* 011AC8 01DBD7C8 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 011ACC 01DBD7CC 00000000 */   nop
/* 011AD0 01DBD7D0 28264070 */  paddub      $4, $2, $0
/* 011AD4 01DBD7D4 DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 011AD8 01DBD7D8 B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 011ADC 01DBD7DC 02000624 */  addiu       $6, $0, 0x2
/* 011AE0 01DBD7E0 283E0070 */  paddub      $7, $0, $0
/* 011AE4 01DBD7E4 28460070 */  paddub      $8, $0, $0
/* 011AE8 01DBD7E8 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 011AEC 01DBD7EC 00000000 */   nop
/* 011AF0 01DBD7F0 28864070 */  paddub      $16, $2, $0
/* 011AF4 01DBD7F4 E301023C */  lui         $2, %hi(OP_NornMapObj3 + 0x1E0)
/* 011AF8 01DBD7F8 B0B84424 */  addiu       $4, $2, %lo(OP_NornMapObj3 + 0x1E0)
/* 011AFC 01DBD7FC 445E050C */  jal         Initialize__10CMapObjectFv
/* 011B00 01DBD800 00000000 */   nop
/* 011B04 01DBD804 E301023C */  lui         $2, %hi(OP_NornMapObj3 + 0x1E0)
/* 011B08 01DBD808 B0B84424 */  addiu       $4, $2, %lo(OP_NornMapObj3 + 0x1E0)
/* 011B0C 01DBD80C 282E0072 */  paddub      $5, $16, $0
/* 011B10 01DBD810 28360070 */  paddub      $6, $0, $0
/* 011B14 01DBD814 305C050C */  jal         SetFrame__12CObjectFrameFP9CFrameVu1i
/* 011B18 01DBD818 00000000 */   nop
/* 011B1C 01DBD81C E301013C */  lui         $1, %hi(OP_NornMapObj3 + 0x2C8)
/* 011B20 01DBD820 98B920AC */  sw          $0, %lo(OP_NornMapObj3 + 0x2C8)($1)
/* 011B24 01DBD824 E301013C */  lui         $1, %hi(OP_NornMapObj3 + 0x2C4)
/* 011B28 01DBD828 94B920AC */  sw          $0, %lo(OP_NornMapObj3 + 0x2C4)($1)
/* 011B2C 01DBD82C E301023C */  lui         $2, %hi(OP_NornMapObj3 + 0x1E0)
/* 011B30 01DBD830 B0B85024 */  addiu       $16, $2, %lo(OP_NornMapObj3 + 0x1E0)
/* 011B34 01DBD834 8C8380C7 */  lwc1        $f0, -0x7C74($28)
/* 011B38 01DBD838 D001A0E7 */  swc1        $f0, 0x1D0($29)
/* 011B3C 01DBD83C 908380C7 */  lwc1        $f0, -0x7C70($28)
/* 011B40 01DBD840 D401A0E7 */  swc1        $f0, 0x1D4($29)
/* 011B44 01DBD844 948380C7 */  lwc1        $f0, -0x7C6C($28)
/* 011B48 01DBD848 D801A0E7 */  swc1        $f0, 0x1D8($29)
/* 011B4C 01DBD84C 28260072 */  paddub      $4, $16, $0
/* 011B50 01DBD850 D001A527 */  addiu       $5, $29, 0x1D0
/* 011B54 01DBD854 A000198E */  lw          $25, 0xA0($16)
/* 011B58 01DBD858 1000398F */  lw          $25, 0x10($25)
/* 011B5C 01DBD85C 09F82003 */  jalr        $25
/* 011B60 01DBD860 00000000 */   nop
/* 011B64 01DBD864 988380C7 */  lwc1        $f0, -0x7C68($28)
/* 011B68 01DBD868 E001A0E7 */  swc1        $f0, 0x1E0($29)
/* 011B6C 01DBD86C 9C8380C7 */  lwc1        $f0, -0x7C64($28)
/* 011B70 01DBD870 E401A0E7 */  swc1        $f0, 0x1E4($29)
/* 011B74 01DBD874 A08380C7 */  lwc1        $f0, -0x7C60($28)
/* 011B78 01DBD878 E801A0E7 */  swc1        $f0, 0x1E8($29)
/* 011B7C 01DBD87C 28260072 */  paddub      $4, $16, $0
/* 011B80 01DBD880 E001A527 */  addiu       $5, $29, 0x1E0
/* 011B84 01DBD884 A000198E */  lw          $25, 0xA0($16)
/* 011B88 01DBD888 2C00398F */  lw          $25, 0x2C($25)
/* 011B8C 01DBD88C 09F82003 */  jalr        $25
/* 011B90 01DBD890 00000000 */   nop
/* 011B94 01DBD894 948B848F */  lw          $4, -0x746C($28)
/* 011B98 01DBD898 DE01023C */  lui         $2, %hi(LIT_585__4)
/* 011B9C 01DBD89C C8F04524 */  addiu       $5, $2, %lo(LIT_585__4)
/* 011BA0 01DBD8A0 28360070 */  paddub      $6, $0, $0
/* 011BA4 01DBD8A4 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 011BA8 01DBD8A8 00000000 */   nop
/* 011BAC 01DBD8AC 28264070 */  paddub      $4, $2, $0
/* 011BB0 01DBD8B0 DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 011BB4 01DBD8B4 B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 011BB8 01DBD8B8 02000624 */  addiu       $6, $0, 0x2
/* 011BBC 01DBD8BC 283E0070 */  paddub      $7, $0, $0
/* 011BC0 01DBD8C0 28460070 */  paddub      $8, $0, $0
/* 011BC4 01DBD8C4 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 011BC8 01DBD8C8 00000000 */   nop
/* 011BCC 01DBD8CC 28864070 */  paddub      $16, $2, $0
/* 011BD0 01DBD8D0 E301023C */  lui         $2, %hi(OP_NornMapObj3 + 0x2D0)
/* 011BD4 01DBD8D4 A0B94424 */  addiu       $4, $2, %lo(OP_NornMapObj3 + 0x2D0)
/* 011BD8 01DBD8D8 445E050C */  jal         Initialize__10CMapObjectFv
/* 011BDC 01DBD8DC 00000000 */   nop
/* 011BE0 01DBD8E0 E301023C */  lui         $2, %hi(OP_NornMapObj3 + 0x2D0)
/* 011BE4 01DBD8E4 A0B94424 */  addiu       $4, $2, %lo(OP_NornMapObj3 + 0x2D0)
/* 011BE8 01DBD8E8 282E0072 */  paddub      $5, $16, $0
/* 011BEC 01DBD8EC 28360070 */  paddub      $6, $0, $0
/* 011BF0 01DBD8F0 305C050C */  jal         SetFrame__12CObjectFrameFP9CFrameVu1i
/* 011BF4 01DBD8F4 00000000 */   nop
/* 011BF8 01DBD8F8 E301013C */  lui         $1, %hi(OP_NornMapObj3 + 0x3B8)
/* 011BFC 01DBD8FC 88BA20AC */  sw          $0, %lo(OP_NornMapObj3 + 0x3B8)($1)
/* 011C00 01DBD900 E301013C */  lui         $1, %hi(OP_NornMapObj3 + 0x3B4)
/* 011C04 01DBD904 84BA20AC */  sw          $0, %lo(OP_NornMapObj3 + 0x3B4)($1)
/* 011C08 01DBD908 E301023C */  lui         $2, %hi(OP_NornMapObj3 + 0x2D0)
/* 011C0C 01DBD90C A0B95024 */  addiu       $16, $2, %lo(OP_NornMapObj3 + 0x2D0)
/* 011C10 01DBD910 F001A0AF */  sw          $0, 0x1F0($29)
/* 011C14 01DBD914 F401A0AF */  sw          $0, 0x1F4($29)
/* 011C18 01DBD918 F801A0AF */  sw          $0, 0x1F8($29)
/* 011C1C 01DBD91C 28260072 */  paddub      $4, $16, $0
/* 011C20 01DBD920 F001A527 */  addiu       $5, $29, 0x1F0
/* 011C24 01DBD924 A000198E */  lw          $25, 0xA0($16)
/* 011C28 01DBD928 1000398F */  lw          $25, 0x10($25)
/* 011C2C 01DBD92C 09F82003 */  jalr        $25
/* 011C30 01DBD930 00000000 */   nop
/* 011C34 01DBD934 0002A0AF */  sw          $0, 0x200($29)
/* 011C38 01DBD938 0402A0AF */  sw          $0, 0x204($29)
/* 011C3C 01DBD93C 0802A0AF */  sw          $0, 0x208($29)
/* 011C40 01DBD940 28260072 */  paddub      $4, $16, $0
/* 011C44 01DBD944 0002A527 */  addiu       $5, $29, 0x200
/* 011C48 01DBD948 A000198E */  lw          $25, 0xA0($16)
/* 011C4C 01DBD94C 2C00398F */  lw          $25, 0x2C($25)
/* 011C50 01DBD950 09F82003 */  jalr        $25
/* 011C54 01DBD954 00000000 */   nop
/* 011C58 01DBD958 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 011C5C 01DBD95C 282E0070 */  paddub      $5, $0, $0
/* 011C60 01DBD960 04000624 */  addiu       $6, $0, 0x4
/* 011C64 01DBD964 32000724 */  addiu       $7, $0, 0x32
/* 011C68 01DBD968 140F050C */  jal         SetReverb__6CSoundFiii
/* 011C6C 01DBD96C 00000000 */   nop
/* 011C70 01DBD970 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 011C74 01DBD974 01000524 */  addiu       $5, $0, 0x1
/* 011C78 01DBD978 04000624 */  addiu       $6, $0, 0x4
/* 011C7C 01DBD97C 05000724 */  addiu       $7, $0, 0x5
/* 011C80 01DBD980 140F050C */  jal         SetReverb__6CSoundFiii
/* 011C84 01DBD984 00000000 */   nop
/* 011C88 01DBD988 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 011C8C 01DBD98C DE01023C */  lui         $2, %hi(LIT_586__4)
/* 011C90 01DBD990 D8F04524 */  addiu       $5, $2, %lo(LIT_586__4)
/* 011C94 01DBD994 948B868F */  lw          $6, -0x746C($28)
/* 011C98 01DBD998 3410050C */  jal         LoadSoundFileFromPack__6CSoundFPcPUi
/* 011C9C 01DBD99C 00000000 */   nop
/* 011CA0 01DBD9A0 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 011CA4 01DBD9A4 0F000524 */  addiu       $5, $0, 0xF
/* 011CA8 01DBD9A8 00010624 */  addiu       $6, $0, 0x100
/* 011CAC 01DBD9AC 581A050C */  jal         SetVol__6CSoundFii
/* 011CB0 01DBD9B0 00000000 */   nop
/* 011CB4 01DBD9B4 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 011CB8 01DBD9B8 0E000524 */  addiu       $5, $0, 0xE
/* 011CBC 01DBD9BC 00010624 */  addiu       $6, $0, 0x100
/* 011CC0 01DBD9C0 581A050C */  jal         SetVol__6CSoundFii
/* 011CC4 01DBD9C4 00000000 */   nop
/* 011CC8 01DBD9C8 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 011CCC 01DBD9CC 0D000524 */  addiu       $5, $0, 0xD
/* 011CD0 01DBD9D0 00010624 */  addiu       $6, $0, 0x100
/* 011CD4 01DBD9D4 581A050C */  jal         SetVol__6CSoundFii
/* 011CD8 01DBD9D8 00000000 */   nop
/* 011CDC 01DBD9DC 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 011CE0 01DBD9E0 0C000524 */  addiu       $5, $0, 0xC
/* 011CE4 01DBD9E4 00010624 */  addiu       $6, $0, 0x100
/* 011CE8 01DBD9E8 581A050C */  jal         SetVol__6CSoundFii
/* 011CEC 01DBD9EC 00000000 */   nop
/* 011CF0 01DBD9F0 F89980AF */  sw          $0, -0x6608($28)
/* 011CF4 01DBD9F4 049A80AF */  sw          $0, -0x65FC($28)
/* 011CF8 01DBD9F8 DE01013C */  lui         $1, %hi(CScript__2 + 0x20)
/* 011CFC 01DBD9FC 201B20AC */  sw          $0, %lo(CScript__2 + 0x20)($1)
/* 011D00 01DBDA00 3000BF7B */  lq          $31, 0x30($29)
/* 011D04 01DBDA04 2000B27B */  lq          $18, 0x20($29)
/* 011D08 01DBDA08 1000B17B */  lq          $17, 0x10($29)
/* 011D0C 01DBDA0C 0000B07B */  lq          $16, 0x0($29)
/* 011D10 01DBDA10 1002BD27 */  addiu       $29, $29, 0x210
/* 011D14 01DBDA14 0800E003 */  jr          $31
/* 011D18 01DBDA18 00000000 */   nop
/* 011D1C 01DBDA1C 00000000 */  nop
