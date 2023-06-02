.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BattleMenuOptionKey__Fv
/* 10AF60 0020AE60 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 10AF64 0020AE64 2000BF7F */  sq         $31, 0x20($sp)
/* 10AF68 0020AE68 1000B17F */  sq         $17, 0x10($sp)
/* 10AF6C 0020AE6C 0000B07F */  sq         $16, 0x0($sp)
/* 10AF70 0020AE70 28860070 */  paddub     $16, $0, $0
/* 10AF74 0020AE74 3088838F */  lw         $3, -0x77D0($gp)
/* 10AF78 0020AE78 11006010 */  beqz       $3, .L0020AEC0
/* 10AF7C 0020AE7C 00000000 */   nop
/* 10AF80 0020AE80 01000224 */  addiu      $2, $0, 0x1
/* 10AF84 0020AE84 03006210 */  beq        $3, $2, .L0020AE94
/* 10AF88 0020AE88 00000000 */   nop
/* 10AF8C 0020AE8C 10000010 */  b          .L0020AED0
/* 10AF90 0020AE90 00000000 */   nop
.L0020AE94:
/* 10AF94 0020AE94 28260070 */  paddub     $4, $0, $0
/* 10AF98 0020AE98 D8DB070C */  jal        ToFromSelect__Fi
/* 10AF9C 0020AE9C 00000000 */   nop
/* 10AFA0 0020AEA0 28864070 */  paddub     $16, $2, $0
/* 10AFA4 0020AEA4 0A000012 */  beqz       $16, .L0020AED0
/* 10AFA8 0020AEA8 00000000 */   nop
/* 10AFAC 0020AEAC FFFF0224 */  addiu      $2, $0, -0x1
/* 10AFB0 0020AEB0 308882AF */  sw         $2, -0x77D0($gp)
/* 10AFB4 0020AEB4 849580AF */  sw         $0, -0x6A7C($gp)
/* 10AFB8 0020AEB8 05000010 */  b          .L0020AED0
/* 10AFBC 0020AEBC 00000000 */   nop
.L0020AEC0:
/* 10AFC0 0020AEC0 01000424 */  addiu      $4, $0, 0x1
/* 10AFC4 0020AEC4 D8DB070C */  jal        ToFromSelect__Fi
/* 10AFC8 0020AEC8 00000000 */   nop
/* 10AFCC 0020AECC 28864070 */  paddub     $16, $2, $0
.L0020AED0:
/* 10AFD0 0020AED0 3088838F */  lw         $3, -0x77D0($gp)
/* 10AFD4 0020AED4 FFFF0224 */  addiu      $2, $0, -0x1
/* 10AFD8 0020AED8 09006210 */  beq        $3, $2, .L0020AF00
/* 10AFDC 0020AEDC 00000000 */   nop
/* 10AFE0 0020AEE0 849581C7 */  lwc1       $f1, -0x6A7C($gp)
/* 10AFE4 0020AEE4 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 10AFE8 0020AEE8 00008244 */  mtc1       $2, $f0
/* 10AFEC 0020AEEC 00000000 */  nop
/* 10AFF0 0020AEF0 00080046 */  add.s      $f0, $f1, $f0
/* 10AFF4 0020AEF4 849580E7 */  swc1       $f0, -0x6A7C($gp)
/* 10AFF8 0020AEF8 02000010 */  b          .L0020AF04
/* 10AFFC 0020AEFC 00000000 */   nop
.L0020AF00:
/* 10B000 0020AF00 849580AF */  sw         $0, -0x6A7C($gp)
.L0020AF04:
/* 10B004 0020AF04 6C7A080C */  jal        MenuOptionKey__Fv
/* 10B008 0020AF08 00000000 */   nop
/* 10B00C 0020AF0C 288E4070 */  paddub     $17, $2, $0
/* 10B010 0020AF10 B87E080C */  jal        OptionMenuFadeOutStart__Fv
/* 10B014 0020AF14 00000000 */   nop
/* 10B018 0020AF18 0D004010 */  beqz       $2, .L0020AF50
/* 10B01C 0020AF1C 00000000 */   nop
/* 10B020 0020AF20 308880AF */  sw         $0, -0x77D0($gp)
/* 10B024 0020AF24 0A000012 */  beqz       $16, .L0020AF50
/* 10B028 0020AF28 00000000 */   nop
/* 10B02C 0020AF2C 08002012 */  beqz       $17, .L0020AF50
/* 10B030 0020AF30 00000000 */   nop
/* 10B034 0020AF34 06000324 */  addiu      $3, $0, 0x6
/* 10B038 0020AF38 589583AF */  sw         $3, -0x6AA8($gp)
/* 10B03C 0020AF3C 16000324 */  addiu      $3, $0, 0x16
/* 10B040 0020AF40 208883AF */  sw         $3, -0x77E0($gp)
/* 10B044 0020AF44 80DC070C */  jal        ForBackMenu__Fv
/* 10B048 0020AF48 00000000 */   nop
/* 10B04C 0020AF4C 208880AF */  sw         $0, -0x77E0($gp)
.L0020AF50:
/* 10B050 0020AF50 2000BF7B */  lq         $31, 0x20($sp)
/* 10B054 0020AF54 1000B17B */  lq         $17, 0x10($sp)
/* 10B058 0020AF58 0000B07B */  lq         $16, 0x0($sp)
/* 10B05C 0020AF5C 3000BD27 */  addiu      $sp, $sp, 0x30
/* 10B060 0020AF60 0800E003 */  jr         $31
/* 10B064 0020AF64 00000000 */   nop
/* 10B068 0020AF68 00000000 */  nop
/* 10B06C 0020AF6C 00000000 */  nop
