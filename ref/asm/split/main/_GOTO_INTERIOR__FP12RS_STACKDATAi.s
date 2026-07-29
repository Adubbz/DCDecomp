.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GOTO_INTERIOR__FP12RS_STACKDATAi
/* 08BC80 0018BB80 D0FFBD27 */  addiu       $29, $29, -0x30
/* 08BC84 0018BB84 2000BF7F */  sq          $31, 0x20($29)
/* 08BC88 0018BB88 1000B17F */  sq          $17, 0x10($29)
/* 08BC8C 0018BB8C 0000B07F */  sq          $16, 0x0($29)
/* 08BC90 0018BB90 2886A070 */  paddub      $16, $5, $0
/* 08BC94 0018BB94 08009124 */  addiu       $17, $4, 0x8
/* 08BC98 0018BB98 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08BC9C 0018BB9C 00000000 */   nop
/* 08BCA0 0018BBA0 D401013C */  lui         $1, %hi(EdEventInfo + 0x2AC)
/* 08BCA4 0018BBA4 7CD422AC */  sw          $2, %lo(EdEventInfo + 0x2AC)($1)
/* 08BCA8 0018BBA8 28262072 */  paddub      $4, $17, $0
/* 08BCAC 0018BBAC 08009124 */  addiu       $17, $4, 0x8
/* 08BCB0 0018BBB0 F428060C */  jal         GetStackString__FP12RS_STACKDATA
/* 08BCB4 0018BBB4 00000000 */   nop
/* 08BCB8 0018BBB8 D401033C */  lui         $3, %hi(EdEventInfo + 0x2B0)
/* 08BCBC 0018BBBC 80D46424 */  addiu       $4, $3, %lo(EdEventInfo + 0x2B0)
/* 08BCC0 0018BBC0 282E4070 */  paddub      $5, $2, $0
/* 08BCC4 0018BBC4 5A15040C */  jal         strcpy
/* 08BCC8 0018BBC8 00000000 */   nop
/* 08BCCC 0018BBCC 0300012A */  slti        $1, $16, 0x3
/* 08BCD0 0018BBD0 08002014 */  bnez        $1, .L0018BBF4
/* 08BCD4 0018BBD4 00000000 */   nop
/* 08BCD8 0018BBD8 28262072 */  paddub      $4, $17, $0
/* 08BCDC 0018BBDC D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08BCE0 0018BBE0 00000000 */   nop
/* 08BCE4 0018BBE4 D401013C */  lui         $1, %hi(EdEventInfo + 0x2D0)
/* 08BCE8 0018BBE8 A0D422AC */  sw          $2, %lo(EdEventInfo + 0x2D0)($1)
/* 08BCEC 0018BBEC 04000010 */  b           .L0018BC00
/* 08BCF0 0018BBF0 00000000 */   nop
.L0018BBF4:
/* 08BCF4 0018BBF4 FFFF0224 */  addiu       $2, $0, -0x1
/* 08BCF8 0018BBF8 D401013C */  lui         $1, %hi(EdEventInfo + 0x2D0)
/* 08BCFC 0018BBFC A0D422AC */  sw          $2, %lo(EdEventInfo + 0x2D0)($1)
.L0018BC00:
/* 08BD00 0018BC00 04000224 */  addiu       $2, $0, 0x4
/* 08BD04 0018BC04 D401013C */  lui         $1, %hi(EdEventInfo + 0x448)
/* 08BD08 0018BC08 18D622AC */  sw          $2, %lo(EdEventInfo + 0x448)($1)
/* 08BD0C 0018BC0C 2000BF7B */  lq          $31, 0x20($29)
/* 08BD10 0018BC10 1000B17B */  lq          $17, 0x10($29)
/* 08BD14 0018BC14 0000B07B */  lq          $16, 0x0($29)
/* 08BD18 0018BC18 3000BD27 */  addiu       $29, $29, 0x30
/* 08BD1C 0018BC1C 0800E003 */  jr          $31
/* 08BD20 0018BC20 00000000 */   nop
/* 08BD24 0018BC24 00000000 */  nop
/* 08BD28 0018BC28 00000000 */  nop
/* 08BD2C 0018BC2C 00000000 */  nop
