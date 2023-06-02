.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StartBGReadItemMenuWepIcon__FP1Ri
/* 1025B0 002024B0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 1025B4 002024B4 2000BF7F */  sq         $31, 0x20($sp)
/* 1025B8 002024B8 1000B17F */  sq         $17, 0x10($sp)
/* 1025BC 002024BC 0000B07F */  sq         $16, 0x0($sp)
/* 1025C0 002024C0 288E8070 */  paddub     $17, $4, $0
/* 1025C4 002024C4 2886A070 */  paddub     $16, $5, $0
/* 1025C8 002024C8 30FB040C */  jal        StartReadBG__Fv
/* 1025CC 002024CC 00000000 */   nop
/* 1025D0 002024D0 2A00023C */  lui        $2, %hi(_4330)
/* 1025D4 002024D4 70DA4424 */  addiu      $4, $2, %lo(_4330)
/* 1025D8 002024D8 282E2072 */  paddub     $5, $17, $0
/* 1025DC 002024DC ACAE080C */  jal        LoadFileBGMenuData__FPcP1
/* 1025E0 002024E0 00000000 */   nop
/* 1025E4 002024E4 000002AE */  sw         $2, 0x0($16)
/* 1025E8 002024E8 F09480AF */  sw         $0, -0x6B10($gp)
/* 1025EC 002024EC 2000BF7B */  lq         $31, 0x20($sp)
/* 1025F0 002024F0 1000B17B */  lq         $17, 0x10($sp)
/* 1025F4 002024F4 0000B07B */  lq         $16, 0x0($sp)
/* 1025F8 002024F8 3000BD27 */  addiu      $sp, $sp, 0x30
/* 1025FC 002024FC 0800E003 */  jr         $31
/* 102600 00202500 00000000 */   nop
/* 102604 00202504 00000000 */  nop
/* 102608 00202508 00000000 */  nop
/* 10260C 0020250C 00000000 */  nop
