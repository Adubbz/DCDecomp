.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel InitFishRecordView__FP1Pii
/* 0F2F80 001F2E80 C0FFBD27 */  addiu       $29, $29, -0x40
/* 0F2F84 001F2E84 3000BF7F */  sq          $31, 0x30($29)
/* 0F2F88 001F2E88 2000B27F */  sq          $18, 0x20($29)
/* 0F2F8C 001F2E8C 1000B17F */  sq          $17, 0x10($29)
/* 0F2F90 001F2E90 0000B07F */  sq          $16, 0x0($29)
/* 0F2F94 001F2E94 2896A070 */  paddub      $18, $5, $0
/* 0F2F98 001F2E98 288EC070 */  paddub      $17, $6, $0
/* 0F2F9C 001F2E9C 28868070 */  paddub      $16, $4, $0
/* 0F2FA0 001F2EA0 07008014 */  bnez        $4, .L001F2EC0
/* 0F2FA4 001F2EA4 00000000 */   nop
/* 0F2FA8 001F2EA8 D201013C */  lui         $1, %hi(EdMenuBuffer + 0x8)
/* 0F2FAC 001F2EAC D8B3228C */  lw          $2, %lo(EdMenuBuffer + 0x8)($1)
/* 0F2FB0 001F2EB0 00190200 */  sll         $3, $2, 4
/* 0F2FB4 001F2EB4 D201013C */  lui         $1, %hi(EdMenuBuffer)
/* 0F2FB8 001F2EB8 D0B3228C */  lw          $2, %lo(EdMenuBuffer)($1)
/* 0F2FBC 001F2EBC 21804300 */  addu        $16, $2, $3
.L001F2EC0:
/* 0F2FC0 001F2EC0 28260072 */  paddub      $4, $16, $0
/* 0F2FC4 001F2EC4 00AF080C */  jal         MenuCalcBufAlignment__FP1
/* 0F2FC8 001F2EC8 00000000 */   nop
/* 0F2FCC 001F2ECC 28864070 */  paddub      $16, $2, $0
/* 0F2FD0 001F2ED0 0000428E */  lw          $2, 0x0($18)
/* 0F2FD4 001F2ED4 D901013C */  lui         $1, %hi(FishRecordMenu + 0x1C)
/* 0F2FD8 001F2ED8 DC0322AC */  sw          $2, %lo(FishRecordMenu + 0x1C)($1)
/* 0F2FDC 001F2EDC 0400428E */  lw          $2, 0x4($18)
/* 0F2FE0 001F2EE0 D901013C */  lui         $1, %hi(FishRecordMenu + 0x20)
/* 0F2FE4 001F2EE4 E00322AC */  sw          $2, %lo(FishRecordMenu + 0x20)($1)
/* 0F2FE8 001F2EE8 D901013C */  lui         $1, %hi(FishRecordMenu + 0x8)
/* 0F2FEC 001F2EEC C80331AC */  sw          $17, %lo(FishRecordMenu + 0x8)($1)
/* 0F2FF0 001F2EF0 30FB040C */  jal         StartReadBG__Fv
/* 0F2FF4 001F2EF4 00000000 */   nop
/* 0F2FF8 001F2EF8 2A00023C */  lui         $2, %hi(LIT_3257)
/* 0F2FFC 001F2EFC 68D44424 */  addiu       $4, $2, %lo(LIT_3257)
/* 0F3000 001F2F00 282E0072 */  paddub      $5, $16, $0
/* 0F3004 001F2F04 ACAE080C */  jal         LoadFileBGMenuData__FPcP1
/* 0F3008 001F2F08 00000000 */   nop
/* 0F300C 001F2F0C D901013C */  lui         $1, %hi(FishRecordMenu + 0x18)
/* 0F3010 001F2F10 D80320AC */  sw          $0, %lo(FishRecordMenu + 0x18)($1)
/* 0F3014 001F2F14 D901013C */  lui         $1, %hi(FishRecordMenu)
/* 0F3018 001F2F18 C00320AC */  sw          $0, %lo(FishRecordMenu)($1)
/* 0F301C 001F2F1C D901013C */  lui         $1, %hi(FishRecordMenu + 0x4)
/* 0F3020 001F2F20 C40320AC */  sw          $0, %lo(FishRecordMenu + 0x4)($1)
/* 0F3024 001F2F24 D901013C */  lui         $1, %hi(FishRecordMenu + 0x10)
/* 0F3028 001F2F28 D00320AC */  sw          $0, %lo(FishRecordMenu + 0x10)($1)
/* 0F302C 001F2F2C D901013C */  lui         $1, %hi(FishRecordMenu + 0xC)
/* 0F3030 001F2F30 CC0320AC */  sw          $0, %lo(FishRecordMenu + 0xC)($1)
/* 0F3034 001F2F34 C701023C */  lui         $2, %hi(TexManager)
/* 0F3038 001F2F38 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0F303C 001F2F3C 2A00023C */  lui         $2, %hi(LIT_761)
/* 0F3040 001F2F40 60D14524 */  addiu       $5, $2, %lo(LIT_761)
/* 0F3044 001F2F44 FFFF0624 */  addiu       $6, $0, -0x1
/* 0F3048 001F2F48 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0F304C 001F2F4C 00000000 */   nop
/* 0F3050 001F2F50 A09682AF */  sw          $2, -0x6960($28)
/* 0F3054 001F2F54 CC01023C */  lui         $2, %hi(GamePad)
/* 0F3058 001F2F58 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0F305C 001F2F5C 00F00534 */  ori         $5, $0, 0xF000
/* 0F3060 001F2F60 1E000624 */  addiu       $6, $0, 0x1E
/* 0F3064 001F2F64 05000724 */  addiu       $7, $0, 0x5
/* 0F3068 001F2F68 58AD040C */  jal         SetAutoRepeat__8CGamePadFiii
/* 0F306C 001F2F6C 00000000 */   nop
/* 0F3070 001F2F70 CC01023C */  lui         $2, %hi(GamePad)
/* 0F3074 001F2F74 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0F3078 001F2F78 78000524 */  addiu       $5, $0, 0x78
/* 0F307C 001F2F7C 48AE040C */  jal         MenuModeOn__8CGamePadFi
/* 0F3080 001F2F80 00000000 */   nop
/* 0F3084 001F2F84 3000BF7B */  lq          $31, 0x30($29)
/* 0F3088 001F2F88 2000B27B */  lq          $18, 0x20($29)
/* 0F308C 001F2F8C 1000B17B */  lq          $17, 0x10($29)
/* 0F3090 001F2F90 0000B07B */  lq          $16, 0x0($29)
/* 0F3094 001F2F94 4000BD27 */  addiu       $29, $29, 0x40
/* 0F3098 001F2F98 0800E003 */  jr          $31
/* 0F309C 001F2F9C 00000000 */   nop
