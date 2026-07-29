.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel WaterProcess__Fv
/* 0175A0 01DC32A0 A0FFBD27 */  addiu       $29, $29, -0x60
/* 0175A4 01DC32A4 1000BF7F */  sq          $31, 0x10($29)
/* 0175A8 01DC32A8 0000B07F */  sq          $16, 0x0($29)
/* 0175AC 01DC32AC 200E770C */  jal         setTexScroll__Fv__2
/* 0175B0 01DC32B0 00000000 */   nop
/* 0175B4 01DC32B4 B40E770C */  jal         setTexAnim__Fv__2
/* 0175B8 01DC32B8 00000000 */   nop
/* 0175BC 01DC32BC 4800A427 */  addiu       $4, $29, 0x48
/* 0175C0 01DC32C0 4CBC040C */  jal         MGGetFBuffTex__FP9sceGsTex0
/* 0175C4 01DC32C4 00000000 */   nop
/* 0175C8 01DC32C8 2000A0AF */  sw          $0, 0x20($29)
/* 0175CC 01DC32CC 2400A0AF */  sw          $0, 0x24($29)
/* 0175D0 01DC32D0 80020224 */  addiu       $2, $0, 0x280
/* 0175D4 01DC32D4 2800A2AF */  sw          $2, 0x28($29)
/* 0175D8 01DC32D8 E0000224 */  addiu       $2, $0, 0xE0
/* 0175DC 01DC32DC 2C00A2AF */  sw          $2, 0x2C($29)
/* 0175E0 01DC32E0 C701023C */  lui         $2, %hi(TexManager)
/* 0175E4 01DC32E4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0175E8 01DC32E8 DE01023C */  lui         $2, %hi(LIT_1793)
/* 0175EC 01DC32EC C8F94524 */  addiu       $5, $2, %lo(LIT_1793)
/* 0175F0 01DC32F0 FFFF0624 */  addiu       $6, $0, -0x1
/* 0175F4 01DC32F4 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0175F8 01DC32F8 00000000 */   nop
/* 0175FC 01DC32FC 5000A627 */  addiu       $6, $29, 0x50
/* 017600 01DC3300 280042DC */  ld          $2, 0x28($2)
/* 017604 01DC3304 0000C2FC */  sd          $2, 0x0($6)
/* 017608 01DC3308 4800A427 */  addiu       $4, $29, 0x48
/* 01760C 01DC330C 2000A527 */  addiu       $5, $29, 0x20
/* 017610 01DC3310 283E0070 */  paddub      $7, $0, $0
/* 017614 01DC3314 28460070 */  paddub      $8, $0, $0
/* 017618 01DC3318 284E0070 */  paddub      $9, $0, $0
/* 01761C 01DC331C 84BC040C */  jal         MGMoveImage__FP9sceGsTex0RC8CRect_i_P9sceGsTex0iii
/* 017620 01DC3320 00000000 */   nop
/* 017624 01DC3324 E101023C */  lui         $2, %hi(OP_MainCamera)
/* 017628 01DC3328 E0954424 */  addiu       $4, $2, %lo(OP_MainCamera)
/* 01762C 01DC332C 3000A527 */  addiu       $5, $29, 0x30
/* 017630 01DC3330 A891040C */  jal         GetRef__7CCameraFPf
/* 017634 01DC3334 00000000 */   nop
/* 017638 01DC3338 50C1023C */  lui         $2, (0xC1500000 >> 16)
/* 01763C 01DC333C 3400A2AF */  sw          $2, 0x34($29)
/* 017640 01DC3340 E301023C */  lui         $2, %hi(Water + 0xB0)
/* 017644 01DC3344 60B44424 */  addiu       $4, $2, %lo(Water + 0xB0)
/* 017648 01DC3348 3000A527 */  addiu       $5, $29, 0x30
/* 01764C 01DC334C B89F040C */  jal         SetPosition__6CFrameFPf
/* 017650 01DC3350 00000000 */   nop
/* 017654 01DC3354 5800A427 */  addiu       $4, $29, 0x58
/* 017658 01DC3358 F08B82DF */  ld          $2, -0x7410($28)
/* 01765C 01DC335C 000082FC */  sd          $2, 0x0($4)
/* 017660 01DC3360 5C00A593 */  lbu         $5, 0x5C($29)
/* 017664 01DC3364 01000364 */  daddiu      $3, $0, 0x1
/* 017668 01DC3368 FEFF0224 */  addiu       $2, $0, -0x2
/* 01766C 01DC336C 2410A200 */  and         $2, $5, $2
/* 017670 01DC3370 25104300 */  or          $2, $2, $3
/* 017674 01DC3374 5C00A2A3 */  sb          $2, 0x5C($29)
/* 017678 01DC3378 B0BB040C */  jal         MGSetGsZBUF__FP9sceGsZbuf
/* 01767C 01DC337C 00000000 */   nop
/* 017680 01DC3380 BE11040C */  jal         rand
/* 017684 01DC3384 00000000 */   nop
/* 017688 01DC3388 00008244 */  mtc1        $2, $f0
/* 01768C 01DC338C 00000000 */  nop
/* 017690 01DC3390 60008046 */  cvt.s.w     $f1, $f0
/* 017694 01DC3394 0042023C */  lui         $2, (0x42000000 >> 16)
/* 017698 01DC3398 00008244 */  mtc1        $2, $f0
/* 01769C 01DC339C 00000000 */  nop
/* 0176A0 01DC33A0 42000146 */  mul.s       $f1, $f0, $f1
/* 0176A4 01DC33A4 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 0176A8 01DC33A8 00008244 */  mtc1        $2, $f0
/* 0176AC 01DC33AC 00000000 */  nop
/* 0176B0 01DC33B0 030B0046 */  div.s       $f12, $f1, $f0
/* 0176B4 01DC33B4 2C44040C */  jal         fptosi
/* 0176B8 01DC33B8 00000000 */   nop
/* 0176BC 01DC33BC 28864070 */  paddub      $16, $2, $0
/* 0176C0 01DC33C0 BE11040C */  jal         rand
/* 0176C4 01DC33C4 00000000 */   nop
/* 0176C8 01DC33C8 00008244 */  mtc1        $2, $f0
/* 0176CC 01DC33CC 00000000 */  nop
/* 0176D0 01DC33D0 60008046 */  cvt.s.w     $f1, $f0
/* 0176D4 01DC33D4 0042023C */  lui         $2, (0x42000000 >> 16)
/* 0176D8 01DC33D8 00008244 */  mtc1        $2, $f0
/* 0176DC 01DC33DC 00000000 */  nop
/* 0176E0 01DC33E0 42000146 */  mul.s       $f1, $f0, $f1
/* 0176E4 01DC33E4 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 0176E8 01DC33E8 00008244 */  mtc1        $2, $f0
/* 0176EC 01DC33EC 00000000 */  nop
/* 0176F0 01DC33F0 030B0046 */  div.s       $f12, $f1, $f0
/* 0176F4 01DC33F4 2C44040C */  jal         fptosi
/* 0176F8 01DC33F8 00000000 */   nop
/* 0176FC 01DC33FC 00BF033C */  lui         $3, (0xBF000000 >> 16)
/* 017700 01DC3400 00608344 */  mtc1        $3, $f12
/* 017704 01DC3404 E301033C */  lui         $3, %hi(Water)
/* 017708 01DC3408 B0B36424 */  addiu       $4, $3, %lo(Water)
/* 01770C 01DC340C 282E0072 */  paddub      $5, $16, $0
/* 017710 01DC3410 28364070 */  paddub      $6, $2, $0
/* 017714 01DC3414 DC84050C */  jal         Shake__6CWaterFiif
/* 017718 01DC3418 00000000 */   nop
/* 01771C 01DC341C E301023C */  lui         $2, %hi(Water)
/* 017720 01DC3420 B0B34424 */  addiu       $4, $2, %lo(Water)
/* 017724 01DC3424 7484050C */  jal         Hamon__6CWaterFv
/* 017728 01DC3428 00000000 */   nop
/* 01772C 01DC342C A0B8040C */  jal         GetVif1Packet__Fv
/* 017730 01DC3430 00000000 */   nop
/* 017734 01DC3434 E301033C */  lui         $3, %hi(Water)
/* 017738 01DC3438 B0B36424 */  addiu       $4, $3, %lo(Water)
/* 01773C 01DC343C C701033C */  lui         $3, %hi(mgRenderInfo)
/* 017740 01DC3440 20556524 */  addiu       $5, $3, %lo(mgRenderInfo)
/* 017744 01DC3444 28364070 */  paddub      $6, $2, $0
/* 017748 01DC3448 283E0070 */  paddub      $7, $0, $0
/* 01774C 01DC344C C883050C */  jal         DrawVu1__6CWaterFP10RenderInfoP13sceVif1PacketP1
/* 017750 01DC3450 00000000 */   nop
/* 017754 01DC3454 F08B8427 */  addiu       $4, $28, -0x7410
/* 017758 01DC3458 B0BB040C */  jal         MGSetGsZBUF__FP9sceGsZbuf
/* 01775C 01DC345C 00000000 */   nop
/* 017760 01DC3460 1000BF7B */  lq          $31, 0x10($29)
/* 017764 01DC3464 0000B07B */  lq          $16, 0x0($29)
/* 017768 01DC3468 6000BD27 */  addiu       $29, $29, 0x60
/* 01776C 01DC346C 0800E003 */  jr          $31
/* 017770 01DC3470 00000000 */   nop
/* 017774 01DC3474 00000000 */  nop
/* 017778 01DC3478 00000000 */  nop
/* 01777C 01DC347C 00000000 */  nop
