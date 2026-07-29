.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel OpB_InitProcess__Fv
/* 00D770 01DB9470 F0F1BD27 */  addiu       $29, $29, -0xE10
/* 00D774 01DB9474 7000BF7F */  sq          $31, 0x70($29)
/* 00D778 01DB9478 6000B67F */  sq          $22, 0x60($29)
/* 00D77C 01DB947C 5000B57F */  sq          $21, 0x50($29)
/* 00D780 01DB9480 4000B47F */  sq          $20, 0x40($29)
/* 00D784 01DB9484 3000B37F */  sq          $19, 0x30($29)
/* 00D788 01DB9488 2000B27F */  sq          $18, 0x20($29)
/* 00D78C 01DB948C 1000B17F */  sq          $17, 0x10($29)
/* 00D790 01DB9490 0000B07F */  sq          $16, 0x0($29)
/* 00D794 01DB9494 DD01023C */  lui         $2, %hi(LIT_350__4)
/* 00D798 01DB9498 206A4624 */  addiu       $6, $2, %lo(LIT_350__4)
/* 00D79C 01DB949C 8000A527 */  addiu       $5, $29, 0x80
/* 00D7A0 01DB94A0 09000424 */  addiu       $4, $0, 0x9
.L01DB94A4_2BECA4:
/* 00D7A4 01DB94A4 0000C378 */  lq          $3, 0x0($6)
/* 00D7A8 01DB94A8 1000C278 */  lq          $2, 0x10($6)
/* 00D7AC 01DB94AC 2000C624 */  addiu       $6, $6, 0x20
/* 00D7B0 01DB94B0 FFFF8424 */  addiu       $4, $4, -0x1
/* 00D7B4 01DB94B4 0000A37C */  sq          $3, 0x0($5)
/* 00D7B8 01DB94B8 1000A27C */  sq          $2, 0x10($5)
/* 00D7BC 01DB94BC 2000A524 */  addiu       $5, $5, 0x20
/* 00D7C0 01DB94C0 F8FF801C */  bgtz        $4, .L01DB94A4_2BECA4
/* 00D7C4 01DB94C4 00000000 */   nop
.L01DB94C8_2BECC8:
/* 00D7C8 01DB94C8 8CFB040C */  jal         ReadBGSync__Fv
/* 00D7CC 01DB94CC 00000000 */   nop
/* 00D7D0 01DB94D0 FDFF4014 */  bnez        $2, .L01DB94C8_2BECC8
/* 00D7D4 01DB94D4 00000000 */   nop
/* 00D7D8 01DB94D8 948B848F */  lw          $4, -0x746C($28)
/* 00D7DC 01DB94DC DE01023C */  lui         $2, %hi(LIT_505__5)
/* 00D7E0 01DB94E0 48E84524 */  addiu       $5, $2, %lo(LIT_505__5)
/* 00D7E4 01DB94E4 28360070 */  paddub      $6, $0, $0
/* 00D7E8 01DB94E8 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00D7EC 01DB94EC 00000000 */   nop
/* 00D7F0 01DB94F0 BC00A2AF */  sw          $2, 0xBC($29)
/* 00D7F4 01DB94F4 948B848F */  lw          $4, -0x746C($28)
/* 00D7F8 01DB94F8 DE01023C */  lui         $2, %hi(LIT_506__4)
/* 00D7FC 01DB94FC 58E84524 */  addiu       $5, $2, %lo(LIT_506__4)
/* 00D800 01DB9500 28360070 */  paddub      $6, $0, $0
/* 00D804 01DB9504 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00D808 01DB9508 00000000 */   nop
/* 00D80C 01DB950C C800A2AF */  sw          $2, 0xC8($29)
/* 00D810 01DB9510 948B848F */  lw          $4, -0x746C($28)
/* 00D814 01DB9514 DE01023C */  lui         $2, %hi(LIT_507__5)
/* 00D818 01DB9518 68E84524 */  addiu       $5, $2, %lo(LIT_507__5)
/* 00D81C 01DB951C 28360070 */  paddub      $6, $0, $0
/* 00D820 01DB9520 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00D824 01DB9524 00000000 */   nop
/* 00D828 01DB9528 D400A2AF */  sw          $2, 0xD4($29)
/* 00D82C 01DB952C 948B848F */  lw          $4, -0x746C($28)
/* 00D830 01DB9530 DE01023C */  lui         $2, %hi(LIT_508__4)
/* 00D834 01DB9534 78E84524 */  addiu       $5, $2, %lo(LIT_508__4)
/* 00D838 01DB9538 28360070 */  paddub      $6, $0, $0
/* 00D83C 01DB953C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00D840 01DB9540 00000000 */   nop
/* 00D844 01DB9544 E000A2AF */  sw          $2, 0xE0($29)
/* 00D848 01DB9548 948B848F */  lw          $4, -0x746C($28)
/* 00D84C 01DB954C DE01023C */  lui         $2, %hi(LIT_509__4)
/* 00D850 01DB9550 88E84524 */  addiu       $5, $2, %lo(LIT_509__4)
/* 00D854 01DB9554 28360070 */  paddub      $6, $0, $0
/* 00D858 01DB9558 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00D85C 01DB955C 00000000 */   nop
/* 00D860 01DB9560 EC00A2AF */  sw          $2, 0xEC($29)
/* 00D864 01DB9564 948B848F */  lw          $4, -0x746C($28)
/* 00D868 01DB9568 DE01023C */  lui         $2, %hi(LIT_510__5)
/* 00D86C 01DB956C 98E84524 */  addiu       $5, $2, %lo(LIT_510__5)
/* 00D870 01DB9570 28360070 */  paddub      $6, $0, $0
/* 00D874 01DB9574 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00D878 01DB9578 00000000 */   nop
/* 00D87C 01DB957C F800A2AF */  sw          $2, 0xF8($29)
/* 00D880 01DB9580 948B848F */  lw          $4, -0x746C($28)
/* 00D884 01DB9584 DE01023C */  lui         $2, %hi(LIT_511__4)
/* 00D888 01DB9588 A8E84524 */  addiu       $5, $2, %lo(LIT_511__4)
/* 00D88C 01DB958C 28360070 */  paddub      $6, $0, $0
/* 00D890 01DB9590 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00D894 01DB9594 00000000 */   nop
/* 00D898 01DB9598 0401A2AF */  sw          $2, 0x104($29)
/* 00D89C 01DB959C 948B848F */  lw          $4, -0x746C($28)
/* 00D8A0 01DB95A0 DE01023C */  lui         $2, %hi(LIT_512__4)
/* 00D8A4 01DB95A4 B8E84524 */  addiu       $5, $2, %lo(LIT_512__4)
/* 00D8A8 01DB95A8 28360070 */  paddub      $6, $0, $0
/* 00D8AC 01DB95AC C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00D8B0 01DB95B0 00000000 */   nop
/* 00D8B4 01DB95B4 1001A2AF */  sw          $2, 0x110($29)
/* 00D8B8 01DB95B8 948B848F */  lw          $4, -0x746C($28)
/* 00D8BC 01DB95BC DE01023C */  lui         $2, %hi(LIT_513__3)
/* 00D8C0 01DB95C0 C8E84524 */  addiu       $5, $2, %lo(LIT_513__3)
/* 00D8C4 01DB95C4 28360070 */  paddub      $6, $0, $0
/* 00D8C8 01DB95C8 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00D8CC 01DB95CC 00000000 */   nop
/* 00D8D0 01DB95D0 1C01A2AF */  sw          $2, 0x11C($29)
/* 00D8D4 01DB95D4 948B848F */  lw          $4, -0x746C($28)
/* 00D8D8 01DB95D8 DE01023C */  lui         $2, %hi(LIT_514__5)
/* 00D8DC 01DB95DC D8E84524 */  addiu       $5, $2, %lo(LIT_514__5)
/* 00D8E0 01DB95E0 28360070 */  paddub      $6, $0, $0
/* 00D8E4 01DB95E4 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00D8E8 01DB95E8 00000000 */   nop
/* 00D8EC 01DB95EC 2801A2AF */  sw          $2, 0x128($29)
/* 00D8F0 01DB95F0 948B848F */  lw          $4, -0x746C($28)
/* 00D8F4 01DB95F4 DE01023C */  lui         $2, %hi(LIT_515__5)
/* 00D8F8 01DB95F8 E8E84524 */  addiu       $5, $2, %lo(LIT_515__5)
/* 00D8FC 01DB95FC 28360070 */  paddub      $6, $0, $0
/* 00D900 01DB9600 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00D904 01DB9604 00000000 */   nop
/* 00D908 01DB9608 3401A2AF */  sw          $2, 0x134($29)
/* 00D90C 01DB960C 948B848F */  lw          $4, -0x746C($28)
/* 00D910 01DB9610 DE01023C */  lui         $2, %hi(LIT_516__4)
/* 00D914 01DB9614 F8E84524 */  addiu       $5, $2, %lo(LIT_516__4)
/* 00D918 01DB9618 28360070 */  paddub      $6, $0, $0
/* 00D91C 01DB961C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00D920 01DB9620 00000000 */   nop
/* 00D924 01DB9624 4001A2AF */  sw          $2, 0x140($29)
/* 00D928 01DB9628 948B848F */  lw          $4, -0x746C($28)
/* 00D92C 01DB962C DE01023C */  lui         $2, %hi(LIT_517__5)
/* 00D930 01DB9630 08E94524 */  addiu       $5, $2, %lo(LIT_517__5)
/* 00D934 01DB9634 28360070 */  paddub      $6, $0, $0
/* 00D938 01DB9638 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00D93C 01DB963C 00000000 */   nop
/* 00D940 01DB9640 4C01A2AF */  sw          $2, 0x14C($29)
/* 00D944 01DB9644 948B848F */  lw          $4, -0x746C($28)
/* 00D948 01DB9648 DE01023C */  lui         $2, %hi(LIT_518__3)
/* 00D94C 01DB964C 18E94524 */  addiu       $5, $2, %lo(LIT_518__3)
/* 00D950 01DB9650 28360070 */  paddub      $6, $0, $0
/* 00D954 01DB9654 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00D958 01DB9658 00000000 */   nop
/* 00D95C 01DB965C 5801A2AF */  sw          $2, 0x158($29)
/* 00D960 01DB9660 948B848F */  lw          $4, -0x746C($28)
/* 00D964 01DB9664 DE01023C */  lui         $2, %hi(LIT_519__3)
/* 00D968 01DB9668 28E94524 */  addiu       $5, $2, %lo(LIT_519__3)
/* 00D96C 01DB966C 28360070 */  paddub      $6, $0, $0
/* 00D970 01DB9670 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00D974 01DB9674 00000000 */   nop
/* 00D978 01DB9678 6401A2AF */  sw          $2, 0x164($29)
/* 00D97C 01DB967C 948B848F */  lw          $4, -0x746C($28)
/* 00D980 01DB9680 DE01023C */  lui         $2, %hi(LIT_520__3)
/* 00D984 01DB9684 38E94524 */  addiu       $5, $2, %lo(LIT_520__3)
/* 00D988 01DB9688 28360070 */  paddub      $6, $0, $0
/* 00D98C 01DB968C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00D990 01DB9690 00000000 */   nop
/* 00D994 01DB9694 7001A2AF */  sw          $2, 0x170($29)
/* 00D998 01DB9698 948B848F */  lw          $4, -0x746C($28)
/* 00D99C 01DB969C DE01023C */  lui         $2, %hi(LIT_521__4)
/* 00D9A0 01DB96A0 48E94524 */  addiu       $5, $2, %lo(LIT_521__4)
/* 00D9A4 01DB96A4 28360070 */  paddub      $6, $0, $0
/* 00D9A8 01DB96A8 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00D9AC 01DB96AC 00000000 */   nop
/* 00D9B0 01DB96B0 7C01A2AF */  sw          $2, 0x17C($29)
/* 00D9B4 01DB96B4 948B848F */  lw          $4, -0x746C($28)
/* 00D9B8 01DB96B8 DE01023C */  lui         $2, %hi(LIT_522__4)
/* 00D9BC 01DB96BC 58E94524 */  addiu       $5, $2, %lo(LIT_522__4)
/* 00D9C0 01DB96C0 28360070 */  paddub      $6, $0, $0
/* 00D9C4 01DB96C4 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 00D9C8 01DB96C8 00000000 */   nop
/* 00D9CC 01DB96CC 8801A2AF */  sw          $2, 0x188($29)
/* 00D9D0 01DB96D0 C701023C */  lui         $2, %hi(TexManager)
/* 00D9D4 01DB96D4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00D9D8 01DB96D8 E03F0524 */  addiu       $5, $0, 0x3FE0
/* 00D9DC 01DB96DC F0C3040C */  jal         Initialize__15CTextureManagerFi
/* 00D9E0 01DB96E0 00000000 */   nop
/* 00D9E4 01DB96E4 C701023C */  lui         $2, %hi(TexManager)
/* 00D9E8 01DB96E8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00D9EC 01DB96EC FFFF0524 */  addiu       $5, $0, -0x1
/* 00D9F0 01DB96F0 8000A627 */  addiu       $6, $29, 0x80
/* 00D9F4 01DB96F4 C8CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 00D9F8 01DB96F8 00000000 */   nop
/* 00D9FC 01DB96FC 02000224 */  addiu       $2, $0, 0x2
/* 00DA00 01DB9700 E101013C */  lui         $1, %hi(CharaTex__2 + 0x9)
/* 00DA04 01DB9704 B99522A0 */  sb          $2, %lo(CharaTex__2 + 0x9)($1)
/* 00DA08 01DB9708 16000224 */  addiu       $2, $0, 0x16
/* 00DA0C 01DB970C E101013C */  lui         $1, %hi(CharaTex__2 + 0xB)
/* 00DA10 01DB9710 BB9522A0 */  sb          $2, %lo(CharaTex__2 + 0xB)($1)
/* 00DA14 01DB9714 E101013C */  lui         $1, %hi(CharaTex__2 + 0x8)
/* 00DA18 01DB9718 B89522A0 */  sb          $2, %lo(CharaTex__2 + 0x8)($1)
/* 00DA1C 01DB971C E101013C */  lui         $1, %hi(CharaTex__2 + 0xA)
/* 00DA20 01DB9720 BA9522A0 */  sb          $2, %lo(CharaTex__2 + 0xA)($1)
/* 00DA24 01DB9724 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 00DA28 01DB9728 282E0070 */  paddub      $5, $0, $0
/* 00DA2C 01DB972C 04000624 */  addiu       $6, $0, 0x4
/* 00DA30 01DB9730 1E000724 */  addiu       $7, $0, 0x1E
/* 00DA34 01DB9734 140F050C */  jal         SetReverb__6CSoundFiii
/* 00DA38 01DB9738 00000000 */   nop
/* 00DA3C 01DB973C 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 00DA40 01DB9740 01000524 */  addiu       $5, $0, 0x1
/* 00DA44 01DB9744 04000624 */  addiu       $6, $0, 0x4
/* 00DA48 01DB9748 05000724 */  addiu       $7, $0, 0x5
/* 00DA4C 01DB974C 140F050C */  jal         SetReverb__6CSoundFiii
/* 00DA50 01DB9750 00000000 */   nop
/* 00DA54 01DB9754 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 00DA58 01DB9758 DE01023C */  lui         $2, %hi(LIT_523__3)
/* 00DA5C 01DB975C 68E94524 */  addiu       $5, $2, %lo(LIT_523__3)
/* 00DA60 01DB9760 948B868F */  lw          $6, -0x746C($28)
/* 00DA64 01DB9764 3410050C */  jal         LoadSoundFileFromPack__6CSoundFPcPUi
/* 00DA68 01DB9768 00000000 */   nop
/* 00DA6C 01DB976C 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 00DA70 01DB9770 0F000524 */  addiu       $5, $0, 0xF
/* 00DA74 01DB9774 00010624 */  addiu       $6, $0, 0x100
/* 00DA78 01DB9778 581A050C */  jal         SetVol__6CSoundFii
/* 00DA7C 01DB977C 00000000 */   nop
/* 00DA80 01DB9780 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 00DA84 01DB9784 0E000524 */  addiu       $5, $0, 0xE
/* 00DA88 01DB9788 00010624 */  addiu       $6, $0, 0x100
/* 00DA8C 01DB978C 581A050C */  jal         SetVol__6CSoundFii
/* 00DA90 01DB9790 00000000 */   nop
/* 00DA94 01DB9794 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 00DA98 01DB9798 0D000524 */  addiu       $5, $0, 0xD
/* 00DA9C 01DB979C 00010624 */  addiu       $6, $0, 0x100
/* 00DAA0 01DB97A0 581A050C */  jal         SetVol__6CSoundFii
/* 00DAA4 01DB97A4 00000000 */   nop
/* 00DAA8 01DB97A8 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 00DAAC 01DB97AC 0C000524 */  addiu       $5, $0, 0xC
/* 00DAB0 01DB97B0 00010624 */  addiu       $6, $0, 0x100
/* 00DAB4 01DB97B4 581A050C */  jal         SetVol__6CSoundFii
/* 00DAB8 01DB97B8 00000000 */   nop
/* 00DABC 01DB97BC FC9780AF */  sw          $0, -0x6804($28)
/* 00DAC0 01DB97C0 ACC3760C */  jal         OpBgmPlay__Fv
/* 00DAC4 01DB97C4 00000000 */   nop
/* 00DAC8 01DB97C8 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 00DACC 01DB97CC 01000524 */  addiu       $5, $0, 0x1
/* 00DAD0 01DB97D0 28360070 */  paddub      $6, $0, $0
/* 00DAD4 01DB97D4 8814050C */  jal         SQ_Play__6CSoundFii
/* 00DAD8 01DB97D8 00000000 */   nop
/* 00DADC 01DB97DC 0F000424 */  addiu       $4, $0, 0xF
/* 00DAE0 01DB97E0 10000524 */  addiu       $5, $0, 0x10
/* 00DAE4 01DB97E4 16000624 */  addiu       $6, $0, 0x16
/* 00DAE8 01DB97E8 A0808CC7 */  lwc1        $f12, -0x7F60($28)
/* 00DAEC 01DB97EC 84C4760C */  jal         OpPlayVolSE__Fiiif
/* 00DAF0 01DB97F0 00000000 */   nop
/* 00DAF4 01DB97F4 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 00DAF8 01DB97F8 C817050C */  jal         Step__6CSoundFv
/* 00DAFC 01DB97FC 00000000 */   nop
/* 00DB00 01DB9800 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 00DB04 01DB9804 0F000524 */  addiu       $5, $0, 0xF
/* 00DB08 01DB9808 10000624 */  addiu       $6, $0, 0x10
/* 00DB0C 01DB980C 15000724 */  addiu       $7, $0, 0x15
/* 00DB10 01DB9810 28460070 */  paddub      $8, $0, $0
/* 00DB14 01DB9814 1416050C */  jal         SE_Play__6CSoundFiiii
/* 00DB18 01DB9818 00000000 */   nop
/* 00DB1C 01DB981C B89880AF */  sw          $0, -0x6748($28)
/* 00DB20 01DB9820 DE01023C */  lui         $2, %hi(LIT_525__3)
/* 00DB24 01DB9824 78E94424 */  addiu       $4, $2, %lo(LIT_525__3)
/* 00DB28 01DB9828 00C5760C */  jal         OPAnalyz__FPc
/* 00DB2C 01DB982C 00000000 */   nop
/* 00DB30 01DB9830 4CCA760C */  jal         OPMdsLoad__Fv
/* 00DB34 01DB9834 00000000 */   nop
/* 00DB38 01DB9838 DD01023C */  lui         $2, %hi(LIT_381__4)
/* 00DB3C 01DB983C 406B4624 */  addiu       $6, $2, %lo(LIT_381__4)
/* 00DB40 01DB9840 A001A527 */  addiu       $5, $29, 0x1A0
/* 00DB44 01DB9844 44000424 */  addiu       $4, $0, 0x44
.L01DB9848_2BF048:
/* 00DB48 01DB9848 0000C378 */  lq          $3, 0x0($6)
/* 00DB4C 01DB984C 1000C278 */  lq          $2, 0x10($6)
/* 00DB50 01DB9850 2000C624 */  addiu       $6, $6, 0x20
/* 00DB54 01DB9854 FFFF8424 */  addiu       $4, $4, -0x1
/* 00DB58 01DB9858 0000A37C */  sq          $3, 0x0($5)
/* 00DB5C 01DB985C 1000A27C */  sq          $2, 0x10($5)
/* 00DB60 01DB9860 2000A524 */  addiu       $5, $5, 0x20
/* 00DB64 01DB9864 F8FF801C */  bgtz        $4, .L01DB9848_2BF048
/* 00DB68 01DB9868 00000000 */   nop
/* 00DB6C 01DB986C 200AA427 */  addiu       $4, $29, 0xA20
/* 00DB70 01DB9870 509F040C */  jal         __ct__10CFrameAttrFv
/* 00DB74 01DB9874 00000000 */   nop
/* 00DB78 01DB9878 01000224 */  addiu       $2, $0, 0x1
/* 00DB7C 01DB987C 2C0AA2A3 */  sb          $2, 0xA2C($29)
/* 00DB80 01DB9880 DF01013C */  lui         $1, %hi(MapDataBuffer + 0x8)
/* 00DB84 01DB9884 B8FE20AC */  sw          $0, %lo(MapDataBuffer + 0x8)($1)
/* 00DB88 01DB9888 288E0070 */  paddub      $17, $0, $0
/* 00DB8C 01DB988C C6000010 */  b           .L01DB9BA8_2BF3A8
/* 00DB90 01DB9890 00000000 */   nop
.L01DB9894_2BF094:
/* 00DB94 01DB9894 40911100 */  sll         $18, $17, 5
/* 00DB98 01DB9898 21105D02 */  addu        $2, $18, $29
/* 00DB9C 01DB989C A001448C */  lw          $4, 0x1A0($2)
/* 00DBA0 01DB98A0 0E008010 */  beqz        $4, .L01DB98DC_2BF0DC
/* 00DBA4 01DB98A4 00000000 */   nop
/* 00DBA8 01DB98A8 948B858F */  lw          $5, -0x746C($28)
/* 00DBAC 01DB98AC 28360070 */  paddub      $6, $0, $0
/* 00DBB0 01DB98B0 D8FC040C */  jal         LoadFile__FPcPvPi
/* 00DBB4 01DB98B4 00000000 */   nop
/* 00DBB8 01DB98B8 948B848F */  lw          $4, -0x746C($28)
/* 00DBBC 01DB98BC DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 00DBC0 01DB98C0 B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 00DBC4 01DB98C4 02000624 */  addiu       $6, $0, 0x2
/* 00DBC8 01DB98C8 283E0070 */  paddub      $7, $0, $0
/* 00DBCC 01DB98CC 28460070 */  paddub      $8, $0, $0
/* 00DBD0 01DB98D0 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 00DBD4 01DB98D4 00000000 */   nop
/* 00DBD8 01DB98D8 28864070 */  paddub      $16, $2, $0
.L01DB98DC_2BF0DC:
/* 00DBDC 01DB98DC 04000224 */  addiu       $2, $0, 0x4
/* 00DBE0 01DB98E0 02002216 */  bne         $17, $2, .L01DB98EC_2BF0EC
/* 00DBE4 01DB98E4 00000000 */   nop
/* 00DBE8 01DB98E8 A89990AF */  sw          $16, -0x6658($28)
.L01DB98EC_2BF0EC:
/* 00DBEC 01DB98EC 05000224 */  addiu       $2, $0, 0x5
/* 00DBF0 01DB98F0 02002216 */  bne         $17, $2, .L01DB98FC_2BF0FC
/* 00DBF4 01DB98F4 00000000 */   nop
/* 00DBF8 01DB98F8 AC9990AF */  sw          $16, -0x6654($28)
.L01DB98FC_2BF0FC:
/* 00DBFC 01DB98FC 3600222A */  slti        $2, $17, 0x36
/* 00DC00 01DB9900 09004014 */  bnez        $2, .L01DB9928_2BF128
/* 00DC04 01DB9904 00000000 */   nop
/* 00DC08 01DB9908 4200212A */  slti        $1, $17, 0x42
/* 00DC0C 01DB990C 06002010 */  beqz        $1, .L01DB9928_2BF128
/* 00DC10 01DB9910 00000000 */   nop
/* 00DC14 01DB9914 80181100 */  sll         $3, $17, 2
/* 00DC18 01DB9918 E301023C */  lui         $2, %hi(Fuusya + 0x78)
/* 00DC1C 01DB991C 78A24224 */  addiu       $2, $2, %lo(Fuusya + 0x78)
/* 00DC20 01DB9920 21104300 */  addu        $2, $2, $3
/* 00DC24 01DB9924 000050AC */  sw          $16, 0x0($2)
.L01DB9928_2BF128:
/* 00DC28 01DB9928 28260072 */  paddub      $4, $16, $0
/* 00DC2C 01DB992C 200AA527 */  addiu       $5, $29, 0xA20
/* 00DC30 01DB9930 01000624 */  addiu       $6, $0, 0x1
/* 00DC34 01DB9934 40000724 */  addiu       $7, $0, 0x40
/* 00DC38 01DB9938 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 00DC3C 01DB993C 00000000 */   nop
/* 00DC40 01DB9940 28260072 */  paddub      $4, $16, $0
/* 00DC44 01DB9944 01000524 */  addiu       $5, $0, 0x1
/* 00DC48 01DB9948 BC97040C */  jal         SetFrameAttr__FP6CFramei
/* 00DC4C 01DB994C 00000000 */   nop
/* 00DC50 01DB9950 00111100 */  sll         $2, $17, 4
/* 00DC54 01DB9954 23105100 */  subu        $2, $2, $17
/* 00DC58 01DB9958 00990200 */  sll         $19, $2, 4
/* 00DC5C 01DB995C E201023C */  lui         $2, %hi(OP_NornMapObj)
/* 00DC60 01DB9960 B0F64224 */  addiu       $2, $2, %lo(OP_NornMapObj)
/* 00DC64 01DB9964 21A85300 */  addu        $21, $2, $19
/* 00DC68 01DB9968 2826A072 */  paddub      $4, $21, $0
/* 00DC6C 01DB996C 445E050C */  jal         Initialize__10CMapObjectFv
/* 00DC70 01DB9970 00000000 */   nop
/* 00DC74 01DB9974 2826A072 */  paddub      $4, $21, $0
/* 00DC78 01DB9978 282E0072 */  paddub      $5, $16, $0
/* 00DC7C 01DB997C 28360070 */  paddub      $6, $0, $0
/* 00DC80 01DB9980 305C050C */  jal         SetFrame__12CObjectFrameFP9CFrameVu1i
/* 00DC84 01DB9984 00000000 */   nop
/* 00DC88 01DB9988 E201023C */  lui         $2, %hi(OP_NornMapObj + 0xE8)
/* 00DC8C 01DB998C 98F74224 */  addiu       $2, $2, %lo(OP_NornMapObj + 0xE8)
/* 00DC90 01DB9990 21105300 */  addu        $2, $2, $19
/* 00DC94 01DB9994 000040AC */  sw          $0, 0x0($2)
/* 00DC98 01DB9998 E201023C */  lui         $2, %hi(OP_NornMapObj + 0xE4)
/* 00DC9C 01DB999C 94F74224 */  addiu       $2, $2, %lo(OP_NornMapObj + 0xE4)
/* 00DCA0 01DB99A0 21105300 */  addu        $2, $2, $19
/* 00DCA4 01DB99A4 000040AC */  sw          $0, 0x0($2)
/* 00DCA8 01DB99A8 21185D02 */  addu        $3, $18, $29
/* 00DCAC 01DB99AC 2041023C */  lui         $2, (0x41200000 >> 16)
/* 00DCB0 01DB99B0 00088244 */  mtc1        $2, $f1
/* 00DCB4 01DB99B4 B00160C4 */  lwc1        $f0, 0x1B0($3)
/* 00DCB8 01DB99B8 C2080046 */  mul.s       $f3, $f1, $f0
/* 00DCBC 01DB99BC AC0160C4 */  lwc1        $f0, 0x1AC($3)
/* 00DCC0 01DB99C0 82080046 */  mul.s       $f2, $f1, $f0
/* 00DCC4 01DB99C4 A80160C4 */  lwc1        $f0, 0x1A8($3)
/* 00DCC8 01DB99C8 02080046 */  mul.s       $f0, $f1, $f0
/* 00DCCC 01DB99CC D00DA0E7 */  swc1        $f0, 0xDD0($29)
/* 00DCD0 01DB99D0 D40DA2E7 */  swc1        $f2, 0xDD4($29)
/* 00DCD4 01DB99D4 D80DA3E7 */  swc1        $f3, 0xDD8($29)
/* 00DCD8 01DB99D8 2826A072 */  paddub      $4, $21, $0
/* 00DCDC 01DB99DC D00DA527 */  addiu       $5, $29, 0xDD0
/* 00DCE0 01DB99E0 A000B98E */  lw          $25, 0xA0($21)
/* 00DCE4 01DB99E4 1000398F */  lw          $25, 0x10($25)
/* 00DCE8 01DB99E8 09F82003 */  jalr        $25
/* 00DCEC 01DB99EC 00000000 */   nop
/* 00DCF0 01DB99F0 21105D02 */  addu        $2, $18, $29
/* 00DCF4 01DB99F4 BC014CC4 */  lwc1        $f12, 0x1BC($2)
/* 00DCF8 01DB99F8 9044040C */  jal         fptodp
/* 00DCFC 01DB99FC 00000000 */   nop
/* 00DD00 01DB9A00 188084DF */  ld          $4, -0x7FE8($28)
/* 00DD04 01DB9A04 282E4070 */  paddub      $5, $2, $0
/* 00DD08 01DB9A08 9E3F040C */  jal         dpmul
/* 00DD0C 01DB9A0C 00000000 */   nop
/* 00DD10 01DB9A10 289E4070 */  paddub      $19, $2, $0
/* 00DD14 01DB9A14 B4000424 */  addiu       $4, $0, 0xB4
/* 00DD18 01DB9A18 FC40040C */  jal         litodp
/* 00DD1C 01DB9A1C 00000000 */   nop
/* 00DD20 01DB9A20 28266072 */  paddub      $4, $19, $0
/* 00DD24 01DB9A24 282E4070 */  paddub      $5, $2, $0
/* 00DD28 01DB9A28 4840040C */  jal         dpdiv
/* 00DD2C 01DB9A2C 00000000 */   nop
/* 00DD30 01DB9A30 28A64070 */  paddub      $20, $2, $0
/* 00DD34 01DB9A34 28264070 */  paddub      $4, $2, $0
/* 00DD38 01DB9A38 9241040C */  jal         dptofp
/* 00DD3C 01DB9A3C 00000000 */   nop
/* 00DD40 01DB9A40 21105D02 */  addu        $2, $18, $29
/* 00DD44 01DB9A44 B8014CC4 */  lwc1        $f12, 0x1B8($2)
/* 00DD48 01DB9A48 9044040C */  jal         fptodp
/* 00DD4C 01DB9A4C 00000000 */   nop
/* 00DD50 01DB9A50 188084DF */  ld          $4, -0x7FE8($28)
/* 00DD54 01DB9A54 282E4070 */  paddub      $5, $2, $0
/* 00DD58 01DB9A58 9E3F040C */  jal         dpmul
/* 00DD5C 01DB9A5C 00000000 */   nop
/* 00DD60 01DB9A60 289E4070 */  paddub      $19, $2, $0
/* 00DD64 01DB9A64 B4000424 */  addiu       $4, $0, 0xB4
/* 00DD68 01DB9A68 FC40040C */  jal         litodp
/* 00DD6C 01DB9A6C 00000000 */   nop
/* 00DD70 01DB9A70 28266072 */  paddub      $4, $19, $0
/* 00DD74 01DB9A74 282E4070 */  paddub      $5, $2, $0
/* 00DD78 01DB9A78 4840040C */  jal         dpdiv
/* 00DD7C 01DB9A7C 00000000 */   nop
/* 00DD80 01DB9A80 289E4070 */  paddub      $19, $2, $0
/* 00DD84 01DB9A84 28264070 */  paddub      $4, $2, $0
/* 00DD88 01DB9A88 9241040C */  jal         dptofp
/* 00DD8C 01DB9A8C 00000000 */   nop
/* 00DD90 01DB9A90 21105D02 */  addu        $2, $18, $29
/* 00DD94 01DB9A94 B4014CC4 */  lwc1        $f12, 0x1B4($2)
/* 00DD98 01DB9A98 9044040C */  jal         fptodp
/* 00DD9C 01DB9A9C 00000000 */   nop
/* 00DDA0 01DB9AA0 188084DF */  ld          $4, -0x7FE8($28)
/* 00DDA4 01DB9AA4 282E4070 */  paddub      $5, $2, $0
/* 00DDA8 01DB9AA8 9E3F040C */  jal         dpmul
/* 00DDAC 01DB9AAC 00000000 */   nop
/* 00DDB0 01DB9AB0 28B64070 */  paddub      $22, $2, $0
/* 00DDB4 01DB9AB4 B4000424 */  addiu       $4, $0, 0xB4
/* 00DDB8 01DB9AB8 FC40040C */  jal         litodp
/* 00DDBC 01DB9ABC 00000000 */   nop
/* 00DDC0 01DB9AC0 2826C072 */  paddub      $4, $22, $0
/* 00DDC4 01DB9AC4 282E4070 */  paddub      $5, $2, $0
/* 00DDC8 01DB9AC8 4840040C */  jal         dpdiv
/* 00DDCC 01DB9ACC 00000000 */   nop
/* 00DDD0 01DB9AD0 28264070 */  paddub      $4, $2, $0
/* 00DDD4 01DB9AD4 9241040C */  jal         dptofp
/* 00DDD8 01DB9AD8 00000000 */   nop
/* 00DDDC 01DB9ADC E00DA0E7 */  swc1        $f0, 0xDE0($29)
/* 00DDE0 01DB9AE0 28266072 */  paddub      $4, $19, $0
/* 00DDE4 01DB9AE4 9241040C */  jal         dptofp
/* 00DDE8 01DB9AE8 00000000 */   nop
/* 00DDEC 01DB9AEC E40DA0E7 */  swc1        $f0, 0xDE4($29)
/* 00DDF0 01DB9AF0 28268072 */  paddub      $4, $20, $0
/* 00DDF4 01DB9AF4 9241040C */  jal         dptofp
/* 00DDF8 01DB9AF8 00000000 */   nop
/* 00DDFC 01DB9AFC E80DA0E7 */  swc1        $f0, 0xDE8($29)
/* 00DE00 01DB9B00 2826A072 */  paddub      $4, $21, $0
/* 00DE04 01DB9B04 E00DA527 */  addiu       $5, $29, 0xDE0
/* 00DE08 01DB9B08 A000B98E */  lw          $25, 0xA0($21)
/* 00DE0C 01DB9B0C 2C00398F */  lw          $25, 0x2C($25)
/* 00DE10 01DB9B10 09F82003 */  jalr        $25
/* 00DE14 01DB9B14 00000000 */   nop
/* 00DE18 01DB9B18 2826A072 */  paddub      $4, $21, $0
/* 00DE1C 01DB9B1C DE01023C */  lui         $2, %hi(LIT_527__2)
/* 00DE20 01DB9B20 88E94524 */  addiu       $5, $2, %lo(LIT_527__2)
/* 00DE24 01DB9B24 28360070 */  paddub      $6, $0, $0
/* 00DE28 01DB9B28 A000B98E */  lw          $25, 0xA0($21)
/* 00DE2C 01DB9B2C 9000398F */  lw          $25, 0x90($25)
/* 00DE30 01DB9B30 09F82003 */  jalr        $25
/* 00DE34 01DB9B34 00000000 */   nop
/* 00DE38 01DB9B38 2826A072 */  paddub      $4, $21, $0
/* 00DE3C 01DB9B3C DE01023C */  lui         $2, %hi(LIT_528__2)
/* 00DE40 01DB9B40 90E94524 */  addiu       $5, $2, %lo(LIT_528__2)
/* 00DE44 01DB9B44 28360070 */  paddub      $6, $0, $0
/* 00DE48 01DB9B48 A000B98E */  lw          $25, 0xA0($21)
/* 00DE4C 01DB9B4C 9000398F */  lw          $25, 0x90($25)
/* 00DE50 01DB9B50 09F82003 */  jalr        $25
/* 00DE54 01DB9B54 00000000 */   nop
/* 00DE58 01DB9B58 21105D02 */  addu        $2, $18, $29
/* 00DE5C 01DB9B5C A401448C */  lw          $4, 0x1A4($2)
/* 00DE60 01DB9B60 10008010 */  beqz        $4, .L01DB9BA4_2BF3A4
/* 00DE64 01DB9B64 00000000 */   nop
/* 00DE68 01DB9B68 948B858F */  lw          $5, -0x746C($28)
/* 00DE6C 01DB9B6C 28360070 */  paddub      $6, $0, $0
/* 00DE70 01DB9B70 D8FC040C */  jal         LoadFile__FPcPvPi
/* 00DE74 01DB9B74 00000000 */   nop
/* 00DE78 01DB9B78 948B848F */  lw          $4, -0x746C($28)
/* 00DE7C 01DB9B7C DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 00DE80 01DB9B80 B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 00DE84 01DB9B84 0E000624 */  addiu       $6, $0, 0xE
/* 00DE88 01DB9B88 283E0070 */  paddub      $7, $0, $0
/* 00DE8C 01DB9B8C 28460070 */  paddub      $8, $0, $0
/* 00DE90 01DB9B90 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 00DE94 01DB9B94 00000000 */   nop
/* 00DE98 01DB9B98 D400A2AE */  sw          $2, 0xD4($21)
/* 00DE9C 01DB9B9C A0C1023C */  lui         $2, (0xC1A00000 >> 16)
/* 00DEA0 01DB9BA0 E000A2AE */  sw          $2, 0xE0($21)
.L01DB9BA4_2BF3A4:
/* 00DEA4 01DB9BA4 01003126 */  addiu       $17, $17, 0x1
.L01DB9BA8_2BF3A8:
/* 00DEA8 01DB9BA8 4400222A */  slti        $2, $17, 0x44
/* 00DEAC 01DB9BAC 39FF4014 */  bnez        $2, .L01DB9894_2BF094
/* 00DEB0 01DB9BB0 00000000 */   nop
/* 00DEB4 01DB9BB4 DD01023C */  lui         $2, %hi(LIT_401__3)
/* 00DEB8 01DB9BB8 C0734624 */  addiu       $6, $2, %lo(LIT_401__3)
/* 00DEBC 01DB9BBC 800AA527 */  addiu       $5, $29, 0xA80
/* 00DEC0 01DB9BC0 17000424 */  addiu       $4, $0, 0x17
.L01DB9BC4_2BF3C4:
/* 00DEC4 01DB9BC4 0000C378 */  lq          $3, 0x0($6)
/* 00DEC8 01DB9BC8 1000C278 */  lq          $2, 0x10($6)
/* 00DECC 01DB9BCC 2000C624 */  addiu       $6, $6, 0x20
/* 00DED0 01DB9BD0 FFFF8424 */  addiu       $4, $4, -0x1
/* 00DED4 01DB9BD4 0000A37C */  sq          $3, 0x0($5)
/* 00DED8 01DB9BD8 1000A27C */  sq          $2, 0x10($5)
/* 00DEDC 01DB9BDC 2000A524 */  addiu       $5, $5, 0x20
/* 00DEE0 01DB9BE0 F8FF801C */  bgtz        $4, .L01DB9BC4_2BF3C4
/* 00DEE4 01DB9BE4 00000000 */   nop
/* 00DEE8 01DB9BE8 288E0070 */  paddub      $17, $0, $0
/* 00DEEC 01DB9BEC AE000010 */  b           .L01DB9EA8_2BF6A8
/* 00DEF0 01DB9BF0 00000000 */   nop
.L01DB9BF4_2BF3F4:
/* 00DEF4 01DB9BF4 40991100 */  sll         $19, $17, 5
/* 00DEF8 01DB9BF8 21107D02 */  addu        $2, $19, $29
/* 00DEFC 01DB9BFC 800A448C */  lw          $4, 0xA80($2)
/* 00DF00 01DB9C00 0E008010 */  beqz        $4, .L01DB9C3C_2BF43C
/* 00DF04 01DB9C04 00000000 */   nop
/* 00DF08 01DB9C08 948B858F */  lw          $5, -0x746C($28)
/* 00DF0C 01DB9C0C 28360070 */  paddub      $6, $0, $0
/* 00DF10 01DB9C10 D8FC040C */  jal         LoadFile__FPcPvPi
/* 00DF14 01DB9C14 00000000 */   nop
/* 00DF18 01DB9C18 948B848F */  lw          $4, -0x746C($28)
/* 00DF1C 01DB9C1C DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 00DF20 01DB9C20 B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 00DF24 01DB9C24 02000624 */  addiu       $6, $0, 0x2
/* 00DF28 01DB9C28 283E0070 */  paddub      $7, $0, $0
/* 00DF2C 01DB9C2C 28460070 */  paddub      $8, $0, $0
/* 00DF30 01DB9C30 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 00DF34 01DB9C34 00000000 */   nop
/* 00DF38 01DB9C38 28864070 */  paddub      $16, $2, $0
.L01DB9C3C_2BF43C:
/* 00DF3C 01DB9C3C 0B00201A */  blez        $17, .L01DB9C6C_2BF46C
/* 00DF40 01DB9C40 00000000 */   nop
/* 00DF44 01DB9C44 28260072 */  paddub      $4, $16, $0
/* 00DF48 01DB9C48 200AA527 */  addiu       $5, $29, 0xA20
/* 00DF4C 01DB9C4C 01000624 */  addiu       $6, $0, 0x1
/* 00DF50 01DB9C50 40000724 */  addiu       $7, $0, 0x40
/* 00DF54 01DB9C54 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 00DF58 01DB9C58 00000000 */   nop
/* 00DF5C 01DB9C5C 28260072 */  paddub      $4, $16, $0
/* 00DF60 01DB9C60 01000524 */  addiu       $5, $0, 0x1
/* 00DF64 01DB9C64 BC97040C */  jal         SetFrameAttr__FP6CFramei
/* 00DF68 01DB9C68 00000000 */   nop
.L01DB9C6C_2BF46C:
/* 00DF6C 01DB9C6C 1B002016 */  bnez        $17, .L01DB9CDC_2BF4DC
/* 00DF70 01DB9C70 00000000 */   nop
/* 00DF74 01DB9C74 28260072 */  paddub      $4, $16, $0
/* 00DF78 01DB9C78 DE01023C */  lui         $2, %hi(LIT_529__2)
/* 00DF7C 01DB9C7C 98E94524 */  addiu       $5, $2, %lo(LIT_529__2)
/* 00DF80 01DB9C80 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 00DF84 01DB9C84 00000000 */   nop
/* 00DF88 01DB9C88 28964070 */  paddub      $18, $2, $0
/* 00DF8C 01DB9C8C 600DA427 */  addiu       $4, $29, 0xD60
/* 00DF90 01DB9C90 20024526 */  addiu       $5, $18, 0x220
/* 00DF94 01DB9C94 0C86040C */  jal         sceVu0CopyVector
/* 00DF98 01DB9C98 00000000 */   nop
/* 00DF9C 01DB9C9C 640DA1C7 */  lwc1        $f1, 0xD64($29)
/* 00DFA0 01DB9CA0 F041023C */  lui         $2, (0x41F00000 >> 16)
/* 00DFA4 01DB9CA4 00008244 */  mtc1        $2, $f0
/* 00DFA8 01DB9CA8 00000000 */  nop
/* 00DFAC 01DB9CAC 00080046 */  add.s       $f0, $f1, $f0
/* 00DFB0 01DB9CB0 640DA0E7 */  swc1        $f0, 0xD64($29)
/* 00DFB4 01DB9CB4 680DA1C7 */  lwc1        $f1, 0xD68($29)
/* 00DFB8 01DB9CB8 9643023C */  lui         $2, (0x43960000 >> 16)
/* 00DFBC 01DB9CBC 00008244 */  mtc1        $2, $f0
/* 00DFC0 01DB9CC0 00000000 */  nop
/* 00DFC4 01DB9CC4 01080046 */  sub.s       $f0, $f1, $f0
/* 00DFC8 01DB9CC8 680DA0E7 */  swc1        $f0, 0xD68($29)
/* 00DFCC 01DB9CCC 28264072 */  paddub      $4, $18, $0
/* 00DFD0 01DB9CD0 600DA527 */  addiu       $5, $29, 0xD60
/* 00DFD4 01DB9CD4 B89F040C */  jal         SetPosition__6CFrameFPf
/* 00DFD8 01DB9CD8 00000000 */   nop
.L01DB9CDC_2BF4DC:
/* 00DFDC 01DB9CDC 00111100 */  sll         $2, $17, 4
/* 00DFE0 01DB9CE0 23105100 */  subu        $2, $2, $17
/* 00DFE4 01DB9CE4 00910200 */  sll         $18, $2, 4
/* 00DFE8 01DB9CE8 E201023C */  lui         $2, %hi(OP_NornMapObj2)
/* 00DFEC 01DB9CEC F03D4224 */  addiu       $2, $2, %lo(OP_NornMapObj2)
/* 00DFF0 01DB9CF0 21A85200 */  addu        $21, $2, $18
/* 00DFF4 01DB9CF4 2826A072 */  paddub      $4, $21, $0
/* 00DFF8 01DB9CF8 445E050C */  jal         Initialize__10CMapObjectFv
/* 00DFFC 01DB9CFC 00000000 */   nop
/* 00E000 01DB9D00 2826A072 */  paddub      $4, $21, $0
/* 00E004 01DB9D04 282E0072 */  paddub      $5, $16, $0
/* 00E008 01DB9D08 28360070 */  paddub      $6, $0, $0
/* 00E00C 01DB9D0C 305C050C */  jal         SetFrame__12CObjectFrameFP9CFrameVu1i
/* 00E010 01DB9D10 00000000 */   nop
/* 00E014 01DB9D14 E201023C */  lui         $2, %hi(OP_NornMapObj2 + 0xE8)
/* 00E018 01DB9D18 D83E4224 */  addiu       $2, $2, %lo(OP_NornMapObj2 + 0xE8)
/* 00E01C 01DB9D1C 21105200 */  addu        $2, $2, $18
/* 00E020 01DB9D20 000040AC */  sw          $0, 0x0($2)
/* 00E024 01DB9D24 E201023C */  lui         $2, %hi(OP_NornMapObj2 + 0xE4)
/* 00E028 01DB9D28 D43E4224 */  addiu       $2, $2, %lo(OP_NornMapObj2 + 0xE4)
/* 00E02C 01DB9D2C 21105200 */  addu        $2, $2, $18
/* 00E030 01DB9D30 000040AC */  sw          $0, 0x0($2)
/* 00E034 01DB9D34 21187D02 */  addu        $3, $19, $29
/* 00E038 01DB9D38 2041023C */  lui         $2, (0x41200000 >> 16)
/* 00E03C 01DB9D3C 00088244 */  mtc1        $2, $f1
/* 00E040 01DB9D40 900A60C4 */  lwc1        $f0, 0xA90($3)
/* 00E044 01DB9D44 C2080046 */  mul.s       $f3, $f1, $f0
/* 00E048 01DB9D48 8C0A60C4 */  lwc1        $f0, 0xA8C($3)
/* 00E04C 01DB9D4C 82080046 */  mul.s       $f2, $f1, $f0
/* 00E050 01DB9D50 880A60C4 */  lwc1        $f0, 0xA88($3)
/* 00E054 01DB9D54 02080046 */  mul.s       $f0, $f1, $f0
/* 00E058 01DB9D58 F00DA0E7 */  swc1        $f0, 0xDF0($29)
/* 00E05C 01DB9D5C F40DA2E7 */  swc1        $f2, 0xDF4($29)
/* 00E060 01DB9D60 F80DA3E7 */  swc1        $f3, 0xDF8($29)
/* 00E064 01DB9D64 2826A072 */  paddub      $4, $21, $0
/* 00E068 01DB9D68 F00DA527 */  addiu       $5, $29, 0xDF0
/* 00E06C 01DB9D6C A000B98E */  lw          $25, 0xA0($21)
/* 00E070 01DB9D70 1000398F */  lw          $25, 0x10($25)
/* 00E074 01DB9D74 09F82003 */  jalr        $25
/* 00E078 01DB9D78 00000000 */   nop
/* 00E07C 01DB9D7C 21107D02 */  addu        $2, $19, $29
/* 00E080 01DB9D80 9C0A4CC4 */  lwc1        $f12, 0xA9C($2)
/* 00E084 01DB9D84 9044040C */  jal         fptodp
/* 00E088 01DB9D88 00000000 */   nop
/* 00E08C 01DB9D8C 188084DF */  ld          $4, -0x7FE8($28)
/* 00E090 01DB9D90 282E4070 */  paddub      $5, $2, $0
/* 00E094 01DB9D94 9E3F040C */  jal         dpmul
/* 00E098 01DB9D98 00000000 */   nop
/* 00E09C 01DB9D9C 28964070 */  paddub      $18, $2, $0
/* 00E0A0 01DB9DA0 B4000424 */  addiu       $4, $0, 0xB4
/* 00E0A4 01DB9DA4 FC40040C */  jal         litodp
/* 00E0A8 01DB9DA8 00000000 */   nop
/* 00E0AC 01DB9DAC 28264072 */  paddub      $4, $18, $0
/* 00E0B0 01DB9DB0 282E4070 */  paddub      $5, $2, $0
/* 00E0B4 01DB9DB4 4840040C */  jal         dpdiv
/* 00E0B8 01DB9DB8 00000000 */   nop
/* 00E0BC 01DB9DBC 28A64070 */  paddub      $20, $2, $0
/* 00E0C0 01DB9DC0 28264070 */  paddub      $4, $2, $0
/* 00E0C4 01DB9DC4 9241040C */  jal         dptofp
/* 00E0C8 01DB9DC8 00000000 */   nop
/* 00E0CC 01DB9DCC 21107D02 */  addu        $2, $19, $29
/* 00E0D0 01DB9DD0 980A4CC4 */  lwc1        $f12, 0xA98($2)
/* 00E0D4 01DB9DD4 9044040C */  jal         fptodp
/* 00E0D8 01DB9DD8 00000000 */   nop
/* 00E0DC 01DB9DDC 188084DF */  ld          $4, -0x7FE8($28)
/* 00E0E0 01DB9DE0 282E4070 */  paddub      $5, $2, $0
/* 00E0E4 01DB9DE4 9E3F040C */  jal         dpmul
/* 00E0E8 01DB9DE8 00000000 */   nop
/* 00E0EC 01DB9DEC 28964070 */  paddub      $18, $2, $0
/* 00E0F0 01DB9DF0 B4000424 */  addiu       $4, $0, 0xB4
/* 00E0F4 01DB9DF4 FC40040C */  jal         litodp
/* 00E0F8 01DB9DF8 00000000 */   nop
/* 00E0FC 01DB9DFC 28264072 */  paddub      $4, $18, $0
/* 00E100 01DB9E00 282E4070 */  paddub      $5, $2, $0
/* 00E104 01DB9E04 4840040C */  jal         dpdiv
/* 00E108 01DB9E08 00000000 */   nop
/* 00E10C 01DB9E0C 28964070 */  paddub      $18, $2, $0
/* 00E110 01DB9E10 28264070 */  paddub      $4, $2, $0
/* 00E114 01DB9E14 9241040C */  jal         dptofp
/* 00E118 01DB9E18 00000000 */   nop
/* 00E11C 01DB9E1C 21107D02 */  addu        $2, $19, $29
/* 00E120 01DB9E20 940A4CC4 */  lwc1        $f12, 0xA94($2)
/* 00E124 01DB9E24 9044040C */  jal         fptodp
/* 00E128 01DB9E28 00000000 */   nop
/* 00E12C 01DB9E2C 188084DF */  ld          $4, -0x7FE8($28)
/* 00E130 01DB9E30 282E4070 */  paddub      $5, $2, $0
/* 00E134 01DB9E34 9E3F040C */  jal         dpmul
/* 00E138 01DB9E38 00000000 */   nop
/* 00E13C 01DB9E3C 289E4070 */  paddub      $19, $2, $0
/* 00E140 01DB9E40 B4000424 */  addiu       $4, $0, 0xB4
/* 00E144 01DB9E44 FC40040C */  jal         litodp
/* 00E148 01DB9E48 00000000 */   nop
/* 00E14C 01DB9E4C 28266072 */  paddub      $4, $19, $0
/* 00E150 01DB9E50 282E4070 */  paddub      $5, $2, $0
/* 00E154 01DB9E54 4840040C */  jal         dpdiv
/* 00E158 01DB9E58 00000000 */   nop
/* 00E15C 01DB9E5C 28264070 */  paddub      $4, $2, $0
/* 00E160 01DB9E60 9241040C */  jal         dptofp
/* 00E164 01DB9E64 00000000 */   nop
/* 00E168 01DB9E68 000EA0E7 */  swc1        $f0, 0xE00($29)
/* 00E16C 01DB9E6C 28264072 */  paddub      $4, $18, $0
/* 00E170 01DB9E70 9241040C */  jal         dptofp
/* 00E174 01DB9E74 00000000 */   nop
/* 00E178 01DB9E78 040EA0E7 */  swc1        $f0, 0xE04($29)
/* 00E17C 01DB9E7C 28268072 */  paddub      $4, $20, $0
/* 00E180 01DB9E80 9241040C */  jal         dptofp
/* 00E184 01DB9E84 00000000 */   nop
/* 00E188 01DB9E88 080EA0E7 */  swc1        $f0, 0xE08($29)
/* 00E18C 01DB9E8C 2826A072 */  paddub      $4, $21, $0
/* 00E190 01DB9E90 000EA527 */  addiu       $5, $29, 0xE00
/* 00E194 01DB9E94 A000B98E */  lw          $25, 0xA0($21)
/* 00E198 01DB9E98 2C00398F */  lw          $25, 0x2C($25)
/* 00E19C 01DB9E9C 09F82003 */  jalr        $25
/* 00E1A0 01DB9EA0 00000000 */   nop
/* 00E1A4 01DB9EA4 01003126 */  addiu       $17, $17, 0x1
.L01DB9EA8_2BF6A8:
/* 00E1A8 01DB9EA8 1700222A */  slti        $2, $17, 0x17
/* 00E1AC 01DB9EAC 51FF4014 */  bnez        $2, .L01DB9BF4_2BF3F4
/* 00E1B0 01DB9EB0 00000000 */   nop
/* 00E1B4 01DB9EB4 948B858F */  lw          $5, -0x746C($28)
/* 00E1B8 01DB9EB8 DE01023C */  lui         $2, %hi(LIT_530__3)
/* 00E1BC 01DB9EBC A0E94424 */  addiu       $4, $2, %lo(LIT_530__3)
/* 00E1C0 01DB9EC0 28360070 */  paddub      $6, $0, $0
/* 00E1C4 01DB9EC4 D8FC040C */  jal         LoadFile__FPcPvPi
/* 00E1C8 01DB9EC8 00000000 */   nop
/* 00E1CC 01DB9ECC DF01013C */  lui         $1, %hi(CharaDataBuffer__2 + 0x68)
/* 00E1D0 01DB9ED0 68FE20AC */  sw          $0, %lo(CharaDataBuffer__2 + 0x68)($1)
/* 00E1D4 01DB9ED4 E001023C */  lui         $2, %hi(MainMonstorUnit + 0x1640)
/* 00E1D8 01DB9ED8 109E4424 */  addiu       $4, $2, %lo(MainMonstorUnit + 0x1640)
/* 00E1DC 01DB9EDC 948B858F */  lw          $5, -0x746C($28)
/* 00E1E0 01DB9EE0 DE01023C */  lui         $2, %hi(LIT_531__4)
/* 00E1E4 01DB9EE4 B8E94624 */  addiu       $6, $2, %lo(LIT_531__4)
/* 00E1E8 01DB9EE8 DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x60)
/* 00E1EC 01DB9EEC 60FE4724 */  addiu       $7, $2, %lo(CharaDataBuffer__2 + 0x60)
/* 00E1F0 01DB9EF0 28460070 */  paddub      $8, $0, $0
/* 00E1F4 01DB9EF4 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 00E1F8 01DB9EF8 00000000 */   nop
/* 00E1FC 01DB9EFC 700DA427 */  addiu       $4, $29, 0xD70
/* 00E200 01DB9F00 509F040C */  jal         __ct__10CFrameAttrFv
/* 00E204 01DB9F04 00000000 */   nop
/* 00E208 01DB9F08 780DA0A3 */  sb          $0, 0xD78($29)
/* 00E20C 01DB9F0C E001013C */  lui         $1, %hi(MainMonstorUnit + 0x16FC)
/* 00E210 01DB9F10 CC9E248C */  lw          $4, %lo(MainMonstorUnit + 0x16FC)($1)
/* 00E214 01DB9F14 700DA527 */  addiu       $5, $29, 0xD70
/* 00E218 01DB9F18 01000624 */  addiu       $6, $0, 0x1
/* 00E21C 01DB9F1C 04000724 */  addiu       $7, $0, 0x4
/* 00E220 01DB9F20 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 00E224 01DB9F24 00000000 */   nop
/* 00E228 01DB9F28 2041023C */  lui         $2, (0x41200000 >> 16)
/* 00E22C 01DB9F2C E001013C */  lui         $1, %hi(MainMonstorUnit + 0x1930)
/* 00E230 01DB9F30 00A122AC */  sw          $2, %lo(MainMonstorUnit + 0x1930)($1)
/* 00E234 01DB9F34 948280C7 */  lwc1        $f0, -0x7D6C($28)
/* 00E238 01DB9F38 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x1938)
/* 00E23C 01DB9F3C 08A120E4 */  swc1        $f0, %lo(MainMonstorUnit + 0x1938)($1)
/* 00E240 01DB9F40 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x1944)
/* 00E244 01DB9F44 14A120AC */  sw          $0, %lo(MainMonstorUnit + 0x1944)($1)
/* 00E248 01DB9F48 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x1948)
/* 00E24C 01DB9F4C 18A120AC */  sw          $0, %lo(MainMonstorUnit + 0x1948)($1)
/* 00E250 01DB9F50 E301023C */  lui         $2, %hi(Fuusya)
/* 00E254 01DB9F54 00A24424 */  addiu       $4, $2, %lo(Fuusya)
/* 00E258 01DB9F58 2497050C */  jal         Initialize__13OBJ_ANIME_SEQFv
/* 00E25C 01DB9F5C 00000000 */   nop
/* 00E260 01DB9F60 E301013C */  lui         $1, %hi(Fuusya + 0x10)
/* 00E264 01DB9F64 10A220AC */  sw          $0, %lo(Fuusya + 0x10)($1)
/* 00E268 01DB9F68 E301013C */  lui         $1, %hi(Fuusya + 0x14)
/* 00E26C 01DB9F6C 14A220AC */  sw          $0, %lo(Fuusya + 0x14)($1)
/* 00E270 01DB9F70 E301013C */  lui         $1, %hi(Fuusya + 0x28)
/* 00E274 01DB9F74 28A220AC */  sw          $0, %lo(Fuusya + 0x28)($1)
/* 00E278 01DB9F78 E301013C */  lui         $1, %hi(Fuusya + 0x24)
/* 00E27C 01DB9F7C 24A220AC */  sw          $0, %lo(Fuusya + 0x24)($1)
/* 00E280 01DB9F80 E301013C */  lui         $1, %hi(Fuusya + 0x20)
/* 00E284 01DB9F84 20A220AC */  sw          $0, %lo(Fuusya + 0x20)($1)
/* 00E288 01DB9F88 E301013C */  lui         $1, %hi(Fuusya + 0x38)
/* 00E28C 01DB9F8C 38A220AC */  sw          $0, %lo(Fuusya + 0x38)($1)
/* 00E290 01DB9F90 E301013C */  lui         $1, %hi(Fuusya + 0x34)
/* 00E294 01DB9F94 34A220AC */  sw          $0, %lo(Fuusya + 0x34)($1)
/* 00E298 01DB9F98 E301013C */  lui         $1, %hi(Fuusya + 0x30)
/* 00E29C 01DB9F9C 30A220AC */  sw          $0, %lo(Fuusya + 0x30)($1)
/* 00E2A0 01DB9FA0 E301013C */  lui         $1, %hi(Fuusya + 0x44)
/* 00E2A4 01DB9FA4 44A220AC */  sw          $0, %lo(Fuusya + 0x44)($1)
/* 00E2A8 01DB9FA8 E301013C */  lui         $1, %hi(Fuusya + 0x40)
/* 00E2AC 01DB9FAC 40A220AC */  sw          $0, %lo(Fuusya + 0x40)($1)
/* 00E2B0 01DB9FB0 00BF023C */  lui         $2, (0xBF000000 >> 16)
/* 00E2B4 01DB9FB4 E301013C */  lui         $1, %hi(Fuusya + 0x48)
/* 00E2B8 01DB9FB8 48A222AC */  sw          $2, %lo(Fuusya + 0x48)($1)
/* 00E2BC 01DB9FBC E301023C */  lui         $2, %hi(Fuusya)
/* 00E2C0 01DB9FC0 00A24424 */  addiu       $4, $2, %lo(Fuusya)
/* 00E2C4 01DB9FC4 DE01023C */  lui         $2, %hi(LIT_533__2)
/* 00E2C8 01DB9FC8 C8E94524 */  addiu       $5, $2, %lo(LIT_533__2)
/* 00E2CC 01DB9FCC 5A15040C */  jal         strcpy
/* 00E2D0 01DB9FD0 00000000 */   nop
/* 00E2D4 01DB9FD4 A899848F */  lw          $4, -0x6658($28)
/* 00E2D8 01DB9FD8 E301023C */  lui         $2, %hi(Fuusya)
/* 00E2DC 01DB9FDC 00A24524 */  addiu       $5, $2, %lo(Fuusya)
/* 00E2E0 01DB9FE0 4097050C */  jal         InitObjAnime__FP6CFrameP13OBJ_ANIME_SEQ
/* 00E2E4 01DB9FE4 00000000 */   nop
/* 00E2E8 01DB9FE8 E301023C */  lui         $2, %hi(Fuusya + 0x90)
/* 00E2EC 01DB9FEC 90A24424 */  addiu       $4, $2, %lo(Fuusya + 0x90)
/* 00E2F0 01DB9FF0 2497050C */  jal         Initialize__13OBJ_ANIME_SEQFv
/* 00E2F4 01DB9FF4 00000000 */   nop
/* 00E2F8 01DB9FF8 E301013C */  lui         $1, %hi(Fuusya + 0xA0)
/* 00E2FC 01DB9FFC A0A220AC */  sw          $0, %lo(Fuusya + 0xA0)($1)
/* 00E300 01DBA000 E301013C */  lui         $1, %hi(Fuusya + 0xA4)
/* 00E304 01DBA004 A4A220AC */  sw          $0, %lo(Fuusya + 0xA4)($1)
/* 00E308 01DBA008 E301013C */  lui         $1, %hi(Fuusya + 0xB8)
/* 00E30C 01DBA00C B8A220AC */  sw          $0, %lo(Fuusya + 0xB8)($1)
/* 00E310 01DBA010 E301013C */  lui         $1, %hi(Fuusya + 0xB4)
/* 00E314 01DBA014 B4A220AC */  sw          $0, %lo(Fuusya + 0xB4)($1)
/* 00E318 01DBA018 E301013C */  lui         $1, %hi(Fuusya + 0xB0)
/* 00E31C 01DBA01C B0A220AC */  sw          $0, %lo(Fuusya + 0xB0)($1)
/* 00E320 01DBA020 E301013C */  lui         $1, %hi(Fuusya + 0xC8)
/* 00E324 01DBA024 C8A220AC */  sw          $0, %lo(Fuusya + 0xC8)($1)
/* 00E328 01DBA028 E301013C */  lui         $1, %hi(Fuusya + 0xC4)
/* 00E32C 01DBA02C C4A220AC */  sw          $0, %lo(Fuusya + 0xC4)($1)
/* 00E330 01DBA030 E301013C */  lui         $1, %hi(Fuusya + 0xC0)
/* 00E334 01DBA034 C0A220AC */  sw          $0, %lo(Fuusya + 0xC0)($1)
/* 00E338 01DBA038 E301013C */  lui         $1, %hi(Fuusya + 0xD4)
/* 00E33C 01DBA03C D4A220AC */  sw          $0, %lo(Fuusya + 0xD4)($1)
/* 00E340 01DBA040 E301013C */  lui         $1, %hi(Fuusya + 0xD0)
/* 00E344 01DBA044 D0A220AC */  sw          $0, %lo(Fuusya + 0xD0)($1)
/* 00E348 01DBA048 00BF023C */  lui         $2, (0xBF000000 >> 16)
/* 00E34C 01DBA04C E301013C */  lui         $1, %hi(Fuusya + 0xD8)
/* 00E350 01DBA050 D8A222AC */  sw          $2, %lo(Fuusya + 0xD8)($1)
/* 00E354 01DBA054 E301023C */  lui         $2, %hi(Fuusya + 0x90)
/* 00E358 01DBA058 90A24424 */  addiu       $4, $2, %lo(Fuusya + 0x90)
/* 00E35C 01DBA05C DE01023C */  lui         $2, %hi(LIT_533__2)
/* 00E360 01DBA060 C8E94524 */  addiu       $5, $2, %lo(LIT_533__2)
/* 00E364 01DBA064 5A15040C */  jal         strcpy
/* 00E368 01DBA068 00000000 */   nop
/* 00E36C 01DBA06C AC99848F */  lw          $4, -0x6654($28)
/* 00E370 01DBA070 E301023C */  lui         $2, %hi(Fuusya + 0x90)
/* 00E374 01DBA074 90A24524 */  addiu       $5, $2, %lo(Fuusya + 0x90)
/* 00E378 01DBA078 4097050C */  jal         InitObjAnime__FP6CFrameP13OBJ_ANIME_SEQ
/* 00E37C 01DBA07C 00000000 */   nop
/* 00E380 01DBA080 28860070 */  paddub      $16, $0, $0
/* 00E384 01DBA084 3C000010 */  b           .L01DBA178_2BF978
/* 00E388 01DBA088 00000000 */   nop
.L01DBA08C_2BF88C:
/* 00E38C 01DBA08C C0101000 */  sll         $2, $16, 3
/* 00E390 01DBA090 21105000 */  addu        $2, $2, $16
/* 00E394 01DBA094 00890200 */  sll         $17, $2, 4
/* 00E398 01DBA098 E301023C */  lui         $2, %hi(Taimatsu)
/* 00E39C 01DBA09C 80A34224 */  addiu       $2, $2, %lo(Taimatsu)
/* 00E3A0 01DBA0A0 21905100 */  addu        $18, $2, $17
/* 00E3A4 01DBA0A4 28264072 */  paddub      $4, $18, $0
/* 00E3A8 01DBA0A8 2497050C */  jal         Initialize__13OBJ_ANIME_SEQFv
/* 00E3AC 01DBA0AC 00000000 */   nop
/* 00E3B0 01DBA0B0 03000324 */  addiu       $3, $0, 0x3
/* 00E3B4 01DBA0B4 E301023C */  lui         $2, %hi(Taimatsu + 0x10)
/* 00E3B8 01DBA0B8 90A34224 */  addiu       $2, $2, %lo(Taimatsu + 0x10)
/* 00E3BC 01DBA0BC 21105100 */  addu        $2, $2, $17
/* 00E3C0 01DBA0C0 000043AC */  sw          $3, 0x0($2)
/* 00E3C4 01DBA0C4 04000324 */  addiu       $3, $0, 0x4
/* 00E3C8 01DBA0C8 E301023C */  lui         $2, %hi(Taimatsu + 0x14)
/* 00E3CC 01DBA0CC 94A34224 */  addiu       $2, $2, %lo(Taimatsu + 0x14)
/* 00E3D0 01DBA0D0 21105100 */  addu        $2, $2, $17
/* 00E3D4 01DBA0D4 000043AC */  sw          $3, 0x0($2)
/* 00E3D8 01DBA0D8 A042033C */  lui         $3, (0x42A00000 >> 16)
/* 00E3DC 01DBA0DC E301023C */  lui         $2, %hi(Taimatsu + 0x28)
/* 00E3E0 01DBA0E0 A8A34224 */  addiu       $2, $2, %lo(Taimatsu + 0x28)
/* 00E3E4 01DBA0E4 21105100 */  addu        $2, $2, $17
/* 00E3E8 01DBA0E8 000043AC */  sw          $3, 0x0($2)
/* 00E3EC 01DBA0EC E301023C */  lui         $2, %hi(Taimatsu + 0x24)
/* 00E3F0 01DBA0F0 A4A34224 */  addiu       $2, $2, %lo(Taimatsu + 0x24)
/* 00E3F4 01DBA0F4 21105100 */  addu        $2, $2, $17
/* 00E3F8 01DBA0F8 000043AC */  sw          $3, 0x0($2)
/* 00E3FC 01DBA0FC E301023C */  lui         $2, %hi(Taimatsu + 0x20)
/* 00E400 01DBA100 A0A34224 */  addiu       $2, $2, %lo(Taimatsu + 0x20)
/* 00E404 01DBA104 21105100 */  addu        $2, $2, $17
/* 00E408 01DBA108 000043AC */  sw          $3, 0x0($2)
/* 00E40C 01DBA10C 0043033C */  lui         $3, (0x43000000 >> 16)
/* 00E410 01DBA110 E301023C */  lui         $2, %hi(Taimatsu + 0x38)
/* 00E414 01DBA114 B8A34224 */  addiu       $2, $2, %lo(Taimatsu + 0x38)
/* 00E418 01DBA118 21105100 */  addu        $2, $2, $17
/* 00E41C 01DBA11C 000043AC */  sw          $3, 0x0($2)
/* 00E420 01DBA120 E301023C */  lui         $2, %hi(Taimatsu + 0x34)
/* 00E424 01DBA124 B4A34224 */  addiu       $2, $2, %lo(Taimatsu + 0x34)
/* 00E428 01DBA128 21105100 */  addu        $2, $2, $17
/* 00E42C 01DBA12C 000043AC */  sw          $3, 0x0($2)
/* 00E430 01DBA130 E301023C */  lui         $2, %hi(Taimatsu + 0x30)
/* 00E434 01DBA134 B0A34224 */  addiu       $2, $2, %lo(Taimatsu + 0x30)
/* 00E438 01DBA138 21105100 */  addu        $2, $2, $17
/* 00E43C 01DBA13C 000043AC */  sw          $3, 0x0($2)
/* 00E440 01DBA140 28264072 */  paddub      $4, $18, $0
/* 00E444 01DBA144 DE01023C */  lui         $2, %hi(LIT_534__3)
/* 00E448 01DBA148 D0E94524 */  addiu       $5, $2, %lo(LIT_534__3)
/* 00E44C 01DBA14C 5A15040C */  jal         strcpy
/* 00E450 01DBA150 00000000 */   nop
/* 00E454 01DBA154 80181000 */  sll         $3, $16, 2
/* 00E458 01DBA158 E301023C */  lui         $2, %hi(TaimatsuFrame)
/* 00E45C 01DBA15C 50A34224 */  addiu       $2, $2, %lo(TaimatsuFrame)
/* 00E460 01DBA160 21104300 */  addu        $2, $2, $3
/* 00E464 01DBA164 0000448C */  lw          $4, 0x0($2)
/* 00E468 01DBA168 282E4072 */  paddub      $5, $18, $0
/* 00E46C 01DBA16C 4097050C */  jal         InitObjAnime__FP6CFrameP13OBJ_ANIME_SEQ
/* 00E470 01DBA170 00000000 */   nop
/* 00E474 01DBA174 01001026 */  addiu       $16, $16, 0x1
.L01DBA178_2BF978:
/* 00E478 01DBA178 0C00032A */  slti        $3, $16, 0xC
/* 00E47C 01DBA17C C3FF6014 */  bnez        $3, .L01DBA08C_2BF88C
/* 00E480 01DBA180 00000000 */   nop
/* 00E484 01DBA184 B09980AF */  sw          $0, -0x6650($28)
/* 00E488 01DBA188 DE01013C */  lui         $1, %hi(CScript__2 + 0x20)
/* 00E48C 01DBA18C 201B20AC */  sw          $0, %lo(CScript__2 + 0x20)($1)
/* 00E490 01DBA190 7000BF7B */  lq          $31, 0x70($29)
/* 00E494 01DBA194 6000B67B */  lq          $22, 0x60($29)
/* 00E498 01DBA198 5000B57B */  lq          $21, 0x50($29)
/* 00E49C 01DBA19C 4000B47B */  lq          $20, 0x40($29)
/* 00E4A0 01DBA1A0 3000B37B */  lq          $19, 0x30($29)
/* 00E4A4 01DBA1A4 2000B27B */  lq          $18, 0x20($29)
/* 00E4A8 01DBA1A8 1000B17B */  lq          $17, 0x10($29)
/* 00E4AC 01DBA1AC 0000B07B */  lq          $16, 0x0($29)
/* 00E4B0 01DBA1B0 100EBD27 */  addiu       $29, $29, 0xE10
/* 00E4B4 01DBA1B4 0800E003 */  jr          $31
/* 00E4B8 01DBA1B8 00000000 */   nop
/* 00E4BC 01DBA1BC 00000000 */  nop
