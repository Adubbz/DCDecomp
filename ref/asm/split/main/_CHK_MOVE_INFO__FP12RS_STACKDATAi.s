.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _CHK_MOVE_INFO__FP12RS_STACKDATAi
/* 0E2A20 001E2920 90FFBD27 */  addiu       $29, $29, -0x70
/* 0E2A24 001E2924 3000BF7F */  sq          $31, 0x30($29)
/* 0E2A28 001E2928 2000B27F */  sq          $18, 0x20($29)
/* 0E2A2C 001E292C 1000B17F */  sq          $17, 0x10($29)
/* 0E2A30 001E2930 0000B07F */  sq          $16, 0x0($29)
/* 0E2A34 001E2934 28968070 */  paddub      $18, $4, $0
/* 0E2A38 001E2938 E09C838F */  lw          $3, -0x6320($28)
/* 0E2A3C 001E293C 9000718C */  lw          $17, 0x90($3)
/* 0E2A40 001E2940 01001024 */  addiu       $16, $0, 0x1
/* 0E2A44 001E2944 10350224 */  addiu       $2, $0, 0x3510
/* 0E2A48 001E2948 18102202 */  mult        $2, $17, $2
/* 0E2A4C 001E294C 21106200 */  addu        $2, $3, $2
/* 0E2A50 001E2950 0100013C */  lui         $1, (0x1FCD0 >> 16)
/* 0E2A54 001E2954 D0FC2134 */  ori         $1, $1, (0x1FCD0 & 0xFFFF)
/* 0E2A58 001E2958 21204100 */  addu        $4, $2, $1
/* 0E2A5C 001E295C 4000A527 */  addiu       $5, $29, 0x40
/* 0E2A60 001E2960 A000998C */  lw          $25, 0xA0($4)
/* 0E2A64 001E2964 A000398F */  lw          $25, 0xA0($25)
/* 0E2A68 001E2968 09F82003 */  jalr        $25
/* 0E2A6C 001E296C 00000000 */   nop
/* 0E2A70 001E2970 28264072 */  paddub      $4, $18, $0
/* 0E2A74 001E2974 08009224 */  addiu       $18, $4, 0x8
/* 0E2A78 001E2978 A485070C */  jal         GetStackFloat__FP12RS_STACKDATA__3
/* 0E2A7C 001E297C 00000000 */   nop
/* 0E2A80 001E2980 5000A0E7 */  swc1        $f0, 0x50($29)
/* 0E2A84 001E2984 28264072 */  paddub      $4, $18, $0
/* 0E2A88 001E2988 08009224 */  addiu       $18, $4, 0x8
/* 0E2A8C 001E298C A485070C */  jal         GetStackFloat__FP12RS_STACKDATA__3
/* 0E2A90 001E2990 00000000 */   nop
/* 0E2A94 001E2994 5400A327 */  addiu       $3, $29, 0x54
/* 0E2A98 001E2998 000060E4 */  swc1        $f0, 0x0($3)
/* 0E2A9C 001E299C 28264072 */  paddub      $4, $18, $0
/* 0E2AA0 001E29A0 08009224 */  addiu       $18, $4, 0x8
/* 0E2AA4 001E29A4 A485070C */  jal         GetStackFloat__FP12RS_STACKDATA__3
/* 0E2AA8 001E29A8 00000000 */   nop
/* 0E2AAC 001E29AC 5800A0E7 */  swc1        $f0, 0x58($29)
/* 0E2AB0 001E29B0 4400A0C7 */  lwc1        $f0, 0x44($29)
/* 0E2AB4 001E29B4 A040023C */  lui         $2, (0x40A00000 >> 16)
/* 0E2AB8 001E29B8 00088244 */  mtc1        $2, $f1
/* 0E2ABC 001E29BC 00000000 */  nop
/* 0E2AC0 001E29C0 00000146 */  add.s       $f0, $f0, $f1
/* 0E2AC4 001E29C4 4400A0E7 */  swc1        $f0, 0x44($29)
/* 0E2AC8 001E29C8 000060C4 */  lwc1        $f0, 0x0($3)
/* 0E2ACC 001E29CC 00000146 */  add.s       $f0, $f0, $f1
/* 0E2AD0 001E29D0 000060E4 */  swc1        $f0, 0x0($3)
/* 0E2AD4 001E29D4 80101100 */  sll         $2, $17, 2
/* 0E2AD8 001E29D8 21185100 */  addu        $3, $2, $17
/* 0E2ADC 001E29DC 80100300 */  sll         $2, $3, 2
/* 0E2AE0 001E29E0 21106200 */  addu        $2, $3, $2
/* 0E2AE4 001E29E4 00110200 */  sll         $2, $2, 4
/* 0E2AE8 001E29E8 E09C838F */  lw          $3, -0x6320($28)
/* 0E2AEC 001E29EC 21104300 */  addu        $2, $2, $3
/* 0E2AF0 001E29F0 0200013C */  lui         $1, (0x20000 >> 16)
/* 0E2AF4 001E29F4 21084100 */  addu        $1, $2, $1
/* 0E2AF8 001E29F8 1CE4248C */  lw          $4, -0x1BE4($1)
/* 0E2AFC 001E29FC 0200013C */  lui         $1, (0x20000 >> 16)
/* 0E2B00 001E2A00 21084100 */  addu        $1, $2, $1
/* 0E2B04 001E2A04 20E4258C */  lw          $5, -0x1BE0($1)
/* 0E2B08 001E2A08 4000A627 */  addiu       $6, $29, 0x40
/* 0E2B0C 001E2A0C 5000A727 */  addiu       $7, $29, 0x50
/* 0E2B10 001E2A10 6000A827 */  addiu       $8, $29, 0x60
/* 0E2B14 001E2A14 284E0070 */  paddub      $9, $0, $0
/* 0E2B18 001E2A18 28560070 */  paddub      $10, $0, $0
/* 0E2B1C 001E2A1C 5427050C */  jal         CheckHit__FP6CCPolyiPfPfPfii
/* 0E2B20 001E2A20 00000000 */   nop
/* 0E2B24 001E2A24 02004004 */  bltz        $2, .L001E2A30
/* 0E2B28 001E2A28 00000000 */   nop
/* 0E2B2C 001E2A2C 28860070 */  paddub      $16, $0, $0
.L001E2A30:
/* 0E2B30 001E2A30 28264072 */  paddub      $4, $18, $0
/* 0E2B34 001E2A34 282E0072 */  paddub      $5, $16, $0
/* 0E2B38 001E2A38 B485070C */  jal         SetStack__FP12RS_STACKDATAi__3
/* 0E2B3C 001E2A3C 00000000 */   nop
/* 0E2B40 001E2A40 01000224 */  addiu       $2, $0, 0x1
/* 0E2B44 001E2A44 3000BF7B */  lq          $31, 0x30($29)
/* 0E2B48 001E2A48 2000B27B */  lq          $18, 0x20($29)
/* 0E2B4C 001E2A4C 1000B17B */  lq          $17, 0x10($29)
/* 0E2B50 001E2A50 0000B07B */  lq          $16, 0x0($29)
/* 0E2B54 001E2A54 7000BD27 */  addiu       $29, $29, 0x70
/* 0E2B58 001E2A58 0800E003 */  jr          $31
/* 0E2B5C 001E2A5C 00000000 */   nop
