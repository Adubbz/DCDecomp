.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetWeaponAttachStatus__FP11WEAPON_HAVE
/* 125BA0 00225AA0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 125BA4 00225AA4 1000BF7F */  sq         $31, 0x10($sp)
/* 125BA8 00225AA8 0000B07F */  sq         $16, 0x0($sp)
/* 125BAC 00225AAC 28868070 */  paddub     $16, $4, $0
/* 125BB0 00225AB0 23000012 */  beqz       $16, .L00225B40
/* 125BB4 00225AB4 00000000 */   nop
/* 125BB8 00225AB8 1C8D848F */  lw         $4, -0x72E4($gp)
/* 125BBC 00225ABC 7860050C */  jal        GetDngStatus__9CSaveDataFv
/* 125BC0 00225AC0 00000000 */   nop
/* 125BC4 00225AC4 07004014 */  bnez       $2, .L00225AE4
/* 125BC8 00225AC8 00000000 */   nop
/* 125BCC 00225ACC 2A00023C */  lui        $2, %hi(_638_3)
/* 125BD0 00225AD0 50EE4424 */  addiu      $4, $2, %lo(_638_3)
/* 125BD4 00225AD4 A611040C */  jal        printf
/* 125BD8 00225AD8 00000000 */   nop
/* 125BDC 00225ADC 18000010 */  b          .L00225B40
/* 125BE0 00225AE0 00000000 */   nop
.L00225AE4:
/* 125BE4 00225AE4 04004580 */  lb         $5, 0x4($2)
/* 125BE8 00225AE8 2118A200 */  addu       $3, $5, $2
/* 125BEC 00225AEC 40436480 */  lb         $4, 0x4340($3)
/* 125BF0 00225AF0 A80A0324 */  addiu      $3, $0, 0xAA8
/* 125BF4 00225AF4 1818A300 */  mult       $3, $5, $3
/* 125BF8 00225AF8 21104300 */  addu       $2, $2, $3
/* 125BFC 00225AFC 0C454324 */  addiu      $3, $2, 0x450C
/* 125C00 00225B00 40110400 */  sll        $2, $4, 5
/* 125C04 00225B04 23104400 */  subu       $2, $2, $4
/* 125C08 00225B08 C0100200 */  sll        $2, $2, 3
/* 125C0C 00225B0C 21206200 */  addu       $4, $3, $2
/* 125C10 00225B10 07008014 */  bnez       $4, .L00225B30
/* 125C14 00225B14 00000000 */   nop
/* 125C18 00225B18 2A00023C */  lui        $2, %hi(_639_4)
/* 125C1C 00225B1C 70EE4424 */  addiu      $4, $2, %lo(_639_4)
/* 125C20 00225B20 A611040C */  jal        printf
/* 125C24 00225B24 00000000 */   nop
/* 125C28 00225B28 05000010 */  b          .L00225B40
/* 125C2C 00225B2C 00000000 */   nop
.L00225B30:
/* 125C30 00225B30 282E0072 */  paddub     $5, $16, $0
/* 125C34 00225B34 28360070 */  paddub     $6, $0, $0
/* 125C38 00225B38 D896080C */  jal        WeaponAllValueSet__FP11WEAPON_HAVEP11WEAPON_HAVEi
/* 125C3C 00225B3C 00000000 */   nop
.L00225B40:
/* 125C40 00225B40 1000BF7B */  lq         $31, 0x10($sp)
/* 125C44 00225B44 0000B07B */  lq         $16, 0x0($sp)
/* 125C48 00225B48 2000BD27 */  addiu      $sp, $sp, 0x20
/* 125C4C 00225B4C 0800E003 */  jr         $31
/* 125C50 00225B50 00000000 */   nop
/* 125C54 00225B54 00000000 */  nop
/* 125C58 00225B58 00000000 */  nop
/* 125C5C 00225B5C 00000000 */  nop
