.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel OpeningInit__Fv
/* 0034C0 01DAF1C0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0034C4 01DAF1C4 0000BF7F */  sq          $31, 0x0($29)
/* 0034C8 01DAF1C8 DC4F050C */  jal         wait_now_loading_vsync__Fv
/* 0034CC 01DAF1CC 00000000 */   nop
/* 0034D0 01DAF1D0 6496040C */  jal         InitializeDataBuffer__Fv
/* 0034D4 01DAF1D4 00000000 */   nop
/* 0034D8 01DAF1D8 2B00023C */  lui         $2, %hi(VisualData)
/* 0034DC 01DAF1DC 10B04424 */  addiu       $4, $2, %lo(VisualData)
/* 0034E0 01DAF1E0 4C1D0524 */  addiu       $5, $0, 0x1D4C
/* 0034E4 01DAF1E4 A496040C */  jal         SetDataBuffer__FP14CDataAlloc2_1_i
/* 0034E8 01DAF1E8 00000000 */   nop
/* 0034EC 01DAF1EC 2B00023C */  lui         $2, %hi(VisualData)
/* 0034F0 01DAF1F0 10B04424 */  addiu       $4, $2, %lo(VisualData)
/* 0034F4 01DAF1F4 D8100524 */  addiu       $5, $0, 0x10D8
/* 0034F8 01DAF1F8 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 0034FC 01DAF1FC 00000000 */   nop
/* 003500 01DAF200 F89782AF */  sw          $2, -0x6808($28)
/* 003504 01DAF204 DF01023C */  lui         $2, %hi(CharaDataBuffer__2)
/* 003508 01DAF208 00FE4424 */  addiu       $4, $2, %lo(CharaDataBuffer__2)
/* 00350C 01DAF20C 0300023C */  lui         $2, (0x3DC48 >> 16)
/* 003510 01DAF210 48DC4534 */  ori         $5, $2, (0x3DC48 & 0xFFFF)
/* 003514 01DAF214 A496040C */  jal         SetDataBuffer__FP14CDataAlloc2_1_i
/* 003518 01DAF218 00000000 */   nop
/* 00351C 01DAF21C DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x40)
/* 003520 01DAF220 40FE4424 */  addiu       $4, $2, %lo(CharaDataBuffer__2 + 0x40)
/* 003524 01DAF224 E8FD0534 */  ori         $5, $0, 0xFDE8
/* 003528 01DAF228 A496040C */  jal         SetDataBuffer__FP14CDataAlloc2_1_i
/* 00352C 01DAF22C 00000000 */   nop
/* 003530 01DAF230 DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x60)
/* 003534 01DAF234 60FE4424 */  addiu       $4, $2, %lo(CharaDataBuffer__2 + 0x60)
/* 003538 01DAF238 0400023C */  lui         $2, (0x4FD58 >> 16)
/* 00353C 01DAF23C 58FD4534 */  ori         $5, $2, (0x4FD58 & 0xFFFF)
/* 003540 01DAF240 A496040C */  jal         SetDataBuffer__FP14CDataAlloc2_1_i
/* 003544 01DAF244 00000000 */   nop
/* 003548 01DAF248 DF01023C */  lui         $2, %hi(PassDataBuffer)
/* 00354C 01DAF24C 80FE4424 */  addiu       $4, $2, %lo(PassDataBuffer)
/* 003550 01DAF250 983A0524 */  addiu       $5, $0, 0x3A98
/* 003554 01DAF254 A496040C */  jal         SetDataBuffer__FP14CDataAlloc2_1_i
/* 003558 01DAF258 00000000 */   nop
/* 00355C 01DAF25C DF01023C */  lui         $2, %hi(PassDataBuffer + 0x10)
/* 003560 01DAF260 90FE4424 */  addiu       $4, $2, %lo(PassDataBuffer + 0x10)
/* 003564 01DAF264 983A0524 */  addiu       $5, $0, 0x3A98
/* 003568 01DAF268 A496040C */  jal         SetDataBuffer__FP14CDataAlloc2_1_i
/* 00356C 01DAF26C 00000000 */   nop
/* 003570 01DAF270 DF01023C */  lui         $2, %hi(PassDataBuffer + 0x20)
/* 003574 01DAF274 A0FE4424 */  addiu       $4, $2, %lo(PassDataBuffer + 0x20)
/* 003578 01DAF278 983A0524 */  addiu       $5, $0, 0x3A98
/* 00357C 01DAF27C A496040C */  jal         SetDataBuffer__FP14CDataAlloc2_1_i
/* 003580 01DAF280 00000000 */   nop
/* 003584 01DAF284 DF01023C */  lui         $2, %hi(testBuffer)
/* 003588 01DAF288 D0FE4424 */  addiu       $4, $2, %lo(testBuffer)
/* 00358C 01DAF28C 983A0524 */  addiu       $5, $0, 0x3A98
/* 003590 01DAF290 A496040C */  jal         SetDataBuffer__FP14CDataAlloc2_1_i
/* 003594 01DAF294 00000000 */   nop
/* 003598 01DAF298 DF01023C */  lui         $2, %hi(testBuffer)
/* 00359C 01DAF29C D0FE4424 */  addiu       $4, $2, %lo(testBuffer)
/* 0035A0 01DAF2A0 983A0524 */  addiu       $5, $0, 0x3A98
/* 0035A4 01DAF2A4 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 0035A8 01DAF2A8 00000000 */   nop
/* 0035AC 01DAF2AC F49782AF */  sw          $2, -0x680C($28)
/* 0035B0 01DAF2B0 DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 0035B4 01DAF2B4 B0FE4424 */  addiu       $4, $2, %lo(MapDataBuffer)
/* 0035B8 01DAF2B8 0200023C */  lui         $2, (0x26F0C >> 16)
/* 0035BC 01DAF2BC 0C6F4534 */  ori         $5, $2, (0x26F0C & 0xFFFF)
/* 0035C0 01DAF2C0 A496040C */  jal         SetDataBuffer__FP14CDataAlloc2_1_i
/* 0035C4 01DAF2C4 00000000 */   nop
/* 0035C8 01DAF2C8 DF01023C */  lui         $2, %hi(WaterBuffer__2)
/* 0035CC 01DAF2CC C0FE4424 */  addiu       $4, $2, %lo(WaterBuffer__2)
/* 0035D0 01DAF2D0 30750524 */  addiu       $5, $0, 0x7530
/* 0035D4 01DAF2D4 A496040C */  jal         SetDataBuffer__FP14CDataAlloc2_1_i
/* 0035D8 01DAF2D8 00000000 */   nop
/* 0035DC 01DAF2DC 2B00023C */  lui         $2, %hi(TextureData)
/* 0035E0 01DAF2E0 30B04424 */  addiu       $4, $2, %lo(TextureData)
/* 0035E4 01DAF2E4 0500023C */  lui         $2, (0x56AB8 >> 16)
/* 0035E8 01DAF2E8 B86A4534 */  ori         $5, $2, (0x56AB8 & 0xFFFF)
/* 0035EC 01DAF2EC A496040C */  jal         SetDataBuffer__FP14CDataAlloc2_1_i
/* 0035F0 01DAF2F0 00000000 */   nop
/* 0035F4 01DAF2F4 409C0434 */  ori         $4, $0, 0x9C40
/* 0035F8 01DAF2F8 0400023C */  lui         $2, (0x42A68 >> 16)
/* 0035FC 01DAF2FC 682A4534 */  ori         $5, $2, (0x42A68 & 0xFFFF)
/* 003600 01DAF300 B896040C */  jal         SetPacketReadBuffer__Fii
/* 003604 01DAF304 00000000 */   nop
/* 003608 01DAF308 00608044 */  mtc1        $0, $f12
/* 00360C 01DAF30C 00000000 */  nop
/* 003610 01DAF310 46630046 */  mov.s       $f13, $f12
/* 003614 01DAF314 86630046 */  mov.s       $f14, $f12
/* 003618 01DAF318 E101023C */  lui         $2, %hi(OP_MainCamera)
/* 00361C 01DAF31C E0954424 */  addiu       $4, $2, %lo(OP_MainCamera)
/* 003620 01DAF320 282E0070 */  paddub      $5, $0, $0
/* 003624 01DAF324 BC90040C */  jal         SetRef__7CCameraFP6CFramefff
/* 003628 01DAF328 00000000 */   nop
/* 00362C 01DAF32C 00688044 */  mtc1        $0, $f13
/* 003630 01DAF330 00000000 */  nop
/* 003634 01DAF334 066B0046 */  mov.s       $f12, $f13
/* 003638 01DAF338 866B0046 */  mov.s       $f14, $f13
/* 00363C 01DAF33C E101023C */  lui         $2, %hi(OP_MainCamera)
/* 003640 01DAF340 E0954424 */  addiu       $4, $2, %lo(OP_MainCamera)
/* 003644 01DAF344 282E0070 */  paddub      $5, $0, $0
/* 003648 01DAF348 9890040C */  jal         SetPos__7CCameraFP6CFramefff
/* 00364C 01DAF34C 00000000 */   nop
/* 003650 01DAF350 A042023C */  lui         $2, (0x42A00000 >> 16)
/* 003654 01DAF354 00608244 */  mtc1        $2, $f12
/* 003658 01DAF358 E101023C */  lui         $2, %hi(OP_MainCamera)
/* 00365C 01DAF35C E0954424 */  addiu       $4, $2, %lo(OP_MainCamera)
/* 003660 01DAF360 DC92040C */  jal         SetDistance__13CCameraFollowFf
/* 003664 01DAF364 00000000 */   nop
/* 003668 01DAF368 00608044 */  mtc1        $0, $f12
/* 00366C 01DAF36C E101023C */  lui         $2, %hi(OP_MainCamera)
/* 003670 01DAF370 E0954424 */  addiu       $4, $2, %lo(OP_MainCamera)
/* 003674 01DAF374 EC92040C */  jal         SetHeight__13CCameraFollowFf
/* 003678 01DAF378 00000000 */   nop
/* 00367C 01DAF37C 00608044 */  mtc1        $0, $f12
/* 003680 01DAF380 00000000 */  nop
/* 003684 01DAF384 86630046 */  mov.s       $f14, $f12
/* 003688 01DAF388 46630046 */  mov.s       $f13, $f12
/* 00368C 01DAF38C E101023C */  lui         $2, %hi(OP_MainCamera)
/* 003690 01DAF390 E0954424 */  addiu       $4, $2, %lo(OP_MainCamera)
/* 003694 01DAF394 B892040C */  jal         SetFollow__13CCameraFollowFfff
/* 003698 01DAF398 00000000 */   nop
/* 00369C 01DAF39C E101023C */  lui         $2, %hi(OP_MainCamera)
/* 0036A0 01DAF3A0 E0954424 */  addiu       $4, $2, %lo(OP_MainCamera)
/* 0036A4 01DAF3A4 282E0070 */  paddub      $5, $0, $0
/* 0036A8 01DAF3A8 F491040C */  jal         Step__13CCameraFollowFi
/* 0036AC 01DAF3AC 00000000 */   nop
/* 0036B0 01DAF3B0 00608044 */  mtc1        $0, $f12
/* 0036B4 01DAF3B4 E101023C */  lui         $2, %hi(OP_MainCamera)
/* 0036B8 01DAF3B8 E0954424 */  addiu       $4, $2, %lo(OP_MainCamera)
/* 0036BC 01DAF3BC 9491040C */  jal         SetSpeed__7CCameraFf
/* 0036C0 01DAF3C0 00000000 */   nop
/* 0036C4 01DAF3C4 4844023C */  lui         $2, (0x44480000 >> 16)
/* 0036C8 01DAF3C8 00608244 */  mtc1        $2, $f12
/* 0036CC 01DAF3CC C040023C */  lui         $2, (0x40C00000 >> 16)
/* 0036D0 01DAF3D0 00688244 */  mtc1        $2, $f13
/* 0036D4 01DAF3D4 FFFF0234 */  ori         $2, $0, 0xFFFF
/* 0036D8 01DAF3D8 00008244 */  mtc1        $2, $f0
/* 0036DC 01DAF3DC 00000000 */  nop
/* 0036E0 01DAF3E0 A0038046 */  cvt.s.w     $f14, $f0
/* 0036E4 01DAF3E4 B8B5040C */  jal         MGSetRenderInfo__Ffff
/* 0036E8 01DAF3E8 00000000 */   nop
/* 0036EC 01DAF3EC DC4F050C */  jal         wait_now_loading_vsync__Fv
/* 0036F0 01DAF3F0 00000000 */   nop
/* 0036F4 01DAF3F4 DE01023C */  lui         $2, %hi(CScript__2)
/* 0036F8 01DAF3F8 001B4424 */  addiu       $4, $2, %lo(CScript__2)
/* 0036FC 01DAF3FC DE01023C */  lui         $2, %hi(LIT_365__5)
/* 003700 01DAF400 90BF4524 */  addiu       $5, $2, %lo(LIT_365__5)
/* 003704 01DAF404 60AF760C */  jal         LoadBaseTexture__Fv
/* 003708 01DAF408 00000000 */   nop
/* 00370C 01DAF40C DC4F050C */  jal         wait_now_loading_vsync__Fv
/* 003710 01DAF410 00000000 */   nop
/* 003714 01DAF414 30BD760C */  jal         LoadMessage__Fv
/* 003718 01DAF418 00000000 */   nop
/* 00371C 01DAF41C DC4F050C */  jal         wait_now_loading_vsync__Fv
/* 003720 01DAF420 00000000 */   nop
/* 003724 01DAF424 B0BD760C */  jal         LoadScene__Fv
/* 003728 01DAF428 00000000 */   nop
/* 00372C 01DAF42C DC4F050C */  jal         wait_now_loading_vsync__Fv
/* 003730 01DAF430 00000000 */   nop
/* 003734 01DAF434 B0D3760C */  jal         OpA_InitProcess__Fv
/* 003738 01DAF438 00000000 */   nop
/* 00373C 01DAF43C 0C9880AF */  sw          $0, -0x67F4($28)
/* 003740 01DAF440 049880AF */  sw          $0, -0x67FC($28)
/* 003744 01DAF444 109880AF */  sw          $0, -0x67F0($28)
/* 003748 01DAF448 03000224 */  addiu       $2, $0, 0x3
/* 00374C 01DAF44C 149882AF */  sw          $2, -0x67EC($28)
/* 003750 01DAF450 02000224 */  addiu       $2, $0, 0x2
/* 003754 01DAF454 189882AF */  sw          $2, -0x67E8($28)
/* 003758 01DAF458 1C9880AF */  sw          $0, -0x67E4($28)
/* 00375C 01DAF45C 089880AF */  sw          $0, -0x67F8($28)
/* 003760 01DAF460 249880A3 */  sb          $0, -0x67DC($28)
/* 003764 01DAF464 289880AF */  sw          $0, -0x67D8($28)
/* 003768 01DAF468 2C9880AF */  sw          $0, -0x67D4($28)
/* 00376C 01DAF46C 349880AF */  sw          $0, -0x67CC($28)
/* 003770 01DAF470 7F000224 */  addiu       $2, $0, 0x7F
/* 003774 01DAF474 309882AF */  sw          $2, -0x67D0($28)
/* 003778 01DAF478 0043023C */  lui         $2, (0x43000000 >> 16)
/* 00377C 01DAF47C 00608244 */  mtc1        $2, $f12
/* 003780 01DAF480 E101023C */  lui         $2, %hi(DispFade)
/* 003784 01DAF484 B0E54424 */  addiu       $4, $2, %lo(DispFade)
/* 003788 01DAF488 88B4760C */  jal         FadeInit__9CDispFadeFf
/* 00378C 01DAF48C 00000000 */   nop
/* 003790 01DAF490 0043023C */  lui         $2, (0x43000000 >> 16)
/* 003794 01DAF494 00608244 */  mtc1        $2, $f12
/* 003798 01DAF498 E101023C */  lui         $2, %hi(DispFade)
/* 00379C 01DAF49C B0E54424 */  addiu       $4, $2, %lo(DispFade)
/* 0037A0 01DAF4A0 282E0070 */  paddub      $5, $0, $0
/* 0037A4 01DAF4A4 78B4760C */  jal         FadeOutStart__9CDispFadeFfi
/* 0037A8 01DAF4A8 00000000 */   nop
/* 0037AC 01DAF4AC 0000BF7B */  lq          $31, 0x0($29)
/* 0037B0 01DAF4B0 1000BD27 */  addiu       $29, $29, 0x10
/* 0037B4 01DAF4B4 0800E003 */  jr          $31
/* 0037B8 01DAF4B8 00000000 */   nop
/* 0037BC 01DAF4BC 00000000 */  nop
