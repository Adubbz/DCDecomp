.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel topStatusInfo__Fiii
/* 0B05F0 001B04F0 E0FABD27 */  addiu       $29, $29, -0x520
/* 0B05F4 001B04F4 A000BF7F */  sq          $31, 0xA0($29)
/* 0B05F8 001B04F8 9000BE7F */  sq          $30, 0x90($29)
/* 0B05FC 001B04FC 8000B77F */  sq          $23, 0x80($29)
/* 0B0600 001B0500 7000B67F */  sq          $22, 0x70($29)
/* 0B0604 001B0504 6000B57F */  sq          $21, 0x60($29)
/* 0B0608 001B0508 5000B47F */  sq          $20, 0x50($29)
/* 0B060C 001B050C 4000B37F */  sq          $19, 0x40($29)
/* 0B0610 001B0510 3000B27F */  sq          $18, 0x30($29)
/* 0B0614 001B0514 2000B17F */  sq          $17, 0x20($29)
/* 0B0618 001B0518 1000B07F */  sq          $16, 0x10($29)
/* 0B061C 001B051C 0800B6E7 */  swc1        $f22, 0x8($29)
/* 0B0620 001B0520 0400B5E7 */  swc1        $f21, 0x4($29)
/* 0B0624 001B0524 0000B4E7 */  swc1        $f20, 0x0($29)
/* 0B0628 001B0528 28AE8070 */  paddub      $21, $4, $0
/* 0B062C 001B052C 28A6A070 */  paddub      $20, $5, $0
/* 0B0630 001B0530 BC00A6AF */  sw          $6, 0xBC($29)
/* 0B0634 001B0534 F6FFB526 */  addiu       $21, $21, -0xA
/* 0B0638 001B0538 DC01013C */  lui         $1, %hi(BtActStatus + 0x146)
/* 0B063C 001B053C C6452284 */  lh          $2, %lo(BtActStatus + 0x146)($1)
/* 0B0640 001B0540 21A8A202 */  addu        $21, $21, $2
/* 0B0644 001B0544 C701023C */  lui         $2, %hi(TexManager)
/* 0B0648 001B0548 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0B064C 001B054C 2A00023C */  lui         $2, %hi(LIT_1150)
/* 0B0650 001B0550 50B54524 */  addiu       $5, $2, %lo(LIT_1150)
/* 0B0654 001B0554 FFFF0624 */  addiu       $6, $0, -0x1
/* 0B0658 001B0558 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0B065C 001B055C 00000000 */   nop
/* 0B0660 001B0560 288E4070 */  paddub      $17, $2, $0
/* 0B0664 001B0564 C701023C */  lui         $2, %hi(TexManager)
/* 0B0668 001B0568 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0B066C 001B056C 2A00023C */  lui         $2, %hi(LIT_778)
/* 0B0670 001B0570 40B54524 */  addiu       $5, $2, %lo(LIT_778)
/* 0B0674 001B0574 FFFF0624 */  addiu       $6, $0, -0x1
/* 0B0678 001B0578 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0B067C 001B057C 00000000 */   nop
/* 0B0680 001B0580 28964070 */  paddub      $18, $2, $0
/* 0B0684 001B0584 789C838F */  lw          $3, -0x6388($28)
/* 0B0688 001B0588 04006280 */  lb          $2, 0x4($3)
/* 0B068C 001B058C 40100200 */  sll         $2, $2, 1
/* 0B0690 001B0590 21184300 */  addu        $3, $2, $3
/* 0B0694 001B0594 12006284 */  lh          $2, 0x12($3)
/* 0B0698 001B0598 00008244 */  mtc1        $2, $f0
/* 0B069C 001B059C 00000000 */  nop
/* 0B06A0 001B05A0 20058046 */  cvt.s.w     $f20, $f0
/* 0B06A4 001B05A4 06006284 */  lh          $2, 0x6($3)
/* 0B06A8 001B05A8 00008244 */  mtc1        $2, $f0
/* 0B06AC 001B05AC 00000000 */  nop
/* 0B06B0 001B05B0 60058046 */  cvt.s.w     $f21, $f0
/* 0B06B4 001B05B4 108680C7 */  lwc1        $f0, -0x79F0($28)
/* 0B06B8 001B05B8 02031546 */  mul.s       $f12, $f0, $f21
/* 0B06BC 001B05BC 2C44040C */  jal         fptosi
/* 0B06C0 001B05C0 00000000 */   nop
/* 0B06C4 001B05C4 02004128 */  slti        $1, $2, 0x2
/* 0B06C8 001B05C8 02002010 */  beqz        $1, .L001B05D4
/* 0B06CC 001B05CC 00000000 */   nop
/* 0B06D0 001B05D0 02000224 */  addiu       $2, $0, 0x2
.L001B05D4:
/* 0B06D4 001B05D4 83100200 */  sra         $2, $2, 2
/* 0B06D8 001B05D8 01005324 */  addiu       $19, $2, 0x1
/* 0B06DC 001B05DC 0200612A */  slti        $1, $19, 0x2
/* 0B06E0 001B05E0 02002010 */  beqz        $1, .L001B05EC
/* 0B06E4 001B05E4 00000000 */   nop
/* 0B06E8 001B05E8 02001324 */  addiu       $19, $0, 0x2
.L001B05EC:
/* 0B06EC 001B05EC 80001024 */  addiu       $16, $0, 0x80
/* 0B06F0 001B05F0 1C8580C7 */  lwc1        $f0, -0x7AE4($28)
/* 0B06F4 001B05F4 02001546 */  mul.s       $f0, $f0, $f21
/* 0B06F8 001B05F8 36A00046 */  c.le.s      $f20, $f0
/* 0B06FC 001B05FC 00000000 */  nop
/* 0B0700 001B0600 03000045 */  bc1f        .L001B0610
/* 0B0704 001B0604 00000000 */   nop
/* 0B0708 001B0608 A093908F */  lw          $16, -0x6C60($28)
/* 0B070C 001B060C 00000000 */  nop
.L001B0610:
/* 0B0710 001B0610 28260070 */  paddub      $4, $0, $0
/* 0B0714 001B0614 06AB0046 */  mov.s       $f12, $f21
/* 0B0718 001B0618 46A30046 */  mov.s       $f13, $f20
/* 0B071C 001B061C FCC0060C */  jal         BtGetStatusPal__Fiff
/* 0B0720 001B0620 00000000 */   nop
/* 0B0724 001B0624 28BE4070 */  paddub      $23, $2, $0
/* 0B0728 001B0628 28260070 */  paddub      $4, $0, $0
/* 0B072C 001B062C 06AB0046 */  mov.s       $f12, $f21
/* 0B0730 001B0630 46A30046 */  mov.s       $f13, $f20
/* 0B0734 001B0634 1CC1060C */  jal         BtGetStatusPal2__Fiff
/* 0B0738 001B0638 00000000 */   nop
/* 0B073C 001B063C 28B64070 */  paddub      $22, $2, $0
/* 0B0740 001B0640 68000224 */  addiu       $2, $0, 0x68
/* 0B0744 001B0644 D000A2AF */  sw          $2, 0xD0($29)
/* 0B0748 001B0648 70000224 */  addiu       $2, $0, 0x70
/* 0B074C 001B064C D400A2AF */  sw          $2, 0xD4($29)
/* 0B0750 001B0650 04000424 */  addiu       $4, $0, 0x4
/* 0B0754 001B0654 D800A4AF */  sw          $4, 0xD8($29)
/* 0B0758 001B0658 10000324 */  addiu       $3, $0, 0x10
/* 0B075C 001B065C DC00A3AF */  sw          $3, 0xDC($29)
/* 0B0760 001B0660 30000224 */  addiu       $2, $0, 0x30
/* 0B0764 001B0664 C000A2AF */  sw          $2, 0xC0($29)
/* 0B0768 001B0668 C400B5AF */  sw          $21, 0xC4($29)
/* 0B076C 001B066C C800A4AF */  sw          $4, 0xC8($29)
/* 0B0770 001B0670 CC00A3AF */  sw          $3, 0xCC($29)
/* 0B0774 001B0674 FF000832 */  andi        $8, $16, 0xFF
/* 0B0778 001B0678 D48B848F */  lw          $4, -0x742C($28)
/* 0B077C 001B067C 282E2072 */  paddub      $5, $17, $0
/* 0B0780 001B0680 C000A627 */  addiu       $6, $29, 0xC0
/* 0B0784 001B0684 D000A727 */  addiu       $7, $29, 0xD0
/* 0B0788 001B0688 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 0B078C 001B068C 00000000 */   nop
/* 0B0790 001B0690 28F60070 */  paddub      $30, $0, $0
/* 0B0794 001B0694 17000010 */  b           .L001B06F4
/* 0B0798 001B0698 00000000 */   nop
.L001B069C:
/* 0B079C 001B069C 6C000224 */  addiu       $2, $0, 0x6C
/* 0B07A0 001B06A0 F000A2AF */  sw          $2, 0xF0($29)
/* 0B07A4 001B06A4 70000224 */  addiu       $2, $0, 0x70
/* 0B07A8 001B06A8 F400A2AF */  sw          $2, 0xF4($29)
/* 0B07AC 001B06AC 04000424 */  addiu       $4, $0, 0x4
/* 0B07B0 001B06B0 F800A4AF */  sw          $4, 0xF8($29)
/* 0B07B4 001B06B4 10000324 */  addiu       $3, $0, 0x10
/* 0B07B8 001B06B8 FC00A3AF */  sw          $3, 0xFC($29)
/* 0B07BC 001B06BC 80101E00 */  sll         $2, $30, 2
/* 0B07C0 001B06C0 34004224 */  addiu       $2, $2, 0x34
/* 0B07C4 001B06C4 E000A2AF */  sw          $2, 0xE0($29)
/* 0B07C8 001B06C8 E400B5AF */  sw          $21, 0xE4($29)
/* 0B07CC 001B06CC E800A4AF */  sw          $4, 0xE8($29)
/* 0B07D0 001B06D0 EC00A3AF */  sw          $3, 0xEC($29)
/* 0B07D4 001B06D4 FF000832 */  andi        $8, $16, 0xFF
/* 0B07D8 001B06D8 D48B848F */  lw          $4, -0x742C($28)
/* 0B07DC 001B06DC 282E2072 */  paddub      $5, $17, $0
/* 0B07E0 001B06E0 E000A627 */  addiu       $6, $29, 0xE0
/* 0B07E4 001B06E4 F000A727 */  addiu       $7, $29, 0xF0
/* 0B07E8 001B06E8 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 0B07EC 001B06EC 00000000 */   nop
/* 0B07F0 001B06F0 0100DE27 */  addiu       $30, $30, 0x1
.L001B06F4:
/* 0B07F4 001B06F4 FEFF6226 */  addiu       $2, $19, -0x2
/* 0B07F8 001B06F8 2A10C203 */  slt         $2, $30, $2
/* 0B07FC 001B06FC E7FF4014 */  bnez        $2, .L001B069C
/* 0B0800 001B0700 00000000 */   nop
/* 0B0804 001B0704 70000224 */  addiu       $2, $0, 0x70
/* 0B0808 001B0708 1001A2AF */  sw          $2, 0x110($29)
/* 0B080C 001B070C 1401A2AF */  sw          $2, 0x114($29)
/* 0B0810 001B0710 04000424 */  addiu       $4, $0, 0x4
/* 0B0814 001B0714 1801A4AF */  sw          $4, 0x118($29)
/* 0B0818 001B0718 10000324 */  addiu       $3, $0, 0x10
/* 0B081C 001B071C 1C01A3AF */  sw          $3, 0x11C($29)
/* 0B0820 001B0720 FFFF6226 */  addiu       $2, $19, -0x1
/* 0B0824 001B0724 80980200 */  sll         $19, $2, 2
/* 0B0828 001B0728 30006226 */  addiu       $2, $19, 0x30
/* 0B082C 001B072C 0001A2AF */  sw          $2, 0x100($29)
/* 0B0830 001B0730 0401B5AF */  sw          $21, 0x104($29)
/* 0B0834 001B0734 0801A4AF */  sw          $4, 0x108($29)
/* 0B0838 001B0738 0C01A3AF */  sw          $3, 0x10C($29)
/* 0B083C 001B073C FF000832 */  andi        $8, $16, 0xFF
/* 0B0840 001B0740 D48B848F */  lw          $4, -0x742C($28)
/* 0B0844 001B0744 282E2072 */  paddub      $5, $17, $0
/* 0B0848 001B0748 0001A627 */  addiu       $6, $29, 0x100
/* 0B084C 001B074C 1001A727 */  addiu       $7, $29, 0x110
/* 0B0850 001B0750 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 0B0854 001B0754 00000000 */   nop
/* 0B0858 001B0758 00008044 */  mtc1        $0, $f0
/* 0B085C 001B075C 00000000 */  nop
/* 0B0860 001B0760 36A00046 */  c.le.s      $f20, $f0
/* 0B0864 001B0764 00000000 */  nop
/* 0B0868 001B0768 15000145 */  bc1t        .L001B07C0
/* 0B086C 001B076C 00000000 */   nop
/* 0B0870 001B0770 108680C7 */  lwc1        $f0, -0x79F0($28)
/* 0B0874 001B0774 02031446 */  mul.s       $f12, $f0, $f20
/* 0B0878 001B0778 2C44040C */  jal         fptosi
/* 0B087C 001B077C 00000000 */   nop
/* 0B0880 001B0780 34000324 */  addiu       $3, $0, 0x34
/* 0B0884 001B0784 2001A3AF */  sw          $3, 0x120($29)
/* 0B0888 001B0788 0500A326 */  addiu       $3, $21, 0x5
/* 0B088C 001B078C 2401A3AF */  sw          $3, 0x124($29)
/* 0B0890 001B0790 FEFF4224 */  addiu       $2, $2, -0x2
/* 0B0894 001B0794 2801A2AF */  sw          $2, 0x128($29)
/* 0B0898 001B0798 06000224 */  addiu       $2, $0, 0x6
/* 0B089C 001B079C 2C01A2AF */  sw          $2, 0x12C($29)
/* 0B08A0 001B07A0 D48B848F */  lw          $4, -0x742C($28)
/* 0B08A4 001B07A4 2001A527 */  addiu       $5, $29, 0x120
/* 0B08A8 001B07A8 2836E072 */  paddub      $6, $23, $0
/* 0B08AC 001B07AC 283EC072 */  paddub      $7, $22, $0
/* 0B08B0 001B07B0 2846E072 */  paddub      $8, $23, $0
/* 0B08B4 001B07B4 284EC072 */  paddub      $9, $22, $0
/* 0B08B8 001B07B8 4878050C */  jal         set2DSpriteC4__FP13sceVif1PacketRC8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBA
/* 0B08BC 001B07BC 00000000 */   nop
.L001B07C0:
/* 0B08C0 001B07C0 38007326 */  addiu       $19, $19, 0x38
/* 0B08C4 001B07C4 06A30046 */  mov.s       $f12, $f20
/* 0B08C8 001B07C8 2C44040C */  jal         fptosi
/* 0B08CC 001B07CC 00000000 */   nop
/* 0B08D0 001B07D0 0700A526 */  addiu       $5, $21, 0x7
/* 0B08D4 001B07D4 FF000832 */  andi        $8, $16, 0xFF
/* 0B08D8 001B07D8 28266072 */  paddub      $4, $19, $0
/* 0B08DC 001B07DC 28364070 */  paddub      $6, $2, $0
/* 0B08E0 001B07E0 283E0070 */  paddub      $7, $0, $0
/* 0B08E4 001B07E4 18C0060C */  jal         ValuePrint__FiiiiUc
/* 0B08E8 001B07E8 00000000 */   nop
/* 0B08EC 001B07EC 80180200 */  sll         $3, $2, 2
/* 0B08F0 001B07F0 21106200 */  addu        $2, $3, $2
/* 0B08F4 001B07F4 40100200 */  sll         $2, $2, 1
/* 0B08F8 001B07F8 21986202 */  addu        $19, $19, $2
/* 0B08FC 001B07FC 78000224 */  addiu       $2, $0, 0x78
/* 0B0900 001B0800 4001A2AF */  sw          $2, 0x140($29)
/* 0B0904 001B0804 B0000224 */  addiu       $2, $0, 0xB0
/* 0B0908 001B0808 4401A2AF */  sw          $2, 0x144($29)
/* 0B090C 001B080C 0C000324 */  addiu       $3, $0, 0xC
/* 0B0910 001B0810 4801A3AF */  sw          $3, 0x148($29)
/* 0B0914 001B0814 4C01A3AF */  sw          $3, 0x14C($29)
/* 0B0918 001B0818 3001B3AF */  sw          $19, 0x130($29)
/* 0B091C 001B081C 0700A226 */  addiu       $2, $21, 0x7
/* 0B0920 001B0820 3401A2AF */  sw          $2, 0x134($29)
/* 0B0924 001B0824 3801A3AF */  sw          $3, 0x138($29)
/* 0B0928 001B0828 3C01A3AF */  sw          $3, 0x13C($29)
/* 0B092C 001B082C FF000832 */  andi        $8, $16, 0xFF
/* 0B0930 001B0830 D48B848F */  lw          $4, -0x742C($28)
/* 0B0934 001B0834 282E4072 */  paddub      $5, $18, $0
/* 0B0938 001B0838 3001A627 */  addiu       $6, $29, 0x130
/* 0B093C 001B083C 4001A727 */  addiu       $7, $29, 0x140
/* 0B0940 001B0840 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 0B0944 001B0844 00000000 */   nop
/* 0B0948 001B0848 06AB0046 */  mov.s       $f12, $f21
/* 0B094C 001B084C 2C44040C */  jal         fptosi
/* 0B0950 001B0850 00000000 */   nop
/* 0B0954 001B0854 0A006426 */  addiu       $4, $19, 0xA
/* 0B0958 001B0858 0700A526 */  addiu       $5, $21, 0x7
/* 0B095C 001B085C FF000832 */  andi        $8, $16, 0xFF
/* 0B0960 001B0860 28364070 */  paddub      $6, $2, $0
/* 0B0964 001B0864 283E0070 */  paddub      $7, $0, $0
/* 0B0968 001B0868 18C0060C */  jal         ValuePrint__FiiiiUc
/* 0B096C 001B086C 00000000 */   nop
/* 0B0970 001B0870 40000224 */  addiu       $2, $0, 0x40
/* 0B0974 001B0874 6001A2AF */  sw          $2, 0x160($29)
/* 0B0978 001B0878 A0000224 */  addiu       $2, $0, 0xA0
/* 0B097C 001B087C 6401A2AF */  sw          $2, 0x164($29)
/* 0B0980 001B0880 10000324 */  addiu       $3, $0, 0x10
/* 0B0984 001B0884 6801A3AF */  sw          $3, 0x168($29)
/* 0B0988 001B0888 6C01A3AF */  sw          $3, 0x16C($29)
/* 0B098C 001B088C 20000224 */  addiu       $2, $0, 0x20
/* 0B0990 001B0890 5001A2AF */  sw          $2, 0x150($29)
/* 0B0994 001B0894 5401B5AF */  sw          $21, 0x154($29)
/* 0B0998 001B0898 5801A3AF */  sw          $3, 0x158($29)
/* 0B099C 001B089C 5C01A3AF */  sw          $3, 0x15C($29)
/* 0B09A0 001B08A0 FF000832 */  andi        $8, $16, 0xFF
/* 0B09A4 001B08A4 D48B848F */  lw          $4, -0x742C($28)
/* 0B09A8 001B08A8 282E2072 */  paddub      $5, $17, $0
/* 0B09AC 001B08AC 5001A627 */  addiu       $6, $29, 0x150
/* 0B09B0 001B08B0 6001A727 */  addiu       $7, $29, 0x160
/* 0B09B4 001B08B4 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 0B09B8 001B08B8 00000000 */   nop
/* 0B09BC 001B08BC 789C888F */  lw          $8, -0x6388($28)
/* 0B09C0 001B08C0 04000781 */  lb          $7, 0x4($8)
/* 0B09C4 001B08C4 40430225 */  addiu       $2, $8, 0x4340
/* 0B09C8 001B08C8 21104700 */  addu        $2, $2, $7
/* 0B09CC 001B08CC 00004380 */  lb          $3, 0x0($2)
/* 0B09D0 001B08D0 40110300 */  sll         $2, $3, 5
/* 0B09D4 001B08D4 23104300 */  subu        $2, $2, $3
/* 0B09D8 001B08D8 C0300200 */  sll         $6, $2, 3
/* 0B09DC 001B08DC A80A0324 */  addiu       $3, $0, 0xAA8
/* 0B09E0 001B08E0 1810E300 */  mult        $2, $7, $3
/* 0B09E4 001B08E4 21100201 */  addu        $2, $8, $2
/* 0B09E8 001B08E8 21104600 */  addu        $2, $2, $6
/* 0B09EC 001B08EC 18454284 */  lh          $2, 0x4518($2)
/* 0B09F0 001B08F0 00008244 */  mtc1        $2, $f0
/* 0B09F4 001B08F4 00000000 */  nop
/* 0B09F8 001B08F8 20058046 */  cvt.s.w     $f20, $f0
/* 0B09FC 001B08FC 1810E370 */  mult1       $2, $7, $3
/* 0B0A00 001B0900 21100201 */  addu        $2, $8, $2
/* 0B0A04 001B0904 21104600 */  addu        $2, $2, $6
/* 0B0A08 001B0908 1C4555C4 */  lwc1        $f21, 0x451C($2)
/* 0B0A0C 001B090C 148680C7 */  lwc1        $f0, -0x79EC($28)
/* 0B0A10 001B0910 82051446 */  mul.s       $f22, $f0, $f20
/* 0B0A14 001B0914 06B30046 */  mov.s       $f12, $f22
/* 0B0A18 001B0918 2C44040C */  jal         fptosi
/* 0B0A1C 001B091C 00000000 */   nop
/* 0B0A20 001B0920 02004128 */  slti        $1, $2, 0x2
/* 0B0A24 001B0924 02002010 */  beqz        $1, .L001B0930
/* 0B0A28 001B0928 00000000 */   nop
/* 0B0A2C 001B092C 02000224 */  addiu       $2, $0, 0x2
.L001B0930:
/* 0B0A30 001B0930 83100200 */  sra         $2, $2, 2
/* 0B0A34 001B0934 02005324 */  addiu       $19, $2, 0x2
/* 0B0A38 001B0938 0200612A */  slti        $1, $19, 0x2
/* 0B0A3C 001B093C 02002010 */  beqz        $1, .L001B0948
/* 0B0A40 001B0940 00000000 */   nop
/* 0B0A44 001B0944 02001324 */  addiu       $19, $0, 0x2
.L001B0948:
/* 0B0A48 001B0948 80001024 */  addiu       $16, $0, 0x80
/* 0B0A4C 001B094C 1C8580C7 */  lwc1        $f0, -0x7AE4($28)
/* 0B0A50 001B0950 02001446 */  mul.s       $f0, $f0, $f20
/* 0B0A54 001B0954 36A80046 */  c.le.s      $f21, $f0
/* 0B0A58 001B0958 00000000 */  nop
/* 0B0A5C 001B095C 03000045 */  bc1f        .L001B096C
/* 0B0A60 001B0960 00000000 */   nop
/* 0B0A64 001B0964 A093908F */  lw          $16, -0x6C60($28)
/* 0B0A68 001B0968 00000000 */  nop
.L001B096C:
/* 0B0A6C 001B096C 01000424 */  addiu       $4, $0, 0x1
/* 0B0A70 001B0970 06A30046 */  mov.s       $f12, $f20
/* 0B0A74 001B0974 46AB0046 */  mov.s       $f13, $f21
/* 0B0A78 001B0978 FCC0060C */  jal         BtGetStatusPal__Fiff
/* 0B0A7C 001B097C 00000000 */   nop
/* 0B0A80 001B0980 28BE4070 */  paddub      $23, $2, $0
/* 0B0A84 001B0984 01000424 */  addiu       $4, $0, 0x1
/* 0B0A88 001B0988 06A30046 */  mov.s       $f12, $f20
/* 0B0A8C 001B098C 46AB0046 */  mov.s       $f13, $f21
/* 0B0A90 001B0990 1CC1060C */  jal         BtGetStatusPal2__Fiff
/* 0B0A94 001B0994 00000000 */   nop
/* 0B0A98 001B0998 28B64070 */  paddub      $22, $2, $0
/* 0B0A9C 001B099C 68000224 */  addiu       $2, $0, 0x68
/* 0B0AA0 001B09A0 8001A2AF */  sw          $2, 0x180($29)
/* 0B0AA4 001B09A4 70000224 */  addiu       $2, $0, 0x70
/* 0B0AA8 001B09A8 8401A2AF */  sw          $2, 0x184($29)
/* 0B0AAC 001B09AC 04000424 */  addiu       $4, $0, 0x4
/* 0B0AB0 001B09B0 8801A4AF */  sw          $4, 0x188($29)
/* 0B0AB4 001B09B4 10000324 */  addiu       $3, $0, 0x10
/* 0B0AB8 001B09B8 8C01A3AF */  sw          $3, 0x18C($29)
/* 0B0ABC 001B09BC 30000224 */  addiu       $2, $0, 0x30
/* 0B0AC0 001B09C0 7001A2AF */  sw          $2, 0x170($29)
/* 0B0AC4 001B09C4 1100A226 */  addiu       $2, $21, 0x11
/* 0B0AC8 001B09C8 7401A2AF */  sw          $2, 0x174($29)
/* 0B0ACC 001B09CC 7801A4AF */  sw          $4, 0x178($29)
/* 0B0AD0 001B09D0 7C01A3AF */  sw          $3, 0x17C($29)
/* 0B0AD4 001B09D4 FF000832 */  andi        $8, $16, 0xFF
/* 0B0AD8 001B09D8 D48B848F */  lw          $4, -0x742C($28)
/* 0B0ADC 001B09DC 282E2072 */  paddub      $5, $17, $0
/* 0B0AE0 001B09E0 7001A627 */  addiu       $6, $29, 0x170
/* 0B0AE4 001B09E4 8001A727 */  addiu       $7, $29, 0x180
/* 0B0AE8 001B09E8 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 0B0AEC 001B09EC 00000000 */   nop
/* 0B0AF0 001B09F0 28F60070 */  paddub      $30, $0, $0
/* 0B0AF4 001B09F4 18000010 */  b           .L001B0A58
/* 0B0AF8 001B09F8 00000000 */   nop
.L001B09FC:
/* 0B0AFC 001B09FC 6C000224 */  addiu       $2, $0, 0x6C
/* 0B0B00 001B0A00 A001A2AF */  sw          $2, 0x1A0($29)
/* 0B0B04 001B0A04 70000224 */  addiu       $2, $0, 0x70
/* 0B0B08 001B0A08 A401A2AF */  sw          $2, 0x1A4($29)
/* 0B0B0C 001B0A0C 04000424 */  addiu       $4, $0, 0x4
/* 0B0B10 001B0A10 A801A4AF */  sw          $4, 0x1A8($29)
/* 0B0B14 001B0A14 10000324 */  addiu       $3, $0, 0x10
/* 0B0B18 001B0A18 AC01A3AF */  sw          $3, 0x1AC($29)
/* 0B0B1C 001B0A1C 80101E00 */  sll         $2, $30, 2
/* 0B0B20 001B0A20 34004224 */  addiu       $2, $2, 0x34
/* 0B0B24 001B0A24 9001A2AF */  sw          $2, 0x190($29)
/* 0B0B28 001B0A28 1100A226 */  addiu       $2, $21, 0x11
/* 0B0B2C 001B0A2C 9401A2AF */  sw          $2, 0x194($29)
/* 0B0B30 001B0A30 9801A4AF */  sw          $4, 0x198($29)
/* 0B0B34 001B0A34 9C01A3AF */  sw          $3, 0x19C($29)
/* 0B0B38 001B0A38 FF000832 */  andi        $8, $16, 0xFF
/* 0B0B3C 001B0A3C D48B848F */  lw          $4, -0x742C($28)
/* 0B0B40 001B0A40 282E2072 */  paddub      $5, $17, $0
/* 0B0B44 001B0A44 9001A627 */  addiu       $6, $29, 0x190
/* 0B0B48 001B0A48 A001A727 */  addiu       $7, $29, 0x1A0
/* 0B0B4C 001B0A4C C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 0B0B50 001B0A50 00000000 */   nop
/* 0B0B54 001B0A54 0100DE27 */  addiu       $30, $30, 0x1
.L001B0A58:
/* 0B0B58 001B0A58 FEFF6226 */  addiu       $2, $19, -0x2
/* 0B0B5C 001B0A5C 2A10C203 */  slt         $2, $30, $2
/* 0B0B60 001B0A60 E6FF4014 */  bnez        $2, .L001B09FC
/* 0B0B64 001B0A64 00000000 */   nop
/* 0B0B68 001B0A68 70000224 */  addiu       $2, $0, 0x70
/* 0B0B6C 001B0A6C C001A2AF */  sw          $2, 0x1C0($29)
/* 0B0B70 001B0A70 C401A2AF */  sw          $2, 0x1C4($29)
/* 0B0B74 001B0A74 04000424 */  addiu       $4, $0, 0x4
/* 0B0B78 001B0A78 C801A4AF */  sw          $4, 0x1C8($29)
/* 0B0B7C 001B0A7C 10000324 */  addiu       $3, $0, 0x10
/* 0B0B80 001B0A80 CC01A3AF */  sw          $3, 0x1CC($29)
/* 0B0B84 001B0A84 FFFF6226 */  addiu       $2, $19, -0x1
/* 0B0B88 001B0A88 80F00200 */  sll         $30, $2, 2
/* 0B0B8C 001B0A8C 3000C227 */  addiu       $2, $30, 0x30
/* 0B0B90 001B0A90 B001A2AF */  sw          $2, 0x1B0($29)
/* 0B0B94 001B0A94 1100A226 */  addiu       $2, $21, 0x11
/* 0B0B98 001B0A98 B401A2AF */  sw          $2, 0x1B4($29)
/* 0B0B9C 001B0A9C B801A4AF */  sw          $4, 0x1B8($29)
/* 0B0BA0 001B0AA0 BC01A3AF */  sw          $3, 0x1BC($29)
/* 0B0BA4 001B0AA4 FF000832 */  andi        $8, $16, 0xFF
/* 0B0BA8 001B0AA8 D48B848F */  lw          $4, -0x742C($28)
/* 0B0BAC 001B0AAC 282E2072 */  paddub      $5, $17, $0
/* 0B0BB0 001B0AB0 B001A627 */  addiu       $6, $29, 0x1B0
/* 0B0BB4 001B0AB4 C001A727 */  addiu       $7, $29, 0x1C0
/* 0B0BB8 001B0AB8 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 0B0BBC 001B0ABC 00000000 */   nop
/* 0B0BC0 001B0AC0 00008044 */  mtc1        $0, $f0
/* 0B0BC4 001B0AC4 00000000 */  nop
/* 0B0BC8 001B0AC8 36A80046 */  c.le.s      $f21, $f0
/* 0B0BCC 001B0ACC 00000000 */  nop
/* 0B0BD0 001B0AD0 15000145 */  bc1t        .L001B0B28
/* 0B0BD4 001B0AD4 00000000 */   nop
/* 0B0BD8 001B0AD8 148680C7 */  lwc1        $f0, -0x79EC($28)
/* 0B0BDC 001B0ADC 02031546 */  mul.s       $f12, $f0, $f21
/* 0B0BE0 001B0AE0 2C44040C */  jal         fptosi
/* 0B0BE4 001B0AE4 00000000 */   nop
/* 0B0BE8 001B0AE8 34000324 */  addiu       $3, $0, 0x34
/* 0B0BEC 001B0AEC D001A3AF */  sw          $3, 0x1D0($29)
/* 0B0BF0 001B0AF0 1600A326 */  addiu       $3, $21, 0x16
/* 0B0BF4 001B0AF4 D401A3AF */  sw          $3, 0x1D4($29)
/* 0B0BF8 001B0AF8 FEFF4224 */  addiu       $2, $2, -0x2
/* 0B0BFC 001B0AFC D801A2AF */  sw          $2, 0x1D8($29)
/* 0B0C00 001B0B00 06000224 */  addiu       $2, $0, 0x6
/* 0B0C04 001B0B04 DC01A2AF */  sw          $2, 0x1DC($29)
/* 0B0C08 001B0B08 D48B848F */  lw          $4, -0x742C($28)
/* 0B0C0C 001B0B0C D001A527 */  addiu       $5, $29, 0x1D0
/* 0B0C10 001B0B10 2836E072 */  paddub      $6, $23, $0
/* 0B0C14 001B0B14 283EC072 */  paddub      $7, $22, $0
/* 0B0C18 001B0B18 2846E072 */  paddub      $8, $23, $0
/* 0B0C1C 001B0B1C 284EC072 */  paddub      $9, $22, $0
/* 0B0C20 001B0B20 4878050C */  jal         set2DSpriteC4__FP13sceVif1PacketRC8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBA
/* 0B0C24 001B0B24 00000000 */   nop
.L001B0B28:
/* 0B0C28 001B0B28 789C858F */  lw          $5, -0x6388($28)
/* 0B0C2C 001B0B2C 0400A480 */  lb          $4, 0x4($5)
/* 0B0C30 001B0B30 21108500 */  addu        $2, $4, $5
/* 0B0C34 001B0B34 40434380 */  lb          $3, 0x4340($2)
/* 0B0C38 001B0B38 40110300 */  sll         $2, $3, 5
/* 0B0C3C 001B0B3C 23104300 */  subu        $2, $2, $3
/* 0B0C40 001B0B40 C0180200 */  sll         $3, $2, 3
/* 0B0C44 001B0B44 A80A0224 */  addiu       $2, $0, 0xAA8
/* 0B0C48 001B0B48 18108200 */  mult        $2, $4, $2
/* 0B0C4C 001B0B4C 2110A200 */  addu        $2, $5, $2
/* 0B0C50 001B0B50 21104300 */  addu        $2, $2, $3
/* 0B0C54 001B0B54 0C455624 */  addiu       $22, $2, 0x450C
/* 0B0C58 001B0B58 2826C072 */  paddub      $4, $22, $0
/* 0B0C5C 001B0B5C 20C8080C */  jal         GetWeaponMaxExp__FP11WEAPON_HAVE
/* 0B0C60 001B0B60 00000000 */   nop
/* 0B0C64 001B0B64 B800A2AF */  sw          $2, 0xB8($29)
/* 0B0C68 001B0B68 06B30046 */  mov.s       $f12, $f22
/* 0B0C6C 001B0B6C 2C44040C */  jal         fptosi
/* 0B0C70 001B0B70 00000000 */   nop
/* 0B0C74 001B0B74 28BE4070 */  paddub      $23, $2, $0
/* 0B0C78 001B0B78 40030224 */  addiu       $2, $0, 0x340
/* 0B0C7C 001B0B7C E001A2AF */  sw          $2, 0x1E0($29)
/* 0B0C80 001B0B80 1F00A226 */  addiu       $2, $21, 0x1F
/* 0B0C84 001B0B84 43100200 */  sra         $2, $2, 1
/* 0B0C88 001B0B88 00990200 */  sll         $19, $2, 4
/* 0B0C8C 001B0B8C E401B3AF */  sw          $19, 0x1E4($29)
/* 0B0C90 001B0B90 FFFFE226 */  addiu       $2, $23, -0x1
/* 0B0C94 001B0B94 00110200 */  sll         $2, $2, 4
/* 0B0C98 001B0B98 E801A2AF */  sw          $2, 0x1E8($29)
/* 0B0C9C 001B0B9C 10000224 */  addiu       $2, $0, 0x10
/* 0B0CA0 001B0BA0 EC01A2AF */  sw          $2, 0x1EC($29)
/* 0B0CA4 001B0BA4 FF000832 */  andi        $8, $16, 0xFF
/* 0B0CA8 001B0BA8 E001A427 */  addiu       $4, $29, 0x1E0
/* 0B0CAC 001B0BAC 40000524 */  addiu       $5, $0, 0x40
/* 0B0CB0 001B0BB0 2836A070 */  paddub      $6, $5, $0
/* 0B0CB4 001B0BB4 283EA070 */  paddub      $7, $5, $0
/* 0B0CB8 001B0BB8 9CBE040C */  jal         MGFillBox__FRC8CRect_i_UcUcUcUc
/* 0B0CBC 001B0BBC 00000000 */   nop
/* 0B0CC0 001B0BC0 1400C386 */  lh          $3, 0x14($22)
/* 0B0CC4 001B0BC4 1E006018 */  blez        $3, .L001B0C40
/* 0B0CC8 001B0BC8 00000000 */   nop
/* 0B0CCC 001B0BCC 00009744 */  mtc1        $23, $f0
/* 0B0CD0 001B0BD0 00000000 */  nop
/* 0B0CD4 001B0BD4 60008046 */  cvt.s.w     $f1, $f0
/* 0B0CD8 001B0BD8 B800A28F */  lw          $2, 0xB8($29)
/* 0B0CDC 001B0BDC 00008244 */  mtc1        $2, $f0
/* 0B0CE0 001B0BE0 00000000 */  nop
/* 0B0CE4 001B0BE4 20008046 */  cvt.s.w     $f0, $f0
/* 0B0CE8 001B0BE8 43080046 */  div.s       $f1, $f1, $f0
/* 0B0CEC 001B0BEC 00008344 */  mtc1        $3, $f0
/* 0B0CF0 001B0BF0 00000000 */  nop
/* 0B0CF4 001B0BF4 20008046 */  cvt.s.w     $f0, $f0
/* 0B0CF8 001B0BF8 02030146 */  mul.s       $f12, $f0, $f1
/* 0B0CFC 001B0BFC 2C44040C */  jal         fptosi
/* 0B0D00 001B0C00 00000000 */   nop
/* 0B0D04 001B0C04 40030324 */  addiu       $3, $0, 0x340
/* 0B0D08 001B0C08 F001A3AF */  sw          $3, 0x1F0($29)
/* 0B0D0C 001B0C0C F401B3AF */  sw          $19, 0x1F4($29)
/* 0B0D10 001B0C10 FFFF4224 */  addiu       $2, $2, -0x1
/* 0B0D14 001B0C14 00110200 */  sll         $2, $2, 4
/* 0B0D18 001B0C18 F801A2AF */  sw          $2, 0x1F8($29)
/* 0B0D1C 001B0C1C 10000224 */  addiu       $2, $0, 0x10
/* 0B0D20 001B0C20 FC01A2AF */  sw          $2, 0x1FC($29)
/* 0B0D24 001B0C24 FF000832 */  andi        $8, $16, 0xFF
/* 0B0D28 001B0C28 F001A427 */  addiu       $4, $29, 0x1F0
/* 0B0D2C 001B0C2C 282E0070 */  paddub      $5, $0, $0
/* 0B0D30 001B0C30 A2000624 */  addiu       $6, $0, 0xA2
/* 0B0D34 001B0C34 FF000724 */  addiu       $7, $0, 0xFF
/* 0B0D38 001B0C38 9CBE040C */  jal         MGFillBox__FRC8CRect_i_UcUcUcUc
/* 0B0D3C 001B0C3C 00000000 */   nop
.L001B0C40:
/* 0B0D40 001B0C40 3800D327 */  addiu       $19, $30, 0x38
/* 0B0D44 001B0C44 06AB0046 */  mov.s       $f12, $f21
/* 0B0D48 001B0C48 2C44040C */  jal         fptosi
/* 0B0D4C 001B0C4C 00000000 */   nop
/* 0B0D50 001B0C50 00008244 */  mtc1        $2, $f0
/* 0B0D54 001B0C54 00000000 */  nop
/* 0B0D58 001B0C58 20008046 */  cvt.s.w     $f0, $f0
/* 0B0D5C 001B0C5C 41A80046 */  sub.s       $f1, $f21, $f0
/* 0B0D60 001B0C60 00008044 */  mtc1        $0, $f0
/* 0B0D64 001B0C64 00000000 */  nop
/* 0B0D68 001B0C68 36080046 */  c.le.s      $f1, $f0
/* 0B0D6C 001B0C6C 00000000 */  nop
/* 0B0D70 001B0C70 02000145 */  bc1t        .L001B0C7C
/* 0B0D74 001B0C74 00000000 */   nop
/* 0B0D78 001B0C78 01004224 */  addiu       $2, $2, 0x1
.L001B0C7C:
/* 0B0D7C 001B0C7C 1800A526 */  addiu       $5, $21, 0x18
/* 0B0D80 001B0C80 FF000832 */  andi        $8, $16, 0xFF
/* 0B0D84 001B0C84 28266072 */  paddub      $4, $19, $0
/* 0B0D88 001B0C88 28364070 */  paddub      $6, $2, $0
/* 0B0D8C 001B0C8C 283E0070 */  paddub      $7, $0, $0
/* 0B0D90 001B0C90 18C0060C */  jal         ValuePrint__FiiiiUc
/* 0B0D94 001B0C94 00000000 */   nop
/* 0B0D98 001B0C98 80180200 */  sll         $3, $2, 2
/* 0B0D9C 001B0C9C 21106200 */  addu        $2, $3, $2
/* 0B0DA0 001B0CA0 40100200 */  sll         $2, $2, 1
/* 0B0DA4 001B0CA4 21986202 */  addu        $19, $19, $2
/* 0B0DA8 001B0CA8 78000224 */  addiu       $2, $0, 0x78
/* 0B0DAC 001B0CAC 1002A2AF */  sw          $2, 0x210($29)
/* 0B0DB0 001B0CB0 B0000224 */  addiu       $2, $0, 0xB0
/* 0B0DB4 001B0CB4 1402A2AF */  sw          $2, 0x214($29)
/* 0B0DB8 001B0CB8 0C000324 */  addiu       $3, $0, 0xC
/* 0B0DBC 001B0CBC 1802A3AF */  sw          $3, 0x218($29)
/* 0B0DC0 001B0CC0 1C02A3AF */  sw          $3, 0x21C($29)
/* 0B0DC4 001B0CC4 0002B3AF */  sw          $19, 0x200($29)
/* 0B0DC8 001B0CC8 1800A226 */  addiu       $2, $21, 0x18
/* 0B0DCC 001B0CCC 0402A2AF */  sw          $2, 0x204($29)
/* 0B0DD0 001B0CD0 0802A3AF */  sw          $3, 0x208($29)
/* 0B0DD4 001B0CD4 0C02A3AF */  sw          $3, 0x20C($29)
/* 0B0DD8 001B0CD8 FF000832 */  andi        $8, $16, 0xFF
/* 0B0DDC 001B0CDC D48B848F */  lw          $4, -0x742C($28)
/* 0B0DE0 001B0CE0 282E4072 */  paddub      $5, $18, $0
/* 0B0DE4 001B0CE4 0002A627 */  addiu       $6, $29, 0x200
/* 0B0DE8 001B0CE8 1002A727 */  addiu       $7, $29, 0x210
/* 0B0DEC 001B0CEC C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 0B0DF0 001B0CF0 00000000 */   nop
/* 0B0DF4 001B0CF4 06A30046 */  mov.s       $f12, $f20
/* 0B0DF8 001B0CF8 2C44040C */  jal         fptosi
/* 0B0DFC 001B0CFC 00000000 */   nop
/* 0B0E00 001B0D00 0A006426 */  addiu       $4, $19, 0xA
/* 0B0E04 001B0D04 1800A526 */  addiu       $5, $21, 0x18
/* 0B0E08 001B0D08 FF000832 */  andi        $8, $16, 0xFF
/* 0B0E0C 001B0D0C 28364070 */  paddub      $6, $2, $0
/* 0B0E10 001B0D10 283E0070 */  paddub      $7, $0, $0
/* 0B0E14 001B0D14 18C0060C */  jal         ValuePrint__FiiiiUc
/* 0B0E18 001B0D18 00000000 */   nop
/* 0B0E1C 001B0D1C 40000224 */  addiu       $2, $0, 0x40
/* 0B0E20 001B0D20 3002A2AF */  sw          $2, 0x230($29)
/* 0B0E24 001B0D24 B0000224 */  addiu       $2, $0, 0xB0
/* 0B0E28 001B0D28 3402A2AF */  sw          $2, 0x234($29)
/* 0B0E2C 001B0D2C 10000324 */  addiu       $3, $0, 0x10
/* 0B0E30 001B0D30 3802A3AF */  sw          $3, 0x238($29)
/* 0B0E34 001B0D34 3C02A3AF */  sw          $3, 0x23C($29)
/* 0B0E38 001B0D38 20000224 */  addiu       $2, $0, 0x20
/* 0B0E3C 001B0D3C 2002A2AF */  sw          $2, 0x220($29)
/* 0B0E40 001B0D40 1000A226 */  addiu       $2, $21, 0x10
/* 0B0E44 001B0D44 2402A2AF */  sw          $2, 0x224($29)
/* 0B0E48 001B0D48 2802A3AF */  sw          $3, 0x228($29)
/* 0B0E4C 001B0D4C 2C02A3AF */  sw          $3, 0x22C($29)
/* 0B0E50 001B0D50 FF000832 */  andi        $8, $16, 0xFF
/* 0B0E54 001B0D54 D48B848F */  lw          $4, -0x742C($28)
/* 0B0E58 001B0D58 282E2072 */  paddub      $5, $17, $0
/* 0B0E5C 001B0D5C 2002A627 */  addiu       $6, $29, 0x220
/* 0B0E60 001B0D60 3002A727 */  addiu       $7, $29, 0x230
/* 0B0E64 001B0D64 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 0B0E68 001B0D68 00000000 */   nop
/* 0B0E6C 001B0D6C 789C838F */  lw          $3, -0x6388($28)
/* 0B0E70 001B0D70 04006280 */  lb          $2, 0x4($3)
/* 0B0E74 001B0D74 80100200 */  sll         $2, $2, 2
/* 0B0E78 001B0D78 21104300 */  addu        $2, $2, $3
/* 0B0E7C 001B0D7C EC4254C4 */  lwc1        $f20, 0x42EC($2)
/* 0B0E80 001B0D80 044355C4 */  lwc1        $f21, 0x4304($2)
/* 0B0E84 001B0D84 80001024 */  addiu       $16, $0, 0x80
/* 0B0E88 001B0D88 488280C7 */  lwc1        $f0, -0x7DB8($28)
/* 0B0E8C 001B0D8C 02001446 */  mul.s       $f0, $f0, $f20
/* 0B0E90 001B0D90 34A80046 */  c.lt.s      $f21, $f0
/* 0B0E94 001B0D94 00000000 */  nop
/* 0B0E98 001B0D98 03000045 */  bc1f        .L001B0DA8
/* 0B0E9C 001B0D9C 00000000 */   nop
/* 0B0EA0 001B0DA0 A093908F */  lw          $16, -0x6C60($28)
/* 0B0EA4 001B0DA4 00000000 */  nop
.L001B0DA8:
/* 0B0EA8 001B0DA8 64000224 */  addiu       $2, $0, 0x64
/* 0B0EAC 001B0DAC 5002A2AF */  sw          $2, 0x250($29)
/* 0B0EB0 001B0DB0 84000224 */  addiu       $2, $0, 0x84
/* 0B0EB4 001B0DB4 5402A2AF */  sw          $2, 0x254($29)
/* 0B0EB8 001B0DB8 12000424 */  addiu       $4, $0, 0x12
/* 0B0EBC 001B0DBC 5802A4AF */  sw          $4, 0x258($29)
/* 0B0EC0 001B0DC0 14000324 */  addiu       $3, $0, 0x14
/* 0B0EC4 001B0DC4 5C02A3AF */  sw          $3, 0x25C($29)
/* 0B0EC8 001B0DC8 20000224 */  addiu       $2, $0, 0x20
/* 0B0ECC 001B0DCC 4002A2AF */  sw          $2, 0x240($29)
/* 0B0ED0 001B0DD0 2200A226 */  addiu       $2, $21, 0x22
/* 0B0ED4 001B0DD4 4402A2AF */  sw          $2, 0x244($29)
/* 0B0ED8 001B0DD8 4802A4AF */  sw          $4, 0x248($29)
/* 0B0EDC 001B0DDC 4C02A3AF */  sw          $3, 0x24C($29)
/* 0B0EE0 001B0DE0 FF000832 */  andi        $8, $16, 0xFF
/* 0B0EE4 001B0DE4 D48B848F */  lw          $4, -0x742C($28)
/* 0B0EE8 001B0DE8 282E2072 */  paddub      $5, $17, $0
/* 0B0EEC 001B0DEC 4002A627 */  addiu       $6, $29, 0x240
/* 0B0EF0 001B0DF0 5002A727 */  addiu       $7, $29, 0x250
/* 0B0EF4 001B0DF4 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 0B0EF8 001B0DF8 00000000 */   nop
/* 0B0EFC 001B0DFC 06A30046 */  mov.s       $f12, $f20
/* 0B0F00 001B0E00 2C44040C */  jal         fptosi
/* 0B0F04 001B0E04 00000000 */   nop
/* 0B0F08 001B0E08 0A000324 */  addiu       $3, $0, 0xA
/* 0B0F0C 001B0E0C 1A004300 */  div         $0, $2, $3
/* 0B0F10 001B0E10 02006014 */  bnez        $3, .L001B0E1C
/* 0B0F14 001B0E14 00000000 */   nop
/* 0B0F18 001B0E18 CD010000 */  break       0, 7
.L001B0E1C:
/* 0B0F1C 001B0E1C 12B00000 */  mflo        $22
/* 0B0F20 001B0E20 289E0070 */  paddub      $19, $0, $0
/* 0B0F24 001B0E24 1A000010 */  b           .L001B0E90
/* 0B0F28 001B0E28 00000000 */   nop
.L001B0E2C:
/* 0B0F2C 001B0E2C 64000224 */  addiu       $2, $0, 0x64
/* 0B0F30 001B0E30 7002A2AF */  sw          $2, 0x270($29)
/* 0B0F34 001B0E34 98000224 */  addiu       $2, $0, 0x98
/* 0B0F38 001B0E38 7402A2AF */  sw          $2, 0x274($29)
/* 0B0F3C 001B0E3C 12000424 */  addiu       $4, $0, 0x12
/* 0B0F40 001B0E40 7802A4AF */  sw          $4, 0x278($29)
/* 0B0F44 001B0E44 14000324 */  addiu       $3, $0, 0x14
/* 0B0F48 001B0E48 7C02A3AF */  sw          $3, 0x27C($29)
/* 0B0F4C 001B0E4C C0101300 */  sll         $2, $19, 3
/* 0B0F50 001B0E50 21105300 */  addu        $2, $2, $19
/* 0B0F54 001B0E54 40100200 */  sll         $2, $2, 1
/* 0B0F58 001B0E58 32004224 */  addiu       $2, $2, 0x32
/* 0B0F5C 001B0E5C 6002A2AF */  sw          $2, 0x260($29)
/* 0B0F60 001B0E60 2200A226 */  addiu       $2, $21, 0x22
/* 0B0F64 001B0E64 6402A2AF */  sw          $2, 0x264($29)
/* 0B0F68 001B0E68 6802A4AF */  sw          $4, 0x268($29)
/* 0B0F6C 001B0E6C 6C02A3AF */  sw          $3, 0x26C($29)
/* 0B0F70 001B0E70 FF000832 */  andi        $8, $16, 0xFF
/* 0B0F74 001B0E74 D48B848F */  lw          $4, -0x742C($28)
/* 0B0F78 001B0E78 282E2072 */  paddub      $5, $17, $0
/* 0B0F7C 001B0E7C 6002A627 */  addiu       $6, $29, 0x260
/* 0B0F80 001B0E80 7002A727 */  addiu       $7, $29, 0x270
/* 0B0F84 001B0E84 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 0B0F88 001B0E88 00000000 */   nop
/* 0B0F8C 001B0E8C 01007326 */  addiu       $19, $19, 0x1
.L001B0E90:
/* 0B0F90 001B0E90 2A107602 */  slt         $2, $19, $22
/* 0B0F94 001B0E94 E5FF4014 */  bnez        $2, .L001B0E2C
/* 0B0F98 001B0E98 00000000 */   nop
/* 0B0F9C 001B0E9C 06A30046 */  mov.s       $f12, $f20
/* 0B0FA0 001B0EA0 2C44040C */  jal         fptosi
/* 0B0FA4 001B0EA4 00000000 */   nop
/* 0B0FA8 001B0EA8 0A000324 */  addiu       $3, $0, 0xA
/* 0B0FAC 001B0EAC 1A004300 */  div         $0, $2, $3
/* 0B0FB0 001B0EB0 00000000 */  nop
/* 0B0FB4 001B0EB4 00000000 */  nop
/* 0B0FB8 001B0EB8 10100000 */  mfhi        $2
/* 0B0FBC 001B0EBC 1A004010 */  beqz        $2, .L001B0F28
/* 0B0FC0 001B0EC0 00000000 */   nop
/* 0B0FC4 001B0EC4 64000224 */  addiu       $2, $0, 0x64
/* 0B0FC8 001B0EC8 9002A2AF */  sw          $2, 0x290($29)
/* 0B0FCC 001B0ECC AC000224 */  addiu       $2, $0, 0xAC
/* 0B0FD0 001B0ED0 9402A2AF */  sw          $2, 0x294($29)
/* 0B0FD4 001B0ED4 18000224 */  addiu       $2, $0, 0x18
/* 0B0FD8 001B0ED8 9802A2AF */  sw          $2, 0x298($29)
/* 0B0FDC 001B0EDC 14000324 */  addiu       $3, $0, 0x14
/* 0B0FE0 001B0EE0 9C02A3AF */  sw          $3, 0x29C($29)
/* 0B0FE4 001B0EE4 C0101600 */  sll         $2, $22, 3
/* 0B0FE8 001B0EE8 21105600 */  addu        $2, $2, $22
/* 0B0FEC 001B0EEC 40100200 */  sll         $2, $2, 1
/* 0B0FF0 001B0EF0 32004224 */  addiu       $2, $2, 0x32
/* 0B0FF4 001B0EF4 8002A2AF */  sw          $2, 0x280($29)
/* 0B0FF8 001B0EF8 2200A226 */  addiu       $2, $21, 0x22
/* 0B0FFC 001B0EFC 8402A2AF */  sw          $2, 0x284($29)
/* 0B1000 001B0F00 12000224 */  addiu       $2, $0, 0x12
/* 0B1004 001B0F04 8802A2AF */  sw          $2, 0x288($29)
/* 0B1008 001B0F08 8C02A3AF */  sw          $3, 0x28C($29)
/* 0B100C 001B0F0C FF000832 */  andi        $8, $16, 0xFF
/* 0B1010 001B0F10 D48B848F */  lw          $4, -0x742C($28)
/* 0B1014 001B0F14 282E2072 */  paddub      $5, $17, $0
/* 0B1018 001B0F18 8002A627 */  addiu       $6, $29, 0x280
/* 0B101C 001B0F1C 9002A727 */  addiu       $7, $29, 0x290
/* 0B1020 001B0F20 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 0B1024 001B0F24 00000000 */   nop
.L001B0F28:
/* 0B1028 001B0F28 06AB0046 */  mov.s       $f12, $f21
/* 0B102C 001B0F2C 2C44040C */  jal         fptosi
/* 0B1030 001B0F30 00000000 */   nop
/* 0B1034 001B0F34 0A000324 */  addiu       $3, $0, 0xA
/* 0B1038 001B0F38 1A004300 */  div         $0, $2, $3
/* 0B103C 001B0F3C 02006014 */  bnez        $3, .L001B0F48
/* 0B1040 001B0F40 00000000 */   nop
/* 0B1044 001B0F44 CD010000 */  break       0, 7
.L001B0F48:
/* 0B1048 001B0F48 12800000 */  mflo        $16
/* 0B104C 001B0F4C 289E0070 */  paddub      $19, $0, $0
/* 0B1050 001B0F50 19000010 */  b           .L001B0FB8
/* 0B1054 001B0F54 00000000 */   nop
.L001B0F58:
/* 0B1058 001B0F58 B002A0AF */  sw          $0, 0x2B0($29)
/* 0B105C 001B0F5C 48000224 */  addiu       $2, $0, 0x48
/* 0B1060 001B0F60 B402A2AF */  sw          $2, 0x2B4($29)
/* 0B1064 001B0F64 10000424 */  addiu       $4, $0, 0x10
/* 0B1068 001B0F68 B802A4AF */  sw          $4, 0x2B8($29)
/* 0B106C 001B0F6C 14000324 */  addiu       $3, $0, 0x14
/* 0B1070 001B0F70 BC02A3AF */  sw          $3, 0x2BC($29)
/* 0B1074 001B0F74 C0101300 */  sll         $2, $19, 3
/* 0B1078 001B0F78 21105300 */  addu        $2, $2, $19
/* 0B107C 001B0F7C 40100200 */  sll         $2, $2, 1
/* 0B1080 001B0F80 33004224 */  addiu       $2, $2, 0x33
/* 0B1084 001B0F84 A002A2AF */  sw          $2, 0x2A0($29)
/* 0B1088 001B0F88 2200A226 */  addiu       $2, $21, 0x22
/* 0B108C 001B0F8C A402A2AF */  sw          $2, 0x2A4($29)
/* 0B1090 001B0F90 A802A4AF */  sw          $4, 0x2A8($29)
/* 0B1094 001B0F94 AC02A3AF */  sw          $3, 0x2AC($29)
/* 0B1098 001B0F98 D48B848F */  lw          $4, -0x742C($28)
/* 0B109C 001B0F9C 282E2072 */  paddub      $5, $17, $0
/* 0B10A0 001B0FA0 A002A627 */  addiu       $6, $29, 0x2A0
/* 0B10A4 001B0FA4 B002A727 */  addiu       $7, $29, 0x2B0
/* 0B10A8 001B0FA8 50000824 */  addiu       $8, $0, 0x50
/* 0B10AC 001B0FAC C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 0B10B0 001B0FB0 00000000 */   nop
/* 0B10B4 001B0FB4 01007326 */  addiu       $19, $19, 0x1
.L001B0FB8:
/* 0B10B8 001B0FB8 2A107002 */  slt         $2, $19, $16
/* 0B10BC 001B0FBC E6FF4014 */  bnez        $2, .L001B0F58
/* 0B10C0 001B0FC0 00000000 */   nop
/* 0B10C4 001B0FC4 06AB0046 */  mov.s       $f12, $f21
/* 0B10C8 001B0FC8 2C44040C */  jal         fptosi
/* 0B10CC 001B0FCC 00000000 */   nop
/* 0B10D0 001B0FD0 0A000324 */  addiu       $3, $0, 0xA
/* 0B10D4 001B0FD4 1A004300 */  div         $0, $2, $3
/* 0B10D8 001B0FD8 00000000 */  nop
/* 0B10DC 001B0FDC 00000000 */  nop
/* 0B10E0 001B0FE0 10100000 */  mfhi        $2
/* 0B10E4 001B0FE4 24004010 */  beqz        $2, .L001B1078
/* 0B10E8 001B0FE8 00000000 */   nop
/* 0B10EC 001B0FEC 00008244 */  mtc1        $2, $f0
/* 0B10F0 001B0FF0 00000000 */  nop
/* 0B10F4 001B0FF4 60008046 */  cvt.s.w     $f1, $f0
/* 0B10F8 001B0FF8 2040023C */  lui         $2, (0x40200000 >> 16)
/* 0B10FC 001B0FFC 00008244 */  mtc1        $2, $f0
/* 0B1100 001B1000 00000000 */  nop
/* 0B1104 001B1004 030B0046 */  div.s       $f12, $f1, $f0
/* 0B1108 001B1008 2C44040C */  jal         fptosi
/* 0B110C 001B100C 00000000 */   nop
/* 0B1110 001B1010 03000324 */  addiu       $3, $0, 0x3
/* 0B1114 001B1014 23106200 */  subu        $2, $3, $2
/* 0B1118 001B1018 00110200 */  sll         $2, $2, 4
/* 0B111C 001B101C D002A2AF */  sw          $2, 0x2D0($29)
/* 0B1120 001B1020 48000224 */  addiu       $2, $0, 0x48
/* 0B1124 001B1024 D402A2AF */  sw          $2, 0x2D4($29)
/* 0B1128 001B1028 10000424 */  addiu       $4, $0, 0x10
/* 0B112C 001B102C D802A4AF */  sw          $4, 0x2D8($29)
/* 0B1130 001B1030 14000324 */  addiu       $3, $0, 0x14
/* 0B1134 001B1034 DC02A3AF */  sw          $3, 0x2DC($29)
/* 0B1138 001B1038 C0101000 */  sll         $2, $16, 3
/* 0B113C 001B103C 21105000 */  addu        $2, $2, $16
/* 0B1140 001B1040 40100200 */  sll         $2, $2, 1
/* 0B1144 001B1044 33004224 */  addiu       $2, $2, 0x33
/* 0B1148 001B1048 C002A2AF */  sw          $2, 0x2C0($29)
/* 0B114C 001B104C 2200A226 */  addiu       $2, $21, 0x22
/* 0B1150 001B1050 C402A2AF */  sw          $2, 0x2C4($29)
/* 0B1154 001B1054 C802A4AF */  sw          $4, 0x2C8($29)
/* 0B1158 001B1058 CC02A3AF */  sw          $3, 0x2CC($29)
/* 0B115C 001B105C D48B848F */  lw          $4, -0x742C($28)
/* 0B1160 001B1060 282E2072 */  paddub      $5, $17, $0
/* 0B1164 001B1064 C002A627 */  addiu       $6, $29, 0x2C0
/* 0B1168 001B1068 D002A727 */  addiu       $7, $29, 0x2D0
/* 0B116C 001B106C 50000824 */  addiu       $8, $0, 0x50
/* 0B1170 001B1070 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 0B1174 001B1074 00000000 */   nop
.L001B1078:
/* 0B1178 001B1078 CC938283 */  lb          $2, -0x6C34($28)
/* 0B117C 001B107C 05004014 */  bnez        $2, .L001B1094
/* 0B1180 001B1080 00000000 */   nop
/* 0B1184 001B1084 188680C7 */  lwc1        $f0, -0x79E8($28)
/* 0B1188 001B1088 C89380E7 */  swc1        $f0, -0x6C38($28)
/* 0B118C 001B108C 01000224 */  addiu       $2, $0, 0x1
/* 0B1190 001B1090 CC9382A3 */  sb          $2, -0x6C34($28)
.L001B1094:
/* 0B1194 001B1094 C89381C7 */  lwc1        $f1, -0x6C38($28)
/* 0B1198 001B1098 C08180C7 */  lwc1        $f0, -0x7E40($28)
/* 0B119C 001B109C 40080046 */  add.s       $f1, $f1, $f0
/* 0B11A0 001B10A0 C89381E7 */  swc1        $f1, -0x6C38($28)
/* 0B11A4 001B10A4 B08080C7 */  lwc1        $f0, -0x7F50($28)
/* 0B11A8 001B10A8 34080046 */  c.lt.s      $f1, $f0
/* 0B11AC 001B10AC 00000000 */  nop
/* 0B11B0 001B10B0 05000145 */  bc1t        .L001B10C8
/* 0B11B4 001B10B4 00000000 */   nop
/* 0B11B8 001B10B8 C89381C7 */  lwc1        $f1, -0x6C38($28)
/* 0B11BC 001B10BC 1C8680C7 */  lwc1        $f0, -0x79E4($28)
/* 0B11C0 001B10C0 01080046 */  sub.s       $f0, $f1, $f0
/* 0B11C4 001B10C4 C89380E7 */  swc1        $f0, -0x6C38($28)
.L001B10C8:
/* 0B11C8 001B10C8 D4938283 */  lb          $2, -0x6C2C($28)
/* 0B11CC 001B10CC 05004014 */  bnez        $2, .L001B10E4
/* 0B11D0 001B10D0 00000000 */   nop
/* 0B11D4 001B10D4 208680C7 */  lwc1        $f0, -0x79E0($28)
/* 0B11D8 001B10D8 D09380E7 */  swc1        $f0, -0x6C30($28)
/* 0B11DC 001B10DC 01000224 */  addiu       $2, $0, 0x1
/* 0B11E0 001B10E0 D49382A3 */  sb          $2, -0x6C2C($28)
.L001B10E4:
/* 0B11E4 001B10E4 D09381C7 */  lwc1        $f1, -0x6C30($28)
/* 0B11E8 001B10E8 248680C7 */  lwc1        $f0, -0x79DC($28)
/* 0B11EC 001B10EC 40080046 */  add.s       $f1, $f1, $f0
/* 0B11F0 001B10F0 D09381E7 */  swc1        $f1, -0x6C30($28)
/* 0B11F4 001B10F4 00008044 */  mtc1        $0, $f0
/* 0B11F8 001B10F8 00000000 */  nop
/* 0B11FC 001B10FC 34080046 */  c.lt.s      $f1, $f0
/* 0B1200 001B1100 00000000 */  nop
/* 0B1204 001B1104 05000145 */  bc1t        .L001B111C
/* 0B1208 001B1108 00000000 */   nop
/* 0B120C 001B110C D09381C7 */  lwc1        $f1, -0x6C30($28)
/* 0B1210 001B1110 B08080C7 */  lwc1        $f0, -0x7F50($28)
/* 0B1214 001B1114 01080046 */  sub.s       $f0, $f1, $f0
/* 0B1218 001B1118 D09380E7 */  swc1        $f0, -0x6C30($28)
.L001B111C:
/* 0B121C 001B111C 789C828F */  lw          $2, -0x6388($28)
/* 0B1220 001B1120 60435624 */  addiu       $22, $2, 0x4360
/* 0B1224 001B1124 28860070 */  paddub      $16, $0, $0
/* 0B1228 001B1128 86000010 */  b           .L001B1344
/* 0B122C 001B112C 00000000 */   nop
.L001B1130:
/* 0B1230 001B1130 28F60070 */  paddub      $30, $0, $0
/* 0B1234 001B1134 28260070 */  paddub      $4, $0, $0
/* 0B1238 001B1138 D09D828F */  lw          $2, -0x6230($28)
/* 0B123C 001B113C 11004010 */  beqz        $2, .L001B1184
/* 0B1240 001B1140 00000000 */   nop
/* 0B1244 001B1144 40101000 */  sll         $2, $16, 1
/* 0B1248 001B1148 21105600 */  addu        $2, $2, $22
/* 0B124C 001B114C 02004384 */  lh          $3, 0x2($2)
/* 0B1250 001B1150 9C000224 */  addiu       $2, $0, 0x9C
/* 0B1254 001B1154 0B006214 */  bne         $3, $2, .L001B1184
/* 0B1258 001B1158 00000000 */   nop
/* 0B125C 001B115C D0938CC7 */  lwc1        $f12, -0x6C30($28)
/* 0B1260 001B1160 2876040C */  jal         sinf
/* 0B1264 001B1164 00000000 */   nop
/* 0B1268 001B1168 8042023C */  lui         $2, (0x42800000 >> 16)
/* 0B126C 001B116C 00088244 */  mtc1        $2, $f1
/* 0B1270 001B1170 00000000 */  nop
/* 0B1274 001B1174 020B0046 */  mul.s       $f12, $f1, $f0
/* 0B1278 001B1178 2C44040C */  jal         fptosi
/* 0B127C 001B117C 00000000 */   nop
/* 0B1280 001B1180 3F004424 */  addiu       $4, $2, 0x3F
.L001B1184:
/* 0B1284 001B1184 24000324 */  addiu       $3, $0, 0x24
/* 0B1288 001B1188 F002A3AF */  sw          $3, 0x2F0($29)
/* 0B128C 001B118C 5C000224 */  addiu       $2, $0, 0x5C
/* 0B1290 001B1190 F402A2AF */  sw          $2, 0x2F4($29)
/* 0B1294 001B1194 F802A3AF */  sw          $3, 0x2F8($29)
/* 0B1298 001B1198 FC02A3AF */  sw          $3, 0x2FC($29)
/* 0B129C 001B119C 80101000 */  sll         $2, $16, 2
/* 0B12A0 001B11A0 21105000 */  addu        $2, $2, $16
/* 0B12A4 001B11A4 C0980200 */  sll         $19, $2, 3
/* 0B12A8 001B11A8 26016226 */  addiu       $2, $19, 0x126
/* 0B12AC 001B11AC E002A2AF */  sw          $2, 0x2E0($29)
/* 0B12B0 001B11B0 0200A226 */  addiu       $2, $21, 0x2
/* 0B12B4 001B11B4 E402A2AF */  sw          $2, 0x2E4($29)
/* 0B12B8 001B11B8 E802A3AF */  sw          $3, 0x2E8($29)
/* 0B12BC 001B11BC EC02A3AF */  sw          $3, 0x2EC($29)
/* 0B12C0 001B11C0 80008224 */  addiu       $2, $4, 0x80
/* 0B12C4 001B11C4 FF004830 */  andi        $8, $2, 0xFF
/* 0B12C8 001B11C8 D48B848F */  lw          $4, -0x742C($28)
/* 0B12CC 001B11CC 282E2072 */  paddub      $5, $17, $0
/* 0B12D0 001B11D0 E002A627 */  addiu       $6, $29, 0x2E0
/* 0B12D4 001B11D4 F002A727 */  addiu       $7, $29, 0x2F0
/* 0B12D8 001B11D8 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 0B12DC 001B11DC 00000000 */   nop
/* 0B12E0 001B11E0 40B81000 */  sll         $23, $16, 1
/* 0B12E4 001B11E4 2110F602 */  addu        $2, $23, $22
/* 0B12E8 001B11E8 02004384 */  lh          $3, 0x2($2)
/* 0B12EC 001B11EC FFFF0224 */  addiu       $2, $0, -0x1
/* 0B12F0 001B11F0 53006210 */  beq         $3, $2, .L001B1340
/* 0B12F4 001B11F4 00000000 */   nop
/* 0B12F8 001B11F8 40111000 */  sll         $2, $16, 5
/* 0B12FC 001B11FC 20004224 */  addiu       $2, $2, 0x20
/* 0B1300 001B1200 1003A2AF */  sw          $2, 0x310($29)
/* 0B1304 001B1204 1403A0AF */  sw          $0, 0x314($29)
/* 0B1308 001B1208 1F000324 */  addiu       $3, $0, 0x1F
/* 0B130C 001B120C 1803A3AF */  sw          $3, 0x318($29)
/* 0B1310 001B1210 1C03A3AF */  sw          $3, 0x31C($29)
/* 0B1314 001B1214 28016226 */  addiu       $2, $19, 0x128
/* 0B1318 001B1218 0003A2AF */  sw          $2, 0x300($29)
/* 0B131C 001B121C 0400A226 */  addiu       $2, $21, 0x4
/* 0B1320 001B1220 21105E00 */  addu        $2, $2, $30
/* 0B1324 001B1224 0403A2AF */  sw          $2, 0x304($29)
/* 0B1328 001B1228 0803A3AF */  sw          $3, 0x308($29)
/* 0B132C 001B122C 0C03A3AF */  sw          $3, 0x30C($29)
/* 0B1330 001B1230 D48B848F */  lw          $4, -0x742C($28)
/* 0B1334 001B1234 282E2072 */  paddub      $5, $17, $0
/* 0B1338 001B1238 0003A627 */  addiu       $6, $29, 0x300
/* 0B133C 001B123C 1003A727 */  addiu       $7, $29, 0x310
/* 0B1340 001B1240 0070050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_
/* 0B1344 001B1244 00000000 */   nop
/* 0B1348 001B1248 2110F602 */  addu        $2, $23, $22
/* 0B134C 001B124C 08005724 */  addiu       $23, $2, 0x8
/* 0B1350 001B1250 08004384 */  lh          $3, 0x8($2)
/* 0B1354 001B1254 02006128 */  slti        $1, $3, 0x2
/* 0B1358 001B1258 39002014 */  bnez        $1, .L001B1340
/* 0B135C 001B125C 00000000 */   nop
/* 0B1360 001B1260 0A000224 */  addiu       $2, $0, 0xA
/* 0B1364 001B1264 1A006200 */  div         $0, $3, $2
/* 0B1368 001B1268 02004014 */  bnez        $2, .L001B1274
/* 0B136C 001B126C 00000000 */   nop
/* 0B1370 001B1270 CD010000 */  break       0, 7
.L001B1274:
/* 0B1374 001B1274 12180000 */  mflo        $3
/* 0B1378 001B1278 16006018 */  blez        $3, .L001B12D4
/* 0B137C 001B127C 00000000 */   nop
/* 0B1380 001B1280 40100300 */  sll         $2, $3, 1
/* 0B1384 001B1284 21104300 */  addu        $2, $2, $3
/* 0B1388 001B1288 80100200 */  sll         $2, $2, 2
/* 0B138C 001B128C 3003A2AF */  sw          $2, 0x330($29)
/* 0B1390 001B1290 D4000224 */  addiu       $2, $0, 0xD4
/* 0B1394 001B1294 3403A2AF */  sw          $2, 0x334($29)
/* 0B1398 001B1298 0C000324 */  addiu       $3, $0, 0xC
/* 0B139C 001B129C 3803A3AF */  sw          $3, 0x338($29)
/* 0B13A0 001B12A0 3C03A3AF */  sw          $3, 0x33C($29)
/* 0B13A4 001B12A4 2F016226 */  addiu       $2, $19, 0x12F
/* 0B13A8 001B12A8 2003A2AF */  sw          $2, 0x320($29)
/* 0B13AC 001B12AC 1700A226 */  addiu       $2, $21, 0x17
/* 0B13B0 001B12B0 2403A2AF */  sw          $2, 0x324($29)
/* 0B13B4 001B12B4 2803A3AF */  sw          $3, 0x328($29)
/* 0B13B8 001B12B8 2C03A3AF */  sw          $3, 0x32C($29)
/* 0B13BC 001B12BC D48B848F */  lw          $4, -0x742C($28)
/* 0B13C0 001B12C0 282E4072 */  paddub      $5, $18, $0
/* 0B13C4 001B12C4 2003A627 */  addiu       $6, $29, 0x320
/* 0B13C8 001B12C8 3003A727 */  addiu       $7, $29, 0x330
/* 0B13CC 001B12CC 0070050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_
/* 0B13D0 001B12D0 00000000 */   nop
.L001B12D4:
/* 0B13D4 001B12D4 0000E386 */  lh          $3, 0x0($23)
/* 0B13D8 001B12D8 0A000224 */  addiu       $2, $0, 0xA
/* 0B13DC 001B12DC 1A006200 */  div         $0, $3, $2
/* 0B13E0 001B12E0 00000000 */  nop
/* 0B13E4 001B12E4 00000000 */  nop
/* 0B13E8 001B12E8 10180000 */  mfhi        $3
/* 0B13EC 001B12EC 40100300 */  sll         $2, $3, 1
/* 0B13F0 001B12F0 21104300 */  addu        $2, $2, $3
/* 0B13F4 001B12F4 80100200 */  sll         $2, $2, 2
/* 0B13F8 001B12F8 5003A2AF */  sw          $2, 0x350($29)
/* 0B13FC 001B12FC D4000224 */  addiu       $2, $0, 0xD4
/* 0B1400 001B1300 5403A2AF */  sw          $2, 0x354($29)
/* 0B1404 001B1304 0C000324 */  addiu       $3, $0, 0xC
/* 0B1408 001B1308 5803A3AF */  sw          $3, 0x358($29)
/* 0B140C 001B130C 5C03A3AF */  sw          $3, 0x35C($29)
/* 0B1410 001B1310 3B016226 */  addiu       $2, $19, 0x13B
/* 0B1414 001B1314 4003A2AF */  sw          $2, 0x340($29)
/* 0B1418 001B1318 1700A226 */  addiu       $2, $21, 0x17
/* 0B141C 001B131C 4403A2AF */  sw          $2, 0x344($29)
/* 0B1420 001B1320 4803A3AF */  sw          $3, 0x348($29)
/* 0B1424 001B1324 4C03A3AF */  sw          $3, 0x34C($29)
/* 0B1428 001B1328 D48B848F */  lw          $4, -0x742C($28)
/* 0B142C 001B132C 282E4072 */  paddub      $5, $18, $0
/* 0B1430 001B1330 4003A627 */  addiu       $6, $29, 0x340
/* 0B1434 001B1334 5003A727 */  addiu       $7, $29, 0x350
/* 0B1438 001B1338 0070050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_
/* 0B143C 001B133C 00000000 */   nop
.L001B1340:
/* 0B1440 001B1340 01001026 */  addiu       $16, $16, 0x1
.L001B1344:
/* 0B1444 001B1344 0300022A */  slti        $2, $16, 0x3
/* 0B1448 001B1348 79FF4014 */  bnez        $2, .L001B1130
/* 0B144C 001B134C 00000000 */   nop
/* 0B1450 001B1350 9A000224 */  addiu       $2, $0, 0x9A
/* 0B1454 001B1354 7003A2AF */  sw          $2, 0x370($29)
/* 0B1458 001B1358 01000224 */  addiu       $2, $0, 0x1
/* 0B145C 001B135C 7403A2AF */  sw          $2, 0x374($29)
/* 0B1460 001B1360 66000424 */  addiu       $4, $0, 0x66
/* 0B1464 001B1364 7803A4AF */  sw          $4, 0x378($29)
/* 0B1468 001B1368 29000324 */  addiu       $3, $0, 0x29
/* 0B146C 001B136C 7C03A3AF */  sw          $3, 0x37C($29)
/* 0B1470 001B1370 FC010224 */  addiu       $2, $0, 0x1FC
/* 0B1474 001B1374 6003A2AF */  sw          $2, 0x360($29)
/* 0B1478 001B1378 6403B5AF */  sw          $21, 0x364($29)
/* 0B147C 001B137C 6803A4AF */  sw          $4, 0x368($29)
/* 0B1480 001B1380 6C03A3AF */  sw          $3, 0x36C($29)
/* 0B1484 001B1384 D48B848F */  lw          $4, -0x742C($28)
/* 0B1488 001B1388 282E2072 */  paddub      $5, $17, $0
/* 0B148C 001B138C 6003A627 */  addiu       $6, $29, 0x360
/* 0B1490 001B1390 7003A727 */  addiu       $7, $29, 0x370
/* 0B1494 001B1394 0070050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_
/* 0B1498 001B1398 00000000 */   nop
/* 0B149C 001B139C C49C828F */  lw          $2, -0x633C($28)
/* 0B14A0 001B13A0 14004010 */  beqz        $2, .L001B13F4
/* 0B14A4 001B13A4 00000000 */   nop
/* 0B14A8 001B13A8 DA000224 */  addiu       $2, $0, 0xDA
/* 0B14AC 001B13AC 9003A2AF */  sw          $2, 0x390($29)
/* 0B14B0 001B13B0 2B000224 */  addiu       $2, $0, 0x2B
/* 0B14B4 001B13B4 9403A2AF */  sw          $2, 0x394($29)
/* 0B14B8 001B13B8 26000424 */  addiu       $4, $0, 0x26
/* 0B14BC 001B13BC 9803A4AF */  sw          $4, 0x398($29)
/* 0B14C0 001B13C0 29000324 */  addiu       $3, $0, 0x29
/* 0B14C4 001B13C4 9C03A3AF */  sw          $3, 0x39C($29)
/* 0B14C8 001B13C8 3C020224 */  addiu       $2, $0, 0x23C
/* 0B14CC 001B13CC 8003A2AF */  sw          $2, 0x380($29)
/* 0B14D0 001B13D0 8403B5AF */  sw          $21, 0x384($29)
/* 0B14D4 001B13D4 8803A4AF */  sw          $4, 0x388($29)
/* 0B14D8 001B13D8 8C03A3AF */  sw          $3, 0x38C($29)
/* 0B14DC 001B13DC D48B848F */  lw          $4, -0x742C($28)
/* 0B14E0 001B13E0 282E2072 */  paddub      $5, $17, $0
/* 0B14E4 001B13E4 8003A627 */  addiu       $6, $29, 0x380
/* 0B14E8 001B13E8 9003A727 */  addiu       $7, $29, 0x390
/* 0B14EC 001B13EC 0070050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_
/* 0B14F0 001B13F0 00000000 */   nop
.L001B13F4:
/* 0B14F4 001B13F4 B09D828F */  lw          $2, -0x6250($28)
/* 0B14F8 001B13F8 13004010 */  beqz        $2, .L001B1448
/* 0B14FC 001B13FC 00000000 */   nop
/* 0B1500 001B1400 B003A0AF */  sw          $0, 0x3B0($29)
/* 0B1504 001B1404 A0000224 */  addiu       $2, $0, 0xA0
/* 0B1508 001B1408 B403A2AF */  sw          $2, 0x3B4($29)
/* 0B150C 001B140C 20000324 */  addiu       $3, $0, 0x20
/* 0B1510 001B1410 B803A3AF */  sw          $3, 0x3B8($29)
/* 0B1514 001B1414 BC03A3AF */  sw          $3, 0x3BC($29)
/* 0B1518 001B1418 FE010224 */  addiu       $2, $0, 0x1FE
/* 0B151C 001B141C A003A2AF */  sw          $2, 0x3A0($29)
/* 0B1520 001B1420 0500A226 */  addiu       $2, $21, 0x5
/* 0B1524 001B1424 A403A2AF */  sw          $2, 0x3A4($29)
/* 0B1528 001B1428 A803A3AF */  sw          $3, 0x3A8($29)
/* 0B152C 001B142C AC03A3AF */  sw          $3, 0x3AC($29)
/* 0B1530 001B1430 D48B848F */  lw          $4, -0x742C($28)
/* 0B1534 001B1434 282E2072 */  paddub      $5, $17, $0
/* 0B1538 001B1438 A003A627 */  addiu       $6, $29, 0x3A0
/* 0B153C 001B143C B003A727 */  addiu       $7, $29, 0x3B0
/* 0B1540 001B1440 0070050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_
/* 0B1544 001B1444 00000000 */   nop
.L001B1448:
/* 0B1548 001B1448 AC9D828F */  lw          $2, -0x6254($28)
/* 0B154C 001B144C 13004010 */  beqz        $2, .L001B149C
/* 0B1550 001B1450 00000000 */   nop
/* 0B1554 001B1454 20000324 */  addiu       $3, $0, 0x20
/* 0B1558 001B1458 D003A3AF */  sw          $3, 0x3D0($29)
/* 0B155C 001B145C A0000224 */  addiu       $2, $0, 0xA0
/* 0B1560 001B1460 D403A2AF */  sw          $2, 0x3D4($29)
/* 0B1564 001B1464 D803A3AF */  sw          $3, 0x3D8($29)
/* 0B1568 001B1468 DC03A3AF */  sw          $3, 0x3DC($29)
/* 0B156C 001B146C 1E020224 */  addiu       $2, $0, 0x21E
/* 0B1570 001B1470 C003A2AF */  sw          $2, 0x3C0($29)
/* 0B1574 001B1474 0500A226 */  addiu       $2, $21, 0x5
/* 0B1578 001B1478 C403A2AF */  sw          $2, 0x3C4($29)
/* 0B157C 001B147C C803A3AF */  sw          $3, 0x3C8($29)
/* 0B1580 001B1480 CC03A3AF */  sw          $3, 0x3CC($29)
/* 0B1584 001B1484 D48B848F */  lw          $4, -0x742C($28)
/* 0B1588 001B1488 282E2072 */  paddub      $5, $17, $0
/* 0B158C 001B148C C003A627 */  addiu       $6, $29, 0x3C0
/* 0B1590 001B1490 D003A727 */  addiu       $7, $29, 0x3D0
/* 0B1594 001B1494 0070050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_
/* 0B1598 001B1498 00000000 */   nop
.L001B149C:
/* 0B159C 001B149C 789C828F */  lw          $2, -0x6388($28)
/* 0B15A0 001B14A0 00004280 */  lb          $2, 0x0($2)
/* 0B15A4 001B14A4 80180200 */  sll         $3, $2, 2
/* 0B15A8 001B14A8 2700023C */  lui         $2, %hi(maxFloorTbl)
/* 0B15AC 001B14AC 00B04224 */  addiu       $2, $2, %lo(maxFloorTbl)
/* 0B15B0 001B14B0 21104300 */  addu        $2, $2, $3
/* 0B15B4 001B14B4 0000438C */  lw          $3, 0x0($2)
/* 0B15B8 001B14B8 BC00A28F */  lw          $2, 0xBC($29)
/* 0B15BC 001B14BC 01004224 */  addiu       $2, $2, 0x1
/* 0B15C0 001B14C0 18004314 */  bne         $2, $3, .L001B1524
/* 0B15C4 001B14C4 00000000 */   nop
/* 0B15C8 001B14C8 78000224 */  addiu       $2, $0, 0x78
/* 0B15CC 001B14CC F003A2AF */  sw          $2, 0x3F0($29)
/* 0B15D0 001B14D0 9E000224 */  addiu       $2, $0, 0x9E
/* 0B15D4 001B14D4 F403A2AF */  sw          $2, 0x3F4($29)
/* 0B15D8 001B14D8 26000324 */  addiu       $3, $0, 0x26
/* 0B15DC 001B14DC F803A3AF */  sw          $3, 0x3F8($29)
/* 0B15E0 001B14E0 12000224 */  addiu       $2, $0, 0x12
/* 0B15E4 001B14E4 FC03A2AF */  sw          $2, 0x3FC($29)
/* 0B15E8 001B14E8 3C020224 */  addiu       $2, $0, 0x23C
/* 0B15EC 001B14EC E003A2AF */  sw          $2, 0x3E0($29)
/* 0B15F0 001B14F0 1200A226 */  addiu       $2, $21, 0x12
/* 0B15F4 001B14F4 E403A2AF */  sw          $2, 0x3E4($29)
/* 0B15F8 001B14F8 E803A3AF */  sw          $3, 0x3E8($29)
/* 0B15FC 001B14FC 11000224 */  addiu       $2, $0, 0x11
/* 0B1600 001B1500 EC03A2AF */  sw          $2, 0x3EC($29)
/* 0B1604 001B1504 D48B848F */  lw          $4, -0x742C($28)
/* 0B1608 001B1508 282E4072 */  paddub      $5, $18, $0
/* 0B160C 001B150C E003A627 */  addiu       $6, $29, 0x3E0
/* 0B1610 001B1510 F003A727 */  addiu       $7, $29, 0x3F0
/* 0B1614 001B1514 0070050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_
/* 0B1618 001B1518 00000000 */   nop
/* 0B161C 001B151C 4A000010 */  b           .L001B1648
/* 0B1620 001B1520 00000000 */   nop
.L001B1524:
/* 0B1624 001B1524 0A004228 */  slti        $2, $2, 0xA
/* 0B1628 001B1528 04004014 */  bnez        $2, .L001B153C
/* 0B162C 001B152C 00000000 */   nop
/* 0B1630 001B1530 45021024 */  addiu       $16, $0, 0x245
/* 0B1634 001B1534 02000010 */  b           .L001B1540
/* 0B1638 001B1538 00000000 */   nop
.L001B153C:
/* 0B163C 001B153C 3F021024 */  addiu       $16, $0, 0x23F
.L001B1540:
/* 0B1640 001B1540 BC00A28F */  lw          $2, 0xBC($29)
/* 0B1644 001B1544 01004324 */  addiu       $3, $2, 0x1
/* 0B1648 001B1548 0A006228 */  slti        $2, $3, 0xA
/* 0B164C 001B154C 1F004014 */  bnez        $2, .L001B15CC
/* 0B1650 001B1550 00000000 */   nop
/* 0B1654 001B1554 0A000224 */  addiu       $2, $0, 0xA
/* 0B1658 001B1558 1A006200 */  div         $0, $3, $2
/* 0B165C 001B155C 02004014 */  bnez        $2, .L001B1568
/* 0B1660 001B1560 00000000 */   nop
/* 0B1664 001B1564 CD010000 */  break       0, 7
.L001B1568:
/* 0B1668 001B1568 12180000 */  mflo        $3
/* 0B166C 001B156C 40100300 */  sll         $2, $3, 1
/* 0B1670 001B1570 21104300 */  addu        $2, $2, $3
/* 0B1674 001B1574 80100200 */  sll         $2, $2, 2
/* 0B1678 001B1578 1004A2AF */  sw          $2, 0x410($29)
/* 0B167C 001B157C 9E000224 */  addiu       $2, $0, 0x9E
/* 0B1680 001B1580 1404A2AF */  sw          $2, 0x414($29)
/* 0B1684 001B1584 0C000224 */  addiu       $2, $0, 0xC
/* 0B1688 001B1588 1804A2AF */  sw          $2, 0x418($29)
/* 0B168C 001B158C 12000224 */  addiu       $2, $0, 0x12
/* 0B1690 001B1590 1C04A2AF */  sw          $2, 0x41C($29)
/* 0B1694 001B1594 FCFF0226 */  addiu       $2, $16, -0x4
/* 0B1698 001B1598 0004A2AF */  sw          $2, 0x400($29)
/* 0B169C 001B159C 1200A226 */  addiu       $2, $21, 0x12
/* 0B16A0 001B15A0 0404A2AF */  sw          $2, 0x404($29)
/* 0B16A4 001B15A4 0E000224 */  addiu       $2, $0, 0xE
/* 0B16A8 001B15A8 0804A2AF */  sw          $2, 0x408($29)
/* 0B16AC 001B15AC 11000224 */  addiu       $2, $0, 0x11
/* 0B16B0 001B15B0 0C04A2AF */  sw          $2, 0x40C($29)
/* 0B16B4 001B15B4 D48B848F */  lw          $4, -0x742C($28)
/* 0B16B8 001B15B8 282E4072 */  paddub      $5, $18, $0
/* 0B16BC 001B15BC 0004A627 */  addiu       $6, $29, 0x400
/* 0B16C0 001B15C0 1004A727 */  addiu       $7, $29, 0x410
/* 0B16C4 001B15C4 0070050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_
/* 0B16C8 001B15C8 00000000 */   nop
.L001B15CC:
/* 0B16CC 001B15CC BC00A28F */  lw          $2, 0xBC($29)
/* 0B16D0 001B15D0 01004324 */  addiu       $3, $2, 0x1
/* 0B16D4 001B15D4 0A000224 */  addiu       $2, $0, 0xA
/* 0B16D8 001B15D8 1A006200 */  div         $0, $3, $2
/* 0B16DC 001B15DC 00000000 */  nop
/* 0B16E0 001B15E0 00000000 */  nop
/* 0B16E4 001B15E4 10180000 */  mfhi        $3
/* 0B16E8 001B15E8 40100300 */  sll         $2, $3, 1
/* 0B16EC 001B15EC 21104300 */  addu        $2, $2, $3
/* 0B16F0 001B15F0 80100200 */  sll         $2, $2, 2
/* 0B16F4 001B15F4 3004A2AF */  sw          $2, 0x430($29)
/* 0B16F8 001B15F8 9E000224 */  addiu       $2, $0, 0x9E
/* 0B16FC 001B15FC 3404A2AF */  sw          $2, 0x434($29)
/* 0B1700 001B1600 0C000224 */  addiu       $2, $0, 0xC
/* 0B1704 001B1604 3804A2AF */  sw          $2, 0x438($29)
/* 0B1708 001B1608 12000224 */  addiu       $2, $0, 0x12
/* 0B170C 001B160C 3C04A2AF */  sw          $2, 0x43C($29)
/* 0B1710 001B1610 09000226 */  addiu       $2, $16, 0x9
/* 0B1714 001B1614 2004A2AF */  sw          $2, 0x420($29)
/* 0B1718 001B1618 1200A226 */  addiu       $2, $21, 0x12
/* 0B171C 001B161C 2404A2AF */  sw          $2, 0x424($29)
/* 0B1720 001B1620 0E000224 */  addiu       $2, $0, 0xE
/* 0B1724 001B1624 2804A2AF */  sw          $2, 0x428($29)
/* 0B1728 001B1628 11000224 */  addiu       $2, $0, 0x11
/* 0B172C 001B162C 2C04A2AF */  sw          $2, 0x42C($29)
/* 0B1730 001B1630 D48B848F */  lw          $4, -0x742C($28)
/* 0B1734 001B1634 282E4072 */  paddub      $5, $18, $0
/* 0B1738 001B1638 2004A627 */  addiu       $6, $29, 0x420
/* 0B173C 001B163C 3004A727 */  addiu       $7, $29, 0x430
/* 0B1740 001B1640 0070050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_
/* 0B1744 001B1644 00000000 */   nop
.L001B1648:
/* 0B1748 001B1648 80101400 */  sll         $2, $20, 2
/* 0B174C 001B164C 21105400 */  addu        $2, $2, $20
/* 0B1750 001B1650 C0A00200 */  sll         $20, $2, 3
/* 0B1754 001B1654 4A000224 */  addiu       $2, $0, 0x4A
/* 0B1758 001B1658 5004A2AF */  sw          $2, 0x450($29)
/* 0B175C 001B165C 48000224 */  addiu       $2, $0, 0x48
/* 0B1760 001B1660 5404A2AF */  sw          $2, 0x454($29)
/* 0B1764 001B1664 10000324 */  addiu       $3, $0, 0x10
/* 0B1768 001B1668 5804A3AF */  sw          $3, 0x458($29)
/* 0B176C 001B166C 5C04A3AF */  sw          $3, 0x45C($29)
/* 0B1770 001B1670 FC008226 */  addiu       $2, $20, 0xFC
/* 0B1774 001B1674 4004A2AF */  sw          $2, 0x440($29)
/* 0B1778 001B1678 4404B5AF */  sw          $21, 0x444($29)
/* 0B177C 001B167C 4804A3AF */  sw          $3, 0x448($29)
/* 0B1780 001B1680 4C04A3AF */  sw          $3, 0x44C($29)
/* 0B1784 001B1684 D48B848F */  lw          $4, -0x742C($28)
/* 0B1788 001B1688 282E4072 */  paddub      $5, $18, $0
/* 0B178C 001B168C 4004A627 */  addiu       $6, $29, 0x440
/* 0B1790 001B1690 5004A727 */  addiu       $7, $29, 0x450
/* 0B1794 001B1694 0070050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_
/* 0B1798 001B1698 00000000 */   nop
/* 0B179C 001B169C 5A000224 */  addiu       $2, $0, 0x5A
/* 0B17A0 001B16A0 7004A2AF */  sw          $2, 0x470($29)
/* 0B17A4 001B16A4 48000224 */  addiu       $2, $0, 0x48
/* 0B17A8 001B16A8 7404A2AF */  sw          $2, 0x474($29)
/* 0B17AC 001B16AC 10000324 */  addiu       $3, $0, 0x10
/* 0B17B0 001B16B0 7804A3AF */  sw          $3, 0x478($29)
/* 0B17B4 001B16B4 7C04A3AF */  sw          $3, 0x47C($29)
/* 0B17B8 001B16B8 13018226 */  addiu       $2, $20, 0x113
/* 0B17BC 001B16BC 6004A2AF */  sw          $2, 0x460($29)
/* 0B17C0 001B16C0 6404B5AF */  sw          $21, 0x464($29)
/* 0B17C4 001B16C4 6804A3AF */  sw          $3, 0x468($29)
/* 0B17C8 001B16C8 6C04A3AF */  sw          $3, 0x46C($29)
/* 0B17CC 001B16CC D48B848F */  lw          $4, -0x742C($28)
/* 0B17D0 001B16D0 282E4072 */  paddub      $5, $18, $0
/* 0B17D4 001B16D4 6004A627 */  addiu       $6, $29, 0x460
/* 0B17D8 001B16D8 7004A727 */  addiu       $7, $29, 0x470
/* 0B17DC 001B16DC 0070050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_
/* 0B17E0 001B16E0 00000000 */   nop
/* 0B17E4 001B16E4 4A000224 */  addiu       $2, $0, 0x4A
/* 0B17E8 001B16E8 9004A2AF */  sw          $2, 0x490($29)
/* 0B17EC 001B16EC 58000224 */  addiu       $2, $0, 0x58
/* 0B17F0 001B16F0 9404A2AF */  sw          $2, 0x494($29)
/* 0B17F4 001B16F4 10000324 */  addiu       $3, $0, 0x10
/* 0B17F8 001B16F8 9804A3AF */  sw          $3, 0x498($29)
/* 0B17FC 001B16FC 9C04A3AF */  sw          $3, 0x49C($29)
/* 0B1800 001B1700 FC008226 */  addiu       $2, $20, 0xFC
/* 0B1804 001B1704 8004A2AF */  sw          $2, 0x480($29)
/* 0B1808 001B1708 1600A226 */  addiu       $2, $21, 0x16
/* 0B180C 001B170C 8404A2AF */  sw          $2, 0x484($29)
/* 0B1810 001B1710 8804A3AF */  sw          $3, 0x488($29)
/* 0B1814 001B1714 8C04A3AF */  sw          $3, 0x48C($29)
/* 0B1818 001B1718 D48B848F */  lw          $4, -0x742C($28)
/* 0B181C 001B171C 282E4072 */  paddub      $5, $18, $0
/* 0B1820 001B1720 8004A627 */  addiu       $6, $29, 0x480
/* 0B1824 001B1724 9004A727 */  addiu       $7, $29, 0x490
/* 0B1828 001B1728 0070050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_
/* 0B182C 001B172C 00000000 */   nop
/* 0B1830 001B1730 5A000224 */  addiu       $2, $0, 0x5A
/* 0B1834 001B1734 B004A2AF */  sw          $2, 0x4B0($29)
/* 0B1838 001B1738 58000224 */  addiu       $2, $0, 0x58
/* 0B183C 001B173C B404A2AF */  sw          $2, 0x4B4($29)
/* 0B1840 001B1740 10000324 */  addiu       $3, $0, 0x10
/* 0B1844 001B1744 B804A3AF */  sw          $3, 0x4B8($29)
/* 0B1848 001B1748 BC04A3AF */  sw          $3, 0x4BC($29)
/* 0B184C 001B174C 13018226 */  addiu       $2, $20, 0x113
/* 0B1850 001B1750 A004A2AF */  sw          $2, 0x4A0($29)
/* 0B1854 001B1754 1600A226 */  addiu       $2, $21, 0x16
/* 0B1858 001B1758 A404A2AF */  sw          $2, 0x4A4($29)
/* 0B185C 001B175C A804A3AF */  sw          $3, 0x4A8($29)
/* 0B1860 001B1760 AC04A3AF */  sw          $3, 0x4AC($29)
/* 0B1864 001B1764 D48B848F */  lw          $4, -0x742C($28)
/* 0B1868 001B1768 282E4072 */  paddub      $5, $18, $0
/* 0B186C 001B176C A004A627 */  addiu       $6, $29, 0x4A0
/* 0B1870 001B1770 B004A727 */  addiu       $7, $29, 0x4B0
/* 0B1874 001B1774 0070050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_
/* 0B1878 001B1778 00000000 */   nop
/* 0B187C 001B177C DC01013C */  lui         $1, %hi(BtActStatus + 0x146)
/* 0B1880 001B1780 C6452284 */  lh          $2, %lo(BtActStatus + 0x146)($1)
/* 0B1884 001B1784 23A8A202 */  subu        $21, $21, $2
/* 0B1888 001B1788 6A00B026 */  addiu       $16, $21, 0x6A
/* 0B188C 001B178C 78000224 */  addiu       $2, $0, 0x78
/* 0B1890 001B1790 D004A2AF */  sw          $2, 0x4D0($29)
/* 0B1894 001B1794 37000224 */  addiu       $2, $0, 0x37
/* 0B1898 001B1798 D404A2AF */  sw          $2, 0x4D4($29)
/* 0B189C 001B179C 2A000424 */  addiu       $4, $0, 0x2A
/* 0B18A0 001B17A0 D804A4AF */  sw          $4, 0x4D8($29)
/* 0B18A4 001B17A4 1D000324 */  addiu       $3, $0, 0x1D
/* 0B18A8 001B17A8 DC04A3AF */  sw          $3, 0x4DC($29)
/* 0B18AC 001B17AC 18000224 */  addiu       $2, $0, 0x18
/* 0B18B0 001B17B0 C004A2AF */  sw          $2, 0x4C0($29)
/* 0B18B4 001B17B4 8C010224 */  addiu       $2, $0, 0x18C
/* 0B18B8 001B17B8 C404A2AF */  sw          $2, 0x4C4($29)
/* 0B18BC 001B17BC C804A4AF */  sw          $4, 0x4C8($29)
/* 0B18C0 001B17C0 CC04A3AF */  sw          $3, 0x4CC($29)
/* 0B18C4 001B17C4 FF000832 */  andi        $8, $16, 0xFF
/* 0B18C8 001B17C8 D48B848F */  lw          $4, -0x742C($28)
/* 0B18CC 001B17CC 282E2072 */  paddub      $5, $17, $0
/* 0B18D0 001B17D0 C004A627 */  addiu       $6, $29, 0x4C0
/* 0B18D4 001B17D4 D004A727 */  addiu       $7, $29, 0x4D0
/* 0B18D8 001B17D8 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 0B18DC 001B17DC 00000000 */   nop
/* 0B18E0 001B17E0 A2000224 */  addiu       $2, $0, 0xA2
/* 0B18E4 001B17E4 F004A2AF */  sw          $2, 0x4F0($29)
/* 0B18E8 001B17E8 37000224 */  addiu       $2, $0, 0x37
/* 0B18EC 001B17EC F404A2AF */  sw          $2, 0x4F4($29)
/* 0B18F0 001B17F0 2B000424 */  addiu       $4, $0, 0x2B
/* 0B18F4 001B17F4 F804A4AF */  sw          $4, 0x4F8($29)
/* 0B18F8 001B17F8 10000324 */  addiu       $3, $0, 0x10
/* 0B18FC 001B17FC FC04A3AF */  sw          $3, 0x4FC($29)
/* 0B1900 001B1800 45000224 */  addiu       $2, $0, 0x45
/* 0B1904 001B1804 E004A2AF */  sw          $2, 0x4E0($29)
/* 0B1908 001B1808 88010224 */  addiu       $2, $0, 0x188
/* 0B190C 001B180C E404A2AF */  sw          $2, 0x4E4($29)
/* 0B1910 001B1810 E804A4AF */  sw          $4, 0x4E8($29)
/* 0B1914 001B1814 EC04A3AF */  sw          $3, 0x4EC($29)
/* 0B1918 001B1818 FF000832 */  andi        $8, $16, 0xFF
/* 0B191C 001B181C D48B848F */  lw          $4, -0x742C($28)
/* 0B1920 001B1820 282E2072 */  paddub      $5, $17, $0
/* 0B1924 001B1824 E004A627 */  addiu       $6, $29, 0x4E0
/* 0B1928 001B1828 F004A727 */  addiu       $7, $29, 0x4F0
/* 0B192C 001B182C C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 0B1930 001B1830 00000000 */   nop
/* 0B1934 001B1834 789C838F */  lw          $3, -0x6388($28)
/* 0B1938 001B1838 04006580 */  lb          $5, 0x4($3)
/* 0B193C 001B183C 28360070 */  paddub      $6, $0, $0
/* 0B1940 001B1840 283E0070 */  paddub      $7, $0, $0
/* 0B1944 001B1844 A80A0224 */  addiu       $2, $0, 0xAA8
/* 0B1948 001B1848 1810A200 */  mult        $2, $5, $2
/* 0B194C 001B184C 21204300 */  addu        $4, $2, $3
/* 0B1950 001B1850 2110A300 */  addu        $2, $5, $3
/* 0B1954 001B1854 40434380 */  lb          $3, 0x4340($2)
/* 0B1958 001B1858 40110300 */  sll         $2, $3, 5
/* 0B195C 001B185C 23104300 */  subu        $2, $2, $3
/* 0B1960 001B1860 C0100200 */  sll         $2, $2, 3
/* 0B1964 001B1864 21104400 */  addu        $2, $2, $4
/* 0B1968 001B1868 0C454484 */  lh          $4, 0x450C($2)
/* 0B196C 001B186C 80180500 */  sll         $3, $5, 2
/* 0B1970 001B1870 2700023C */  lui         $2, %hi(defWeapon)
/* 0B1974 001B1874 20B04224 */  addiu       $2, $2, %lo(defWeapon)
/* 0B1978 001B1878 21104300 */  addu        $2, $2, $3
/* 0B197C 001B187C 0000438C */  lw          $3, 0x0($2)
/* 0B1980 001B1880 01006224 */  addiu       $2, $3, 0x1
/* 0B1984 001B1884 02008214 */  bne         $4, $2, .L001B1890
/* 0B1988 001B1888 00000000 */   nop
/* 0B198C 001B188C 20000724 */  addiu       $7, $0, 0x20
.L001B1890:
/* 0B1990 001B1890 03008314 */  bne         $4, $3, .L001B18A0
/* 0B1994 001B1894 00000000 */   nop
/* 0B1998 001B1898 20000624 */  addiu       $6, $0, 0x20
/* 0B199C 001B189C 283EC070 */  paddub      $7, $6, $0
.L001B18A0:
/* 0B19A0 001B18A0 1005A6AF */  sw          $6, 0x510($29)
/* 0B19A4 001B18A4 1405A7AF */  sw          $7, 0x514($29)
/* 0B19A8 001B18A8 20000324 */  addiu       $3, $0, 0x20
/* 0B19AC 001B18AC 1805A3AF */  sw          $3, 0x518($29)
/* 0B19B0 001B18B0 1C05A3AF */  sw          $3, 0x51C($29)
/* 0B19B4 001B18B4 1D000224 */  addiu       $2, $0, 0x1D
/* 0B19B8 001B18B8 0005A2AF */  sw          $2, 0x500($29)
/* 0B19BC 001B18BC 84010224 */  addiu       $2, $0, 0x184
/* 0B19C0 001B18C0 0405A2AF */  sw          $2, 0x504($29)
/* 0B19C4 001B18C4 0805A3AF */  sw          $3, 0x508($29)
/* 0B19C8 001B18C8 0C05A3AF */  sw          $3, 0x50C($29)
/* 0B19CC 001B18CC FF000832 */  andi        $8, $16, 0xFF
/* 0B19D0 001B18D0 D48B848F */  lw          $4, -0x742C($28)
/* 0B19D4 001B18D4 282E2072 */  paddub      $5, $17, $0
/* 0B19D8 001B18D8 0005A627 */  addiu       $6, $29, 0x500
/* 0B19DC 001B18DC 1005A727 */  addiu       $7, $29, 0x510
/* 0B19E0 001B18E0 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 0B19E4 001B18E4 00000000 */   nop
/* 0B19E8 001B18E8 A000BF7B */  lq          $31, 0xA0($29)
/* 0B19EC 001B18EC 9000BE7B */  lq          $30, 0x90($29)
/* 0B19F0 001B18F0 8000B77B */  lq          $23, 0x80($29)
/* 0B19F4 001B18F4 7000B67B */  lq          $22, 0x70($29)
/* 0B19F8 001B18F8 6000B57B */  lq          $21, 0x60($29)
/* 0B19FC 001B18FC 5000B47B */  lq          $20, 0x50($29)
/* 0B1A00 001B1900 4000B37B */  lq          $19, 0x40($29)
/* 0B1A04 001B1904 3000B27B */  lq          $18, 0x30($29)
/* 0B1A08 001B1908 2000B17B */  lq          $17, 0x20($29)
/* 0B1A0C 001B190C 1000B07B */  lq          $16, 0x10($29)
/* 0B1A10 001B1910 0800B6C7 */  lwc1        $f22, 0x8($29)
/* 0B1A14 001B1914 0400B5C7 */  lwc1        $f21, 0x4($29)
/* 0B1A18 001B1918 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 0B1A1C 001B191C 2005BD27 */  addiu       $29, $29, 0x520
/* 0B1A20 001B1920 0800E003 */  jr          $31
/* 0B1A24 001B1924 00000000 */   nop
/* 0B1A28 001B1928 00000000 */  nop
/* 0B1A2C 001B192C 00000000 */  nop
