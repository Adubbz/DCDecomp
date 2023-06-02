.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_TEX_ANIME_SW__FP12RS_STACKDATAi
/* E5D50 001E5C50 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* E5D54 001E5C54 3000BF7F */  sq         $31, 0x30($sp)
/* E5D58 001E5C58 2000B27F */  sq         $18, 0x20($sp)
/* E5D5C 001E5C5C 1000B17F */  sq         $17, 0x10($sp)
/* E5D60 001E5C60 0000B07F */  sq         $16, 0x0($sp)
/* E5D64 001E5C64 08009224 */  addiu      $18, $4, 0x8
/* E5D68 001E5C68 9085070C */  jal        GetStackInt__FP12RS_STACKDATA_3
/* E5D6C 001E5C6C 00000000 */   nop
/* E5D70 001E5C70 28864070 */  paddub     $16, $2, $0
/* E5D74 001E5C74 28264072 */  paddub     $4, $18, $0
/* E5D78 001E5C78 08009224 */  addiu      $18, $4, 0x8
/* E5D7C 001E5C7C 9085070C */  jal        GetStackInt__FP12RS_STACKDATA_3
/* E5D80 001E5C80 00000000 */   nop
/* E5D84 001E5C84 288E4070 */  paddub     $17, $2, $0
/* E5D88 001E5C88 28264072 */  paddub     $4, $18, $0
/* E5D8C 001E5C8C 9085070C */  jal        GetStackInt__FP12RS_STACKDATA_3
/* E5D90 001E5C90 00000000 */   nop
/* E5D94 001E5C94 04004004 */  bltz       $2, .L001E5CA8
/* E5D98 001E5C98 00000000 */   nop
/* E5D9C 001E5C9C 10004128 */  slti       $at, $2, 0x10
/* E5DA0 001E5CA0 04002014 */  bnez       $at, .L001E5CB4
/* E5DA4 001E5CA4 00000000 */   nop
.L001E5CA8:
/* E5DA8 001E5CA8 02000224 */  addiu      $2, $0, 0x2
/* E5DAC 001E5CAC 24000010 */  b          .L001E5D40
/* E5DB0 001E5CB0 00000000 */   nop
.L001E5CB4:
/* E5DB4 001E5CB4 12002012 */  beqz       $17, .L001E5D00
/* E5DB8 001E5CB8 00000000 */   nop
/* E5DBC 001E5CBC 10350324 */  addiu      $3, $0, 0x3510
/* E5DC0 001E5CC0 18184300 */  mult       $3, $2, $3
/* E5DC4 001E5CC4 E09C828F */  lw         $2, -0x6320($gp)
/* E5DC8 001E5CC8 21104300 */  addu       $2, $2, $3
/* E5DCC 001E5CCC 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* E5DD0 001E5CD0 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* E5DD4 001E5CD4 21204100 */  addu       $4, $2, $at
/* E5DD8 001E5CD8 282E0072 */  paddub     $5, $16, $0
/* E5DDC 001E5CDC 20E0040C */  jal        TexAnimeOn__10CCharacterFi
/* E5DE0 001E5CE0 00000000 */   nop
/* E5DE4 001E5CE4 2A00023C */  lui        $2, %hi(_1311)
/* E5DE8 001E5CE8 F8D04424 */  addiu      $4, $2, %lo(_1311)
/* E5DEC 001E5CEC 282E0072 */  paddub     $5, $16, $0
/* E5DF0 001E5CF0 A611040C */  jal        printf
/* E5DF4 001E5CF4 00000000 */   nop
/* E5DF8 001E5CF8 10000010 */  b          .L001E5D3C
/* E5DFC 001E5CFC 00000000 */   nop
.L001E5D00:
/* E5E00 001E5D00 10350324 */  addiu      $3, $0, 0x3510
/* E5E04 001E5D04 18184300 */  mult       $3, $2, $3
/* E5E08 001E5D08 E09C828F */  lw         $2, -0x6320($gp)
/* E5E0C 001E5D0C 21104300 */  addu       $2, $2, $3
/* E5E10 001E5D10 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* E5E14 001E5D14 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* E5E18 001E5D18 21204100 */  addu       $4, $2, $at
/* E5E1C 001E5D1C 282E0072 */  paddub     $5, $16, $0
/* E5E20 001E5D20 2CE0040C */  jal        TexAnimeOff__10CCharacterFi
/* E5E24 001E5D24 00000000 */   nop
/* E5E28 001E5D28 2A00023C */  lui        $2, %hi(_1312)
/* E5E2C 001E5D2C 08D14424 */  addiu      $4, $2, %lo(_1312)
/* E5E30 001E5D30 282E0072 */  paddub     $5, $16, $0
/* E5E34 001E5D34 A611040C */  jal        printf
/* E5E38 001E5D38 00000000 */   nop
.L001E5D3C:
/* E5E3C 001E5D3C 01000224 */  addiu      $2, $0, 0x1
.L001E5D40:
/* E5E40 001E5D40 3000BF7B */  lq         $31, 0x30($sp)
/* E5E44 001E5D44 2000B27B */  lq         $18, 0x20($sp)
/* E5E48 001E5D48 1000B17B */  lq         $17, 0x10($sp)
/* E5E4C 001E5D4C 0000B07B */  lq         $16, 0x0($sp)
/* E5E50 001E5D50 4000BD27 */  addiu      $sp, $sp, 0x40
/* E5E54 001E5D54 0800E003 */  jr         $31
/* E5E58 001E5D58 00000000 */   nop
/* E5E5C 001E5D5C 00000000 */  nop
