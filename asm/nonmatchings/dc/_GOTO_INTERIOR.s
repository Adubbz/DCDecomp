.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GOTO_INTERIOR__FP12RS_STACKDATAi
/* 8BC80 0018BB80 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 8BC84 0018BB84 2000BF7F */  sq         $31, 0x20($sp)
/* 8BC88 0018BB88 1000B17F */  sq         $17, 0x10($sp)
/* 8BC8C 0018BB8C 0000B07F */  sq         $16, 0x0($sp)
/* 8BC90 0018BB90 2886A070 */  paddub     $16, $5, $0
/* 8BC94 0018BB94 08009124 */  addiu      $17, $4, 0x8
/* 8BC98 0018BB98 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8BC9C 0018BB9C 00000000 */   nop
/* 8BCA0 0018BBA0 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8BCA4 0018BBA4 7CD422AC */  sw         $2, -0x2B84($at)
/* 8BCA8 0018BBA8 28262072 */  paddub     $4, $17, $0
/* 8BCAC 0018BBAC 08009124 */  addiu      $17, $4, 0x8
/* 8BCB0 0018BBB0 F428060C */  jal        GetStackString__FP12RS_STACKDATA
/* 8BCB4 0018BBB4 00000000 */   nop
/* 8BCB8 0018BBB8 D401033C */  lui        $3, %hi(D_1D3D480)
/* 8BCBC 0018BBBC 80D46424 */  addiu      $4, $3, %lo(D_1D3D480)
/* 8BCC0 0018BBC0 282E4070 */  paddub     $5, $2, $0
/* 8BCC4 0018BBC4 5A15040C */  jal        strcpy
/* 8BCC8 0018BBC8 00000000 */   nop
/* 8BCCC 0018BBCC 0300012A */  slti       $at, $16, 0x3
/* 8BCD0 0018BBD0 08002014 */  bnez       $at, .L0018BBF4
/* 8BCD4 0018BBD4 00000000 */   nop
/* 8BCD8 0018BBD8 28262072 */  paddub     $4, $17, $0
/* 8BCDC 0018BBDC D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8BCE0 0018BBE0 00000000 */   nop
/* 8BCE4 0018BBE4 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8BCE8 0018BBE8 A0D422AC */  sw         $2, -0x2B60($at)
/* 8BCEC 0018BBEC 04000010 */  b          .L0018BC00
/* 8BCF0 0018BBF0 00000000 */   nop
.L0018BBF4:
/* 8BCF4 0018BBF4 FFFF0224 */  addiu      $2, $0, -0x1
/* 8BCF8 0018BBF8 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8BCFC 0018BBFC A0D422AC */  sw         $2, -0x2B60($at)
.L0018BC00:
/* 8BD00 0018BC00 04000224 */  addiu      $2, $0, 0x4
/* 8BD04 0018BC04 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8BD08 0018BC08 18D622AC */  sw         $2, -0x29E8($at)
/* 8BD0C 0018BC0C 2000BF7B */  lq         $31, 0x20($sp)
/* 8BD10 0018BC10 1000B17B */  lq         $17, 0x10($sp)
/* 8BD14 0018BC14 0000B07B */  lq         $16, 0x0($sp)
/* 8BD18 0018BC18 3000BD27 */  addiu      $sp, $sp, 0x30
/* 8BD1C 0018BC1C 0800E003 */  jr         $31
/* 8BD20 0018BC20 00000000 */   nop
/* 8BD24 0018BC24 00000000 */  nop
/* 8BD28 0018BC28 00000000 */  nop
/* 8BD2C 0018BC2C 00000000 */  nop
