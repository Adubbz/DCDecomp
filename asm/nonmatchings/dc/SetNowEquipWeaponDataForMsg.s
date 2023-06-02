.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetNowEquipWeaponDataForMsg__Fii
/* F3F50 001F3E50 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* F3F54 001F3E54 74ED24A4 */  sh         $4, -0x128C($at)
/* F3F58 001F3E58 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* F3F5C 001F3E5C 76ED25A4 */  sh         $5, -0x128A($at)
/* F3F60 001F3E60 0800E003 */  jr         $31
/* F3F64 001F3E64 00000000 */   nop
/* F3F68 001F3E68 00000000 */  nop
/* F3F6C 001F3E6C 00000000 */  nop
