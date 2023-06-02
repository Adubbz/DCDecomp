.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitMenuWeaponModelData__Fv
/* 10D4D0 0020D3D0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 10D4D4 0020D3D4 0000BF7F */  sq         $31, 0x0($sp)
/* 10D4D8 0020D3D8 DA01023C */  lui        $2, %hi(MenuWeaponModelData)
/* 10D4DC 0020D3DC D0ED4424 */  addiu      $4, $2, %lo(MenuWeaponModelData)
/* 10D4E0 0020D3E0 282E0070 */  paddub     $5, $0, $0
/* 10D4E4 0020D3E4 A8000624 */  addiu      $6, $0, 0xA8
/* 10D4E8 0020D3E8 5A0D040C */  jal        memset
/* 10D4EC 0020D3EC 00000000 */   nop
/* 10D4F0 0020D3F0 0000BF7B */  lq         $31, 0x0($sp)
/* 10D4F4 0020D3F4 1000BD27 */  addiu      $sp, $sp, 0x10
/* 10D4F8 0020D3F8 0800E003 */  jr         $31
/* 10D4FC 0020D3FC 00000000 */   nop
