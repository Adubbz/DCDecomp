.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SoundProcess__Fv
/* 004750 01DB0450 F0FFBD27 */  addiu       $29, $29, -0x10
/* 004754 01DB0454 0000BF7F */  sq          $31, 0x0($29)
/* 004758 01DB0458 DE01013C */  lui         $1, %hi(CScript__2 + 0x5E0)
/* 00475C 01DB045C E020238C */  lw          $3, %lo(CScript__2 + 0x5E0)($1)
/* 004760 01DB0460 22006014 */  bnez        $3, .L01DB04EC_2B5CEC
/* 004764 01DB0464 00000000 */   nop
/* 004768 01DB0468 DE01013C */  lui         $1, %hi(CScript__2 + 0x5D8)
/* 00476C 01DB046C D820268C */  lw          $6, %lo(CScript__2 + 0x5D8)($1)
/* 004770 01DB0470 3D00C010 */  beqz        $6, .L01DB0568_2B5D68
/* 004774 01DB0474 00000000 */   nop
/* 004778 01DB0478 DE01013C */  lui         $1, %hi(CScript__2 + 0x5D0)
/* 00477C 01DB047C D020248C */  lw          $4, %lo(CScript__2 + 0x5D0)($1)
/* 004780 01DB0480 01000324 */  addiu       $3, $0, 0x1
/* 004784 01DB0484 0E008310 */  beq         $4, $3, .L01DB04C0_2B5CC0
/* 004788 01DB0488 00000000 */   nop
/* 00478C 01DB048C 03008010 */  beqz        $4, .L01DB049C_2B5C9C
/* 004790 01DB0490 00000000 */   nop
/* 004794 01DB0494 11000010 */  b           .L01DB04DC_2B5CDC
/* 004798 01DB0498 00000000 */   nop
.L01DB049C_2B5C9C:
/* 00479C 01DB049C 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0047A0 01DB04A0 00608244 */  mtc1        $2, $f12
/* 0047A4 01DB04A4 0E000424 */  addiu       $4, $0, 0xE
/* 0047A8 01DB04A8 DE01013C */  lui         $1, %hi(CScript__2 + 0x5D4)
/* 0047AC 01DB04AC D420258C */  lw          $5, %lo(CScript__2 + 0x5D4)($1)
/* 0047B0 01DB04B0 84C4760C */  jal         OpPlayVolSE__Fiiif
/* 0047B4 01DB04B4 00000000 */   nop
/* 0047B8 01DB04B8 08000010 */  b           .L01DB04DC_2B5CDC
/* 0047BC 01DB04BC 00000000 */   nop
.L01DB04C0_2B5CC0:
/* 0047C0 01DB04C0 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0047C4 01DB04C4 00608244 */  mtc1        $2, $f12
/* 0047C8 01DB04C8 0C000424 */  addiu       $4, $0, 0xC
/* 0047CC 01DB04CC DE01013C */  lui         $1, %hi(CScript__2 + 0x5D4)
/* 0047D0 01DB04D0 D420258C */  lw          $5, %lo(CScript__2 + 0x5D4)($1)
/* 0047D4 01DB04D4 84C4760C */  jal         OpPlayVolSE__Fiiif
/* 0047D8 01DB04D8 00000000 */   nop
.L01DB04DC_2B5CDC:
/* 0047DC 01DB04DC DE01013C */  lui         $1, %hi(CScript__2 + 0x5D8)
/* 0047E0 01DB04E0 D82020AC */  sw          $0, %lo(CScript__2 + 0x5D8)($1)
/* 0047E4 01DB04E4 20000010 */  b           .L01DB0568_2B5D68
/* 0047E8 01DB04E8 00000000 */   nop
.L01DB04EC_2B5CEC:
/* 0047EC 01DB04EC DE01013C */  lui         $1, %hi(CScript__2 + 0x5D0)
/* 0047F0 01DB04F0 D020248C */  lw          $4, %lo(CScript__2 + 0x5D0)($1)
/* 0047F4 01DB04F4 01000324 */  addiu       $3, $0, 0x1
/* 0047F8 01DB04F8 10008310 */  beq         $4, $3, .L01DB053C_2B5D3C
/* 0047FC 01DB04FC 00000000 */   nop
/* 004800 01DB0500 03008010 */  beqz        $4, .L01DB0510_2B5D10
/* 004804 01DB0504 00000000 */   nop
/* 004808 01DB0508 15000010 */  b           .L01DB0560_2B5D60
/* 00480C 01DB050C 00000000 */   nop
.L01DB0510_2B5D10:
/* 004810 01DB0510 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 004814 01DB0514 0E000524 */  addiu       $5, $0, 0xE
/* 004818 01DB0518 DE01013C */  lui         $1, %hi(CScript__2 + 0x5D4)
/* 00481C 01DB051C D420268C */  lw          $6, %lo(CScript__2 + 0x5D4)($1)
/* 004820 01DB0520 DE01013C */  lui         $1, %hi(CScript__2 + 0x5D8)
/* 004824 01DB0524 D820278C */  lw          $7, %lo(CScript__2 + 0x5D8)($1)
/* 004828 01DB0528 28460070 */  paddub      $8, $0, $0
/* 00482C 01DB052C BC16050C */  jal         SE_Stop__6CSoundFiiii
/* 004830 01DB0530 00000000 */   nop
/* 004834 01DB0534 0A000010 */  b           .L01DB0560_2B5D60
/* 004838 01DB0538 00000000 */   nop
.L01DB053C_2B5D3C:
/* 00483C 01DB053C 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 004840 01DB0540 0C000524 */  addiu       $5, $0, 0xC
/* 004844 01DB0544 DE01013C */  lui         $1, %hi(CScript__2 + 0x5D4)
/* 004848 01DB0548 D420268C */  lw          $6, %lo(CScript__2 + 0x5D4)($1)
/* 00484C 01DB054C DE01013C */  lui         $1, %hi(CScript__2 + 0x5D8)
/* 004850 01DB0550 D820278C */  lw          $7, %lo(CScript__2 + 0x5D8)($1)
/* 004854 01DB0554 28460070 */  paddub      $8, $0, $0
/* 004858 01DB0558 BC16050C */  jal         SE_Stop__6CSoundFiiii
/* 00485C 01DB055C 00000000 */   nop
.L01DB0560_2B5D60:
/* 004860 01DB0560 DE01013C */  lui         $1, %hi(CScript__2 + 0x5E0)
/* 004864 01DB0564 E02020AC */  sw          $0, %lo(CScript__2 + 0x5E0)($1)
.L01DB0568_2B5D68:
/* 004868 01DB0568 DE01013C */  lui         $1, %hi(CScript__2 + 0x5E4)
/* 00486C 01DB056C E420258C */  lw          $5, %lo(CScript__2 + 0x5E4)($1)
/* 004870 01DB0570 4D00A010 */  beqz        $5, .L01DB06A8_2B5EA8
/* 004874 01DB0574 00000000 */   nop
/* 004878 01DB0578 DE01013C */  lui         $1, %hi(CScript__2 + 0x5D0)
/* 00487C 01DB057C D020248C */  lw          $4, %lo(CScript__2 + 0x5D0)($1)
/* 004880 01DB0580 FFFF0324 */  addiu       $3, $0, -0x1
/* 004884 01DB0584 03008310 */  beq         $4, $3, .L01DB0594_2B5D94
/* 004888 01DB0588 00000000 */   nop
/* 00488C 01DB058C 44000010 */  b           .L01DB06A0_2B5EA0
/* 004890 01DB0590 00000000 */   nop
.L01DB0594_2B5D94:
/* 004894 01DB0594 00008544 */  mtc1        $5, $f0
/* 004898 01DB0598 00000000 */  nop
/* 00489C 01DB059C 60008046 */  cvt.s.w     $f1, $f0
/* 0048A0 01DB05A0 0040023C */  lui         $2, (0x40000000 >> 16)
/* 0048A4 01DB05A4 00008244 */  mtc1        $2, $f0
/* 0048A8 01DB05A8 00000000 */  nop
/* 0048AC 01DB05AC 030B0046 */  div.s       $f12, $f1, $f0
/* 0048B0 01DB05B0 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 0048B4 01DB05B4 282E0070 */  paddub      $5, $0, $0
/* 0048B8 01DB05B8 DE01013C */  lui         $1, %hi(CScript__2 + 0x5DC)
/* 0048BC 01DB05BC DC20268C */  lw          $6, %lo(CScript__2 + 0x5DC)($1)
/* 0048C0 01DB05C0 FC16050C */  jal         Fade__6CSoundFifi
/* 0048C4 01DB05C4 00000000 */   nop
/* 0048C8 01DB05C8 DE01013C */  lui         $1, %hi(CScript__2 + 0x5E4)
/* 0048CC 01DB05CC E42020C4 */  lwc1        $f0, %lo(CScript__2 + 0x5E4)($1)
/* 0048D0 01DB05D0 20038046 */  cvt.s.w     $f12, $f0
/* 0048D4 01DB05D4 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 0048D8 01DB05D8 01000524 */  addiu       $5, $0, 0x1
/* 0048DC 01DB05DC DE01013C */  lui         $1, %hi(CScript__2 + 0x5DC)
/* 0048E0 01DB05E0 DC20268C */  lw          $6, %lo(CScript__2 + 0x5DC)($1)
/* 0048E4 01DB05E4 FC16050C */  jal         Fade__6CSoundFifi
/* 0048E8 01DB05E8 00000000 */   nop
/* 0048EC 01DB05EC DE01013C */  lui         $1, %hi(CScript__2 + 0x5E4)
/* 0048F0 01DB05F0 E42020C4 */  lwc1        $f0, %lo(CScript__2 + 0x5E4)($1)
/* 0048F4 01DB05F4 20038046 */  cvt.s.w     $f12, $f0
/* 0048F8 01DB05F8 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 0048FC 01DB05FC 02000524 */  addiu       $5, $0, 0x2
/* 004900 01DB0600 DE01013C */  lui         $1, %hi(CScript__2 + 0x5DC)
/* 004904 01DB0604 DC20268C */  lw          $6, %lo(CScript__2 + 0x5DC)($1)
/* 004908 01DB0608 FC16050C */  jal         Fade__6CSoundFifi
/* 00490C 01DB060C 00000000 */   nop
/* 004910 01DB0610 DE01013C */  lui         $1, %hi(CScript__2 + 0x5E4)
/* 004914 01DB0614 E42020C4 */  lwc1        $f0, %lo(CScript__2 + 0x5E4)($1)
/* 004918 01DB0618 20038046 */  cvt.s.w     $f12, $f0
/* 00491C 01DB061C 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 004920 01DB0620 0F000524 */  addiu       $5, $0, 0xF
/* 004924 01DB0624 DE01013C */  lui         $1, %hi(CScript__2 + 0x5DC)
/* 004928 01DB0628 DC20268C */  lw          $6, %lo(CScript__2 + 0x5DC)($1)
/* 00492C 01DB062C FC16050C */  jal         Fade__6CSoundFifi
/* 004930 01DB0630 00000000 */   nop
/* 004934 01DB0634 DE01013C */  lui         $1, %hi(CScript__2 + 0x5E4)
/* 004938 01DB0638 E42020C4 */  lwc1        $f0, %lo(CScript__2 + 0x5E4)($1)
/* 00493C 01DB063C 20038046 */  cvt.s.w     $f12, $f0
/* 004940 01DB0640 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 004944 01DB0644 0E000524 */  addiu       $5, $0, 0xE
/* 004948 01DB0648 DE01013C */  lui         $1, %hi(CScript__2 + 0x5DC)
/* 00494C 01DB064C DC20268C */  lw          $6, %lo(CScript__2 + 0x5DC)($1)
/* 004950 01DB0650 FC16050C */  jal         Fade__6CSoundFifi
/* 004954 01DB0654 00000000 */   nop
/* 004958 01DB0658 DE01013C */  lui         $1, %hi(CScript__2 + 0x5E4)
/* 00495C 01DB065C E42020C4 */  lwc1        $f0, %lo(CScript__2 + 0x5E4)($1)
/* 004960 01DB0660 20038046 */  cvt.s.w     $f12, $f0
/* 004964 01DB0664 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 004968 01DB0668 0D000524 */  addiu       $5, $0, 0xD
/* 00496C 01DB066C DE01013C */  lui         $1, %hi(CScript__2 + 0x5DC)
/* 004970 01DB0670 DC20268C */  lw          $6, %lo(CScript__2 + 0x5DC)($1)
/* 004974 01DB0674 FC16050C */  jal         Fade__6CSoundFifi
/* 004978 01DB0678 00000000 */   nop
/* 00497C 01DB067C DE01013C */  lui         $1, %hi(CScript__2 + 0x5E4)
/* 004980 01DB0680 E42020C4 */  lwc1        $f0, %lo(CScript__2 + 0x5E4)($1)
/* 004984 01DB0684 20038046 */  cvt.s.w     $f12, $f0
/* 004988 01DB0688 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 00498C 01DB068C 0C000524 */  addiu       $5, $0, 0xC
/* 004990 01DB0690 DE01013C */  lui         $1, %hi(CScript__2 + 0x5DC)
/* 004994 01DB0694 DC20268C */  lw          $6, %lo(CScript__2 + 0x5DC)($1)
/* 004998 01DB0698 FC16050C */  jal         Fade__6CSoundFifi
/* 00499C 01DB069C 00000000 */   nop
.L01DB06A0_2B5EA0:
/* 0049A0 01DB06A0 DE01013C */  lui         $1, %hi(CScript__2 + 0x5E4)
/* 0049A4 01DB06A4 E42020AC */  sw          $0, %lo(CScript__2 + 0x5E4)($1)
.L01DB06A8_2B5EA8:
/* 0049A8 01DB06A8 DE01013C */  lui         $1, %hi(CScript__2 + 0x18)
/* 0049AC 01DB06AC 181B258C */  lw          $5, %lo(CScript__2 + 0x18)($1)
/* 0049B0 01DB06B0 0A00A12C */  sltiu       $1, $5, 0xA
/* 0049B4 01DB06B4 2E002010 */  beqz        $1, .L01DB0770_2B5F70
/* 0049B8 01DB06B8 00000000 */   nop
/* 0049BC 01DB06BC DE01033C */  lui         $3, %hi(LIT_863__2)
/* 0049C0 01DB06C0 D0D76424 */  addiu       $4, $3, %lo(LIT_863__2)
/* 0049C4 01DB06C4 80180500 */  sll         $3, $5, 2
/* 0049C8 01DB06C8 21186400 */  addu        $3, $3, $4
/* 0049CC 01DB06CC 0000638C */  lw          $3, 0x0($3)
/* 0049D0 01DB06D0 08006000 */  jr          $3
/* 0049D4 01DB06D4 00000000 */   nop
/* 0049D8 01DB06D8 E4DE760C */  jal         OpA_SoundProcess__Fv
/* 0049DC 01DB06DC 00000000 */   nop
/* 0049E0 01DB06E0 23000010 */  b           .L01DB0770_2B5F70
/* 0049E4 01DB06E4 00000000 */   nop
/* 0049E8 01DB06E8 48EB760C */  jal         OpB_SoundProcess__Fv
/* 0049EC 01DB06EC 00000000 */   nop
/* 0049F0 01DB06F0 1F000010 */  b           .L01DB0770_2B5F70
/* 0049F4 01DB06F4 00000000 */   nop
/* 0049F8 01DB06F8 48EB760C */  jal         OpB_SoundProcess__Fv
/* 0049FC 01DB06FC 00000000 */   nop
/* 004A00 01DB0700 1B000010 */  b           .L01DB0770_2B5F70
/* 004A04 01DB0704 00000000 */   nop
/* 004A08 01DB0708 08FF760C */  jal         OpC_SoundProcess__Fv
/* 004A0C 01DB070C 00000000 */   nop
/* 004A10 01DB0710 17000010 */  b           .L01DB0770_2B5F70
/* 004A14 01DB0714 00000000 */   nop
/* 004A18 01DB0718 08FF760C */  jal         OpC_SoundProcess__Fv
/* 004A1C 01DB071C 00000000 */   nop
/* 004A20 01DB0720 13000010 */  b           .L01DB0770_2B5F70
/* 004A24 01DB0724 00000000 */   nop
/* 004A28 01DB0728 08FF760C */  jal         OpC_SoundProcess__Fv
/* 004A2C 01DB072C 00000000 */   nop
/* 004A30 01DB0730 0F000010 */  b           .L01DB0770_2B5F70
/* 004A34 01DB0734 00000000 */   nop
/* 004A38 01DB0738 08FF760C */  jal         OpC_SoundProcess__Fv
/* 004A3C 01DB073C 00000000 */   nop
/* 004A40 01DB0740 0B000010 */  b           .L01DB0770_2B5F70
/* 004A44 01DB0744 00000000 */   nop
/* 004A48 01DB0748 08FF760C */  jal         OpC_SoundProcess__Fv
/* 004A4C 01DB074C 00000000 */   nop
/* 004A50 01DB0750 07000010 */  b           .L01DB0770_2B5F70
/* 004A54 01DB0754 00000000 */   nop
/* 004A58 01DB0758 8015770C */  jal         OpD_SoundProcess__Fv
/* 004A5C 01DB075C 00000000 */   nop
/* 004A60 01DB0760 03000010 */  b           .L01DB0770_2B5F70
/* 004A64 01DB0764 00000000 */   nop
/* 004A68 01DB0768 8015770C */  jal         OpD_SoundProcess__Fv
/* 004A6C 01DB076C 00000000 */   nop
.L01DB0770_2B5F70:
/* 004A70 01DB0770 0000BF7B */  lq          $31, 0x0($29)
/* 004A74 01DB0774 1000BD27 */  addiu       $29, $29, 0x10
/* 004A78 01DB0778 0800E003 */  jr          $31
/* 004A7C 01DB077C 00000000 */   nop
