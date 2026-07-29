.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel InitProcTitle__Fv
/* 025A60 01DD1760 B0FFBD27 */  addiu       $29, $29, -0x50
/* 025A64 01DD1764 0000BF7F */  sq          $31, 0x0($29)
/* 025A68 01DD1768 DE01023C */  lui         $2, %hi(LIT_1674__3)
/* 025A6C 01DD176C 70BA4524 */  addiu       $5, $2, %lo(LIT_1674__3)
/* 025A70 01DD1770 1000A427 */  addiu       $4, $29, 0x10
/* 025A74 01DD1774 03000324 */  addiu       $3, $0, 0x3
.L01DD1778_2D6F78:
/* 025A78 01DD1778 0000A278 */  lq          $2, 0x0($5)
/* 025A7C 01DD177C 1000A524 */  addiu       $5, $5, 0x10
/* 025A80 01DD1780 FFFF6324 */  addiu       $3, $3, -0x1
/* 025A84 01DD1784 0000827C */  sq          $2, 0x0($4)
/* 025A88 01DD1788 10008424 */  addiu       $4, $4, 0x10
/* 025A8C 01DD178C FAFF601C */  bgtz        $3, .L01DD1778_2D6F78
/* 025A90 01DD1790 00000000 */   nop
/* 025A94 01DD1794 0000A3DC */  ld          $3, 0x0($5)
/* 025A98 01DD1798 0800A2C4 */  lwc1        $f2, 0x8($5)
/* 025A9C 01DD179C 000083FC */  sd          $3, 0x0($4)
/* 025AA0 01DD17A0 080082E4 */  swc1        $f2, 0x8($4)
/* 025AA4 01DD17A4 948B848F */  lw          $4, -0x746C($28)
/* 025AA8 01DD17A8 DE01023C */  lui         $2, %hi(LIT_1676__2)
/* 025AAC 01DD17AC C80B4524 */  addiu       $5, $2, %lo(LIT_1676__2)
/* 025AB0 01DD17B0 28360070 */  paddub      $6, $0, $0
/* 025AB4 01DD17B4 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 025AB8 01DD17B8 00000000 */   nop
/* 025ABC 01DD17BC 3400A2AF */  sw          $2, 0x34($29)
/* 025AC0 01DD17C0 C701023C */  lui         $2, %hi(TexManager)
/* 025AC4 01DD17C4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 025AC8 01DD17C8 E03F0524 */  addiu       $5, $0, 0x3FE0
/* 025ACC 01DD17CC F0C3040C */  jal         Initialize__15CTextureManagerFi
/* 025AD0 01DD17D0 00000000 */   nop
/* 025AD4 01DD17D4 C701023C */  lui         $2, %hi(TexManager)
/* 025AD8 01DD17D8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 025ADC 01DD17DC FFFF0524 */  addiu       $5, $0, -0x1
/* 025AE0 01DD17E0 1000A627 */  addiu       $6, $29, 0x10
/* 025AE4 01DD17E4 C8CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 025AE8 01DD17E8 00000000 */   nop
/* 025AEC 01DD17EC 0000BF7B */  lq          $31, 0x0($29)
/* 025AF0 01DD17F0 5000BD27 */  addiu       $29, $29, 0x50
/* 025AF4 01DD17F4 0800E003 */  jr          $31
/* 025AF8 01DD17F8 00000000 */   nop
/* 025AFC 01DD17FC 00000000 */  nop
