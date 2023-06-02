.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MenuAtoraAfterFadeIn__Fv
/* 11A1B0 0021A0B0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 11A1B4 0021A0B4 0000BF7F */  sq         $31, 0x0($sp)
/* 11A1B8 0021A0B8 DA01023C */  lui        $2, %hi(CommonMenuMes2)
/* 11A1BC 0021A0BC 50234424 */  addiu      $4, $2, %lo(CommonMenuMes2)
/* 11A1C0 0021A0C0 E096858F */  lw         $5, -0x6920($gp)
/* 11A1C4 0021A0C4 8036050C */  jal        SetBuff__6ClsMesFPs
/* 11A1C8 0021A0C8 00000000 */   nop
/* 11A1CC 0021A0CC FFFF0224 */  addiu      $2, $0, -0x1
/* 11A1D0 0021A0D0 DA01013C */  lui        $at, (0x1DA3A0C >> 16)
/* 11A1D4 0021A0D4 0C3A22AC */  sw         $2, (0x1DA3A0C & 0xFFFF)($at)
/* 11A1D8 0021A0D8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11A1DC 0021A0DC DC802484 */  lh         $4, -0x7F24($at)
/* 11A1E0 0021A0E0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11A1E4 0021A0E4 DE802584 */  lh         $5, -0x7F22($at)
/* 11A1E8 0021A0E8 28360070 */  paddub     $6, $0, $0
/* 11A1EC 0021A0EC 6863080C */  jal        AtoraMsgNoGet__Fiii
/* 11A1F0 0021A0F0 00000000 */   nop
/* 11A1F4 0021A0F4 04004004 */  bltz       $2, .L0021A108
/* 11A1F8 0021A0F8 00000000 */   nop
/* 11A1FC 0021A0FC E8034524 */  addiu      $5, $2, 0x3E8
/* 11A200 0021A100 02000010 */  b          .L0021A10C
/* 11A204 0021A104 00000000 */   nop
.L0021A108:
/* 11A208 0021A108 282E0070 */  paddub     $5, $0, $0
.L0021A10C:
/* 11A20C 0021A10C DA01023C */  lui        $2, %hi(CommonMenuMes2)
/* 11A210 0021A110 50234424 */  addiu      $4, $2, %lo(CommonMenuMes2)
/* 11A214 0021A114 5441050C */  jal        MakeMesWin__6ClsMesFi
/* 11A218 0021A118 00000000 */   nop
/* 11A21C 0021A11C 0000BF7B */  lq         $31, 0x0($sp)
/* 11A220 0021A120 1000BD27 */  addiu      $sp, $sp, 0x10
/* 11A224 0021A124 0800E003 */  jr         $31
/* 11A228 0021A128 00000000 */   nop
/* 11A22C 0021A12C 00000000 */  nop
