.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel OPMdsLoad__Fv
/* 006C30 01DB2930 D0FBBD27 */  addiu       $29, $29, -0x430
/* 006C34 01DB2934 A000BF7F */  sq          $31, 0xA0($29)
/* 006C38 01DB2938 9000BE7F */  sq          $30, 0x90($29)
/* 006C3C 01DB293C 8000B77F */  sq          $23, 0x80($29)
/* 006C40 01DB2940 7000B67F */  sq          $22, 0x70($29)
/* 006C44 01DB2944 6000B57F */  sq          $21, 0x60($29)
/* 006C48 01DB2948 5000B47F */  sq          $20, 0x50($29)
/* 006C4C 01DB294C 4000B37F */  sq          $19, 0x40($29)
/* 006C50 01DB2950 3000B27F */  sq          $18, 0x30($29)
/* 006C54 01DB2954 2000B17F */  sq          $17, 0x20($29)
/* 006C58 01DB2958 1000B07F */  sq          $16, 0x10($29)
/* 006C5C 01DB295C 0400B5E7 */  swc1        $f21, 0x4($29)
/* 006C60 01DB2960 0000B4E7 */  swc1        $f20, 0x0($29)
/* 006C64 01DB2964 B000A427 */  addiu       $4, $29, 0xB0
/* 006C68 01DB2968 509F040C */  jal         __ct__10CFrameAttrFv
/* 006C6C 01DB296C 00000000 */   nop
/* 006C70 01DB2970 1001A427 */  addiu       $4, $29, 0x110
/* 006C74 01DB2974 509F040C */  jal         __ct__10CFrameAttrFv
/* 006C78 01DB2978 00000000 */   nop
/* 006C7C 01DB297C A041033C */  lui         $3, (0x41A00000 >> 16)
/* 006C80 01DB2980 1401A3AF */  sw          $3, 0x114($29)
/* 006C84 01DB2984 01000324 */  addiu       $3, $0, 0x1
/* 006C88 01DB2988 1801A3A3 */  sb          $3, 0x118($29)
/* 006C8C 01DB298C 1B01BE27 */  addiu       $30, $29, 0x11B
/* 006C90 01DB2990 0000C0A3 */  sb          $0, 0x0($30)
/* 006C94 01DB2994 A89880AF */  sw          $0, -0x6758($28)
/* 006C98 01DB2998 AC9880AF */  sw          $0, -0x6754($28)
/* 006C9C 01DB299C 28860070 */  paddub      $16, $0, $0
/* 006CA0 01DB29A0 8F070010 */  b           .L01DB47E0_2B9FE0
/* 006CA4 01DB29A4 00000000 */   nop
.L01DB29A8_2B81A8:
/* 006CA8 01DB29A8 DD01013C */  lui         $1, %hi(TEIGI_AnimeSpeed)
/* 006CAC 01DB29AC D05E318C */  lw          $17, %lo(TEIGI_AnimeSpeed)($1)
/* 006CB0 01DB29B0 00A21000 */  sll         $20, $16, 8
/* 006CB4 01DB29B4 E101023C */  lui         $2, %hi(argValBuff)
/* 006CB8 01DB29B8 40244224 */  addiu       $2, $2, %lo(argValBuff)
/* 006CBC 01DB29BC 21A85400 */  addu        $21, $2, $20
/* 006CC0 01DB29C0 0000B4C6 */  lwc1        $f20, 0x0($21)
/* 006CC4 01DB29C4 06A30046 */  mov.s       $f12, $f20
/* 006CC8 01DB29C8 2C44040C */  jal         fptosi
/* 006CCC 01DB29CC 00000000 */   nop
/* 006CD0 01DB29D0 0F002216 */  bne         $17, $2, .L01DB2A10_2B8210
/* 006CD4 01DB29D4 00000000 */   nop
/* 006CD8 01DB29D8 E101023C */  lui         $2, %hi(argValBuff + 0x4)
/* 006CDC 01DB29DC 44244224 */  addiu       $2, $2, %lo(argValBuff + 0x4)
/* 006CE0 01DB29E0 21105400 */  addu        $2, $2, $20
/* 006CE4 01DB29E4 00004CC4 */  lwc1        $f12, 0x0($2)
/* 006CE8 01DB29E8 2C44040C */  jal         fptosi
/* 006CEC 01DB29EC 00000000 */   nop
/* 006CF0 01DB29F0 949882AF */  sw          $2, -0x676C($28)
/* 006CF4 01DB29F4 E101023C */  lui         $2, %hi(argValBuff + 0x8)
/* 006CF8 01DB29F8 48244224 */  addiu       $2, $2, %lo(argValBuff + 0x8)
/* 006CFC 01DB29FC 21105400 */  addu        $2, $2, $20
/* 006D00 01DB2A00 00004CC4 */  lwc1        $f12, 0x0($2)
/* 006D04 01DB2A04 2C44040C */  jal         fptosi
/* 006D08 01DB2A08 00000000 */   nop
/* 006D0C 01DB2A0C 989882AF */  sw          $2, -0x6768($28)
.L01DB2A10_2B8210:
/* 006D10 01DB2A10 DD01013C */  lui         $1, %hi(TEIGI_DebugFlag)
/* 006D14 01DB2A14 B85E318C */  lw          $17, %lo(TEIGI_DebugFlag)($1)
/* 006D18 01DB2A18 06A30046 */  mov.s       $f12, $f20
/* 006D1C 01DB2A1C 2C44040C */  jal         fptosi
/* 006D20 01DB2A20 00000000 */   nop
/* 006D24 01DB2A24 08002216 */  bne         $17, $2, .L01DB2A48_2B8248
/* 006D28 01DB2A28 00000000 */   nop
/* 006D2C 01DB2A2C E101023C */  lui         $2, %hi(argValBuff + 0x4)
/* 006D30 01DB2A30 44244224 */  addiu       $2, $2, %lo(argValBuff + 0x4)
/* 006D34 01DB2A34 21105400 */  addu        $2, $2, $20
/* 006D38 01DB2A38 00004CC4 */  lwc1        $f12, 0x0($2)
/* 006D3C 01DB2A3C 2C44040C */  jal         fptosi
/* 006D40 01DB2A40 00000000 */   nop
/* 006D44 01DB2A44 348A82AF */  sw          $2, -0x75CC($28)
.L01DB2A48_2B8248:
/* 006D48 01DB2A48 DD01013C */  lui         $1, %hi(TEIGI_LEVEL_FAR)
/* 006D4C 01DB2A4C A05E318C */  lw          $17, %lo(TEIGI_LEVEL_FAR)($1)
/* 006D50 01DB2A50 06A30046 */  mov.s       $f12, $f20
/* 006D54 01DB2A54 2C44040C */  jal         fptosi
/* 006D58 01DB2A58 00000000 */   nop
/* 006D5C 01DB2A5C 19002216 */  bne         $17, $2, .L01DB2AC4_2B82C4
/* 006D60 01DB2A60 00000000 */   nop
/* 006D64 01DB2A64 E101023C */  lui         $2, %hi(argValBuff + 0x4)
/* 006D68 01DB2A68 44244224 */  addiu       $2, $2, %lo(argValBuff + 0x4)
/* 006D6C 01DB2A6C 21105400 */  addu        $2, $2, $20
/* 006D70 01DB2A70 000040C4 */  lwc1        $f0, 0x0($2)
/* 006D74 01DB2A74 DD01013C */  lui         $1, %hi(levelOfDitialZ)
/* 006D78 01DB2A78 306120E4 */  swc1        $f0, %lo(levelOfDitialZ)($1)
/* 006D7C 01DB2A7C E101023C */  lui         $2, %hi(argValBuff + 0x8)
/* 006D80 01DB2A80 48244224 */  addiu       $2, $2, %lo(argValBuff + 0x8)
/* 006D84 01DB2A84 21105400 */  addu        $2, $2, $20
/* 006D88 01DB2A88 000040C4 */  lwc1        $f0, 0x0($2)
/* 006D8C 01DB2A8C DD01013C */  lui         $1, %hi(levelOfDitialZ + 0x4)
/* 006D90 01DB2A90 346120E4 */  swc1        $f0, %lo(levelOfDitialZ + 0x4)($1)
/* 006D94 01DB2A94 E101023C */  lui         $2, %hi(argValBuff + 0xC)
/* 006D98 01DB2A98 4C244224 */  addiu       $2, $2, %lo(argValBuff + 0xC)
/* 006D9C 01DB2A9C 21105400 */  addu        $2, $2, $20
/* 006DA0 01DB2AA0 000040C4 */  lwc1        $f0, 0x0($2)
/* 006DA4 01DB2AA4 DD01013C */  lui         $1, %hi(levelOfDitialZ + 0x8)
/* 006DA8 01DB2AA8 386120E4 */  swc1        $f0, %lo(levelOfDitialZ + 0x8)($1)
/* 006DAC 01DB2AAC E101023C */  lui         $2, %hi(argValBuff + 0x10)
/* 006DB0 01DB2AB0 50244224 */  addiu       $2, $2, %lo(argValBuff + 0x10)
/* 006DB4 01DB2AB4 21105400 */  addu        $2, $2, $20
/* 006DB8 01DB2AB8 000040C4 */  lwc1        $f0, 0x0($2)
/* 006DBC 01DB2ABC DD01013C */  lui         $1, %hi(levelOfDitialZ + 0xC)
/* 006DC0 01DB2AC0 3C6120E4 */  swc1        $f0, %lo(levelOfDitialZ + 0xC)($1)
.L01DB2AC4_2B82C4:
/* 006DC4 01DB2AC4 DD01013C */  lui         $1, %hi(TEIGI_WATER_PARAM)
/* 006DC8 01DB2AC8 705E318C */  lw          $17, %lo(TEIGI_WATER_PARAM)($1)
/* 006DCC 01DB2ACC 06A30046 */  mov.s       $f12, $f20
/* 006DD0 01DB2AD0 2C44040C */  jal         fptosi
/* 006DD4 01DB2AD4 00000000 */   nop
/* 006DD8 01DB2AD8 28002216 */  bne         $17, $2, .L01DB2B7C_2B837C
/* 006DDC 01DB2ADC 00000000 */   nop
/* 006DE0 01DB2AE0 E101023C */  lui         $2, %hi(argValBuff + 0x4)
/* 006DE4 01DB2AE4 44244224 */  addiu       $2, $2, %lo(argValBuff + 0x4)
/* 006DE8 01DB2AE8 21105400 */  addu        $2, $2, $20
/* 006DEC 01DB2AEC 00004CC4 */  lwc1        $f12, 0x0($2)
/* 006DF0 01DB2AF0 2C44040C */  jal         fptosi
/* 006DF4 01DB2AF4 00000000 */   nop
/* 006DF8 01DB2AF8 709882AF */  sw          $2, -0x6790($28)
/* 006DFC 01DB2AFC E101023C */  lui         $2, %hi(argValBuff + 0x8)
/* 006E00 01DB2B00 48244224 */  addiu       $2, $2, %lo(argValBuff + 0x8)
/* 006E04 01DB2B04 21105400 */  addu        $2, $2, $20
/* 006E08 01DB2B08 00004CC4 */  lwc1        $f12, 0x0($2)
/* 006E0C 01DB2B0C 2C44040C */  jal         fptosi
/* 006E10 01DB2B10 00000000 */   nop
/* 006E14 01DB2B14 749882AF */  sw          $2, -0x678C($28)
/* 006E18 01DB2B18 E101023C */  lui         $2, %hi(argValBuff + 0xC)
/* 006E1C 01DB2B1C 4C244224 */  addiu       $2, $2, %lo(argValBuff + 0xC)
/* 006E20 01DB2B20 21105400 */  addu        $2, $2, $20
/* 006E24 01DB2B24 000040C4 */  lwc1        $f0, 0x0($2)
/* 006E28 01DB2B28 789880E7 */  swc1        $f0, -0x6788($28)
/* 006E2C 01DB2B2C E101023C */  lui         $2, %hi(argValBuff + 0x10)
/* 006E30 01DB2B30 50244224 */  addiu       $2, $2, %lo(argValBuff + 0x10)
/* 006E34 01DB2B34 21105400 */  addu        $2, $2, $20
/* 006E38 01DB2B38 000040C4 */  lwc1        $f0, 0x0($2)
/* 006E3C 01DB2B3C 7C9880E7 */  swc1        $f0, -0x6784($28)
/* 006E40 01DB2B40 E101023C */  lui         $2, %hi(argValBuff + 0x14)
/* 006E44 01DB2B44 54244224 */  addiu       $2, $2, %lo(argValBuff + 0x14)
/* 006E48 01DB2B48 21105400 */  addu        $2, $2, $20
/* 006E4C 01DB2B4C 000040C4 */  lwc1        $f0, 0x0($2)
/* 006E50 01DB2B50 809880E7 */  swc1        $f0, -0x6780($28)
/* 006E54 01DB2B54 E101023C */  lui         $2, %hi(argValBuff + 0x18)
/* 006E58 01DB2B58 58244224 */  addiu       $2, $2, %lo(argValBuff + 0x18)
/* 006E5C 01DB2B5C 21105400 */  addu        $2, $2, $20
/* 006E60 01DB2B60 000040C4 */  lwc1        $f0, 0x0($2)
/* 006E64 01DB2B64 849880E7 */  swc1        $f0, -0x677C($28)
/* 006E68 01DB2B68 E101023C */  lui         $2, %hi(argValBuff + 0x1C)
/* 006E6C 01DB2B6C 5C244224 */  addiu       $2, $2, %lo(argValBuff + 0x1C)
/* 006E70 01DB2B70 21105400 */  addu        $2, $2, $20
/* 006E74 01DB2B74 000040C4 */  lwc1        $f0, 0x0($2)
/* 006E78 01DB2B78 889880E7 */  swc1        $f0, -0x6778($28)
.L01DB2B7C_2B837C:
/* 006E7C 01DB2B7C DD01013C */  lui         $1, %hi(TEIGI_WATER_SET)
/* 006E80 01DB2B80 305E318C */  lw          $17, %lo(TEIGI_WATER_SET)($1)
/* 006E84 01DB2B84 06A30046 */  mov.s       $f12, $f20
/* 006E88 01DB2B88 2C44040C */  jal         fptosi
/* 006E8C 01DB2B8C 00000000 */   nop
/* 006E90 01DB2B90 33002216 */  bne         $17, $2, .L01DB2C60_2B8460
/* 006E94 01DB2B94 00000000 */   nop
/* 006E98 01DB2B98 E101023C */  lui         $2, %hi(argValBuff + 0x4)
/* 006E9C 01DB2B9C 44244224 */  addiu       $2, $2, %lo(argValBuff + 0x4)
/* 006EA0 01DB2BA0 21185400 */  addu        $3, $2, $20
/* 006EA4 01DB2BA4 0040023C */  lui         $2, (0x40000000 >> 16)
/* 006EA8 01DB2BA8 00088244 */  mtc1        $2, $f1
/* 006EAC 01DB2BAC 000060C4 */  lwc1        $f0, 0x0($3)
/* 006EB0 01DB2BB0 83000146 */  div.s       $f2, $f0, $f1
/* 006EB4 01DB2BB4 E101023C */  lui         $2, %hi(argValBuff + 0x8)
/* 006EB8 01DB2BB8 48244224 */  addiu       $2, $2, %lo(argValBuff + 0x8)
/* 006EBC 01DB2BBC 21105400 */  addu        $2, $2, $20
/* 006EC0 01DB2BC0 000040C4 */  lwc1        $f0, 0x0($2)
/* 006EC4 01DB2BC4 03000146 */  div.s       $f0, $f0, $f1
/* 006EC8 01DB2BC8 C7100046 */  neg.s       $f3, $f2
/* 006ECC 01DB2BCC E101013C */  lui         $1, %hi(WaterV1)
/* 006ED0 01DB2BD0 C0E523E4 */  swc1        $f3, %lo(WaterV1)($1)
/* 006ED4 01DB2BD4 47000046 */  neg.s       $f1, $f0
/* 006ED8 01DB2BD8 E101013C */  lui         $1, %hi(WaterV1 + 0x8)
/* 006EDC 01DB2BDC C8E521E4 */  swc1        $f1, %lo(WaterV1 + 0x8)($1)
/* 006EE0 01DB2BE0 E101013C */  lui         $1, %hi(WaterV2)
/* 006EE4 01DB2BE4 D0E522E4 */  swc1        $f2, %lo(WaterV2)($1)
/* 006EE8 01DB2BE8 E101013C */  lui         $1, %hi(WaterV2 + 0x8)
/* 006EEC 01DB2BEC D8E521E4 */  swc1        $f1, %lo(WaterV2 + 0x8)($1)
/* 006EF0 01DB2BF0 E101013C */  lui         $1, %hi(WaterV3)
/* 006EF4 01DB2BF4 E0E523E4 */  swc1        $f3, %lo(WaterV3)($1)
/* 006EF8 01DB2BF8 E101013C */  lui         $1, %hi(WaterV3 + 0x8)
/* 006EFC 01DB2BFC E8E520E4 */  swc1        $f0, %lo(WaterV3 + 0x8)($1)
/* 006F00 01DB2C00 E101013C */  lui         $1, %hi(WaterV4)
/* 006F04 01DB2C04 F0E522E4 */  swc1        $f2, %lo(WaterV4)($1)
/* 006F08 01DB2C08 E101013C */  lui         $1, %hi(WaterV4 + 0x8)
/* 006F0C 01DB2C0C F8E520E4 */  swc1        $f0, %lo(WaterV4 + 0x8)($1)
/* 006F10 01DB2C10 E101023C */  lui         $2, %hi(argValBuff + 0xC)
/* 006F14 01DB2C14 4C244224 */  addiu       $2, $2, %lo(argValBuff + 0xC)
/* 006F18 01DB2C18 21105400 */  addu        $2, $2, $20
/* 006F1C 01DB2C1C 000040C4 */  lwc1        $f0, 0x0($2)
/* 006F20 01DB2C20 E101013C */  lui         $1, %hi(WaterPos)
/* 006F24 01DB2C24 00E620E4 */  swc1        $f0, %lo(WaterPos)($1)
/* 006F28 01DB2C28 E101023C */  lui         $2, %hi(argValBuff + 0x10)
/* 006F2C 01DB2C2C 50244224 */  addiu       $2, $2, %lo(argValBuff + 0x10)
/* 006F30 01DB2C30 21105400 */  addu        $2, $2, $20
/* 006F34 01DB2C34 000040C4 */  lwc1        $f0, 0x0($2)
/* 006F38 01DB2C38 E101013C */  lui         $1, %hi(WaterPos + 0x4)
/* 006F3C 01DB2C3C 04E620E4 */  swc1        $f0, %lo(WaterPos + 0x4)($1)
/* 006F40 01DB2C40 E101023C */  lui         $2, %hi(argValBuff + 0x14)
/* 006F44 01DB2C44 54244224 */  addiu       $2, $2, %lo(argValBuff + 0x14)
/* 006F48 01DB2C48 21105400 */  addu        $2, $2, $20
/* 006F4C 01DB2C4C 000040C4 */  lwc1        $f0, 0x0($2)
/* 006F50 01DB2C50 E101013C */  lui         $1, %hi(WaterPos + 0x8)
/* 006F54 01DB2C54 08E620E4 */  swc1        $f0, %lo(WaterPos + 0x8)($1)
/* 006F58 01DB2C58 01000224 */  addiu       $2, $0, 0x1
/* 006F5C 01DB2C5C 6C9882AF */  sw          $2, -0x6794($28)
.L01DB2C60_2B8460:
/* 006F60 01DB2C60 DD01013C */  lui         $1, %hi(TEIGI_WATER_RGB)
/* 006F64 01DB2C64 505E318C */  lw          $17, %lo(TEIGI_WATER_RGB)($1)
/* 006F68 01DB2C68 06A30046 */  mov.s       $f12, $f20
/* 006F6C 01DB2C6C 2C44040C */  jal         fptosi
/* 006F70 01DB2C70 00000000 */   nop
/* 006F74 01DB2C74 16002216 */  bne         $17, $2, .L01DB2CD0_2B84D0
/* 006F78 01DB2C78 00000000 */   nop
/* 006F7C 01DB2C7C E101023C */  lui         $2, %hi(argValBuff + 0x4)
/* 006F80 01DB2C80 44244224 */  addiu       $2, $2, %lo(argValBuff + 0x4)
/* 006F84 01DB2C84 21105400 */  addu        $2, $2, $20
/* 006F88 01DB2C88 00004CC4 */  lwc1        $f12, 0x0($2)
/* 006F8C 01DB2C8C 5044040C */  jal         fptoui
/* 006F90 01DB2C90 00000000 */   nop
/* 006F94 01DB2C94 609882A3 */  sb          $2, -0x67A0($28)
/* 006F98 01DB2C98 E101023C */  lui         $2, %hi(argValBuff + 0x8)
/* 006F9C 01DB2C9C 48244224 */  addiu       $2, $2, %lo(argValBuff + 0x8)
/* 006FA0 01DB2CA0 21105400 */  addu        $2, $2, $20
/* 006FA4 01DB2CA4 00004CC4 */  lwc1        $f12, 0x0($2)
/* 006FA8 01DB2CA8 5044040C */  jal         fptoui
/* 006FAC 01DB2CAC 00000000 */   nop
/* 006FB0 01DB2CB0 649882A3 */  sb          $2, -0x679C($28)
/* 006FB4 01DB2CB4 E101023C */  lui         $2, %hi(argValBuff + 0xC)
/* 006FB8 01DB2CB8 4C244224 */  addiu       $2, $2, %lo(argValBuff + 0xC)
/* 006FBC 01DB2CBC 21105400 */  addu        $2, $2, $20
/* 006FC0 01DB2CC0 00004CC4 */  lwc1        $f12, 0x0($2)
/* 006FC4 01DB2CC4 5044040C */  jal         fptoui
/* 006FC8 01DB2CC8 00000000 */   nop
/* 006FCC 01DB2CCC 689882A3 */  sb          $2, -0x6798($28)
.L01DB2CD0_2B84D0:
/* 006FD0 01DB2CD0 DD01013C */  lui         $1, %hi(TEIGI_RUN_SPEED)
/* 006FD4 01DB2CD4 E85D318C */  lw          $17, %lo(TEIGI_RUN_SPEED)($1)
/* 006FD8 01DB2CD8 06A30046 */  mov.s       $f12, $f20
/* 006FDC 01DB2CDC 2C44040C */  jal         fptosi
/* 006FE0 01DB2CE0 00000000 */   nop
/* 006FE4 01DB2CE4 06002216 */  bne         $17, $2, .L01DB2D00_2B8500
/* 006FE8 01DB2CE8 00000000 */   nop
/* 006FEC 01DB2CEC E101023C */  lui         $2, %hi(argValBuff + 0x4)
/* 006FF0 01DB2CF0 44244224 */  addiu       $2, $2, %lo(argValBuff + 0x4)
/* 006FF4 01DB2CF4 21105400 */  addu        $2, $2, $20
/* 006FF8 01DB2CF8 000040C4 */  lwc1        $f0, 0x0($2)
/* 006FFC 01DB2CFC 388A80E7 */  swc1        $f0, -0x75C8($28)
.L01DB2D00_2B8500:
/* 007000 01DB2D00 DD01013C */  lui         $1, %hi(TEIGI_NORMALCLIP_OFF)
/* 007004 01DB2D04 D85D318C */  lw          $17, %lo(TEIGI_NORMALCLIP_OFF)($1)
/* 007008 01DB2D08 06A30046 */  mov.s       $f12, $f20
/* 00700C 01DB2D0C 2C44040C */  jal         fptosi
/* 007010 01DB2D10 00000000 */   nop
/* 007014 01DB2D14 10002216 */  bne         $17, $2, .L01DB2D58_2B8558
/* 007018 01DB2D18 00000000 */   nop
/* 00701C 01DB2D1C E101023C */  lui         $2, %hi(argValBuff + 0x4)
/* 007020 01DB2D20 44244224 */  addiu       $2, $2, %lo(argValBuff + 0x4)
/* 007024 01DB2D24 21105400 */  addu        $2, $2, $20
/* 007028 01DB2D28 000041C4 */  lwc1        $f1, 0x0($2)
/* 00702C 01DB2D2C 00008044 */  mtc1        $0, $f0
/* 007030 01DB2D30 00000000 */  nop
/* 007034 01DB2D34 32000146 */  c.eq.s      $f0, $f1
/* 007038 01DB2D38 00000000 */  nop
/* 00703C 01DB2D3C 04000045 */  bc1f        .L01DB2D50_2B8550
/* 007040 01DB2D40 00000000 */   nop
/* 007044 01DB2D44 0000C0A3 */  sb          $0, 0x0($30)
/* 007048 01DB2D48 03000010 */  b           .L01DB2D58_2B8558
/* 00704C 01DB2D4C 00000000 */   nop
.L01DB2D50_2B8550:
/* 007050 01DB2D50 01000224 */  addiu       $2, $0, 0x1
/* 007054 01DB2D54 0000C2A3 */  sb          $2, 0x0($30)
.L01DB2D58_2B8558:
/* 007058 01DB2D58 DD01013C */  lui         $1, %hi(TEIGI_BG_COL2)
/* 00705C 01DB2D5C A05D318C */  lw          $17, %lo(TEIGI_BG_COL2)($1)
/* 007060 01DB2D60 06A30046 */  mov.s       $f12, $f20
/* 007064 01DB2D64 2C44040C */  jal         fptosi
/* 007068 01DB2D68 00000000 */   nop
/* 00706C 01DB2D6C 43002216 */  bne         $17, $2, .L01DB2E7C_2B867C
/* 007070 01DB2D70 00000000 */   nop
/* 007074 01DB2D74 E101023C */  lui         $2, %hi(argValBuff + 0x4)
/* 007078 01DB2D78 44244224 */  addiu       $2, $2, %lo(argValBuff + 0x4)
/* 00707C 01DB2D7C 21105400 */  addu        $2, $2, $20
/* 007080 01DB2D80 00004CC4 */  lwc1        $f12, 0x0($2)
/* 007084 01DB2D84 5044040C */  jal         fptoui
/* 007088 01DB2D88 00000000 */   nop
/* 00708C 01DB2D8C 06004004 */  bltz        $2, .L01DB2DA8_2B85A8
/* 007090 01DB2D90 00000000 */   nop
/* 007094 01DB2D94 00008244 */  mtc1        $2, $f0
/* 007098 01DB2D98 00000000 */  nop
/* 00709C 01DB2D9C 60058046 */  cvt.s.w     $f21, $f0
/* 0070A0 01DB2DA0 08000010 */  b           .L01DB2DC4_2B85C4
/* 0070A4 01DB2DA4 00000000 */   nop
.L01DB2DA8_2B85A8:
/* 0070A8 01DB2DA8 42180200 */  srl         $3, $2, 1
/* 0070AC 01DB2DAC 01004230 */  andi        $2, $2, 0x1
/* 0070B0 01DB2DB0 25186200 */  or          $3, $3, $2
/* 0070B4 01DB2DB4 00008344 */  mtc1        $3, $f0
/* 0070B8 01DB2DB8 00000000 */  nop
/* 0070BC 01DB2DBC 60058046 */  cvt.s.w     $f21, $f0
/* 0070C0 01DB2DC0 40AD1546 */  add.s       $f21, $f21, $f21
.L01DB2DC4_2B85C4:
/* 0070C4 01DB2DC4 E101023C */  lui         $2, %hi(argValBuff + 0x8)
/* 0070C8 01DB2DC8 48244224 */  addiu       $2, $2, %lo(argValBuff + 0x8)
/* 0070CC 01DB2DCC 21105400 */  addu        $2, $2, $20
/* 0070D0 01DB2DD0 00004CC4 */  lwc1        $f12, 0x0($2)
/* 0070D4 01DB2DD4 5044040C */  jal         fptoui
/* 0070D8 01DB2DD8 00000000 */   nop
/* 0070DC 01DB2DDC 06004004 */  bltz        $2, .L01DB2DF8_2B85F8
/* 0070E0 01DB2DE0 00000000 */   nop
/* 0070E4 01DB2DE4 00008244 */  mtc1        $2, $f0
/* 0070E8 01DB2DE8 00000000 */  nop
/* 0070EC 01DB2DEC 20058046 */  cvt.s.w     $f20, $f0
/* 0070F0 01DB2DF0 08000010 */  b           .L01DB2E14_2B8614
/* 0070F4 01DB2DF4 00000000 */   nop
.L01DB2DF8_2B85F8:
/* 0070F8 01DB2DF8 42180200 */  srl         $3, $2, 1
/* 0070FC 01DB2DFC 01004230 */  andi        $2, $2, 0x1
/* 007100 01DB2E00 25186200 */  or          $3, $3, $2
/* 007104 01DB2E04 00008344 */  mtc1        $3, $f0
/* 007108 01DB2E08 00000000 */  nop
/* 00710C 01DB2E0C 20058046 */  cvt.s.w     $f20, $f0
/* 007110 01DB2E10 00A51446 */  add.s       $f20, $f20, $f20
.L01DB2E14_2B8614:
/* 007114 01DB2E14 E101023C */  lui         $2, %hi(argValBuff + 0xC)
/* 007118 01DB2E18 4C244224 */  addiu       $2, $2, %lo(argValBuff + 0xC)
/* 00711C 01DB2E1C 21105400 */  addu        $2, $2, $20
/* 007120 01DB2E20 00004CC4 */  lwc1        $f12, 0x0($2)
/* 007124 01DB2E24 5044040C */  jal         fptoui
/* 007128 01DB2E28 00000000 */   nop
/* 00712C 01DB2E2C 06004004 */  bltz        $2, .L01DB2E48_2B8648
/* 007130 01DB2E30 00000000 */   nop
/* 007134 01DB2E34 00008244 */  mtc1        $2, $f0
/* 007138 01DB2E38 00000000 */  nop
/* 00713C 01DB2E3C A0038046 */  cvt.s.w     $f14, $f0
/* 007140 01DB2E40 08000010 */  b           .L01DB2E64_2B8664
/* 007144 01DB2E44 00000000 */   nop
.L01DB2E48_2B8648:
/* 007148 01DB2E48 42180200 */  srl         $3, $2, 1
/* 00714C 01DB2E4C 01004230 */  andi        $2, $2, 0x1
/* 007150 01DB2E50 25186200 */  or          $3, $3, $2
/* 007154 01DB2E54 00008344 */  mtc1        $3, $f0
/* 007158 01DB2E58 00000000 */  nop
/* 00715C 01DB2E5C A0038046 */  cvt.s.w     $f14, $f0
/* 007160 01DB2E60 80730E46 */  add.s       $f14, $f14, $f14
.L01DB2E64_2B8664:
/* 007164 01DB2E64 0043023C */  lui         $2, (0x43000000 >> 16)
/* 007168 01DB2E68 00788244 */  mtc1        $2, $f15
/* 00716C 01DB2E6C 06AB0046 */  mov.s       $f12, $f21
/* 007170 01DB2E70 46A30046 */  mov.s       $f13, $f20
/* 007174 01DB2E74 24B8040C */  jal         MGSetBGColor__Fffff
/* 007178 01DB2E78 00000000 */   nop
.L01DB2E7C_2B867C:
/* 00717C 01DB2E7C DD01013C */  lui         $1, %hi(TEIGI_BG_COL)
/* 007180 01DB2E80 C05D318C */  lw          $17, %lo(TEIGI_BG_COL)($1)
/* 007184 01DB2E84 0000ACC6 */  lwc1        $f12, 0x0($21)
/* 007188 01DB2E88 2C44040C */  jal         fptosi
/* 00718C 01DB2E8C 00000000 */   nop
/* 007190 01DB2E90 43002216 */  bne         $17, $2, .L01DB2FA0_2B87A0
/* 007194 01DB2E94 00000000 */   nop
/* 007198 01DB2E98 E101023C */  lui         $2, %hi(argValBuff + 0x4)
/* 00719C 01DB2E9C 44244224 */  addiu       $2, $2, %lo(argValBuff + 0x4)
/* 0071A0 01DB2EA0 21105400 */  addu        $2, $2, $20
/* 0071A4 01DB2EA4 00004CC4 */  lwc1        $f12, 0x0($2)
/* 0071A8 01DB2EA8 5044040C */  jal         fptoui
/* 0071AC 01DB2EAC 00000000 */   nop
/* 0071B0 01DB2EB0 06004004 */  bltz        $2, .L01DB2ECC_2B86CC
/* 0071B4 01DB2EB4 00000000 */   nop
/* 0071B8 01DB2EB8 00008244 */  mtc1        $2, $f0
/* 0071BC 01DB2EBC 00000000 */  nop
/* 0071C0 01DB2EC0 60058046 */  cvt.s.w     $f21, $f0
/* 0071C4 01DB2EC4 08000010 */  b           .L01DB2EE8_2B86E8
/* 0071C8 01DB2EC8 00000000 */   nop
.L01DB2ECC_2B86CC:
/* 0071CC 01DB2ECC 42180200 */  srl         $3, $2, 1
/* 0071D0 01DB2ED0 01004230 */  andi        $2, $2, 0x1
/* 0071D4 01DB2ED4 25186200 */  or          $3, $3, $2
/* 0071D8 01DB2ED8 00008344 */  mtc1        $3, $f0
/* 0071DC 01DB2EDC 00000000 */  nop
/* 0071E0 01DB2EE0 60058046 */  cvt.s.w     $f21, $f0
/* 0071E4 01DB2EE4 40AD1546 */  add.s       $f21, $f21, $f21
.L01DB2EE8_2B86E8:
/* 0071E8 01DB2EE8 E101023C */  lui         $2, %hi(argValBuff + 0x8)
/* 0071EC 01DB2EEC 48244224 */  addiu       $2, $2, %lo(argValBuff + 0x8)
/* 0071F0 01DB2EF0 21105400 */  addu        $2, $2, $20
/* 0071F4 01DB2EF4 00004CC4 */  lwc1        $f12, 0x0($2)
/* 0071F8 01DB2EF8 5044040C */  jal         fptoui
/* 0071FC 01DB2EFC 00000000 */   nop
/* 007200 01DB2F00 06004004 */  bltz        $2, .L01DB2F1C_2B871C
/* 007204 01DB2F04 00000000 */   nop
/* 007208 01DB2F08 00008244 */  mtc1        $2, $f0
/* 00720C 01DB2F0C 00000000 */  nop
/* 007210 01DB2F10 20058046 */  cvt.s.w     $f20, $f0
/* 007214 01DB2F14 08000010 */  b           .L01DB2F38_2B8738
/* 007218 01DB2F18 00000000 */   nop
.L01DB2F1C_2B871C:
/* 00721C 01DB2F1C 42180200 */  srl         $3, $2, 1
/* 007220 01DB2F20 01004230 */  andi        $2, $2, 0x1
/* 007224 01DB2F24 25186200 */  or          $3, $3, $2
/* 007228 01DB2F28 00008344 */  mtc1        $3, $f0
/* 00722C 01DB2F2C 00000000 */  nop
/* 007230 01DB2F30 20058046 */  cvt.s.w     $f20, $f0
/* 007234 01DB2F34 00A51446 */  add.s       $f20, $f20, $f20
.L01DB2F38_2B8738:
/* 007238 01DB2F38 E101023C */  lui         $2, %hi(argValBuff + 0xC)
/* 00723C 01DB2F3C 4C244224 */  addiu       $2, $2, %lo(argValBuff + 0xC)
/* 007240 01DB2F40 21105400 */  addu        $2, $2, $20
/* 007244 01DB2F44 00004CC4 */  lwc1        $f12, 0x0($2)
/* 007248 01DB2F48 5044040C */  jal         fptoui
/* 00724C 01DB2F4C 00000000 */   nop
/* 007250 01DB2F50 06004004 */  bltz        $2, .L01DB2F6C_2B876C
/* 007254 01DB2F54 00000000 */   nop
/* 007258 01DB2F58 00008244 */  mtc1        $2, $f0
/* 00725C 01DB2F5C 00000000 */  nop
/* 007260 01DB2F60 A0038046 */  cvt.s.w     $f14, $f0
/* 007264 01DB2F64 08000010 */  b           .L01DB2F88_2B8788
/* 007268 01DB2F68 00000000 */   nop
.L01DB2F6C_2B876C:
/* 00726C 01DB2F6C 42180200 */  srl         $3, $2, 1
/* 007270 01DB2F70 01004230 */  andi        $2, $2, 0x1
/* 007274 01DB2F74 25186200 */  or          $3, $3, $2
/* 007278 01DB2F78 00008344 */  mtc1        $3, $f0
/* 00727C 01DB2F7C 00000000 */  nop
/* 007280 01DB2F80 A0038046 */  cvt.s.w     $f14, $f0
/* 007284 01DB2F84 80730E46 */  add.s       $f14, $f14, $f14
.L01DB2F88_2B8788:
/* 007288 01DB2F88 0043023C */  lui         $2, (0x43000000 >> 16)
/* 00728C 01DB2F8C 00788244 */  mtc1        $2, $f15
/* 007290 01DB2F90 06AB0046 */  mov.s       $f12, $f21
/* 007294 01DB2F94 46A30046 */  mov.s       $f13, $f20
/* 007298 01DB2F98 24B8040C */  jal         MGSetBGColor__Fffff
/* 00729C 01DB2F9C 00000000 */   nop
.L01DB2FA0_2B87A0:
/* 0072A0 01DB2FA0 DD01013C */  lui         $1, %hi(TEIGI_FARCLIP)
/* 0072A4 01DB2FA4 885D318C */  lw          $17, %lo(TEIGI_FARCLIP)($1)
/* 0072A8 01DB2FA8 0000B4C6 */  lwc1        $f20, 0x0($21)
/* 0072AC 01DB2FAC 06A30046 */  mov.s       $f12, $f20
/* 0072B0 01DB2FB0 2C44040C */  jal         fptosi
/* 0072B4 01DB2FB4 00000000 */   nop
/* 0072B8 01DB2FB8 08002216 */  bne         $17, $2, .L01DB2FDC_2B87DC
/* 0072BC 01DB2FBC 00000000 */   nop
/* 0072C0 01DB2FC0 01000224 */  addiu       $2, $0, 0x1
/* 0072C4 01DB2FC4 1D01A2A3 */  sb          $2, 0x11D($29)
/* 0072C8 01DB2FC8 E101023C */  lui         $2, %hi(argValBuff + 0x4)
/* 0072CC 01DB2FCC 44244224 */  addiu       $2, $2, %lo(argValBuff + 0x4)
/* 0072D0 01DB2FD0 21105400 */  addu        $2, $2, $20
/* 0072D4 01DB2FD4 000040C4 */  lwc1        $f0, 0x0($2)
/* 0072D8 01DB2FD8 2001A0E7 */  swc1        $f0, 0x120($29)
.L01DB2FDC_2B87DC:
/* 0072DC 01DB2FDC DD01013C */  lui         $1, %hi(TEIGI_LIGHT_COL)
/* 0072E0 01DB2FE0 605D318C */  lw          $17, %lo(TEIGI_LIGHT_COL)($1)
/* 0072E4 01DB2FE4 06A30046 */  mov.s       $f12, $f20
/* 0072E8 01DB2FE8 2C44040C */  jal         fptosi
/* 0072EC 01DB2FEC 00000000 */   nop
/* 0072F0 01DB2FF0 4D002216 */  bne         $17, $2, .L01DB3128_2B8928
/* 0072F4 01DB2FF4 00000000 */   nop
/* 0072F8 01DB2FF8 E101023C */  lui         $2, %hi(argValBuff + 0x1C)
/* 0072FC 01DB2FFC 5C244224 */  addiu       $2, $2, %lo(argValBuff + 0x1C)
/* 007300 01DB3000 21105400 */  addu        $2, $2, $20
/* 007304 01DB3004 00004CC4 */  lwc1        $f12, 0x0($2)
/* 007308 01DB3008 2C44040C */  jal         fptosi
/* 00730C 01DB300C 00000000 */   nop
/* 007310 01DB3010 288E4070 */  paddub      $17, $2, $0
/* 007314 01DB3014 E101023C */  lui         $2, %hi(argValBuff + 0x4)
/* 007318 01DB3018 44244224 */  addiu       $2, $2, %lo(argValBuff + 0x4)
/* 00731C 01DB301C 21105400 */  addu        $2, $2, $20
/* 007320 01DB3020 000040C4 */  lwc1        $f0, 0x0($2)
/* 007324 01DB3024 8003A0E7 */  swc1        $f0, 0x380($29)
/* 007328 01DB3028 E101023C */  lui         $2, %hi(argValBuff + 0x8)
/* 00732C 01DB302C 48244224 */  addiu       $2, $2, %lo(argValBuff + 0x8)
/* 007330 01DB3030 21105400 */  addu        $2, $2, $20
/* 007334 01DB3034 000040C4 */  lwc1        $f0, 0x0($2)
/* 007338 01DB3038 8403B627 */  addiu       $22, $29, 0x384
/* 00733C 01DB303C 0000C0E6 */  swc1        $f0, 0x0($22)
/* 007340 01DB3040 E101023C */  lui         $2, %hi(argValBuff + 0xC)
/* 007344 01DB3044 4C244224 */  addiu       $2, $2, %lo(argValBuff + 0xC)
/* 007348 01DB3048 21105400 */  addu        $2, $2, $20
/* 00734C 01DB304C 000040C4 */  lwc1        $f0, 0x0($2)
/* 007350 01DB3050 8803B327 */  addiu       $19, $29, 0x388
/* 007354 01DB3054 000060E6 */  swc1        $f0, 0x0($19)
/* 007358 01DB3058 8003A427 */  addiu       $4, $29, 0x380
/* 00735C 01DB305C 282E8070 */  paddub      $5, $4, $0
/* 007360 01DB3060 9285040C */  jal         sceVu0Normalize
/* 007364 01DB3064 00000000 */   nop
/* 007368 01DB3068 8003A0C7 */  lwc1        $f0, 0x380($29)
/* 00736C 01DB306C FFFF2326 */  addiu       $3, $17, -0x1
/* 007370 01DB3070 80200300 */  sll         $4, $3, 2
/* 007374 01DB3074 2500023C */  lui         $2, %hi(light)
/* 007378 01DB3078 801B4224 */  addiu       $2, $2, %lo(light)
/* 00737C 01DB307C 21104400 */  addu        $2, $2, $4
/* 007380 01DB3080 000040E4 */  swc1        $f0, 0x0($2)
/* 007384 01DB3084 0000C0C6 */  lwc1        $f0, 0x0($22)
/* 007388 01DB3088 2500023C */  lui         $2, %hi(light + 0x10)
/* 00738C 01DB308C 901B4224 */  addiu       $2, $2, %lo(light + 0x10)
/* 007390 01DB3090 21104400 */  addu        $2, $2, $4
/* 007394 01DB3094 000040E4 */  swc1        $f0, 0x0($2)
/* 007398 01DB3098 000060C6 */  lwc1        $f0, 0x0($19)
/* 00739C 01DB309C 2500023C */  lui         $2, %hi(light + 0x20)
/* 0073A0 01DB30A0 A01B4224 */  addiu       $2, $2, %lo(light + 0x20)
/* 0073A4 01DB30A4 21104400 */  addu        $2, $2, $4
/* 0073A8 01DB30A8 000040E4 */  swc1        $f0, 0x0($2)
/* 0073AC 01DB30AC E101023C */  lui         $2, %hi(argValBuff + 0x10)
/* 0073B0 01DB30B0 50244224 */  addiu       $2, $2, %lo(argValBuff + 0x10)
/* 0073B4 01DB30B4 21105400 */  addu        $2, $2, $20
/* 0073B8 01DB30B8 000040C4 */  lwc1        $f0, 0x0($2)
/* 0073BC 01DB30BC 00190300 */  sll         $3, $3, 4
/* 0073C0 01DB30C0 2500023C */  lui         $2, %hi(lightcolor)
/* 0073C4 01DB30C4 C01B4224 */  addiu       $2, $2, %lo(lightcolor)
/* 0073C8 01DB30C8 21104300 */  addu        $2, $2, $3
/* 0073CC 01DB30CC 000040E4 */  swc1        $f0, 0x0($2)
/* 0073D0 01DB30D0 E101023C */  lui         $2, %hi(argValBuff + 0x14)
/* 0073D4 01DB30D4 54244224 */  addiu       $2, $2, %lo(argValBuff + 0x14)
/* 0073D8 01DB30D8 21105400 */  addu        $2, $2, $20
/* 0073DC 01DB30DC 000040C4 */  lwc1        $f0, 0x0($2)
/* 0073E0 01DB30E0 2500023C */  lui         $2, %hi(lightcolor + 0x4)
/* 0073E4 01DB30E4 C41B4224 */  addiu       $2, $2, %lo(lightcolor + 0x4)
/* 0073E8 01DB30E8 21104300 */  addu        $2, $2, $3
/* 0073EC 01DB30EC 000040E4 */  swc1        $f0, 0x0($2)
/* 0073F0 01DB30F0 E101023C */  lui         $2, %hi(argValBuff + 0x18)
/* 0073F4 01DB30F4 58244224 */  addiu       $2, $2, %lo(argValBuff + 0x18)
/* 0073F8 01DB30F8 21105400 */  addu        $2, $2, $20
/* 0073FC 01DB30FC 000040C4 */  lwc1        $f0, 0x0($2)
/* 007400 01DB3100 2500023C */  lui         $2, %hi(lightcolor + 0x8)
/* 007404 01DB3104 C81B4224 */  addiu       $2, $2, %lo(lightcolor + 0x8)
/* 007408 01DB3108 21104300 */  addu        $2, $2, $3
/* 00740C 01DB310C 000040E4 */  swc1        $f0, 0x0($2)
/* 007410 01DB3110 2500023C */  lui         $2, %hi(light)
/* 007414 01DB3114 801B4424 */  addiu       $4, $2, %lo(light)
/* 007418 01DB3118 2500023C */  lui         $2, %hi(lightcolor)
/* 00741C 01DB311C C01B4524 */  addiu       $5, $2, %lo(lightcolor)
/* 007420 01DB3120 08B7040C */  jal         MGSetPLight__FPA4_fPA4_f
/* 007424 01DB3124 00000000 */   nop
.L01DB3128_2B8928:
/* 007428 01DB3128 DD01013C */  lui         $1, %hi(TEIGI_AMBIENT)
/* 00742C 01DB312C 405D318C */  lw          $17, %lo(TEIGI_AMBIENT)($1)
/* 007430 01DB3130 0000ACC6 */  lwc1        $f12, 0x0($21)
/* 007434 01DB3134 2C44040C */  jal         fptosi
/* 007438 01DB3138 00000000 */   nop
/* 00743C 01DB313C 17002216 */  bne         $17, $2, .L01DB319C_2B899C
/* 007440 01DB3140 00000000 */   nop
/* 007444 01DB3144 E101023C */  lui         $2, %hi(argValBuff + 0x4)
/* 007448 01DB3148 44244224 */  addiu       $2, $2, %lo(argValBuff + 0x4)
/* 00744C 01DB314C 21105400 */  addu        $2, $2, $20
/* 007450 01DB3150 000040C4 */  lwc1        $f0, 0x0($2)
/* 007454 01DB3154 2500013C */  lui         $1, %hi(ambientlight)
/* 007458 01DB3158 001C20E4 */  swc1        $f0, %lo(ambientlight)($1)
/* 00745C 01DB315C E101023C */  lui         $2, %hi(argValBuff + 0x8)
/* 007460 01DB3160 48244224 */  addiu       $2, $2, %lo(argValBuff + 0x8)
/* 007464 01DB3164 21105400 */  addu        $2, $2, $20
/* 007468 01DB3168 000040C4 */  lwc1        $f0, 0x0($2)
/* 00746C 01DB316C 2500013C */  lui         $1, %hi(ambientlight + 0x4)
/* 007470 01DB3170 041C20E4 */  swc1        $f0, %lo(ambientlight + 0x4)($1)
/* 007474 01DB3174 E101023C */  lui         $2, %hi(argValBuff + 0xC)
/* 007478 01DB3178 4C244224 */  addiu       $2, $2, %lo(argValBuff + 0xC)
/* 00747C 01DB317C 21105400 */  addu        $2, $2, $20
/* 007480 01DB3180 000040C4 */  lwc1        $f0, 0x0($2)
/* 007484 01DB3184 2500013C */  lui         $1, %hi(ambientlight + 0x8)
/* 007488 01DB3188 081C20E4 */  swc1        $f0, %lo(ambientlight + 0x8)($1)
/* 00748C 01DB318C 2500023C */  lui         $2, %hi(ambientlight)
/* 007490 01DB3190 001C4424 */  addiu       $4, $2, %lo(ambientlight)
/* 007494 01DB3194 40B7040C */  jal         MGSetAmbient__FPf
/* 007498 01DB3198 00000000 */   nop
.L01DB319C_2B899C:
/* 00749C 01DB319C DD01013C */  lui         $1, %hi(TEIGI_CRD)
/* 0074A0 01DB31A0 E85C318C */  lw          $17, %lo(TEIGI_CRD)($1)
/* 0074A4 01DB31A4 0000ACC6 */  lwc1        $f12, 0x0($21)
/* 0074A8 01DB31A8 2C44040C */  jal         fptosi
/* 0074AC 01DB31AC 00000000 */   nop
/* 0074B0 01DB31B0 16002216 */  bne         $17, $2, .L01DB320C_2B8A0C
/* 0074B4 01DB31B4 00000000 */   nop
/* 0074B8 01DB31B8 7001A427 */  addiu       $4, $29, 0x170
/* 0074BC 01DB31BC DE01023C */  lui         $2, %hi(LIT_965)
/* 0074C0 01DB31C0 E0D94524 */  addiu       $5, $2, %lo(LIT_965)
/* 0074C4 01DB31C4 5A15040C */  jal         strcpy
/* 0074C8 01DB31C8 00000000 */   nop
/* 0074CC 01DB31CC 80191000 */  sll         $3, $16, 6
/* 0074D0 01DB31D0 E101023C */  lui         $2, %hi(argStrBuff)
/* 0074D4 01DB31D4 40044224 */  addiu       $2, $2, %lo(argStrBuff)
/* 0074D8 01DB31D8 21284300 */  addu        $5, $2, $3
/* 0074DC 01DB31DC 7001A427 */  addiu       $4, $29, 0x170
/* 0074E0 01DB31E0 BC14040C */  jal         strcat
/* 0074E4 01DB31E4 00000000 */   nop
/* 0074E8 01DB31E8 948B858F */  lw          $5, -0x746C($28)
/* 0074EC 01DB31EC 7001A427 */  addiu       $4, $29, 0x170
/* 0074F0 01DB31F0 28360070 */  paddub      $6, $0, $0
/* 0074F4 01DB31F4 D8FC040C */  jal         LoadFile__FPcPvPi
/* 0074F8 01DB31F8 00000000 */   nop
/* 0074FC 01DB31FC 948B848F */  lw          $4, -0x746C($28)
/* 007500 01DB3200 009E040C */  jal         LoadCollisionFile__FPUi
/* 007504 01DB3204 00000000 */   nop
/* 007508 01DB3208 BC9882AF */  sw          $2, -0x6744($28)
.L01DB320C_2B8A0C:
/* 00750C 01DB320C DD01013C */  lui         $1, %hi(TEIGI_FOG)
/* 007510 01DB3210 105D318C */  lw          $17, %lo(TEIGI_FOG)($1)
/* 007514 01DB3214 0000ACC6 */  lwc1        $f12, 0x0($21)
/* 007518 01DB3218 2C44040C */  jal         fptosi
/* 00751C 01DB321C 00000000 */   nop
/* 007520 01DB3220 3D002216 */  bne         $17, $2, .L01DB3318_2B8B18
/* 007524 01DB3224 00000000 */   nop
/* 007528 01DB3228 E101023C */  lui         $2, %hi(argValBuff + 0x4)
/* 00752C 01DB322C 44244224 */  addiu       $2, $2, %lo(argValBuff + 0x4)
/* 007530 01DB3230 21105400 */  addu        $2, $2, $20
/* 007534 01DB3234 000040C4 */  lwc1        $f0, 0x0($2)
/* 007538 01DB3238 DD01013C */  lui         $1, %hi(op_fogRate)
/* 00753C 01DB323C 305C20E4 */  swc1        $f0, %lo(op_fogRate)($1)
/* 007540 01DB3240 E101023C */  lui         $2, %hi(argValBuff + 0x8)
/* 007544 01DB3244 48244224 */  addiu       $2, $2, %lo(argValBuff + 0x8)
/* 007548 01DB3248 21105400 */  addu        $2, $2, $20
/* 00754C 01DB324C 000040C4 */  lwc1        $f0, 0x0($2)
/* 007550 01DB3250 DD01013C */  lui         $1, %hi(op_fogRate + 0x4)
/* 007554 01DB3254 345C20E4 */  swc1        $f0, %lo(op_fogRate + 0x4)($1)
/* 007558 01DB3258 E101023C */  lui         $2, %hi(argValBuff + 0x18)
/* 00755C 01DB325C 58244224 */  addiu       $2, $2, %lo(argValBuff + 0x18)
/* 007560 01DB3260 21105400 */  addu        $2, $2, $20
/* 007564 01DB3264 000040C4 */  lwc1        $f0, 0x0($2)
/* 007568 01DB3268 DD01013C */  lui         $1, %hi(op_fogRate + 0x8)
/* 00756C 01DB326C 385C20E4 */  swc1        $f0, %lo(op_fogRate + 0x8)($1)
/* 007570 01DB3270 E101023C */  lui         $2, %hi(argValBuff + 0x1C)
/* 007574 01DB3274 5C244224 */  addiu       $2, $2, %lo(argValBuff + 0x1C)
/* 007578 01DB3278 21105400 */  addu        $2, $2, $20
/* 00757C 01DB327C 000040C4 */  lwc1        $f0, 0x0($2)
/* 007580 01DB3280 DD01013C */  lui         $1, %hi(op_fogRate + 0xC)
/* 007584 01DB3284 3C5C20E4 */  swc1        $f0, %lo(op_fogRate + 0xC)($1)
/* 007588 01DB3288 E101023C */  lui         $2, %hi(argValBuff + 0xC)
/* 00758C 01DB328C 4C244224 */  addiu       $2, $2, %lo(argValBuff + 0xC)
/* 007590 01DB3290 21105400 */  addu        $2, $2, $20
/* 007594 01DB3294 00004CC4 */  lwc1        $f12, 0x0($2)
/* 007598 01DB3298 5044040C */  jal         fptoui
/* 00759C 01DB329C 00000000 */   nop
/* 0075A0 01DB32A0 308A82A3 */  sb          $2, -0x75D0($28)
/* 0075A4 01DB32A4 E101023C */  lui         $2, %hi(argValBuff + 0x10)
/* 0075A8 01DB32A8 50244224 */  addiu       $2, $2, %lo(argValBuff + 0x10)
/* 0075AC 01DB32AC 21105400 */  addu        $2, $2, $20
/* 0075B0 01DB32B0 00004CC4 */  lwc1        $f12, 0x0($2)
/* 0075B4 01DB32B4 5044040C */  jal         fptoui
/* 0075B8 01DB32B8 00000000 */   nop
/* 0075BC 01DB32BC 318A82A3 */  sb          $2, -0x75CF($28)
/* 0075C0 01DB32C0 E101023C */  lui         $2, %hi(argValBuff + 0x14)
/* 0075C4 01DB32C4 54244224 */  addiu       $2, $2, %lo(argValBuff + 0x14)
/* 0075C8 01DB32C8 21105400 */  addu        $2, $2, $20
/* 0075CC 01DB32CC 00004CC4 */  lwc1        $f12, 0x0($2)
/* 0075D0 01DB32D0 5044040C */  jal         fptoui
/* 0075D4 01DB32D4 00000000 */   nop
/* 0075D8 01DB32D8 328A82A3 */  sb          $2, -0x75CE($28)
/* 0075DC 01DB32DC DD01013C */  lui         $1, %hi(op_fogRate)
/* 0075E0 01DB32E0 305C2CC4 */  lwc1        $f12, %lo(op_fogRate)($1)
/* 0075E4 01DB32E4 DD01013C */  lui         $1, %hi(op_fogRate + 0x4)
/* 0075E8 01DB32E8 345C2DC4 */  lwc1        $f13, %lo(op_fogRate + 0x4)($1)
/* 0075EC 01DB32EC 308A8493 */  lbu         $4, -0x75D0($28)
/* 0075F0 01DB32F0 318A8593 */  lbu         $5, -0x75CF($28)
/* 0075F4 01DB32F4 328A8693 */  lbu         $6, -0x75CE($28)
/* 0075F8 01DB32F8 DD01013C */  lui         $1, %hi(op_fogRate + 0x8)
/* 0075FC 01DB32FC 385C2EC4 */  lwc1        $f14, %lo(op_fogRate + 0x8)($1)
/* 007600 01DB3300 DD01013C */  lui         $1, %hi(op_fogRate + 0xC)
/* 007604 01DB3304 3C5C2FC4 */  lwc1        $f15, %lo(op_fogRate + 0xC)($1)
/* 007608 01DB3308 04B8040C */  jal         MGSetFogParm__FffUcUcUcff
/* 00760C 01DB330C 00000000 */   nop
/* 007610 01DB3310 01000224 */  addiu       $2, $0, 0x1
/* 007614 01DB3314 1C01A2A3 */  sb          $2, 0x11C($29)
.L01DB3318_2B8B18:
/* 007618 01DB3318 DD01013C */  lui         $1, %hi(TEIGI_EDIT_FOG)
/* 00761C 01DB331C 005E318C */  lw          $17, %lo(TEIGI_EDIT_FOG)($1)
/* 007620 01DB3320 0000B4C6 */  lwc1        $f20, 0x0($21)
/* 007624 01DB3324 06A30046 */  mov.s       $f12, $f20
/* 007628 01DB3328 2C44040C */  jal         fptosi
/* 00762C 01DB332C 00000000 */   nop
/* 007630 01DB3330 30002216 */  bne         $17, $2, .L01DB33F4_2B8BF4
/* 007634 01DB3334 00000000 */   nop
/* 007638 01DB3338 E101023C */  lui         $2, %hi(argValBuff + 0x4)
/* 00763C 01DB333C 44244224 */  addiu       $2, $2, %lo(argValBuff + 0x4)
/* 007640 01DB3340 21105400 */  addu        $2, $2, $20
/* 007644 01DB3344 000040C4 */  lwc1        $f0, 0x0($2)
/* 007648 01DB3348 DD01013C */  lui         $1, %hi(editFogRate)
/* 00764C 01DB334C 206120E4 */  swc1        $f0, %lo(editFogRate)($1)
/* 007650 01DB3350 E101023C */  lui         $2, %hi(argValBuff + 0x8)
/* 007654 01DB3354 48244224 */  addiu       $2, $2, %lo(argValBuff + 0x8)
/* 007658 01DB3358 21105400 */  addu        $2, $2, $20
/* 00765C 01DB335C 000040C4 */  lwc1        $f0, 0x0($2)
/* 007660 01DB3360 DD01013C */  lui         $1, %hi(editFogRate + 0x4)
/* 007664 01DB3364 246120E4 */  swc1        $f0, %lo(editFogRate + 0x4)($1)
/* 007668 01DB3368 E101023C */  lui         $2, %hi(argValBuff + 0x18)
/* 00766C 01DB336C 58244224 */  addiu       $2, $2, %lo(argValBuff + 0x18)
/* 007670 01DB3370 21105400 */  addu        $2, $2, $20
/* 007674 01DB3374 000040C4 */  lwc1        $f0, 0x0($2)
/* 007678 01DB3378 DD01013C */  lui         $1, %hi(editFogRate + 0x8)
/* 00767C 01DB337C 286120E4 */  swc1        $f0, %lo(editFogRate + 0x8)($1)
/* 007680 01DB3380 E101023C */  lui         $2, %hi(argValBuff + 0x1C)
/* 007684 01DB3384 5C244224 */  addiu       $2, $2, %lo(argValBuff + 0x1C)
/* 007688 01DB3388 21105400 */  addu        $2, $2, $20
/* 00768C 01DB338C 000040C4 */  lwc1        $f0, 0x0($2)
/* 007690 01DB3390 DD01013C */  lui         $1, %hi(editFogRate + 0xC)
/* 007694 01DB3394 2C6120E4 */  swc1        $f0, %lo(editFogRate + 0xC)($1)
/* 007698 01DB3398 E101023C */  lui         $2, %hi(argValBuff + 0xC)
/* 00769C 01DB339C 4C244224 */  addiu       $2, $2, %lo(argValBuff + 0xC)
/* 0076A0 01DB33A0 21105400 */  addu        $2, $2, $20
/* 0076A4 01DB33A4 00004CC4 */  lwc1        $f12, 0x0($2)
/* 0076A8 01DB33A8 5044040C */  jal         fptoui
/* 0076AC 01DB33AC 00000000 */   nop
/* 0076B0 01DB33B0 548A82A3 */  sb          $2, -0x75AC($28)
/* 0076B4 01DB33B4 E101023C */  lui         $2, %hi(argValBuff + 0x10)
/* 0076B8 01DB33B8 50244224 */  addiu       $2, $2, %lo(argValBuff + 0x10)
/* 0076BC 01DB33BC 21105400 */  addu        $2, $2, $20
/* 0076C0 01DB33C0 00004CC4 */  lwc1        $f12, 0x0($2)
/* 0076C4 01DB33C4 5044040C */  jal         fptoui
/* 0076C8 01DB33C8 00000000 */   nop
/* 0076CC 01DB33CC 558A82A3 */  sb          $2, -0x75AB($28)
/* 0076D0 01DB33D0 E101023C */  lui         $2, %hi(argValBuff + 0x14)
/* 0076D4 01DB33D4 54244224 */  addiu       $2, $2, %lo(argValBuff + 0x14)
/* 0076D8 01DB33D8 21105400 */  addu        $2, $2, $20
/* 0076DC 01DB33DC 00004CC4 */  lwc1        $f12, 0x0($2)
/* 0076E0 01DB33E0 5044040C */  jal         fptoui
/* 0076E4 01DB33E4 00000000 */   nop
/* 0076E8 01DB33E8 568A82A3 */  sb          $2, -0x75AA($28)
/* 0076EC 01DB33EC 01000224 */  addiu       $2, $0, 0x1
/* 0076F0 01DB33F0 1C01A2A3 */  sb          $2, 0x11C($29)
.L01DB33F4_2B8BF4:
/* 0076F4 01DB33F4 DD01013C */  lui         $1, %hi(TEIGI_PLIGHT)
/* 0076F8 01DB33F8 205F318C */  lw          $17, %lo(TEIGI_PLIGHT)($1)
/* 0076FC 01DB33FC 06A30046 */  mov.s       $f12, $f20
/* 007700 01DB3400 2C44040C */  jal         fptosi
/* 007704 01DB3404 00000000 */   nop
/* 007708 01DB3408 62002216 */  bne         $17, $2, .L01DB3594_2B8D94
/* 00770C 01DB340C 00000000 */   nop
/* 007710 01DB3410 01000324 */  addiu       $3, $0, 0x1
/* 007714 01DB3414 9C98828F */  lw          $2, -0x6764($28)
/* 007718 01DB3418 40890200 */  sll         $17, $2, 5
/* 00771C 01DB341C E101023C */  lui         $2, %hi(pointLight)
/* 007720 01DB3420 10E84224 */  addiu       $2, $2, %lo(pointLight)
/* 007724 01DB3424 21105100 */  addu        $2, $2, $17
/* 007728 01DB3428 000043AC */  sw          $3, 0x0($2)
/* 00772C 01DB342C E101023C */  lui         $2, %hi(argValBuff + 0x4)
/* 007730 01DB3430 44244224 */  addiu       $2, $2, %lo(argValBuff + 0x4)
/* 007734 01DB3434 21185400 */  addu        $3, $2, $20
/* 007738 01DB3438 2041023C */  lui         $2, (0x41200000 >> 16)
/* 00773C 01DB343C 00088244 */  mtc1        $2, $f1
/* 007740 01DB3440 000060C4 */  lwc1        $f0, 0x0($3)
/* 007744 01DB3444 02080046 */  mul.s       $f0, $f1, $f0
/* 007748 01DB3448 E101023C */  lui         $2, %hi(pointLight + 0x4)
/* 00774C 01DB344C 14E84224 */  addiu       $2, $2, %lo(pointLight + 0x4)
/* 007750 01DB3450 21105100 */  addu        $2, $2, $17
/* 007754 01DB3454 000040E4 */  swc1        $f0, 0x0($2)
/* 007758 01DB3458 E101023C */  lui         $2, %hi(argValBuff + 0x8)
/* 00775C 01DB345C 48244224 */  addiu       $2, $2, %lo(argValBuff + 0x8)
/* 007760 01DB3460 21105400 */  addu        $2, $2, $20
/* 007764 01DB3464 000040C4 */  lwc1        $f0, 0x0($2)
/* 007768 01DB3468 02080046 */  mul.s       $f0, $f1, $f0
/* 00776C 01DB346C E101023C */  lui         $2, %hi(pointLight + 0x8)
/* 007770 01DB3470 18E84224 */  addiu       $2, $2, %lo(pointLight + 0x8)
/* 007774 01DB3474 21105100 */  addu        $2, $2, $17
/* 007778 01DB3478 000040E4 */  swc1        $f0, 0x0($2)
/* 00777C 01DB347C E101023C */  lui         $2, %hi(argValBuff + 0xC)
/* 007780 01DB3480 4C244224 */  addiu       $2, $2, %lo(argValBuff + 0xC)
/* 007784 01DB3484 21105400 */  addu        $2, $2, $20
/* 007788 01DB3488 000040C4 */  lwc1        $f0, 0x0($2)
/* 00778C 01DB348C 02080046 */  mul.s       $f0, $f1, $f0
/* 007790 01DB3490 E101023C */  lui         $2, %hi(pointLight + 0xC)
/* 007794 01DB3494 1CE84224 */  addiu       $2, $2, %lo(pointLight + 0xC)
/* 007798 01DB3498 21105100 */  addu        $2, $2, $17
/* 00779C 01DB349C 000040E4 */  swc1        $f0, 0x0($2)
/* 0077A0 01DB34A0 E101023C */  lui         $2, %hi(argValBuff + 0x10)
/* 0077A4 01DB34A4 50244224 */  addiu       $2, $2, %lo(argValBuff + 0x10)
/* 0077A8 01DB34A8 21105400 */  addu        $2, $2, $20
/* 0077AC 01DB34AC 00004CC4 */  lwc1        $f12, 0x0($2)
/* 0077B0 01DB34B0 5044040C */  jal         fptoui
/* 0077B4 01DB34B4 00000000 */   nop
/* 0077B8 01DB34B8 E101033C */  lui         $3, %hi(pointLight + 0x10)
/* 0077BC 01DB34BC 20E86324 */  addiu       $3, $3, %lo(pointLight + 0x10)
/* 0077C0 01DB34C0 21187100 */  addu        $3, $3, $17
/* 0077C4 01DB34C4 000062A0 */  sb          $2, 0x0($3)
/* 0077C8 01DB34C8 E101023C */  lui         $2, %hi(argValBuff + 0x14)
/* 0077CC 01DB34CC 54244224 */  addiu       $2, $2, %lo(argValBuff + 0x14)
/* 0077D0 01DB34D0 21105400 */  addu        $2, $2, $20
/* 0077D4 01DB34D4 00004CC4 */  lwc1        $f12, 0x0($2)
/* 0077D8 01DB34D8 5044040C */  jal         fptoui
/* 0077DC 01DB34DC 00000000 */   nop
/* 0077E0 01DB34E0 E101033C */  lui         $3, %hi(pointLight + 0x11)
/* 0077E4 01DB34E4 21E86324 */  addiu       $3, $3, %lo(pointLight + 0x11)
/* 0077E8 01DB34E8 21187100 */  addu        $3, $3, $17
/* 0077EC 01DB34EC 000062A0 */  sb          $2, 0x0($3)
/* 0077F0 01DB34F0 E101023C */  lui         $2, %hi(argValBuff + 0x18)
/* 0077F4 01DB34F4 58244224 */  addiu       $2, $2, %lo(argValBuff + 0x18)
/* 0077F8 01DB34F8 21105400 */  addu        $2, $2, $20
/* 0077FC 01DB34FC 00004CC4 */  lwc1        $f12, 0x0($2)
/* 007800 01DB3500 5044040C */  jal         fptoui
/* 007804 01DB3504 00000000 */   nop
/* 007808 01DB3508 E101033C */  lui         $3, %hi(pointLight + 0x12)
/* 00780C 01DB350C 22E86324 */  addiu       $3, $3, %lo(pointLight + 0x12)
/* 007810 01DB3510 21187100 */  addu        $3, $3, $17
/* 007814 01DB3514 000062A0 */  sb          $2, 0x0($3)
/* 007818 01DB3518 E101023C */  lui         $2, %hi(argValBuff + 0x1C)
/* 00781C 01DB351C 5C244224 */  addiu       $2, $2, %lo(argValBuff + 0x1C)
/* 007820 01DB3520 21105400 */  addu        $2, $2, $20
/* 007824 01DB3524 00004CC4 */  lwc1        $f12, 0x0($2)
/* 007828 01DB3528 5044040C */  jal         fptoui
/* 00782C 01DB352C 00000000 */   nop
/* 007830 01DB3530 E101033C */  lui         $3, %hi(pointLight + 0x14)
/* 007834 01DB3534 24E86324 */  addiu       $3, $3, %lo(pointLight + 0x14)
/* 007838 01DB3538 21187100 */  addu        $3, $3, $17
/* 00783C 01DB353C 000062AC */  sw          $2, 0x0($3)
/* 007840 01DB3540 E101023C */  lui         $2, %hi(argValBuff + 0x20)
/* 007844 01DB3544 60244224 */  addiu       $2, $2, %lo(argValBuff + 0x20)
/* 007848 01DB3548 21105400 */  addu        $2, $2, $20
/* 00784C 01DB354C 00004CC4 */  lwc1        $f12, 0x0($2)
/* 007850 01DB3550 5044040C */  jal         fptoui
/* 007854 01DB3554 00000000 */   nop
/* 007858 01DB3558 E101033C */  lui         $3, %hi(pointLight + 0x18)
/* 00785C 01DB355C 28E86324 */  addiu       $3, $3, %lo(pointLight + 0x18)
/* 007860 01DB3560 21187100 */  addu        $3, $3, $17
/* 007864 01DB3564 000062AC */  sw          $2, 0x0($3)
/* 007868 01DB3568 E101023C */  lui         $2, %hi(argValBuff + 0x24)
/* 00786C 01DB356C 64244224 */  addiu       $2, $2, %lo(argValBuff + 0x24)
/* 007870 01DB3570 21105400 */  addu        $2, $2, $20
/* 007874 01DB3574 000040C4 */  lwc1        $f0, 0x0($2)
/* 007878 01DB3578 E101023C */  lui         $2, %hi(pointLight + 0x1C)
/* 00787C 01DB357C 2CE84224 */  addiu       $2, $2, %lo(pointLight + 0x1C)
/* 007880 01DB3580 21105100 */  addu        $2, $2, $17
/* 007884 01DB3584 000040E4 */  swc1        $f0, 0x0($2)
/* 007888 01DB3588 9C98828F */  lw          $2, -0x6764($28)
/* 00788C 01DB358C 01004224 */  addiu       $2, $2, 0x1
/* 007890 01DB3590 9C9882AF */  sw          $2, -0x6764($28)
.L01DB3594_2B8D94:
/* 007894 01DB3594 DD01013C */  lui         $1, %hi(TEIGI_GRD)
/* 007898 01DB3598 805C318C */  lw          $17, %lo(TEIGI_GRD)($1)
/* 00789C 01DB359C 06A30046 */  mov.s       $f12, $f20
/* 0078A0 01DB35A0 2C44040C */  jal         fptosi
/* 0078A4 01DB35A4 00000000 */   nop
/* 0078A8 01DB35A8 67002216 */  bne         $17, $2, .L01DB3748_2B8F48
/* 0078AC 01DB35AC 00000000 */   nop
/* 0078B0 01DB35B0 7001A427 */  addiu       $4, $29, 0x170
/* 0078B4 01DB35B4 DE01023C */  lui         $2, %hi(LIT_965)
/* 0078B8 01DB35B8 E0D94524 */  addiu       $5, $2, %lo(LIT_965)
/* 0078BC 01DB35BC 5A15040C */  jal         strcpy
/* 0078C0 01DB35C0 00000000 */   nop
/* 0078C4 01DB35C4 80191000 */  sll         $3, $16, 6
/* 0078C8 01DB35C8 E101023C */  lui         $2, %hi(argStrBuff)
/* 0078CC 01DB35CC 40044224 */  addiu       $2, $2, %lo(argStrBuff)
/* 0078D0 01DB35D0 21284300 */  addu        $5, $2, $3
/* 0078D4 01DB35D4 7001A427 */  addiu       $4, $29, 0x170
/* 0078D8 01DB35D8 BC14040C */  jal         strcat
/* 0078DC 01DB35DC 00000000 */   nop
/* 0078E0 01DB35E0 948B858F */  lw          $5, -0x746C($28)
/* 0078E4 01DB35E4 7001A427 */  addiu       $4, $29, 0x170
/* 0078E8 01DB35E8 28360070 */  paddub      $6, $0, $0
/* 0078EC 01DB35EC D8FC040C */  jal         LoadFile__FPcPvPi
/* 0078F0 01DB35F0 00000000 */   nop
/* 0078F4 01DB35F4 948B848F */  lw          $4, -0x746C($28)
/* 0078F8 01DB35F8 DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 0078FC 01DB35FC B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 007900 01DB3600 02000624 */  addiu       $6, $0, 0x2
/* 007904 01DB3604 283E0070 */  paddub      $7, $0, $0
/* 007908 01DB3608 28460070 */  paddub      $8, $0, $0
/* 00790C 01DB360C AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 007910 01DB3610 00000000 */   nop
/* 007914 01DB3614 28964070 */  paddub      $18, $2, $0
/* 007918 01DB3618 28BE4072 */  paddub      $23, $18, $0
/* 00791C 01DB361C 28264072 */  paddub      $4, $18, $0
/* 007920 01DB3620 1001A527 */  addiu       $5, $29, 0x110
/* 007924 01DB3624 01000624 */  addiu       $6, $0, 0x1
/* 007928 01DB3628 40000724 */  addiu       $7, $0, 0x40
/* 00792C 01DB362C D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 007930 01DB3630 00000000 */   nop
/* 007934 01DB3634 28264072 */  paddub      $4, $18, $0
/* 007938 01DB3638 01000524 */  addiu       $5, $0, 0x1
/* 00793C 01DB363C BC97040C */  jal         SetFrameAttr__FP6CFramei
/* 007940 01DB3640 00000000 */   nop
/* 007944 01DB3644 E201023C */  lui         $2, %hi(OP_GroundMap)
/* 007948 01DB3648 30BA4424 */  addiu       $4, $2, %lo(OP_GroundMap)
/* 00794C 01DB364C 282E4072 */  paddub      $5, $18, $0
/* 007950 01DB3650 28360070 */  paddub      $6, $0, $0
/* 007954 01DB3654 283E0070 */  paddub      $7, $0, $0
/* 007958 01DB3658 3C0E050C */  jal         SetObject__4CMapFP9CFrameVu1ii
/* 00795C 01DB365C 00000000 */   nop
/* 007960 01DB3660 289E4070 */  paddub      $19, $2, $0
/* 007964 01DB3664 E101033C */  lui         $3, %hi(argValBuff + 0x10)
/* 007968 01DB3668 50246324 */  addiu       $3, $3, %lo(argValBuff + 0x10)
/* 00796C 01DB366C 21207400 */  addu        $4, $3, $20
/* 007970 01DB3670 2041033C */  lui         $3, (0x41200000 >> 16)
/* 007974 01DB3674 00088344 */  mtc1        $3, $f1
/* 007978 01DB3678 000080C4 */  lwc1        $f0, 0x0($4)
/* 00797C 01DB367C C2080046 */  mul.s       $f3, $f1, $f0
/* 007980 01DB3680 E101033C */  lui         $3, %hi(argValBuff + 0xC)
/* 007984 01DB3684 4C246324 */  addiu       $3, $3, %lo(argValBuff + 0xC)
/* 007988 01DB3688 21187400 */  addu        $3, $3, $20
/* 00798C 01DB368C 000060C4 */  lwc1        $f0, 0x0($3)
/* 007990 01DB3690 82080046 */  mul.s       $f2, $f1, $f0
/* 007994 01DB3694 E101033C */  lui         $3, %hi(argValBuff + 0x8)
/* 007998 01DB3698 48246324 */  addiu       $3, $3, %lo(argValBuff + 0x8)
/* 00799C 01DB369C 21187400 */  addu        $3, $3, $20
/* 0079A0 01DB36A0 000060C4 */  lwc1        $f0, 0x0($3)
/* 0079A4 01DB36A4 02080046 */  mul.s       $f0, $f1, $f0
/* 0079A8 01DB36A8 9003A0E7 */  swc1        $f0, 0x390($29)
/* 0079AC 01DB36AC 9403A2E7 */  swc1        $f2, 0x394($29)
/* 0079B0 01DB36B0 9803A3E7 */  swc1        $f3, 0x398($29)
/* 0079B4 01DB36B4 28266072 */  paddub      $4, $19, $0
/* 0079B8 01DB36B8 9003A527 */  addiu       $5, $29, 0x390
/* 0079BC 01DB36BC A000598C */  lw          $25, 0xA0($2)
/* 0079C0 01DB36C0 1000398F */  lw          $25, 0x10($25)
/* 0079C4 01DB36C4 09F82003 */  jalr        $25
/* 0079C8 01DB36C8 00000000 */   nop
/* 0079CC 01DB36CC E101023C */  lui         $2, %hi(argValBuff + 0x14)
/* 0079D0 01DB36D0 54244224 */  addiu       $2, $2, %lo(argValBuff + 0x14)
/* 0079D4 01DB36D4 21105400 */  addu        $2, $2, $20
/* 0079D8 01DB36D8 B08082C7 */  lwc1        $f2, -0x7F50($28)
/* 0079DC 01DB36DC 000040C4 */  lwc1        $f0, 0x0($2)
/* 0079E0 01DB36E0 02100046 */  mul.s       $f0, $f2, $f0
/* 0079E4 01DB36E4 3443023C */  lui         $2, (0x43340000 >> 16)
/* 0079E8 01DB36E8 00088244 */  mtc1        $2, $f1
/* 0079EC 01DB36EC 00000000 */  nop
/* 0079F0 01DB36F0 03030146 */  div.s       $f12, $f0, $f1
/* 0079F4 01DB36F4 E101023C */  lui         $2, %hi(argValBuff + 0x18)
/* 0079F8 01DB36F8 58244224 */  addiu       $2, $2, %lo(argValBuff + 0x18)
/* 0079FC 01DB36FC 21105400 */  addu        $2, $2, $20
/* 007A00 01DB3700 000040C4 */  lwc1        $f0, 0x0($2)
/* 007A04 01DB3704 02100046 */  mul.s       $f0, $f2, $f0
/* 007A08 01DB3708 43030146 */  div.s       $f13, $f0, $f1
/* 007A0C 01DB370C E101023C */  lui         $2, %hi(argValBuff + 0x1C)
/* 007A10 01DB3710 5C244224 */  addiu       $2, $2, %lo(argValBuff + 0x1C)
/* 007A14 01DB3714 21105400 */  addu        $2, $2, $20
/* 007A18 01DB3718 000040C4 */  lwc1        $f0, 0x0($2)
/* 007A1C 01DB371C 02100046 */  mul.s       $f0, $f2, $f0
/* 007A20 01DB3720 83030146 */  div.s       $f14, $f0, $f1
/* 007A24 01DB3724 A003ACE7 */  swc1        $f12, 0x3A0($29)
/* 007A28 01DB3728 A403ADE7 */  swc1        $f13, 0x3A4($29)
/* 007A2C 01DB372C A803AEE7 */  swc1        $f14, 0x3A8($29)
/* 007A30 01DB3730 28266072 */  paddub      $4, $19, $0
/* 007A34 01DB3734 A003A527 */  addiu       $5, $29, 0x3A0
/* 007A38 01DB3738 A000798E */  lw          $25, 0xA0($19)
/* 007A3C 01DB373C 2C00398F */  lw          $25, 0x2C($25)
/* 007A40 01DB3740 09F82003 */  jalr        $25
/* 007A44 01DB3744 00000000 */   nop
.L01DB3748_2B8F48:
/* 007A48 01DB3748 DD01013C */  lui         $1, %hi(TEIGI_SKY)
/* 007A4C 01DB374C 005D318C */  lw          $17, %lo(TEIGI_SKY)($1)
/* 007A50 01DB3750 0000ACC6 */  lwc1        $f12, 0x0($21)
/* 007A54 01DB3754 2C44040C */  jal         fptosi
/* 007A58 01DB3758 00000000 */   nop
/* 007A5C 01DB375C 2C002216 */  bne         $17, $2, .L01DB3810_2B9010
/* 007A60 01DB3760 00000000 */   nop
/* 007A64 01DB3764 7001A427 */  addiu       $4, $29, 0x170
/* 007A68 01DB3768 DE01023C */  lui         $2, %hi(LIT_965)
/* 007A6C 01DB376C E0D94524 */  addiu       $5, $2, %lo(LIT_965)
/* 007A70 01DB3770 5A15040C */  jal         strcpy
/* 007A74 01DB3774 00000000 */   nop
/* 007A78 01DB3778 80191000 */  sll         $3, $16, 6
/* 007A7C 01DB377C E101023C */  lui         $2, %hi(argStrBuff)
/* 007A80 01DB3780 40044224 */  addiu       $2, $2, %lo(argStrBuff)
/* 007A84 01DB3784 21284300 */  addu        $5, $2, $3
/* 007A88 01DB3788 7001A427 */  addiu       $4, $29, 0x170
/* 007A8C 01DB378C BC14040C */  jal         strcat
/* 007A90 01DB3790 00000000 */   nop
/* 007A94 01DB3794 948B858F */  lw          $5, -0x746C($28)
/* 007A98 01DB3798 7001A427 */  addiu       $4, $29, 0x170
/* 007A9C 01DB379C 28360070 */  paddub      $6, $0, $0
/* 007AA0 01DB37A0 D8FC040C */  jal         LoadFile__FPcPvPi
/* 007AA4 01DB37A4 00000000 */   nop
/* 007AA8 01DB37A8 948B848F */  lw          $4, -0x746C($28)
/* 007AAC 01DB37AC DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 007AB0 01DB37B0 B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 007AB4 01DB37B4 02000624 */  addiu       $6, $0, 0x2
/* 007AB8 01DB37B8 283E0070 */  paddub      $7, $0, $0
/* 007ABC 01DB37BC 28460070 */  paddub      $8, $0, $0
/* 007AC0 01DB37C0 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 007AC4 01DB37C4 00000000 */   nop
/* 007AC8 01DB37C8 C09882AF */  sw          $2, -0x6740($28)
/* 007ACC 01DB37CC E101023C */  lui         $2, %hi(argValBuff + 0x8)
/* 007AD0 01DB37D0 48244224 */  addiu       $2, $2, %lo(argValBuff + 0x8)
/* 007AD4 01DB37D4 21105400 */  addu        $2, $2, $20
/* 007AD8 01DB37D8 000041C4 */  lwc1        $f1, 0x0($2)
/* 007ADC 01DB37DC 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 007AE0 01DB37E0 00008244 */  mtc1        $2, $f0
/* 007AE4 01DB37E4 00000000 */  nop
/* 007AE8 01DB37E8 32000146 */  c.eq.s      $f0, $f1
/* 007AEC 01DB37EC 00000000 */  nop
/* 007AF0 01DB37F0 07000045 */  bc1f        .L01DB3810_2B9010
/* 007AF4 01DB37F4 00000000 */   nop
/* 007AF8 01DB37F8 C098848F */  lw          $4, -0x6740($28)
/* 007AFC 01DB37FC 1001A527 */  addiu       $5, $29, 0x110
/* 007B00 01DB3800 01000624 */  addiu       $6, $0, 0x1
/* 007B04 01DB3804 40000724 */  addiu       $7, $0, 0x40
/* 007B08 01DB3808 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 007B0C 01DB380C 00000000 */   nop
.L01DB3810_2B9010:
/* 007B10 01DB3810 DD01013C */  lui         $1, %hi(TEIGI_BLD)
/* 007B14 01DB3814 B05C318C */  lw          $17, %lo(TEIGI_BLD)($1)
/* 007B18 01DB3818 0000ACC6 */  lwc1        $f12, 0x0($21)
/* 007B1C 01DB381C 2C44040C */  jal         fptosi
/* 007B20 01DB3820 00000000 */   nop
/* 007B24 01DB3824 45012216 */  bne         $17, $2, .L01DB3D3C_2B953C
/* 007B28 01DB3828 00000000 */   nop
/* 007B2C 01DB382C 1001A627 */  addiu       $6, $29, 0x110
/* 007B30 01DB3830 B000A527 */  addiu       $5, $29, 0xB0
/* 007B34 01DB3834 03000424 */  addiu       $4, $0, 0x3
.L01DB3838_2B9038:
/* 007B38 01DB3838 0000C378 */  lq          $3, 0x0($6)
/* 007B3C 01DB383C 1000C278 */  lq          $2, 0x10($6)
/* 007B40 01DB3840 2000C624 */  addiu       $6, $6, 0x20
/* 007B44 01DB3844 FFFF8424 */  addiu       $4, $4, -0x1
/* 007B48 01DB3848 0000A37C */  sq          $3, 0x0($5)
/* 007B4C 01DB384C 1000A27C */  sq          $2, 0x10($5)
/* 007B50 01DB3850 2000A524 */  addiu       $5, $5, 0x20
/* 007B54 01DB3854 F8FF801C */  bgtz        $4, .L01DB3838_2B9038
/* 007B58 01DB3858 00000000 */   nop
/* 007B5C 01DB385C E101023C */  lui         $2, %hi(argValBuff + 0x20)
/* 007B60 01DB3860 60244224 */  addiu       $2, $2, %lo(argValBuff + 0x20)
/* 007B64 01DB3864 21105400 */  addu        $2, $2, $20
/* 007B68 01DB3868 000041C4 */  lwc1        $f1, 0x0($2)
/* 007B6C 01DB386C 00008044 */  mtc1        $0, $f0
/* 007B70 01DB3870 00000000 */  nop
/* 007B74 01DB3874 32000146 */  c.eq.s      $f0, $f1
/* 007B78 01DB3878 00000000 */  nop
/* 007B7C 01DB387C 70000045 */  bc1f        .L01DB3A40_2B9240
/* 007B80 01DB3880 00000000 */   nop
/* 007B84 01DB3884 7001A427 */  addiu       $4, $29, 0x170
/* 007B88 01DB3888 DE01023C */  lui         $2, %hi(LIT_965)
/* 007B8C 01DB388C E0D94524 */  addiu       $5, $2, %lo(LIT_965)
/* 007B90 01DB3890 5A15040C */  jal         strcpy
/* 007B94 01DB3894 00000000 */   nop
/* 007B98 01DB3898 80191000 */  sll         $3, $16, 6
/* 007B9C 01DB389C E101023C */  lui         $2, %hi(argStrBuff)
/* 007BA0 01DB38A0 40044224 */  addiu       $2, $2, %lo(argStrBuff)
/* 007BA4 01DB38A4 21284300 */  addu        $5, $2, $3
/* 007BA8 01DB38A8 7001A427 */  addiu       $4, $29, 0x170
/* 007BAC 01DB38AC BC14040C */  jal         strcat
/* 007BB0 01DB38B0 00000000 */   nop
/* 007BB4 01DB38B4 948B858F */  lw          $5, -0x746C($28)
/* 007BB8 01DB38B8 7001A427 */  addiu       $4, $29, 0x170
/* 007BBC 01DB38BC 28360070 */  paddub      $6, $0, $0
/* 007BC0 01DB38C0 D8FC040C */  jal         LoadFile__FPcPvPi
/* 007BC4 01DB38C4 00000000 */   nop
/* 007BC8 01DB38C8 948B848F */  lw          $4, -0x746C($28)
/* 007BCC 01DB38CC DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 007BD0 01DB38D0 B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 007BD4 01DB38D4 02000624 */  addiu       $6, $0, 0x2
/* 007BD8 01DB38D8 283E0070 */  paddub      $7, $0, $0
/* 007BDC 01DB38DC 28460070 */  paddub      $8, $0, $0
/* 007BE0 01DB38E0 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 007BE4 01DB38E4 00000000 */   nop
/* 007BE8 01DB38E8 28964070 */  paddub      $18, $2, $0
/* 007BEC 01DB38EC 28BE4072 */  paddub      $23, $18, $0
/* 007BF0 01DB38F0 28264072 */  paddub      $4, $18, $0
/* 007BF4 01DB38F4 1001A527 */  addiu       $5, $29, 0x110
/* 007BF8 01DB38F8 01000624 */  addiu       $6, $0, 0x1
/* 007BFC 01DB38FC 40000724 */  addiu       $7, $0, 0x40
/* 007C00 01DB3900 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 007C04 01DB3904 00000000 */   nop
/* 007C08 01DB3908 28264072 */  paddub      $4, $18, $0
/* 007C0C 01DB390C 01000524 */  addiu       $5, $0, 0x1
/* 007C10 01DB3910 BC97040C */  jal         SetFrameAttr__FP6CFramei
/* 007C14 01DB3914 00000000 */   nop
/* 007C18 01DB3918 A898858F */  lw          $5, -0x6758($28)
/* 007C1C 01DB391C 0100A224 */  addiu       $2, $5, 0x1
/* 007C20 01DB3920 A89882AF */  sw          $2, -0x6758($28)
/* 007C24 01DB3924 E201023C */  lui         $2, %hi(OP_BuildingMap)
/* 007C28 01DB3928 50A44424 */  addiu       $4, $2, %lo(OP_BuildingMap)
/* 007C2C 01DB392C 28364072 */  paddub      $6, $18, $0
/* 007C30 01DB3930 283E0070 */  paddub      $7, $0, $0
/* 007C34 01DB3934 28460070 */  paddub      $8, $0, $0
/* 007C38 01DB3938 1C0E050C */  jal         SetObject__4CMapFiP9CFrameVu1ii
/* 007C3C 01DB393C 00000000 */   nop
/* 007C40 01DB3940 289E4070 */  paddub      $19, $2, $0
/* 007C44 01DB3944 01000324 */  addiu       $3, $0, 0x1
/* 007C48 01DB3948 E80043AC */  sw          $3, 0xE8($2)
/* 007C4C 01DB394C 05000324 */  addiu       $3, $0, 0x5
/* 007C50 01DB3950 E40043AC */  sw          $3, 0xE4($2)
/* 007C54 01DB3954 E101033C */  lui         $3, %hi(argValBuff + 0x10)
/* 007C58 01DB3958 50246324 */  addiu       $3, $3, %lo(argValBuff + 0x10)
/* 007C5C 01DB395C 21207400 */  addu        $4, $3, $20
/* 007C60 01DB3960 2041033C */  lui         $3, (0x41200000 >> 16)
/* 007C64 01DB3964 00088344 */  mtc1        $3, $f1
/* 007C68 01DB3968 000080C4 */  lwc1        $f0, 0x0($4)
/* 007C6C 01DB396C C2080046 */  mul.s       $f3, $f1, $f0
/* 007C70 01DB3970 E101033C */  lui         $3, %hi(argValBuff + 0xC)
/* 007C74 01DB3974 4C246324 */  addiu       $3, $3, %lo(argValBuff + 0xC)
/* 007C78 01DB3978 21187400 */  addu        $3, $3, $20
/* 007C7C 01DB397C 000060C4 */  lwc1        $f0, 0x0($3)
/* 007C80 01DB3980 82080046 */  mul.s       $f2, $f1, $f0
/* 007C84 01DB3984 E101033C */  lui         $3, %hi(argValBuff + 0x8)
/* 007C88 01DB3988 48246324 */  addiu       $3, $3, %lo(argValBuff + 0x8)
/* 007C8C 01DB398C 21187400 */  addu        $3, $3, $20
/* 007C90 01DB3990 000060C4 */  lwc1        $f0, 0x0($3)
/* 007C94 01DB3994 02080046 */  mul.s       $f0, $f1, $f0
/* 007C98 01DB3998 B003A0E7 */  swc1        $f0, 0x3B0($29)
/* 007C9C 01DB399C B403A2E7 */  swc1        $f2, 0x3B4($29)
/* 007CA0 01DB39A0 B803A3E7 */  swc1        $f3, 0x3B8($29)
/* 007CA4 01DB39A4 28266072 */  paddub      $4, $19, $0
/* 007CA8 01DB39A8 B003A527 */  addiu       $5, $29, 0x3B0
/* 007CAC 01DB39AC A000598C */  lw          $25, 0xA0($2)
/* 007CB0 01DB39B0 1000398F */  lw          $25, 0x10($25)
/* 007CB4 01DB39B4 09F82003 */  jalr        $25
/* 007CB8 01DB39B8 00000000 */   nop
/* 007CBC 01DB39BC E101023C */  lui         $2, %hi(argValBuff + 0x14)
/* 007CC0 01DB39C0 54244224 */  addiu       $2, $2, %lo(argValBuff + 0x14)
/* 007CC4 01DB39C4 21105400 */  addu        $2, $2, $20
/* 007CC8 01DB39C8 B08082C7 */  lwc1        $f2, -0x7F50($28)
/* 007CCC 01DB39CC 000040C4 */  lwc1        $f0, 0x0($2)
/* 007CD0 01DB39D0 02100046 */  mul.s       $f0, $f2, $f0
/* 007CD4 01DB39D4 3443023C */  lui         $2, (0x43340000 >> 16)
/* 007CD8 01DB39D8 00088244 */  mtc1        $2, $f1
/* 007CDC 01DB39DC 00000000 */  nop
/* 007CE0 01DB39E0 03030146 */  div.s       $f12, $f0, $f1
/* 007CE4 01DB39E4 E101023C */  lui         $2, %hi(argValBuff + 0x18)
/* 007CE8 01DB39E8 58244224 */  addiu       $2, $2, %lo(argValBuff + 0x18)
/* 007CEC 01DB39EC 21105400 */  addu        $2, $2, $20
/* 007CF0 01DB39F0 000040C4 */  lwc1        $f0, 0x0($2)
/* 007CF4 01DB39F4 02100046 */  mul.s       $f0, $f2, $f0
/* 007CF8 01DB39F8 43030146 */  div.s       $f13, $f0, $f1
/* 007CFC 01DB39FC E101023C */  lui         $2, %hi(argValBuff + 0x1C)
/* 007D00 01DB3A00 5C244224 */  addiu       $2, $2, %lo(argValBuff + 0x1C)
/* 007D04 01DB3A04 21105400 */  addu        $2, $2, $20
/* 007D08 01DB3A08 000040C4 */  lwc1        $f0, 0x0($2)
/* 007D0C 01DB3A0C 02100046 */  mul.s       $f0, $f2, $f0
/* 007D10 01DB3A10 83030146 */  div.s       $f14, $f0, $f1
/* 007D14 01DB3A14 C003ACE7 */  swc1        $f12, 0x3C0($29)
/* 007D18 01DB3A18 C403ADE7 */  swc1        $f13, 0x3C4($29)
/* 007D1C 01DB3A1C C803AEE7 */  swc1        $f14, 0x3C8($29)
/* 007D20 01DB3A20 28266072 */  paddub      $4, $19, $0
/* 007D24 01DB3A24 C003A527 */  addiu       $5, $29, 0x3C0
/* 007D28 01DB3A28 A000798E */  lw          $25, 0xA0($19)
/* 007D2C 01DB3A2C 2C00398F */  lw          $25, 0x2C($25)
/* 007D30 01DB3A30 09F82003 */  jalr        $25
/* 007D34 01DB3A34 00000000 */   nop
/* 007D38 01DB3A38 B4000010 */  b           .L01DB3D0C_2B950C
/* 007D3C 01DB3A3C 00000000 */   nop
.L01DB3A40_2B9240:
/* 007D40 01DB3A40 288E0070 */  paddub      $17, $0, $0
/* 007D44 01DB3A44 22000010 */  b           .L01DB3AD0_2B92D0
/* 007D48 01DB3A48 00000000 */   nop
.L01DB3A4C_2B924C:
/* 007D4C 01DB3A4C 21101102 */  addu        $2, $16, $17
/* 007D50 01DB3A50 80190200 */  sll         $3, $2, 6
/* 007D54 01DB3A54 E101023C */  lui         $2, %hi(argStrBuff)
/* 007D58 01DB3A58 40044224 */  addiu       $2, $2, %lo(argStrBuff)
/* 007D5C 01DB3A5C 21B04300 */  addu        $22, $2, $3
/* 007D60 01DB3A60 0000C282 */  lb          $2, 0x0($22)
/* 007D64 01DB3A64 14004010 */  beqz        $2, .L01DB3AB8_2B92B8
/* 007D68 01DB3A68 00000000 */   nop
/* 007D6C 01DB3A6C C0111100 */  sll         $2, $17, 7
/* 007D70 01DB3A70 21105D00 */  addu        $2, $2, $29
/* 007D74 01DB3A74 70015324 */  addiu       $19, $2, 0x170
/* 007D78 01DB3A78 28266072 */  paddub      $4, $19, $0
/* 007D7C 01DB3A7C DE01023C */  lui         $2, %hi(LIT_965)
/* 007D80 01DB3A80 E0D94524 */  addiu       $5, $2, %lo(LIT_965)
/* 007D84 01DB3A84 5A15040C */  jal         strcpy
/* 007D88 01DB3A88 00000000 */   nop
/* 007D8C 01DB3A8C 28266072 */  paddub      $4, $19, $0
/* 007D90 01DB3A90 282EC072 */  paddub      $5, $22, $0
/* 007D94 01DB3A94 BC14040C */  jal         strcat
/* 007D98 01DB3A98 00000000 */   nop
/* 007D9C 01DB3A9C 80181100 */  sll         $3, $17, 2
/* 007DA0 01DB3AA0 E201023C */  lui         $2, %hi(LODNameBuff)
/* 007DA4 01DB3AA4 40A44224 */  addiu       $2, $2, %lo(LODNameBuff)
/* 007DA8 01DB3AA8 21104300 */  addu        $2, $2, $3
/* 007DAC 01DB3AAC 000053AC */  sw          $19, 0x0($2)
/* 007DB0 01DB3AB0 06000010 */  b           .L01DB3ACC_2B92CC
/* 007DB4 01DB3AB4 00000000 */   nop
.L01DB3AB8_2B92B8:
/* 007DB8 01DB3AB8 80181100 */  sll         $3, $17, 2
/* 007DBC 01DB3ABC E201023C */  lui         $2, %hi(LODNameBuff)
/* 007DC0 01DB3AC0 40A44224 */  addiu       $2, $2, %lo(LODNameBuff)
/* 007DC4 01DB3AC4 21104300 */  addu        $2, $2, $3
/* 007DC8 01DB3AC8 000040AC */  sw          $0, 0x0($2)
.L01DB3ACC_2B92CC:
/* 007DCC 01DB3ACC 01003126 */  addiu       $17, $17, 0x1
.L01DB3AD0_2B92D0:
/* 007DD0 01DB3AD0 0400222A */  slti        $2, $17, 0x4
/* 007DD4 01DB3AD4 DDFF4014 */  bnez        $2, .L01DB3A4C_2B924C
/* 007DD8 01DB3AD8 00000000 */   nop
/* 007DDC 01DB3ADC 7003A427 */  addiu       $4, $29, 0x370
/* 007DE0 01DB3AE0 E201023C */  lui         $2, %hi(LODNameBuff)
/* 007DE4 01DB3AE4 40A44524 */  addiu       $5, $2, %lo(LODNameBuff)
/* 007DE8 01DB3AE8 948B868F */  lw          $6, -0x746C($28)
/* 007DEC 01DB3AEC 283E0070 */  paddub      $7, $0, $0
/* 007DF0 01DB3AF0 FC9D040C */  jal         LoadLODData__FPP9CFrameVu1PPcPUii
/* 007DF4 01DB3AF4 00000000 */   nop
/* 007DF8 01DB3AF8 A898858F */  lw          $5, -0x6758($28)
/* 007DFC 01DB3AFC 0100A224 */  addiu       $2, $5, 0x1
/* 007E00 01DB3B00 A89882AF */  sw          $2, -0x6758($28)
/* 007E04 01DB3B04 E201023C */  lui         $2, %hi(OP_BuildingMap)
/* 007E08 01DB3B08 50A44424 */  addiu       $4, $2, %lo(OP_BuildingMap)
/* 007E0C 01DB3B0C 600E050C */  jal         GetObject__4CMapFi
/* 007E10 01DB3B10 00000000 */   nop
/* 007E14 01DB3B14 289E4070 */  paddub      $19, $2, $0
/* 007E18 01DB3B18 01000324 */  addiu       $3, $0, 0x1
/* 007E1C 01DB3B1C E80043AC */  sw          $3, 0xE8($2)
/* 007E20 01DB3B20 E40043AC */  sw          $3, 0xE4($2)
/* 007E24 01DB3B24 E201023C */  lui         $2, %hi(OP_BuildingMap + 0x18)
/* 007E28 01DB3B28 68A44424 */  addiu       $4, $2, %lo(OP_BuildingMap + 0x18)
/* 007E2C 01DB3B2C 281E0070 */  paddub      $3, $0, $0
/* 007E30 01DB3B30 09000010 */  b           .L01DB3B58_2B9358
/* 007E34 01DB3B34 00000000 */   nop
.L01DB3B38_2B9338:
/* 007E38 01DB3B38 80280300 */  sll         $5, $3, 2
/* 007E3C 01DB3B3C DD01023C */  lui         $2, %hi(levelOfDitialZ)
/* 007E40 01DB3B40 30614224 */  addiu       $2, $2, %lo(levelOfDitialZ)
/* 007E44 01DB3B44 21104500 */  addu        $2, $2, $5
/* 007E48 01DB3B48 000040C4 */  lwc1        $f0, 0x0($2)
/* 007E4C 01DB3B4C 21108500 */  addu        $2, $4, $5
/* 007E50 01DB3B50 000040E4 */  swc1        $f0, 0x0($2)
/* 007E54 01DB3B54 01006324 */  addiu       $3, $3, 0x1
.L01DB3B58_2B9358:
/* 007E58 01DB3B58 04006228 */  slti        $2, $3, 0x4
/* 007E5C 01DB3B5C F6FF4014 */  bnez        $2, .L01DB3B38_2B9338
/* 007E60 01DB3B60 00000000 */   nop
/* 007E64 01DB3B64 100080AC */  sw          $0, 0x10($4)
/* 007E68 01DB3B68 03000224 */  addiu       $2, $0, 0x3
/* 007E6C 01DB3B6C 140082AC */  sw          $2, 0x14($4)
/* 007E70 01DB3B70 288E0070 */  paddub      $17, $0, $0
/* 007E74 01DB3B74 29000010 */  b           .L01DB3C1C_2B941C
/* 007E78 01DB3B78 00000000 */   nop
.L01DB3B7C_2B937C:
/* 007E7C 01DB3B7C 80101100 */  sll         $2, $17, 2
/* 007E80 01DB3B80 21105D00 */  addu        $2, $2, $29
/* 007E84 01DB3B84 70035624 */  addiu       $22, $2, 0x370
/* 007E88 01DB3B88 28266072 */  paddub      $4, $19, $0
/* 007E8C 01DB3B8C 0000C58E */  lw          $5, 0x0($22)
/* 007E90 01DB3B90 28362072 */  paddub      $6, $17, $0
/* 007E94 01DB3B94 305C050C */  jal         SetFrame__12CObjectFrameFP9CFrameVu1i
/* 007E98 01DB3B98 00000000 */   nop
/* 007E9C 01DB3B9C 0000C48E */  lw          $4, 0x0($22)
/* 007EA0 01DB3BA0 1D008010 */  beqz        $4, .L01DB3C18_2B9418
/* 007EA4 01DB3BA4 00000000 */   nop
/* 007EA8 01DB3BA8 1001A527 */  addiu       $5, $29, 0x110
/* 007EAC 01DB3BAC 01000624 */  addiu       $6, $0, 0x1
/* 007EB0 01DB3BB0 40000724 */  addiu       $7, $0, 0x40
/* 007EB4 01DB3BB4 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 007EB8 01DB3BB8 00000000 */   nop
/* 007EBC 01DB3BBC 0000C48E */  lw          $4, 0x0($22)
/* 007EC0 01DB3BC0 01000524 */  addiu       $5, $0, 0x1
/* 007EC4 01DB3BC4 BC97040C */  jal         SetFrameAttr__FP6CFramei
/* 007EC8 01DB3BC8 00000000 */   nop
/* 007ECC 01DB3BCC 28264072 */  paddub      $4, $18, $0
/* 007ED0 01DB3BD0 DE01023C */  lui         $2, %hi(LIT_967)
/* 007ED4 01DB3BD4 E8D94524 */  addiu       $5, $2, %lo(LIT_967)
/* 007ED8 01DB3BD8 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 007EDC 01DB3BDC 00000000 */   nop
/* 007EE0 01DB3BE0 28B64070 */  paddub      $22, $2, $0
/* 007EE4 01DB3BE4 0C00C012 */  beqz        $22, .L01DB3C18_2B9418
/* 007EE8 01DB3BE8 00000000 */   nop
/* 007EEC 01DB3BEC 01000624 */  addiu       $6, $0, 0x1
/* 007EF0 01DB3BF0 6001A6A7 */  sh          $6, 0x160($29)
/* 007EF4 01DB3BF4 2826C072 */  paddub      $4, $22, $0
/* 007EF8 01DB3BF8 1001A527 */  addiu       $5, $29, 0x110
/* 007EFC 01DB3BFC 40000724 */  addiu       $7, $0, 0x40
/* 007F00 01DB3C00 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 007F04 01DB3C04 00000000 */   nop
/* 007F08 01DB3C08 2826C072 */  paddub      $4, $22, $0
/* 007F0C 01DB3C0C 01000524 */  addiu       $5, $0, 0x1
/* 007F10 01DB3C10 BC97040C */  jal         SetFrameAttr__FP6CFramei
/* 007F14 01DB3C14 00000000 */   nop
.L01DB3C18_2B9418:
/* 007F18 01DB3C18 01003126 */  addiu       $17, $17, 0x1
.L01DB3C1C_2B941C:
/* 007F1C 01DB3C1C 0400222A */  slti        $2, $17, 0x4
/* 007F20 01DB3C20 D6FF4014 */  bnez        $2, .L01DB3B7C_2B937C
/* 007F24 01DB3C24 00000000 */   nop
/* 007F28 01DB3C28 E101023C */  lui         $2, %hi(argValBuff + 0x10)
/* 007F2C 01DB3C2C 50244224 */  addiu       $2, $2, %lo(argValBuff + 0x10)
/* 007F30 01DB3C30 21185400 */  addu        $3, $2, $20
/* 007F34 01DB3C34 2041023C */  lui         $2, (0x41200000 >> 16)
/* 007F38 01DB3C38 00088244 */  mtc1        $2, $f1
/* 007F3C 01DB3C3C 000060C4 */  lwc1        $f0, 0x0($3)
/* 007F40 01DB3C40 C2080046 */  mul.s       $f3, $f1, $f0
/* 007F44 01DB3C44 E101023C */  lui         $2, %hi(argValBuff + 0xC)
/* 007F48 01DB3C48 4C244224 */  addiu       $2, $2, %lo(argValBuff + 0xC)
/* 007F4C 01DB3C4C 21105400 */  addu        $2, $2, $20
/* 007F50 01DB3C50 000040C4 */  lwc1        $f0, 0x0($2)
/* 007F54 01DB3C54 82080046 */  mul.s       $f2, $f1, $f0
/* 007F58 01DB3C58 E101023C */  lui         $2, %hi(argValBuff + 0x8)
/* 007F5C 01DB3C5C 48244224 */  addiu       $2, $2, %lo(argValBuff + 0x8)
/* 007F60 01DB3C60 21105400 */  addu        $2, $2, $20
/* 007F64 01DB3C64 000040C4 */  lwc1        $f0, 0x0($2)
/* 007F68 01DB3C68 02080046 */  mul.s       $f0, $f1, $f0
/* 007F6C 01DB3C6C D003A0E7 */  swc1        $f0, 0x3D0($29)
/* 007F70 01DB3C70 D403A2E7 */  swc1        $f2, 0x3D4($29)
/* 007F74 01DB3C74 D803A3E7 */  swc1        $f3, 0x3D8($29)
/* 007F78 01DB3C78 28266072 */  paddub      $4, $19, $0
/* 007F7C 01DB3C7C D003A527 */  addiu       $5, $29, 0x3D0
/* 007F80 01DB3C80 A000798E */  lw          $25, 0xA0($19)
/* 007F84 01DB3C84 1000398F */  lw          $25, 0x10($25)
/* 007F88 01DB3C88 09F82003 */  jalr        $25
/* 007F8C 01DB3C8C 00000000 */   nop
/* 007F90 01DB3C90 E101023C */  lui         $2, %hi(argValBuff + 0x14)
/* 007F94 01DB3C94 54244224 */  addiu       $2, $2, %lo(argValBuff + 0x14)
/* 007F98 01DB3C98 21105400 */  addu        $2, $2, $20
/* 007F9C 01DB3C9C B08082C7 */  lwc1        $f2, -0x7F50($28)
/* 007FA0 01DB3CA0 000040C4 */  lwc1        $f0, 0x0($2)
/* 007FA4 01DB3CA4 02100046 */  mul.s       $f0, $f2, $f0
/* 007FA8 01DB3CA8 3443023C */  lui         $2, (0x43340000 >> 16)
/* 007FAC 01DB3CAC 00088244 */  mtc1        $2, $f1
/* 007FB0 01DB3CB0 00000000 */  nop
/* 007FB4 01DB3CB4 03030146 */  div.s       $f12, $f0, $f1
/* 007FB8 01DB3CB8 E101023C */  lui         $2, %hi(argValBuff + 0x18)
/* 007FBC 01DB3CBC 58244224 */  addiu       $2, $2, %lo(argValBuff + 0x18)
/* 007FC0 01DB3CC0 21105400 */  addu        $2, $2, $20
/* 007FC4 01DB3CC4 000040C4 */  lwc1        $f0, 0x0($2)
/* 007FC8 01DB3CC8 02100046 */  mul.s       $f0, $f2, $f0
/* 007FCC 01DB3CCC 43030146 */  div.s       $f13, $f0, $f1
/* 007FD0 01DB3CD0 E101023C */  lui         $2, %hi(argValBuff + 0x1C)
/* 007FD4 01DB3CD4 5C244224 */  addiu       $2, $2, %lo(argValBuff + 0x1C)
/* 007FD8 01DB3CD8 21105400 */  addu        $2, $2, $20
/* 007FDC 01DB3CDC 000040C4 */  lwc1        $f0, 0x0($2)
/* 007FE0 01DB3CE0 02100046 */  mul.s       $f0, $f2, $f0
/* 007FE4 01DB3CE4 83030146 */  div.s       $f14, $f0, $f1
/* 007FE8 01DB3CE8 E003ACE7 */  swc1        $f12, 0x3E0($29)
/* 007FEC 01DB3CEC E403ADE7 */  swc1        $f13, 0x3E4($29)
/* 007FF0 01DB3CF0 E803AEE7 */  swc1        $f14, 0x3E8($29)
/* 007FF4 01DB3CF4 28266072 */  paddub      $4, $19, $0
/* 007FF8 01DB3CF8 E003A527 */  addiu       $5, $29, 0x3E0
/* 007FFC 01DB3CFC A000798E */  lw          $25, 0xA0($19)
/* 008000 01DB3D00 2C00398F */  lw          $25, 0x2C($25)
/* 008004 01DB3D04 09F82003 */  jalr        $25
/* 008008 01DB3D08 00000000 */   nop
.L01DB3D0C_2B950C:
/* 00800C 01DB3D0C B000A827 */  addiu       $8, $29, 0xB0
/* 008010 01DB3D10 1001A727 */  addiu       $7, $29, 0x110
/* 008014 01DB3D14 03000624 */  addiu       $6, $0, 0x3
.L01DB3D18_2B9518:
/* 008018 01DB3D18 00000379 */  lq          $3, 0x0($8)
/* 00801C 01DB3D1C 10000279 */  lq          $2, 0x10($8)
/* 008020 01DB3D20 20000825 */  addiu       $8, $8, 0x20
/* 008024 01DB3D24 FFFFC624 */  addiu       $6, $6, -0x1
/* 008028 01DB3D28 0000E37C */  sq          $3, 0x0($7)
/* 00802C 01DB3D2C 1000E27C */  sq          $2, 0x10($7)
/* 008030 01DB3D30 2000E724 */  addiu       $7, $7, 0x20
/* 008034 01DB3D34 F8FFC01C */  bgtz        $6, .L01DB3D18_2B9518
/* 008038 01DB3D38 00000000 */   nop
.L01DB3D3C_2B953C:
/* 00803C 01DB3D3C DD01013C */  lui         $1, %hi(TEIGI_UPER)
/* 008040 01DB3D40 E05E318C */  lw          $17, %lo(TEIGI_UPER)($1)
/* 008044 01DB3D44 0000ACC6 */  lwc1        $f12, 0x0($21)
/* 008048 01DB3D48 2C44040C */  jal         fptosi
/* 00804C 01DB3D4C 00000000 */   nop
/* 008050 01DB3D50 44012216 */  bne         $17, $2, .L01DB4264_2B9A64
/* 008054 01DB3D54 00000000 */   nop
/* 008058 01DB3D58 1001A627 */  addiu       $6, $29, 0x110
/* 00805C 01DB3D5C B000A527 */  addiu       $5, $29, 0xB0
/* 008060 01DB3D60 03000424 */  addiu       $4, $0, 0x3
.L01DB3D64_2B9564:
/* 008064 01DB3D64 0000C378 */  lq          $3, 0x0($6)
/* 008068 01DB3D68 1000C278 */  lq          $2, 0x10($6)
/* 00806C 01DB3D6C 2000C624 */  addiu       $6, $6, 0x20
/* 008070 01DB3D70 FFFF8424 */  addiu       $4, $4, -0x1
/* 008074 01DB3D74 0000A37C */  sq          $3, 0x0($5)
/* 008078 01DB3D78 1000A27C */  sq          $2, 0x10($5)
/* 00807C 01DB3D7C 2000A524 */  addiu       $5, $5, 0x20
/* 008080 01DB3D80 F8FF801C */  bgtz        $4, .L01DB3D64_2B9564
/* 008084 01DB3D84 00000000 */   nop
/* 008088 01DB3D88 E101023C */  lui         $2, %hi(argValBuff + 0x20)
/* 00808C 01DB3D8C 60244224 */  addiu       $2, $2, %lo(argValBuff + 0x20)
/* 008090 01DB3D90 21105400 */  addu        $2, $2, $20
/* 008094 01DB3D94 000041C4 */  lwc1        $f1, 0x0($2)
/* 008098 01DB3D98 00008044 */  mtc1        $0, $f0
/* 00809C 01DB3D9C 00000000 */  nop
/* 0080A0 01DB3DA0 32000146 */  c.eq.s      $f0, $f1
/* 0080A4 01DB3DA4 00000000 */  nop
/* 0080A8 01DB3DA8 6F000045 */  bc1f        .L01DB3F68_2B9768
/* 0080AC 01DB3DAC 00000000 */   nop
/* 0080B0 01DB3DB0 7001A427 */  addiu       $4, $29, 0x170
/* 0080B4 01DB3DB4 DE01023C */  lui         $2, %hi(LIT_965)
/* 0080B8 01DB3DB8 E0D94524 */  addiu       $5, $2, %lo(LIT_965)
/* 0080BC 01DB3DBC 5A15040C */  jal         strcpy
/* 0080C0 01DB3DC0 00000000 */   nop
/* 0080C4 01DB3DC4 80191000 */  sll         $3, $16, 6
/* 0080C8 01DB3DC8 E101023C */  lui         $2, %hi(argStrBuff)
/* 0080CC 01DB3DCC 40044224 */  addiu       $2, $2, %lo(argStrBuff)
/* 0080D0 01DB3DD0 21284300 */  addu        $5, $2, $3
/* 0080D4 01DB3DD4 7001A427 */  addiu       $4, $29, 0x170
/* 0080D8 01DB3DD8 BC14040C */  jal         strcat
/* 0080DC 01DB3DDC 00000000 */   nop
/* 0080E0 01DB3DE0 948B858F */  lw          $5, -0x746C($28)
/* 0080E4 01DB3DE4 7001A427 */  addiu       $4, $29, 0x170
/* 0080E8 01DB3DE8 28360070 */  paddub      $6, $0, $0
/* 0080EC 01DB3DEC D8FC040C */  jal         LoadFile__FPcPvPi
/* 0080F0 01DB3DF0 00000000 */   nop
/* 0080F4 01DB3DF4 948B848F */  lw          $4, -0x746C($28)
/* 0080F8 01DB3DF8 DF01023C */  lui         $2, %hi(MapDataBuffer)
/* 0080FC 01DB3DFC B0FE4524 */  addiu       $5, $2, %lo(MapDataBuffer)
/* 008100 01DB3E00 02000624 */  addiu       $6, $0, 0x2
/* 008104 01DB3E04 283E0070 */  paddub      $7, $0, $0
/* 008108 01DB3E08 28460070 */  paddub      $8, $0, $0
/* 00810C 01DB3E0C AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 008110 01DB3E10 00000000 */   nop
/* 008114 01DB3E14 28964070 */  paddub      $18, $2, $0
/* 008118 01DB3E18 28264072 */  paddub      $4, $18, $0
/* 00811C 01DB3E1C 1001A527 */  addiu       $5, $29, 0x110
/* 008120 01DB3E20 01000624 */  addiu       $6, $0, 0x1
/* 008124 01DB3E24 40000724 */  addiu       $7, $0, 0x40
/* 008128 01DB3E28 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 00812C 01DB3E2C 00000000 */   nop
/* 008130 01DB3E30 28264072 */  paddub      $4, $18, $0
/* 008134 01DB3E34 01000524 */  addiu       $5, $0, 0x1
/* 008138 01DB3E38 BC97040C */  jal         SetFrameAttr__FP6CFramei
/* 00813C 01DB3E3C 00000000 */   nop
/* 008140 01DB3E40 AC98858F */  lw          $5, -0x6754($28)
/* 008144 01DB3E44 0100A224 */  addiu       $2, $5, 0x1
/* 008148 01DB3E48 AC9882AF */  sw          $2, -0x6754($28)
/* 00814C 01DB3E4C E201023C */  lui         $2, %hi(OP_BuildingMap2)
/* 008150 01DB3E50 40AF4424 */  addiu       $4, $2, %lo(OP_BuildingMap2)
/* 008154 01DB3E54 28364072 */  paddub      $6, $18, $0
/* 008158 01DB3E58 283E0070 */  paddub      $7, $0, $0
/* 00815C 01DB3E5C 28460070 */  paddub      $8, $0, $0
/* 008160 01DB3E60 1C0E050C */  jal         SetObject__4CMapFiP9CFrameVu1ii
/* 008164 01DB3E64 00000000 */   nop
/* 008168 01DB3E68 289E4070 */  paddub      $19, $2, $0
/* 00816C 01DB3E6C 01000324 */  addiu       $3, $0, 0x1
/* 008170 01DB3E70 E80043AC */  sw          $3, 0xE8($2)
/* 008174 01DB3E74 05000324 */  addiu       $3, $0, 0x5
/* 008178 01DB3E78 E40043AC */  sw          $3, 0xE4($2)
/* 00817C 01DB3E7C E101033C */  lui         $3, %hi(argValBuff + 0x10)
/* 008180 01DB3E80 50246324 */  addiu       $3, $3, %lo(argValBuff + 0x10)
/* 008184 01DB3E84 21207400 */  addu        $4, $3, $20
/* 008188 01DB3E88 2041033C */  lui         $3, (0x41200000 >> 16)
/* 00818C 01DB3E8C 00088344 */  mtc1        $3, $f1
/* 008190 01DB3E90 000080C4 */  lwc1        $f0, 0x0($4)
/* 008194 01DB3E94 C2080046 */  mul.s       $f3, $f1, $f0
/* 008198 01DB3E98 E101033C */  lui         $3, %hi(argValBuff + 0xC)
/* 00819C 01DB3E9C 4C246324 */  addiu       $3, $3, %lo(argValBuff + 0xC)
/* 0081A0 01DB3EA0 21187400 */  addu        $3, $3, $20
/* 0081A4 01DB3EA4 000060C4 */  lwc1        $f0, 0x0($3)
/* 0081A8 01DB3EA8 82080046 */  mul.s       $f2, $f1, $f0
/* 0081AC 01DB3EAC E101033C */  lui         $3, %hi(argValBuff + 0x8)
/* 0081B0 01DB3EB0 48246324 */  addiu       $3, $3, %lo(argValBuff + 0x8)
/* 0081B4 01DB3EB4 21187400 */  addu        $3, $3, $20
/* 0081B8 01DB3EB8 000060C4 */  lwc1        $f0, 0x0($3)
/* 0081BC 01DB3EBC 02080046 */  mul.s       $f0, $f1, $f0
/* 0081C0 01DB3EC0 F003A0E7 */  swc1        $f0, 0x3F0($29)
/* 0081C4 01DB3EC4 F403A2E7 */  swc1        $f2, 0x3F4($29)
/* 0081C8 01DB3EC8 F803A3E7 */  swc1        $f3, 0x3F8($29)
/* 0081CC 01DB3ECC 28266072 */  paddub      $4, $19, $0
/* 0081D0 01DB3ED0 F003A527 */  addiu       $5, $29, 0x3F0
/* 0081D4 01DB3ED4 A000598C */  lw          $25, 0xA0($2)
/* 0081D8 01DB3ED8 1000398F */  lw          $25, 0x10($25)
/* 0081DC 01DB3EDC 09F82003 */  jalr        $25
/* 0081E0 01DB3EE0 00000000 */   nop
/* 0081E4 01DB3EE4 E101023C */  lui         $2, %hi(argValBuff + 0x14)
/* 0081E8 01DB3EE8 54244224 */  addiu       $2, $2, %lo(argValBuff + 0x14)
/* 0081EC 01DB3EEC 21105400 */  addu        $2, $2, $20
/* 0081F0 01DB3EF0 B08082C7 */  lwc1        $f2, -0x7F50($28)
/* 0081F4 01DB3EF4 000040C4 */  lwc1        $f0, 0x0($2)
/* 0081F8 01DB3EF8 02100046 */  mul.s       $f0, $f2, $f0
/* 0081FC 01DB3EFC 3443023C */  lui         $2, (0x43340000 >> 16)
/* 008200 01DB3F00 00088244 */  mtc1        $2, $f1
/* 008204 01DB3F04 00000000 */  nop
/* 008208 01DB3F08 03030146 */  div.s       $f12, $f0, $f1
/* 00820C 01DB3F0C E101023C */  lui         $2, %hi(argValBuff + 0x18)
/* 008210 01DB3F10 58244224 */  addiu       $2, $2, %lo(argValBuff + 0x18)
/* 008214 01DB3F14 21105400 */  addu        $2, $2, $20
/* 008218 01DB3F18 000040C4 */  lwc1        $f0, 0x0($2)
/* 00821C 01DB3F1C 02100046 */  mul.s       $f0, $f2, $f0
/* 008220 01DB3F20 43030146 */  div.s       $f13, $f0, $f1
/* 008224 01DB3F24 E101023C */  lui         $2, %hi(argValBuff + 0x1C)
/* 008228 01DB3F28 5C244224 */  addiu       $2, $2, %lo(argValBuff + 0x1C)
/* 00822C 01DB3F2C 21105400 */  addu        $2, $2, $20
/* 008230 01DB3F30 000040C4 */  lwc1        $f0, 0x0($2)
/* 008234 01DB3F34 02100046 */  mul.s       $f0, $f2, $f0
/* 008238 01DB3F38 83030146 */  div.s       $f14, $f0, $f1
/* 00823C 01DB3F3C 0004ACE7 */  swc1        $f12, 0x400($29)
/* 008240 01DB3F40 0404ADE7 */  swc1        $f13, 0x404($29)
/* 008244 01DB3F44 0804AEE7 */  swc1        $f14, 0x408($29)
/* 008248 01DB3F48 28266072 */  paddub      $4, $19, $0
/* 00824C 01DB3F4C 0004A527 */  addiu       $5, $29, 0x400
/* 008250 01DB3F50 A000798E */  lw          $25, 0xA0($19)
/* 008254 01DB3F54 2C00398F */  lw          $25, 0x2C($25)
/* 008258 01DB3F58 09F82003 */  jalr        $25
/* 00825C 01DB3F5C 00000000 */   nop
/* 008260 01DB3F60 B4000010 */  b           .L01DB4234_2B9A34
/* 008264 01DB3F64 00000000 */   nop
.L01DB3F68_2B9768:
/* 008268 01DB3F68 288E0070 */  paddub      $17, $0, $0
/* 00826C 01DB3F6C 22000010 */  b           .L01DB3FF8_2B97F8
/* 008270 01DB3F70 00000000 */   nop
.L01DB3F74_2B9774:
/* 008274 01DB3F74 21101102 */  addu        $2, $16, $17
/* 008278 01DB3F78 80190200 */  sll         $3, $2, 6
/* 00827C 01DB3F7C E101023C */  lui         $2, %hi(argStrBuff)
/* 008280 01DB3F80 40044224 */  addiu       $2, $2, %lo(argStrBuff)
/* 008284 01DB3F84 21B04300 */  addu        $22, $2, $3
/* 008288 01DB3F88 0000C282 */  lb          $2, 0x0($22)
/* 00828C 01DB3F8C 14004010 */  beqz        $2, .L01DB3FE0_2B97E0
/* 008290 01DB3F90 00000000 */   nop
/* 008294 01DB3F94 C0111100 */  sll         $2, $17, 7
/* 008298 01DB3F98 21105D00 */  addu        $2, $2, $29
/* 00829C 01DB3F9C 70015324 */  addiu       $19, $2, 0x170
/* 0082A0 01DB3FA0 28266072 */  paddub      $4, $19, $0
/* 0082A4 01DB3FA4 DE01023C */  lui         $2, %hi(LIT_965)
/* 0082A8 01DB3FA8 E0D94524 */  addiu       $5, $2, %lo(LIT_965)
/* 0082AC 01DB3FAC 5A15040C */  jal         strcpy
/* 0082B0 01DB3FB0 00000000 */   nop
/* 0082B4 01DB3FB4 28266072 */  paddub      $4, $19, $0
/* 0082B8 01DB3FB8 282EC072 */  paddub      $5, $22, $0
/* 0082BC 01DB3FBC BC14040C */  jal         strcat
/* 0082C0 01DB3FC0 00000000 */   nop
/* 0082C4 01DB3FC4 80181100 */  sll         $3, $17, 2
/* 0082C8 01DB3FC8 E201023C */  lui         $2, %hi(LODNameBuff)
/* 0082CC 01DB3FCC 40A44224 */  addiu       $2, $2, %lo(LODNameBuff)
/* 0082D0 01DB3FD0 21104300 */  addu        $2, $2, $3
/* 0082D4 01DB3FD4 000053AC */  sw          $19, 0x0($2)
/* 0082D8 01DB3FD8 06000010 */  b           .L01DB3FF4_2B97F4
/* 0082DC 01DB3FDC 00000000 */   nop
.L01DB3FE0_2B97E0:
/* 0082E0 01DB3FE0 80181100 */  sll         $3, $17, 2
/* 0082E4 01DB3FE4 E201023C */  lui         $2, %hi(LODNameBuff)
/* 0082E8 01DB3FE8 40A44224 */  addiu       $2, $2, %lo(LODNameBuff)
/* 0082EC 01DB3FEC 21104300 */  addu        $2, $2, $3
/* 0082F0 01DB3FF0 000040AC */  sw          $0, 0x0($2)
.L01DB3FF4_2B97F4:
/* 0082F4 01DB3FF4 01003126 */  addiu       $17, $17, 0x1
.L01DB3FF8_2B97F8:
/* 0082F8 01DB3FF8 0400222A */  slti        $2, $17, 0x4
/* 0082FC 01DB3FFC DDFF4014 */  bnez        $2, .L01DB3F74_2B9774
/* 008300 01DB4000 00000000 */   nop
/* 008304 01DB4004 7003A427 */  addiu       $4, $29, 0x370
/* 008308 01DB4008 E201023C */  lui         $2, %hi(LODNameBuff)
/* 00830C 01DB400C 40A44524 */  addiu       $5, $2, %lo(LODNameBuff)
/* 008310 01DB4010 948B868F */  lw          $6, -0x746C($28)
/* 008314 01DB4014 283E0070 */  paddub      $7, $0, $0
/* 008318 01DB4018 FC9D040C */  jal         LoadLODData__FPP9CFrameVu1PPcPUii
/* 00831C 01DB401C 00000000 */   nop
/* 008320 01DB4020 A898858F */  lw          $5, -0x6758($28)
/* 008324 01DB4024 0100A224 */  addiu       $2, $5, 0x1
/* 008328 01DB4028 A89882AF */  sw          $2, -0x6758($28)
/* 00832C 01DB402C E201023C */  lui         $2, %hi(OP_BuildingMap2)
/* 008330 01DB4030 40AF4424 */  addiu       $4, $2, %lo(OP_BuildingMap2)
/* 008334 01DB4034 600E050C */  jal         GetObject__4CMapFi
/* 008338 01DB4038 00000000 */   nop
/* 00833C 01DB403C 289E4070 */  paddub      $19, $2, $0
/* 008340 01DB4040 01000324 */  addiu       $3, $0, 0x1
/* 008344 01DB4044 E80043AC */  sw          $3, 0xE8($2)
/* 008348 01DB4048 E40043AC */  sw          $3, 0xE4($2)
/* 00834C 01DB404C E201023C */  lui         $2, %hi(OP_BuildingMap2 + 0x18)
/* 008350 01DB4050 58AF4424 */  addiu       $4, $2, %lo(OP_BuildingMap2 + 0x18)
/* 008354 01DB4054 281E0070 */  paddub      $3, $0, $0
/* 008358 01DB4058 09000010 */  b           .L01DB4080_2B9880
/* 00835C 01DB405C 00000000 */   nop
.L01DB4060_2B9860:
/* 008360 01DB4060 80280300 */  sll         $5, $3, 2
/* 008364 01DB4064 DD01023C */  lui         $2, %hi(levelOfDitialZ)
/* 008368 01DB4068 30614224 */  addiu       $2, $2, %lo(levelOfDitialZ)
/* 00836C 01DB406C 21104500 */  addu        $2, $2, $5
/* 008370 01DB4070 000040C4 */  lwc1        $f0, 0x0($2)
/* 008374 01DB4074 21108500 */  addu        $2, $4, $5
/* 008378 01DB4078 000040E4 */  swc1        $f0, 0x0($2)
/* 00837C 01DB407C 01006324 */  addiu       $3, $3, 0x1
.L01DB4080_2B9880:
/* 008380 01DB4080 04006228 */  slti        $2, $3, 0x4
/* 008384 01DB4084 F6FF4014 */  bnez        $2, .L01DB4060_2B9860
/* 008388 01DB4088 00000000 */   nop
/* 00838C 01DB408C 100080AC */  sw          $0, 0x10($4)
/* 008390 01DB4090 03000224 */  addiu       $2, $0, 0x3
/* 008394 01DB4094 140082AC */  sw          $2, 0x14($4)
/* 008398 01DB4098 288E0070 */  paddub      $17, $0, $0
/* 00839C 01DB409C 29000010 */  b           .L01DB4144_2B9944
/* 0083A0 01DB40A0 00000000 */   nop
.L01DB40A4_2B98A4:
/* 0083A4 01DB40A4 80101100 */  sll         $2, $17, 2
/* 0083A8 01DB40A8 21105D00 */  addu        $2, $2, $29
/* 0083AC 01DB40AC 70035624 */  addiu       $22, $2, 0x370
/* 0083B0 01DB40B0 28266072 */  paddub      $4, $19, $0
/* 0083B4 01DB40B4 0000C58E */  lw          $5, 0x0($22)
/* 0083B8 01DB40B8 28362072 */  paddub      $6, $17, $0
/* 0083BC 01DB40BC 305C050C */  jal         SetFrame__12CObjectFrameFP9CFrameVu1i
/* 0083C0 01DB40C0 00000000 */   nop
/* 0083C4 01DB40C4 0000C48E */  lw          $4, 0x0($22)
/* 0083C8 01DB40C8 1D008010 */  beqz        $4, .L01DB4140_2B9940
/* 0083CC 01DB40CC 00000000 */   nop
/* 0083D0 01DB40D0 1001A527 */  addiu       $5, $29, 0x110
/* 0083D4 01DB40D4 01000624 */  addiu       $6, $0, 0x1
/* 0083D8 01DB40D8 40000724 */  addiu       $7, $0, 0x40
/* 0083DC 01DB40DC D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 0083E0 01DB40E0 00000000 */   nop
/* 0083E4 01DB40E4 0000C48E */  lw          $4, 0x0($22)
/* 0083E8 01DB40E8 01000524 */  addiu       $5, $0, 0x1
/* 0083EC 01DB40EC BC97040C */  jal         SetFrameAttr__FP6CFramei
/* 0083F0 01DB40F0 00000000 */   nop
/* 0083F4 01DB40F4 28264072 */  paddub      $4, $18, $0
/* 0083F8 01DB40F8 DE01023C */  lui         $2, %hi(LIT_967)
/* 0083FC 01DB40FC E8D94524 */  addiu       $5, $2, %lo(LIT_967)
/* 008400 01DB4100 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 008404 01DB4104 00000000 */   nop
/* 008408 01DB4108 28B64070 */  paddub      $22, $2, $0
/* 00840C 01DB410C 0C00C012 */  beqz        $22, .L01DB4140_2B9940
/* 008410 01DB4110 00000000 */   nop
/* 008414 01DB4114 01000624 */  addiu       $6, $0, 0x1
/* 008418 01DB4118 6001A6A7 */  sh          $6, 0x160($29)
/* 00841C 01DB411C 2826C072 */  paddub      $4, $22, $0
/* 008420 01DB4120 1001A527 */  addiu       $5, $29, 0x110
/* 008424 01DB4124 40000724 */  addiu       $7, $0, 0x40
/* 008428 01DB4128 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 00842C 01DB412C 00000000 */   nop
/* 008430 01DB4130 2826C072 */  paddub      $4, $22, $0
/* 008434 01DB4134 01000524 */  addiu       $5, $0, 0x1
/* 008438 01DB4138 BC97040C */  jal         SetFrameAttr__FP6CFramei
/* 00843C 01DB413C 00000000 */   nop
.L01DB4140_2B9940:
/* 008440 01DB4140 01003126 */  addiu       $17, $17, 0x1
.L01DB4144_2B9944:
/* 008444 01DB4144 0400222A */  slti        $2, $17, 0x4
/* 008448 01DB4148 D6FF4014 */  bnez        $2, .L01DB40A4_2B98A4
/* 00844C 01DB414C 00000000 */   nop
/* 008450 01DB4150 E101023C */  lui         $2, %hi(argValBuff + 0x10)
/* 008454 01DB4154 50244224 */  addiu       $2, $2, %lo(argValBuff + 0x10)
/* 008458 01DB4158 21185400 */  addu        $3, $2, $20
/* 00845C 01DB415C 2041023C */  lui         $2, (0x41200000 >> 16)
/* 008460 01DB4160 00088244 */  mtc1        $2, $f1
/* 008464 01DB4164 000060C4 */  lwc1        $f0, 0x0($3)
/* 008468 01DB4168 C2080046 */  mul.s       $f3, $f1, $f0
/* 00846C 01DB416C E101023C */  lui         $2, %hi(argValBuff + 0xC)
/* 008470 01DB4170 4C244224 */  addiu       $2, $2, %lo(argValBuff + 0xC)
/* 008474 01DB4174 21105400 */  addu        $2, $2, $20
/* 008478 01DB4178 000040C4 */  lwc1        $f0, 0x0($2)
/* 00847C 01DB417C 82080046 */  mul.s       $f2, $f1, $f0
/* 008480 01DB4180 E101023C */  lui         $2, %hi(argValBuff + 0x8)
/* 008484 01DB4184 48244224 */  addiu       $2, $2, %lo(argValBuff + 0x8)
/* 008488 01DB4188 21105400 */  addu        $2, $2, $20
/* 00848C 01DB418C 000040C4 */  lwc1        $f0, 0x0($2)
/* 008490 01DB4190 02080046 */  mul.s       $f0, $f1, $f0
/* 008494 01DB4194 1004A0E7 */  swc1        $f0, 0x410($29)
/* 008498 01DB4198 1404A2E7 */  swc1        $f2, 0x414($29)
/* 00849C 01DB419C 1804A3E7 */  swc1        $f3, 0x418($29)
/* 0084A0 01DB41A0 28266072 */  paddub      $4, $19, $0
/* 0084A4 01DB41A4 1004A527 */  addiu       $5, $29, 0x410
/* 0084A8 01DB41A8 A000798E */  lw          $25, 0xA0($19)
/* 0084AC 01DB41AC 1000398F */  lw          $25, 0x10($25)
/* 0084B0 01DB41B0 09F82003 */  jalr        $25
/* 0084B4 01DB41B4 00000000 */   nop
/* 0084B8 01DB41B8 E101023C */  lui         $2, %hi(argValBuff + 0x14)
/* 0084BC 01DB41BC 54244224 */  addiu       $2, $2, %lo(argValBuff + 0x14)
/* 0084C0 01DB41C0 21105400 */  addu        $2, $2, $20
/* 0084C4 01DB41C4 B08082C7 */  lwc1        $f2, -0x7F50($28)
/* 0084C8 01DB41C8 000040C4 */  lwc1        $f0, 0x0($2)
/* 0084CC 01DB41CC 02100046 */  mul.s       $f0, $f2, $f0
/* 0084D0 01DB41D0 3443023C */  lui         $2, (0x43340000 >> 16)
/* 0084D4 01DB41D4 00088244 */  mtc1        $2, $f1
/* 0084D8 01DB41D8 00000000 */  nop
/* 0084DC 01DB41DC 03030146 */  div.s       $f12, $f0, $f1
/* 0084E0 01DB41E0 E101023C */  lui         $2, %hi(argValBuff + 0x18)
/* 0084E4 01DB41E4 58244224 */  addiu       $2, $2, %lo(argValBuff + 0x18)
/* 0084E8 01DB41E8 21105400 */  addu        $2, $2, $20
/* 0084EC 01DB41EC 000040C4 */  lwc1        $f0, 0x0($2)
/* 0084F0 01DB41F0 02100046 */  mul.s       $f0, $f2, $f0
/* 0084F4 01DB41F4 43030146 */  div.s       $f13, $f0, $f1
/* 0084F8 01DB41F8 E101023C */  lui         $2, %hi(argValBuff + 0x1C)
/* 0084FC 01DB41FC 5C244224 */  addiu       $2, $2, %lo(argValBuff + 0x1C)
/* 008500 01DB4200 21105400 */  addu        $2, $2, $20
/* 008504 01DB4204 000040C4 */  lwc1        $f0, 0x0($2)
/* 008508 01DB4208 02100046 */  mul.s       $f0, $f2, $f0
/* 00850C 01DB420C 83030146 */  div.s       $f14, $f0, $f1
/* 008510 01DB4210 2004ACE7 */  swc1        $f12, 0x420($29)
/* 008514 01DB4214 2404ADE7 */  swc1        $f13, 0x424($29)
/* 008518 01DB4218 2804AEE7 */  swc1        $f14, 0x428($29)
/* 00851C 01DB421C 28266072 */  paddub      $4, $19, $0
/* 008520 01DB4220 2004A527 */  addiu       $5, $29, 0x420
/* 008524 01DB4224 A000798E */  lw          $25, 0xA0($19)
/* 008528 01DB4228 2C00398F */  lw          $25, 0x2C($25)
/* 00852C 01DB422C 09F82003 */  jalr        $25
/* 008530 01DB4230 00000000 */   nop
.L01DB4234_2B9A34:
/* 008534 01DB4234 B000A827 */  addiu       $8, $29, 0xB0
/* 008538 01DB4238 1001A727 */  addiu       $7, $29, 0x110
/* 00853C 01DB423C 03000624 */  addiu       $6, $0, 0x3
.L01DB4240_2B9A40:
/* 008540 01DB4240 00000379 */  lq          $3, 0x0($8)
/* 008544 01DB4244 10000279 */  lq          $2, 0x10($8)
/* 008548 01DB4248 20000825 */  addiu       $8, $8, 0x20
/* 00854C 01DB424C FFFFC624 */  addiu       $6, $6, -0x1
/* 008550 01DB4250 0000E37C */  sq          $3, 0x0($7)
/* 008554 01DB4254 1000E27C */  sq          $2, 0x10($7)
/* 008558 01DB4258 2000E724 */  addiu       $7, $7, 0x20
/* 00855C 01DB425C F8FFC01C */  bgtz        $6, .L01DB4240_2B9A40
/* 008560 01DB4260 00000000 */   nop
.L01DB4264_2B9A64:
/* 008564 01DB4264 DD01013C */  lui         $1, %hi(TEIGI_S_VOLUME)
/* 008568 01DB4268 805F318C */  lw          $17, %lo(TEIGI_S_VOLUME)($1)
/* 00856C 01DB426C 0000ACC6 */  lwc1        $f12, 0x0($21)
/* 008570 01DB4270 2C44040C */  jal         fptosi
/* 008574 01DB4274 00000000 */   nop
/* 008578 01DB4278 52002216 */  bne         $17, $2, .L01DB43C4_2B9BC4
/* 00857C 01DB427C 00000000 */   nop
/* 008580 01DB4280 7001A427 */  addiu       $4, $29, 0x170
/* 008584 01DB4284 DE01023C */  lui         $2, %hi(LIT_965)
/* 008588 01DB4288 E0D94524 */  addiu       $5, $2, %lo(LIT_965)
/* 00858C 01DB428C 5A15040C */  jal         strcpy
/* 008590 01DB4290 00000000 */   nop
/* 008594 01DB4294 80191000 */  sll         $3, $16, 6
/* 008598 01DB4298 E101023C */  lui         $2, %hi(argStrBuff)
/* 00859C 01DB429C 40044224 */  addiu       $2, $2, %lo(argStrBuff)
/* 0085A0 01DB42A0 21284300 */  addu        $5, $2, $3
/* 0085A4 01DB42A4 7001A427 */  addiu       $4, $29, 0x170
/* 0085A8 01DB42A8 BC14040C */  jal         strcat
/* 0085AC 01DB42AC 00000000 */   nop
/* 0085B0 01DB42B0 948B858F */  lw          $5, -0x746C($28)
/* 0085B4 01DB42B4 7001A427 */  addiu       $4, $29, 0x170
/* 0085B8 01DB42B8 28360070 */  paddub      $6, $0, $0
/* 0085BC 01DB42BC D8FC040C */  jal         LoadFile__FPcPvPi
/* 0085C0 01DB42C0 00000000 */   nop
/* 0085C4 01DB42C4 948B848F */  lw          $4, -0x746C($28)
/* 0085C8 01DB42C8 0E000524 */  addiu       $5, $0, 0xE
/* 0085CC 01DB42CC 28360070 */  paddub      $6, $0, $0
/* 0085D0 01DB42D0 289D040C */  jal         LoadMDSFile__FPUiii
/* 0085D4 01DB42D4 00000000 */   nop
/* 0085D8 01DB42D8 9098838F */  lw          $3, -0x6770($28)
/* 0085DC 01DB42DC 80200300 */  sll         $4, $3, 2
/* 0085E0 01DB42E0 E101033C */  lui         $3, %hi(ShadowModel)
/* 0085E4 01DB42E4 10E76324 */  addiu       $3, $3, %lo(ShadowModel)
/* 0085E8 01DB42E8 21206400 */  addu        $4, $3, $4
/* 0085EC 01DB42EC 000082AC */  sw          $2, 0x0($4)
/* 0085F0 01DB42F0 E101023C */  lui         $2, %hi(argValBuff + 0x10)
/* 0085F4 01DB42F4 50244224 */  addiu       $2, $2, %lo(argValBuff + 0x10)
/* 0085F8 01DB42F8 21185400 */  addu        $3, $2, $20
/* 0085FC 01DB42FC 2041023C */  lui         $2, (0x41200000 >> 16)
/* 008600 01DB4300 00088244 */  mtc1        $2, $f1
/* 008604 01DB4304 000060C4 */  lwc1        $f0, 0x0($3)
/* 008608 01DB4308 820B0046 */  mul.s       $f14, $f1, $f0
/* 00860C 01DB430C E101023C */  lui         $2, %hi(argValBuff + 0x8)
/* 008610 01DB4310 48244224 */  addiu       $2, $2, %lo(argValBuff + 0x8)
/* 008614 01DB4314 21105400 */  addu        $2, $2, $20
/* 008618 01DB4318 000040C4 */  lwc1        $f0, 0x0($2)
/* 00861C 01DB431C 020B0046 */  mul.s       $f12, $f1, $f0
/* 008620 01DB4320 E101023C */  lui         $2, %hi(argValBuff + 0xC)
/* 008624 01DB4324 4C244224 */  addiu       $2, $2, %lo(argValBuff + 0xC)
/* 008628 01DB4328 21105400 */  addu        $2, $2, $20
/* 00862C 01DB432C 000040C4 */  lwc1        $f0, 0x0($2)
/* 008630 01DB4330 420B0046 */  mul.s       $f13, $f1, $f0
/* 008634 01DB4334 0000848C */  lw          $4, 0x0($4)
/* 008638 01DB4338 A09F040C */  jal         SetPosition__6CFrameFfff
/* 00863C 01DB433C 00000000 */   nop
/* 008640 01DB4340 E101023C */  lui         $2, %hi(argValBuff + 0x14)
/* 008644 01DB4344 54244224 */  addiu       $2, $2, %lo(argValBuff + 0x14)
/* 008648 01DB4348 21105400 */  addu        $2, $2, $20
/* 00864C 01DB434C B08082C7 */  lwc1        $f2, -0x7F50($28)
/* 008650 01DB4350 000040C4 */  lwc1        $f0, 0x0($2)
/* 008654 01DB4354 02100046 */  mul.s       $f0, $f2, $f0
/* 008658 01DB4358 3443023C */  lui         $2, (0x43340000 >> 16)
/* 00865C 01DB435C 00088244 */  mtc1        $2, $f1
/* 008660 01DB4360 00000000 */  nop
/* 008664 01DB4364 03030146 */  div.s       $f12, $f0, $f1
/* 008668 01DB4368 E101023C */  lui         $2, %hi(argValBuff + 0x18)
/* 00866C 01DB436C 58244224 */  addiu       $2, $2, %lo(argValBuff + 0x18)
/* 008670 01DB4370 21105400 */  addu        $2, $2, $20
/* 008674 01DB4374 000040C4 */  lwc1        $f0, 0x0($2)
/* 008678 01DB4378 02100046 */  mul.s       $f0, $f2, $f0
/* 00867C 01DB437C 43030146 */  div.s       $f13, $f0, $f1
/* 008680 01DB4380 E101023C */  lui         $2, %hi(argValBuff + 0x1C)
/* 008684 01DB4384 5C244224 */  addiu       $2, $2, %lo(argValBuff + 0x1C)
/* 008688 01DB4388 21105400 */  addu        $2, $2, $20
/* 00868C 01DB438C 000040C4 */  lwc1        $f0, 0x0($2)
/* 008690 01DB4390 02100046 */  mul.s       $f0, $f2, $f0
/* 008694 01DB4394 83030146 */  div.s       $f14, $f0, $f1
/* 008698 01DB4398 9098828F */  lw          $2, -0x6770($28)
/* 00869C 01DB439C 80180200 */  sll         $3, $2, 2
/* 0086A0 01DB43A0 E101023C */  lui         $2, %hi(ShadowModel)
/* 0086A4 01DB43A4 10E74224 */  addiu       $2, $2, %lo(ShadowModel)
/* 0086A8 01DB43A8 21104300 */  addu        $2, $2, $3
/* 0086AC 01DB43AC 0000448C */  lw          $4, 0x0($2)
/* 0086B0 01DB43B0 70A3040C */  jal         SetRotation__6CFrameFfff
/* 0086B4 01DB43B4 00000000 */   nop
/* 0086B8 01DB43B8 9098828F */  lw          $2, -0x6770($28)
/* 0086BC 01DB43BC 01004224 */  addiu       $2, $2, 0x1
/* 0086C0 01DB43C0 909882AF */  sw          $2, -0x6770($28)
.L01DB43C4_2B9BC4:
/* 0086C4 01DB43C4 DD01013C */  lui         $1, %hi(TEIGI_ADD_CRD)
/* 0086C8 01DB43C8 505F318C */  lw          $17, %lo(TEIGI_ADD_CRD)($1)
/* 0086CC 01DB43CC 0000ACC6 */  lwc1        $f12, 0x0($21)
/* 0086D0 01DB43D0 2C44040C */  jal         fptosi
/* 0086D4 01DB43D4 00000000 */   nop
/* 0086D8 01DB43D8 50002216 */  bne         $17, $2, .L01DB451C_2B9D1C
/* 0086DC 01DB43DC 00000000 */   nop
/* 0086E0 01DB43E0 7001A427 */  addiu       $4, $29, 0x170
/* 0086E4 01DB43E4 DE01023C */  lui         $2, %hi(LIT_965)
/* 0086E8 01DB43E8 E0D94524 */  addiu       $5, $2, %lo(LIT_965)
/* 0086EC 01DB43EC 5A15040C */  jal         strcpy
/* 0086F0 01DB43F0 00000000 */   nop
/* 0086F4 01DB43F4 80191000 */  sll         $3, $16, 6
/* 0086F8 01DB43F8 E101023C */  lui         $2, %hi(argStrBuff)
/* 0086FC 01DB43FC 40044224 */  addiu       $2, $2, %lo(argStrBuff)
/* 008700 01DB4400 21284300 */  addu        $5, $2, $3
/* 008704 01DB4404 7001A427 */  addiu       $4, $29, 0x170
/* 008708 01DB4408 BC14040C */  jal         strcat
/* 00870C 01DB440C 00000000 */   nop
/* 008710 01DB4410 948B858F */  lw          $5, -0x746C($28)
/* 008714 01DB4414 7001A427 */  addiu       $4, $29, 0x170
/* 008718 01DB4418 28360070 */  paddub      $6, $0, $0
/* 00871C 01DB441C D8FC040C */  jal         LoadFile__FPcPvPi
/* 008720 01DB4420 00000000 */   nop
/* 008724 01DB4424 948B848F */  lw          $4, -0x746C($28)
/* 008728 01DB4428 009E040C */  jal         LoadCollisionFile__FPUi
/* 00872C 01DB442C 00000000 */   nop
/* 008730 01DB4430 8C98838F */  lw          $3, -0x6774($28)
/* 008734 01DB4434 80200300 */  sll         $4, $3, 2
/* 008738 01DB4438 E101033C */  lui         $3, %hi(ColModel)
/* 00873C 01DB443C 10E66324 */  addiu       $3, $3, %lo(ColModel)
/* 008740 01DB4440 21206400 */  addu        $4, $3, $4
/* 008744 01DB4444 000082AC */  sw          $2, 0x0($4)
/* 008748 01DB4448 E101023C */  lui         $2, %hi(argValBuff + 0x8)
/* 00874C 01DB444C 48244224 */  addiu       $2, $2, %lo(argValBuff + 0x8)
/* 008750 01DB4450 21185400 */  addu        $3, $2, $20
/* 008754 01DB4454 2041023C */  lui         $2, (0x41200000 >> 16)
/* 008758 01DB4458 00088244 */  mtc1        $2, $f1
/* 00875C 01DB445C 000060C4 */  lwc1        $f0, 0x0($3)
/* 008760 01DB4460 020B0046 */  mul.s       $f12, $f1, $f0
/* 008764 01DB4464 E101023C */  lui         $2, %hi(argValBuff + 0xC)
/* 008768 01DB4468 4C244224 */  addiu       $2, $2, %lo(argValBuff + 0xC)
/* 00876C 01DB446C 21105400 */  addu        $2, $2, $20
/* 008770 01DB4470 000040C4 */  lwc1        $f0, 0x0($2)
/* 008774 01DB4474 420B0046 */  mul.s       $f13, $f1, $f0
/* 008778 01DB4478 E101023C */  lui         $2, %hi(argValBuff + 0x10)
/* 00877C 01DB447C 50244224 */  addiu       $2, $2, %lo(argValBuff + 0x10)
/* 008780 01DB4480 21105400 */  addu        $2, $2, $20
/* 008784 01DB4484 000040C4 */  lwc1        $f0, 0x0($2)
/* 008788 01DB4488 820B0046 */  mul.s       $f14, $f1, $f0
/* 00878C 01DB448C 0000848C */  lw          $4, 0x0($4)
/* 008790 01DB4490 A09F040C */  jal         SetPosition__6CFrameFfff
/* 008794 01DB4494 00000000 */   nop
/* 008798 01DB4498 E101023C */  lui         $2, %hi(argValBuff + 0x14)
/* 00879C 01DB449C 54244224 */  addiu       $2, $2, %lo(argValBuff + 0x14)
/* 0087A0 01DB44A0 21105400 */  addu        $2, $2, $20
/* 0087A4 01DB44A4 B08082C7 */  lwc1        $f2, -0x7F50($28)
/* 0087A8 01DB44A8 000040C4 */  lwc1        $f0, 0x0($2)
/* 0087AC 01DB44AC 02100046 */  mul.s       $f0, $f2, $f0
/* 0087B0 01DB44B0 3443023C */  lui         $2, (0x43340000 >> 16)
/* 0087B4 01DB44B4 00088244 */  mtc1        $2, $f1
/* 0087B8 01DB44B8 00000000 */  nop
/* 0087BC 01DB44BC 03030146 */  div.s       $f12, $f0, $f1
/* 0087C0 01DB44C0 E101023C */  lui         $2, %hi(argValBuff + 0x18)
/* 0087C4 01DB44C4 58244224 */  addiu       $2, $2, %lo(argValBuff + 0x18)
/* 0087C8 01DB44C8 21105400 */  addu        $2, $2, $20
/* 0087CC 01DB44CC 000040C4 */  lwc1        $f0, 0x0($2)
/* 0087D0 01DB44D0 02100046 */  mul.s       $f0, $f2, $f0
/* 0087D4 01DB44D4 43030146 */  div.s       $f13, $f0, $f1
/* 0087D8 01DB44D8 E101023C */  lui         $2, %hi(argValBuff + 0x1C)
/* 0087DC 01DB44DC 5C244224 */  addiu       $2, $2, %lo(argValBuff + 0x1C)
/* 0087E0 01DB44E0 21105400 */  addu        $2, $2, $20
/* 0087E4 01DB44E4 000040C4 */  lwc1        $f0, 0x0($2)
/* 0087E8 01DB44E8 02100046 */  mul.s       $f0, $f2, $f0
/* 0087EC 01DB44EC 83030146 */  div.s       $f14, $f0, $f1
/* 0087F0 01DB44F0 8C98828F */  lw          $2, -0x6774($28)
/* 0087F4 01DB44F4 80180200 */  sll         $3, $2, 2
/* 0087F8 01DB44F8 E101023C */  lui         $2, %hi(ColModel)
/* 0087FC 01DB44FC 10E64224 */  addiu       $2, $2, %lo(ColModel)
/* 008800 01DB4500 21104300 */  addu        $2, $2, $3
/* 008804 01DB4504 0000448C */  lw          $4, 0x0($2)
/* 008808 01DB4508 70A3040C */  jal         SetRotation__6CFrameFfff
/* 00880C 01DB450C 00000000 */   nop
/* 008810 01DB4510 8C98828F */  lw          $2, -0x6774($28)
/* 008814 01DB4514 01004224 */  addiu       $2, $2, 0x1
/* 008818 01DB4518 8C9882AF */  sw          $2, -0x6774($28)
.L01DB451C_2B9D1C:
/* 00881C 01DB451C DD01013C */  lui         $1, %hi(TEIGI_PROJECTION)
/* 008820 01DB4520 A85F318C */  lw          $17, %lo(TEIGI_PROJECTION)($1)
/* 008824 01DB4524 0000B4C6 */  lwc1        $f20, 0x0($21)
/* 008828 01DB4528 06A30046 */  mov.s       $f12, $f20
/* 00882C 01DB452C 2C44040C */  jal         fptosi
/* 008830 01DB4530 00000000 */   nop
/* 008834 01DB4534 06002216 */  bne         $17, $2, .L01DB4550_2B9D50
/* 008838 01DB4538 00000000 */   nop
/* 00883C 01DB453C E101023C */  lui         $2, %hi(argValBuff + 0x4)
/* 008840 01DB4540 44244224 */  addiu       $2, $2, %lo(argValBuff + 0x4)
/* 008844 01DB4544 21105400 */  addu        $2, $2, $20
/* 008848 01DB4548 000040C4 */  lwc1        $f0, 0x0($2)
/* 00884C 01DB454C 508A80E7 */  swc1        $f0, -0x75B0($28)
.L01DB4550_2B9D50:
/* 008850 01DB4550 DD01013C */  lui         $1, %hi(TEIGI_OBJ_ROT)
/* 008854 01DB4554 C05F318C */  lw          $17, %lo(TEIGI_OBJ_ROT)($1)
/* 008858 01DB4558 06A30046 */  mov.s       $f12, $f20
/* 00885C 01DB455C 2C44040C */  jal         fptosi
/* 008860 01DB4560 00000000 */   nop
/* 008864 01DB4564 5C002216 */  bne         $17, $2, .L01DB46D8_2B9ED8
/* 008868 01DB4568 00000000 */   nop
/* 00886C 01DB456C B498838F */  lw          $3, -0x674C($28)
/* 008870 01DB4570 C0100300 */  sll         $2, $3, 3
/* 008874 01DB4574 21104300 */  addu        $2, $2, $3
/* 008878 01DB4578 00190200 */  sll         $3, $2, 4
/* 00887C 01DB457C E201023C */  lui         $2, %hi(OP_AnimeSeq)
/* 008880 01DB4580 20C54224 */  addiu       $2, $2, %lo(OP_AnimeSeq)
/* 008884 01DB4584 21204300 */  addu        $4, $2, $3
/* 008888 01DB4588 2497050C */  jal         Initialize__13OBJ_ANIME_SEQFv
/* 00888C 01DB458C 00000000 */   nop
/* 008890 01DB4590 B498838F */  lw          $3, -0x674C($28)
/* 008894 01DB4594 C0100300 */  sll         $2, $3, 3
/* 008898 01DB4598 21104300 */  addu        $2, $2, $3
/* 00889C 01DB459C 00110200 */  sll         $2, $2, 4
/* 0088A0 01DB45A0 E201033C */  lui         $3, %hi(OP_AnimeSeq + 0x10)
/* 0088A4 01DB45A4 30C56324 */  addiu       $3, $3, %lo(OP_AnimeSeq + 0x10)
/* 0088A8 01DB45A8 21186200 */  addu        $3, $3, $2
/* 0088AC 01DB45AC 000060AC */  sw          $0, 0x0($3)
/* 0088B0 01DB45B0 E201033C */  lui         $3, %hi(OP_AnimeSeq + 0x14)
/* 0088B4 01DB45B4 34C56324 */  addiu       $3, $3, %lo(OP_AnimeSeq + 0x14)
/* 0088B8 01DB45B8 21186200 */  addu        $3, $3, $2
/* 0088BC 01DB45BC 000060AC */  sw          $0, 0x0($3)
/* 0088C0 01DB45C0 E101033C */  lui         $3, %hi(argValBuff + 0x8)
/* 0088C4 01DB45C4 48246324 */  addiu       $3, $3, %lo(argValBuff + 0x8)
/* 0088C8 01DB45C8 21187400 */  addu        $3, $3, $20
/* 0088CC 01DB45CC 000060C4 */  lwc1        $f0, 0x0($3)
/* 0088D0 01DB45D0 E201033C */  lui         $3, %hi(OP_AnimeSeq + 0x20)
/* 0088D4 01DB45D4 40C56324 */  addiu       $3, $3, %lo(OP_AnimeSeq + 0x20)
/* 0088D8 01DB45D8 21186200 */  addu        $3, $3, $2
/* 0088DC 01DB45DC 000060E4 */  swc1        $f0, 0x0($3)
/* 0088E0 01DB45E0 E101033C */  lui         $3, %hi(argValBuff + 0xC)
/* 0088E4 01DB45E4 4C246324 */  addiu       $3, $3, %lo(argValBuff + 0xC)
/* 0088E8 01DB45E8 21187400 */  addu        $3, $3, $20
/* 0088EC 01DB45EC 000060C4 */  lwc1        $f0, 0x0($3)
/* 0088F0 01DB45F0 E201033C */  lui         $3, %hi(OP_AnimeSeq + 0x24)
/* 0088F4 01DB45F4 44C56324 */  addiu       $3, $3, %lo(OP_AnimeSeq + 0x24)
/* 0088F8 01DB45F8 21186200 */  addu        $3, $3, $2
/* 0088FC 01DB45FC 000060E4 */  swc1        $f0, 0x0($3)
/* 008900 01DB4600 E101033C */  lui         $3, %hi(argValBuff + 0x10)
/* 008904 01DB4604 50246324 */  addiu       $3, $3, %lo(argValBuff + 0x10)
/* 008908 01DB4608 21187400 */  addu        $3, $3, $20
/* 00890C 01DB460C 000060C4 */  lwc1        $f0, 0x0($3)
/* 008910 01DB4610 E201033C */  lui         $3, %hi(OP_AnimeSeq + 0x28)
/* 008914 01DB4614 48C56324 */  addiu       $3, $3, %lo(OP_AnimeSeq + 0x28)
/* 008918 01DB4618 21186200 */  addu        $3, $3, $2
/* 00891C 01DB461C 000060E4 */  swc1        $f0, 0x0($3)
/* 008920 01DB4620 E101033C */  lui         $3, %hi(argValBuff + 0x14)
/* 008924 01DB4624 54246324 */  addiu       $3, $3, %lo(argValBuff + 0x14)
/* 008928 01DB4628 21187400 */  addu        $3, $3, $20
/* 00892C 01DB462C 000060C4 */  lwc1        $f0, 0x0($3)
/* 008930 01DB4630 E201033C */  lui         $3, %hi(OP_AnimeSeq + 0x40)
/* 008934 01DB4634 60C56324 */  addiu       $3, $3, %lo(OP_AnimeSeq + 0x40)
/* 008938 01DB4638 21186200 */  addu        $3, $3, $2
/* 00893C 01DB463C 000060E4 */  swc1        $f0, 0x0($3)
/* 008940 01DB4640 E101033C */  lui         $3, %hi(argValBuff + 0x18)
/* 008944 01DB4644 58246324 */  addiu       $3, $3, %lo(argValBuff + 0x18)
/* 008948 01DB4648 21187400 */  addu        $3, $3, $20
/* 00894C 01DB464C 000060C4 */  lwc1        $f0, 0x0($3)
/* 008950 01DB4650 E201033C */  lui         $3, %hi(OP_AnimeSeq + 0x44)
/* 008954 01DB4654 64C56324 */  addiu       $3, $3, %lo(OP_AnimeSeq + 0x44)
/* 008958 01DB4658 21186200 */  addu        $3, $3, $2
/* 00895C 01DB465C 000060E4 */  swc1        $f0, 0x0($3)
/* 008960 01DB4660 E101033C */  lui         $3, %hi(argValBuff + 0x1C)
/* 008964 01DB4664 5C246324 */  addiu       $3, $3, %lo(argValBuff + 0x1C)
/* 008968 01DB4668 21187400 */  addu        $3, $3, $20
/* 00896C 01DB466C 000060C4 */  lwc1        $f0, 0x0($3)
/* 008970 01DB4670 E201033C */  lui         $3, %hi(OP_AnimeSeq + 0x48)
/* 008974 01DB4674 68C56324 */  addiu       $3, $3, %lo(OP_AnimeSeq + 0x48)
/* 008978 01DB4678 21186200 */  addu        $3, $3, $2
/* 00897C 01DB467C 000060E4 */  swc1        $f0, 0x0($3)
/* 008980 01DB4680 E201033C */  lui         $3, %hi(OP_AnimeSeq)
/* 008984 01DB4684 20C56324 */  addiu       $3, $3, %lo(OP_AnimeSeq)
/* 008988 01DB4688 21206200 */  addu        $4, $3, $2
/* 00898C 01DB468C 80191000 */  sll         $3, $16, 6
/* 008990 01DB4690 E101023C */  lui         $2, %hi(argStrBuff)
/* 008994 01DB4694 40044224 */  addiu       $2, $2, %lo(argStrBuff)
/* 008998 01DB4698 21284300 */  addu        $5, $2, $3
/* 00899C 01DB469C 5A15040C */  jal         strcpy
/* 0089A0 01DB46A0 00000000 */   nop
/* 0089A4 01DB46A4 B498838F */  lw          $3, -0x674C($28)
/* 0089A8 01DB46A8 C0100300 */  sll         $2, $3, 3
/* 0089AC 01DB46AC 21104300 */  addu        $2, $2, $3
/* 0089B0 01DB46B0 00190200 */  sll         $3, $2, 4
/* 0089B4 01DB46B4 E201023C */  lui         $2, %hi(OP_AnimeSeq)
/* 0089B8 01DB46B8 20C54224 */  addiu       $2, $2, %lo(OP_AnimeSeq)
/* 0089BC 01DB46BC 21284300 */  addu        $5, $2, $3
/* 0089C0 01DB46C0 2826E072 */  paddub      $4, $23, $0
/* 0089C4 01DB46C4 4097050C */  jal         InitObjAnime__FP6CFrameP13OBJ_ANIME_SEQ
/* 0089C8 01DB46C8 00000000 */   nop
/* 0089CC 01DB46CC B498828F */  lw          $2, -0x674C($28)
/* 0089D0 01DB46D0 01004224 */  addiu       $2, $2, 0x1
/* 0089D4 01DB46D4 B49882AF */  sw          $2, -0x674C($28)
.L01DB46D8_2B9ED8:
/* 0089D8 01DB46D8 DD01013C */  lui         $1, %hi(TEIGI_FIRE)
/* 0089DC 01DB46DC F05F318C */  lw          $17, %lo(TEIGI_FIRE)($1)
/* 0089E0 01DB46E0 0000B4C6 */  lwc1        $f20, 0x0($21)
/* 0089E4 01DB46E4 06A30046 */  mov.s       $f12, $f20
/* 0089E8 01DB46E8 2C44040C */  jal         fptosi
/* 0089EC 01DB46EC 00000000 */   nop
/* 0089F0 01DB46F0 31002216 */  bne         $17, $2, .L01DB47B8_2B9FB8
/* 0089F4 01DB46F4 00000000 */   nop
/* 0089F8 01DB46F8 E101023C */  lui         $2, %hi(argValBuff + 0x4)
/* 0089FC 01DB46FC 44244224 */  addiu       $2, $2, %lo(argValBuff + 0x4)
/* 008A00 01DB4700 21105400 */  addu        $2, $2, $20
/* 008A04 01DB4704 000040C4 */  lwc1        $f0, 0x0($2)
/* 008A08 01DB4708 B898828F */  lw          $2, -0x6748($28)
/* 008A0C 01DB470C 00310200 */  sll         $6, $2, 4
/* 008A10 01DB4710 E201033C */  lui         $3, %hi(OP_FirePosition)
/* 008A14 01DB4714 20D76324 */  addiu       $3, $3, %lo(OP_FirePosition)
/* 008A18 01DB4718 21186600 */  addu        $3, $3, $6
/* 008A1C 01DB471C 000060E4 */  swc1        $f0, 0x0($3)
/* 008A20 01DB4720 E101033C */  lui         $3, %hi(argValBuff + 0x8)
/* 008A24 01DB4724 48246324 */  addiu       $3, $3, %lo(argValBuff + 0x8)
/* 008A28 01DB4728 21187400 */  addu        $3, $3, $20
/* 008A2C 01DB472C 000060C4 */  lwc1        $f0, 0x0($3)
/* 008A30 01DB4730 E201033C */  lui         $3, %hi(OP_FirePosition + 0x4)
/* 008A34 01DB4734 24D76324 */  addiu       $3, $3, %lo(OP_FirePosition + 0x4)
/* 008A38 01DB4738 21186600 */  addu        $3, $3, $6
/* 008A3C 01DB473C 000060E4 */  swc1        $f0, 0x0($3)
/* 008A40 01DB4740 E101033C */  lui         $3, %hi(argValBuff + 0xC)
/* 008A44 01DB4744 4C246324 */  addiu       $3, $3, %lo(argValBuff + 0xC)
/* 008A48 01DB4748 21187400 */  addu        $3, $3, $20
/* 008A4C 01DB474C 000060C4 */  lwc1        $f0, 0x0($3)
/* 008A50 01DB4750 E201033C */  lui         $3, %hi(OP_FirePosition + 0x8)
/* 008A54 01DB4754 28D76324 */  addiu       $3, $3, %lo(OP_FirePosition + 0x8)
/* 008A58 01DB4758 21186600 */  addu        $3, $3, $6
/* 008A5C 01DB475C 000060E4 */  swc1        $f0, 0x0($3)
/* 008A60 01DB4760 E101033C */  lui         $3, %hi(argValBuff + 0x10)
/* 008A64 01DB4764 50246324 */  addiu       $3, $3, %lo(argValBuff + 0x10)
/* 008A68 01DB4768 21187400 */  addu        $3, $3, $20
/* 008A6C 01DB476C 000060C4 */  lwc1        $f0, 0x0($3)
/* 008A70 01DB4770 80880200 */  sll         $17, $2, 2
/* 008A74 01DB4774 E201023C */  lui         $2, %hi(OP_FireScale)
/* 008A78 01DB4778 20DD4224 */  addiu       $2, $2, %lo(OP_FireScale)
/* 008A7C 01DB477C 21105100 */  addu        $2, $2, $17
/* 008A80 01DB4780 000040E4 */  swc1        $f0, 0x0($2)
/* 008A84 01DB4784 E101023C */  lui         $2, %hi(argValBuff + 0x14)
/* 008A88 01DB4788 54244224 */  addiu       $2, $2, %lo(argValBuff + 0x14)
/* 008A8C 01DB478C 21105400 */  addu        $2, $2, $20
/* 008A90 01DB4790 00004CC4 */  lwc1        $f12, 0x0($2)
/* 008A94 01DB4794 2C44040C */  jal         fptosi
/* 008A98 01DB4798 00000000 */   nop
/* 008A9C 01DB479C E201033C */  lui         $3, %hi(OP_FireFlg)
/* 008AA0 01DB47A0 A0DE6324 */  addiu       $3, $3, %lo(OP_FireFlg)
/* 008AA4 01DB47A4 21187100 */  addu        $3, $3, $17
/* 008AA8 01DB47A8 000062AC */  sw          $2, 0x0($3)
/* 008AAC 01DB47AC B898828F */  lw          $2, -0x6748($28)
/* 008AB0 01DB47B0 01004224 */  addiu       $2, $2, 0x1
/* 008AB4 01DB47B4 B89882AF */  sw          $2, -0x6748($28)
.L01DB47B8_2B9FB8:
/* 008AB8 01DB47B8 488A918F */  lw          $17, -0x75B8($28)
/* 008ABC 01DB47BC 06A30046 */  mov.s       $f12, $f20
/* 008AC0 01DB47C0 2C44040C */  jal         fptosi
/* 008AC4 01DB47C4 00000000 */   nop
/* 008AC8 01DB47C8 04002216 */  bne         $17, $2, .L01DB47DC_2B9FDC
/* 008ACC 01DB47CC 00000000 */   nop
/* 008AD0 01DB47D0 B098838F */  lw          $3, -0x6750($28)
/* 008AD4 01DB47D4 01006324 */  addiu       $3, $3, 0x1
/* 008AD8 01DB47D8 B09883AF */  sw          $3, -0x6750($28)
.L01DB47DC_2B9FDC:
/* 008ADC 01DB47DC 01001026 */  addiu       $16, $16, 0x1
.L01DB47E0_2B9FE0:
/* 008AE0 01DB47E0 A098838F */  lw          $3, -0x6760($28)
/* 008AE4 01DB47E4 2A180302 */  slt         $3, $16, $3
/* 008AE8 01DB47E8 6FF86014 */  bnez        $3, .L01DB29A8_2B81A8
/* 008AEC 01DB47EC 00000000 */   nop
/* 008AF0 01DB47F0 A000BF7B */  lq          $31, 0xA0($29)
/* 008AF4 01DB47F4 9000BE7B */  lq          $30, 0x90($29)
/* 008AF8 01DB47F8 8000B77B */  lq          $23, 0x80($29)
/* 008AFC 01DB47FC 7000B67B */  lq          $22, 0x70($29)
/* 008B00 01DB4800 6000B57B */  lq          $21, 0x60($29)
/* 008B04 01DB4804 5000B47B */  lq          $20, 0x50($29)
/* 008B08 01DB4808 4000B37B */  lq          $19, 0x40($29)
/* 008B0C 01DB480C 3000B27B */  lq          $18, 0x30($29)
/* 008B10 01DB4810 2000B17B */  lq          $17, 0x20($29)
/* 008B14 01DB4814 1000B07B */  lq          $16, 0x10($29)
/* 008B18 01DB4818 0400B5C7 */  lwc1        $f21, 0x4($29)
/* 008B1C 01DB481C 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 008B20 01DB4820 3004BD27 */  addiu       $29, $29, 0x430
/* 008B24 01DB4824 0800E003 */  jr          $31
/* 008B28 01DB4828 00000000 */   nop
/* 008B2C 01DB482C 00000000 */  nop
