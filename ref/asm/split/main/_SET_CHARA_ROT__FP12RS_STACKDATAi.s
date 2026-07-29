.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_CHARA_ROT__FP12RS_STACKDATAi
/* 08E1F0 0018E0F0 C0FFBD27 */  addiu       $29, $29, -0x40
/* 08E1F4 0018E0F4 2000BF7F */  sq          $31, 0x20($29)
/* 08E1F8 0018E0F8 1000B17F */  sq          $17, 0x10($29)
/* 08E1FC 0018E0FC 0000B07F */  sq          $16, 0x0($29)
/* 08E200 0018E100 288E8070 */  paddub      $17, $4, $0
/* 08E204 0018E104 2886A070 */  paddub      $16, $5, $0
/* 08E208 0018E108 03000224 */  addiu       $2, $0, 0x3
/* 08E20C 0018E10C 05000216 */  bne         $16, $2, .L0018E124
/* 08E210 0018E110 00000000 */   nop
/* 08E214 0018E114 3000A527 */  addiu       $5, $29, 0x30
/* 08E218 0018E118 B42D060C */  jal         GetRotation__FP12RS_STACKDATAPf
/* 08E21C 0018E11C 00000000 */   nop
/* 08E220 0018E120 18003126 */  addiu       $17, $17, 0x18
.L0018E124:
/* 08E224 0018E124 01000224 */  addiu       $2, $0, 0x1
/* 08E228 0018E128 0B000216 */  bne         $16, $2, .L0018E158
/* 08E22C 0018E12C 00000000 */   nop
/* 08E230 0018E130 3800A0AF */  sw          $0, 0x38($29)
/* 08E234 0018E134 3000A0AF */  sw          $0, 0x30($29)
/* 08E238 0018E138 28262072 */  paddub      $4, $17, $0
/* 08E23C 0018E13C E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 08E240 0018E140 00000000 */   nop
/* 08E244 0018E144 3400A0E7 */  swc1        $f0, 0x34($29)
/* 08E248 0018E148 3000A427 */  addiu       $4, $29, 0x30
/* 08E24C 0018E14C 282E8070 */  paddub      $5, $4, $0
/* 08E250 0018E150 342D060C */  jal         GetWorldRot__FPfPf
/* 08E254 0018E154 00000000 */   nop
.L0018E158:
/* 08E258 0018E158 D401013C */  lui         $1, %hi(EdEventInfo + 0x4C)
/* 08E25C 0018E15C 1CD2248C */  lw          $4, %lo(EdEventInfo + 0x4C)($1)
/* 08E260 0018E160 3000A527 */  addiu       $5, $29, 0x30
/* 08E264 0018E164 A000998C */  lw          $25, 0xA0($4)
/* 08E268 0018E168 3400398F */  lw          $25, 0x34($25)
/* 08E26C 0018E16C 09F82003 */  jalr        $25
/* 08E270 0018E170 00000000 */   nop
/* 08E274 0018E174 01000224 */  addiu       $2, $0, 0x1
/* 08E278 0018E178 2000BF7B */  lq          $31, 0x20($29)
/* 08E27C 0018E17C 1000B17B */  lq          $17, 0x10($29)
/* 08E280 0018E180 0000B07B */  lq          $16, 0x0($29)
/* 08E284 0018E184 4000BD27 */  addiu       $29, $29, 0x40
/* 08E288 0018E188 0800E003 */  jr          $31
/* 08E28C 0018E18C 00000000 */   nop
