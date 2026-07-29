.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sync_obj_obj__FP10OBJ_HANDLEP10OBJ_HANDLE
/* 08AFA0 0018AEA0 C0FFBD27 */  addiu       $29, $29, -0x40
/* 08AFA4 0018AEA4 3000BF7F */  sq          $31, 0x30($29)
/* 08AFA8 0018AEA8 2000B27F */  sq          $18, 0x20($29)
/* 08AFAC 0018AEAC 1000B17F */  sq          $17, 0x10($29)
/* 08AFB0 0018AEB0 0000B07F */  sq          $16, 0x0($29)
/* 08AFB4 0018AEB4 2896A070 */  paddub      $18, $5, $0
/* 08AFB8 0018AEB8 28860070 */  paddub      $16, $0, $0
/* 08AFBC 0018AEBC 288E0070 */  paddub      $17, $0, $0
/* 08AFC0 0018AEC0 0A000010 */  b           .L0018AEEC
/* 08AFC4 0018AEC4 00000000 */   nop
.L0018AEC8:
/* 08AFC8 0018AEC8 80181100 */  sll         $3, $17, 2
/* 08AFCC 0018AECC 21186400 */  addu        $3, $3, $4
/* 08AFD0 0018AED0 0800638C */  lw          $3, 0x8($3)
/* 08AFD4 0018AED4 04006010 */  beqz        $3, .L0018AEE8
/* 08AFD8 0018AED8 00000000 */   nop
/* 08AFDC 0018AEDC 28866070 */  paddub      $16, $3, $0
/* 08AFE0 0018AEE0 05000010 */  b           .L0018AEF8
/* 08AFE4 0018AEE4 00000000 */   nop
.L0018AEE8:
/* 08AFE8 0018AEE8 01003126 */  addiu       $17, $17, 0x1
.L0018AEEC:
/* 08AFEC 0018AEEC 0C00232A */  slti        $3, $17, 0xC
/* 08AFF0 0018AEF0 F5FF6014 */  bnez        $3, .L0018AEC8
/* 08AFF4 0018AEF4 00000000 */   nop
.L0018AEF8:
/* 08AFF8 0018AEF8 10000012 */  beqz        $16, .L0018AF3C
/* 08AFFC 0018AEFC 00000000 */   nop
/* 08B000 0018AF00 288E0070 */  paddub      $17, $0, $0
/* 08B004 0018AF04 0A000010 */  b           .L0018AF30
/* 08B008 0018AF08 00000000 */   nop
.L0018AF0C:
/* 08B00C 0018AF0C 80181100 */  sll         $3, $17, 2
/* 08B010 0018AF10 21187200 */  addu        $3, $3, $18
/* 08B014 0018AF14 0800648C */  lw          $4, 0x8($3)
/* 08B018 0018AF18 04008010 */  beqz        $4, .L0018AF2C
/* 08B01C 0018AF1C 00000000 */   nop
/* 08B020 0018AF20 282E0072 */  paddub      $5, $16, $0
/* 08B024 0018AF24 60A0040C */  jal         SetReference__6CFrameFP6CFrame
/* 08B028 0018AF28 00000000 */   nop
.L0018AF2C:
/* 08B02C 0018AF2C 01003126 */  addiu       $17, $17, 0x1
.L0018AF30:
/* 08B030 0018AF30 0C00232A */  slti        $3, $17, 0xC
/* 08B034 0018AF34 F5FF6014 */  bnez        $3, .L0018AF0C
/* 08B038 0018AF38 00000000 */   nop
.L0018AF3C:
/* 08B03C 0018AF3C 3000BF7B */  lq          $31, 0x30($29)
/* 08B040 0018AF40 2000B27B */  lq          $18, 0x20($29)
/* 08B044 0018AF44 1000B17B */  lq          $17, 0x10($29)
/* 08B048 0018AF48 0000B07B */  lq          $16, 0x0($29)
/* 08B04C 0018AF4C 4000BD27 */  addiu       $29, $29, 0x40
/* 08B050 0018AF50 0800E003 */  jr          $31
/* 08B054 0018AF54 00000000 */   nop
/* 08B058 0018AF58 00000000 */  nop
/* 08B05C 0018AF5C 00000000 */  nop
