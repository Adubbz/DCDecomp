.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetNowEquipWeaponDataForMsg__FRiRi
/* F3F70 001F3E70 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* F3F74 001F3E74 2000BF7F */  sq         $31, 0x20($sp)
/* F3F78 001F3E78 1000B17F */  sq         $17, 0x10($sp)
/* F3F7C 001F3E7C 0000B07F */  sq         $16, 0x0($sp)
/* F3F80 001F3E80 288E8070 */  paddub     $17, $4, $0
/* F3F84 001F3E84 2886A070 */  paddub     $16, $5, $0
/* F3F88 001F3E88 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* F3F8C 001F3E8C 74ED2484 */  lh         $4, -0x128C($at)
/* F3F90 001F3E90 7443070C */  jal        GetCommonItemInfo__Fi
/* F3F94 001F3E94 00000000 */   nop
/* F3F98 001F3E98 05004010 */  beqz       $2, .L001F3EB0
/* F3F9C 001F3E9C 00000000 */   nop
/* F3FA0 001F3EA0 06004384 */  lh         $3, 0x6($2)
/* F3FA4 001F3EA4 000023AE */  sw         $3, 0x0($17)
/* F3FA8 001F3EA8 02000010 */  b          .L001F3EB4
/* F3FAC 001F3EAC 00000000 */   nop
.L001F3EB0:
/* F3FB0 001F3EB0 000020AE */  sw         $0, 0x0($17)
.L001F3EB4:
/* F3FB4 001F3EB4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* F3FB8 001F3EB8 76ED2384 */  lh         $3, -0x128A($at)
/* F3FBC 001F3EBC 000003AE */  sw         $3, 0x0($16)
/* F3FC0 001F3EC0 2000BF7B */  lq         $31, 0x20($sp)
/* F3FC4 001F3EC4 1000B17B */  lq         $17, 0x10($sp)
/* F3FC8 001F3EC8 0000B07B */  lq         $16, 0x0($sp)
/* F3FCC 001F3ECC 3000BD27 */  addiu      $sp, $sp, 0x30
/* F3FD0 001F3ED0 0800E003 */  jr         $31
/* F3FD4 001F3ED4 00000000 */   nop
/* F3FD8 001F3ED8 00000000 */  nop
/* F3FDC 001F3EDC 00000000 */  nop
