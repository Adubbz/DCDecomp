.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandDOF__FPPv
/* 75080 00174F80 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 75084 00174F84 1000BF7F */  sq         $31, 0x10($sp)
/* 75088 00174F88 0000B07F */  sq         $16, 0x0($sp)
/* 7508C 00174F8C 28868070 */  paddub     $16, $4, $0
/* 75090 00174F90 0000828C */  lw         $2, 0x0($4)
/* 75094 00174F94 00004CC4 */  lwc1       $f12, 0x0($2)
/* 75098 00174F98 3CD0050C */  jal        ConvertTime__Ff
/* 7509C 00174F9C 00000000 */   nop
/* 750A0 00174FA0 C08F828F */  lw         $2, -0x7040($gp)
/* 750A4 00174FA4 0200013C */  lui        $at, (0x20000 >> 16)
/* 750A8 00174FA8 21084100 */  addu       $at, $2, $at
/* 750AC 00174FAC D08320E4 */  swc1       $f0, -0x7C30($at)
/* 750B0 00174FB0 0400028E */  lw         $2, 0x4($16)
/* 750B4 00174FB4 00004CC4 */  lwc1       $f12, 0x0($2)
/* 750B8 00174FB8 3CD0050C */  jal        ConvertTime__Ff
/* 750BC 00174FBC 00000000 */   nop
/* 750C0 00174FC0 C08F838F */  lw         $3, -0x7040($gp)
/* 750C4 00174FC4 0200013C */  lui        $at, (0x20000 >> 16)
/* 750C8 00174FC8 21086100 */  addu       $at, $3, $at
/* 750CC 00174FCC D48320E4 */  swc1       $f0, -0x7C2C($at)
/* 750D0 00174FD0 0800038E */  lw         $3, 0x8($16)
/* 750D4 00174FD4 0000648C */  lw         $4, 0x0($3)
/* 750D8 00174FD8 C08F838F */  lw         $3, -0x7040($gp)
/* 750DC 00174FDC 0200013C */  lui        $at, (0x20000 >> 16)
/* 750E0 00174FE0 21086100 */  addu       $at, $3, $at
/* 750E4 00174FE4 E08324AC */  sw         $4, -0x7C20($at)
/* 750E8 00174FE8 0C00038E */  lw         $3, 0xC($16)
/* 750EC 00174FEC 000060C4 */  lwc1       $f0, 0x0($3)
/* 750F0 00174FF0 C08F838F */  lw         $3, -0x7040($gp)
/* 750F4 00174FF4 0200013C */  lui        $at, (0x20000 >> 16)
/* 750F8 00174FF8 21086100 */  addu       $at, $3, $at
/* 750FC 00174FFC D88320E4 */  swc1       $f0, -0x7C28($at)
/* 75100 00175000 1000038E */  lw         $3, 0x10($16)
/* 75104 00175004 000060C4 */  lwc1       $f0, 0x0($3)
/* 75108 00175008 C08F838F */  lw         $3, -0x7040($gp)
/* 7510C 0017500C 0200013C */  lui        $at, (0x20000 >> 16)
/* 75110 00175010 21086100 */  addu       $at, $3, $at
/* 75114 00175014 DC8320E4 */  swc1       $f0, -0x7C24($at)
/* 75118 00175018 1400038E */  lw         $3, 0x14($16)
/* 7511C 0017501C 0000648C */  lw         $4, 0x0($3)
/* 75120 00175020 C08F838F */  lw         $3, -0x7040($gp)
/* 75124 00175024 0200013C */  lui        $at, (0x20000 >> 16)
/* 75128 00175028 21086100 */  addu       $at, $3, $at
/* 7512C 0017502C E48324AC */  sw         $4, -0x7C1C($at)
/* 75130 00175030 1800038E */  lw         $3, 0x18($16)
/* 75134 00175034 0000648C */  lw         $4, 0x0($3)
/* 75138 00175038 C08F838F */  lw         $3, -0x7040($gp)
/* 7513C 0017503C 0200013C */  lui        $at, (0x20000 >> 16)
/* 75140 00175040 21086100 */  addu       $at, $3, $at
/* 75144 00175044 E88324AC */  sw         $4, -0x7C18($at)
/* 75148 00175048 1000BF7B */  lq         $31, 0x10($sp)
/* 7514C 0017504C 0000B07B */  lq         $16, 0x0($sp)
/* 75150 00175050 2000BD27 */  addiu      $sp, $sp, 0x20
/* 75154 00175054 0800E003 */  jr         $31
/* 75158 00175058 00000000 */   nop
/* 7515C 0017505C 00000000 */  nop
