.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitFishRecordView__FP1Pii
/* F2F80 001F2E80 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* F2F84 001F2E84 3000BF7F */  sq         $31, 0x30($sp)
/* F2F88 001F2E88 2000B27F */  sq         $18, 0x20($sp)
/* F2F8C 001F2E8C 1000B17F */  sq         $17, 0x10($sp)
/* F2F90 001F2E90 0000B07F */  sq         $16, 0x0($sp)
/* F2F94 001F2E94 2896A070 */  paddub     $18, $5, $0
/* F2F98 001F2E98 288EC070 */  paddub     $17, $6, $0
/* F2F9C 001F2E9C 28868070 */  paddub     $16, $4, $0
/* F2FA0 001F2EA0 07008014 */  bnez       $4, .L001F2EC0
/* F2FA4 001F2EA4 00000000 */   nop
/* F2FA8 001F2EA8 D201013C */  lui        $at, (0x1D20000 >> 16)
/* F2FAC 001F2EAC D8B3228C */  lw         $2, -0x4C28($at)
/* F2FB0 001F2EB0 00190200 */  sll        $3, $2, 4
/* F2FB4 001F2EB4 D201013C */  lui        $at, (0x1D20000 >> 16)
/* F2FB8 001F2EB8 D0B3228C */  lw         $2, -0x4C30($at)
/* F2FBC 001F2EBC 21804300 */  addu       $16, $2, $3
.L001F2EC0:
/* F2FC0 001F2EC0 28260072 */  paddub     $4, $16, $0
/* F2FC4 001F2EC4 00AF080C */  jal        MenuCalcBufAlignment__FP1
/* F2FC8 001F2EC8 00000000 */   nop
/* F2FCC 001F2ECC 28864070 */  paddub     $16, $2, $0
/* F2FD0 001F2ED0 0000428E */  lw         $2, 0x0($18)
/* F2FD4 001F2ED4 D901013C */  lui        $at, (0x1D903DC >> 16)
/* F2FD8 001F2ED8 DC0322AC */  sw         $2, (0x1D903DC & 0xFFFF)($at)
/* F2FDC 001F2EDC 0400428E */  lw         $2, 0x4($18)
/* F2FE0 001F2EE0 D901013C */  lui        $at, (0x1D903E0 >> 16)
/* F2FE4 001F2EE4 E00322AC */  sw         $2, (0x1D903E0 & 0xFFFF)($at)
/* F2FE8 001F2EE8 D901013C */  lui        $at, (0x1D903C8 >> 16)
/* F2FEC 001F2EEC C80331AC */  sw         $17, (0x1D903C8 & 0xFFFF)($at)
/* F2FF0 001F2EF0 30FB040C */  jal        StartReadBG__Fv
/* F2FF4 001F2EF4 00000000 */   nop
/* F2FF8 001F2EF8 2A00023C */  lui        $2, %hi(_3257)
/* F2FFC 001F2EFC 68D44424 */  addiu      $4, $2, %lo(_3257)
/* F3000 001F2F00 282E0072 */  paddub     $5, $16, $0
/* F3004 001F2F04 ACAE080C */  jal        LoadFileBGMenuData__FPcP1
/* F3008 001F2F08 00000000 */   nop
/* F300C 001F2F0C D901013C */  lui        $at, (0x1D903D8 >> 16)
/* F3010 001F2F10 D80320AC */  sw         $0, (0x1D903D8 & 0xFFFF)($at)
/* F3014 001F2F14 D901013C */  lui        $at, (0x1D903C0 >> 16)
/* F3018 001F2F18 C00320AC */  sw         $0, (0x1D903C0 & 0xFFFF)($at)
/* F301C 001F2F1C D901013C */  lui        $at, (0x1D903C4 >> 16)
/* F3020 001F2F20 C40320AC */  sw         $0, (0x1D903C4 & 0xFFFF)($at)
/* F3024 001F2F24 D901013C */  lui        $at, (0x1D903D0 >> 16)
/* F3028 001F2F28 D00320AC */  sw         $0, (0x1D903D0 & 0xFFFF)($at)
/* F302C 001F2F2C D901013C */  lui        $at, (0x1D903CC >> 16)
/* F3030 001F2F30 CC0320AC */  sw         $0, (0x1D903CC & 0xFFFF)($at)
/* F3034 001F2F34 C701023C */  lui        $2, %hi(TexManager)
/* F3038 001F2F38 70584424 */  addiu      $4, $2, %lo(TexManager)
/* F303C 001F2F3C 2A00023C */  lui        $2, %hi(_761)
/* F3040 001F2F40 60D14524 */  addiu      $5, $2, %lo(_761)
/* F3044 001F2F44 FFFF0624 */  addiu      $6, $0, -0x1
/* F3048 001F2F48 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* F304C 001F2F4C 00000000 */   nop
/* F3050 001F2F50 A09682AF */  sw         $2, -0x6960($gp)
/* F3054 001F2F54 CC01023C */  lui        $2, %hi(GamePad)
/* F3058 001F2F58 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* F305C 001F2F5C 00F00534 */  ori        $5, $0, 0xF000
/* F3060 001F2F60 1E000624 */  addiu      $6, $0, 0x1E
/* F3064 001F2F64 05000724 */  addiu      $7, $0, 0x5
/* F3068 001F2F68 58AD040C */  jal        SetAutoRepeat__8CGamePadFiii
/* F306C 001F2F6C 00000000 */   nop
/* F3070 001F2F70 CC01023C */  lui        $2, %hi(GamePad)
/* F3074 001F2F74 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* F3078 001F2F78 78000524 */  addiu      $5, $0, 0x78
/* F307C 001F2F7C 48AE040C */  jal        MenuModeOn__8CGamePadFi
/* F3080 001F2F80 00000000 */   nop
/* F3084 001F2F84 3000BF7B */  lq         $31, 0x30($sp)
/* F3088 001F2F88 2000B27B */  lq         $18, 0x20($sp)
/* F308C 001F2F8C 1000B17B */  lq         $17, 0x10($sp)
/* F3090 001F2F90 0000B07B */  lq         $16, 0x0($sp)
/* F3094 001F2F94 4000BD27 */  addiu      $sp, $sp, 0x40
/* F3098 001F2F98 0800E003 */  jr         $31
/* F309C 001F2F9C 00000000 */   nop
