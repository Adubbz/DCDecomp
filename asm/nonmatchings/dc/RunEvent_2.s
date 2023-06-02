.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RunEvent__FP10CRunScriptiP14CDataAlloc2_1_
/* 977A0 001976A0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 977A4 001976A4 2000BF7F */  sq         $31, 0x20($sp)
/* 977A8 001976A8 1000B17F */  sq         $17, 0x10($sp)
/* 977AC 001976AC 0000B07F */  sq         $16, 0x0($sp)
/* 977B0 001976B0 288E8070 */  paddub     $17, $4, $0
/* 977B4 001976B4 2886A070 */  paddub     $16, $5, $0
/* 977B8 001976B8 0800C48C */  lw         $4, 0x8($6)
/* 977BC 001976BC 00190400 */  sll        $3, $4, 4
/* 977C0 001976C0 0000C28C */  lw         $2, 0x0($6)
/* 977C4 001976C4 21184300 */  addu       $3, $2, $3
/* 977C8 001976C8 0C00C28C */  lw         $2, 0xC($6)
/* 977CC 001976CC 23104400 */  subu       $2, $2, $4
/* 977D0 001976D0 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 977D4 001976D4 70B323AC */  sw         $3, -0x4C90($at)
/* 977D8 001976D8 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 977DC 001976DC 7CB322AC */  sw         $2, -0x4C84($at)
/* 977E0 001976E0 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 977E4 001976E4 78B320AC */  sw         $0, -0x4C88($at)
/* 977E8 001976E8 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 977EC 001976EC FCEE20AC */  sw         $0, -0x1104($at)
/* 977F0 001976F0 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 977F4 001976F4 F8EE20AC */  sw         $0, -0x1108($at)
/* 977F8 001976F8 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 977FC 001976FC F4EE20AC */  sw         $0, -0x110C($at)
/* 97800 00197700 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 97804 00197704 F0EE20AC */  sw         $0, -0x1110($at)
/* 97808 00197708 D401023C */  lui        $2, %hi(world_pos)
/* 9780C 0019770C E0EE4424 */  addiu      $4, $2, %lo(world_pos)
/* 97810 00197710 D401023C */  lui        $2, %hi(world_rot)
/* 97814 00197714 F0EE4524 */  addiu      $5, $2, %lo(world_rot)
/* 97818 00197718 0C86040C */  jal        sceVu0CopyVector
/* 9781C 0019771C 00000000 */   nop
/* 97820 00197720 D401023C */  lui        $2, %hi(world_local)
/* 97824 00197724 00EF4424 */  addiu      $4, $2, %lo(world_local)
/* 97828 00197728 2A86040C */  jal        sceVu0UnitMatrix
/* 9782C 0019772C 00000000 */   nop
/* 97830 00197730 D401023C */  lui        $2, %hi(local_world)
/* 97834 00197734 40EF4424 */  addiu      $4, $2, %lo(local_world)
/* 97838 00197738 2A86040C */  jal        sceVu0UnitMatrix
/* 9783C 0019773C 00000000 */   nop
/* 97840 00197740 449280AF */  sw         $0, -0x6DBC($gp)
/* 97844 00197744 28262072 */  paddub     $4, $17, $0
/* 97848 00197748 282E0072 */  paddub     $5, $16, $0
/* 9784C 0019774C 9CF7080C */  jal        run__10CRunScriptFi
/* 97850 00197750 00000000 */   nop
/* 97854 00197754 2000BF7B */  lq         $31, 0x20($sp)
/* 97858 00197758 1000B17B */  lq         $17, 0x10($sp)
/* 9785C 0019775C 0000B07B */  lq         $16, 0x0($sp)
/* 97860 00197760 3000BD27 */  addiu      $sp, $sp, 0x30
/* 97864 00197764 0800E003 */  jr         $31
/* 97868 00197768 00000000 */   nop
/* 9786C 0019776C 00000000 */  nop
