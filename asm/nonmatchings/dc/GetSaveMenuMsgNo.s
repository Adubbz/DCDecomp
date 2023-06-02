.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetSaveMenuMsgNo__Fv
/* 122510 00222410 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 122514 00222414 1000BF7F */  sq         $31, 0x10($sp)
/* 122518 00222418 0000B07F */  sq         $16, 0x0($sp)
/* 12251C 0022241C 28860070 */  paddub     $16, $0, $0
/* 122520 00222420 DB01023C */  lui        $2, %hi(McAccess)
/* 122524 00222424 80824424 */  addiu      $4, $2, %lo(McAccess)
/* 122528 00222428 F84E080C */  jal        GetFuncNo__17CMemoryCardAccessFv
/* 12252C 0022242C 00000000 */   nop
/* 122530 00222430 01000324 */  addiu      $3, $0, 0x1
/* 122534 00222434 1C004310 */  beq        $2, $3, .L002224A8
/* 122538 00222438 00000000 */   nop
/* 12253C 0022243C 03004010 */  beqz       $2, .L0022244C
/* 122540 00222440 00000000 */   nop
/* 122544 00222444 72000010 */  b          .L00222610
/* 122548 00222448 00000000 */   nop
.L0022244C:
/* 12254C 0022244C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 122550 00222450 D48A238C */  lw         $3, -0x752C($at)
/* 122554 00222454 0F000224 */  addiu      $2, $0, 0xF
/* 122558 00222458 12006210 */  beq        $3, $2, .L002224A4
/* 12255C 0022245C 00000000 */   nop
/* 122560 00222460 0D000224 */  addiu      $2, $0, 0xD
/* 122564 00222464 0F006210 */  beq        $3, $2, .L002224A4
/* 122568 00222468 00000000 */   nop
/* 12256C 0022246C 0A000224 */  addiu      $2, $0, 0xA
/* 122570 00222470 0C006210 */  beq        $3, $2, .L002224A4
/* 122574 00222474 00000000 */   nop
/* 122578 00222478 07000224 */  addiu      $2, $0, 0x7
/* 12257C 0022247C 09006210 */  beq        $3, $2, .L002224A4
/* 122580 00222480 00000000 */   nop
/* 122584 00222484 08000224 */  addiu      $2, $0, 0x8
/* 122588 00222488 06006210 */  beq        $3, $2, .L002224A4
/* 12258C 0022248C 00000000 */   nop
/* 122590 00222490 04000224 */  addiu      $2, $0, 0x4
/* 122594 00222494 03006210 */  beq        $3, $2, .L002224A4
/* 122598 00222498 00000000 */   nop
/* 12259C 0022249C 02000010 */  b          .L002224A8
/* 1225A0 002224A0 00000000 */   nop
.L002224A4:
/* 1225A4 002224A4 FF001024 */  addiu      $16, $0, 0xFF
.L002224A8:
/* 1225A8 002224A8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 1225AC 002224AC D48A248C */  lw         $4, -0x752C($at)
/* 1225B0 002224B0 1A00812C */  sltiu      $at, $4, 0x1A
/* 1225B4 002224B4 5C002010 */  beqz       $at, .L00222628
/* 1225B8 002224B8 00000000 */   nop
/* 1225BC 002224BC 2A00023C */  lui        $2, %hi(_3062)
/* 1225C0 002224C0 00EC4324 */  addiu      $3, $2, %lo(_3062)
/* 1225C4 002224C4 80100400 */  sll        $2, $4, 2
/* 1225C8 002224C8 21104300 */  addu       $2, $2, $3
/* 1225CC 002224CC 0000428C */  lw         $2, 0x0($2)
/* 1225D0 002224D0 08004000 */  jr         $2
/* 1225D4 002224D4 00000000 */   nop
/* 1225D8 002224D8 FF001024 */  addiu      $16, $0, 0xFF
/* 1225DC 002224DC 52000010 */  b          .L00222628
/* 1225E0 002224E0 00000000 */   nop
/* 1225E4 002224E4 FA001024 */  addiu      $16, $0, 0xFA
/* 1225E8 002224E8 4F000010 */  b          .L00222628
/* 1225EC 002224EC 00000000 */   nop
/* 1225F0 002224F0 FB001024 */  addiu      $16, $0, 0xFB
/* 1225F4 002224F4 4C000010 */  b          .L00222628
/* 1225F8 002224F8 00000000 */   nop
/* 1225FC 002224FC 08011024 */  addiu      $16, $0, 0x108
/* 122600 00222500 49000010 */  b          .L00222628
/* 122604 00222504 00000000 */   nop
/* 122608 00222508 0E011024 */  addiu      $16, $0, 0x10E
/* 12260C 0022250C 46000010 */  b          .L00222628
/* 122610 00222510 00000000 */   nop
/* 122614 00222514 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 122618 00222518 F08A248C */  lw         $4, -0x7510($at)
/* 12261C 0022251C 0D00812C */  sltiu      $at, $4, 0xD
/* 122620 00222520 41002010 */  beqz       $at, .L00222628
/* 122624 00222524 00000000 */   nop
/* 122628 00222528 2A00023C */  lui        $2, %hi(_3063)
/* 12262C 0022252C C0EB4324 */  addiu      $3, $2, %lo(_3063)
/* 122630 00222530 80100400 */  sll        $2, $4, 2
/* 122634 00222534 21104300 */  addu       $2, $2, $3
/* 122638 00222538 0000428C */  lw         $2, 0x0($2)
/* 12263C 0022253C 08004000 */  jr         $2
/* 122640 00222540 00000000 */   nop
/* 122644 00222544 FD001024 */  addiu      $16, $0, 0xFD
/* 122648 00222548 37000010 */  b          .L00222628
/* 12264C 0022254C 00000000 */   nop
/* 122650 00222550 1B011024 */  addiu      $16, $0, 0x11B
/* 122654 00222554 34000010 */  b          .L00222628
/* 122658 00222558 00000000 */   nop
/* 12265C 0022255C 01011024 */  addiu      $16, $0, 0x101
/* 122660 00222560 31000010 */  b          .L00222628
/* 122664 00222564 00000000 */   nop
/* 122668 00222568 1A011024 */  addiu      $16, $0, 0x11A
/* 12266C 0022256C 2E000010 */  b          .L00222628
/* 122670 00222570 00000000 */   nop
/* 122674 00222574 0A011024 */  addiu      $16, $0, 0x10A
/* 122678 00222578 2B000010 */  b          .L00222628
/* 12267C 0022257C 00000000 */   nop
/* 122680 00222580 17011024 */  addiu      $16, $0, 0x117
/* 122684 00222584 28000010 */  b          .L00222628
/* 122688 00222588 00000000 */   nop
/* 12268C 0022258C 00011024 */  addiu      $16, $0, 0x100
/* 122690 00222590 25000010 */  b          .L00222628
/* 122694 00222594 00000000 */   nop
/* 122698 00222598 11011024 */  addiu      $16, $0, 0x111
/* 12269C 0022259C 22000010 */  b          .L00222628
/* 1226A0 002225A0 00000000 */   nop
/* 1226A4 002225A4 12011024 */  addiu      $16, $0, 0x112
/* 1226A8 002225A8 1F000010 */  b          .L00222628
/* 1226AC 002225AC 00000000 */   nop
/* 1226B0 002225B0 0B011024 */  addiu      $16, $0, 0x10B
/* 1226B4 002225B4 1C000010 */  b          .L00222628
/* 1226B8 002225B8 00000000 */   nop
/* 1226BC 002225BC 18011024 */  addiu      $16, $0, 0x118
/* 1226C0 002225C0 19000010 */  b          .L00222628
/* 1226C4 002225C4 00000000 */   nop
/* 1226C8 002225C8 22011024 */  addiu      $16, $0, 0x122
/* 1226CC 002225CC 16000010 */  b          .L00222628
/* 1226D0 002225D0 00000000 */   nop
/* 1226D4 002225D4 24011024 */  addiu      $16, $0, 0x124
/* 1226D8 002225D8 13000010 */  b          .L00222628
/* 1226DC 002225DC 00000000 */   nop
/* 1226E0 002225E0 2B011024 */  addiu      $16, $0, 0x12B
/* 1226E4 002225E4 10000010 */  b          .L00222628
/* 1226E8 002225E8 00000000 */   nop
/* 1226EC 002225EC 28860070 */  paddub     $16, $0, $0
/* 1226F0 002225F0 0D000010 */  b          .L00222628
/* 1226F4 002225F4 00000000 */   nop
/* 1226F8 002225F8 2A011024 */  addiu      $16, $0, 0x12A
/* 1226FC 002225FC 0A000010 */  b          .L00222628
/* 122700 00222600 00000000 */   nop
/* 122704 00222604 06011024 */  addiu      $16, $0, 0x106
/* 122708 00222608 07000010 */  b          .L00222628
/* 12270C 0022260C 00000000 */   nop
.L00222610:
/* 122710 00222610 DB01023C */  lui        $2, %hi(McAccess)
/* 122714 00222614 80824424 */  addiu      $4, $2, %lo(McAccess)
/* 122718 00222618 FA000524 */  addiu      $5, $0, 0xFA
/* 12271C 0022261C 605A080C */  jal        GetMsgNo__17CMemoryCardAccessFi
/* 122720 00222620 00000000 */   nop
/* 122724 00222624 28864070 */  paddub     $16, $2, $0
.L00222628:
/* 122728 00222628 28160072 */  paddub     $2, $16, $0
/* 12272C 0022262C 1000BF7B */  lq         $31, 0x10($sp)
/* 122730 00222630 0000B07B */  lq         $16, 0x0($sp)
/* 122734 00222634 2000BD27 */  addiu      $sp, $sp, 0x20
/* 122738 00222638 0800E003 */  jr         $31
/* 12273C 0022263C 00000000 */   nop