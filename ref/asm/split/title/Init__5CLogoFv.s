.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Init__5CLogoFv
/* 028140 01DD3E40 F0FFBD27 */  addiu       $29, $29, -0x10
/* 028144 01DD3E44 0000BF7F */  sq          $31, 0x0($29)
/* 028148 01DD3E48 282E8070 */  paddub      $5, $4, $0
/* 02814C 01DD3E4C 28360070 */  paddub      $6, $0, $0
/* 028150 01DD3E50 07000010 */  b           .L01DD3E70_2D9670
/* 028154 01DD3E54 00000000 */   nop
.L01DD3E58_2D9658:
/* 028158 01DD3E58 80100600 */  sll         $2, $6, 2
/* 02815C 01DD3E5C 2118A200 */  addu        $3, $5, $2
/* 028160 01DD3E60 000060AC */  sw          $0, 0x0($3)
/* 028164 01DD3E64 28000224 */  addiu       $2, $0, 0x28
/* 028168 01DD3E68 240062AC */  sw          $2, 0x24($3)
/* 02816C 01DD3E6C 0100C624 */  addiu       $6, $6, 0x1
.L01DD3E70_2D9670:
/* 028170 01DD3E70 0900C228 */  slti        $2, $6, 0x9
/* 028174 01DD3E74 F8FF4014 */  bnez        $2, .L01DD3E58_2D9658
/* 028178 01DD3E78 00000000 */   nop
/* 02817C 01DD3E7C 4800A0AC */  sw          $0, 0x48($5)
/* 028180 01DD3E80 4C00A0AC */  sw          $0, 0x4C($5)
/* 028184 01DD3E84 5000A0AC */  sw          $0, 0x50($5)
/* 028188 01DD3E88 108180C7 */  lwc1        $f0, -0x7EF0($28)
/* 02818C 01DD3E8C 5400A0E4 */  swc1        $f0, 0x54($5)
/* 028190 01DD3E90 0C8180C7 */  lwc1        $f0, -0x7EF4($28)
/* 028194 01DD3E94 5800A0E4 */  swc1        $f0, 0x58($5)
/* 028198 01DD3E98 E501013C */  lui         $1, %hi(Logo + 0xBC)
/* 02819C 01DD3E9C 4C2E248C */  lw          $4, %lo(Logo + 0xBC)($1)
/* 0281A0 01DD3EA0 5000A524 */  addiu       $5, $5, 0x50
/* 0281A4 01DD3EA4 B89F040C */  jal         SetPosition__6CFrameFPf
/* 0281A8 01DD3EA8 00000000 */   nop
/* 0281AC 01DD3EAC 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 0281B0 01DD3EB0 E501013C */  lui         $1, %hi(Logo + 0x2F0)
/* 0281B4 01DD3EB4 803023AC */  sw          $3, %lo(Logo + 0x2F0)($1)
/* 0281B8 01DD3EB8 28360070 */  paddub      $6, $0, $0
/* 0281BC 01DD3EBC 09000010 */  b           .L01DD3EE4_2D96E4
/* 0281C0 01DD3EC0 00000000 */   nop
.L01DD3EC4_2D96C4:
/* 0281C4 01DD3EC4 803F053C */  lui         $5, (0x3F800000 >> 16)
/* 0281C8 01DD3EC8 B0110324 */  addiu       $3, $0, 0x11B0
/* 0281CC 01DD3ECC 1820C300 */  mult        $4, $6, $3
/* 0281D0 01DD3ED0 E501033C */  lui         $3, %hi(Spark + 0x2F0)
/* 0281D4 01DD3ED4 30426324 */  addiu       $3, $3, %lo(Spark + 0x2F0)
/* 0281D8 01DD3ED8 21186400 */  addu        $3, $3, $4
/* 0281DC 01DD3EDC 000065AC */  sw          $5, 0x0($3)
/* 0281E0 01DD3EE0 0100C624 */  addiu       $6, $6, 0x1
.L01DD3EE4_2D96E4:
/* 0281E4 01DD3EE4 0900C328 */  slti        $3, $6, 0x9
/* 0281E8 01DD3EE8 F6FF6014 */  bnez        $3, .L01DD3EC4_2D96C4
/* 0281EC 01DD3EEC 00000000 */   nop
/* 0281F0 01DD3EF0 0000BF7B */  lq          $31, 0x0($29)
/* 0281F4 01DD3EF4 1000BD27 */  addiu       $29, $29, 0x10
/* 0281F8 01DD3EF8 0800E003 */  jr          $31
/* 0281FC 01DD3EFC 00000000 */   nop
