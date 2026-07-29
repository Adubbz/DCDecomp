.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel OpC_InitProcess5__Fv
/* 011FF0 01DBDCF0 90FCBD27 */  addiu       $29, $29, -0x370
/* 011FF4 01DBDCF4 6000BF7F */  sq          $31, 0x60($29)
/* 011FF8 01DBDCF8 5000B57F */  sq          $21, 0x50($29)
/* 011FFC 01DBDCFC 4000B47F */  sq          $20, 0x40($29)
/* 012000 01DBDD00 3000B37F */  sq          $19, 0x30($29)
/* 012004 01DBDD04 2000B27F */  sq          $18, 0x20($29)
/* 012008 01DBDD08 1000B17F */  sq          $17, 0x10($29)
/* 01200C 01DBDD0C 0000B07F */  sq          $16, 0x0($29)
.L01DBDD10_2C3510:
/* 012010 01DBDD10 8CFB040C */  jal         ReadBGSync__Fv
/* 012014 01DBDD14 00000000 */   nop
/* 012018 01DBDD18 FDFF4014 */  bnez        $2, .L01DBDD10_2C3510
/* 01201C 01DBDD1C 00000000 */   nop
/* 012020 01DBDD20 C701023C */  lui         $2, %hi(TexManager)
/* 012024 01DBDD24 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 012028 01DBDD28 0D000524 */  addiu       $5, $0, 0xD
/* 01202C 01DBDD2C C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 012030 01DBDD30 00000000 */   nop
/* 012034 01DBDD34 C701023C */  lui         $2, %hi(TexManager)
/* 012038 01DBDD38 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01203C 01DBDD3C 11000524 */  addiu       $5, $0, 0x11
/* 012040 01DBDD40 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 012044 01DBDD44 00000000 */   nop
/* 012048 01DBDD48 C701023C */  lui         $2, %hi(TexManager)
/* 01204C 01DBDD4C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 012050 01DBDD50 282E0070 */  paddub      $5, $0, $0
/* 012054 01DBDD54 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 012058 01DBDD58 00000000 */   nop
/* 01205C 01DBDD5C C701023C */  lui         $2, %hi(TexManager)
/* 012060 01DBDD60 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 012064 01DBDD64 FCCD040C */  jal         CleanUpBuffer__15CTextureManagerFv
/* 012068 01DBDD68 00000000 */   nop
/* 01206C 01DBDD6C DD01023C */  lui         $2, %hi(LIT_601__3)
/* 012070 01DBDD70 707E4524 */  addiu       $5, $2, %lo(LIT_601__3)
/* 012074 01DBDD74 7000A427 */  addiu       $4, $29, 0x70
/* 012078 01DBDD78 0B000324 */  addiu       $3, $0, 0xB
.L01DBDD7C_2C357C:
/* 01207C 01DBDD7C 0000A278 */  lq          $2, 0x0($5)
/* 012080 01DBDD80 1000A524 */  addiu       $5, $5, 0x10
/* 012084 01DBDD84 FFFF6324 */  addiu       $3, $3, -0x1
/* 012088 01DBDD88 0000827C */  sq          $2, 0x0($4)
/* 01208C 01DBDD8C 10008424 */  addiu       $4, $4, 0x10
/* 012090 01DBDD90 FAFF601C */  bgtz        $3, .L01DBDD7C_2C357C
/* 012094 01DBDD94 00000000 */   nop
/* 012098 01DBDD98 0000A2C4 */  lwc1        $f2, 0x0($5)
/* 01209C 01DBDD9C 000082E4 */  swc1        $f2, 0x0($4)
/* 0120A0 01DBDDA0 948B848F */  lw          $4, -0x746C($28)
/* 0120A4 01DBDDA4 DE01023C */  lui         $2, %hi(LIT_468__5)
/* 0120A8 01DBDDA8 08ED4524 */  addiu       $5, $2, %lo(LIT_468__5)
/* 0120AC 01DBDDAC 28360070 */  paddub      $6, $0, $0
/* 0120B0 01DBDDB0 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0120B4 01DBDDB4 00000000 */   nop
/* 0120B8 01DBDDB8 7C00B027 */  addiu       $16, $29, 0x7C
/* 0120BC 01DBDDBC 000002AE */  sw          $2, 0x0($16)
/* 0120C0 01DBDDC0 8000B127 */  addiu       $17, $29, 0x80
/* 0120C4 01DBDDC4 000020AE */  sw          $0, 0x0($17)
/* 0120C8 01DBDDC8 8400B227 */  addiu       $18, $29, 0x84
/* 0120CC 01DBDDCC 000040AE */  sw          $0, 0x0($18)
/* 0120D0 01DBDDD0 8800B327 */  addiu       $19, $29, 0x88
/* 0120D4 01DBDDD4 000060AE */  sw          $0, 0x0($19)
/* 0120D8 01DBDDD8 C701023C */  lui         $2, %hi(TexManager)
/* 0120DC 01DBDDDC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0120E0 01DBDDE0 282E0070 */  paddub      $5, $0, $0
/* 0120E4 01DBDDE4 7000A627 */  addiu       $6, $29, 0x70
/* 0120E8 01DBDDE8 C8CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 0120EC 01DBDDEC 00000000 */   nop
/* 0120F0 01DBDDF0 948B848F */  lw          $4, -0x746C($28)
/* 0120F4 01DBDDF4 DE01023C */  lui         $2, %hi(LIT_617__5)
/* 0120F8 01DBDDF8 08F14524 */  addiu       $5, $2, %lo(LIT_617__5)
/* 0120FC 01DBDDFC 28360070 */  paddub      $6, $0, $0
/* 012100 01DBDE00 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 012104 01DBDE04 00000000 */   nop
/* 012108 01DBDE08 7000A2AF */  sw          $2, 0x70($29)
/* 01210C 01DBDE0C 11000224 */  addiu       $2, $0, 0x11
/* 012110 01DBDE10 7400B427 */  addiu       $20, $29, 0x74
/* 012114 01DBDE14 000082AE */  sw          $2, 0x0($20)
/* 012118 01DBDE18 7800B527 */  addiu       $21, $29, 0x78
/* 01211C 01DBDE1C 0000A0AE */  sw          $0, 0x0($21)
/* 012120 01DBDE20 948B848F */  lw          $4, -0x746C($28)
/* 012124 01DBDE24 DE01023C */  lui         $2, %hi(LIT_573__4)
/* 012128 01DBDE28 68F04524 */  addiu       $5, $2, %lo(LIT_573__4)
/* 01212C 01DBDE2C 28360070 */  paddub      $6, $0, $0
/* 012130 01DBDE30 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 012134 01DBDE34 00000000 */   nop
/* 012138 01DBDE38 000002AE */  sw          $2, 0x0($16)
/* 01213C 01DBDE3C 11000224 */  addiu       $2, $0, 0x11
/* 012140 01DBDE40 000022AE */  sw          $2, 0x0($17)
/* 012144 01DBDE44 000040AE */  sw          $0, 0x0($18)
/* 012148 01DBDE48 948B848F */  lw          $4, -0x746C($28)
/* 01214C 01DBDE4C DE01023C */  lui         $2, %hi(LIT_595__4)
/* 012150 01DBDE50 E8F04524 */  addiu       $5, $2, %lo(LIT_595__4)
/* 012154 01DBDE54 28360070 */  paddub      $6, $0, $0
/* 012158 01DBDE58 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 01215C 01DBDE5C 00000000 */   nop
/* 012160 01DBDE60 000062AE */  sw          $2, 0x0($19)
/* 012164 01DBDE64 11000224 */  addiu       $2, $0, 0x11
/* 012168 01DBDE68 8C00A2AF */  sw          $2, 0x8C($29)
/* 01216C 01DBDE6C 9000A0AF */  sw          $0, 0x90($29)
/* 012170 01DBDE70 948B848F */  lw          $4, -0x746C($28)
/* 012174 01DBDE74 DE01023C */  lui         $2, %hi(LIT_596__5)
/* 012178 01DBDE78 F8F04524 */  addiu       $5, $2, %lo(LIT_596__5)
/* 01217C 01DBDE7C 28360070 */  paddub      $6, $0, $0
/* 012180 01DBDE80 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 012184 01DBDE84 00000000 */   nop
/* 012188 01DBDE88 9400A2AF */  sw          $2, 0x94($29)
/* 01218C 01DBDE8C 11000524 */  addiu       $5, $0, 0x11
/* 012190 01DBDE90 9800A5AF */  sw          $5, 0x98($29)
/* 012194 01DBDE94 9C00A0AF */  sw          $0, 0x9C($29)
/* 012198 01DBDE98 A000A0AF */  sw          $0, 0xA0($29)
/* 01219C 01DBDE9C C701023C */  lui         $2, %hi(TexManager)
/* 0121A0 01DBDEA0 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0121A4 01DBDEA4 7000A627 */  addiu       $6, $29, 0x70
/* 0121A8 01DBDEA8 C8CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 0121AC 01DBDEAC 00000000 */   nop
/* 0121B0 01DBDEB0 DF01013C */  lui         $1, %hi(CharaDataBuffer__2 + 0x68)
/* 0121B4 01DBDEB4 68FE20AC */  sw          $0, %lo(CharaDataBuffer__2 + 0x68)($1)
/* 0121B8 01DBDEB8 18FB760C */  jal         MapLoad2__Fv
/* 0121BC 01DBDEBC 00000000 */   nop
/* 0121C0 01DBDEC0 E001023C */  lui         $2, %hi(MainMonstorUnit + 0x39A0)
/* 0121C4 01DBDEC4 70C14424 */  addiu       $4, $2, %lo(MainMonstorUnit + 0x39A0)
/* 0121C8 01DBDEC8 948B858F */  lw          $5, -0x746C($28)
/* 0121CC 01DBDECC DE01023C */  lui         $2, %hi(LIT_497__8)
/* 0121D0 01DBDED0 E8EE4624 */  addiu       $6, $2, %lo(LIT_497__8)
/* 0121D4 01DBDED4 DF01023C */  lui         $2, %hi(CharaDataBuffer__2)
/* 0121D8 01DBDED8 00FE4724 */  addiu       $7, $2, %lo(CharaDataBuffer__2)
/* 0121DC 01DBDEDC 28460070 */  paddub      $8, $0, $0
/* 0121E0 01DBDEE0 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 0121E4 01DBDEE4 00000000 */   nop
/* 0121E8 01DBDEE8 3001A427 */  addiu       $4, $29, 0x130
/* 0121EC 01DBDEEC 509F040C */  jal         __ct__10CFrameAttrFv
/* 0121F0 01DBDEF0 00000000 */   nop
/* 0121F4 01DBDEF4 3801A0A3 */  sb          $0, 0x138($29)
/* 0121F8 01DBDEF8 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x3A5C)
/* 0121FC 01DBDEFC 2CC2248C */  lw          $4, %lo(MainMonstorUnit + 0x3A5C)($1)
/* 012200 01DBDF00 3001A527 */  addiu       $5, $29, 0x130
/* 012204 01DBDF04 01000624 */  addiu       $6, $0, 0x1
/* 012208 01DBDF08 04000724 */  addiu       $7, $0, 0x4
/* 01220C 01DBDF0C D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 012210 01DBDF10 00000000 */   nop
/* 012214 01DBDF14 2041023C */  lui         $2, (0x41200000 >> 16)
/* 012218 01DBDF18 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x3C90)
/* 01221C 01DBDF1C 60C422AC */  sw          $2, %lo(MainMonstorUnit + 0x3C90)($1)
/* 012220 01DBDF20 948280C7 */  lwc1        $f0, -0x7D6C($28)
/* 012224 01DBDF24 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x3C98)
/* 012228 01DBDF28 68C420E4 */  swc1        $f0, %lo(MainMonstorUnit + 0x3C98)($1)
/* 01222C 01DBDF2C E001013C */  lui         $1, %hi(MainMonstorUnit + 0x3CA4)
/* 012230 01DBDF30 74C420AC */  sw          $0, %lo(MainMonstorUnit + 0x3CA4)($1)
/* 012234 01DBDF34 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x3CA8)
/* 012238 01DBDF38 78C420AC */  sw          $0, %lo(MainMonstorUnit + 0x3CA8)($1)
/* 01223C 01DBDF3C E301023C */  lui         $2, %hi(Wind__2)
/* 012240 01DBDF40 90AC4224 */  addiu       $2, $2, %lo(Wind__2)
/* 012244 01DBDF44 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x4638)
/* 012248 01DBDF48 08CE22AC */  sw          $2, %lo(MainMonstorUnit + 0x4638)($1)
/* 01224C 01DBDF4C 948B848F */  lw          $4, -0x746C($28)
/* 012250 01DBDF50 DE01023C */  lui         $2, %hi(LIT_618__3)
/* 012254 01DBDF54 18F14524 */  addiu       $5, $2, %lo(LIT_618__3)
/* 012258 01DBDF58 28360070 */  paddub      $6, $0, $0
/* 01225C 01DBDF5C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 012260 01DBDF60 00000000 */   nop
/* 012264 01DBDF64 7000A2AF */  sw          $2, 0x70($29)
/* 012268 01DBDF68 03000224 */  addiu       $2, $0, 0x3
/* 01226C 01DBDF6C 000082AE */  sw          $2, 0x0($20)
/* 012270 01DBDF70 0000A0AE */  sw          $0, 0x0($21)
/* 012274 01DBDF74 948B848F */  lw          $4, -0x746C($28)
/* 012278 01DBDF78 DE01023C */  lui         $2, %hi(LIT_619__6)
/* 01227C 01DBDF7C 28F14524 */  addiu       $5, $2, %lo(LIT_619__6)
/* 012280 01DBDF80 28360070 */  paddub      $6, $0, $0
/* 012284 01DBDF84 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 012288 01DBDF88 00000000 */   nop
/* 01228C 01DBDF8C 000002AE */  sw          $2, 0x0($16)
/* 012290 01DBDF90 03000524 */  addiu       $5, $0, 0x3
/* 012294 01DBDF94 000025AE */  sw          $5, 0x0($17)
/* 012298 01DBDF98 000040AE */  sw          $0, 0x0($18)
/* 01229C 01DBDF9C 000060AE */  sw          $0, 0x0($19)
/* 0122A0 01DBDFA0 C701023C */  lui         $2, %hi(TexManager)
/* 0122A4 01DBDFA4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0122A8 01DBDFA8 7000A627 */  addiu       $6, $29, 0x70
/* 0122AC 01DBDFAC C8CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 0122B0 01DBDFB0 00000000 */   nop
/* 0122B4 01DBDFB4 E001023C */  lui         $2, %hi(MainMonstorUnit + 0x1640)
/* 0122B8 01DBDFB8 109E4424 */  addiu       $4, $2, %lo(MainMonstorUnit + 0x1640)
/* 0122BC 01DBDFBC 948B858F */  lw          $5, -0x746C($28)
/* 0122C0 01DBDFC0 DE01023C */  lui         $2, %hi(LIT_620__4)
/* 0122C4 01DBDFC4 38F14624 */  addiu       $6, $2, %lo(LIT_620__4)
/* 0122C8 01DBDFC8 DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x60)
/* 0122CC 01DBDFCC 60FE4724 */  addiu       $7, $2, %lo(CharaDataBuffer__2 + 0x60)
/* 0122D0 01DBDFD0 28460070 */  paddub      $8, $0, $0
/* 0122D4 01DBDFD4 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 0122D8 01DBDFD8 00000000 */   nop
/* 0122DC 01DBDFDC 9001A427 */  addiu       $4, $29, 0x190
/* 0122E0 01DBDFE0 509F040C */  jal         __ct__10CFrameAttrFv
/* 0122E4 01DBDFE4 00000000 */   nop
/* 0122E8 01DBDFE8 9801A0A3 */  sb          $0, 0x198($29)
/* 0122EC 01DBDFEC E001013C */  lui         $1, %hi(MainMonstorUnit + 0x16FC)
/* 0122F0 01DBDFF0 CC9E248C */  lw          $4, %lo(MainMonstorUnit + 0x16FC)($1)
/* 0122F4 01DBDFF4 9001A527 */  addiu       $5, $29, 0x190
/* 0122F8 01DBDFF8 01000624 */  addiu       $6, $0, 0x1
/* 0122FC 01DBDFFC 04000724 */  addiu       $7, $0, 0x4
/* 012300 01DBE000 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 012304 01DBE004 00000000 */   nop
/* 012308 01DBE008 A040023C */  lui         $2, (0x40A00000 >> 16)
/* 01230C 01DBE00C E001013C */  lui         $1, %hi(MainMonstorUnit + 0x1930)
/* 012310 01DBE010 00A122AC */  sw          $2, %lo(MainMonstorUnit + 0x1930)($1)
/* 012314 01DBE014 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 012318 01DBE018 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x1938)
/* 01231C 01DBE01C 08A122AC */  sw          $2, %lo(MainMonstorUnit + 0x1938)($1)
/* 012320 01DBE020 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x1944)
/* 012324 01DBE024 14A120AC */  sw          $0, %lo(MainMonstorUnit + 0x1944)($1)
/* 012328 01DBE028 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x1948)
/* 01232C 01DBE02C 18A120AC */  sw          $0, %lo(MainMonstorUnit + 0x1948)($1)
/* 012330 01DBE030 948B848F */  lw          $4, -0x746C($28)
/* 012334 01DBE034 DE01023C */  lui         $2, %hi(LIT_491__5)
/* 012338 01DBE038 88EE4524 */  addiu       $5, $2, %lo(LIT_491__5)
/* 01233C 01DBE03C 28360070 */  paddub      $6, $0, $0
/* 012340 01DBE040 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 012344 01DBE044 00000000 */   nop
/* 012348 01DBE048 7000A2AF */  sw          $2, 0x70($29)
/* 01234C 01DBE04C 0E000524 */  addiu       $5, $0, 0xE
/* 012350 01DBE050 000085AE */  sw          $5, 0x0($20)
/* 012354 01DBE054 0000A0AE */  sw          $0, 0x0($21)
/* 012358 01DBE058 000000AE */  sw          $0, 0x0($16)
/* 01235C 01DBE05C C701023C */  lui         $2, %hi(TexManager)
/* 012360 01DBE060 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 012364 01DBE064 7000A627 */  addiu       $6, $29, 0x70
/* 012368 01DBE068 C8CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 01236C 01DBE06C 00000000 */   nop
/* 012370 01DBE070 E001023C */  lui         $2, %hi(MainMonstorUnit + 0x5D00)
/* 012374 01DBE074 D0E44424 */  addiu       $4, $2, %lo(MainMonstorUnit + 0x5D00)
/* 012378 01DBE078 948B858F */  lw          $5, -0x746C($28)
/* 01237C 01DBE07C DE01023C */  lui         $2, %hi(LIT_502__4)
/* 012380 01DBE080 28EF4624 */  addiu       $6, $2, %lo(LIT_502__4)
/* 012384 01DBE084 DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x60)
/* 012388 01DBE088 60FE4724 */  addiu       $7, $2, %lo(CharaDataBuffer__2 + 0x60)
/* 01238C 01DBE08C 28460070 */  paddub      $8, $0, $0
/* 012390 01DBE090 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 012394 01DBE094 00000000 */   nop
/* 012398 01DBE098 F001A427 */  addiu       $4, $29, 0x1F0
/* 01239C 01DBE09C 509F040C */  jal         __ct__10CFrameAttrFv
/* 0123A0 01DBE0A0 00000000 */   nop
/* 0123A4 01DBE0A4 F801A0A3 */  sb          $0, 0x1F8($29)
/* 0123A8 01DBE0A8 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x5DBC)
/* 0123AC 01DBE0AC 8CE5248C */  lw          $4, %lo(MainMonstorUnit + 0x5DBC)($1)
/* 0123B0 01DBE0B0 F001A527 */  addiu       $5, $29, 0x1F0
/* 0123B4 01DBE0B4 01000624 */  addiu       $6, $0, 0x1
/* 0123B8 01DBE0B8 04000724 */  addiu       $7, $0, 0x4
/* 0123BC 01DBE0BC D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 0123C0 01DBE0C0 00000000 */   nop
/* 0123C4 01DBE0C4 A040023C */  lui         $2, (0x40A00000 >> 16)
/* 0123C8 01DBE0C8 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x5FF0)
/* 0123CC 01DBE0CC C0E722AC */  sw          $2, %lo(MainMonstorUnit + 0x5FF0)($1)
/* 0123D0 01DBE0D0 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0123D4 01DBE0D4 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x5FF8)
/* 0123D8 01DBE0D8 C8E722AC */  sw          $2, %lo(MainMonstorUnit + 0x5FF8)($1)
/* 0123DC 01DBE0DC E001013C */  lui         $1, %hi(MainMonstorUnit + 0x6004)
/* 0123E0 01DBE0E0 D4E720AC */  sw          $0, %lo(MainMonstorUnit + 0x6004)($1)
/* 0123E4 01DBE0E4 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x6008)
/* 0123E8 01DBE0E8 D8E720AC */  sw          $0, %lo(MainMonstorUnit + 0x6008)($1)
/* 0123EC 01DBE0EC E001023C */  lui         $2, %hi(MainMonstorUnit + 0xB570)
/* 0123F0 01DBE0F0 403D4424 */  addiu       $4, $2, %lo(MainMonstorUnit + 0xB570)
/* 0123F4 01DBE0F4 948B858F */  lw          $5, -0x746C($28)
/* 0123F8 01DBE0F8 DE01023C */  lui         $2, %hi(LIT_500__5)
/* 0123FC 01DBE0FC 08EF4624 */  addiu       $6, $2, %lo(LIT_500__5)
/* 012400 01DBE100 DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x60)
/* 012404 01DBE104 60FE4724 */  addiu       $7, $2, %lo(CharaDataBuffer__2 + 0x60)
/* 012408 01DBE108 28460070 */  paddub      $8, $0, $0
/* 01240C 01DBE10C FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 012410 01DBE110 00000000 */   nop
/* 012414 01DBE114 5002A427 */  addiu       $4, $29, 0x250
/* 012418 01DBE118 509F040C */  jal         __ct__10CFrameAttrFv
/* 01241C 01DBE11C 00000000 */   nop
/* 012420 01DBE120 5802A0A3 */  sb          $0, 0x258($29)
/* 012424 01DBE124 E001013C */  lui         $1, %hi(MainMonstorUnit + 0xB62C)
/* 012428 01DBE128 FC3D248C */  lw          $4, %lo(MainMonstorUnit + 0xB62C)($1)
/* 01242C 01DBE12C 5002A527 */  addiu       $5, $29, 0x250
/* 012430 01DBE130 01000624 */  addiu       $6, $0, 0x1
/* 012434 01DBE134 04000724 */  addiu       $7, $0, 0x4
/* 012438 01DBE138 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 01243C 01DBE13C 00000000 */   nop
/* 012440 01DBE140 2041023C */  lui         $2, (0x41200000 >> 16)
/* 012444 01DBE144 E001013C */  lui         $1, %hi(MainMonstorUnit + 0xB860)
/* 012448 01DBE148 304022AC */  sw          $2, %lo(MainMonstorUnit + 0xB860)($1)
/* 01244C 01DBE14C 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 012450 01DBE150 E001013C */  lui         $1, %hi(MainMonstorUnit + 0xB868)
/* 012454 01DBE154 384022AC */  sw          $2, %lo(MainMonstorUnit + 0xB868)($1)
/* 012458 01DBE158 E001013C */  lui         $1, %hi(MainMonstorUnit + 0xB874)
/* 01245C 01DBE15C 444020AC */  sw          $0, %lo(MainMonstorUnit + 0xB874)($1)
/* 012460 01DBE160 E001013C */  lui         $1, %hi(MainMonstorUnit + 0xB878)
/* 012464 01DBE164 484020AC */  sw          $0, %lo(MainMonstorUnit + 0xB878)($1)
/* 012468 01DBE168 DF01023C */  lui         $2, %hi(Chara__3 + 0x11B0)
/* 01246C 01DBE16C 90104424 */  addiu       $4, $2, %lo(Chara__3 + 0x11B0)
/* 012470 01DBE170 948B858F */  lw          $5, -0x746C($28)
/* 012474 01DBE174 DE01023C */  lui         $2, %hi(LIT_574__3)
/* 012478 01DBE178 78F04624 */  addiu       $6, $2, %lo(LIT_574__3)
/* 01247C 01DBE17C DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x60)
/* 012480 01DBE180 60FE4724 */  addiu       $7, $2, %lo(CharaDataBuffer__2 + 0x60)
/* 012484 01DBE184 28460070 */  paddub      $8, $0, $0
/* 012488 01DBE188 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 01248C 01DBE18C 00000000 */   nop
/* 012490 01DBE190 B002A427 */  addiu       $4, $29, 0x2B0
/* 012494 01DBE194 509F040C */  jal         __ct__10CFrameAttrFv
/* 012498 01DBE198 00000000 */   nop
/* 01249C 01DBE19C B802A0A3 */  sb          $0, 0x2B8($29)
/* 0124A0 01DBE1A0 DF01013C */  lui         $1, %hi(Chara__3 + 0x126C)
/* 0124A4 01DBE1A4 4C11248C */  lw          $4, %lo(Chara__3 + 0x126C)($1)
/* 0124A8 01DBE1A8 B002A527 */  addiu       $5, $29, 0x2B0
/* 0124AC 01DBE1AC 01000624 */  addiu       $6, $0, 0x1
/* 0124B0 01DBE1B0 04000724 */  addiu       $7, $0, 0x4
/* 0124B4 01DBE1B4 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 0124B8 01DBE1B8 00000000 */   nop
/* 0124BC 01DBE1BC 2041023C */  lui         $2, (0x41200000 >> 16)
/* 0124C0 01DBE1C0 DF01013C */  lui         $1, %hi(Chara__3 + 0x14A0)
/* 0124C4 01DBE1C4 801322AC */  sw          $2, %lo(Chara__3 + 0x14A0)($1)
/* 0124C8 01DBE1C8 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 0124CC 01DBE1CC DF01013C */  lui         $1, %hi(Chara__3 + 0x14A8)
/* 0124D0 01DBE1D0 881322AC */  sw          $2, %lo(Chara__3 + 0x14A8)($1)
/* 0124D4 01DBE1D4 DF01013C */  lui         $1, %hi(Chara__3 + 0x14B4)
/* 0124D8 01DBE1D8 941320AC */  sw          $0, %lo(Chara__3 + 0x14B4)($1)
/* 0124DC 01DBE1DC DF01013C */  lui         $1, %hi(Chara__3 + 0x14B8)
/* 0124E0 01DBE1E0 981320AC */  sw          $0, %lo(Chara__3 + 0x14B8)($1)
/* 0124E4 01DBE1E4 DF01023C */  lui         $2, %hi(Chara__3 + 0x3510)
/* 0124E8 01DBE1E8 F0334424 */  addiu       $4, $2, %lo(Chara__3 + 0x3510)
/* 0124EC 01DBE1EC 948B858F */  lw          $5, -0x746C($28)
/* 0124F0 01DBE1F0 DE01023C */  lui         $2, %hi(LIT_575__5)
/* 0124F4 01DBE1F4 88F04624 */  addiu       $6, $2, %lo(LIT_575__5)
/* 0124F8 01DBE1F8 DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x60)
/* 0124FC 01DBE1FC 60FE4724 */  addiu       $7, $2, %lo(CharaDataBuffer__2 + 0x60)
/* 012500 01DBE200 28460070 */  paddub      $8, $0, $0
/* 012504 01DBE204 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 012508 01DBE208 00000000 */   nop
/* 01250C 01DBE20C 1003A427 */  addiu       $4, $29, 0x310
/* 012510 01DBE210 509F040C */  jal         __ct__10CFrameAttrFv
/* 012514 01DBE214 00000000 */   nop
/* 012518 01DBE218 1803A0A3 */  sb          $0, 0x318($29)
/* 01251C 01DBE21C DF01013C */  lui         $1, %hi(Chara__3 + 0x35CC)
/* 012520 01DBE220 AC34248C */  lw          $4, %lo(Chara__3 + 0x35CC)($1)
/* 012524 01DBE224 1003A527 */  addiu       $5, $29, 0x310
/* 012528 01DBE228 01000624 */  addiu       $6, $0, 0x1
/* 01252C 01DBE22C 04000724 */  addiu       $7, $0, 0x4
/* 012530 01DBE230 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 012534 01DBE234 00000000 */   nop
/* 012538 01DBE238 2041023C */  lui         $2, (0x41200000 >> 16)
/* 01253C 01DBE23C DF01013C */  lui         $1, %hi(DngEventMan + 0x30)
/* 012540 01DBE240 E03622AC */  sw          $2, %lo(DngEventMan + 0x30)($1)
/* 012544 01DBE244 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 012548 01DBE248 DF01013C */  lui         $1, %hi(DngEventMan + 0x38)
/* 01254C 01DBE24C E83622AC */  sw          $2, %lo(DngEventMan + 0x38)($1)
/* 012550 01DBE250 DF01013C */  lui         $1, %hi(DngEventMan + 0x44)
/* 012554 01DBE254 F43620AC */  sw          $0, %lo(DngEventMan + 0x44)($1)
/* 012558 01DBE258 DF01013C */  lui         $1, %hi(DngEventMan + 0x48)
/* 01255C 01DBE25C F83620AC */  sw          $0, %lo(DngEventMan + 0x48)($1)
/* 012560 01DBE260 E301023C */  lui         $2, %hi(Fuusya__2)
/* 012564 01DBE264 70AB4424 */  addiu       $4, $2, %lo(Fuusya__2)
/* 012568 01DBE268 2497050C */  jal         Initialize__13OBJ_ANIME_SEQFv
/* 01256C 01DBE26C 00000000 */   nop
/* 012570 01DBE270 E301013C */  lui         $1, %hi(Fuusya__2 + 0x10)
/* 012574 01DBE274 80AB20AC */  sw          $0, %lo(Fuusya__2 + 0x10)($1)
/* 012578 01DBE278 E301013C */  lui         $1, %hi(Fuusya__2 + 0x14)
/* 01257C 01DBE27C 84AB20AC */  sw          $0, %lo(Fuusya__2 + 0x14)($1)
/* 012580 01DBE280 E301013C */  lui         $1, %hi(Fuusya__2 + 0x28)
/* 012584 01DBE284 98AB20AC */  sw          $0, %lo(Fuusya__2 + 0x28)($1)
/* 012588 01DBE288 E301013C */  lui         $1, %hi(Fuusya__2 + 0x24)
/* 01258C 01DBE28C 94AB20AC */  sw          $0, %lo(Fuusya__2 + 0x24)($1)
/* 012590 01DBE290 E301013C */  lui         $1, %hi(Fuusya__2 + 0x20)
/* 012594 01DBE294 90AB20AC */  sw          $0, %lo(Fuusya__2 + 0x20)($1)
/* 012598 01DBE298 E301013C */  lui         $1, %hi(Fuusya__2 + 0x38)
/* 01259C 01DBE29C A8AB20AC */  sw          $0, %lo(Fuusya__2 + 0x38)($1)
/* 0125A0 01DBE2A0 E301013C */  lui         $1, %hi(Fuusya__2 + 0x34)
/* 0125A4 01DBE2A4 A4AB20AC */  sw          $0, %lo(Fuusya__2 + 0x34)($1)
/* 0125A8 01DBE2A8 E301013C */  lui         $1, %hi(Fuusya__2 + 0x30)
/* 0125AC 01DBE2AC A0AB20AC */  sw          $0, %lo(Fuusya__2 + 0x30)($1)
/* 0125B0 01DBE2B0 E301013C */  lui         $1, %hi(Fuusya__2 + 0x44)
/* 0125B4 01DBE2B4 B4AB20AC */  sw          $0, %lo(Fuusya__2 + 0x44)($1)
/* 0125B8 01DBE2B8 E301013C */  lui         $1, %hi(Fuusya__2 + 0x40)
/* 0125BC 01DBE2BC B0AB20AC */  sw          $0, %lo(Fuusya__2 + 0x40)($1)
/* 0125C0 01DBE2C0 00BF023C */  lui         $2, (0xBF000000 >> 16)
/* 0125C4 01DBE2C4 E301013C */  lui         $1, %hi(Fuusya__2 + 0x48)
/* 0125C8 01DBE2C8 B8AB22AC */  sw          $2, %lo(Fuusya__2 + 0x48)($1)
/* 0125CC 01DBE2CC E301023C */  lui         $2, %hi(Fuusya__2)
/* 0125D0 01DBE2D0 70AB4424 */  addiu       $4, $2, %lo(Fuusya__2)
/* 0125D4 01DBE2D4 DE01023C */  lui         $2, %hi(LIT_504__3)
/* 0125D8 01DBE2D8 50EF4524 */  addiu       $5, $2, %lo(LIT_504__3)
/* 0125DC 01DBE2DC 5A15040C */  jal         strcpy
/* 0125E0 01DBE2E0 00000000 */   nop
/* 0125E4 01DBE2E4 D899848F */  lw          $4, -0x6628($28)
/* 0125E8 01DBE2E8 E301023C */  lui         $2, %hi(Fuusya__2)
/* 0125EC 01DBE2EC 70AB4524 */  addiu       $5, $2, %lo(Fuusya__2)
/* 0125F0 01DBE2F0 4097050C */  jal         InitObjAnime__FP6CFrameP13OBJ_ANIME_SEQ
/* 0125F4 01DBE2F4 00000000 */   nop
/* 0125F8 01DBE2F8 E301023C */  lui         $2, %hi(Fuusya__2 + 0x90)
/* 0125FC 01DBE2FC 00AC4424 */  addiu       $4, $2, %lo(Fuusya__2 + 0x90)
/* 012600 01DBE300 2497050C */  jal         Initialize__13OBJ_ANIME_SEQFv
/* 012604 01DBE304 00000000 */   nop
/* 012608 01DBE308 E301013C */  lui         $1, %hi(Fuusya__2 + 0xA0)
/* 01260C 01DBE30C 10AC20AC */  sw          $0, %lo(Fuusya__2 + 0xA0)($1)
/* 012610 01DBE310 03000224 */  addiu       $2, $0, 0x3
/* 012614 01DBE314 E301013C */  lui         $1, %hi(Fuusya__2 + 0xA4)
/* 012618 01DBE318 14AC22AC */  sw          $2, %lo(Fuusya__2 + 0xA4)($1)
/* 01261C 01DBE31C E301013C */  lui         $1, %hi(Fuusya__2 + 0xB8)
/* 012620 01DBE320 28AC20AC */  sw          $0, %lo(Fuusya__2 + 0xB8)($1)
/* 012624 01DBE324 E301013C */  lui         $1, %hi(Fuusya__2 + 0xB4)
/* 012628 01DBE328 24AC20AC */  sw          $0, %lo(Fuusya__2 + 0xB4)($1)
/* 01262C 01DBE32C E301013C */  lui         $1, %hi(Fuusya__2 + 0xB0)
/* 012630 01DBE330 20AC20AC */  sw          $0, %lo(Fuusya__2 + 0xB0)($1)
/* 012634 01DBE334 E301013C */  lui         $1, %hi(Fuusya__2 + 0xC0)
/* 012638 01DBE338 30AC20AC */  sw          $0, %lo(Fuusya__2 + 0xC0)($1)
/* 01263C 01DBE33C E301013C */  lui         $1, %hi(Fuusya__2 + 0xC4)
/* 012640 01DBE340 34AC20AC */  sw          $0, %lo(Fuusya__2 + 0xC4)($1)
/* 012644 01DBE344 B4C2023C */  lui         $2, (0xC2B40000 >> 16)
/* 012648 01DBE348 E301013C */  lui         $1, %hi(Fuusya__2 + 0xC8)
/* 01264C 01DBE34C 38AC22AC */  sw          $2, %lo(Fuusya__2 + 0xC8)($1)
/* 012650 01DBE350 E301013C */  lui         $1, %hi(Fuusya__2 + 0xD0)
/* 012654 01DBE354 40AC20AC */  sw          $0, %lo(Fuusya__2 + 0xD0)($1)
/* 012658 01DBE358 E301013C */  lui         $1, %hi(Fuusya__2 + 0xD4)
/* 01265C 01DBE35C 44AC20AC */  sw          $0, %lo(Fuusya__2 + 0xD4)($1)
/* 012660 01DBE360 A48380C7 */  lwc1        $f0, -0x7C5C($28)
/* 012664 01DBE364 E301013C */  lui         $1, %hi(Fuusya__2 + 0xD8)
/* 012668 01DBE368 48AC20E4 */  swc1        $f0, %lo(Fuusya__2 + 0xD8)($1)
/* 01266C 01DBE36C E301023C */  lui         $2, %hi(Fuusya__2 + 0x90)
/* 012670 01DBE370 00AC4424 */  addiu       $4, $2, %lo(Fuusya__2 + 0x90)
/* 012674 01DBE374 DE01023C */  lui         $2, %hi(LIT_622__5)
/* 012678 01DBE378 48F14524 */  addiu       $5, $2, %lo(LIT_622__5)
/* 01267C 01DBE37C 5A15040C */  jal         strcpy
/* 012680 01DBE380 00000000 */   nop
/* 012684 01DBE384 DC99848F */  lw          $4, -0x6624($28)
/* 012688 01DBE388 E301023C */  lui         $2, %hi(Fuusya__2 + 0x90)
/* 01268C 01DBE38C 00AC4524 */  addiu       $5, $2, %lo(Fuusya__2 + 0x90)
/* 012690 01DBE390 4097050C */  jal         InitObjAnime__FP6CFrameP13OBJ_ANIME_SEQ
/* 012694 01DBE394 00000000 */   nop
/* 012698 01DBE398 28860070 */  paddub      $16, $0, $0
/* 01269C 01DBE39C 3C000010 */  b           .L01DBE490_2C3C90
/* 0126A0 01DBE3A0 00000000 */   nop
.L01DBE3A4_2C3BA4:
/* 0126A4 01DBE3A4 C0101000 */  sll         $2, $16, 3
/* 0126A8 01DBE3A8 21105000 */  addu        $2, $2, $16
/* 0126AC 01DBE3AC 00890200 */  sll         $17, $2, 4
/* 0126B0 01DBE3B0 E301023C */  lui         $2, %hi(Taimatsu__2)
/* 0126B4 01DBE3B4 F0AC4224 */  addiu       $2, $2, %lo(Taimatsu__2)
/* 0126B8 01DBE3B8 21905100 */  addu        $18, $2, $17
/* 0126BC 01DBE3BC 28264072 */  paddub      $4, $18, $0
/* 0126C0 01DBE3C0 2497050C */  jal         Initialize__13OBJ_ANIME_SEQFv
/* 0126C4 01DBE3C4 00000000 */   nop
/* 0126C8 01DBE3C8 03000324 */  addiu       $3, $0, 0x3
/* 0126CC 01DBE3CC E301023C */  lui         $2, %hi(Taimatsu__2 + 0x10)
/* 0126D0 01DBE3D0 00AD4224 */  addiu       $2, $2, %lo(Taimatsu__2 + 0x10)
/* 0126D4 01DBE3D4 21105100 */  addu        $2, $2, $17
/* 0126D8 01DBE3D8 000043AC */  sw          $3, 0x0($2)
/* 0126DC 01DBE3DC 04000324 */  addiu       $3, $0, 0x4
/* 0126E0 01DBE3E0 E301023C */  lui         $2, %hi(Taimatsu__2 + 0x14)
/* 0126E4 01DBE3E4 04AD4224 */  addiu       $2, $2, %lo(Taimatsu__2 + 0x14)
/* 0126E8 01DBE3E8 21105100 */  addu        $2, $2, $17
/* 0126EC 01DBE3EC 000043AC */  sw          $3, 0x0($2)
/* 0126F0 01DBE3F0 A042033C */  lui         $3, (0x42A00000 >> 16)
/* 0126F4 01DBE3F4 E301023C */  lui         $2, %hi(Taimatsu__2 + 0x28)
/* 0126F8 01DBE3F8 18AD4224 */  addiu       $2, $2, %lo(Taimatsu__2 + 0x28)
/* 0126FC 01DBE3FC 21105100 */  addu        $2, $2, $17
/* 012700 01DBE400 000043AC */  sw          $3, 0x0($2)
/* 012704 01DBE404 E301023C */  lui         $2, %hi(Taimatsu__2 + 0x24)
/* 012708 01DBE408 14AD4224 */  addiu       $2, $2, %lo(Taimatsu__2 + 0x24)
/* 01270C 01DBE40C 21105100 */  addu        $2, $2, $17
/* 012710 01DBE410 000043AC */  sw          $3, 0x0($2)
/* 012714 01DBE414 E301023C */  lui         $2, %hi(Taimatsu__2 + 0x20)
/* 012718 01DBE418 10AD4224 */  addiu       $2, $2, %lo(Taimatsu__2 + 0x20)
/* 01271C 01DBE41C 21105100 */  addu        $2, $2, $17
/* 012720 01DBE420 000043AC */  sw          $3, 0x0($2)
/* 012724 01DBE424 0043033C */  lui         $3, (0x43000000 >> 16)
/* 012728 01DBE428 E301023C */  lui         $2, %hi(Taimatsu__2 + 0x38)
/* 01272C 01DBE42C 28AD4224 */  addiu       $2, $2, %lo(Taimatsu__2 + 0x38)
/* 012730 01DBE430 21105100 */  addu        $2, $2, $17
/* 012734 01DBE434 000043AC */  sw          $3, 0x0($2)
/* 012738 01DBE438 E301023C */  lui         $2, %hi(Taimatsu__2 + 0x34)
/* 01273C 01DBE43C 24AD4224 */  addiu       $2, $2, %lo(Taimatsu__2 + 0x34)
/* 012740 01DBE440 21105100 */  addu        $2, $2, $17
/* 012744 01DBE444 000043AC */  sw          $3, 0x0($2)
/* 012748 01DBE448 E301023C */  lui         $2, %hi(Taimatsu__2 + 0x30)
/* 01274C 01DBE44C 20AD4224 */  addiu       $2, $2, %lo(Taimatsu__2 + 0x30)
/* 012750 01DBE450 21105100 */  addu        $2, $2, $17
/* 012754 01DBE454 000043AC */  sw          $3, 0x0($2)
/* 012758 01DBE458 28264072 */  paddub      $4, $18, $0
/* 01275C 01DBE45C DE01023C */  lui         $2, %hi(LIT_505__6)
/* 012760 01DBE460 58EF4524 */  addiu       $5, $2, %lo(LIT_505__6)
/* 012764 01DBE464 5A15040C */  jal         strcpy
/* 012768 01DBE468 00000000 */   nop
/* 01276C 01DBE46C 80181000 */  sll         $3, $16, 2
/* 012770 01DBE470 E301023C */  lui         $2, %hi(TaimatsuFrame__2)
/* 012774 01DBE474 C0AC4224 */  addiu       $2, $2, %lo(TaimatsuFrame__2)
/* 012778 01DBE478 21104300 */  addu        $2, $2, $3
/* 01277C 01DBE47C 0000448C */  lw          $4, 0x0($2)
/* 012780 01DBE480 282E4072 */  paddub      $5, $18, $0
/* 012784 01DBE484 4097050C */  jal         InitObjAnime__FP6CFrameP13OBJ_ANIME_SEQ
/* 012788 01DBE488 00000000 */   nop
/* 01278C 01DBE48C 01001026 */  addiu       $16, $16, 0x1
.L01DBE490_2C3C90:
/* 012790 01DBE490 0500022A */  slti        $2, $16, 0x5
/* 012794 01DBE494 C3FF4014 */  bnez        $2, .L01DBE3A4_2C3BA4
/* 012798 01DBE498 00000000 */   nop
/* 01279C 01DBE49C E301023C */  lui         $2, %hi(Taimatsu__2 + 0x480)
/* 0127A0 01DBE4A0 70B14424 */  addiu       $4, $2, %lo(Taimatsu__2 + 0x480)
/* 0127A4 01DBE4A4 2497050C */  jal         Initialize__13OBJ_ANIME_SEQFv
/* 0127A8 01DBE4A8 00000000 */   nop
/* 0127AC 01DBE4AC 03000224 */  addiu       $2, $0, 0x3
/* 0127B0 01DBE4B0 E301013C */  lui         $1, %hi(Taimatsu__2 + 0x490)
/* 0127B4 01DBE4B4 80B122AC */  sw          $2, %lo(Taimatsu__2 + 0x490)($1)
/* 0127B8 01DBE4B8 04000224 */  addiu       $2, $0, 0x4
/* 0127BC 01DBE4BC E301013C */  lui         $1, %hi(Taimatsu__2 + 0x494)
/* 0127C0 01DBE4C0 84B122AC */  sw          $2, %lo(Taimatsu__2 + 0x494)($1)
/* 0127C4 01DBE4C4 DC42023C */  lui         $2, (0x42DC0000 >> 16)
/* 0127C8 01DBE4C8 E301013C */  lui         $1, %hi(Taimatsu__2 + 0x4A0)
/* 0127CC 01DBE4CC 90B122AC */  sw          $2, %lo(Taimatsu__2 + 0x4A0)($1)
/* 0127D0 01DBE4D0 F042023C */  lui         $2, (0x42F00000 >> 16)
/* 0127D4 01DBE4D4 E301013C */  lui         $1, %hi(Taimatsu__2 + 0x4A8)
/* 0127D8 01DBE4D8 98B122AC */  sw          $2, %lo(Taimatsu__2 + 0x4A8)($1)
/* 0127DC 01DBE4DC E301013C */  lui         $1, %hi(Taimatsu__2 + 0x4A4)
/* 0127E0 01DBE4E0 94B122AC */  sw          $2, %lo(Taimatsu__2 + 0x4A4)($1)
/* 0127E4 01DBE4E4 0043023C */  lui         $2, (0x43000000 >> 16)
/* 0127E8 01DBE4E8 E301013C */  lui         $1, %hi(Taimatsu__2 + 0x4B0)
/* 0127EC 01DBE4EC A0B122AC */  sw          $2, %lo(Taimatsu__2 + 0x4B0)($1)
/* 0127F0 01DBE4F0 FA42023C */  lui         $2, (0x42FA0000 >> 16)
/* 0127F4 01DBE4F4 E301013C */  lui         $1, %hi(Taimatsu__2 + 0x4B8)
/* 0127F8 01DBE4F8 A8B122AC */  sw          $2, %lo(Taimatsu__2 + 0x4B8)($1)
/* 0127FC 01DBE4FC E301013C */  lui         $1, %hi(Taimatsu__2 + 0x4B4)
/* 012800 01DBE500 A4B122AC */  sw          $2, %lo(Taimatsu__2 + 0x4B4)($1)
/* 012804 01DBE504 E301023C */  lui         $2, %hi(Taimatsu__2 + 0x480)
/* 012808 01DBE508 70B14424 */  addiu       $4, $2, %lo(Taimatsu__2 + 0x480)
/* 01280C 01DBE50C DE01023C */  lui         $2, %hi(LIT_506__5)
/* 012810 01DBE510 60EF4524 */  addiu       $5, $2, %lo(LIT_506__5)
/* 012814 01DBE514 5A15040C */  jal         strcpy
/* 012818 01DBE518 00000000 */   nop
/* 01281C 01DBE51C E301013C */  lui         $1, %hi(TaimatsuFrame__2 + 0x20)
/* 012820 01DBE520 E0AC248C */  lw          $4, %lo(TaimatsuFrame__2 + 0x20)($1)
/* 012824 01DBE524 E301023C */  lui         $2, %hi(Taimatsu__2 + 0x480)
/* 012828 01DBE528 70B14524 */  addiu       $5, $2, %lo(Taimatsu__2 + 0x480)
/* 01282C 01DBE52C 4097050C */  jal         InitObjAnime__FP6CFrameP13OBJ_ANIME_SEQ
/* 012830 01DBE530 00000000 */   nop
/* 012834 01DBE534 DF01023C */  lui         $2, %hi(CharaDataBuffer__2)
/* 012838 01DBE538 00FE4424 */  addiu       $4, $2, %lo(CharaDataBuffer__2)
/* 01283C 01DBE53C 00320524 */  addiu       $5, $0, 0x3200
/* 012840 01DBE540 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 012844 01DBE544 00000000 */   nop
/* 012848 01DBE548 E09982AF */  sw          $2, -0x6620($28)
/* 01284C 01DBE54C E8998427 */  addiu       $4, $28, -0x6618
/* 012850 01DBE550 E099858F */  lw          $5, -0x6620($28)
/* 012854 01DBE554 32000624 */  addiu       $6, $0, 0x32
/* 012858 01DBE558 C892050C */  jal         Initialize__12CEffectGroupFP7CEffecti
/* 01285C 01DBE55C 00000000 */   nop
/* 012860 01DBE560 E8998427 */  addiu       $4, $28, -0x6618
/* 012864 01DBE564 B092050C */  jal         Clear__12CEffectGroupFv
/* 012868 01DBE568 00000000 */   nop
/* 01286C 01DBE56C DE01013C */  lui         $1, %hi(CScript__2 + 0x20)
/* 012870 01DBE570 201B20AC */  sw          $0, %lo(CScript__2 + 0x20)($1)
/* 012874 01DBE574 6000BF7B */  lq          $31, 0x60($29)
/* 012878 01DBE578 5000B57B */  lq          $21, 0x50($29)
/* 01287C 01DBE57C 4000B47B */  lq          $20, 0x40($29)
/* 012880 01DBE580 3000B37B */  lq          $19, 0x30($29)
/* 012884 01DBE584 2000B27B */  lq          $18, 0x20($29)
/* 012888 01DBE588 1000B17B */  lq          $17, 0x10($29)
/* 01288C 01DBE58C 0000B07B */  lq          $16, 0x0($29)
/* 012890 01DBE590 7003BD27 */  addiu       $29, $29, 0x370
/* 012894 01DBE594 0800E003 */  jr          $31
/* 012898 01DBE598 00000000 */   nop
/* 01289C 01DBE59C 00000000 */  nop
