.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel BattleMenuCursor__Fv
/* 0F6820 001F6720 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0F6824 001F6724 1000BF7F */  sq          $31, 0x10($29)
/* 0F6828 001F6728 0000B07F */  sq          $16, 0x0($29)
/* 0F682C 001F672C 38FB040C */  jal         ReadBG__Fv
/* 0F6830 001F6730 00000000 */   nop
/* 0F6834 001F6734 D494848F */  lw          $4, -0x6B2C($28)
/* 0F6838 001F6738 01000524 */  addiu       $5, $0, 0x1
/* 0F683C 001F673C 94FA060C */  jal         Step__11CUserStatusFi
/* 0F6840 001F6740 00000000 */   nop
/* 0F6844 001F6744 DB01023C */  lui         $2, %hi(ItemVolumeStep)
/* 0F6848 001F6748 10BC4424 */  addiu       $4, $2, %lo(ItemVolumeStep)
/* 0F684C 001F674C 3C000524 */  addiu       $5, $0, 0x3C
/* 0F6850 001F6750 B4D5080C */  jal         LoopStep__13CMenuItemStepFi
/* 0F6854 001F6754 00000000 */   nop
/* 0F6858 001F6758 DB01023C */  lui         $2, %hi(ItemVolumeStep)
/* 0F685C 001F675C 10BC4424 */  addiu       $4, $2, %lo(ItemVolumeStep)
/* 0F6860 001F6760 C8D5080C */  jal         CheckItemVolume__13CMenuItemStepFv
/* 0F6864 001F6764 00000000 */   nop
/* 0F6868 001F6768 01001024 */  addiu       $16, $0, 0x1
/* 0F686C 001F676C 2088828F */  lw          $2, -0x77E0($28)
/* 0F6870 001F6770 01004420 */  addi        $4, $2, 0x1 /* handwritten instruction */
/* 0F6874 001F6774 1E00812C */  sltiu       $1, $4, 0x1E
/* 0F6878 001F6778 3A002010 */  beqz        $1, .L001F6864$b
/* 0F687C 001F677C 00000000 */   nop
/* 0F6880 001F6780 2A00023C */  lui         $2, %hi(LIT_1193)
/* 0F6884 001F6784 A0D64324 */  addiu       $3, $2, %lo(LIT_1193)
/* 0F6888 001F6788 80100400 */  sll         $2, $4, 2
/* 0F688C 001F678C 21104300 */  addu        $2, $2, $3
/* 0F6890 001F6790 0000428C */  lw          $2, 0x0($2)
/* 0F6894 001F6794 08004000 */  jr          $2
/* 0F6898 001F6798 00000000 */   nop
jlabel .L001F679C
.L001F679C$b:
/* 0F689C 001F679C 30DA070C */  jal         BattleMenuAppear__Fv
/* 0F68A0 001F67A0 00000000 */   nop
/* 0F68A4 001F67A4 2F000010 */  b           .L001F6864$b
/* 0F68A8 001F67A8 00000000 */   nop
jlabel .L001F67AC
.L001F67AC$b:
/* 0F68AC 001F67AC 90DA070C */  jal         BattleMenuExit__Fv
/* 0F68B0 001F67B0 00000000 */   nop
/* 0F68B4 001F67B4 28864070 */  paddub      $16, $2, $0
/* 0F68B8 001F67B8 2A000010 */  b           .L001F6864$b
/* 0F68BC 001F67BC 00000000 */   nop
jlabel .L001F67C0
.L001F67C0$b:
/* 0F68C0 001F67C0 C8DA070C */  jal         BattleMenuSelect__Fv
/* 0F68C4 001F67C4 00000000 */   nop
/* 0F68C8 001F67C8 28864070 */  paddub      $16, $2, $0
/* 0F68CC 001F67CC 25000010 */  b           .L001F6864$b
/* 0F68D0 001F67D0 00000000 */   nop
jlabel .L001F67D4
.L001F67D4$b:
/* 0F68D4 001F67D4 7CF3070C */  jal         WeaponMenuSelect__Fv
/* 0F68D8 001F67D8 00000000 */   nop
/* 0F68DC 001F67DC 21000010 */  b           .L001F6864$b
/* 0F68E0 001F67E0 00000000 */   nop
jlabel .L001F67E4
.L001F67E4$b:
/* 0F68E4 001F67E4 040B080C */  jal         InitItemTrushStart__Fv
/* 0F68E8 001F67E8 00000000 */   nop
/* 0F68EC 001F67EC 1D000010 */  b           .L001F6864$b
/* 0F68F0 001F67F0 00000000 */   nop
jlabel .L001F67F4
.L001F67F4$b:
/* 0F68F4 001F67F4 C40B080C */  jal         ItemMenuMainKey__Fv
/* 0F68F8 001F67F8 00000000 */   nop
/* 0F68FC 001F67FC 19000010 */  b           .L001F6864$b
/* 0F6900 001F6800 00000000 */   nop
jlabel .L001F6804
.L001F6804$b:
/* 0F6904 001F6804 10DD070C */  jal         BattleMenuCharaKey__Fv
/* 0F6908 001F6808 00000000 */   nop
/* 0F690C 001F680C 28864070 */  paddub      $16, $2, $0
/* 0F6910 001F6810 14000010 */  b           .L001F6864$b
/* 0F6914 001F6814 00000000 */   nop
jlabel .L001F6818
.L001F6818$b:
/* 0F6918 001F6818 7C1F080C */  jal         BattleMenuAtoraKey__Fv
/* 0F691C 001F681C 00000000 */   nop
/* 0F6920 001F6820 10000010 */  b           .L001F6864$b
/* 0F6924 001F6824 00000000 */   nop
jlabel .L001F6828
.L001F6828$b:
/* 0F6928 001F6828 2421080C */  jal         MenuMoveKey__Fv
/* 0F692C 001F682C 00000000 */   nop
/* 0F6930 001F6830 28864070 */  paddub      $16, $2, $0
/* 0F6934 001F6834 0B000010 */  b           .L001F6864$b
/* 0F6938 001F6838 00000000 */   nop
jlabel .L001F683C
.L001F683C$b:
/* 0F693C 001F683C 982B080C */  jal         BattleMenuOptionKey__Fv
/* 0F6940 001F6840 00000000 */   nop
/* 0F6944 001F6844 07000010 */  b           .L001F6864$b
/* 0F6948 001F6848 00000000 */   nop
jlabel .L001F684C
.L001F684C$b:
/* 0F694C 001F684C DC2B080C */  jal         BattleMenuSaveKey__Fv
/* 0F6950 001F6850 00000000 */   nop
/* 0F6954 001F6854 03000010 */  b           .L001F6864$b
/* 0F6958 001F6858 00000000 */   nop
jlabel .L001F685C
.L001F685C$b:
/* 0F695C 001F685C 242C080C */  jal         BattleManualKey__Fv
/* 0F6960 001F6860 00000000 */   nop
jlabel .L001F6864
.L001F6864$b:
/* 0F6964 001F6864 DB01023C */  lui         $2, %hi(MenuWepLevelUp)
/* 0F6968 001F6868 E0A84424 */  addiu       $4, $2, %lo(MenuWepLevelUp)
/* 0F696C 001F686C BCDB080C */  jal         StepSnd__14CWeaponLevelUpFv
/* 0F6970 001F6870 00000000 */   nop
/* 0F6974 001F6874 D894828F */  lw          $2, -0x6B28($28)
/* 0F6978 001F6878 03004010 */  beqz        $2, .L001F6888
/* 0F697C 001F687C 00000000 */   nop
/* 0F6980 001F6880 06000010 */  b           .L001F689C
/* 0F6984 001F6884 00000000 */   nop
.L001F6888:
/* 0F6988 001F6888 D0CF070C */  jal         EscapeDungeonMode__Fv
/* 0F698C 001F688C 00000000 */   nop
/* 0F6990 001F6890 28264070 */  paddub      $4, $2, $0
/* 0F6994 001F6894 E8CF070C */  jal         SetEscapeDngFlag__Fi
/* 0F6998 001F6898 00000000 */   nop
.L001F689C:
/* 0F699C 001F689C 28160072 */  paddub      $2, $16, $0
/* 0F69A0 001F68A0 1000BF7B */  lq          $31, 0x10($29)
/* 0F69A4 001F68A4 0000B07B */  lq          $16, 0x0($29)
/* 0F69A8 001F68A8 2000BD27 */  addiu       $29, $29, 0x20
/* 0F69AC 001F68AC 0800E003 */  jr          $31
/* 0F69B0 001F68B0 00000000 */   nop
/* 0F69B4 001F68B4 00000000 */  nop
/* 0F69B8 001F68B8 00000000 */  nop
/* 0F69BC 001F68BC 00000000 */  nop
