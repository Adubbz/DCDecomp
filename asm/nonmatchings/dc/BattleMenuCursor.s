.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel BattleMenuCursor__Fv
/* F6820 001F6720 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* F6824 001F6724 1000BF7F */  sq         $31, 0x10($sp)
/* F6828 001F6728 0000B07F */  sq         $16, 0x0($sp)
/* F682C 001F672C 38FB040C */  jal        ReadBG__Fv
/* F6830 001F6730 00000000 */   nop
/* F6834 001F6734 D494848F */  lw         $4, -0x6B2C($gp)
/* F6838 001F6738 01000524 */  addiu      $5, $0, 0x1
/* F683C 001F673C 94FA060C */  jal        Step__11CUserStatusFi
/* F6840 001F6740 00000000 */   nop
/* F6844 001F6744 DB01023C */  lui        $2, %hi(ItemVolumeStep)
/* F6848 001F6748 10BC4424 */  addiu      $4, $2, %lo(ItemVolumeStep)
/* F684C 001F674C 3C000524 */  addiu      $5, $0, 0x3C
/* F6850 001F6750 B4D5080C */  jal        LoopStep__13CMenuItemStepFi
/* F6854 001F6754 00000000 */   nop
/* F6858 001F6758 DB01023C */  lui        $2, %hi(ItemVolumeStep)
/* F685C 001F675C 10BC4424 */  addiu      $4, $2, %lo(ItemVolumeStep)
/* F6860 001F6760 C8D5080C */  jal        CheckItemVolume__13CMenuItemStepFv
/* F6864 001F6764 00000000 */   nop
/* F6868 001F6768 01001024 */  addiu      $16, $0, 0x1
/* F686C 001F676C 2088828F */  lw         $2, -0x77E0($gp)
/* F6870 001F6770 01004420 */  addi       $4, $2, 0x1 # handwritten instruction
/* F6874 001F6774 1E00812C */  sltiu      $at, $4, 0x1E
/* F6878 001F6778 3A002010 */  beqz       $at, .L001F6864
/* F687C 001F677C 00000000 */   nop
/* F6880 001F6780 2A00023C */  lui        $2, %hi(_1193)
/* F6884 001F6784 A0D64324 */  addiu      $3, $2, %lo(_1193)
/* F6888 001F6788 80100400 */  sll        $2, $4, 2
/* F688C 001F678C 21104300 */  addu       $2, $2, $3
/* F6890 001F6790 0000428C */  lw         $2, 0x0($2)
/* F6894 001F6794 08004000 */  jr         $2
/* F6898 001F6798 00000000 */   nop
/* F689C 001F679C 30DA070C */  jal        BattleMenuAppear__Fv
/* F68A0 001F67A0 00000000 */   nop
/* F68A4 001F67A4 2F000010 */  b          .L001F6864
/* F68A8 001F67A8 00000000 */   nop
/* F68AC 001F67AC 90DA070C */  jal        BattleMenuExit__Fv
/* F68B0 001F67B0 00000000 */   nop
/* F68B4 001F67B4 28864070 */  paddub     $16, $2, $0
/* F68B8 001F67B8 2A000010 */  b          .L001F6864
/* F68BC 001F67BC 00000000 */   nop
/* F68C0 001F67C0 C8DA070C */  jal        BattleMenuSelect__Fv
/* F68C4 001F67C4 00000000 */   nop
/* F68C8 001F67C8 28864070 */  paddub     $16, $2, $0
/* F68CC 001F67CC 25000010 */  b          .L001F6864
/* F68D0 001F67D0 00000000 */   nop
/* F68D4 001F67D4 7CF3070C */  jal        WeaponMenuSelect__Fv
/* F68D8 001F67D8 00000000 */   nop
/* F68DC 001F67DC 21000010 */  b          .L001F6864
/* F68E0 001F67E0 00000000 */   nop
/* F68E4 001F67E4 040B080C */  jal        InitItemTrushStart__Fv
/* F68E8 001F67E8 00000000 */   nop
/* F68EC 001F67EC 1D000010 */  b          .L001F6864
/* F68F0 001F67F0 00000000 */   nop
/* F68F4 001F67F4 C40B080C */  jal        ItemMenuMainKey__Fv
/* F68F8 001F67F8 00000000 */   nop
/* F68FC 001F67FC 19000010 */  b          .L001F6864
/* F6900 001F6800 00000000 */   nop
/* F6904 001F6804 10DD070C */  jal        BattleMenuCharaKey__Fv
/* F6908 001F6808 00000000 */   nop
/* F690C 001F680C 28864070 */  paddub     $16, $2, $0
/* F6910 001F6810 14000010 */  b          .L001F6864
/* F6914 001F6814 00000000 */   nop
/* F6918 001F6818 7C1F080C */  jal        BattleMenuAtoraKey__Fv
/* F691C 001F681C 00000000 */   nop
/* F6920 001F6820 10000010 */  b          .L001F6864
/* F6924 001F6824 00000000 */   nop
/* F6928 001F6828 2421080C */  jal        MenuMoveKey__Fv
/* F692C 001F682C 00000000 */   nop
/* F6930 001F6830 28864070 */  paddub     $16, $2, $0
/* F6934 001F6834 0B000010 */  b          .L001F6864
/* F6938 001F6838 00000000 */   nop
/* F693C 001F683C 982B080C */  jal        BattleMenuOptionKey__Fv
/* F6940 001F6840 00000000 */   nop
/* F6944 001F6844 07000010 */  b          .L001F6864
/* F6948 001F6848 00000000 */   nop
/* F694C 001F684C DC2B080C */  jal        BattleMenuSaveKey__Fv
/* F6950 001F6850 00000000 */   nop
/* F6954 001F6854 03000010 */  b          .L001F6864
/* F6958 001F6858 00000000 */   nop
/* F695C 001F685C 242C080C */  jal        BattleManualKey__Fv
/* F6960 001F6860 00000000 */   nop
.L001F6864:
/* F6964 001F6864 DB01023C */  lui        $2, %hi(MenuWepLevelUp)
/* F6968 001F6868 E0A84424 */  addiu      $4, $2, %lo(MenuWepLevelUp)
/* F696C 001F686C BCDB080C */  jal        StepSnd__14CWeaponLevelUpFv
/* F6970 001F6870 00000000 */   nop
/* F6974 001F6874 D894828F */  lw         $2, -0x6B28($gp)
/* F6978 001F6878 03004010 */  beqz       $2, .L001F6888
/* F697C 001F687C 00000000 */   nop
/* F6980 001F6880 06000010 */  b          .L001F689C
/* F6984 001F6884 00000000 */   nop
.L001F6888:
/* F6988 001F6888 D0CF070C */  jal        EscapeDungeonMode__Fv
/* F698C 001F688C 00000000 */   nop
/* F6990 001F6890 28264070 */  paddub     $4, $2, $0
/* F6994 001F6894 E8CF070C */  jal        SetEscapeDngFlag__Fi
/* F6998 001F6898 00000000 */   nop
.L001F689C:
/* F699C 001F689C 28160072 */  paddub     $2, $16, $0
/* F69A0 001F68A0 1000BF7B */  lq         $31, 0x10($sp)
/* F69A4 001F68A4 0000B07B */  lq         $16, 0x0($sp)
/* F69A8 001F68A8 2000BD27 */  addiu      $sp, $sp, 0x20
/* F69AC 001F68AC 0800E003 */  jr         $31
/* F69B0 001F68B0 00000000 */   nop
/* F69B4 001F68B4 00000000 */  nop
/* F69B8 001F68B8 00000000 */  nop
/* F69BC 001F68BC 00000000 */  nop
