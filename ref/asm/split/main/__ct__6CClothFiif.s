.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __ct__6CClothFiif
/* 03CC70 0013CB70 B0FFBD27 */  addiu       $29, $29, -0x50
/* 03CC74 0013CB74 4000BF7F */  sq          $31, 0x40($29)
/* 03CC78 0013CB78 3000B27F */  sq          $18, 0x30($29)
/* 03CC7C 0013CB7C 2000B17F */  sq          $17, 0x20($29)
/* 03CC80 0013CB80 1000B07F */  sq          $16, 0x10($29)
/* 03CC84 0013CB84 0000B4E7 */  swc1        $f20, 0x0($29)
/* 03CC88 0013CB88 28968070 */  paddub      $18, $4, $0
/* 03CC8C 0013CB8C 288EA070 */  paddub      $17, $5, $0
/* 03CC90 0013CB90 2886C070 */  paddub      $16, $6, $0
/* 03CC94 0013CB94 06650046 */  mov.s       $f20, $f12
/* 03CC98 0013CB98 C0D3040C */  jal         __ct__10CVisualVu1Fv
/* 03CC9C 0013CB9C 00000000 */   nop
/* 03CCA0 0013CBA0 2A00023C */  lui         $2, %hi(__vt__6CCloth)
/* 03CCA4 0013CBA4 90134224 */  addiu       $2, $2, %lo(__vt__6CCloth)
/* 03CCA8 0013CBA8 080042AE */  sw          $2, 0x8($18)
/* 03CCAC 0013CBAC 28264072 */  paddub      $4, $18, $0
/* 03CCB0 0013CBB0 6CF2040C */  jal         InitParam__6CClothFv
/* 03CCB4 0013CBB4 00000000 */   nop
/* 03CCB8 0013CBB8 2C0051AE */  sw          $17, 0x2C($18)
/* 03CCBC 0013CBBC 300050AE */  sw          $16, 0x30($18)
/* 03CCC0 0013CBC0 340054E6 */  swc1        $f20, 0x34($18)
/* 03CCC4 0013CBC4 28164072 */  paddub      $2, $18, $0
/* 03CCC8 0013CBC8 4000BF7B */  lq          $31, 0x40($29)
/* 03CCCC 0013CBCC 3000B27B */  lq          $18, 0x30($29)
/* 03CCD0 0013CBD0 2000B17B */  lq          $17, 0x20($29)
/* 03CCD4 0013CBD4 1000B07B */  lq          $16, 0x10($29)
/* 03CCD8 0013CBD8 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 03CCDC 0013CBDC 5000BD27 */  addiu       $29, $29, 0x50
/* 03CCE0 0013CBE0 0800E003 */  jr          $31
/* 03CCE4 0013CBE4 00000000 */   nop
/* 03CCE8 0013CBE8 00000000 */  nop
/* 03CCEC 0013CBEC 00000000 */  nop
