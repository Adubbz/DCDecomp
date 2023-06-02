.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SEQUIP_DEFAULT_WEAPON__FP12RS_STACKDATAi
/* 95C60 00195B60 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 95C64 00195B64 0000BF7F */  sq         $31, 0x0($sp)
/* 95C68 00195B68 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 95C6C 00195B6C 00000000 */   nop
/* 95C70 00195B70 28264070 */  paddub     $4, $2, $0
/* 95C74 00195B74 EC2F080C */  jal        EquipDefaultWeapon__Fi
/* 95C78 00195B78 00000000 */   nop
/* 95C7C 00195B7C 01000224 */  addiu      $2, $0, 0x1
/* 95C80 00195B80 0000BF7B */  lq         $31, 0x0($sp)
/* 95C84 00195B84 1000BD27 */  addiu      $sp, $sp, 0x10
/* 95C88 00195B88 0800E003 */  jr         $31
/* 95C8C 00195B8C 00000000 */   nop
