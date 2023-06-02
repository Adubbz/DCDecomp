.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitWorkBuffer__Fv
/* 77F20 00177E20 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 77F24 00177E24 58B3258C */  lw         $5, -0x4CA8($at)
/* 77F28 00177E28 00210500 */  sll        $4, $5, 4
/* 77F2C 00177E2C D201013C */  lui        $at, (0x1D20000 >> 16)
/* 77F30 00177E30 50B3238C */  lw         $3, -0x4CB0($at)
/* 77F34 00177E34 21206400 */  addu       $4, $3, $4
/* 77F38 00177E38 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 77F3C 00177E3C 5CB3238C */  lw         $3, -0x4CA4($at)
/* 77F40 00177E40 23286500 */  subu       $5, $3, $5
/* 77F44 00177E44 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 77F48 00177E48 60B324AC */  sw         $4, -0x4CA0($at)
/* 77F4C 00177E4C D201013C */  lui        $at, (0x1D20000 >> 16)
/* 77F50 00177E50 6CB325AC */  sw         $5, -0x4C94($at)
/* 77F54 00177E54 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 77F58 00177E58 68B320AC */  sw         $0, -0x4C98($at)
/* 77F5C 00177E5C 83190400 */  sra        $3, $4, 6
/* 77F60 00177E60 01006324 */  addiu      $3, $3, 0x1
/* 77F64 00177E64 80210300 */  sll        $4, $3, 6
/* 77F68 00177E68 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 77F6C 00177E6C C0B324AC */  sw         $4, -0x4C40($at)
/* 77F70 00177E70 FCFFA324 */  addiu      $3, $5, -0x4
/* 77F74 00177E74 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 77F78 00177E78 CCB323AC */  sw         $3, -0x4C34($at)
/* 77F7C 00177E7C D201013C */  lui        $at, (0x1D20000 >> 16)
/* 77F80 00177E80 C8B320AC */  sw         $0, -0x4C38($at)
/* 77F84 00177E84 948B848F */  lw         $4, -0x746C($gp)
/* 77F88 00177E88 E8FF013C */  lui        $at, (0xFFE80000 >> 16)
/* 77F8C 00177E8C 21188100 */  addu       $3, $4, $at
/* 77F90 00177E90 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 77F94 00177E94 D0B323AC */  sw         $3, -0x4C30($at)
/* 77F98 00177E98 0300033C */  lui        $3, (0x3A2E0 >> 16)
/* 77F9C 00177E9C E0A26334 */  ori        $3, $3, (0x3A2E0 & 0xFFFF)
/* 77FA0 00177EA0 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 77FA4 00177EA4 DCB323AC */  sw         $3, -0x4C24($at)
/* 77FA8 00177EA8 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 77FAC 00177EAC D8B320AC */  sw         $0, -0x4C28($at)
/* 77FB0 00177EB0 0800E003 */  jr         $31
/* 77FB4 00177EB4 00000000 */   nop
/* 77FB8 00177EB8 00000000 */  nop
/* 77FBC 00177EBC 00000000 */  nop
