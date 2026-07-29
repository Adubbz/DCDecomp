.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawProcD__Fv
/* 022780 01DCE480 A0FFBD27 */  addiu       $29, $29, -0x60
/* 022784 01DCE484 4000BF7F */  sq          $31, 0x40($29)
/* 022788 01DCE488 3000B27F */  sq          $18, 0x30($29)
/* 02278C 01DCE48C 2000B17F */  sq          $17, 0x20($29)
/* 022790 01DCE490 1000B07F */  sq          $16, 0x10($29)
/* 022794 01DCE494 C701023C */  lui         $2, %hi(TexManager)
/* 022798 01DCE498 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 02279C 01DCE49C D48B858F */  lw          $5, -0x742C($28)
/* 0227A0 01DCE4A0 0A000624 */  addiu       $6, $0, 0xA
/* 0227A4 01DCE4A4 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 0227A8 01DCE4A8 00000000 */   nop
/* 0227AC 01DCE4AC E201023C */  lui         $2, %hi(OP_GroundMap)
/* 0227B0 01DCE4B0 30BA4424 */  addiu       $4, $2, %lo(OP_GroundMap)
/* 0227B4 01DCE4B4 700E050C */  jal         Draw__4CMapFv
/* 0227B8 01DCE4B8 00000000 */   nop
/* 0227BC 01DCE4BC E201023C */  lui         $2, %hi(OP_BuildingMap)
/* 0227C0 01DCE4C0 50A44424 */  addiu       $4, $2, %lo(OP_BuildingMap)
/* 0227C4 01DCE4C4 700E050C */  jal         Draw__4CMapFv
/* 0227C8 01DCE4C8 00000000 */   nop
/* 0227CC 01DCE4CC C701023C */  lui         $2, %hi(TexManager)
/* 0227D0 01DCE4D0 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0227D4 01DCE4D4 D48B858F */  lw          $5, -0x742C($28)
/* 0227D8 01DCE4D8 17000624 */  addiu       $6, $0, 0x17
/* 0227DC 01DCE4DC 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 0227E0 01DCE4E0 00000000 */   nop
/* 0227E4 01DCE4E4 C701023C */  lui         $2, %hi(TexManager)
/* 0227E8 01DCE4E8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0227EC 01DCE4EC DE01023C */  lui         $2, %hi(LIT_1137)
/* 0227F0 01DCE4F0 88044524 */  addiu       $5, $2, %lo(LIT_1137)
/* 0227F4 01DCE4F4 FFFF0624 */  addiu       $6, $0, -0x1
/* 0227F8 01DCE4F8 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0227FC 01DCE4FC 00000000 */   nop
/* 022800 01DCE500 280044DC */  ld          $4, 0x28($2)
/* 022804 01DCE504 28C2040C */  jal         MGBeginDrawShadow__F9sceGsTex0
/* 022808 01DCE508 00000000 */   nop
/* 02280C 01DCE50C 28860070 */  paddub      $16, $0, $0
/* 022810 01DCE510 18000010 */  b           .L01DCE574_2D3D74
/* 022814 01DCE514 00000000 */   nop
.L01DCE518_2D3D18:
/* 022818 01DCE518 40101000 */  sll         $2, $16, 1
/* 02281C 01DCE51C 21105000 */  addu        $2, $2, $16
/* 022820 01DCE520 80100200 */  sll         $2, $2, 2
/* 022824 01DCE524 21105000 */  addu        $2, $2, $16
/* 022828 01DCE528 80180200 */  sll         $3, $2, 2
/* 02282C 01DCE52C E301023C */  lui         $2, %hi(CScript + 0x30)
/* 022830 01DCE530 F0E94224 */  addiu       $2, $2, %lo(CScript + 0x30)
/* 022834 01DCE534 21104300 */  addu        $2, $2, $3
/* 022838 01DCE538 00004290 */  lbu         $2, 0x0($2)
/* 02283C 01DCE53C 0C004010 */  beqz        $2, .L01DCE570_2D3D70
/* 022840 01DCE540 00000000 */   nop
/* 022844 01DCE544 B0110224 */  addiu       $2, $0, 0x11B0
/* 022848 01DCE548 18180202 */  mult        $3, $16, $2
/* 02284C 01DCE54C DF01023C */  lui         $2, %hi(Chara__3)
/* 022850 01DCE550 E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 022854 01DCE554 21884300 */  addu        $17, $2, $3
/* 022858 01DCE558 28262072 */  paddub      $4, $17, $0
/* 02285C 01DCE55C 24E3040C */  jal         ShadowStep__10CCharacterFv
/* 022860 01DCE560 00000000 */   nop
/* 022864 01DCE564 28262072 */  paddub      $4, $17, $0
/* 022868 01DCE568 C0E5040C */  jal         DrawShadow__10CCharacterFv
/* 02286C 01DCE56C 00000000 */   nop
.L01DCE570_2D3D70:
/* 022870 01DCE570 01001026 */  addiu       $16, $16, 0x1
.L01DCE574_2D3D74:
/* 022874 01DCE574 0900022A */  slti        $2, $16, 0x9
/* 022878 01DCE578 E7FF4014 */  bnez        $2, .L01DCE518_2D3D18
/* 02287C 01DCE57C 00000000 */   nop
/* 022880 01DCE580 34000424 */  addiu       $4, $0, 0x34
/* 022884 01DCE584 CCC2040C */  jal         MGEndDrawShadow__FUc
/* 022888 01DCE588 00000000 */   nop
/* 02288C 01DCE58C 28860070 */  paddub      $16, $0, $0
/* 022890 01DCE590 29000010 */  b           .L01DCE638_2D3E38
/* 022894 01DCE594 00000000 */   nop
.L01DCE598_2D3D98:
/* 022898 01DCE598 40101000 */  sll         $2, $16, 1
/* 02289C 01DCE59C 21105000 */  addu        $2, $2, $16
/* 0228A0 01DCE5A0 80100200 */  sll         $2, $2, 2
/* 0228A4 01DCE5A4 21105000 */  addu        $2, $2, $16
/* 0228A8 01DCE5A8 80180200 */  sll         $3, $2, 2
/* 0228AC 01DCE5AC E301023C */  lui         $2, %hi(CScript + 0x30)
/* 0228B0 01DCE5B0 F0E94224 */  addiu       $2, $2, %lo(CScript + 0x30)
/* 0228B4 01DCE5B4 21104300 */  addu        $2, $2, $3
/* 0228B8 01DCE5B8 00004290 */  lbu         $2, 0x0($2)
/* 0228BC 01DCE5BC 1D004010 */  beqz        $2, .L01DCE634_2D3E34
/* 0228C0 01DCE5C0 00000000 */   nop
/* 0228C4 01DCE5C4 E401023C */  lui         $2, %hi(CharaTex)
/* 0228C8 01DCE5C8 10D04224 */  addiu       $2, $2, %lo(CharaTex)
/* 0228CC 01DCE5CC 21885000 */  addu        $17, $2, $16
/* 0228D0 01DCE5D0 00002682 */  lb          $6, 0x0($17)
/* 0228D4 01DCE5D4 C701023C */  lui         $2, %hi(TexManager)
/* 0228D8 01DCE5D8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0228DC 01DCE5DC D48B858F */  lw          $5, -0x742C($28)
/* 0228E0 01DCE5E0 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 0228E4 01DCE5E4 00000000 */   nop
/* 0228E8 01DCE5E8 B0110224 */  addiu       $2, $0, 0x11B0
/* 0228EC 01DCE5EC 18180202 */  mult        $3, $16, $2
/* 0228F0 01DCE5F0 DF01023C */  lui         $2, %hi(Chara__3)
/* 0228F4 01DCE5F4 E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 0228F8 01DCE5F8 21904300 */  addu        $18, $2, $3
/* 0228FC 01DCE5FC 00002582 */  lb          $5, 0x0($17)
/* 022900 01DCE600 28264072 */  paddub      $4, $18, $0
/* 022904 01DCE604 14E0040C */  jal         TextureAnime__10CCharacterFi
/* 022908 01DCE608 00000000 */   nop
/* 02290C 01DCE60C 28264072 */  paddub      $4, $18, $0
/* 022910 01DCE610 4CE1040C */  jal         Step__10CCharacterFv
/* 022914 01DCE614 00000000 */   nop
/* 022918 01DCE618 28264072 */  paddub      $4, $18, $0
/* 02291C 01DCE61C 282E0070 */  paddub      $5, $0, $0
/* 022920 01DCE620 94E3040C */  jal         ClothStep__10CCharacterFi
/* 022924 01DCE624 00000000 */   nop
/* 022928 01DCE628 28264072 */  paddub      $4, $18, $0
/* 02292C 01DCE62C C4E4040C */  jal         Draw__10CCharacterFv
/* 022930 01DCE630 00000000 */   nop
.L01DCE634_2D3E34:
/* 022934 01DCE634 01001026 */  addiu       $16, $16, 0x1
.L01DCE638_2D3E38:
/* 022938 01DCE638 0900022A */  slti        $2, $16, 0x9
/* 02293C 01DCE63C D6FF4014 */  bnez        $2, .L01DCE598_2D3D98
/* 022940 01DCE640 00000000 */   nop
/* 022944 01DCE644 C701023C */  lui         $2, %hi(TexManager)
/* 022948 01DCE648 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 02294C 01DCE64C D48B858F */  lw          $5, -0x742C($28)
/* 022950 01DCE650 16000624 */  addiu       $6, $0, 0x16
/* 022954 01DCE654 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 022958 01DCE658 00000000 */   nop
/* 02295C 01DCE65C 5800A427 */  addiu       $4, $29, 0x58
/* 022960 01DCE660 A88A82DF */  ld          $2, -0x7558($28)
/* 022964 01DCE664 000082FC */  sd          $2, 0x0($4)
/* 022968 01DCE668 02000524 */  addiu       $5, $0, 0x2
/* 02296C 01DCE66C 20000624 */  addiu       $6, $0, 0x20
/* 022970 01DCE670 283E0070 */  paddub      $7, $0, $0
/* 022974 01DCE674 B094050C */  jal         DepthOfField__FPfiii
/* 022978 01DCE678 00000000 */   nop
/* 02297C 01DCE67C 4000BF7B */  lq          $31, 0x40($29)
/* 022980 01DCE680 3000B27B */  lq          $18, 0x30($29)
/* 022984 01DCE684 2000B17B */  lq          $17, 0x20($29)
/* 022988 01DCE688 1000B07B */  lq          $16, 0x10($29)
/* 02298C 01DCE68C 6000BD27 */  addiu       $29, $29, 0x60
/* 022990 01DCE690 0800E003 */  jr          $31
/* 022994 01DCE694 00000000 */   nop
/* 022998 01DCE698 00000000 */  nop
/* 02299C 01DCE69C 00000000 */  nop
