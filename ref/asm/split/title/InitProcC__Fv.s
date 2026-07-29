.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel InitProcC__Fv
/* 021760 01DCD460 D0FBBD27 */  addiu       $29, $29, -0x430
/* 021764 01DCD464 5000BF7F */  sq          $31, 0x50($29)
/* 021768 01DCD468 4000B47F */  sq          $20, 0x40($29)
/* 02176C 01DCD46C 3000B37F */  sq          $19, 0x30($29)
/* 021770 01DCD470 2000B27F */  sq          $18, 0x20($29)
/* 021774 01DCD474 1000B17F */  sq          $17, 0x10($29)
/* 021778 01DCD478 0000B07F */  sq          $16, 0x0($29)
/* 02177C 01DCD47C DE01023C */  lui         $2, %hi(LIT_1156__4)
/* 021780 01DCD480 C0B34524 */  addiu       $5, $2, %lo(LIT_1156__4)
/* 021784 01DCD484 6000A427 */  addiu       $4, $29, 0x60
/* 021788 01DCD488 09000324 */  addiu       $3, $0, 0x9
.L01DCD48C_2D2C8C:
/* 02178C 01DCD48C 0000A278 */  lq          $2, 0x0($5)
/* 021790 01DCD490 1000A524 */  addiu       $5, $5, 0x10
/* 021794 01DCD494 FFFF6324 */  addiu       $3, $3, -0x1
/* 021798 01DCD498 0000827C */  sq          $2, 0x0($4)
/* 02179C 01DCD49C 10008424 */  addiu       $4, $4, 0x10
/* 0217A0 01DCD4A0 FAFF601C */  bgtz        $3, .L01DCD48C_2D2C8C
/* 0217A4 01DCD4A4 00000000 */   nop
/* 0217A8 01DCD4A8 948B848F */  lw          $4, -0x746C($28)
/* 0217AC 01DCD4AC DE01023C */  lui         $2, %hi(LIT_937__5)
/* 0217B0 01DCD4B0 10024524 */  addiu       $5, $2, %lo(LIT_937__5)
/* 0217B4 01DCD4B4 28360070 */  paddub      $6, $0, $0
/* 0217B8 01DCD4B8 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0217BC 01DCD4BC 00000000 */   nop
/* 0217C0 01DCD4C0 9000A2AF */  sw          $2, 0x90($29)
/* 0217C4 01DCD4C4 948B848F */  lw          $4, -0x746C($28)
/* 0217C8 01DCD4C8 DE01023C */  lui         $2, %hi(LIT_938__2)
/* 0217CC 01DCD4CC 20024524 */  addiu       $5, $2, %lo(LIT_938__2)
/* 0217D0 01DCD4D0 28360070 */  paddub      $6, $0, $0
/* 0217D4 01DCD4D4 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0217D8 01DCD4D8 00000000 */   nop
/* 0217DC 01DCD4DC 9C00A2AF */  sw          $2, 0x9C($29)
/* 0217E0 01DCD4E0 948B848F */  lw          $4, -0x746C($28)
/* 0217E4 01DCD4E4 DE01023C */  lui         $2, %hi(LIT_1215__2)
/* 0217E8 01DCD4E8 E0054524 */  addiu       $5, $2, %lo(LIT_1215__2)
/* 0217EC 01DCD4EC 28360070 */  paddub      $6, $0, $0
/* 0217F0 01DCD4F0 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0217F4 01DCD4F4 00000000 */   nop
/* 0217F8 01DCD4F8 A800A2AF */  sw          $2, 0xA8($29)
/* 0217FC 01DCD4FC 948B848F */  lw          $4, -0x746C($28)
/* 021800 01DCD500 DE01023C */  lui         $2, %hi(LIT_1216)
/* 021804 01DCD504 F0054524 */  addiu       $5, $2, %lo(LIT_1216)
/* 021808 01DCD508 28360070 */  paddub      $6, $0, $0
/* 02180C 01DCD50C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 021810 01DCD510 00000000 */   nop
/* 021814 01DCD514 B400A2AF */  sw          $2, 0xB4($29)
/* 021818 01DCD518 948B848F */  lw          $4, -0x746C($28)
/* 02181C 01DCD51C DE01023C */  lui         $2, %hi(LIT_1217)
/* 021820 01DCD520 00064524 */  addiu       $5, $2, %lo(LIT_1217)
/* 021824 01DCD524 28360070 */  paddub      $6, $0, $0
/* 021828 01DCD528 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 02182C 01DCD52C 00000000 */   nop
/* 021830 01DCD530 C000A2AF */  sw          $2, 0xC0($29)
/* 021834 01DCD534 948B848F */  lw          $4, -0x746C($28)
/* 021838 01DCD538 DE01023C */  lui         $2, %hi(LIT_939__2)
/* 02183C 01DCD53C 30024524 */  addiu       $5, $2, %lo(LIT_939__2)
/* 021840 01DCD540 28360070 */  paddub      $6, $0, $0
/* 021844 01DCD544 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 021848 01DCD548 00000000 */   nop
/* 02184C 01DCD54C CC00A2AF */  sw          $2, 0xCC($29)
/* 021850 01DCD550 948B848F */  lw          $4, -0x746C($28)
/* 021854 01DCD554 DE01023C */  lui         $2, %hi(LIT_1218)
/* 021858 01DCD558 10064524 */  addiu       $5, $2, %lo(LIT_1218)
/* 02185C 01DCD55C 28360070 */  paddub      $6, $0, $0
/* 021860 01DCD560 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 021864 01DCD564 00000000 */   nop
/* 021868 01DCD568 D800A2AF */  sw          $2, 0xD8($29)
/* 02186C 01DCD56C C701023C */  lui         $2, %hi(TexManager)
/* 021870 01DCD570 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 021874 01DCD574 282E0070 */  paddub      $5, $0, $0
/* 021878 01DCD578 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 02187C 01DCD57C 00000000 */   nop
/* 021880 01DCD580 C701023C */  lui         $2, %hi(TexManager)
/* 021884 01DCD584 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 021888 01DCD588 FCCD040C */  jal         CleanUpBuffer__15CTextureManagerFv
/* 02188C 01DCD58C 00000000 */   nop
/* 021890 01DCD590 C701023C */  lui         $2, %hi(TexManager)
/* 021894 01DCD594 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 021898 01DCD598 E03F0524 */  addiu       $5, $0, 0x3FE0
/* 02189C 01DCD59C F0C3040C */  jal         Initialize__15CTextureManagerFi
/* 0218A0 01DCD5A0 00000000 */   nop
/* 0218A4 01DCD5A4 C701023C */  lui         $2, %hi(TexManager)
/* 0218A8 01DCD5A8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0218AC 01DCD5AC FFFF0524 */  addiu       $5, $0, -0x1
/* 0218B0 01DCD5B0 6000A627 */  addiu       $6, $29, 0x60
/* 0218B4 01DCD5B4 C8CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 0218B8 01DCD5B8 00000000 */   nop
/* 0218BC 01DCD5BC 01000224 */  addiu       $2, $0, 0x1
/* 0218C0 01DCD5C0 E401013C */  lui         $1, %hi(CharaTex)
/* 0218C4 01DCD5C4 10D022A0 */  sb          $2, %lo(CharaTex)($1)
/* 0218C8 01DCD5C8 09000224 */  addiu       $2, $0, 0x9
/* 0218CC 01DCD5CC E401013C */  lui         $1, %hi(CharaTex + 0x8)
/* 0218D0 01DCD5D0 18D022A0 */  sb          $2, %lo(CharaTex + 0x8)($1)
/* 0218D4 01DCD5D4 E401013C */  lui         $1, %hi(CharaDataBuffer + 0x8)
/* 0218D8 01DCD5D8 28D020AC */  sw          $0, %lo(CharaDataBuffer + 0x8)($1)
/* 0218DC 01DCD5DC DF01023C */  lui         $2, %hi(Chara__3)
/* 0218E0 01DCD5E0 E0FE4424 */  addiu       $4, $2, %lo(Chara__3)
/* 0218E4 01DCD5E4 948B858F */  lw          $5, -0x746C($28)
/* 0218E8 01DCD5E8 DE01023C */  lui         $2, %hi(LIT_1081__2)
/* 0218EC 01DCD5EC 08044624 */  addiu       $6, $2, %lo(LIT_1081__2)
/* 0218F0 01DCD5F0 E401023C */  lui         $2, %hi(CharaDataBuffer)
/* 0218F4 01DCD5F4 20D04724 */  addiu       $7, $2, %lo(CharaDataBuffer)
/* 0218F8 01DCD5F8 28460070 */  paddub      $8, $0, $0
/* 0218FC 01DCD5FC FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 021900 01DCD600 00000000 */   nop
/* 021904 01DCD604 F000A427 */  addiu       $4, $29, 0xF0
/* 021908 01DCD608 509F040C */  jal         __ct__10CFrameAttrFv
/* 02190C 01DCD60C 00000000 */   nop
/* 021910 01DCD610 F800B027 */  addiu       $16, $29, 0xF8
/* 021914 01DCD614 000000A2 */  sb          $0, 0x0($16)
/* 021918 01DCD618 DF01013C */  lui         $1, %hi(Chara__3 + 0xBC)
/* 02191C 01DCD61C 9CFF248C */  lw          $4, %lo(Chara__3 + 0xBC)($1)
/* 021920 01DCD620 F000A527 */  addiu       $5, $29, 0xF0
/* 021924 01DCD624 01000624 */  addiu       $6, $0, 0x1
/* 021928 01DCD628 04000724 */  addiu       $7, $0, 0x4
/* 02192C 01DCD62C D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 021930 01DCD630 00000000 */   nop
/* 021934 01DCD634 2041023C */  lui         $2, (0x41200000 >> 16)
/* 021938 01DCD638 DF01013C */  lui         $1, %hi(Chara__3 + 0x2F0)
/* 02193C 01DCD63C D00122AC */  sw          $2, %lo(Chara__3 + 0x2F0)($1)
/* 021940 01DCD640 008180C7 */  lwc1        $f0, -0x7F00($28)
/* 021944 01DCD644 DF01013C */  lui         $1, %hi(Chara__3 + 0x2F8)
/* 021948 01DCD648 D80120E4 */  swc1        $f0, %lo(Chara__3 + 0x2F8)($1)
/* 02194C 01DCD64C DF01013C */  lui         $1, %hi(Chara__3 + 0x304)
/* 021950 01DCD650 E40120AC */  sw          $0, %lo(Chara__3 + 0x304)($1)
/* 021954 01DCD654 DF01013C */  lui         $1, %hi(Chara__3 + 0x308)
/* 021958 01DCD658 E80120AC */  sw          $0, %lo(Chara__3 + 0x308)($1)
/* 02195C 01DCD65C DF01023C */  lui         $2, %hi(Chara__3)
/* 021960 01DCD660 E0FE4424 */  addiu       $4, $2, %lo(Chara__3)
/* 021964 01DCD664 282E0070 */  paddub      $5, $0, $0
/* 021968 01DCD668 88E0040C */  jal         FootSoundEnable__10CCharacterFi
/* 02196C 01DCD66C 00000000 */   nop
/* 021970 01DCD670 E401023C */  lui         $2, %hi(Wind__4)
/* 021974 01DCD674 C0CC4224 */  addiu       $2, $2, %lo(Wind__4)
/* 021978 01DCD678 DF01013C */  lui         $1, %hi(Chara__3 + 0xC98)
/* 02197C 01DCD67C 780B22AC */  sw          $2, %lo(Chara__3 + 0xC98)($1)
/* 021980 01DCD680 E001023C */  lui         $2, %hi(MainMonstorUnit + 0x490)
/* 021984 01DCD684 608C4424 */  addiu       $4, $2, %lo(MainMonstorUnit + 0x490)
/* 021988 01DCD688 948B858F */  lw          $5, -0x746C($28)
/* 02198C 01DCD68C DE01023C */  lui         $2, %hi(LIT_1219)
/* 021990 01DCD690 18064624 */  addiu       $6, $2, %lo(LIT_1219)
/* 021994 01DCD694 E401023C */  lui         $2, %hi(CharaDataBuffer)
/* 021998 01DCD698 20D04724 */  addiu       $7, $2, %lo(CharaDataBuffer)
/* 02199C 01DCD69C 28460070 */  paddub      $8, $0, $0
/* 0219A0 01DCD6A0 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 0219A4 01DCD6A4 00000000 */   nop
/* 0219A8 01DCD6A8 000000A2 */  sb          $0, 0x0($16)
/* 0219AC 01DCD6AC E001013C */  lui         $1, %hi(MainMonstorUnit + 0x54C)
/* 0219B0 01DCD6B0 1C8D248C */  lw          $4, %lo(MainMonstorUnit + 0x54C)($1)
/* 0219B4 01DCD6B4 F000A527 */  addiu       $5, $29, 0xF0
/* 0219B8 01DCD6B8 01000624 */  addiu       $6, $0, 0x1
/* 0219BC 01DCD6BC 04000724 */  addiu       $7, $0, 0x4
/* 0219C0 01DCD6C0 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 0219C4 01DCD6C4 00000000 */   nop
/* 0219C8 01DCD6C8 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0219CC 01DCD6CC E001013C */  lui         $1, %hi(MainMonstorUnit + 0x780)
/* 0219D0 01DCD6D0 508F22AC */  sw          $2, %lo(MainMonstorUnit + 0x780)($1)
/* 0219D4 01DCD6D4 008180C7 */  lwc1        $f0, -0x7F00($28)
/* 0219D8 01DCD6D8 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x788)
/* 0219DC 01DCD6DC 588F20E4 */  swc1        $f0, %lo(MainMonstorUnit + 0x788)($1)
/* 0219E0 01DCD6E0 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x794)
/* 0219E4 01DCD6E4 648F20AC */  sw          $0, %lo(MainMonstorUnit + 0x794)($1)
/* 0219E8 01DCD6E8 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x798)
/* 0219EC 01DCD6EC 688F20AC */  sw          $0, %lo(MainMonstorUnit + 0x798)($1)
/* 0219F0 01DCD6F0 DE01023C */  lui         $2, %hi(LIT_1176__2)
/* 0219F4 01DCD6F4 50B44624 */  addiu       $6, $2, %lo(LIT_1176__2)
/* 0219F8 01DCD6F8 5001A527 */  addiu       $5, $29, 0x150
/* 0219FC 01DCD6FC 10000424 */  addiu       $4, $0, 0x10
.L01DCD700_2D2F00:
/* 021A00 01DCD700 0000C378 */  lq          $3, 0x0($6)
/* 021A04 01DCD704 1000C278 */  lq          $2, 0x10($6)
/* 021A08 01DCD708 2000C624 */  addiu       $6, $6, 0x20
/* 021A0C 01DCD70C FFFF8424 */  addiu       $4, $4, -0x1
/* 021A10 01DCD710 0000A37C */  sq          $3, 0x0($5)
/* 021A14 01DCD714 1000A27C */  sq          $2, 0x10($5)
/* 021A18 01DCD718 2000A524 */  addiu       $5, $5, 0x20
/* 021A1C 01DCD71C F8FF801C */  bgtz        $4, .L01DCD700_2D2F00
/* 021A20 01DCD720 00000000 */   nop
/* 021A24 01DCD724 0000C2DC */  ld          $2, 0x0($6)
/* 021A28 01DCD728 0000A2FC */  sd          $2, 0x0($5)
/* 021A2C 01DCD72C B89880AF */  sw          $0, -0x6748($28)
/* 021A30 01DCD730 B49880AF */  sw          $0, -0x674C($28)
/* 021A34 01DCD734 DF01013C */  lui         $1, %hi(MapDataBuffer + 0x8)
/* 021A38 01DCD738 B8FE20AC */  sw          $0, %lo(MapDataBuffer + 0x8)($1)
/* 021A3C 01DCD73C 6003A427 */  addiu       $4, $29, 0x360
/* 021A40 01DCD740 509F040C */  jal         __ct__10CFrameAttrFv
/* 021A44 01DCD744 00000000 */   nop
/* 021A48 01DCD748 288E0070 */  paddub      $17, $0, $0
/* 021A4C 01DCD74C 62000010 */  b           .L01DCD8D8_2D30D8
/* 021A50 01DCD750 00000000 */   nop
.L01DCD754_2D2F54:
/* 021A54 01DCD754 80101100 */  sll         $2, $17, 2
/* 021A58 01DCD758 21105100 */  addu        $2, $2, $17
/* 021A5C 01DCD75C 80A00200 */  sll         $20, $2, 2
/* 021A60 01DCD760 21109D02 */  addu        $2, $20, $29
/* 021A64 01DCD764 948B848F */  lw          $4, -0x746C($28)
/* 021A68 01DCD768 5001458C */  lw          $5, 0x150($2)
/* 021A6C 01DCD76C 28360070 */  paddub      $6, $0, $0
/* 021A70 01DCD770 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 021A74 01DCD774 00000000 */   nop
/* 021A78 01DCD778 28264070 */  paddub      $4, $2, $0
/* 021A7C 01DCD77C DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 021A80 01DCD780 B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 021A84 01DCD784 02000624 */  addiu       $6, $0, 0x2
/* 021A88 01DCD788 283E0070 */  paddub      $7, $0, $0
/* 021A8C 01DCD78C 28460070 */  paddub      $8, $0, $0
/* 021A90 01DCD790 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 021A94 01DCD794 00000000 */   nop
/* 021A98 01DCD798 28864070 */  paddub      $16, $2, $0
/* 021A9C 01DCD79C 01000624 */  addiu       $6, $0, 0x1
/* 021AA0 01DCD7A0 6C03A6A3 */  sb          $6, 0x36C($29)
/* 021AA4 01DCD7A4 28260072 */  paddub      $4, $16, $0
/* 021AA8 01DCD7A8 6003A527 */  addiu       $5, $29, 0x360
/* 021AAC 01DCD7AC 40000724 */  addiu       $7, $0, 0x40
/* 021AB0 01DCD7B0 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 021AB4 01DCD7B4 00000000 */   nop
/* 021AB8 01DCD7B8 28260072 */  paddub      $4, $16, $0
/* 021ABC 01DCD7BC 01000524 */  addiu       $5, $0, 0x1
/* 021AC0 01DCD7C0 BC97040C */  jal         SetFrameAttr__FP6CFramei
/* 021AC4 01DCD7C4 00000000 */   nop
/* 021AC8 01DCD7C8 00111100 */  sll         $2, $17, 4
/* 021ACC 01DCD7CC 23105100 */  subu        $2, $2, $17
/* 021AD0 01DCD7D0 00990200 */  sll         $19, $2, 4
/* 021AD4 01DCD7D4 E201023C */  lui         $2, %hi(OP_NornMapObj)
/* 021AD8 01DCD7D8 B0F64224 */  addiu       $2, $2, %lo(OP_NornMapObj)
/* 021ADC 01DCD7DC 21905300 */  addu        $18, $2, $19
/* 021AE0 01DCD7E0 28264072 */  paddub      $4, $18, $0
/* 021AE4 01DCD7E4 445E050C */  jal         Initialize__10CMapObjectFv
/* 021AE8 01DCD7E8 00000000 */   nop
/* 021AEC 01DCD7EC 28264072 */  paddub      $4, $18, $0
/* 021AF0 01DCD7F0 282E0072 */  paddub      $5, $16, $0
/* 021AF4 01DCD7F4 28360070 */  paddub      $6, $0, $0
/* 021AF8 01DCD7F8 305C050C */  jal         SetFrame__12CObjectFrameFP9CFrameVu1i
/* 021AFC 01DCD7FC 00000000 */   nop
/* 021B00 01DCD800 E201023C */  lui         $2, %hi(OP_NornMapObj + 0xE8)
/* 021B04 01DCD804 98F74224 */  addiu       $2, $2, %lo(OP_NornMapObj + 0xE8)
/* 021B08 01DCD808 21105300 */  addu        $2, $2, $19
/* 021B0C 01DCD80C 000040AC */  sw          $0, 0x0($2)
/* 021B10 01DCD810 E201023C */  lui         $2, %hi(OP_NornMapObj + 0xE4)
/* 021B14 01DCD814 94F74224 */  addiu       $2, $2, %lo(OP_NornMapObj + 0xE4)
/* 021B18 01DCD818 21105300 */  addu        $2, $2, $19
/* 021B1C 01DCD81C 000040AC */  sw          $0, 0x0($2)
/* 021B20 01DCD820 21109D02 */  addu        $2, $20, $29
/* 021B24 01DCD824 5C0142C4 */  lwc1        $f2, 0x15C($2)
/* 021B28 01DCD828 580141C4 */  lwc1        $f1, 0x158($2)
/* 021B2C 01DCD82C 540140C4 */  lwc1        $f0, 0x154($2)
/* 021B30 01DCD830 1004A0E7 */  swc1        $f0, 0x410($29)
/* 021B34 01DCD834 1404A1E7 */  swc1        $f1, 0x414($29)
/* 021B38 01DCD838 1804A2E7 */  swc1        $f2, 0x418($29)
/* 021B3C 01DCD83C 28264072 */  paddub      $4, $18, $0
/* 021B40 01DCD840 1004A527 */  addiu       $5, $29, 0x410
/* 021B44 01DCD844 A000598E */  lw          $25, 0xA0($18)
/* 021B48 01DCD848 1000398F */  lw          $25, 0x10($25)
/* 021B4C 01DCD84C 09F82003 */  jalr        $25
/* 021B50 01DCD850 00000000 */   nop
/* 021B54 01DCD854 21109D02 */  addu        $2, $20, $29
/* 021B58 01DCD858 60014CC4 */  lwc1        $f12, 0x160($2)
/* 021B5C 01DCD85C 9044040C */  jal         fptodp
/* 021B60 01DCD860 00000000 */   nop
/* 021B64 01DCD864 188084DF */  ld          $4, -0x7FE8($28)
/* 021B68 01DCD868 282E4070 */  paddub      $5, $2, $0
/* 021B6C 01DCD86C 9E3F040C */  jal         dpmul
/* 021B70 01DCD870 00000000 */   nop
/* 021B74 01DCD874 28864070 */  paddub      $16, $2, $0
/* 021B78 01DCD878 B4000424 */  addiu       $4, $0, 0xB4
/* 021B7C 01DCD87C FC40040C */  jal         litodp
/* 021B80 01DCD880 00000000 */   nop
/* 021B84 01DCD884 28260072 */  paddub      $4, $16, $0
/* 021B88 01DCD888 282E4070 */  paddub      $5, $2, $0
/* 021B8C 01DCD88C 4840040C */  jal         dpdiv
/* 021B90 01DCD890 00000000 */   nop
/* 021B94 01DCD894 28864070 */  paddub      $16, $2, $0
/* 021B98 01DCD898 28264070 */  paddub      $4, $2, $0
/* 021B9C 01DCD89C 9241040C */  jal         dptofp
/* 021BA0 01DCD8A0 00000000 */   nop
/* 021BA4 01DCD8A4 2004A0AF */  sw          $0, 0x420($29)
/* 021BA8 01DCD8A8 28260072 */  paddub      $4, $16, $0
/* 021BAC 01DCD8AC 9241040C */  jal         dptofp
/* 021BB0 01DCD8B0 00000000 */   nop
/* 021BB4 01DCD8B4 2404A0E7 */  swc1        $f0, 0x424($29)
/* 021BB8 01DCD8B8 2804A0AF */  sw          $0, 0x428($29)
/* 021BBC 01DCD8BC 28264072 */  paddub      $4, $18, $0
/* 021BC0 01DCD8C0 2004A527 */  addiu       $5, $29, 0x420
/* 021BC4 01DCD8C4 A000598E */  lw          $25, 0xA0($18)
/* 021BC8 01DCD8C8 2C00398F */  lw          $25, 0x2C($25)
/* 021BCC 01DCD8CC 09F82003 */  jalr        $25
/* 021BD0 01DCD8D0 00000000 */   nop
/* 021BD4 01DCD8D4 01003126 */  addiu       $17, $17, 0x1
.L01DCD8D8_2D30D8:
/* 021BD8 01DCD8D8 1A00222A */  slti        $2, $17, 0x1A
/* 021BDC 01DCD8DC 9DFF4014 */  bnez        $2, .L01DCD754_2D2F54
/* 021BE0 01DCD8E0 00000000 */   nop
/* 021BE4 01DCD8E4 E501013C */  lui         $1, %hi(PathDataBuffer + 0x8)
/* 021BE8 01DCD8E8 C80A20AC */  sw          $0, %lo(PathDataBuffer + 0x8)($1)
/* 021BEC 01DCD8EC FFFF0224 */  addiu       $2, $0, -0x1
/* 021BF0 01DCD8F0 C09B82AF */  sw          $2, -0x6440($28)
/* 021BF4 01DCD8F4 DE01023C */  lui         $2, %hi(LIT_1183__3)
/* 021BF8 01DCD8F8 60B64224 */  addiu       $2, $2, %lo(LIT_1183__3)
/* 021BFC 01DCD8FC C003A327 */  addiu       $3, $29, 0x3C0
/* 021C00 01DCD900 00004278 */  lq          $2, 0x0($2)
/* 021C04 01DCD904 0000627C */  sq          $2, 0x0($3)
/* 021C08 01DCD908 28860070 */  paddub      $16, $0, $0
/* 021C0C 01DCD90C 27000010 */  b           .L01DCD9AC_2D31AC
/* 021C10 01DCD910 00000000 */   nop
.L01DCD914_2D3114:
/* 021C14 01DCD914 B0110224 */  addiu       $2, $0, 0x11B0
/* 021C18 01DCD918 18880202 */  mult        $17, $16, $2
/* 021C1C 01DCD91C E501023C */  lui         $2, %hi(Cam)
/* 021C20 01DCD920 F0C34224 */  addiu       $2, $2, %lo(Cam)
/* 021C24 01DCD924 21205100 */  addu        $4, $2, $17
/* 021C28 01DCD928 80101000 */  sll         $2, $16, 2
/* 021C2C 01DCD92C 21105D00 */  addu        $2, $2, $29
/* 021C30 01DCD930 948B858F */  lw          $5, -0x746C($28)
/* 021C34 01DCD934 C003468C */  lw          $6, 0x3C0($2)
/* 021C38 01DCD938 E501023C */  lui         $2, %hi(PathDataBuffer)
/* 021C3C 01DCD93C C00A4724 */  addiu       $7, $2, %lo(PathDataBuffer)
/* 021C40 01DCD940 28460070 */  paddub      $8, $0, $0
/* 021C44 01DCD944 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 021C48 01DCD948 00000000 */   nop
/* 021C4C 01DCD94C 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 021C50 01DCD950 E501023C */  lui         $2, %hi(Cam + 0x2F0)
/* 021C54 01DCD954 E0C64224 */  addiu       $2, $2, %lo(Cam + 0x2F0)
/* 021C58 01DCD958 21105100 */  addu        $2, $2, $17
/* 021C5C 01DCD95C 000043AC */  sw          $3, 0x0($2)
/* 021C60 01DCD960 E501023C */  lui         $2, %hi(Cam + 0x2F8)
/* 021C64 01DCD964 E8C64224 */  addiu       $2, $2, %lo(Cam + 0x2F8)
/* 021C68 01DCD968 21105100 */  addu        $2, $2, $17
/* 021C6C 01DCD96C 000043AC */  sw          $3, 0x0($2)
/* 021C70 01DCD970 E501023C */  lui         $2, %hi(Cam + 0x304)
/* 021C74 01DCD974 F4C64224 */  addiu       $2, $2, %lo(Cam + 0x304)
/* 021C78 01DCD978 21105100 */  addu        $2, $2, $17
/* 021C7C 01DCD97C 000040AC */  sw          $0, 0x0($2)
/* 021C80 01DCD980 E501023C */  lui         $2, %hi(Cam + 0x308)
/* 021C84 01DCD984 F8C64224 */  addiu       $2, $2, %lo(Cam + 0x308)
/* 021C88 01DCD988 21105100 */  addu        $2, $2, $17
/* 021C8C 01DCD98C 000040AC */  sw          $0, 0x0($2)
/* 021C90 01DCD990 E301023C */  lui         $2, %hi(MainCamera__3)
/* 021C94 01DCD994 80E64324 */  addiu       $3, $2, %lo(MainCamera__3)
/* 021C98 01DCD998 E501023C */  lui         $2, %hi(Cam + 0x310)
/* 021C9C 01DCD99C 00C74224 */  addiu       $2, $2, %lo(Cam + 0x310)
/* 021CA0 01DCD9A0 21105100 */  addu        $2, $2, $17
/* 021CA4 01DCD9A4 000043AC */  sw          $3, 0x0($2)
/* 021CA8 01DCD9A8 01001026 */  addiu       $16, $16, 0x1
.L01DCD9AC_2D31AC:
/* 021CAC 01DCD9AC D9FF001A */  blez        $16, .L01DCD914_2D3114
/* 021CB0 01DCD9B0 00000000 */   nop
/* 021CB4 01DCD9B4 B89880AF */  sw          $0, -0x6748($28)
/* 021CB8 01DCD9B8 B49880AF */  sw          $0, -0x674C($28)
/* 021CBC 01DCD9BC DE01023C */  lui         $2, %hi(LIT_1221)
/* 021CC0 01DCD9C0 20064424 */  addiu       $4, $2, %lo(LIT_1221)
/* 021CC4 01DCD9C4 00C5760C */  jal         OPAnalyz__FPc
/* 021CC8 01DCD9C8 00000000 */   nop
/* 021CCC 01DCD9CC 4CCA760C */  jal         OPMdsLoad__Fv
/* 021CD0 01DCD9D0 00000000 */   nop
/* 021CD4 01DCD9D4 DE01023C */  lui         $2, %hi(LIT_1189__2)
/* 021CD8 01DCD9D8 70B64224 */  addiu       $2, $2, %lo(LIT_1189__2)
/* 021CDC 01DCD9DC D003A527 */  addiu       $5, $29, 0x3D0
/* 021CE0 01DCD9E0 00004278 */  lq          $2, 0x0($2)
/* 021CE4 01DCD9E4 0000A27C */  sq          $2, 0x0($5)
/* 021CE8 01DCD9E8 DE01023C */  lui         $2, %hi(LIT_1190__2)
/* 021CEC 01DCD9EC 80B64224 */  addiu       $2, $2, %lo(LIT_1190__2)
/* 021CF0 01DCD9F0 E003A627 */  addiu       $6, $29, 0x3E0
/* 021CF4 01DCD9F4 00004278 */  lq          $2, 0x0($2)
/* 021CF8 01DCD9F8 0000C27C */  sq          $2, 0x0($6)
/* 021CFC 01DCD9FC DE01023C */  lui         $2, %hi(LIT_1191__2)
/* 021D00 01DCDA00 90B64224 */  addiu       $2, $2, %lo(LIT_1191__2)
/* 021D04 01DCDA04 F003A727 */  addiu       $7, $29, 0x3F0
/* 021D08 01DCDA08 00004278 */  lq          $2, 0x0($2)
/* 021D0C 01DCDA0C 0000E27C */  sq          $2, 0x0($7)
/* 021D10 01DCDA10 DE01023C */  lui         $2, %hi(LIT_1192__3)
/* 021D14 01DCDA14 A0B64224 */  addiu       $2, $2, %lo(LIT_1192__3)
/* 021D18 01DCDA18 0004A827 */  addiu       $8, $29, 0x400
/* 021D1C 01DCDA1C 00004278 */  lq          $2, 0x0($2)
/* 021D20 01DCDA20 0000027D */  sq          $2, 0x0($8)
/* 021D24 01DCDA24 E401023C */  lui         $2, %hi(Water__2)
/* 021D28 01DCDA28 F0CC4424 */  addiu       $4, $2, %lo(Water__2)
/* 021D2C 01DCDA2C B884050C */  jal         SetVertex__6CWaterFPfPfPfPf
/* 021D30 01DCDA30 00000000 */   nop
/* 021D34 01DCDA34 00608044 */  mtc1        $0, $f12
/* 021D38 01DCDA38 00000000 */  nop
/* 021D3C 01DCDA3C 46630046 */  mov.s       $f13, $f12
/* 021D40 01DCDA40 86630046 */  mov.s       $f14, $f12
/* 021D44 01DCDA44 E401023C */  lui         $2, %hi(Water__2 + 0xB0)
/* 021D48 01DCDA48 A0CD4424 */  addiu       $4, $2, %lo(Water__2 + 0xB0)
/* 021D4C 01DCDA4C A09F040C */  jal         SetPosition__6CFrameFfff
/* 021D50 01DCDA50 00000000 */   nop
/* 021D54 01DCDA54 E401023C */  lui         $2, %hi(Water__2)
/* 021D58 01DCDA58 F0CC4424 */  addiu       $4, $2, %lo(Water__2)
/* 021D5C 01DCDA5C 20000524 */  addiu       $5, $0, 0x20
/* 021D60 01DCDA60 2836A070 */  paddub      $6, $5, $0
/* 021D64 01DCDA64 E501023C */  lui         $2, %hi(WaterBuffer)
/* 021D68 01DCDA68 D00A4724 */  addiu       $7, $2, %lo(WaterBuffer)
/* 021D6C 01DCDA6C 0485050C */  jal         SetSize__6CWaterFiiP14CDataAlloc2_1_
/* 021D70 01DCDA70 00000000 */   nop
/* 021D74 01DCDA74 00708044 */  mtc1        $0, $f14
/* 021D78 01DCDA78 0040023C */  lui         $2, (0x40000000 >> 16)
/* 021D7C 01DCDA7C 00788244 */  mtc1        $2, $f15
/* 021D80 01DCDA80 E401023C */  lui         $2, %hi(Water__2)
/* 021D84 01DCDA84 F0CC4424 */  addiu       $4, $2, %lo(Water__2)
/* 021D88 01DCDA88 80808CC7 */  lwc1        $f12, -0x7F80($28)
/* 021D8C 01DCDA8C F8808DC7 */  lwc1        $f13, -0x7F08($28)
/* 021D90 01DCDA90 E881050C */  jal         SetParam__6CWaterFffff
/* 021D94 01DCDA94 00000000 */   nop
/* 021D98 01DCDA98 E401023C */  lui         $2, %hi(Water__2)
/* 021D9C 01DCDA9C F0CC4424 */  addiu       $4, $2, %lo(Water__2)
/* 021DA0 01DCDAA0 80000524 */  addiu       $5, $0, 0x80
/* 021DA4 01DCDAA4 2836A070 */  paddub      $6, $5, $0
/* 021DA8 01DCDAA8 283EA070 */  paddub      $7, $5, $0
/* 021DAC 01DCDAAC 2846A070 */  paddub      $8, $5, $0
/* 021DB0 01DCDAB0 F081050C */  jal         SetColor__6CWaterFUcUcUcUc
/* 021DB4 01DCDAB4 00000000 */   nop
/* 021DB8 01DCDAB8 5000BF7B */  lq          $31, 0x50($29)
/* 021DBC 01DCDABC 4000B47B */  lq          $20, 0x40($29)
/* 021DC0 01DCDAC0 3000B37B */  lq          $19, 0x30($29)
/* 021DC4 01DCDAC4 2000B27B */  lq          $18, 0x20($29)
/* 021DC8 01DCDAC8 1000B17B */  lq          $17, 0x10($29)
/* 021DCC 01DCDACC 0000B07B */  lq          $16, 0x0($29)
/* 021DD0 01DCDAD0 3004BD27 */  addiu       $29, $29, 0x430
/* 021DD4 01DCDAD4 0800E003 */  jr          $31
/* 021DD8 01DCDAD8 00000000 */   nop
/* 021DDC 01DCDADC 00000000 */  nop
