.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitEastKingEvent__FiPiP1
/* 132F30 00232E30 70FFBD27 */  addiu      $sp, $sp, -0x90
/* 132F34 00232E34 3000BF7F */  sq         $31, 0x30($sp)
/* 132F38 00232E38 2000B27F */  sq         $18, 0x20($sp)
/* 132F3C 00232E3C 1000B17F */  sq         $17, 0x10($sp)
/* 132F40 00232E40 0000B07F */  sq         $16, 0x0($sp)
/* 132F44 00232E44 288E8070 */  paddub     $17, $4, $0
/* 132F48 00232E48 2886A070 */  paddub     $16, $5, $0
/* 132F4C 00232E4C 2896C070 */  paddub     $18, $6, $0
/* 132F50 00232E50 4000A427 */  addiu      $4, $sp, 0x40
/* 132F54 00232E54 94AE080C */  jal        GetPathReadDifferntLang__FPc
/* 132F58 00232E58 00000000 */   nop
/* 132F5C 00232E5C 4000A427 */  addiu      $4, $sp, 0x40
/* 132F60 00232E60 2A00023C */  lui        $2, %hi(_398_2)
/* 132F64 00232E64 98F24524 */  addiu      $5, $2, %lo(_398_2)
/* 132F68 00232E68 BC14040C */  jal        strcat
/* 132F6C 00232E6C 00000000 */   nop
/* 132F70 00232E70 01002626 */  addiu      $6, $17, 0x1
/* 132F74 00232E74 4000A427 */  addiu      $4, $sp, 0x40
/* 132F78 00232E78 282E8070 */  paddub     $5, $4, $0
/* 132F7C 00232E7C 1614040C */  jal        sprintf
/* 132F80 00232E80 00000000 */   nop
/* 132F84 00232E84 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 132F88 00232E88 50A832AC */  sw         $18, -0x57B0($at)
/* 132F8C 00232E8C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 132F90 00232E90 50A8248C */  lw         $4, -0x57B0($at)
/* 132F94 00232E94 00AF080C */  jal        MenuCalcBufAlignment__FP1
/* 132F98 00232E98 00000000 */   nop
/* 132F9C 00232E9C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 132FA0 00232EA0 50A822AC */  sw         $2, -0x57B0($at)
/* 132FA4 00232EA4 30FB040C */  jal        StartReadBG__Fv
/* 132FA8 00232EA8 00000000 */   nop
/* 132FAC 00232EAC 4000A427 */  addiu      $4, $sp, 0x40
/* 132FB0 00232EB0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 132FB4 00232EB4 50A8258C */  lw         $5, -0x57B0($at)
/* 132FB8 00232EB8 8C00A627 */  addiu      $6, $sp, 0x8C
/* 132FBC 00232EBC ACFA040C */  jal        LoadFileBG__FPcP1Pi
/* 132FC0 00232EC0 00000000 */   nop
/* 132FC4 00232EC4 38FB040C */  jal        ReadBG__Fv
/* 132FC8 00232EC8 00000000 */   nop
/* 132FCC 00232ECC 8C00A28F */  lw         $2, 0x8C($sp)
/* 132FD0 00232ED0 03110200 */  sra        $2, $2, 4
/* 132FD4 00232ED4 00190200 */  sll        $3, $2, 4
/* 132FD8 00232ED8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 132FDC 00232EDC 50A8228C */  lw         $2, -0x57B0($at)
/* 132FE0 00232EE0 21104300 */  addu       $2, $2, $3
/* 132FE4 00232EE4 00014224 */  addiu      $2, $2, 0x100
/* 132FE8 00232EE8 B89782AF */  sw         $2, -0x6848($gp)
/* 132FEC 00232EEC B897848F */  lw         $4, -0x6848($gp)
/* 132FF0 00232EF0 00AF080C */  jal        MenuCalcBufAlignment__FP1
/* 132FF4 00232EF4 00000000 */   nop
/* 132FF8 00232EF8 B89782AF */  sw         $2, -0x6848($gp)
/* 132FFC 00232EFC 4467050C */  jal        SndGetBgmNo__Fv
/* 133000 00232F00 00000000 */   nop
/* 133004 00232F04 B09782A7 */  sh         $2, -0x6850($gp)
/* 133008 00232F08 16000424 */  addiu      $4, $0, 0x16
/* 13300C 00232F0C B897858F */  lw         $5, -0x6848($gp)
/* 133010 00232F10 8C00A627 */  addiu      $6, $sp, 0x8C
/* 133014 00232F14 7C66050C */  jal        SndBgmLoadBG__FiPUiPi
/* 133018 00232F18 00000000 */   nop
/* 13301C 00232F1C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 133020 00232F20 4CA820A4 */  sh         $0, -0x57B4($at)
/* 133024 00232F24 0000028E */  lw         $2, 0x0($16)
/* 133028 00232F28 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13302C 00232F2C 40A822AC */  sw         $2, -0x57C0($at)
/* 133030 00232F30 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 133034 00232F34 4AA831A4 */  sh         $17, -0x57B6($at)
/* 133038 00232F38 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13303C 00232F3C 54A820A4 */  sh         $0, -0x57AC($at)
/* 133040 00232F40 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 133044 00232F44 58A820AC */  sw         $0, -0x57A8($at)
/* 133048 00232F48 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13304C 00232F4C 4AA82484 */  lh         $4, -0x57B6($at)
/* 133050 00232F50 80100400 */  sll        $2, $4, 2
/* 133054 00232F54 21184400 */  addu       $3, $2, $4
/* 133058 00232F58 80100300 */  sll        $2, $3, 2
/* 13305C 00232F5C 21106200 */  addu       $2, $3, $2
/* 133060 00232F60 80100200 */  sll        $2, $2, 2
/* 133064 00232F64 64004224 */  addiu      $2, $2, 0x64
/* 133068 00232F68 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13306C 00232F6C 60A822A4 */  sh         $2, -0x57A0($at)
/* 133070 00232F70 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 133074 00232F74 62A820A4 */  sh         $0, -0x579E($at)
/* 133078 00232F78 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 13307C 00232F7C 6AA820A4 */  sh         $0, -0x5796($at)
/* 133080 00232F80 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 133084 00232F84 64A820A4 */  sh         $0, -0x579C($at)
/* 133088 00232F88 E6008524 */  addiu      $5, $4, 0xE6
/* 13308C 00232F8C 1C8D848F */  lw         $4, -0x72E4($gp)
/* 133090 00232F90 8060050C */  jal        GetGameFlag__9CSaveDataFi
/* 133094 00232F94 00000000 */   nop
/* 133098 00232F98 08004014 */  bnez       $2, .L00232FBC
/* 13309C 00232F9C 00000000 */   nop
/* 1330A0 00232FA0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 1330A4 00232FA4 4AA82284 */  lh         $2, -0x57B6($at)
/* 1330A8 00232FA8 E6004524 */  addiu      $5, $2, 0xE6
/* 1330AC 00232FAC 1C8D848F */  lw         $4, -0x72E4($gp)
/* 1330B0 00232FB0 01000624 */  addiu      $6, $0, 0x1
/* 1330B4 00232FB4 A060050C */  jal        SetGameFlag__9CSaveDataFii
/* 1330B8 00232FB8 00000000 */   nop
.L00232FBC:
/* 1330BC 00232FBC 3000BF7B */  lq         $31, 0x30($sp)
/* 1330C0 00232FC0 2000B27B */  lq         $18, 0x20($sp)
/* 1330C4 00232FC4 1000B17B */  lq         $17, 0x10($sp)
/* 1330C8 00232FC8 0000B07B */  lq         $16, 0x0($sp)
/* 1330CC 00232FCC 9000BD27 */  addiu      $sp, $sp, 0x90
/* 1330D0 00232FD0 0800E003 */  jr         $31
/* 1330D4 00232FD4 00000000 */   nop
/* 1330D8 00232FD8 00000000 */  nop
/* 1330DC 00232FDC 00000000 */  nop