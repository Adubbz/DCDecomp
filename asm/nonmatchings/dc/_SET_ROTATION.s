.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_ROTATION__FP12RS_STACKDATAi
/* E1FE0 001E1EE0 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* E1FE4 001E1EE4 2000BF7F */  sq         $31, 0x20($sp)
/* E1FE8 001E1EE8 1000B17F */  sq         $17, 0x10($sp)
/* E1FEC 001E1EEC 0000B07F */  sq         $16, 0x0($sp)
/* E1FF0 001E1EF0 E09C828F */  lw         $2, -0x6320($gp)
/* E1FF4 001E1EF4 9000458C */  lw         $5, 0x90($2)
/* E1FF8 001E1EF8 08008624 */  addiu      $6, $4, 0x8
/* E1FFC 001E1EFC A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E2000 001E1F00 00000000 */   nop
/* E2004 001E1F04 E09C848F */  lw         $4, -0x6320($gp)
/* E2008 001E1F08 80100500 */  sll        $2, $5, 2
/* E200C 001E1F0C 21184500 */  addu       $3, $2, $5
/* E2010 001E1F10 80100300 */  sll        $2, $3, 2
/* E2014 001E1F14 21106200 */  addu       $2, $3, $2
/* E2018 001E1F18 00810200 */  sll        $16, $2, 4
/* E201C 001E1F1C 21100402 */  addu       $2, $16, $4
/* E2020 001E1F20 0200013C */  lui        $at, (0x20000 >> 16)
/* E2024 001E1F24 21084100 */  addu       $at, $2, $at
/* E2028 001E1F28 40E420E4 */  swc1       $f0, -0x1BC0($at)
/* E202C 001E1F2C 2826C070 */  paddub     $4, $6, $0
/* E2030 001E1F30 08008624 */  addiu      $6, $4, 0x8
/* E2034 001E1F34 A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E2038 001E1F38 00000000 */   nop
/* E203C 001E1F3C E09C828F */  lw         $2, -0x6320($gp)
/* E2040 001E1F40 21100202 */  addu       $2, $16, $2
/* E2044 001E1F44 0200013C */  lui        $at, (0x20000 >> 16)
/* E2048 001E1F48 21084100 */  addu       $at, $2, $at
/* E204C 001E1F4C 44E420E4 */  swc1       $f0, -0x1BBC($at)
/* E2050 001E1F50 2826C070 */  paddub     $4, $6, $0
/* E2054 001E1F54 08008624 */  addiu      $6, $4, 0x8
/* E2058 001E1F58 A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E205C 001E1F5C 00000000 */   nop
/* E2060 001E1F60 E09C828F */  lw         $2, -0x6320($gp)
/* E2064 001E1F64 21100202 */  addu       $2, $16, $2
/* E2068 001E1F68 0200013C */  lui        $at, (0x20000 >> 16)
/* E206C 001E1F6C 21084100 */  addu       $at, $2, $at
/* E2070 001E1F70 48E420E4 */  swc1       $f0, -0x1BB8($at)
/* E2074 001E1F74 2826C070 */  paddub     $4, $6, $0
/* E2078 001E1F78 A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E207C 001E1F7C 00000000 */   nop
/* E2080 001E1F80 E09C828F */  lw         $2, -0x6320($gp)
/* E2084 001E1F84 21100202 */  addu       $2, $16, $2
/* E2088 001E1F88 0200013C */  lui        $at, (0x20000 >> 16)
/* E208C 001E1F8C 21084100 */  addu       $at, $2, $at
/* E2090 001E1F90 54E420E4 */  swc1       $f0, -0x1BAC($at)
/* E2094 001E1F94 E09C838F */  lw         $3, -0x6320($gp)
/* E2098 001E1F98 21100302 */  addu       $2, $16, $3
/* E209C 001E1F9C 0200013C */  lui        $at, (0x20000 >> 16)
/* E20A0 001E1FA0 21084100 */  addu       $at, $2, $at
/* E20A4 001E1FA4 54E421C4 */  lwc1       $f1, -0x1BAC($at)
/* E20A8 001E1FA8 00008044 */  mtc1       $0, $f0
/* E20AC 001E1FAC 00000000 */  nop
/* E20B0 001E1FB0 34080046 */  c.lt.s     $f1, $f0
/* E20B4 001E1FB4 00000000 */  nop
/* E20B8 001E1FB8 33000045 */  bc1f       .L001E2088
/* E20BC 001E1FBC 00000000 */   nop
/* E20C0 001E1FC0 10350224 */  addiu      $2, $0, 0x3510
/* E20C4 001E1FC4 1888A200 */  mult       $17, $5, $2
/* E20C8 001E1FC8 21107100 */  addu       $2, $3, $17
/* E20CC 001E1FCC 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* E20D0 001E1FD0 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* E20D4 001E1FD4 21204100 */  addu       $4, $2, $at
/* E20D8 001E1FD8 3000A527 */  addiu      $5, $sp, 0x30
/* E20DC 001E1FDC A000998C */  lw         $25, 0xA0($4)
/* E20E0 001E1FE0 A000398F */  lw         $25, 0xA0($25)
/* E20E4 001E1FE4 09F82003 */  jalr       $25
/* E20E8 001E1FE8 00000000 */   nop
/* E20EC 001E1FEC E09C828F */  lw         $2, -0x6320($gp)
/* E20F0 001E1FF0 21105100 */  addu       $2, $2, $17
/* E20F4 001E1FF4 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* E20F8 001E1FF8 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* E20FC 001E1FFC 21204100 */  addu       $4, $2, $at
/* E2100 001E2000 4000A527 */  addiu      $5, $sp, 0x40
/* E2104 001E2004 A000998C */  lw         $25, 0xA0($4)
/* E2108 001E2008 5800398F */  lw         $25, 0x58($25)
/* E210C 001E200C 09F82003 */  jalr       $25
/* E2110 001E2010 00000000 */   nop
/* E2114 001E2014 E09C828F */  lw         $2, -0x6320($gp)
/* E2118 001E2018 21105000 */  addu       $2, $2, $16
/* E211C 001E201C 5000A427 */  addiu      $4, $sp, 0x50
/* E2120 001E2020 0100013C */  lui        $at, (0x1E440 >> 16)
/* E2124 001E2024 40E42134 */  ori        $at, $at, (0x1E440 & 0xFFFF)
/* E2128 001E2028 21284100 */  addu       $5, $2, $at
/* E212C 001E202C 3000A627 */  addiu      $6, $sp, 0x30
/* E2130 001E2030 EE85040C */  jal        sceVu0SubVector
/* E2134 001E2034 00000000 */   nop
/* E2138 001E2038 5000ACC7 */  lwc1       $f12, 0x50($sp)
/* E213C 001E203C 5800ADC7 */  lwc1       $f13, 0x58($sp)
/* E2140 001E2040 5077040C */  jal        atan2f
/* E2144 001E2044 00000000 */   nop
/* E2148 001E2048 4400A0E7 */  swc1       $f0, 0x44($sp)
/* E214C 001E204C E09C828F */  lw         $2, -0x6320($gp)
/* E2150 001E2050 21105100 */  addu       $2, $2, $17
/* E2154 001E2054 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* E2158 001E2058 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* E215C 001E205C 21204100 */  addu       $4, $2, $at
/* E2160 001E2060 4000A527 */  addiu      $5, $sp, 0x40
/* E2164 001E2064 A000998C */  lw         $25, 0xA0($4)
/* E2168 001E2068 3400398F */  lw         $25, 0x34($25)
/* E216C 001E206C 09F82003 */  jalr       $25
/* E2170 001E2070 00000000 */   nop
/* E2174 001E2074 E09C828F */  lw         $2, -0x6320($gp)
/* E2178 001E2078 21100202 */  addu       $2, $16, $2
/* E217C 001E207C 0200013C */  lui        $at, (0x20000 >> 16)
/* E2180 001E2080 21084100 */  addu       $at, $2, $at
/* E2184 001E2084 54E420AC */  sw         $0, -0x1BAC($at)
.L001E2088:
/* E2188 001E2088 01000224 */  addiu      $2, $0, 0x1
/* E218C 001E208C 2000BF7B */  lq         $31, 0x20($sp)
/* E2190 001E2090 1000B17B */  lq         $17, 0x10($sp)
/* E2194 001E2094 0000B07B */  lq         $16, 0x0($sp)
/* E2198 001E2098 6000BD27 */  addiu      $sp, $sp, 0x60
/* E219C 001E209C 0800E003 */  jr         $31
/* E21A0 001E20A0 00000000 */   nop
/* E21A4 001E20A4 00000000 */  nop
/* E21A8 001E20A8 00000000 */  nop
/* E21AC 001E20AC 00000000 */  nop
