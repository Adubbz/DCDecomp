.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BattleMenuSaveKey__Fv
/* 10B070 0020AF70 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 10B074 0020AF74 1000BF7F */  sq         $31, 0x10($sp)
/* 10B078 0020AF78 0000B07F */  sq         $16, 0x0($sp)
/* 10B07C 0020AF7C 28860070 */  paddub     $16, $0, $0
/* 10B080 0020AF80 3088838F */  lw         $3, -0x77D0($gp)
/* 10B084 0020AF84 11006010 */  beqz       $3, .L0020AFCC
/* 10B088 0020AF88 00000000 */   nop
/* 10B08C 0020AF8C 01000224 */  addiu      $2, $0, 0x1
/* 10B090 0020AF90 03006210 */  beq        $3, $2, .L0020AFA0
/* 10B094 0020AF94 00000000 */   nop
/* 10B098 0020AF98 10000010 */  b          .L0020AFDC
/* 10B09C 0020AF9C 00000000 */   nop
.L0020AFA0:
/* 10B0A0 0020AFA0 28260070 */  paddub     $4, $0, $0
/* 10B0A4 0020AFA4 D8DB070C */  jal        ToFromSelect__Fi
/* 10B0A8 0020AFA8 00000000 */   nop
/* 10B0AC 0020AFAC 28864070 */  paddub     $16, $2, $0
/* 10B0B0 0020AFB0 0A000012 */  beqz       $16, .L0020AFDC
/* 10B0B4 0020AFB4 00000000 */   nop
/* 10B0B8 0020AFB8 FFFF0224 */  addiu      $2, $0, -0x1
/* 10B0BC 0020AFBC 308882AF */  sw         $2, -0x77D0($gp)
/* 10B0C0 0020AFC0 849580AF */  sw         $0, -0x6A7C($gp)
/* 10B0C4 0020AFC4 05000010 */  b          .L0020AFDC
/* 10B0C8 0020AFC8 00000000 */   nop
.L0020AFCC:
/* 10B0CC 0020AFCC 01000424 */  addiu      $4, $0, 0x1
/* 10B0D0 0020AFD0 D8DB070C */  jal        ToFromSelect__Fi
/* 10B0D4 0020AFD4 00000000 */   nop
/* 10B0D8 0020AFD8 28864070 */  paddub     $16, $2, $0
.L0020AFDC:
/* 10B0DC 0020AFDC 3088838F */  lw         $3, -0x77D0($gp)
/* 10B0E0 0020AFE0 FFFF0224 */  addiu      $2, $0, -0x1
/* 10B0E4 0020AFE4 09006210 */  beq        $3, $2, .L0020B00C
/* 10B0E8 0020AFE8 00000000 */   nop
/* 10B0EC 0020AFEC 849581C7 */  lwc1       $f1, -0x6A7C($gp)
/* 10B0F0 0020AFF0 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 10B0F4 0020AFF4 00008244 */  mtc1       $2, $f0
/* 10B0F8 0020AFF8 00000000 */  nop
/* 10B0FC 0020AFFC 00080046 */  add.s      $f0, $f1, $f0
/* 10B100 0020B000 849580E7 */  swc1       $f0, -0x6A7C($gp)
/* 10B104 0020B004 02000010 */  b          .L0020B010
/* 10B108 0020B008 00000000 */   nop
.L0020B00C:
/* 10B10C 0020B00C 849580AF */  sw         $0, -0x6A7C($gp)
.L0020B010:
/* 10B110 0020B010 B47F080C */  jal        MenuSaveKey__Fv
/* 10B114 0020B014 00000000 */   nop
/* 10B118 0020B018 448A080C */  jal        SaveMenuEffectFadeOut__Fv
/* 10B11C 0020B01C 00000000 */   nop
/* 10B120 0020B020 0B004010 */  beqz       $2, .L0020B050
/* 10B124 0020B024 00000000 */   nop
/* 10B128 0020B028 308880AF */  sw         $0, -0x77D0($gp)
/* 10B12C 0020B02C 08000012 */  beqz       $16, .L0020B050
/* 10B130 0020B030 00000000 */   nop
/* 10B134 0020B034 07000324 */  addiu      $3, $0, 0x7
/* 10B138 0020B038 589583AF */  sw         $3, -0x6AA8($gp)
/* 10B13C 0020B03C 16000324 */  addiu      $3, $0, 0x16
/* 10B140 0020B040 208883AF */  sw         $3, -0x77E0($gp)
/* 10B144 0020B044 80DC070C */  jal        ForBackMenu__Fv
/* 10B148 0020B048 00000000 */   nop
/* 10B14C 0020B04C 208880AF */  sw         $0, -0x77E0($gp)
.L0020B050:
/* 10B150 0020B050 1000BF7B */  lq         $31, 0x10($sp)
/* 10B154 0020B054 0000B07B */  lq         $16, 0x0($sp)
/* 10B158 0020B058 2000BD27 */  addiu      $sp, $sp, 0x20
/* 10B15C 0020B05C 0800E003 */  jr         $31
/* 10B160 0020B060 00000000 */   nop
/* 10B164 0020B064 00000000 */  nop
/* 10B168 0020B068 00000000 */  nop
/* 10B16C 0020B06C 00000000 */  nop
