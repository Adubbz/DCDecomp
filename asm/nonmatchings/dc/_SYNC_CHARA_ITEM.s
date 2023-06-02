.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SYNC_CHARA_ITEM__FP12RS_STACKDATAi
/* 8DD80 0018DC80 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 8DD84 0018DC84 3000BF7F */  sq         $31, 0x30($sp)
/* 8DD88 0018DC88 2000B27F */  sq         $18, 0x20($sp)
/* 8DD8C 0018DC8C 1000B17F */  sq         $17, 0x10($sp)
/* 8DD90 0018DC90 0000B07F */  sq         $16, 0x0($sp)
/* 8DD94 0018DC94 08009224 */  addiu      $18, $4, 0x8
/* 8DD98 0018DC98 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8DD9C 0018DC9C 00000000 */   nop
/* 8DDA0 0018DCA0 28264070 */  paddub     $4, $2, $0
/* 8DDA4 0018DCA4 842C060C */  jal        GetChara__Fi
/* 8DDA8 0018DCA8 00000000 */   nop
/* 8DDAC 0018DCAC 28864070 */  paddub     $16, $2, $0
/* 8DDB0 0018DCB0 28264072 */  paddub     $4, $18, $0
/* 8DDB4 0018DCB4 08009224 */  addiu      $18, $4, 0x8
/* 8DDB8 0018DCB8 F428060C */  jal        GetStackString__FP12RS_STACKDATA
/* 8DDBC 0018DCBC 00000000 */   nop
/* 8DDC0 0018DCC0 288E0070 */  paddub     $17, $0, $0
/* 8DDC4 0018DCC4 09004010 */  beqz       $2, .L0018DCEC
/* 8DDC8 0018DCC8 00000000 */   nop
/* 8DDCC 0018DCCC 00004380 */  lb         $3, 0x0($2)
/* 8DDD0 0018DCD0 06006010 */  beqz       $3, .L0018DCEC
/* 8DDD4 0018DCD4 00000000 */   nop
/* 8DDD8 0018DCD8 BC00048E */  lw         $4, 0xBC($16)
/* 8DDDC 0018DCDC 282E4070 */  paddub     $5, $2, $0
/* 8DDE0 0018DCE0 C0A1040C */  jal        SearchFrame__6CFrameFPc
/* 8DDE4 0018DCE4 00000000 */   nop
/* 8DDE8 0018DCE8 288E4070 */  paddub     $17, $2, $0
.L0018DCEC:
/* 8DDEC 0018DCEC 03002016 */  bnez       $17, .L0018DCFC
/* 8DDF0 0018DCF0 00000000 */   nop
/* 8DDF4 0018DCF4 BC00118E */  lw         $17, 0xBC($16)
/* 8DDF8 0018DCF8 00000000 */  nop
.L0018DCFC:
/* 8DDFC 0018DCFC 28264072 */  paddub     $4, $18, $0
/* 8DE00 0018DD00 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8DE04 0018DD04 00000000 */   nop
/* 8DE08 0018DD08 28264070 */  paddub     $4, $2, $0
/* 8DE0C 0018DD0C A02C060C */  jal        GetItemFrame__Fi
/* 8DE10 0018DD10 00000000 */   nop
/* 8DE14 0018DD14 04004014 */  bnez       $2, .L0018DD28
/* 8DE18 0018DD18 00000000 */   nop
/* 8DE1C 0018DD1C 28160070 */  paddub     $2, $0, $0
/* 8DE20 0018DD20 06000010 */  b          .L0018DD3C
/* 8DE24 0018DD24 00000000 */   nop
.L0018DD28:
/* 8DE28 0018DD28 28264070 */  paddub     $4, $2, $0
/* 8DE2C 0018DD2C 282E2072 */  paddub     $5, $17, $0
/* 8DE30 0018DD30 60A0040C */  jal        SetReference__6CFrameFP6CFrame
/* 8DE34 0018DD34 00000000 */   nop
/* 8DE38 0018DD38 01000224 */  addiu      $2, $0, 0x1
.L0018DD3C:
/* 8DE3C 0018DD3C 3000BF7B */  lq         $31, 0x30($sp)
/* 8DE40 0018DD40 2000B27B */  lq         $18, 0x20($sp)
/* 8DE44 0018DD44 1000B17B */  lq         $17, 0x10($sp)
/* 8DE48 0018DD48 0000B07B */  lq         $16, 0x0($sp)
/* 8DE4C 0018DD4C 4000BD27 */  addiu      $sp, $sp, 0x40
/* 8DE50 0018DD50 0800E003 */  jr         $31
/* 8DE54 0018DD54 00000000 */   nop
/* 8DE58 0018DD58 00000000 */  nop
/* 8DE5C 0018DD5C 00000000 */  nop
