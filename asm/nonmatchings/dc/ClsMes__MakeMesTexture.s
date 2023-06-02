.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MakeMesTexture__6ClsMesFi
/* 50750 00150650 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 50754 00150654 2000BF7F */  sq         $31, 0x20($sp)
/* 50758 00150658 1000B17F */  sq         $17, 0x10($sp)
/* 5075C 0015065C 0000B07F */  sq         $16, 0x0($sp)
/* 50760 00150660 288E8070 */  paddub     $17, $4, $0
/* 50764 00150664 2886A070 */  paddub     $16, $5, $0
/* 50768 00150668 BC1690AC */  sw         $16, 0x16BC($4)
/* 5076C 0015066C 3400828C */  lw         $2, 0x34($4)
/* 50770 00150670 04004010 */  beqz       $2, .L00150684
/* 50774 00150674 00000000 */   nop
/* 50778 00150678 900020AE */  sw         $0, 0x90($17)
/* 5077C 0015067C 01000224 */  addiu      $2, $0, 0x1
/* 50780 00150680 940022AE */  sw         $2, 0x94($17)
.L00150684:
/* 50784 00150684 AC0020AE */  sw         $0, 0xAC($17)
/* 50788 00150688 B41620AE */  sw         $0, 0x16B4($17)
/* 5078C 0015068C 28262072 */  paddub     $4, $17, $0
/* 50790 00150690 4C38050C */  jal        MyTextureMake_InitAll__6ClsMesFv
/* 50794 00150694 00000000 */   nop
/* 50798 00150698 28262072 */  paddub     $4, $17, $0
/* 5079C 0015069C 282E0072 */  paddub     $5, $16, $0
/* 507A0 001506A0 3000A627 */  addiu      $6, $sp, 0x30
/* 507A4 001506A4 583F050C */  jal        NeedMesWinWH__6ClsMesFiPi
/* 507A8 001506A8 00000000 */   nop
/* 507AC 001506AC 3400A627 */  addiu      $6, $sp, 0x34
/* 507B0 001506B0 0000C28C */  lw         $2, 0x0($6)
/* 507B4 001506B4 01004224 */  addiu      $2, $2, 0x1
/* 507B8 001506B8 0000C2AC */  sw         $2, 0x0($6)
/* 507BC 001506BC 3C00A727 */  addiu      $7, $sp, 0x3C
/* 507C0 001506C0 0000E38C */  lw         $3, 0x0($7)
/* 507C4 001506C4 0C00228E */  lw         $2, 0xC($17)
/* 507C8 001506C8 21106200 */  addu       $2, $3, $2
/* 507CC 001506CC 0000E2AC */  sw         $2, 0x0($7)
/* 507D0 001506D0 3000A28F */  lw         $2, 0x30($sp)
/* 507D4 001506D4 180022AE */  sw         $2, 0x18($17)
/* 507D8 001506D8 0000C28C */  lw         $2, 0x0($6)
/* 507DC 001506DC 1C0022AE */  sw         $2, 0x1C($17)
/* 507E0 001506E0 3800A28F */  lw         $2, 0x38($sp)
/* 507E4 001506E4 240022AE */  sw         $2, 0x24($17)
/* 507E8 001506E8 0000E28C */  lw         $2, 0x0($7)
/* 507EC 001506EC 280022AE */  sw         $2, 0x28($17)
/* 507F0 001506F0 1800238E */  lw         $3, 0x18($17)
/* 507F4 001506F4 04006128 */  slti       $at, $3, 0x4
/* 507F8 001506F8 08002010 */  beqz       $at, .L0015071C
/* 507FC 001506FC 00000000 */   nop
/* 50800 00150700 0800238E */  lw         $3, 0x8($17)
/* 50804 00150704 C0100300 */  sll        $2, $3, 3
/* 50808 00150708 23104300 */  subu       $2, $2, $3
/* 5080C 0015070C 40100200 */  sll        $2, $2, 1
/* 50810 00150710 4C0022AE */  sw         $2, 0x4C($17)
/* 50814 00150714 0D000010 */  b          .L0015074C
/* 50818 00150718 00000000 */   nop
.L0015071C:
/* 5081C 0015071C A040023C */  lui        $2, (0x40A00000 >> 16)
/* 50820 00150720 00088244 */  mtc1       $2, $f1
/* 50824 00150724 00008344 */  mtc1       $3, $f0
/* 50828 00150728 00000000 */  nop
/* 5082C 0015072C 20008046 */  cvt.s.w    $f0, $f0
/* 50830 00150730 00080046 */  add.s      $f0, $f1, $f0
/* 50834 00150734 000B0046 */  add.s      $f12, $f1, $f0
/* 50838 00150738 2C44040C */  jal        fptosi
/* 5083C 0015073C 00000000 */   nop
/* 50840 00150740 0800238E */  lw         $3, 0x8($17)
/* 50844 00150744 18106200 */  mult       $2, $3, $2
/* 50848 00150748 4C0022AE */  sw         $2, 0x4C($17)
.L0015074C:
/* 5084C 0015074C 1C0020C6 */  lwc1       $f0, 0x1C($17)
/* 50850 00150750 20008046 */  cvt.s.w    $f0, $f0
/* 50854 00150754 C03F023C */  lui        $2, (0x3FC00000 >> 16)
/* 50858 00150758 00088244 */  mtc1       $2, $f1
/* 5085C 0015075C 00000000 */  nop
/* 50860 00150760 00080046 */  add.s      $f0, $f1, $f0
/* 50864 00150764 000B0046 */  add.s      $f12, $f1, $f0
/* 50868 00150768 2C44040C */  jal        fptosi
/* 5086C 0015076C 00000000 */   nop
/* 50870 00150770 0C00238E */  lw         $3, 0xC($17)
/* 50874 00150774 18106200 */  mult       $2, $3, $2
/* 50878 00150778 500022AE */  sw         $2, 0x50($17)
/* 5087C 0015077C 080020C6 */  lwc1       $f0, 0x8($17)
/* 50880 00150780 60008046 */  cvt.s.w    $f1, $f0
/* 50884 00150784 A040023C */  lui        $2, (0x40A00000 >> 16)
/* 50888 00150788 00008244 */  mtc1       $2, $f0
/* 5088C 0015078C 00000000 */  nop
/* 50890 00150790 02030146 */  mul.s      $f12, $f0, $f1
/* 50894 00150794 2C44040C */  jal        fptosi
/* 50898 00150798 00000000 */   nop
/* 5089C 0015079C 0000238E */  lw         $3, 0x0($17)
/* 508A0 001507A0 23106200 */  subu       $2, $3, $2
/* 508A4 001507A4 440022AE */  sw         $2, 0x44($17)
/* 508A8 001507A8 0C0020C6 */  lwc1       $f0, 0xC($17)
/* 508AC 001507AC 60008046 */  cvt.s.w    $f1, $f0
/* 508B0 001507B0 C03F023C */  lui        $2, (0x3FC00000 >> 16)
/* 508B4 001507B4 00008244 */  mtc1       $2, $f0
/* 508B8 001507B8 00000000 */  nop
/* 508BC 001507BC 02030146 */  mul.s      $f12, $f0, $f1
/* 508C0 001507C0 2C44040C */  jal        fptosi
/* 508C4 001507C4 00000000 */   nop
/* 508C8 001507C8 0400238E */  lw         $3, 0x4($17)
/* 508CC 001507CC 23106200 */  subu       $2, $3, $2
/* 508D0 001507D0 480022AE */  sw         $2, 0x48($17)
/* 508D4 001507D4 28262072 */  paddub     $4, $17, $0
/* 508D8 001507D8 282E0072 */  paddub     $5, $16, $0
/* 508DC 001507DC 343E050C */  jal        MakeMesWinTbl__6ClsMesFi
/* 508E0 001507E0 00000000 */   nop
/* 508E4 001507E4 03004010 */  beqz       $2, .L001507F4
/* 508E8 001507E8 00000000 */   nop
/* 508EC 001507EC A416238E */  lw         $3, 0x16A4($17)
/* 508F0 001507F0 200023AE */  sw         $3, 0x20($17)
.L001507F4:
/* 508F4 001507F4 2000BF7B */  lq         $31, 0x20($sp)
/* 508F8 001507F8 1000B17B */  lq         $17, 0x10($sp)
/* 508FC 001507FC 0000B07B */  lq         $16, 0x0($sp)
/* 50900 00150800 4000BD27 */  addiu      $sp, $sp, 0x40
/* 50904 00150804 0800E003 */  jr         $31
/* 50908 00150808 00000000 */   nop
/* 5090C 0015080C 00000000 */  nop
