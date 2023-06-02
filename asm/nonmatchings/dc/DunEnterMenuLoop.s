.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DunEnterMenuLoop__Fv
/* 126690 00226590 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 126694 00226594 1000BF7F */  sq         $31, 0x10($sp)
/* 126698 00226598 0000B07F */  sq         $16, 0x0($sp)
/* 12669C 0022659C BE11040C */  jal        rand
/* 1266A0 002265A0 00000000 */   nop
/* 1266A4 002265A4 38FB040C */  jal        ReadBG__Fv
/* 1266A8 002265A8 00000000 */   nop
/* 1266AC 002265AC 8899080C */  jal        DunEnterMenuKey__Fv
/* 1266B0 002265B0 00000000 */   nop
/* 1266B4 002265B4 28864070 */  paddub     $16, $2, $0
/* 1266B8 002265B8 449B080C */  jal        DunEnterDraw__Fv
/* 1266BC 002265BC 00000000 */   nop
/* 1266C0 002265C0 DB01023C */  lui        $2, %hi(ItemVolumeStep)
/* 1266C4 002265C4 10BC4424 */  addiu      $4, $2, %lo(ItemVolumeStep)
/* 1266C8 002265C8 3C000524 */  addiu      $5, $0, 0x3C
/* 1266CC 002265CC B4D5080C */  jal        LoopStep__13CMenuItemStepFi
/* 1266D0 002265D0 00000000 */   nop
/* 1266D4 002265D4 2A080002 */  slt        $at, $16, $0
/* 1266D8 002265D8 0A002014 */  bnez       $at, .L00226604
/* 1266DC 002265DC 00000000 */   nop
/* 1266E0 002265E0 4899080C */  jal        ExitDunEnterMenu__Fv
/* 1266E4 002265E4 00000000 */   nop
/* 1266E8 002265E8 DB01023C */  lui        $2, %hi(ItemVolumeStep)
/* 1266EC 002265EC 10BC4424 */  addiu      $4, $2, %lo(ItemVolumeStep)
/* 1266F0 002265F0 C8D5080C */  jal        CheckItemVolume__13CMenuItemStepFv
/* 1266F4 002265F4 00000000 */   nop
/* 1266F8 002265F8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 1266FC 002265FC 908B3080 */  lb         $16, -0x7470($at)
/* 126700 00226600 00000000 */  nop
.L00226604:
/* 126704 00226604 28160072 */  paddub     $2, $16, $0
/* 126708 00226608 1000BF7B */  lq         $31, 0x10($sp)
/* 12670C 0022660C 0000B07B */  lq         $16, 0x0($sp)
/* 126710 00226610 2000BD27 */  addiu      $sp, $sp, 0x20
/* 126714 00226614 0800E003 */  jr         $31
/* 126718 00226618 00000000 */   nop
/* 12671C 0022661C 00000000 */  nop
