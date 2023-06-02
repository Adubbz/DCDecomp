.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawMes__14CWeaponLevelUpFv
/* 137DA0 00237CA0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 137DA4 00237CA4 2000BF7F */  sq         $31, 0x20($sp)
/* 137DA8 00237CA8 1000B17F */  sq         $17, 0x10($sp)
/* 137DAC 00237CAC 0000B07F */  sq         $16, 0x0($sp)
/* 137DB0 00237CB0 288E8070 */  paddub     $17, $4, $0
/* 137DB4 00237CB4 00138384 */  lh         $3, 0x1300($4)
/* 137DB8 00237CB8 F4006014 */  bnez       $3, .L0023808C
/* 137DBC 00237CBC 00000000 */   nop
/* 137DC0 00237CC0 02132486 */  lh         $4, 0x1302($17)
/* 137DC4 00237CC4 FFFF0324 */  addiu      $3, $0, -0x1
/* 137DC8 00237CC8 F0008310 */  beq        $4, $3, .L0023808C
/* 137DCC 00237CCC 00000000 */   nop
/* 137DD0 00237CD0 14132586 */  lh         $5, 0x1314($17)
/* 137DD4 00237CD4 0800A12C */  sltiu      $at, $5, 0x8
/* 137DD8 00237CD8 0A002010 */  beqz       $at, .L00237D04
/* 137DDC 00237CDC 00000000 */   nop
/* 137DE0 00237CE0 2A00033C */  lui        $3, %hi(_1458)
/* 137DE4 00237CE4 B0F56424 */  addiu      $4, $3, %lo(_1458)
/* 137DE8 00237CE8 80180500 */  sll        $3, $5, 2
/* 137DEC 00237CEC 21186400 */  addu       $3, $3, $4
/* 137DF0 00237CF0 0000638C */  lw         $3, 0x0($3)
/* 137DF4 00237CF4 08006000 */  jr         $3
/* 137DF8 00237CF8 00000000 */   nop
/* 137DFC 00237CFC E3000010 */  b          .L0023808C
/* 137E00 00237D00 00000000 */   nop
.L00237D04:
/* 137E04 00237D04 28860070 */  paddub     $16, $0, $0
/* 137E08 00237D08 3000A327 */  addiu      $3, $sp, 0x30
/* 137E0C 00237D0C F08982DF */  ld         $2, -0x7610($gp)
/* 137E10 00237D10 000062FC */  sd         $2, 0x0($3)
/* 137E14 00237D14 3800A327 */  addiu      $3, $sp, 0x38
/* 137E18 00237D18 F88982DF */  ld         $2, -0x7608($gp)
/* 137E1C 00237D1C 000062FC */  sd         $2, 0x0($3)
/* 137E20 00237D20 19000224 */  addiu      $2, $0, 0x19
/* 137E24 00237D24 6900A210 */  beq        $5, $2, .L00237ECC
/* 137E28 00237D28 00000000 */   nop
/* 137E2C 00237D2C 1F000224 */  addiu      $2, $0, 0x1F
/* 137E30 00237D30 6100A210 */  beq        $5, $2, .L00237EB8
/* 137E34 00237D34 00000000 */   nop
/* 137E38 00237D38 1B000224 */  addiu      $2, $0, 0x1B
/* 137E3C 00237D3C 5800A210 */  beq        $5, $2, .L00237EA0
/* 137E40 00237D40 00000000 */   nop
/* 137E44 00237D44 1D000224 */  addiu      $2, $0, 0x1D
/* 137E48 00237D48 4F00A210 */  beq        $5, $2, .L00237E88
/* 137E4C 00237D4C 00000000 */   nop
/* 137E50 00237D50 17000224 */  addiu      $2, $0, 0x17
/* 137E54 00237D54 4900A210 */  beq        $5, $2, .L00237E7C
/* 137E58 00237D58 00000000 */   nop
/* 137E5C 00237D5C 15000224 */  addiu      $2, $0, 0x15
/* 137E60 00237D60 3E00A210 */  beq        $5, $2, .L00237E5C
/* 137E64 00237D64 00000000 */   nop
/* 137E68 00237D68 0B000224 */  addiu      $2, $0, 0xB
/* 137E6C 00237D6C 2E00A210 */  beq        $5, $2, .L00237E28
/* 137E70 00237D70 00000000 */   nop
/* 137E74 00237D74 09000224 */  addiu      $2, $0, 0x9
/* 137E78 00237D78 2000A210 */  beq        $5, $2, .L00237DFC
/* 137E7C 00237D7C 00000000 */   nop
/* 137E80 00237D80 06000224 */  addiu      $2, $0, 0x6
/* 137E84 00237D84 1200A210 */  beq        $5, $2, .L00237DD0
/* 137E88 00237D88 00000000 */   nop
/* 137E8C 00237D8C 03000224 */  addiu      $2, $0, 0x3
/* 137E90 00237D90 0300A210 */  beq        $5, $2, .L00237DA0
/* 137E94 00237D94 00000000 */   nop
/* 137E98 00237D98 50000010 */  b          .L00237EDC
/* 137E9C 00237D9C 00000000 */   nop
.L00237DA0:
/* 137EA0 00237DA0 90011024 */  addiu      $16, $0, 0x190
/* 137EA4 00237DA4 00002486 */  lh         $4, 0x0($17)
/* 137EA8 00237DA8 7443070C */  jal        GetCommonItemInfo__Fi
/* 137EAC 00237DAC 00000000 */   nop
/* 137EB0 00237DB0 06004284 */  lh         $2, 0x6($2)
/* 137EB4 00237DB4 64004224 */  addiu      $2, $2, 0x64
/* 137EB8 00237DB8 3000A2AF */  sw         $2, 0x30($sp)
/* 137EBC 00237DBC 02002286 */  lh         $2, 0x2($17)
/* 137EC0 00237DC0 01004224 */  addiu      $2, $2, 0x1
/* 137EC4 00237DC4 3800A2AF */  sw         $2, 0x38($sp)
/* 137EC8 00237DC8 44000010 */  b          .L00237EDC
/* 137ECC 00237DCC 00000000 */   nop
.L00237DD0:
/* 137ED0 00237DD0 91011024 */  addiu      $16, $0, 0x191
/* 137ED4 00237DD4 FA002486 */  lh         $4, 0xFA($17)
/* 137ED8 00237DD8 7443070C */  jal        GetCommonItemInfo__Fi
/* 137EDC 00237DDC 00000000 */   nop
/* 137EE0 00237DE0 06004284 */  lh         $2, 0x6($2)
/* 137EE4 00237DE4 64004224 */  addiu      $2, $2, 0x64
/* 137EE8 00237DE8 3000A2AF */  sw         $2, 0x30($sp)
/* 137EEC 00237DEC FE002282 */  lb         $2, 0xFE($17)
/* 137EF0 00237DF0 3800A2AF */  sw         $2, 0x38($sp)
/* 137EF4 00237DF4 39000010 */  b          .L00237EDC
/* 137EF8 00237DF8 00000000 */   nop
.L00237DFC:
/* 137EFC 00237DFC 92011024 */  addiu      $16, $0, 0x192
/* 137F00 00237E00 D412228E */  lw         $2, 0x12D4($17)
/* 137F04 00237E04 00004484 */  lh         $4, 0x0($2)
/* 137F08 00237E08 7443070C */  jal        GetCommonItemInfo__Fi
/* 137F0C 00237E0C 00000000 */   nop
/* 137F10 00237E10 06004284 */  lh         $2, 0x6($2)
/* 137F14 00237E14 64004224 */  addiu      $2, $2, 0x64
/* 137F18 00237E18 3000A2AF */  sw         $2, 0x30($sp)
/* 137F1C 00237E1C 3800A0AF */  sw         $0, 0x38($sp)
/* 137F20 00237E20 2E000010 */  b          .L00237EDC
/* 137F24 00237E24 00000000 */   nop
.L00237E28:
/* 137F28 00237E28 93011024 */  addiu      $16, $0, 0x193
/* 137F2C 00237E2C D412228E */  lw         $2, 0x12D4($17)
/* 137F30 00237E30 00004484 */  lh         $4, 0x0($2)
/* 137F34 00237E34 7443070C */  jal        GetCommonItemInfo__Fi
/* 137F38 00237E38 00000000 */   nop
/* 137F3C 00237E3C 06004284 */  lh         $2, 0x6($2)
/* 137F40 00237E40 64004224 */  addiu      $2, $2, 0x64
/* 137F44 00237E44 3000A2AF */  sw         $2, 0x30($sp)
/* 137F48 00237E48 D412228E */  lw         $2, 0x12D4($17)
/* 137F4C 00237E4C 02004284 */  lh         $2, 0x2($2)
/* 137F50 00237E50 3800A2AF */  sw         $2, 0x38($sp)
/* 137F54 00237E54 21000010 */  b          .L00237EDC
/* 137F58 00237E58 00000000 */   nop
.L00237E5C:
/* 137F5C 00237E5C 94011024 */  addiu      $16, $0, 0x194
/* 137F60 00237E60 E2122286 */  lh         $2, 0x12E2($17)
/* 137F64 00237E64 32004224 */  addiu      $2, $2, 0x32
/* 137F68 00237E68 3000A2AF */  sw         $2, 0x30($sp)
/* 137F6C 00237E6C E412228E */  lw         $2, 0x12E4($17)
/* 137F70 00237E70 3800A2AF */  sw         $2, 0x38($sp)
/* 137F74 00237E74 19000010 */  b          .L00237EDC
/* 137F78 00237E78 00000000 */   nop
.L00237E7C:
/* 137F7C 00237E7C E2123086 */  lh         $16, 0x12E2($17)
/* 137F80 00237E80 16000010 */  b          .L00237EDC
/* 137F84 00237E84 00000000 */   nop
.L00237E88:
/* 137F88 00237E88 95011024 */  addiu      $16, $0, 0x195
/* 137F8C 00237E8C E2122286 */  lh         $2, 0x12E2($17)
/* 137F90 00237E90 32004224 */  addiu      $2, $2, 0x32
/* 137F94 00237E94 3000A2AF */  sw         $2, 0x30($sp)
/* 137F98 00237E98 10000010 */  b          .L00237EDC
/* 137F9C 00237E9C 00000000 */   nop
.L00237EA0:
/* 137FA0 00237EA0 96011024 */  addiu      $16, $0, 0x196
/* 137FA4 00237EA4 E2122286 */  lh         $2, 0x12E2($17)
/* 137FA8 00237EA8 32004224 */  addiu      $2, $2, 0x32
/* 137FAC 00237EAC 3000A2AF */  sw         $2, 0x30($sp)
/* 137FB0 00237EB0 0A000010 */  b          .L00237EDC
/* 137FB4 00237EB4 00000000 */   nop
.L00237EB8:
/* 137FB8 00237EB8 97011024 */  addiu      $16, $0, 0x197
/* 137FBC 00237EBC E412228E */  lw         $2, 0x12E4($17)
/* 137FC0 00237EC0 3800A2AF */  sw         $2, 0x38($sp)
/* 137FC4 00237EC4 05000010 */  b          .L00237EDC
/* 137FC8 00237EC8 00000000 */   nop
.L00237ECC:
/* 137FCC 00237ECC 98011024 */  addiu      $16, $0, 0x198
/* 137FD0 00237ED0 E2122286 */  lh         $2, 0x12E2($17)
/* 137FD4 00237ED4 32004224 */  addiu      $2, $2, 0x32
/* 137FD8 00237ED8 3000A2AF */  sw         $2, 0x30($sp)
.L00237EDC:
/* 137FDC 00237EDC DA01013C */  lui        $at, (0x1DA224C >> 16)
/* 137FE0 00237EE0 4C22228C */  lw         $2, (0x1DA224C & 0xFFFF)($at)
/* 137FE4 00237EE4 0B005014 */  bne        $2, $16, .L00237F14
/* 137FE8 00237EE8 00000000 */   nop
/* 137FEC 00237EEC DA01013C */  lui        $at, (0x1DA2270 >> 16)
/* 137FF0 00237EF0 7022238C */  lw         $3, (0x1DA2270 & 0xFFFF)($at)
/* 137FF4 00237EF4 3000A28F */  lw         $2, 0x30($sp)
/* 137FF8 00237EF8 06006214 */  bne        $3, $2, .L00237F14
/* 137FFC 00237EFC 00000000 */   nop
/* 138000 00237F00 DA01013C */  lui        $at, (0x1DA2298 >> 16)
/* 138004 00237F04 9822238C */  lw         $3, (0x1DA2298 & 0xFFFF)($at)
/* 138008 00237F08 3800A28F */  lw         $2, 0x38($sp)
/* 13800C 00237F0C 30006210 */  beq        $3, $2, .L00237FD0
/* 138010 00237F10 00000000 */   nop
.L00237F14:
/* 138014 00237F14 01000224 */  addiu      $2, $0, 0x1
/* 138018 00237F18 DA01013C */  lui        $at, (0x1DA22BC >> 16)
/* 13801C 00237F1C BC2222AC */  sw         $2, (0x1DA22BC & 0xFFFF)($at)
/* 138020 00237F20 DA01013C */  lui        $at, (0x1DA22C0 >> 16)
/* 138024 00237F24 C02220AC */  sw         $0, (0x1DA22C0 & 0xFFFF)($at)
/* 138028 00237F28 DA01013C */  lui        $at, (0x1DA22C4 >> 16)
/* 13802C 00237F2C C42220AC */  sw         $0, (0x1DA22C4 & 0xFFFF)($at)
/* 138030 00237F30 DA01013C */  lui        $at, (0x1DA0BE4 >> 16)
/* 138034 00237F34 E40B20AC */  sw         $0, (0x1DA0BE4 & 0xFFFF)($at)
/* 138038 00237F38 14132386 */  lh         $3, 0x1314($17)
/* 13803C 00237F3C 1D000224 */  addiu      $2, $0, 0x1D
/* 138040 00237F40 0D006210 */  beq        $3, $2, .L00237F78
/* 138044 00237F44 00000000 */   nop
/* 138048 00237F48 1B000224 */  addiu      $2, $0, 0x1B
/* 13804C 00237F4C 0A006210 */  beq        $3, $2, .L00237F78
/* 138050 00237F50 00000000 */   nop
/* 138054 00237F54 1F000224 */  addiu      $2, $0, 0x1F
/* 138058 00237F58 07006210 */  beq        $3, $2, .L00237F78
/* 13805C 00237F5C 00000000 */   nop
/* 138060 00237F60 15000224 */  addiu      $2, $0, 0x15
/* 138064 00237F64 04006210 */  beq        $3, $2, .L00237F78
/* 138068 00237F68 00000000 */   nop
/* 13806C 00237F6C 17000224 */  addiu      $2, $0, 0x17
/* 138070 00237F70 09006214 */  bne        $3, $2, .L00237F98
/* 138074 00237F74 00000000 */   nop
.L00237F78:
/* 138078 00237F78 DA01013C */  lui        $at, (0x1DA22BC >> 16)
/* 13807C 00237F7C BC2220AC */  sw         $0, (0x1DA22BC & 0xFFFF)($at)
/* 138080 00237F80 01000224 */  addiu      $2, $0, 0x1
/* 138084 00237F84 DA01013C */  lui        $at, (0x1DA22C0 >> 16)
/* 138088 00237F88 C02222AC */  sw         $2, (0x1DA22C0 & 0xFFFF)($at)
/* 13808C 00237F8C 05000224 */  addiu      $2, $0, 0x5
/* 138090 00237F90 DA01013C */  lui        $at, (0x1DA0BE4 >> 16)
/* 138094 00237F94 E40B22AC */  sw         $2, (0x1DA0BE4 & 0xFFFF)($at)
.L00237F98:
/* 138098 00237F98 3000A28F */  lw         $2, 0x30($sp)
/* 13809C 00237F9C DA01013C */  lui        $at, (0x1DA2270 >> 16)
/* 1380A0 00237FA0 702222AC */  sw         $2, (0x1DA2270 & 0xFFFF)($at)
/* 1380A4 00237FA4 3800A28F */  lw         $2, 0x38($sp)
/* 1380A8 00237FA8 DA01013C */  lui        $at, (0x1DA2298 >> 16)
/* 1380AC 00237FAC 982222AC */  sw         $2, (0x1DA2298 & 0xFFFF)($at)
/* 1380B0 00237FB0 FFFF0224 */  addiu      $2, $0, -0x1
/* 1380B4 00237FB4 DA01013C */  lui        $at, (0x1DA224C >> 16)
/* 1380B8 00237FB8 4C2222AC */  sw         $2, (0x1DA224C & 0xFFFF)($at)
/* 1380BC 00237FBC DA01023C */  lui        $2, %hi(CommonMenuMes1)
/* 1380C0 00237FC0 900B4424 */  addiu      $4, $2, %lo(CommonMenuMes1)
/* 1380C4 00237FC4 282E0072 */  paddub     $5, $16, $0
/* 1380C8 00237FC8 5441050C */  jal        MakeMesWin__6ClsMesFi
/* 1380CC 00237FCC 00000000 */   nop
.L00237FD0:
/* 1380D0 00237FD0 01000224 */  addiu      $2, $0, 0x1
/* 1380D4 00237FD4 DA01013C */  lui        $at, (0x1DA0C28 >> 16)
/* 1380D8 00237FD8 280C22AC */  sw         $2, (0x1DA0C28 & 0xFFFF)($at)
/* 1380DC 00237FDC DA01013C */  lui        $at, (0x1DA22DC >> 16)
/* 1380E0 00237FE0 DC22248C */  lw         $4, (0x1DA22DC & 0xFFFF)($at)
/* 1380E4 00237FE4 38B4080C */  jal        MenuTextureReload__Fi
/* 1380E8 00237FE8 00000000 */   nop
/* 1380EC 00237FEC 64010524 */  addiu      $5, $0, 0x164
/* 1380F0 00237FF0 96000624 */  addiu      $6, $0, 0x96
/* 1380F4 00237FF4 14132386 */  lh         $3, 0x1314($17)
/* 1380F8 00237FF8 1D000224 */  addiu      $2, $0, 0x1D
/* 1380FC 00237FFC 0D006210 */  beq        $3, $2, .L00238034
/* 138100 00238000 00000000 */   nop
/* 138104 00238004 1B000224 */  addiu      $2, $0, 0x1B
/* 138108 00238008 0A006210 */  beq        $3, $2, .L00238034
/* 13810C 0023800C 00000000 */   nop
/* 138110 00238010 1F000224 */  addiu      $2, $0, 0x1F
/* 138114 00238014 07006210 */  beq        $3, $2, .L00238034
/* 138118 00238018 00000000 */   nop
/* 13811C 0023801C 17000224 */  addiu      $2, $0, 0x17
/* 138120 00238020 04006210 */  beq        $3, $2, .L00238034
/* 138124 00238024 00000000 */   nop
/* 138128 00238028 15000224 */  addiu      $2, $0, 0x15
/* 13812C 0023802C 03006214 */  bne        $3, $2, .L0023803C
/* 138130 00238030 00000000 */   nop
.L00238034:
/* 138134 00238034 00010524 */  addiu      $5, $0, 0x100
/* 138138 00238038 96000624 */  addiu      $6, $0, 0x96
.L0023803C:
/* 13813C 0023803C 02132386 */  lh         $3, 0x1302($17)
/* 138140 00238040 03000224 */  addiu      $2, $0, 0x3
/* 138144 00238044 0D006214 */  bne        $3, $2, .L0023807C
/* 138148 00238048 00000000 */   nop
/* 13814C 0023804C 01000224 */  addiu      $2, $0, 0x1
/* 138150 00238050 DA01013C */  lui        $at, (0x1DA22BC >> 16)
/* 138154 00238054 BC2222AC */  sw         $2, (0x1DA22BC & 0xFFFF)($at)
/* 138158 00238058 DA01013C */  lui        $at, (0x1DA22C0 >> 16)
/* 13815C 0023805C C02220AC */  sw         $0, (0x1DA22C0 & 0xFFFF)($at)
/* 138160 00238060 DA01013C */  lui        $at, (0x1DA22C4 >> 16)
/* 138164 00238064 C42220AC */  sw         $0, (0x1DA22C4 & 0xFFFF)($at)
/* 138168 00238068 00010524 */  addiu      $5, $0, 0x100
/* 13816C 0023806C 96000624 */  addiu      $6, $0, 0x96
/* 138170 00238070 05000224 */  addiu      $2, $0, 0x5
/* 138174 00238074 DA01013C */  lui        $at, (0x1DA0BE4 >> 16)
/* 138178 00238078 E40B22AC */  sw         $2, (0x1DA0BE4 & 0xFFFF)($at)
.L0023807C:
/* 13817C 0023807C DA01023C */  lui        $2, %hi(CommonMenuMes1)
/* 138180 00238080 900B4424 */  addiu      $4, $2, %lo(CommonMenuMes1)
/* 138184 00238084 A8B3080C */  jal        DrawMenuClsMes__FP6ClsMesii
/* 138188 00238088 00000000 */   nop
.L0023808C:
/* 13818C 0023808C 2000BF7B */  lq         $31, 0x20($sp)
/* 138190 00238090 1000B17B */  lq         $17, 0x10($sp)
/* 138194 00238094 0000B07B */  lq         $16, 0x0($sp)
/* 138198 00238098 4000BD27 */  addiu      $sp, $sp, 0x40
/* 13819C 0023809C 0800E003 */  jr         $31
/* 1381A0 002380A0 00000000 */   nop
/* 1381A4 002380A4 00000000 */  nop
/* 1381A8 002380A8 00000000 */  nop
/* 1381AC 002380AC 00000000 */  nop
