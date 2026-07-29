.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel OpC_DrawProcess__Fv
/* 014850 01DC0550 B0FDBD27 */  addiu       $29, $29, -0x250
/* 014854 01DC0554 5000BF7F */  sq          $31, 0x50($29)
/* 014858 01DC0558 4000B27F */  sq          $18, 0x40($29)
/* 01485C 01DC055C 3000B17F */  sq          $17, 0x30($29)
/* 014860 01DC0560 2000B07F */  sq          $16, 0x20($29)
/* 014864 01DC0564 1000B4E7 */  swc1        $f20, 0x10($29)
/* 014868 01DC0568 6000A427 */  addiu       $4, $29, 0x60
/* 01486C 01DC056C 2500023C */  lui         $2, %hi(light)
/* 014870 01DC0570 801B4524 */  addiu       $5, $2, %lo(light)
/* 014874 01DC0574 1086040C */  jal         sceVu0CopyMatrix
/* 014878 01DC0578 00000000 */   nop
/* 01487C 01DC057C A000A427 */  addiu       $4, $29, 0xA0
/* 014880 01DC0580 2500023C */  lui         $2, %hi(ambientlight)
/* 014884 01DC0584 001C4524 */  addiu       $5, $2, %lo(ambientlight)
/* 014888 01DC0588 0C86040C */  jal         sceVu0CopyVector
/* 01488C 01DC058C 00000000 */   nop
/* 014890 01DC0590 DD01013C */  lui         $1, %hi(op_fogRate + 0x4)
/* 014894 01DC0594 345C34C4 */  lwc1        $f20, %lo(op_fogRate + 0x4)($1)
/* 014898 01DC0598 DE01013C */  lui         $1, %hi(CScript__2)
/* 01489C 01DC059C 001B238C */  lw          $3, %lo(CScript__2)($1)
/* 0148A0 01DC05A0 63000224 */  addiu       $2, $0, 0x63
/* 0148A4 01DC05A4 37006210 */  beq         $3, $2, .L01DC0684_2C5E84
/* 0148A8 01DC05A8 00000000 */   nop
/* 0148AC 01DC05AC 61000224 */  addiu       $2, $0, 0x61
/* 0148B0 01DC05B0 34006210 */  beq         $3, $2, .L01DC0684_2C5E84
/* 0148B4 01DC05B4 00000000 */   nop
/* 0148B8 01DC05B8 5C000224 */  addiu       $2, $0, 0x5C
/* 0148BC 01DC05BC 31006210 */  beq         $3, $2, .L01DC0684_2C5E84
/* 0148C0 01DC05C0 00000000 */   nop
/* 0148C4 01DC05C4 5B000224 */  addiu       $2, $0, 0x5B
/* 0148C8 01DC05C8 2E006210 */  beq         $3, $2, .L01DC0684_2C5E84
/* 0148CC 01DC05CC 00000000 */   nop
/* 0148D0 01DC05D0 4A000224 */  addiu       $2, $0, 0x4A
/* 0148D4 01DC05D4 2B006210 */  beq         $3, $2, .L01DC0684_2C5E84
/* 0148D8 01DC05D8 00000000 */   nop
/* 0148DC 01DC05DC 40000224 */  addiu       $2, $0, 0x40
/* 0148E0 01DC05E0 1C006210 */  beq         $3, $2, .L01DC0654_2C5E54
/* 0148E4 01DC05E4 00000000 */   nop
/* 0148E8 01DC05E8 3D000224 */  addiu       $2, $0, 0x3D
/* 0148EC 01DC05EC 15006210 */  beq         $3, $2, .L01DC0644_2C5E44
/* 0148F0 01DC05F0 00000000 */   nop
/* 0148F4 01DC05F4 3B000224 */  addiu       $2, $0, 0x3B
/* 0148F8 01DC05F8 12006210 */  beq         $3, $2, .L01DC0644_2C5E44
/* 0148FC 01DC05FC 00000000 */   nop
/* 014900 01DC0600 5A000224 */  addiu       $2, $0, 0x5A
/* 014904 01DC0604 09006210 */  beq         $3, $2, .L01DC062C_2C5E2C
/* 014908 01DC0608 00000000 */   nop
/* 01490C 01DC060C 3E000224 */  addiu       $2, $0, 0x3E
/* 014910 01DC0610 06006210 */  beq         $3, $2, .L01DC062C_2C5E2C
/* 014914 01DC0614 00000000 */   nop
/* 014918 01DC0618 3A000224 */  addiu       $2, $0, 0x3A
/* 01491C 01DC061C 03006210 */  beq         $3, $2, .L01DC062C_2C5E2C
/* 014920 01DC0620 00000000 */   nop
/* 014924 01DC0624 23000010 */  b           .L01DC06B4_2C5EB4
/* 014928 01DC0628 00000000 */   nop
.L01DC062C_2C5E2C:
/* 01492C 01DC062C 10270224 */  addiu       $2, $0, 0x2710
/* 014930 01DC0630 00008244 */  mtc1        $2, $f0
/* 014934 01DC0634 00000000 */  nop
/* 014938 01DC0638 20058046 */  cvt.s.w     $f20, $f0
/* 01493C 01DC063C 27000010 */  b           .L01DC06DC_2C5EDC
/* 014940 01DC0640 00000000 */   nop
.L01DC0644_2C5E44:
/* 014944 01DC0644 1644023C */  lui         $2, (0x44160000 >> 16)
/* 014948 01DC0648 00A08244 */  mtc1        $2, $f20
/* 01494C 01DC064C 23000010 */  b           .L01DC06DC_2C5EDC
/* 014950 01DC0650 00000000 */   nop
.L01DC0654_2C5E54:
/* 014954 01DC0654 C040023C */  lui         $2, (0x40C00000 >> 16)
/* 014958 01DC0658 00688244 */  mtc1        $2, $f13
/* 01495C 01DC065C FFFF0234 */  ori         $2, $0, 0xFFFF
/* 014960 01DC0660 00008244 */  mtc1        $2, $f0
/* 014964 01DC0664 00000000 */  nop
/* 014968 01DC0668 A0038046 */  cvt.s.w     $f14, $f0
/* 01496C 01DC066C C701013C */  lui         $1, %hi(mgRenderInfo + 0x1A0)
/* 014970 01DC0670 C0562CC4 */  lwc1        $f12, %lo(mgRenderInfo + 0x1A0)($1)
/* 014974 01DC0674 B8B5040C */  jal         MGSetRenderInfo__Ffff
/* 014978 01DC0678 00000000 */   nop
/* 01497C 01DC067C 17000010 */  b           .L01DC06DC_2C5EDC
/* 014980 01DC0680 00000000 */   nop
.L01DC0684_2C5E84:
/* 014984 01DC0684 8040023C */  lui         $2, (0x40800000 >> 16)
/* 014988 01DC0688 00688244 */  mtc1        $2, $f13
/* 01498C 01DC068C FFFF0234 */  ori         $2, $0, 0xFFFF
/* 014990 01DC0690 00008244 */  mtc1        $2, $f0
/* 014994 01DC0694 00000000 */  nop
/* 014998 01DC0698 A0038046 */  cvt.s.w     $f14, $f0
/* 01499C 01DC069C C701013C */  lui         $1, %hi(mgRenderInfo + 0x1A0)
/* 0149A0 01DC06A0 C0562CC4 */  lwc1        $f12, %lo(mgRenderInfo + 0x1A0)($1)
/* 0149A4 01DC06A4 B8B5040C */  jal         MGSetRenderInfo__Ffff
/* 0149A8 01DC06A8 00000000 */   nop
/* 0149AC 01DC06AC 0B000010 */  b           .L01DC06DC_2C5EDC
/* 0149B0 01DC06B0 00000000 */   nop
.L01DC06B4_2C5EB4:
/* 0149B4 01DC06B4 FFFF0234 */  ori         $2, $0, 0xFFFF
/* 0149B8 01DC06B8 00008244 */  mtc1        $2, $f0
/* 0149BC 01DC06BC 00000000 */  nop
/* 0149C0 01DC06C0 A0038046 */  cvt.s.w     $f14, $f0
/* 0149C4 01DC06C4 0041023C */  lui         $2, (0x41000000 >> 16)
/* 0149C8 01DC06C8 00688244 */  mtc1        $2, $f13
/* 0149CC 01DC06CC C701013C */  lui         $1, %hi(mgRenderInfo + 0x1A0)
/* 0149D0 01DC06D0 C0562CC4 */  lwc1        $f12, %lo(mgRenderInfo + 0x1A0)($1)
/* 0149D4 01DC06D4 B8B5040C */  jal         MGSetRenderInfo__Ffff
/* 0149D8 01DC06D8 00000000 */   nop
.L01DC06DC_2C5EDC:
/* 0149DC 01DC06DC DD01013C */  lui         $1, %hi(op_fogRate)
/* 0149E0 01DC06E0 305C2CC4 */  lwc1        $f12, %lo(op_fogRate)($1)
/* 0149E4 01DC06E4 46A30046 */  mov.s       $f13, $f20
/* 0149E8 01DC06E8 308A8493 */  lbu         $4, -0x75D0($28)
/* 0149EC 01DC06EC 318A8593 */  lbu         $5, -0x75CF($28)
/* 0149F0 01DC06F0 328A8693 */  lbu         $6, -0x75CE($28)
/* 0149F4 01DC06F4 DD01013C */  lui         $1, %hi(op_fogRate + 0x8)
/* 0149F8 01DC06F8 385C2EC4 */  lwc1        $f14, %lo(op_fogRate + 0x8)($1)
/* 0149FC 01DC06FC DD01013C */  lui         $1, %hi(op_fogRate + 0xC)
/* 014A00 01DC0700 3C5C2FC4 */  lwc1        $f15, %lo(op_fogRate + 0xC)($1)
/* 014A04 01DC0704 04B8040C */  jal         MGSetFogParm__FffUcUcUcff
/* 014A08 01DC0708 00000000 */   nop
/* 014A0C 01DC070C DE01013C */  lui         $1, %hi(CScript__2 + 0x18)
/* 014A10 01DC0710 181B238C */  lw          $3, %lo(CScript__2 + 0x18)($1)
/* 014A14 01DC0714 07000224 */  addiu       $2, $0, 0x7
/* 014A18 01DC0718 2A006210 */  beq         $3, $2, .L01DC07C4_2C5FC4
/* 014A1C 01DC071C 00000000 */   nop
/* 014A20 01DC0720 05000224 */  addiu       $2, $0, 0x5
/* 014A24 01DC0724 03006210 */  beq         $3, $2, .L01DC0734_2C5F34
/* 014A28 01DC0728 00000000 */   nop
/* 014A2C 01DC072C C4000010 */  b           .L01DC0A40_2C6240
/* 014A30 01DC0730 00000000 */   nop
.L01DC0734_2C5F34:
/* 014A34 01DC0734 C701023C */  lui         $2, %hi(TexManager)
/* 014A38 01DC0738 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 014A3C 01DC073C D48B858F */  lw          $5, -0x742C($28)
/* 014A40 01DC0740 0A000624 */  addiu       $6, $0, 0xA
/* 014A44 01DC0744 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 014A48 01DC0748 00000000 */   nop
/* 014A4C 01DC074C 28860070 */  paddub      $16, $0, $0
/* 014A50 01DC0750 0C000010 */  b           .L01DC0784_2C5F84
/* 014A54 01DC0754 00000000 */   nop
.L01DC0758_2C5F58:
/* 014A58 01DC0758 00111000 */  sll         $2, $16, 4
/* 014A5C 01DC075C 23105000 */  subu        $2, $2, $16
/* 014A60 01DC0760 00190200 */  sll         $3, $2, 4
/* 014A64 01DC0764 E301023C */  lui         $2, %hi(OP_NornMapObj3)
/* 014A68 01DC0768 D0B64224 */  addiu       $2, $2, %lo(OP_NornMapObj3)
/* 014A6C 01DC076C 21204300 */  addu        $4, $2, $3
/* 014A70 01DC0770 A000998C */  lw          $25, 0xA0($4)
/* 014A74 01DC0774 9400398F */  lw          $25, 0x94($25)
/* 014A78 01DC0778 09F82003 */  jalr        $25
/* 014A7C 01DC077C 00000000 */   nop
/* 014A80 01DC0780 01001026 */  addiu       $16, $16, 0x1
.L01DC0784_2C5F84:
/* 014A84 01DC0784 0300022A */  slti        $2, $16, 0x3
/* 014A88 01DC0788 F3FF4014 */  bnez        $2, .L01DC0758_2C5F58
/* 014A8C 01DC078C 00000000 */   nop
/* 014A90 01DC0790 DE01013C */  lui         $1, %hi(CScript__2)
/* 014A94 01DC0794 001B228C */  lw          $2, %lo(CScript__2)($1)
/* 014A98 01DC0798 48004128 */  slti        $1, $2, 0x48
/* 014A9C 01DC079C 0E012010 */  beqz        $1, .L01DC0BD8_2C63D8
/* 014AA0 01DC07A0 00000000 */   nop
/* 014AA4 01DC07A4 E301023C */  lui         $2, %hi(OP_NornMapObj3 + 0x2D0)
/* 014AA8 01DC07A8 A0B94424 */  addiu       $4, $2, %lo(OP_NornMapObj3 + 0x2D0)
/* 014AAC 01DC07AC A000998C */  lw          $25, 0xA0($4)
/* 014AB0 01DC07B0 9400398F */  lw          $25, 0x94($25)
/* 014AB4 01DC07B4 09F82003 */  jalr        $25
/* 014AB8 01DC07B8 00000000 */   nop
/* 014ABC 01DC07BC 06010010 */  b           .L01DC0BD8_2C63D8
/* 014AC0 01DC07C0 00000000 */   nop
.L01DC07C4_2C5FC4:
/* 014AC4 01DC07C4 C701023C */  lui         $2, %hi(TexManager)
/* 014AC8 01DC07C8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 014ACC 01DC07CC D48B858F */  lw          $5, -0x742C($28)
/* 014AD0 01DC07D0 0A000624 */  addiu       $6, $0, 0xA
/* 014AD4 01DC07D4 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 014AD8 01DC07D8 00000000 */   nop
/* 014ADC 01DC07DC 28860070 */  paddub      $16, $0, $0
/* 014AE0 01DC07E0 17000010 */  b           .L01DC0840_2C6040
/* 014AE4 01DC07E4 00000000 */   nop
.L01DC07E8_2C5FE8:
/* 014AE8 01DC07E8 00111000 */  sll         $2, $16, 4
/* 014AEC 01DC07EC 23105000 */  subu        $2, $2, $16
/* 014AF0 01DC07F0 00190200 */  sll         $3, $2, 4
/* 014AF4 01DC07F4 E201023C */  lui         $2, %hi(OP_NornMapObj)
/* 014AF8 01DC07F8 B0F64224 */  addiu       $2, $2, %lo(OP_NornMapObj)
/* 014AFC 01DC07FC 21884300 */  addu        $17, $2, $3
/* 014B00 01DC0800 B000A427 */  addiu       $4, $29, 0xB0
/* 014B04 01DC0804 10002526 */  addiu       $5, $17, 0x10
/* 014B08 01DC0808 0C86040C */  jal         sceVu0CopyVector
/* 014B0C 01DC080C 00000000 */   nop
/* 014B10 01DC0810 B000ACC7 */  lwc1        $f12, 0xB0($29)
/* 014B14 01DC0814 B400ADC7 */  lwc1        $f13, 0xB4($29)
/* 014B18 01DC0818 B800AEC7 */  lwc1        $f14, 0xB8($29)
/* 014B1C 01DC081C 28260070 */  paddub      $4, $0, $0
/* 014B20 01DC0820 6C0D770C */  jal         LightSet__Ffffi
/* 014B24 01DC0824 00000000 */   nop
/* 014B28 01DC0828 28262072 */  paddub      $4, $17, $0
/* 014B2C 01DC082C A000398E */  lw          $25, 0xA0($17)
/* 014B30 01DC0830 9400398F */  lw          $25, 0x94($25)
/* 014B34 01DC0834 09F82003 */  jalr        $25
/* 014B38 01DC0838 00000000 */   nop
/* 014B3C 01DC083C 01001026 */  addiu       $16, $16, 0x1
.L01DC0840_2C6040:
/* 014B40 01DC0840 4A00022A */  slti        $2, $16, 0x4A
/* 014B44 01DC0844 E8FF4014 */  bnez        $2, .L01DC07E8_2C5FE8
/* 014B48 01DC0848 00000000 */   nop
/* 014B4C 01DC084C DE01013C */  lui         $1, %hi(CScript__2)
/* 014B50 01DC0850 001B238C */  lw          $3, %lo(CScript__2)($1)
/* 014B54 01DC0854 64000224 */  addiu       $2, $0, 0x64
/* 014B58 01DC0858 22006214 */  bne         $3, $2, .L01DC08E4_2C60E4
/* 014B5C 01DC085C 00000000 */   nop
/* 014B60 01DC0860 0498838F */  lw          $3, -0x67FC($28)
/* 014B64 01DC0864 B0110224 */  addiu       $2, $0, 0x11B0
/* 014B68 01DC0868 18186200 */  mult        $3, $3, $2
/* 014B6C 01DC086C E101023C */  lui         $2, %hi(Cam__2 + 0x2F0)
/* 014B70 01DC0870 C09B4224 */  addiu       $2, $2, %lo(Cam__2 + 0x2F0)
/* 014B74 01DC0874 21104300 */  addu        $2, $2, $3
/* 014B78 01DC0878 000041C4 */  lwc1        $f1, 0x0($2)
/* 014B7C 01DC087C 8343023C */  lui         $2, (0x43830000 >> 16)
/* 014B80 01DC0880 00008244 */  mtc1        $2, $f0
/* 014B84 01DC0884 00000000 */  nop
/* 014B88 01DC0888 36080046 */  c.le.s      $f1, $f0
/* 014B8C 01DC088C 00000000 */  nop
/* 014B90 01DC0890 14000145 */  bc1t        .L01DC08E4_2C60E4
/* 014B94 01DC0894 00000000 */   nop
/* 014B98 01DC0898 E201023C */  lui         $2, %hi(OP_NornMapObj + 0x4650)
/* 014B9C 01DC089C 003D5024 */  addiu       $16, $2, %lo(OP_NornMapObj + 0x4650)
/* 014BA0 01DC08A0 C000A427 */  addiu       $4, $29, 0xC0
/* 014BA4 01DC08A4 10000526 */  addiu       $5, $16, 0x10
/* 014BA8 01DC08A8 0C86040C */  jal         sceVu0CopyVector
/* 014BAC 01DC08AC 00000000 */   nop
/* 014BB0 01DC08B0 C000ACC7 */  lwc1        $f12, 0xC0($29)
/* 014BB4 01DC08B4 C400ADC7 */  lwc1        $f13, 0xC4($29)
/* 014BB8 01DC08B8 C800AEC7 */  lwc1        $f14, 0xC8($29)
/* 014BBC 01DC08BC 28260070 */  paddub      $4, $0, $0
/* 014BC0 01DC08C0 6C0D770C */  jal         LightSet__Ffffi
/* 014BC4 01DC08C4 00000000 */   nop
/* 014BC8 01DC08C8 28260072 */  paddub      $4, $16, $0
/* 014BCC 01DC08CC A000198E */  lw          $25, 0xA0($16)
/* 014BD0 01DC08D0 9400398F */  lw          $25, 0x94($25)
/* 014BD4 01DC08D4 09F82003 */  jalr        $25
/* 014BD8 01DC08D8 00000000 */   nop
/* 014BDC 01DC08DC 12000010 */  b           .L01DC0928_2C6128
/* 014BE0 01DC08E0 00000000 */   nop
.L01DC08E4_2C60E4:
/* 014BE4 01DC08E4 E201023C */  lui         $2, %hi(OP_NornMapObj + 0x4560)
/* 014BE8 01DC08E8 103C5024 */  addiu       $16, $2, %lo(OP_NornMapObj + 0x4560)
/* 014BEC 01DC08EC D000A427 */  addiu       $4, $29, 0xD0
/* 014BF0 01DC08F0 10000526 */  addiu       $5, $16, 0x10
/* 014BF4 01DC08F4 0C86040C */  jal         sceVu0CopyVector
/* 014BF8 01DC08F8 00000000 */   nop
/* 014BFC 01DC08FC D000ACC7 */  lwc1        $f12, 0xD0($29)
/* 014C00 01DC0900 D400ADC7 */  lwc1        $f13, 0xD4($29)
/* 014C04 01DC0904 D800AEC7 */  lwc1        $f14, 0xD8($29)
/* 014C08 01DC0908 28260070 */  paddub      $4, $0, $0
/* 014C0C 01DC090C 6C0D770C */  jal         LightSet__Ffffi
/* 014C10 01DC0910 00000000 */   nop
/* 014C14 01DC0914 28260072 */  paddub      $4, $16, $0
/* 014C18 01DC0918 A000198E */  lw          $25, 0xA0($16)
/* 014C1C 01DC091C 9400398F */  lw          $25, 0x94($25)
/* 014C20 01DC0920 09F82003 */  jalr        $25
/* 014C24 01DC0924 00000000 */   nop
.L01DC0928_2C6128:
/* 014C28 01DC0928 C701023C */  lui         $2, %hi(TexManager)
/* 014C2C 01DC092C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 014C30 01DC0930 D48B858F */  lw          $5, -0x742C($28)
/* 014C34 01DC0934 0B000624 */  addiu       $6, $0, 0xB
/* 014C38 01DC0938 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 014C3C 01DC093C 00000000 */   nop
/* 014C40 01DC0940 28860070 */  paddub      $16, $0, $0
/* 014C44 01DC0944 17000010 */  b           .L01DC09A4_2C61A4
/* 014C48 01DC0948 00000000 */   nop
.L01DC094C_2C614C:
/* 014C4C 01DC094C 00111000 */  sll         $2, $16, 4
/* 014C50 01DC0950 23105000 */  subu        $2, $2, $16
/* 014C54 01DC0954 00190200 */  sll         $3, $2, 4
/* 014C58 01DC0958 E201023C */  lui         $2, %hi(OP_NornMapObj2)
/* 014C5C 01DC095C F03D4224 */  addiu       $2, $2, %lo(OP_NornMapObj2)
/* 014C60 01DC0960 21884300 */  addu        $17, $2, $3
/* 014C64 01DC0964 E000A427 */  addiu       $4, $29, 0xE0
/* 014C68 01DC0968 10002526 */  addiu       $5, $17, 0x10
/* 014C6C 01DC096C 0C86040C */  jal         sceVu0CopyVector
/* 014C70 01DC0970 00000000 */   nop
/* 014C74 01DC0974 E000ACC7 */  lwc1        $f12, 0xE0($29)
/* 014C78 01DC0978 E400ADC7 */  lwc1        $f13, 0xE4($29)
/* 014C7C 01DC097C E800AEC7 */  lwc1        $f14, 0xE8($29)
/* 014C80 01DC0980 28260070 */  paddub      $4, $0, $0
/* 014C84 01DC0984 6C0D770C */  jal         LightSet__Ffffi
/* 014C88 01DC0988 00000000 */   nop
/* 014C8C 01DC098C 28262072 */  paddub      $4, $17, $0
/* 014C90 01DC0990 A000398E */  lw          $25, 0xA0($17)
/* 014C94 01DC0994 9400398F */  lw          $25, 0x94($25)
/* 014C98 01DC0998 09F82003 */  jalr        $25
/* 014C9C 01DC099C 00000000 */   nop
/* 014CA0 01DC09A0 01001026 */  addiu       $16, $16, 0x1
.L01DC09A4_2C61A4:
/* 014CA4 01DC09A4 1A00022A */  slti        $2, $16, 0x1A
/* 014CA8 01DC09A8 E8FF4014 */  bnez        $2, .L01DC094C_2C614C
/* 014CAC 01DC09AC 00000000 */   nop
/* 014CB0 01DC09B0 C701023C */  lui         $2, %hi(TexManager)
/* 014CB4 01DC09B4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 014CB8 01DC09B8 D48B858F */  lw          $5, -0x742C($28)
/* 014CBC 01DC09BC 0C000624 */  addiu       $6, $0, 0xC
/* 014CC0 01DC09C0 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 014CC4 01DC09C4 00000000 */   nop
/* 014CC8 01DC09C8 1A001024 */  addiu       $16, $0, 0x1A
/* 014CCC 01DC09CC 17000010 */  b           .L01DC0A2C_2C622C
/* 014CD0 01DC09D0 00000000 */   nop
.L01DC09D4_2C61D4:
/* 014CD4 01DC09D4 00111000 */  sll         $2, $16, 4
/* 014CD8 01DC09D8 23105000 */  subu        $2, $2, $16
/* 014CDC 01DC09DC 00190200 */  sll         $3, $2, 4
/* 014CE0 01DC09E0 E201023C */  lui         $2, %hi(OP_NornMapObj2)
/* 014CE4 01DC09E4 F03D4224 */  addiu       $2, $2, %lo(OP_NornMapObj2)
/* 014CE8 01DC09E8 21884300 */  addu        $17, $2, $3
/* 014CEC 01DC09EC F000A427 */  addiu       $4, $29, 0xF0
/* 014CF0 01DC09F0 10002526 */  addiu       $5, $17, 0x10
/* 014CF4 01DC09F4 0C86040C */  jal         sceVu0CopyVector
/* 014CF8 01DC09F8 00000000 */   nop
/* 014CFC 01DC09FC F000ACC7 */  lwc1        $f12, 0xF0($29)
/* 014D00 01DC0A00 F400ADC7 */  lwc1        $f13, 0xF4($29)
/* 014D04 01DC0A04 F800AEC7 */  lwc1        $f14, 0xF8($29)
/* 014D08 01DC0A08 28260070 */  paddub      $4, $0, $0
/* 014D0C 01DC0A0C 6C0D770C */  jal         LightSet__Ffffi
/* 014D10 01DC0A10 00000000 */   nop
/* 014D14 01DC0A14 28262072 */  paddub      $4, $17, $0
/* 014D18 01DC0A18 A000398E */  lw          $25, 0xA0($17)
/* 014D1C 01DC0A1C 9400398F */  lw          $25, 0x94($25)
/* 014D20 01DC0A20 09F82003 */  jalr        $25
/* 014D24 01DC0A24 00000000 */   nop
/* 014D28 01DC0A28 01001026 */  addiu       $16, $16, 0x1
.L01DC0A2C_2C622C:
/* 014D2C 01DC0A2C 3E00022A */  slti        $2, $16, 0x3E
/* 014D30 01DC0A30 E8FF4014 */  bnez        $2, .L01DC09D4_2C61D4
/* 014D34 01DC0A34 00000000 */   nop
/* 014D38 01DC0A38 67000010 */  b           .L01DC0BD8_2C63D8
/* 014D3C 01DC0A3C 00000000 */   nop
.L01DC0A40_2C6240:
/* 014D40 01DC0A40 C701023C */  lui         $2, %hi(TexManager)
/* 014D44 01DC0A44 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 014D48 01DC0A48 D48B858F */  lw          $5, -0x742C($28)
/* 014D4C 01DC0A4C 0A000624 */  addiu       $6, $0, 0xA
/* 014D50 01DC0A50 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 014D54 01DC0A54 00000000 */   nop
/* 014D58 01DC0A58 28860070 */  paddub      $16, $0, $0
/* 014D5C 01DC0A5C 17000010 */  b           .L01DC0ABC_2C62BC
/* 014D60 01DC0A60 00000000 */   nop
.L01DC0A64_2C6264:
/* 014D64 01DC0A64 00111000 */  sll         $2, $16, 4
/* 014D68 01DC0A68 23105000 */  subu        $2, $2, $16
/* 014D6C 01DC0A6C 00190200 */  sll         $3, $2, 4
/* 014D70 01DC0A70 E201023C */  lui         $2, %hi(OP_NornMapObj)
/* 014D74 01DC0A74 B0F64224 */  addiu       $2, $2, %lo(OP_NornMapObj)
/* 014D78 01DC0A78 21884300 */  addu        $17, $2, $3
/* 014D7C 01DC0A7C 0001A427 */  addiu       $4, $29, 0x100
/* 014D80 01DC0A80 10002526 */  addiu       $5, $17, 0x10
/* 014D84 01DC0A84 0C86040C */  jal         sceVu0CopyVector
/* 014D88 01DC0A88 00000000 */   nop
/* 014D8C 01DC0A8C 0001ACC7 */  lwc1        $f12, 0x100($29)
/* 014D90 01DC0A90 0401ADC7 */  lwc1        $f13, 0x104($29)
/* 014D94 01DC0A94 0801AEC7 */  lwc1        $f14, 0x108($29)
/* 014D98 01DC0A98 28260070 */  paddub      $4, $0, $0
/* 014D9C 01DC0A9C 6C0D770C */  jal         LightSet__Ffffi
/* 014DA0 01DC0AA0 00000000 */   nop
/* 014DA4 01DC0AA4 28262072 */  paddub      $4, $17, $0
/* 014DA8 01DC0AA8 A000398E */  lw          $25, 0xA0($17)
/* 014DAC 01DC0AAC 9400398F */  lw          $25, 0x94($25)
/* 014DB0 01DC0AB0 09F82003 */  jalr        $25
/* 014DB4 01DC0AB4 00000000 */   nop
/* 014DB8 01DC0AB8 01001026 */  addiu       $16, $16, 0x1
.L01DC0ABC_2C62BC:
/* 014DBC 01DC0ABC 4B00022A */  slti        $2, $16, 0x4B
/* 014DC0 01DC0AC0 E8FF4014 */  bnez        $2, .L01DC0A64_2C6264
/* 014DC4 01DC0AC4 00000000 */   nop
/* 014DC8 01DC0AC8 C701023C */  lui         $2, %hi(TexManager)
/* 014DCC 01DC0ACC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 014DD0 01DC0AD0 D48B858F */  lw          $5, -0x742C($28)
/* 014DD4 01DC0AD4 0B000624 */  addiu       $6, $0, 0xB
/* 014DD8 01DC0AD8 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 014DDC 01DC0ADC 00000000 */   nop
/* 014DE0 01DC0AE0 28860070 */  paddub      $16, $0, $0
/* 014DE4 01DC0AE4 17000010 */  b           .L01DC0B44_2C6344
/* 014DE8 01DC0AE8 00000000 */   nop
.L01DC0AEC_2C62EC:
/* 014DEC 01DC0AEC 00111000 */  sll         $2, $16, 4
/* 014DF0 01DC0AF0 23105000 */  subu        $2, $2, $16
/* 014DF4 01DC0AF4 00190200 */  sll         $3, $2, 4
/* 014DF8 01DC0AF8 E201023C */  lui         $2, %hi(OP_NornMapObj2)
/* 014DFC 01DC0AFC F03D4224 */  addiu       $2, $2, %lo(OP_NornMapObj2)
/* 014E00 01DC0B00 21884300 */  addu        $17, $2, $3
/* 014E04 01DC0B04 1001A427 */  addiu       $4, $29, 0x110
/* 014E08 01DC0B08 10002526 */  addiu       $5, $17, 0x10
/* 014E0C 01DC0B0C 0C86040C */  jal         sceVu0CopyVector
/* 014E10 01DC0B10 00000000 */   nop
/* 014E14 01DC0B14 1001ACC7 */  lwc1        $f12, 0x110($29)
/* 014E18 01DC0B18 1401ADC7 */  lwc1        $f13, 0x114($29)
/* 014E1C 01DC0B1C 1801AEC7 */  lwc1        $f14, 0x118($29)
/* 014E20 01DC0B20 28260070 */  paddub      $4, $0, $0
/* 014E24 01DC0B24 6C0D770C */  jal         LightSet__Ffffi
/* 014E28 01DC0B28 00000000 */   nop
/* 014E2C 01DC0B2C 28262072 */  paddub      $4, $17, $0
/* 014E30 01DC0B30 A000398E */  lw          $25, 0xA0($17)
/* 014E34 01DC0B34 9400398F */  lw          $25, 0x94($25)
/* 014E38 01DC0B38 09F82003 */  jalr        $25
/* 014E3C 01DC0B3C 00000000 */   nop
/* 014E40 01DC0B40 01001026 */  addiu       $16, $16, 0x1
.L01DC0B44_2C6344:
/* 014E44 01DC0B44 2900022A */  slti        $2, $16, 0x29
/* 014E48 01DC0B48 E8FF4014 */  bnez        $2, .L01DC0AEC_2C62EC
/* 014E4C 01DC0B4C 00000000 */   nop
/* 014E50 01DC0B50 C701023C */  lui         $2, %hi(TexManager)
/* 014E54 01DC0B54 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 014E58 01DC0B58 D48B858F */  lw          $5, -0x742C($28)
/* 014E5C 01DC0B5C 0C000624 */  addiu       $6, $0, 0xC
/* 014E60 01DC0B60 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 014E64 01DC0B64 00000000 */   nop
/* 014E68 01DC0B68 29001024 */  addiu       $16, $0, 0x29
/* 014E6C 01DC0B6C 17000010 */  b           .L01DC0BCC_2C63CC
/* 014E70 01DC0B70 00000000 */   nop
.L01DC0B74_2C6374:
/* 014E74 01DC0B74 00111000 */  sll         $2, $16, 4
/* 014E78 01DC0B78 23105000 */  subu        $2, $2, $16
/* 014E7C 01DC0B7C 00190200 */  sll         $3, $2, 4
/* 014E80 01DC0B80 E201023C */  lui         $2, %hi(OP_NornMapObj2)
/* 014E84 01DC0B84 F03D4224 */  addiu       $2, $2, %lo(OP_NornMapObj2)
/* 014E88 01DC0B88 21884300 */  addu        $17, $2, $3
/* 014E8C 01DC0B8C 2001A427 */  addiu       $4, $29, 0x120
/* 014E90 01DC0B90 10002526 */  addiu       $5, $17, 0x10
/* 014E94 01DC0B94 0C86040C */  jal         sceVu0CopyVector
/* 014E98 01DC0B98 00000000 */   nop
/* 014E9C 01DC0B9C 2001ACC7 */  lwc1        $f12, 0x120($29)
/* 014EA0 01DC0BA0 2401ADC7 */  lwc1        $f13, 0x124($29)
/* 014EA4 01DC0BA4 2801AEC7 */  lwc1        $f14, 0x128($29)
/* 014EA8 01DC0BA8 28260070 */  paddub      $4, $0, $0
/* 014EAC 01DC0BAC 6C0D770C */  jal         LightSet__Ffffi
/* 014EB0 01DC0BB0 00000000 */   nop
/* 014EB4 01DC0BB4 28262072 */  paddub      $4, $17, $0
/* 014EB8 01DC0BB8 A000398E */  lw          $25, 0xA0($17)
/* 014EBC 01DC0BBC 9400398F */  lw          $25, 0x94($25)
/* 014EC0 01DC0BC0 09F82003 */  jalr        $25
/* 014EC4 01DC0BC4 00000000 */   nop
/* 014EC8 01DC0BC8 01001026 */  addiu       $16, $16, 0x1
.L01DC0BCC_2C63CC:
/* 014ECC 01DC0BCC 5700022A */  slti        $2, $16, 0x57
/* 014ED0 01DC0BD0 E8FF4014 */  bnez        $2, .L01DC0B74_2C6374
/* 014ED4 01DC0BD4 00000000 */   nop
.L01DC0BD8_2C63D8:
/* 014ED8 01DC0BD8 5C9A8283 */  lb          $2, -0x65A4($28)
/* 014EDC 01DC0BDC 04004014 */  bnez        $2, .L01DC0BF0_2C63F0
/* 014EE0 01DC0BE0 00000000 */   nop
/* 014EE4 01DC0BE4 589A80AF */  sw          $0, -0x65A8($28)
/* 014EE8 01DC0BE8 01000224 */  addiu       $2, $0, 0x1
/* 014EEC 01DC0BEC 5C9A82A3 */  sb          $2, -0x65A4($28)
.L01DC0BF0_2C63F0:
/* 014EF0 01DC0BF0 649A8283 */  lb          $2, -0x659C($28)
/* 014EF4 01DC0BF4 05004014 */  bnez        $2, .L01DC0C0C_2C640C
/* 014EF8 01DC0BF8 00000000 */   nop
/* 014EFC 01DC0BFC FF000224 */  addiu       $2, $0, 0xFF
/* 014F00 01DC0C00 609A82AF */  sw          $2, -0x65A0($28)
/* 014F04 01DC0C04 01000224 */  addiu       $2, $0, 0x1
/* 014F08 01DC0C08 649A82A3 */  sb          $2, -0x659C($28)
.L01DC0C0C_2C640C:
/* 014F0C 01DC0C0C DE01013C */  lui         $1, %hi(CScript__2 + 0x14)
/* 014F10 01DC0C10 141B238C */  lw          $3, %lo(CScript__2 + 0x14)($1)
/* 014F14 01DC0C14 01000224 */  addiu       $2, $0, 0x1
/* 014F18 01DC0C18 06006214 */  bne         $3, $2, .L01DC0C34_2C6434
/* 014F1C 01DC0C1C 00000000 */   nop
/* 014F20 01DC0C20 DE01013C */  lui         $1, %hi(CScript__2 + 0x14)
/* 014F24 01DC0C24 141B20AC */  sw          $0, %lo(CScript__2 + 0x14)($1)
/* 014F28 01DC0C28 589A82AF */  sw          $2, -0x65A8($28)
/* 014F2C 01DC0C2C FF000224 */  addiu       $2, $0, 0xFF
/* 014F30 01DC0C30 609A82AF */  sw          $2, -0x65A0($28)
.L01DC0C34_2C6434:
/* 014F34 01DC0C34 589A838F */  lw          $3, -0x65A8($28)
/* 014F38 01DC0C38 01000224 */  addiu       $2, $0, 0x1
/* 014F3C 01DC0C3C 35006214 */  bne         $3, $2, .L01DC0D14_2C6514
/* 014F40 01DC0C40 00000000 */   nop
/* 014F44 01DC0C44 3001A427 */  addiu       $4, $29, 0x130
/* 014F48 01DC0C48 2500023C */  lui         $2, %hi(lightcolor)
/* 014F4C 01DC0C4C C01B4524 */  addiu       $5, $2, %lo(lightcolor)
/* 014F50 01DC0C50 1086040C */  jal         sceVu0CopyMatrix
/* 014F54 01DC0C54 00000000 */   nop
/* 014F58 01DC0C58 28860070 */  paddub      $16, $0, $0
/* 014F5C 01DC0C5C 3001A1C7 */  lwc1        $f1, 0x130($29)
/* 014F60 01DC0C60 609A828F */  lw          $2, -0x65A0($28)
/* 014F64 01DC0C64 00008244 */  mtc1        $2, $f0
/* 014F68 01DC0C68 00000000 */  nop
/* 014F6C 01DC0C6C 20008046 */  cvt.s.w     $f0, $f0
/* 014F70 01DC0C70 34080046 */  c.lt.s      $f1, $f0
/* 014F74 01DC0C74 00000000 */  nop
/* 014F78 01DC0C78 03000045 */  bc1f        .L01DC0C88_2C6488
/* 014F7C 01DC0C7C 00000000 */   nop
/* 014F80 01DC0C80 3001A0E7 */  swc1        $f0, 0x130($29)
/* 014F84 01DC0C84 01001024 */  addiu       $16, $0, 0x1
.L01DC0C88_2C6488:
/* 014F88 01DC0C88 3401A327 */  addiu       $3, $29, 0x134
/* 014F8C 01DC0C8C 000061C4 */  lwc1        $f1, 0x0($3)
/* 014F90 01DC0C90 00008244 */  mtc1        $2, $f0
/* 014F94 01DC0C94 00000000 */  nop
/* 014F98 01DC0C98 20008046 */  cvt.s.w     $f0, $f0
/* 014F9C 01DC0C9C 34080046 */  c.lt.s      $f1, $f0
/* 014FA0 01DC0CA0 00000000 */  nop
/* 014FA4 01DC0CA4 03000045 */  bc1f        .L01DC0CB4_2C64B4
/* 014FA8 01DC0CA8 00000000 */   nop
/* 014FAC 01DC0CAC 000060E4 */  swc1        $f0, 0x0($3)
/* 014FB0 01DC0CB0 01001024 */  addiu       $16, $0, 0x1
.L01DC0CB4_2C64B4:
/* 014FB4 01DC0CB4 3801A327 */  addiu       $3, $29, 0x138
/* 014FB8 01DC0CB8 000061C4 */  lwc1        $f1, 0x0($3)
/* 014FBC 01DC0CBC 00008244 */  mtc1        $2, $f0
/* 014FC0 01DC0CC0 00000000 */  nop
/* 014FC4 01DC0CC4 20008046 */  cvt.s.w     $f0, $f0
/* 014FC8 01DC0CC8 34080046 */  c.lt.s      $f1, $f0
/* 014FCC 01DC0CCC 00000000 */  nop
/* 014FD0 01DC0CD0 03000045 */  bc1f        .L01DC0CE0_2C64E0
/* 014FD4 01DC0CD4 00000000 */   nop
/* 014FD8 01DC0CD8 000060E4 */  swc1        $f0, 0x0($3)
/* 014FDC 01DC0CDC 01001024 */  addiu       $16, $0, 0x1
.L01DC0CE0_2C64E0:
/* 014FE0 01DC0CE0 609A828F */  lw          $2, -0x65A0($28)
/* 014FE4 01DC0CE4 FCFF4224 */  addiu       $2, $2, -0x4
/* 014FE8 01DC0CE8 609A82AF */  sw          $2, -0x65A0($28)
/* 014FEC 01DC0CEC 2500023C */  lui         $2, %hi(light)
/* 014FF0 01DC0CF0 801B4424 */  addiu       $4, $2, %lo(light)
/* 014FF4 01DC0CF4 3001A527 */  addiu       $5, $29, 0x130
/* 014FF8 01DC0CF8 08B7040C */  jal         MGSetPLight__FPA4_fPA4_f
/* 014FFC 01DC0CFC 00000000 */   nop
/* 015000 01DC0D00 06000016 */  bnez        $16, .L01DC0D1C_2C651C
/* 015004 01DC0D04 00000000 */   nop
/* 015008 01DC0D08 589A80AF */  sw          $0, -0x65A8($28)
/* 01500C 01DC0D0C 03000010 */  b           .L01DC0D1C_2C651C
/* 015010 01DC0D10 00000000 */   nop
.L01DC0D14_2C6514:
/* 015014 01DC0D14 FF000224 */  addiu       $2, $0, 0xFF
/* 015018 01DC0D18 609A82AF */  sw          $2, -0x65A0($28)
.L01DC0D1C_2C651C:
/* 01501C 01DC0D1C C701023C */  lui         $2, %hi(TexManager)
/* 015020 01DC0D20 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 015024 01DC0D24 D48B858F */  lw          $5, -0x742C($28)
/* 015028 01DC0D28 16000624 */  addiu       $6, $0, 0x16
/* 01502C 01DC0D2C 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 015030 01DC0D30 00000000 */   nop
/* 015034 01DC0D34 DE01013C */  lui         $1, %hi(CScript__2)
/* 015038 01DC0D38 001B238C */  lw          $3, %lo(CScript__2)($1)
/* 01503C 01DC0D3C 42000224 */  addiu       $2, $0, 0x42
/* 015040 01DC0D40 25006210 */  beq         $3, $2, .L01DC0DD8_2C65D8
/* 015044 01DC0D44 00000000 */   nop
/* 015048 01DC0D48 41000224 */  addiu       $2, $0, 0x41
/* 01504C 01DC0D4C 22006210 */  beq         $3, $2, .L01DC0DD8_2C65D8
/* 015050 01DC0D50 00000000 */   nop
/* 015054 01DC0D54 40000224 */  addiu       $2, $0, 0x40
/* 015058 01DC0D58 1F006210 */  beq         $3, $2, .L01DC0DD8_2C65D8
/* 01505C 01DC0D5C 00000000 */   nop
/* 015060 01DC0D60 3F000224 */  addiu       $2, $0, 0x3F
/* 015064 01DC0D64 1C006210 */  beq         $3, $2, .L01DC0DD8_2C65D8
/* 015068 01DC0D68 00000000 */   nop
/* 01506C 01DC0D6C 3E000224 */  addiu       $2, $0, 0x3E
/* 015070 01DC0D70 0F006210 */  beq         $3, $2, .L01DC0DB0_2C65B0
/* 015074 01DC0D74 00000000 */   nop
/* 015078 01DC0D78 47000224 */  addiu       $2, $0, 0x47
/* 01507C 01DC0D7C 28006210 */  beq         $3, $2, .L01DC0E20_2C6620
/* 015080 01DC0D80 00000000 */   nop
/* 015084 01DC0D84 46000224 */  addiu       $2, $0, 0x46
/* 015088 01DC0D88 25006210 */  beq         $3, $2, .L01DC0E20_2C6620
/* 01508C 01DC0D8C 00000000 */   nop
/* 015090 01DC0D90 3C000224 */  addiu       $2, $0, 0x3C
/* 015094 01DC0D94 22006210 */  beq         $3, $2, .L01DC0E20_2C6620
/* 015098 01DC0D98 00000000 */   nop
/* 01509C 01DC0D9C 3A000224 */  addiu       $2, $0, 0x3A
/* 0150A0 01DC0DA0 1F006210 */  beq         $3, $2, .L01DC0E20_2C6620
/* 0150A4 01DC0DA4 00000000 */   nop
/* 0150A8 01DC0DA8 15000010 */  b           .L01DC0E00_2C6600
/* 0150AC 01DC0DAC 00000000 */   nop
.L01DC0DB0_2C65B0:
/* 0150B0 01DC0DB0 3002A427 */  addiu       $4, $29, 0x230
/* 0150B4 01DC0DB4 708A82DF */  ld          $2, -0x7590($28)
/* 0150B8 01DC0DB8 000082FC */  sd          $2, 0x0($4)
/* 0150BC 01DC0DBC 02000524 */  addiu       $5, $0, 0x2
/* 0150C0 01DC0DC0 20000624 */  addiu       $6, $0, 0x20
/* 0150C4 01DC0DC4 283E0070 */  paddub      $7, $0, $0
/* 0150C8 01DC0DC8 B094050C */  jal         DepthOfField__FPfiii
/* 0150CC 01DC0DCC 00000000 */   nop
/* 0150D0 01DC0DD0 13000010 */  b           .L01DC0E20_2C6620
/* 0150D4 01DC0DD4 00000000 */   nop
.L01DC0DD8_2C65D8:
/* 0150D8 01DC0DD8 3802A427 */  addiu       $4, $29, 0x238
/* 0150DC 01DC0DDC 788A82DF */  ld          $2, -0x7588($28)
/* 0150E0 01DC0DE0 000082FC */  sd          $2, 0x0($4)
/* 0150E4 01DC0DE4 02000524 */  addiu       $5, $0, 0x2
/* 0150E8 01DC0DE8 40000624 */  addiu       $6, $0, 0x40
/* 0150EC 01DC0DEC 283E0070 */  paddub      $7, $0, $0
/* 0150F0 01DC0DF0 B094050C */  jal         DepthOfField__FPfiii
/* 0150F4 01DC0DF4 00000000 */   nop
/* 0150F8 01DC0DF8 09000010 */  b           .L01DC0E20_2C6620
/* 0150FC 01DC0DFC 00000000 */   nop
.L01DC0E00_2C6600:
/* 015100 01DC0E00 4002A427 */  addiu       $4, $29, 0x240
/* 015104 01DC0E04 808A82DF */  ld          $2, -0x7580($28)
/* 015108 01DC0E08 000082FC */  sd          $2, 0x0($4)
/* 01510C 01DC0E0C 02000524 */  addiu       $5, $0, 0x2
/* 015110 01DC0E10 30000624 */  addiu       $6, $0, 0x30
/* 015114 01DC0E14 283E0070 */  paddub      $7, $0, $0
/* 015118 01DC0E18 B094050C */  jal         DepthOfField__FPfiii
/* 01511C 01DC0E1C 00000000 */   nop
.L01DC0E20_2C6620:
/* 015120 01DC0E20 DE01013C */  lui         $1, %hi(CScript__2 + 0x18)
/* 015124 01DC0E24 181B238C */  lw          $3, %lo(CScript__2 + 0x18)($1)
/* 015128 01DC0E28 05000224 */  addiu       $2, $0, 0x5
/* 01512C 01DC0E2C 27006214 */  bne         $3, $2, .L01DC0ECC_2C66CC
/* 015130 01DC0E30 00000000 */   nop
/* 015134 01DC0E34 DE01013C */  lui         $1, %hi(CScript__2)
/* 015138 01DC0E38 001B228C */  lw          $2, %lo(CScript__2)($1)
/* 01513C 01DC0E3C 4D004128 */  slti        $1, $2, 0x4D
/* 015140 01DC0E40 22002014 */  bnez        $1, .L01DC0ECC_2C66CC
/* 015144 01DC0E44 00000000 */   nop
/* 015148 01DC0E48 56004128 */  slti        $1, $2, 0x56
/* 01514C 01DC0E4C 1F002010 */  beqz        $1, .L01DC0ECC_2C66CC
/* 015150 01DC0E50 00000000 */   nop
/* 015154 01DC0E54 4802A427 */  addiu       $4, $29, 0x248
/* 015158 01DC0E58 68BC040C */  jal         MGGetFBuffBackTex__FP9sceGsTex0
/* 01515C 01DC0E5C 00000000 */   nop
/* 015160 01DC0E60 7001A427 */  addiu       $4, $29, 0x170
/* 015164 01DC0E64 BCC3040C */  jal         __ct__8CTextureFv
/* 015168 01DC0E68 00000000 */   nop
/* 01516C 01DC0E6C 4802A227 */  addiu       $2, $29, 0x248
/* 015170 01DC0E70 000042DC */  ld          $2, 0x0($2)
/* 015174 01DC0E74 9801A2FF */  sd          $2, 0x198($29)
/* 015178 01DC0E78 2002A0AF */  sw          $0, 0x220($29)
/* 01517C 01DC0E7C 2402A0AF */  sw          $0, 0x224($29)
/* 015180 01DC0E80 80020324 */  addiu       $3, $0, 0x280
/* 015184 01DC0E84 2802A3AF */  sw          $3, 0x228($29)
/* 015188 01DC0E88 E0000224 */  addiu       $2, $0, 0xE0
/* 01518C 01DC0E8C 2C02A2AF */  sw          $2, 0x22C($29)
/* 015190 01DC0E90 1002A0AF */  sw          $0, 0x210($29)
/* 015194 01DC0E94 1402A0AF */  sw          $0, 0x214($29)
/* 015198 01DC0E98 1802A3AF */  sw          $3, 0x218($29)
/* 01519C 01DC0E9C C0010224 */  addiu       $2, $0, 0x1C0
/* 0151A0 01DC0EA0 1C02A2AF */  sw          $2, 0x21C($29)
/* 0151A4 01DC0EA4 D48B848F */  lw          $4, -0x742C($28)
/* 0151A8 01DC0EA8 7001A527 */  addiu       $5, $29, 0x170
/* 0151AC 01DC0EAC 1002A627 */  addiu       $6, $29, 0x210
/* 0151B0 01DC0EB0 2002A727 */  addiu       $7, $29, 0x220
/* 0151B4 01DC0EB4 80000824 */  addiu       $8, $0, 0x80
/* 0151B8 01DC0EB8 284E0071 */  paddub      $9, $8, $0
/* 0151BC 01DC0EBC 28560071 */  paddub      $10, $8, $0
/* 0151C0 01DC0EC0 69000B24 */  addiu       $11, $0, 0x69
/* 0151C4 01DC0EC4 8C71050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_UcUcUcUc
/* 0151C8 01DC0EC8 00000000 */   nop
.L01DC0ECC_2C66CC:
/* 0151CC 01DC0ECC 28860070 */  paddub      $16, $0, $0
/* 0151D0 01DC0ED0 4A000010 */  b           .L01DC0FFC_2C67FC
/* 0151D4 01DC0ED4 00000000 */   nop
.L01DC0ED8_2C66D8:
/* 0151D8 01DC0ED8 28260072 */  paddub      $4, $16, $0
/* 0151DC 01DC0EDC 200D770C */  jal         LIT_6774
/* 0151E0 01DC0EE0 00000000 */   nop
/* 0151E4 01DC0EE4 44004010 */  beqz        $2, .L01DC0FF8_2C67F8
/* 0151E8 01DC0EE8 00000000 */   nop
/* 0151EC 01DC0EEC 40101000 */  sll         $2, $16, 1
/* 0151F0 01DC0EF0 21105000 */  addu        $2, $2, $16
/* 0151F4 01DC0EF4 80100200 */  sll         $2, $2, 2
/* 0151F8 01DC0EF8 21105000 */  addu        $2, $2, $16
/* 0151FC 01DC0EFC 80180200 */  sll         $3, $2, 2
/* 015200 01DC0F00 DE01023C */  lui         $2, %hi(CScript__2 + 0x30)
/* 015204 01DC0F04 301B4224 */  addiu       $2, $2, %lo(CScript__2 + 0x30)
/* 015208 01DC0F08 21104300 */  addu        $2, $2, $3
/* 01520C 01DC0F0C 00004290 */  lbu         $2, 0x0($2)
/* 015210 01DC0F10 39004010 */  beqz        $2, .L01DC0FF8_2C67F8
/* 015214 01DC0F14 00000000 */   nop
/* 015218 01DC0F18 C701023C */  lui         $2, %hi(TexManager)
/* 01521C 01DC0F1C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 015220 01DC0F20 D48B858F */  lw          $5, -0x742C($28)
/* 015224 01DC0F24 17000624 */  addiu       $6, $0, 0x17
/* 015228 01DC0F28 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 01522C 01DC0F2C 00000000 */   nop
/* 015230 01DC0F30 C701023C */  lui         $2, %hi(TexManager)
/* 015234 01DC0F34 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 015238 01DC0F38 DE01023C */  lui         $2, %hi(LIT_1557__4)
/* 01523C 01DC0F3C 38F94524 */  addiu       $5, $2, %lo(LIT_1557__4)
/* 015240 01DC0F40 FFFF0624 */  addiu       $6, $0, -0x1
/* 015244 01DC0F44 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 015248 01DC0F48 00000000 */   nop
/* 01524C 01DC0F4C 280044DC */  ld          $4, 0x28($2)
/* 015250 01DC0F50 28C2040C */  jal         MGBeginDrawShadow__F9sceGsTex0
/* 015254 01DC0F54 00000000 */   nop
/* 015258 01DC0F58 0898828F */  lw          $2, -0x67F8($28)
/* 01525C 01DC0F5C 08004014 */  bnez        $2, .L01DC0F80_2C6780
/* 015260 01DC0F60 00000000 */   nop
/* 015264 01DC0F64 B0110224 */  addiu       $2, $0, 0x11B0
/* 015268 01DC0F68 18180202 */  mult        $3, $16, $2
/* 01526C 01DC0F6C DF01023C */  lui         $2, %hi(Chara__3)
/* 015270 01DC0F70 E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 015274 01DC0F74 21204300 */  addu        $4, $2, $3
/* 015278 01DC0F78 24E3040C */  jal         ShadowStep__10CCharacterFv
/* 01527C 01DC0F7C 00000000 */   nop
.L01DC0F80_2C6780:
/* 015280 01DC0F80 DE01013C */  lui         $1, %hi(CScript__2 + 0x18)
/* 015284 01DC0F84 181B238C */  lw          $3, %lo(CScript__2 + 0x18)($1)
/* 015288 01DC0F88 05000224 */  addiu       $2, $0, 0x5
/* 01528C 01DC0F8C 10006210 */  beq         $3, $2, .L01DC0FD0_2C67D0
/* 015290 01DC0F90 00000000 */   nop
/* 015294 01DC0F94 B0110224 */  addiu       $2, $0, 0x11B0
/* 015298 01DC0F98 18180202 */  mult        $3, $16, $2
/* 01529C 01DC0F9C DF01023C */  lui         $2, %hi(Chara__3)
/* 0152A0 01DC0FA0 E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 0152A4 01DC0FA4 21104300 */  addu        $2, $2, $3
/* 0152A8 01DC0FA8 C001A427 */  addiu       $4, $29, 0x1C0
/* 0152AC 01DC0FAC 10004524 */  addiu       $5, $2, 0x10
/* 0152B0 01DC0FB0 0C86040C */  jal         sceVu0CopyVector
/* 0152B4 01DC0FB4 00000000 */   nop
/* 0152B8 01DC0FB8 C001ACC7 */  lwc1        $f12, 0x1C0($29)
/* 0152BC 01DC0FBC C401ADC7 */  lwc1        $f13, 0x1C4($29)
/* 0152C0 01DC0FC0 C801AEC7 */  lwc1        $f14, 0x1C8($29)
/* 0152C4 01DC0FC4 01000424 */  addiu       $4, $0, 0x1
/* 0152C8 01DC0FC8 6C0D770C */  jal         LightSet__Ffffi
/* 0152CC 01DC0FCC 00000000 */   nop
.L01DC0FD0_2C67D0:
/* 0152D0 01DC0FD0 B0110224 */  addiu       $2, $0, 0x11B0
/* 0152D4 01DC0FD4 18180202 */  mult        $3, $16, $2
/* 0152D8 01DC0FD8 DF01023C */  lui         $2, %hi(Chara__3)
/* 0152DC 01DC0FDC E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 0152E0 01DC0FE0 21204300 */  addu        $4, $2, $3
/* 0152E4 01DC0FE4 C0E5040C */  jal         DrawShadow__10CCharacterFv
/* 0152E8 01DC0FE8 00000000 */   nop
/* 0152EC 01DC0FEC 34000424 */  addiu       $4, $0, 0x34
/* 0152F0 01DC0FF0 CCC2040C */  jal         MGEndDrawShadow__FUc
/* 0152F4 01DC0FF4 00000000 */   nop
.L01DC0FF8_2C67F8:
/* 0152F8 01DC0FF8 01001026 */  addiu       $16, $16, 0x1
.L01DC0FFC_2C67FC:
/* 0152FC 01DC0FFC 1700022A */  slti        $2, $16, 0x17
/* 015300 01DC1000 B5FF4014 */  bnez        $2, .L01DC0ED8_2C66D8
/* 015304 01DC1004 00000000 */   nop
/* 015308 01DC1008 28860070 */  paddub      $16, $0, $0
/* 01530C 01DC100C 43000010 */  b           .L01DC111C_2C691C
/* 015310 01DC1010 00000000 */   nop
.L01DC1014_2C6814:
/* 015314 01DC1014 40101000 */  sll         $2, $16, 1
/* 015318 01DC1018 21105000 */  addu        $2, $2, $16
/* 01531C 01DC101C 80100200 */  sll         $2, $2, 2
/* 015320 01DC1020 21105000 */  addu        $2, $2, $16
/* 015324 01DC1024 80180200 */  sll         $3, $2, 2
/* 015328 01DC1028 DE01023C */  lui         $2, %hi(CScript__2 + 0x30)
/* 01532C 01DC102C 301B4224 */  addiu       $2, $2, %lo(CScript__2 + 0x30)
/* 015330 01DC1030 21104300 */  addu        $2, $2, $3
/* 015334 01DC1034 00004290 */  lbu         $2, 0x0($2)
/* 015338 01DC1038 37004010 */  beqz        $2, .L01DC1118_2C6918
/* 01533C 01DC103C 00000000 */   nop
/* 015340 01DC1040 E101023C */  lui         $2, %hi(CharaTex__2)
/* 015344 01DC1044 B0954224 */  addiu       $2, $2, %lo(CharaTex__2)
/* 015348 01DC1048 21105000 */  addu        $2, $2, $16
/* 01534C 01DC104C 00004680 */  lb          $6, 0x0($2)
/* 015350 01DC1050 C701023C */  lui         $2, %hi(TexManager)
/* 015354 01DC1054 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 015358 01DC1058 D48B858F */  lw          $5, -0x742C($28)
/* 01535C 01DC105C 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 015360 01DC1060 00000000 */   nop
/* 015364 01DC1064 0898828F */  lw          $2, -0x67F8($28)
/* 015368 01DC1068 0D004014 */  bnez        $2, .L01DC10A0_2C68A0
/* 01536C 01DC106C 00000000 */   nop
/* 015370 01DC1070 B0110224 */  addiu       $2, $0, 0x11B0
/* 015374 01DC1074 18180202 */  mult        $3, $16, $2
/* 015378 01DC1078 DF01023C */  lui         $2, %hi(Chara__3)
/* 01537C 01DC107C E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 015380 01DC1080 21884300 */  addu        $17, $2, $3
/* 015384 01DC1084 28262072 */  paddub      $4, $17, $0
/* 015388 01DC1088 4CE1040C */  jal         Step__10CCharacterFv
/* 01538C 01DC108C 00000000 */   nop
/* 015390 01DC1090 28262072 */  paddub      $4, $17, $0
/* 015394 01DC1094 282E0070 */  paddub      $5, $0, $0
/* 015398 01DC1098 94E3040C */  jal         ClothStep__10CCharacterFi
/* 01539C 01DC109C 00000000 */   nop
.L01DC10A0_2C68A0:
/* 0153A0 01DC10A0 DE01013C */  lui         $1, %hi(CScript__2 + 0x18)
/* 0153A4 01DC10A4 181B238C */  lw          $3, %lo(CScript__2 + 0x18)($1)
/* 0153A8 01DC10A8 05000224 */  addiu       $2, $0, 0x5
/* 0153AC 01DC10AC 10006210 */  beq         $3, $2, .L01DC10F0_2C68F0
/* 0153B0 01DC10B0 00000000 */   nop
/* 0153B4 01DC10B4 B0110224 */  addiu       $2, $0, 0x11B0
/* 0153B8 01DC10B8 18180202 */  mult        $3, $16, $2
/* 0153BC 01DC10BC DF01023C */  lui         $2, %hi(Chara__3)
/* 0153C0 01DC10C0 E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 0153C4 01DC10C4 21104300 */  addu        $2, $2, $3
/* 0153C8 01DC10C8 D001A427 */  addiu       $4, $29, 0x1D0
/* 0153CC 01DC10CC 10004524 */  addiu       $5, $2, 0x10
/* 0153D0 01DC10D0 0C86040C */  jal         sceVu0CopyVector
/* 0153D4 01DC10D4 00000000 */   nop
/* 0153D8 01DC10D8 D001ACC7 */  lwc1        $f12, 0x1D0($29)
/* 0153DC 01DC10DC D401ADC7 */  lwc1        $f13, 0x1D4($29)
/* 0153E0 01DC10E0 D801AEC7 */  lwc1        $f14, 0x1D8($29)
/* 0153E4 01DC10E4 28260070 */  paddub      $4, $0, $0
/* 0153E8 01DC10E8 6C0D770C */  jal         LightSet__Ffffi
/* 0153EC 01DC10EC 00000000 */   nop
.L01DC10F0_2C68F0:
/* 0153F0 01DC10F0 28260072 */  paddub      $4, $16, $0
/* 0153F4 01DC10F4 240F770C */  jal         FaceChange__Fi__3
/* 0153F8 01DC10F8 00000000 */   nop
/* 0153FC 01DC10FC B0110224 */  addiu       $2, $0, 0x11B0
/* 015400 01DC1100 18180202 */  mult        $3, $16, $2
/* 015404 01DC1104 DF01023C */  lui         $2, %hi(Chara__3)
/* 015408 01DC1108 E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 01540C 01DC110C 21204300 */  addu        $4, $2, $3
/* 015410 01DC1110 C4E4040C */  jal         Draw__10CCharacterFv
/* 015414 01DC1114 00000000 */   nop
.L01DC1118_2C6918:
/* 015418 01DC1118 01001026 */  addiu       $16, $16, 0x1
.L01DC111C_2C691C:
/* 01541C 01DC111C 1700022A */  slti        $2, $16, 0x17
/* 015420 01DC1120 BCFF4014 */  bnez        $2, .L01DC1014_2C6814
/* 015424 01DC1124 00000000 */   nop
/* 015428 01DC1128 DE01013C */  lui         $1, %hi(CScript__2 + 0x18)
/* 01542C 01DC112C 181B238C */  lw          $3, %lo(CScript__2 + 0x18)($1)
/* 015430 01DC1130 04000224 */  addiu       $2, $0, 0x4
/* 015434 01DC1134 05006214 */  bne         $3, $2, .L01DC114C_2C694C
/* 015438 01DC1138 00000000 */   nop
/* 01543C 01DC113C B807770C */  jal         MyEntryEffect_UNGAGA
/* 015440 01DC1140 00000000 */   nop
/* 015444 01DC1144 8006770C */  jal         DrawDancer__Fv
/* 015448 01DC1148 00000000 */   nop
.L01DC114C_2C694C:
/* 01544C 01DC114C DE01013C */  lui         $1, %hi(CScript__2)
/* 015450 01DC1150 001B228C */  lw          $2, %lo(CScript__2)($1)
/* 015454 01DC1154 43004128 */  slti        $1, $2, 0x43
/* 015458 01DC1158 0C002014 */  bnez        $1, .L01DC118C_2C698C
/* 01545C 01DC115C 00000000 */   nop
/* 015460 01DC1160 45004128 */  slti        $1, $2, 0x45
/* 015464 01DC1164 09002010 */  beqz        $1, .L01DC118C_2C698C
/* 015468 01DC1168 00000000 */   nop
/* 01546C 01DC116C C701023C */  lui         $2, %hi(TexManager)
/* 015470 01DC1170 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 015474 01DC1174 D48B858F */  lw          $5, -0x742C($28)
/* 015478 01DC1178 0A000624 */  addiu       $6, $0, 0xA
/* 01547C 01DC117C 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 015480 01DC1180 00000000 */   nop
/* 015484 01DC1184 A80C770C */  jal         WaterProcess__Fv
/* 015488 01DC1188 00000000 */   nop
.L01DC118C_2C698C:
/* 01548C 01DC118C DE01013C */  lui         $1, %hi(CScript__2 + 0x18)
/* 015490 01DC1190 181B238C */  lw          $3, %lo(CScript__2 + 0x18)($1)
/* 015494 01DC1194 05000224 */  addiu       $2, $0, 0x5
/* 015498 01DC1198 56006210 */  beq         $3, $2, .L01DC12F4_2C6AF4
/* 01549C 01DC119C 00000000 */   nop
/* 0154A0 01DC11A0 DE01013C */  lui         $1, %hi(CScript__2)
/* 0154A4 01DC11A4 001B228C */  lw          $2, %lo(CScript__2)($1)
/* 0154A8 01DC11A8 3C004128 */  slti        $1, $2, 0x3C
/* 0154AC 01DC11AC 51002010 */  beqz        $1, .L01DC12F4_2C6AF4
/* 0154B0 01DC11B0 00000000 */   nop
/* 0154B4 01DC11B4 C701023C */  lui         $2, %hi(TexManager)
/* 0154B8 01DC11B8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0154BC 01DC11BC D48B858F */  lw          $5, -0x742C($28)
/* 0154C0 01DC11C0 17000624 */  addiu       $6, $0, 0x17
/* 0154C4 01DC11C4 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 0154C8 01DC11C8 00000000 */   nop
/* 0154CC 01DC11CC C701023C */  lui         $2, %hi(TexManager)
/* 0154D0 01DC11D0 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0154D4 01DC11D4 DE01023C */  lui         $2, %hi(LIT_1557__4)
/* 0154D8 01DC11D8 38F94524 */  addiu       $5, $2, %lo(LIT_1557__4)
/* 0154DC 01DC11DC FFFF0624 */  addiu       $6, $0, -0x1
/* 0154E0 01DC11E0 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0154E4 01DC11E4 00000000 */   nop
/* 0154E8 01DC11E8 280044DC */  ld          $4, 0x28($2)
/* 0154EC 01DC11EC 28C2040C */  jal         MGBeginDrawShadow__F9sceGsTex0
/* 0154F0 01DC11F0 00000000 */   nop
/* 0154F4 01DC11F4 DE01013C */  lui         $1, %hi(CScript__2 + 0x18)
/* 0154F8 01DC11F8 181B238C */  lw          $3, %lo(CScript__2 + 0x18)($1)
/* 0154FC 01DC11FC 07000224 */  addiu       $2, $0, 0x7
/* 015500 01DC1200 1E006210 */  beq         $3, $2, .L01DC127C_2C6A7C
/* 015504 01DC1204 00000000 */   nop
/* 015508 01DC1208 28860070 */  paddub      $16, $0, $0
/* 01550C 01DC120C 16000010 */  b           .L01DC1268_2C6A68
/* 015510 01DC1210 00000000 */   nop
.L01DC1214_2C6A14:
/* 015514 01DC1214 00111000 */  sll         $2, $16, 4
/* 015518 01DC1218 23105000 */  subu        $2, $2, $16
/* 01551C 01DC121C 00190200 */  sll         $3, $2, 4
/* 015520 01DC1220 E201023C */  lui         $2, %hi(OP_NornMapObj)
/* 015524 01DC1224 B0F64224 */  addiu       $2, $2, %lo(OP_NornMapObj)
/* 015528 01DC1228 21884300 */  addu        $17, $2, $3
/* 01552C 01DC122C E001A427 */  addiu       $4, $29, 0x1E0
/* 015530 01DC1230 10002526 */  addiu       $5, $17, 0x10
/* 015534 01DC1234 0C86040C */  jal         sceVu0CopyVector
/* 015538 01DC1238 00000000 */   nop
/* 01553C 01DC123C E001ACC7 */  lwc1        $f12, 0x1E0($29)
/* 015540 01DC1240 E401ADC7 */  lwc1        $f13, 0x1E4($29)
/* 015544 01DC1244 E801AEC7 */  lwc1        $f14, 0x1E8($29)
/* 015548 01DC1248 28260070 */  paddub      $4, $0, $0
/* 01554C 01DC124C 6C0D770C */  jal         LightSet__Ffffi
/* 015550 01DC1250 00000000 */   nop
/* 015554 01DC1254 28262072 */  paddub      $4, $17, $0
/* 015558 01DC1258 282E0070 */  paddub      $5, $0, $0
/* 01555C 01DC125C D85D050C */  jal         DrawShadow__10CMapObjectFi
/* 015560 01DC1260 00000000 */   nop
/* 015564 01DC1264 01001026 */  addiu       $16, $16, 0x1
.L01DC1268_2C6A68:
/* 015568 01DC1268 4B00022A */  slti        $2, $16, 0x4B
/* 01556C 01DC126C E9FF4014 */  bnez        $2, .L01DC1214_2C6A14
/* 015570 01DC1270 00000000 */   nop
/* 015574 01DC1274 1C000010 */  b           .L01DC12E8_2C6AE8
/* 015578 01DC1278 00000000 */   nop
.L01DC127C_2C6A7C:
/* 01557C 01DC127C 28860070 */  paddub      $16, $0, $0
/* 015580 01DC1280 16000010 */  b           .L01DC12DC_2C6ADC
/* 015584 01DC1284 00000000 */   nop
.L01DC1288_2C6A88:
/* 015588 01DC1288 00111000 */  sll         $2, $16, 4
/* 01558C 01DC128C 23105000 */  subu        $2, $2, $16
/* 015590 01DC1290 00190200 */  sll         $3, $2, 4
/* 015594 01DC1294 E201023C */  lui         $2, %hi(OP_NornMapObj)
/* 015598 01DC1298 B0F64224 */  addiu       $2, $2, %lo(OP_NornMapObj)
/* 01559C 01DC129C 21884300 */  addu        $17, $2, $3
/* 0155A0 01DC12A0 F001A427 */  addiu       $4, $29, 0x1F0
/* 0155A4 01DC12A4 10002526 */  addiu       $5, $17, 0x10
/* 0155A8 01DC12A8 0C86040C */  jal         sceVu0CopyVector
/* 0155AC 01DC12AC 00000000 */   nop
/* 0155B0 01DC12B0 F001ACC7 */  lwc1        $f12, 0x1F0($29)
/* 0155B4 01DC12B4 F401ADC7 */  lwc1        $f13, 0x1F4($29)
/* 0155B8 01DC12B8 F801AEC7 */  lwc1        $f14, 0x1F8($29)
/* 0155BC 01DC12BC 28260070 */  paddub      $4, $0, $0
/* 0155C0 01DC12C0 6C0D770C */  jal         LightSet__Ffffi
/* 0155C4 01DC12C4 00000000 */   nop
/* 0155C8 01DC12C8 28262072 */  paddub      $4, $17, $0
/* 0155CC 01DC12CC 282E0070 */  paddub      $5, $0, $0
/* 0155D0 01DC12D0 D85D050C */  jal         DrawShadow__10CMapObjectFi
/* 0155D4 01DC12D4 00000000 */   nop
/* 0155D8 01DC12D8 01001026 */  addiu       $16, $16, 0x1
.L01DC12DC_2C6ADC:
/* 0155DC 01DC12DC 4C00022A */  slti        $2, $16, 0x4C
/* 0155E0 01DC12E0 E9FF4014 */  bnez        $2, .L01DC1288_2C6A88
/* 0155E4 01DC12E4 00000000 */   nop
.L01DC12E8_2C6AE8:
/* 0155E8 01DC12E8 34000424 */  addiu       $4, $0, 0x34
/* 0155EC 01DC12EC CCC2040C */  jal         MGEndDrawShadow__FUc
/* 0155F0 01DC12F0 00000000 */   nop
.L01DC12F4_2C6AF4:
/* 0155F4 01DC12F4 DE01013C */  lui         $1, %hi(CScript__2 + 0x18)
/* 0155F8 01DC12F8 181B238C */  lw          $3, %lo(CScript__2 + 0x18)($1)
/* 0155FC 01DC12FC 05000224 */  addiu       $2, $0, 0x5
/* 015600 01DC1300 E0006210 */  beq         $3, $2, .L01DC1684_2C6E84
/* 015604 01DC1304 00000000 */   nop
/* 015608 01DC1308 B898828F */  lw          $2, -0x6748($28)
/* 01560C 01DC130C DD004018 */  blez        $2, .L01DC1684_2C6E84
/* 015610 01DC1310 00000000 */   nop
/* 015614 01DC1314 A0B8040C */  jal         GetVif1Packet__Fv
/* 015618 01DC1318 00000000 */   nop
/* 01561C 01DC131C C701033C */  lui         $3, %hi(TexManager)
/* 015620 01DC1320 70586424 */  addiu       $4, $3, %lo(TexManager)
/* 015624 01DC1324 282E4070 */  paddub      $5, $2, $0
/* 015628 01DC1328 28360070 */  paddub      $6, $0, $0
/* 01562C 01DC132C 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 015630 01DC1330 00000000 */   nop
/* 015634 01DC1334 0898828F */  lw          $2, -0x67F8($28)
/* 015638 01DC1338 0D004014 */  bnez        $2, .L01DC1370_2C6B70
/* 01563C 01DC133C 00000000 */   nop
/* 015640 01DC1340 F49981C7 */  lwc1        $f1, -0x660C($28)
/* 015644 01DC1344 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 015648 01DC1348 00008244 */  mtc1        $2, $f0
/* 01564C 01DC134C 00000000 */  nop
/* 015650 01DC1350 34080046 */  c.lt.s      $f1, $f0
/* 015654 01DC1354 00000000 */  nop
/* 015658 01DC1358 05000145 */  bc1t        .L01DC1370_2C6B70
/* 01565C 01DC135C 00000000 */   nop
/* 015660 01DC1360 E301023C */  lui         $2, %hi(CFire__3)
/* 015664 01DC1364 30AB4424 */  addiu       $4, $2, %lo(CFire__3)
/* 015668 01DC1368 BC85050C */  jal         FireStep__9CFireOmniFv
/* 01566C 01DC136C 00000000 */   nop
.L01DC1370_2C6B70:
/* 015670 01DC1370 E301023C */  lui         $2, %hi(CFire__3)
/* 015674 01DC1374 30AB4424 */  addiu       $4, $2, %lo(CFire__3)
/* 015678 01DC1378 F085050C */  jal         FireCreate__9CFireOmniFv
/* 01567C 01DC137C 00000000 */   nop
/* 015680 01DC1380 0498838F */  lw          $3, -0x67FC($28)
/* 015684 01DC1384 B0110224 */  addiu       $2, $0, 0x11B0
/* 015688 01DC1388 18186200 */  mult        $3, $3, $2
/* 01568C 01DC138C E101023C */  lui         $2, %hi(Cam__2 + 0xBC)
/* 015690 01DC1390 8C994224 */  addiu       $2, $2, %lo(Cam__2 + 0xBC)
/* 015694 01DC1394 21104300 */  addu        $2, $2, $3
/* 015698 01DC1398 0000428C */  lw          $2, 0x0($2)
/* 01569C 01DC139C C49882AF */  sw          $2, -0x673C($28)
/* 0156A0 01DC13A0 C498828F */  lw          $2, -0x673C($28)
/* 0156A4 01DC13A4 0002A427 */  addiu       $4, $29, 0x200
/* 0156A8 01DC13A8 20024524 */  addiu       $5, $2, 0x220
/* 0156AC 01DC13AC 0C86040C */  jal         sceVu0CopyVector
/* 0156B0 01DC13B0 00000000 */   nop
/* 0156B4 01DC13B4 DE01013C */  lui         $1, %hi(CScript__2 + 0x18)
/* 0156B8 01DC13B8 181B238C */  lw          $3, %lo(CScript__2 + 0x18)($1)
/* 0156BC 01DC13BC 07000224 */  addiu       $2, $0, 0x7
/* 0156C0 01DC13C0 5B006210 */  beq         $3, $2, .L01DC1530_2C6D30
/* 0156C4 01DC13C4 00000000 */   nop
/* 0156C8 01DC13C8 28860070 */  paddub      $16, $0, $0
/* 0156CC 01DC13CC 53000010 */  b           .L01DC151C_2C6D1C
/* 0156D0 01DC13D0 00000000 */   nop
.L01DC13D4_2C6BD4:
/* 0156D4 01DC13D4 00191000 */  sll         $3, $16, 4
/* 0156D8 01DC13D8 E201023C */  lui         $2, %hi(OP_FirePosition + 0x8)
/* 0156DC 01DC13DC 28D74224 */  addiu       $2, $2, %lo(OP_FirePosition + 0x8)
/* 0156E0 01DC13E0 21104300 */  addu        $2, $2, $3
/* 0156E4 01DC13E4 000043C4 */  lwc1        $f3, 0x0($2)
/* 0156E8 01DC13E8 E201023C */  lui         $2, %hi(OP_FirePosition + 0x4)
/* 0156EC 01DC13EC 24D74224 */  addiu       $2, $2, %lo(OP_FirePosition + 0x4)
/* 0156F0 01DC13F0 21104300 */  addu        $2, $2, $3
/* 0156F4 01DC13F4 000042C4 */  lwc1        $f2, 0x0($2)
/* 0156F8 01DC13F8 E201023C */  lui         $2, %hi(OP_FirePosition)
/* 0156FC 01DC13FC 20D74224 */  addiu       $2, $2, %lo(OP_FirePosition)
/* 015700 01DC1400 21104300 */  addu        $2, $2, $3
/* 015704 01DC1404 000040C4 */  lwc1        $f0, 0x0($2)
/* 015708 01DC1408 2041023C */  lui         $2, (0x41200000 >> 16)
/* 01570C 01DC140C 00088244 */  mtc1        $2, $f1
/* 015710 01DC1410 00000000 */  nop
/* 015714 01DC1414 02080046 */  mul.s       $f0, $f1, $f0
/* 015718 01DC1418 E301013C */  lui         $1, %hi(CFire__3 + 0x20)
/* 01571C 01DC141C 50AB20E4 */  swc1        $f0, %lo(CFire__3 + 0x20)($1)
/* 015720 01DC1420 02080246 */  mul.s       $f0, $f1, $f2
/* 015724 01DC1424 E301013C */  lui         $1, %hi(CFire__3 + 0x24)
/* 015728 01DC1428 54AB20E4 */  swc1        $f0, %lo(CFire__3 + 0x24)($1)
/* 01572C 01DC142C 02080346 */  mul.s       $f0, $f1, $f3
/* 015730 01DC1430 E301013C */  lui         $1, %hi(CFire__3 + 0x28)
/* 015734 01DC1434 58AB20E4 */  swc1        $f0, %lo(CFire__3 + 0x28)($1)
/* 015738 01DC1438 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 01573C 01DC143C E301013C */  lui         $1, %hi(CFire__3 + 0x2C)
/* 015740 01DC1440 5CAB22AC */  sw          $2, %lo(CFire__3 + 0x2C)($1)
/* 015744 01DC1444 80181000 */  sll         $3, $16, 2
/* 015748 01DC1448 E201023C */  lui         $2, %hi(OP_FireFlg)
/* 01574C 01DC144C A0DE4224 */  addiu       $2, $2, %lo(OP_FireFlg)
/* 015750 01DC1450 21104300 */  addu        $2, $2, $3
/* 015754 01DC1454 0000428C */  lw          $2, 0x0($2)
/* 015758 01DC1458 01000624 */  addiu       $6, $0, 0x1
/* 01575C 01DC145C 1F004614 */  bne         $2, $6, .L01DC14DC_2C6CDC
/* 015760 01DC1460 00000000 */   nop
/* 015764 01DC1464 E201023C */  lui         $2, %hi(OP_FireScale)
/* 015768 01DC1468 20DD4224 */  addiu       $2, $2, %lo(OP_FireScale)
/* 01576C 01DC146C 21104300 */  addu        $2, $2, $3
/* 015770 01DC1470 000054C4 */  lwc1        $f20, 0x0($2)
/* 015774 01DC1474 2E40023C */  lui         $2, (0x402E0000 >> 16)
/* 015778 01DC1478 3C880200 */  dsll32      $17, $2, 0
/* 01577C 01DC147C 06A30046 */  mov.s       $f12, $f20
/* 015780 01DC1480 9044040C */  jal         fptodp
/* 015784 01DC1484 00000000 */   nop
/* 015788 01DC1488 28262072 */  paddub      $4, $17, $0
/* 01578C 01DC148C 282E4070 */  paddub      $5, $2, $0
/* 015790 01DC1490 9E3F040C */  jal         dpmul
/* 015794 01DC1494 00000000 */   nop
/* 015798 01DC1498 28264070 */  paddub      $4, $2, $0
/* 01579C 01DC149C 9241040C */  jal         dptofp
/* 0157A0 01DC14A0 00000000 */   nop
/* 0157A4 01DC14A4 E301023C */  lui         $2, %hi(CFire__3)
/* 0157A8 01DC14A8 30AB4424 */  addiu       $4, $2, %lo(CFire__3)
/* 0157AC 01DC14AC 01000524 */  addiu       $5, $0, 0x1
/* 0157B0 01DC14B0 2836A070 */  paddub      $6, $5, $0
/* 0157B4 01DC14B4 E101023C */  lui         $2, %hi(OP_MainCamera)
/* 0157B8 01DC14B8 E0954724 */  addiu       $7, $2, %lo(OP_MainCamera)
/* 0157BC 01DC14BC 0002A827 */  addiu       $8, $29, 0x200
/* 0157C0 01DC14C0 06A30046 */  mov.s       $f12, $f20
/* 0157C4 01DC14C4 03000924 */  addiu       $9, $0, 0x3
/* 0157C8 01DC14C8 46030046 */  mov.s       $f13, $f0
/* 0157CC 01DC14CC B086050C */  jal         DrawFire__9CFireOmniFiiP7CCameraPffif
/* 0157D0 01DC14D0 00000000 */   nop
/* 0157D4 01DC14D4 10000010 */  b           .L01DC1518_2C6D18
/* 0157D8 01DC14D8 00000000 */   nop
.L01DC14DC_2C6CDC:
/* 0157DC 01DC14DC E201023C */  lui         $2, %hi(OP_FireScale)
/* 0157E0 01DC14E0 20DD4224 */  addiu       $2, $2, %lo(OP_FireScale)
/* 0157E4 01DC14E4 21184300 */  addu        $3, $2, $3
/* 0157E8 01DC14E8 7041023C */  lui         $2, (0x41700000 >> 16)
/* 0157EC 01DC14EC 00688244 */  mtc1        $2, $f13
/* 0157F0 01DC14F0 E301023C */  lui         $2, %hi(CFire__3)
/* 0157F4 01DC14F4 30AB4424 */  addiu       $4, $2, %lo(CFire__3)
/* 0157F8 01DC14F8 282EC070 */  paddub      $5, $6, $0
/* 0157FC 01DC14FC E101023C */  lui         $2, %hi(OP_MainCamera)
/* 015800 01DC1500 E0954724 */  addiu       $7, $2, %lo(OP_MainCamera)
/* 015804 01DC1504 0002A827 */  addiu       $8, $29, 0x200
/* 015808 01DC1508 00006CC4 */  lwc1        $f12, 0x0($3)
/* 01580C 01DC150C 02000924 */  addiu       $9, $0, 0x2
/* 015810 01DC1510 B086050C */  jal         DrawFire__9CFireOmniFiiP7CCameraPffif
/* 015814 01DC1514 00000000 */   nop
.L01DC1518_2C6D18:
/* 015818 01DC1518 01001026 */  addiu       $16, $16, 0x1
.L01DC151C_2C6D1C:
/* 01581C 01DC151C 1600022A */  slti        $2, $16, 0x16
/* 015820 01DC1520 ACFF4014 */  bnez        $2, .L01DC13D4_2C6BD4
/* 015824 01DC1524 00000000 */   nop
/* 015828 01DC1528 56000010 */  b           .L01DC1684_2C6E84
/* 01582C 01DC152C 00000000 */   nop
.L01DC1530_2C6D30:
/* 015830 01DC1530 28860070 */  paddub      $16, $0, $0
/* 015834 01DC1534 4F000010 */  b           .L01DC1674_2C6E74
/* 015838 01DC1538 00000000 */   nop
.L01DC153C_2C6D3C:
/* 01583C 01DC153C 1600012A */  slti        $1, $16, 0x16
/* 015840 01DC1540 07002010 */  beqz        $1, .L01DC1560_2C6D60
/* 015844 01DC1544 00000000 */   nop
/* 015848 01DC1548 C8C2043C */  lui         $4, (0xC2C80000 >> 16)
/* 01584C 01DC154C 00191000 */  sll         $3, $16, 4
/* 015850 01DC1550 E201023C */  lui         $2, %hi(OP_FirePosition + 0x4)
/* 015854 01DC1554 24D74224 */  addiu       $2, $2, %lo(OP_FirePosition + 0x4)
/* 015858 01DC1558 21104300 */  addu        $2, $2, $3
/* 01585C 01DC155C 000044AC */  sw          $4, 0x0($2)
.L01DC1560_2C6D60:
/* 015860 01DC1560 00191000 */  sll         $3, $16, 4
/* 015864 01DC1564 E201023C */  lui         $2, %hi(OP_FirePosition + 0x8)
/* 015868 01DC1568 28D74224 */  addiu       $2, $2, %lo(OP_FirePosition + 0x8)
/* 01586C 01DC156C 21104300 */  addu        $2, $2, $3
/* 015870 01DC1570 000043C4 */  lwc1        $f3, 0x0($2)
/* 015874 01DC1574 E201023C */  lui         $2, %hi(OP_FirePosition + 0x4)
/* 015878 01DC1578 24D74224 */  addiu       $2, $2, %lo(OP_FirePosition + 0x4)
/* 01587C 01DC157C 21104300 */  addu        $2, $2, $3
/* 015880 01DC1580 000042C4 */  lwc1        $f2, 0x0($2)
/* 015884 01DC1584 E201023C */  lui         $2, %hi(OP_FirePosition)
/* 015888 01DC1588 20D74224 */  addiu       $2, $2, %lo(OP_FirePosition)
/* 01588C 01DC158C 21104300 */  addu        $2, $2, $3
/* 015890 01DC1590 000040C4 */  lwc1        $f0, 0x0($2)
/* 015894 01DC1594 2041023C */  lui         $2, (0x41200000 >> 16)
/* 015898 01DC1598 00088244 */  mtc1        $2, $f1
/* 01589C 01DC159C 00000000 */  nop
/* 0158A0 01DC15A0 02080046 */  mul.s       $f0, $f1, $f0
/* 0158A4 01DC15A4 E301013C */  lui         $1, %hi(CFire__3 + 0x20)
/* 0158A8 01DC15A8 50AB20E4 */  swc1        $f0, %lo(CFire__3 + 0x20)($1)
/* 0158AC 01DC15AC 02080246 */  mul.s       $f0, $f1, $f2
/* 0158B0 01DC15B0 E301013C */  lui         $1, %hi(CFire__3 + 0x24)
/* 0158B4 01DC15B4 54AB20E4 */  swc1        $f0, %lo(CFire__3 + 0x24)($1)
/* 0158B8 01DC15B8 02080346 */  mul.s       $f0, $f1, $f3
/* 0158BC 01DC15BC E301013C */  lui         $1, %hi(CFire__3 + 0x28)
/* 0158C0 01DC15C0 58AB20E4 */  swc1        $f0, %lo(CFire__3 + 0x28)($1)
/* 0158C4 01DC15C4 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0158C8 01DC15C8 E301013C */  lui         $1, %hi(CFire__3 + 0x2C)
/* 0158CC 01DC15CC 5CAB22AC */  sw          $2, %lo(CFire__3 + 0x2C)($1)
/* 0158D0 01DC15D0 80181000 */  sll         $3, $16, 2
/* 0158D4 01DC15D4 E201023C */  lui         $2, %hi(OP_FireFlg)
/* 0158D8 01DC15D8 A0DE4224 */  addiu       $2, $2, %lo(OP_FireFlg)
/* 0158DC 01DC15DC 21104300 */  addu        $2, $2, $3
/* 0158E0 01DC15E0 0000428C */  lw          $2, 0x0($2)
/* 0158E4 01DC15E4 01000524 */  addiu       $5, $0, 0x1
/* 0158E8 01DC15E8 12004514 */  bne         $2, $5, .L01DC1634_2C6E34
/* 0158EC 01DC15EC 00000000 */   nop
/* 0158F0 01DC15F0 E201023C */  lui         $2, %hi(OP_FireScale)
/* 0158F4 01DC15F4 20DD4224 */  addiu       $2, $2, %lo(OP_FireScale)
/* 0158F8 01DC15F8 21184300 */  addu        $3, $2, $3
/* 0158FC 01DC15FC 7041023C */  lui         $2, (0x41700000 >> 16)
/* 015900 01DC1600 00688244 */  mtc1        $2, $f13
/* 015904 01DC1604 E301023C */  lui         $2, %hi(CFire__3)
/* 015908 01DC1608 30AB4424 */  addiu       $4, $2, %lo(CFire__3)
/* 01590C 01DC160C 2836A070 */  paddub      $6, $5, $0
/* 015910 01DC1610 E101023C */  lui         $2, %hi(OP_MainCamera)
/* 015914 01DC1614 E0954724 */  addiu       $7, $2, %lo(OP_MainCamera)
/* 015918 01DC1618 0002A827 */  addiu       $8, $29, 0x200
/* 01591C 01DC161C 00006CC4 */  lwc1        $f12, 0x0($3)
/* 015920 01DC1620 03000924 */  addiu       $9, $0, 0x3
/* 015924 01DC1624 B086050C */  jal         DrawFire__9CFireOmniFiiP7CCameraPffif
/* 015928 01DC1628 00000000 */   nop
/* 01592C 01DC162C 10000010 */  b           .L01DC1670_2C6E70
/* 015930 01DC1630 00000000 */   nop
.L01DC1634_2C6E34:
/* 015934 01DC1634 E201023C */  lui         $2, %hi(OP_FireScale)
/* 015938 01DC1638 20DD4224 */  addiu       $2, $2, %lo(OP_FireScale)
/* 01593C 01DC163C 21184300 */  addu        $3, $2, $3
/* 015940 01DC1640 7041023C */  lui         $2, (0x41700000 >> 16)
/* 015944 01DC1644 00688244 */  mtc1        $2, $f13
/* 015948 01DC1648 E301023C */  lui         $2, %hi(CFire__3)
/* 01594C 01DC164C 30AB4424 */  addiu       $4, $2, %lo(CFire__3)
/* 015950 01DC1650 2836A070 */  paddub      $6, $5, $0
/* 015954 01DC1654 E101023C */  lui         $2, %hi(OP_MainCamera)
/* 015958 01DC1658 E0954724 */  addiu       $7, $2, %lo(OP_MainCamera)
/* 01595C 01DC165C 0002A827 */  addiu       $8, $29, 0x200
/* 015960 01DC1660 00006CC4 */  lwc1        $f12, 0x0($3)
/* 015964 01DC1664 02000924 */  addiu       $9, $0, 0x2
/* 015968 01DC1668 B086050C */  jal         DrawFire__9CFireOmniFiiP7CCameraPffif
/* 01596C 01DC166C 00000000 */   nop
.L01DC1670_2C6E70:
/* 015970 01DC1670 01001026 */  addiu       $16, $16, 0x1
.L01DC1674_2C6E74:
/* 015974 01DC1674 B898828F */  lw          $2, -0x6748($28)
/* 015978 01DC1678 2A100202 */  slt         $2, $16, $2
/* 01597C 01DC167C AFFF4014 */  bnez        $2, .L01DC153C_2C6D3C
/* 015980 01DC1680 00000000 */   nop
.L01DC1684_2C6E84:
/* 015984 01DC1684 DE01013C */  lui         $1, %hi(CScript__2 + 0x18)
/* 015988 01DC1688 181B228C */  lw          $2, %lo(CScript__2 + 0x18)($1)
/* 01598C 01DC168C 05004228 */  slti        $2, $2, 0x5
/* 015990 01DC1690 25004014 */  bnez        $2, .L01DC1728_2C6F28
/* 015994 01DC1694 00000000 */   nop
/* 015998 01DC1698 DE01013C */  lui         $1, %hi(CScript__2)
/* 01599C 01DC169C 001B238C */  lw          $3, %lo(CScript__2)($1)
/* 0159A0 01DC16A0 4D000224 */  addiu       $2, $0, 0x4D
/* 0159A4 01DC16A4 1E006214 */  bne         $3, $2, .L01DC1720_2C6F20
/* 0159A8 01DC16A8 00000000 */   nop
/* 0159AC 01DC16AC 0498838F */  lw          $3, -0x67FC($28)
/* 0159B0 01DC16B0 B0110224 */  addiu       $2, $0, 0x11B0
/* 0159B4 01DC16B4 18186200 */  mult        $3, $3, $2
/* 0159B8 01DC16B8 E101023C */  lui         $2, %hi(Cam__2 + 0x2F0)
/* 0159BC 01DC16BC C09B4224 */  addiu       $2, $2, %lo(Cam__2 + 0x2F0)
/* 0159C0 01DC16C0 21104300 */  addu        $2, $2, $3
/* 0159C4 01DC16C4 000041C4 */  lwc1        $f1, 0x0($2)
/* 0159C8 01DC16C8 1642023C */  lui         $2, (0x42160000 >> 16)
/* 0159CC 01DC16CC 00008244 */  mtc1        $2, $f0
/* 0159D0 01DC16D0 00000000 */  nop
/* 0159D4 01DC16D4 36080046 */  c.le.s      $f1, $f0
/* 0159D8 01DC16D8 00000000 */  nop
/* 0159DC 01DC16DC 10000145 */  bc1t        .L01DC1720_2C6F20
/* 0159E0 01DC16E0 00000000 */   nop
/* 0159E4 01DC16E4 F899828F */  lw          $2, -0x6608($28)
/* 0159E8 01DC16E8 0D004014 */  bnez        $2, .L01DC1720_2C6F20
/* 0159EC 01DC16EC 00000000 */   nop
/* 0159F0 01DC16F0 01000224 */  addiu       $2, $0, 0x1
/* 0159F4 01DC16F4 F89982AF */  sw          $2, -0x6608($28)
/* 0159F8 01DC16F8 FC9780AF */  sw          $0, -0x6804($28)
/* 0159FC 01DC16FC ACC3760C */  jal         OpBgmPlay__Fv
/* 015A00 01DC1700 00000000 */   nop
/* 015A04 01DC1704 80BF023C */  lui         $2, (0xBF800000 >> 16)
/* 015A08 01DC1708 00608244 */  mtc1        $2, $f12
/* 015A0C 01DC170C 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 015A10 01DC1710 01000524 */  addiu       $5, $0, 0x1
/* 015A14 01DC1714 28360070 */  paddub      $6, $0, $0
/* 015A18 01DC1718 FC16050C */  jal         Fade__6CSoundFifi
/* 015A1C 01DC171C 00000000 */   nop
.L01DC1720_2C6F20:
/* 015A20 01DC1720 2809770C */  jal         main_fogRate
/* 015A24 01DC1724 00000000 */   nop
.L01DC1728_2C6F28:
/* 015A28 01DC1728 DE01013C */  lui         $1, %hi(CScript__2 + 0x18)
/* 015A2C 01DC172C 181B238C */  lw          $3, %lo(CScript__2 + 0x18)($1)
/* 015A30 01DC1730 07000224 */  addiu       $2, $0, 0x7
/* 015A34 01DC1734 09006214 */  bne         $3, $2, .L01DC175C_2C6F5C
/* 015A38 01DC1738 00000000 */   nop
/* 015A3C 01DC173C C701023C */  lui         $2, %hi(TexManager)
/* 015A40 01DC1740 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 015A44 01DC1744 D48B858F */  lw          $5, -0x742C($28)
/* 015A48 01DC1748 11000624 */  addiu       $6, $0, 0x11
/* 015A4C 01DC174C 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 015A50 01DC1750 00000000 */   nop
/* 015A54 01DC1754 4C0B770C */  jal         SmokeProcess__Fv__2
/* 015A58 01DC1758 00000000 */   nop
.L01DC175C_2C6F5C:
/* 015A5C 01DC175C DE01013C */  lui         $1, %hi(CScript__2 + 0x18)
/* 015A60 01DC1760 181B228C */  lw          $2, %lo(CScript__2 + 0x18)($1)
/* 015A64 01DC1764 06004228 */  slti        $2, $2, 0x6
/* 015A68 01DC1768 89004014 */  bnez        $2, .L01DC1990_2C7190
/* 015A6C 01DC176C 00000000 */   nop
/* 015A70 01DC1770 DE01013C */  lui         $1, %hi(CScript__2 + 0x514)
/* 015A74 01DC1774 14202290 */  lbu         $2, %lo(CScript__2 + 0x514)($1)
/* 015A78 01DC1778 59004010 */  beqz        $2, .L01DC18E0_2C70E0
/* 015A7C 01DC177C 00000000 */   nop
/* 015A80 01DC1780 DE01013C */  lui         $1, %hi(CScript__2 + 0x510)
/* 015A84 01DC1784 1020308C */  lw          $16, %lo(CScript__2 + 0x510)($1)
/* 015A88 01DC1788 80181000 */  sll         $3, $16, 2
/* 015A8C 01DC178C DE01023C */  lui         $2, %hi(CScript__2 + 0x550)
/* 015A90 01DC1790 50204224 */  addiu       $2, $2, %lo(CScript__2 + 0x550)
/* 015A94 01DC1794 21104300 */  addu        $2, $2, $3
/* 015A98 01DC1798 000054C4 */  lwc1        $f20, 0x0($2)
/* 015A9C 01DC179C 288E0070 */  paddub      $17, $0, $0
/* 015AA0 01DC17A0 30000010 */  b           .L01DC1864_2C7064
/* 015AA4 01DC17A4 00000000 */   nop
.L01DC17A8_2C6FA8:
/* 015AA8 01DC17A8 C0101000 */  sll         $2, $16, 3
/* 015AAC 01DC17AC 21105000 */  addu        $2, $2, $16
/* 015AB0 01DC17B0 40910200 */  sll         $18, $2, 5
/* 015AB4 01DC17B4 E301023C */  lui         $2, %hi(CBomb)
/* 015AB8 01DC17B8 90BA4224 */  addiu       $2, $2, %lo(CBomb)
/* 015ABC 01DC17BC 21185200 */  addu        $3, $2, $18
/* 015AC0 01DC17C0 00111100 */  sll         $2, $17, 4
/* 015AC4 01DC17C4 21204300 */  addu        $4, $2, $3
/* 015AC8 01DC17C8 00191000 */  sll         $3, $16, 4
/* 015ACC 01DC17CC DE01023C */  lui         $2, %hi(CScript__2)
/* 015AD0 01DC17D0 001B4224 */  addiu       $2, $2, %lo(CScript__2)
/* 015AD4 01DC17D4 21104300 */  addu        $2, $2, $3
/* 015AD8 01DC17D8 20054524 */  addiu       $5, $2, 0x520
/* 015ADC 01DC17DC 0C86040C */  jal         sceVu0CopyVector
/* 015AE0 01DC17E0 00000000 */   nop
/* 015AE4 01DC17E4 E301023C */  lui         $2, %hi(CBomb + 0x80)
/* 015AE8 01DC17E8 10BB4224 */  addiu       $2, $2, %lo(CBomb + 0x80)
/* 015AEC 01DC17EC 21185200 */  addu        $3, $2, $18
/* 015AF0 01DC17F0 80101100 */  sll         $2, $17, 2
/* 015AF4 01DC17F4 21184300 */  addu        $3, $2, $3
/* 015AF8 01DC17F8 000060AC */  sw          $0, 0x0($3)
/* 015AFC 01DC17FC 40181100 */  sll         $3, $17, 1
/* 015B00 01DC1800 21187100 */  addu        $3, $3, $17
/* 015B04 01DC1804 23200300 */  negu        $4, $3
/* 015B08 01DC1808 E301033C */  lui         $3, %hi(CBomb + 0xA0)
/* 015B0C 01DC180C 30BB6324 */  addiu       $3, $3, %lo(CBomb + 0xA0)
/* 015B10 01DC1810 21187200 */  addu        $3, $3, $18
/* 015B14 01DC1814 21184300 */  addu        $3, $2, $3
/* 015B18 01DC1818 000064AC */  sw          $4, 0x0($3)
/* 015B1C 01DC181C 0043043C */  lui         $4, (0x43000000 >> 16)
/* 015B20 01DC1820 E301033C */  lui         $3, %hi(CBomb + 0xE0)
/* 015B24 01DC1824 70BB6324 */  addiu       $3, $3, %lo(CBomb + 0xE0)
/* 015B28 01DC1828 21187200 */  addu        $3, $3, $18
/* 015B2C 01DC182C 21184300 */  addu        $3, $2, $3
/* 015B30 01DC1830 000064AC */  sw          $4, 0x0($3)
/* 015B34 01DC1834 E301033C */  lui         $3, %hi(CBomb + 0xC0)
/* 015B38 01DC1838 50BB6324 */  addiu       $3, $3, %lo(CBomb + 0xC0)
/* 015B3C 01DC183C 21187200 */  addu        $3, $3, $18
/* 015B40 01DC1840 21184300 */  addu        $3, $2, $3
/* 015B44 01DC1844 000074E4 */  swc1        $f20, 0x0($3)
/* 015B48 01DC1848 01000424 */  addiu       $4, $0, 0x1
/* 015B4C 01DC184C E301033C */  lui         $3, %hi(CBomb + 0x100)
/* 015B50 01DC1850 90BB6324 */  addiu       $3, $3, %lo(CBomb + 0x100)
/* 015B54 01DC1854 21187200 */  addu        $3, $3, $18
/* 015B58 01DC1858 21104300 */  addu        $2, $2, $3
/* 015B5C 01DC185C 000044AC */  sw          $4, 0x0($2)
/* 015B60 01DC1860 01003126 */  addiu       $17, $17, 0x1
.L01DC1864_2C7064:
/* 015B64 01DC1864 0800222A */  slti        $2, $17, 0x8
/* 015B68 01DC1868 CFFF4014 */  bnez        $2, .L01DC17A8_2C6FA8
/* 015B6C 01DC186C 00000000 */   nop
/* 015B70 01DC1870 02000324 */  addiu       $3, $0, 0x2
/* 015B74 01DC1874 C0101000 */  sll         $2, $16, 3
/* 015B78 01DC1878 21105000 */  addu        $2, $2, $16
/* 015B7C 01DC187C 40210200 */  sll         $4, $2, 5
/* 015B80 01DC1880 E301023C */  lui         $2, %hi(CBomb + 0x80)
/* 015B84 01DC1884 10BB4224 */  addiu       $2, $2, %lo(CBomb + 0x80)
/* 015B88 01DC1888 21104400 */  addu        $2, $2, $4
/* 015B8C 01DC188C 000043AC */  sw          $3, 0x0($2)
/* 015B90 01DC1890 01000324 */  addiu       $3, $0, 0x1
/* 015B94 01DC1894 E301023C */  lui         $2, %hi(CBomb + 0x84)
/* 015B98 01DC1898 14BB4224 */  addiu       $2, $2, %lo(CBomb + 0x84)
/* 015B9C 01DC189C 21104400 */  addu        $2, $2, $4
/* 015BA0 01DC18A0 000043AC */  sw          $3, 0x0($2)
/* 015BA4 01DC18A4 0042033C */  lui         $3, (0x42000000 >> 16)
/* 015BA8 01DC18A8 E301023C */  lui         $2, %hi(CBomb + 0xF4)
/* 015BAC 01DC18AC 84BB4224 */  addiu       $2, $2, %lo(CBomb + 0xF4)
/* 015BB0 01DC18B0 21104400 */  addu        $2, $2, $4
/* 015BB4 01DC18B4 000043AC */  sw          $3, 0x0($2)
/* 015BB8 01DC18B8 E301023C */  lui         $2, %hi(CBomb + 0xF8)
/* 015BBC 01DC18BC 88BB4224 */  addiu       $2, $2, %lo(CBomb + 0xF8)
/* 015BC0 01DC18C0 21104400 */  addu        $2, $2, $4
/* 015BC4 01DC18C4 000043AC */  sw          $3, 0x0($2)
/* 015BC8 01DC18C8 E301023C */  lui         $2, %hi(CBomb + 0xFC)
/* 015BCC 01DC18CC 8CBB4224 */  addiu       $2, $2, %lo(CBomb + 0xFC)
/* 015BD0 01DC18D0 21104400 */  addu        $2, $2, $4
/* 015BD4 01DC18D4 000043AC */  sw          $3, 0x0($2)
/* 015BD8 01DC18D8 DE01013C */  lui         $1, %hi(CScript__2 + 0x514)
/* 015BDC 01DC18DC 142020A0 */  sb          $0, %lo(CScript__2 + 0x514)($1)
.L01DC18E0_2C70E0:
/* 015BE0 01DC18E0 C701023C */  lui         $2, %hi(TexManager)
/* 015BE4 01DC18E4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 015BE8 01DC18E8 D48B858F */  lw          $5, -0x742C($28)
/* 015BEC 01DC18EC 11000624 */  addiu       $6, $0, 0x11
/* 015BF0 01DC18F0 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 015BF4 01DC18F4 00000000 */   nop
/* 015BF8 01DC18F8 DE01013C */  lui         $1, %hi(CScript__2)
/* 015BFC 01DC18FC 001B238C */  lw          $3, %lo(CScript__2)($1)
/* 015C00 01DC1900 64000224 */  addiu       $2, $0, 0x64
/* 015C04 01DC1904 04006214 */  bne         $3, $2, .L01DC1918_2C7118
/* 015C08 01DC1908 00000000 */   nop
/* 015C0C 01DC190C 01001024 */  addiu       $16, $0, 0x1
/* 015C10 01DC1910 02000010 */  b           .L01DC191C_2C711C
/* 015C14 01DC1914 00000000 */   nop
.L01DC1918_2C7118:
/* 015C18 01DC1918 28860070 */  paddub      $16, $0, $0
.L01DC191C_2C711C:
/* 015C1C 01DC191C 288E0070 */  paddub      $17, $0, $0
/* 015C20 01DC1920 18000010 */  b           .L01DC1984_2C7184
/* 015C24 01DC1924 00000000 */   nop
.L01DC1928_2C7128:
/* 015C28 01DC1928 0898828F */  lw          $2, -0x67F8($28)
/* 015C2C 01DC192C 09004014 */  bnez        $2, .L01DC1954_2C7154
/* 015C30 01DC1930 00000000 */   nop
/* 015C34 01DC1934 C0101100 */  sll         $2, $17, 3
/* 015C38 01DC1938 21105100 */  addu        $2, $2, $17
/* 015C3C 01DC193C 40190200 */  sll         $3, $2, 5
/* 015C40 01DC1940 E301023C */  lui         $2, %hi(CBomb)
/* 015C44 01DC1944 90BA4224 */  addiu       $2, $2, %lo(CBomb)
/* 015C48 01DC1948 21204300 */  addu        $4, $2, $3
/* 015C4C 01DC194C 70B6760C */  jal         Step__11CBombEffectFv
/* 015C50 01DC1950 00000000 */   nop
.L01DC1954_2C7154:
/* 015C54 01DC1954 C0101100 */  sll         $2, $17, 3
/* 015C58 01DC1958 21105100 */  addu        $2, $2, $17
/* 015C5C 01DC195C 40190200 */  sll         $3, $2, 5
/* 015C60 01DC1960 E301023C */  lui         $2, %hi(CBomb)
/* 015C64 01DC1964 90BA4224 */  addiu       $2, $2, %lo(CBomb)
/* 015C68 01DC1968 21204300 */  addu        $4, $2, $3
/* 015C6C 01DC196C E101023C */  lui         $2, %hi(OP_MainCamera)
/* 015C70 01DC1970 E0954524 */  addiu       $5, $2, %lo(OP_MainCamera)
/* 015C74 01DC1974 28360072 */  paddub      $6, $16, $0
/* 015C78 01DC1978 84B5760C */  jal         Draw__11CBombEffectFP7CCamerai
/* 015C7C 01DC197C 00000000 */   nop
/* 015C80 01DC1980 01003126 */  addiu       $17, $17, 0x1
.L01DC1984_2C7184:
/* 015C84 01DC1984 0300222A */  slti        $2, $17, 0x3
/* 015C88 01DC1988 E7FF4014 */  bnez        $2, .L01DC1928_2C7128
/* 015C8C 01DC198C 00000000 */   nop
.L01DC1990_2C7190:
/* 015C90 01DC1990 2500023C */  lui         $2, %hi(light)
/* 015C94 01DC1994 801B4424 */  addiu       $4, $2, %lo(light)
/* 015C98 01DC1998 6000A527 */  addiu       $5, $29, 0x60
/* 015C9C 01DC199C 1086040C */  jal         sceVu0CopyMatrix
/* 015CA0 01DC19A0 00000000 */   nop
/* 015CA4 01DC19A4 2500023C */  lui         $2, %hi(ambientlight)
/* 015CA8 01DC19A8 001C4424 */  addiu       $4, $2, %lo(ambientlight)
/* 015CAC 01DC19AC A000A527 */  addiu       $5, $29, 0xA0
/* 015CB0 01DC19B0 0C86040C */  jal         sceVu0CopyVector
/* 015CB4 01DC19B4 00000000 */   nop
/* 015CB8 01DC19B8 2500023C */  lui         $2, %hi(light)
/* 015CBC 01DC19BC 801B4424 */  addiu       $4, $2, %lo(light)
/* 015CC0 01DC19C0 2500023C */  lui         $2, %hi(lightcolor)
/* 015CC4 01DC19C4 C01B4524 */  addiu       $5, $2, %lo(lightcolor)
/* 015CC8 01DC19C8 08B7040C */  jal         MGSetPLight__FPA4_fPA4_f
/* 015CCC 01DC19CC 00000000 */   nop
/* 015CD0 01DC19D0 2500023C */  lui         $2, %hi(ambientlight)
/* 015CD4 01DC19D4 001C4424 */  addiu       $4, $2, %lo(ambientlight)
/* 015CD8 01DC19D8 40B7040C */  jal         MGSetAmbient__FPf
/* 015CDC 01DC19DC 00000000 */   nop
/* 015CE0 01DC19E0 5000BF7B */  lq          $31, 0x50($29)
/* 015CE4 01DC19E4 4000B27B */  lq          $18, 0x40($29)
/* 015CE8 01DC19E8 3000B17B */  lq          $17, 0x30($29)
/* 015CEC 01DC19EC 2000B07B */  lq          $16, 0x20($29)
/* 015CF0 01DC19F0 1000B4C7 */  lwc1        $f20, 0x10($29)
/* 015CF4 01DC19F4 5002BD27 */  addiu       $29, $29, 0x250
/* 015CF8 01DC19F8 0800E003 */  jr          $31
/* 015CFC 01DC19FC 00000000 */   nop
