.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SYNC_CHARA_ITEM__FP12RS_STACKDATAi
/* 08DD80 0018DC80 C0FFBD27 */  addiu       $29, $29, -0x40
/* 08DD84 0018DC84 3000BF7F */  sq          $31, 0x30($29)
/* 08DD88 0018DC88 2000B27F */  sq          $18, 0x20($29)
/* 08DD8C 0018DC8C 1000B17F */  sq          $17, 0x10($29)
/* 08DD90 0018DC90 0000B07F */  sq          $16, 0x0($29)
/* 08DD94 0018DC94 08009224 */  addiu       $18, $4, 0x8
/* 08DD98 0018DC98 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08DD9C 0018DC9C 00000000 */   nop
/* 08DDA0 0018DCA0 28264070 */  paddub      $4, $2, $0
/* 08DDA4 0018DCA4 842C060C */  jal         GetChara__Fi
/* 08DDA8 0018DCA8 00000000 */   nop
/* 08DDAC 0018DCAC 28864070 */  paddub      $16, $2, $0
/* 08DDB0 0018DCB0 28264072 */  paddub      $4, $18, $0
/* 08DDB4 0018DCB4 08009224 */  addiu       $18, $4, 0x8
/* 08DDB8 0018DCB8 F428060C */  jal         GetStackString__FP12RS_STACKDATA
/* 08DDBC 0018DCBC 00000000 */   nop
/* 08DDC0 0018DCC0 288E0070 */  paddub      $17, $0, $0
/* 08DDC4 0018DCC4 09004010 */  beqz        $2, .L0018DCEC
/* 08DDC8 0018DCC8 00000000 */   nop
/* 08DDCC 0018DCCC 00004380 */  lb          $3, 0x0($2)
/* 08DDD0 0018DCD0 06006010 */  beqz        $3, .L0018DCEC
/* 08DDD4 0018DCD4 00000000 */   nop
/* 08DDD8 0018DCD8 BC00048E */  lw          $4, 0xBC($16)
/* 08DDDC 0018DCDC 282E4070 */  paddub      $5, $2, $0
/* 08DDE0 0018DCE0 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 08DDE4 0018DCE4 00000000 */   nop
/* 08DDE8 0018DCE8 288E4070 */  paddub      $17, $2, $0
.L0018DCEC:
/* 08DDEC 0018DCEC 03002016 */  bnez        $17, .L0018DCFC
/* 08DDF0 0018DCF0 00000000 */   nop
/* 08DDF4 0018DCF4 BC00118E */  lw          $17, 0xBC($16)
/* 08DDF8 0018DCF8 00000000 */  nop
.L0018DCFC:
/* 08DDFC 0018DCFC 28264072 */  paddub      $4, $18, $0
/* 08DE00 0018DD00 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08DE04 0018DD04 00000000 */   nop
/* 08DE08 0018DD08 28264070 */  paddub      $4, $2, $0
/* 08DE0C 0018DD0C A02C060C */  jal         GetItemFrame__Fi
/* 08DE10 0018DD10 00000000 */   nop
/* 08DE14 0018DD14 04004014 */  bnez        $2, .L0018DD28
/* 08DE18 0018DD18 00000000 */   nop
/* 08DE1C 0018DD1C 28160070 */  paddub      $2, $0, $0
/* 08DE20 0018DD20 06000010 */  b           .L0018DD3C
/* 08DE24 0018DD24 00000000 */   nop
.L0018DD28:
/* 08DE28 0018DD28 28264070 */  paddub      $4, $2, $0
/* 08DE2C 0018DD2C 282E2072 */  paddub      $5, $17, $0
/* 08DE30 0018DD30 60A0040C */  jal         SetReference__6CFrameFP6CFrame
/* 08DE34 0018DD34 00000000 */   nop
/* 08DE38 0018DD38 01000224 */  addiu       $2, $0, 0x1
.L0018DD3C:
/* 08DE3C 0018DD3C 3000BF7B */  lq          $31, 0x30($29)
/* 08DE40 0018DD40 2000B27B */  lq          $18, 0x20($29)
/* 08DE44 0018DD44 1000B17B */  lq          $17, 0x10($29)
/* 08DE48 0018DD48 0000B07B */  lq          $16, 0x0($29)
/* 08DE4C 0018DD4C 4000BD27 */  addiu       $29, $29, 0x40
/* 08DE50 0018DD50 0800E003 */  jr          $31
/* 08DE54 0018DD54 00000000 */   nop
/* 08DE58 0018DD58 00000000 */  nop
/* 08DE5C 0018DD5C 00000000 */  nop
