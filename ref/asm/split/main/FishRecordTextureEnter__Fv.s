.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel FishRecordTextureEnter__Fv
/* 0F3100 001F3000 B0FFBD27 */  addiu       $29, $29, -0x50
/* 0F3104 001F3004 1000BF7F */  sq          $31, 0x10($29)
/* 0F3108 001F3008 0000B07F */  sq          $16, 0x0($29)
/* 0F310C 001F300C 8CFB040C */  jal         ReadBGSync__Fv
/* 0F3110 001F3010 00000000 */   nop
/* 0F3114 001F3014 6C004014 */  bnez        $2, .L001F31C8
/* 0F3118 001F3018 00000000 */   nop
/* 0F311C 001F301C 28260070 */  paddub      $4, $0, $0
/* 0F3120 001F3020 18FB040C */  jal         GetReadBGFile__Fi
/* 0F3124 001F3024 00000000 */   nop
/* 0F3128 001F3028 28864070 */  paddub      $16, $2, $0
/* 0F312C 001F302C 2900023C */  lui         $2, %hi(LIT_3261)
/* 0F3130 001F3030 C02A4524 */  addiu       $5, $2, %lo(LIT_3261)
/* 0F3134 001F3034 2000A427 */  addiu       $4, $29, 0x20
/* 0F3138 001F3038 02000324 */  addiu       $3, $0, 0x2
.L001F303C:
/* 0F313C 001F303C 0000A278 */  lq          $2, 0x0($5)
/* 0F3140 001F3040 1000A524 */  addiu       $5, $5, 0x10
/* 0F3144 001F3044 FFFF6324 */  addiu       $3, $3, -0x1
/* 0F3148 001F3048 0000827C */  sq          $2, 0x0($4)
/* 0F314C 001F304C 10008424 */  addiu       $4, $4, 0x10
/* 0F3150 001F3050 FAFF601C */  bgtz        $3, .L001F303C
/* 0F3154 001F3054 00000000 */   nop
/* 0F3158 001F3058 0000A2C4 */  lwc1        $f2, 0x0($5)
/* 0F315C 001F305C 000082E4 */  swc1        $f2, 0x0($4)
/* 0F3160 001F3060 D901013C */  lui         $1, %hi(FishRecordMenu + 0x1C)
/* 0F3164 001F3064 DC03228C */  lw          $2, %lo(FishRecordMenu + 0x1C)($1)
/* 0F3168 001F3068 2400A2AF */  sw          $2, 0x24($29)
/* 0F316C 001F306C 3000A2AF */  sw          $2, 0x30($29)
/* 0F3170 001F3070 8C00048E */  lw          $4, 0x8C($16)
/* 0F3174 001F3074 2A00023C */  lui         $2, %hi(LIT_3274)
/* 0F3178 001F3078 78D44524 */  addiu       $5, $2, %lo(LIT_3274)
/* 0F317C 001F307C 28360070 */  paddub      $6, $0, $0
/* 0F3180 001F3080 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0F3184 001F3084 00000000 */   nop
/* 0F3188 001F3088 2C00A2AF */  sw          $2, 0x2C($29)
/* 0F318C 001F308C C701023C */  lui         $2, %hi(TexManager)
/* 0F3190 001F3090 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0F3194 001F3094 D901013C */  lui         $1, %hi(FishRecordMenu + 0x1C)
/* 0F3198 001F3098 DC03258C */  lw          $5, %lo(FishRecordMenu + 0x1C)($1)
/* 0F319C 001F309C C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 0F31A0 001F30A0 00000000 */   nop
/* 0F31A4 001F30A4 C701023C */  lui         $2, %hi(TexManager)
/* 0F31A8 001F30A8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0F31AC 001F30AC 98CE040C */  jal         CleanUpTextureList__15CTextureManagerFv
/* 0F31B0 001F30B0 00000000 */   nop
/* 0F31B4 001F30B4 C701023C */  lui         $2, %hi(TexManager)
/* 0F31B8 001F30B8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0F31BC 001F30BC FFFF0524 */  addiu       $5, $0, -0x1
/* 0F31C0 001F30C0 2000A627 */  addiu       $6, $29, 0x20
/* 0F31C4 001F30C4 30D0040C */  jal         LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 0F31C8 001F30C8 00000000 */   nop
/* 0F31CC 001F30CC C701023C */  lui         $2, %hi(TexManager)
/* 0F31D0 001F30D0 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0F31D4 001F30D4 2A00023C */  lui         $2, %hi(LIT_3275)
/* 0F31D8 001F30D8 88D44524 */  addiu       $5, $2, %lo(LIT_3275)
/* 0F31DC 001F30DC FFFF0624 */  addiu       $6, $0, -0x1
/* 0F31E0 001F30E0 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0F31E4 001F30E4 00000000 */   nop
/* 0F31E8 001F30E8 C89482AF */  sw          $2, -0x6B38($28)
/* 0F31EC 001F30EC 8C00048E */  lw          $4, 0x8C($16)
/* 0F31F0 001F30F0 2A00023C */  lui         $2, %hi(LIT_2964)
/* 0F31F4 001F30F4 40D44524 */  addiu       $5, $2, %lo(LIT_2964)
/* 0F31F8 001F30F8 28360070 */  paddub      $6, $0, $0
/* 0F31FC 001F30FC C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0F3200 001F3100 00000000 */   nop
/* 0F3204 001F3104 28260070 */  paddub      $4, $0, $0
/* 0F3208 001F3108 282E4070 */  paddub      $5, $2, $0
/* 0F320C 001F310C 50B0080C */  jal         InitMenuMesSet__FiPs
/* 0F3210 001F3110 00000000 */   nop
/* 0F3214 001F3114 FFFF0224 */  addiu       $2, $0, -0x1
/* 0F3218 001F3118 DA01013C */  lui         $1, %hi(CommonMenuMes2 + 0x16BC)
/* 0F321C 001F311C 0C3A22AC */  sw          $2, %lo(CommonMenuMes2 + 0x16BC)($1)
/* 0F3220 001F3120 DA01013C */  lui         $1, %hi(AtoraNameMes + 0x16BC)
/* 0F3224 001F3124 8C6922AC */  sw          $2, %lo(AtoraNameMes + 0x16BC)($1)
/* 0F3228 001F3128 28860070 */  paddub      $16, $0, $0
/* 0F322C 001F312C 18000010 */  b           .L001F3190
/* 0F3230 001F3130 00000000 */   nop
.L001F3134:
/* 0F3234 001F3134 D901013C */  lui         $1, %hi(FishRecordMenu + 0x4)
/* 0F3238 001F3138 C403228C */  lw          $2, %lo(FishRecordMenu + 0x4)($1)
/* 0F323C 001F313C 21205000 */  addu        $4, $2, $16
/* 0F3240 001F3140 94CB070C */  jal         GetFishingRankData__Fi
/* 0F3244 001F3144 00000000 */   nop
/* 0F3248 001F3148 0B004010 */  beqz        $2, .L001F3178
/* 0F324C 001F314C 00000000 */   nop
/* 0F3250 001F3150 0000448C */  lw          $4, 0x0($2)
/* 0F3254 001F3154 84CB070C */  jal         GetFishMsgNo__Fi
/* 0F3258 001F3158 00000000 */   nop
/* 0F325C 001F315C 80201000 */  sll         $4, $16, 2
/* 0F3260 001F3160 DA01033C */  lui         $3, %hi(AtoraNameMes + 0x16E0)
/* 0F3264 001F3164 B0696324 */  addiu       $3, $3, %lo(AtoraNameMes + 0x16E0)
/* 0F3268 001F3168 21186400 */  addu        $3, $3, $4
/* 0F326C 001F316C 000062AC */  sw          $2, 0x0($3)
/* 0F3270 001F3170 06000010 */  b           .L001F318C
/* 0F3274 001F3174 00000000 */   nop
.L001F3178:
/* 0F3278 001F3178 80181000 */  sll         $3, $16, 2
/* 0F327C 001F317C DA01023C */  lui         $2, %hi(AtoraNameMes + 0x16E0)
/* 0F3280 001F3180 B0694224 */  addiu       $2, $2, %lo(AtoraNameMes + 0x16E0)
/* 0F3284 001F3184 21104300 */  addu        $2, $2, $3
/* 0F3288 001F3188 000040AC */  sw          $0, 0x0($2)
.L001F318C:
/* 0F328C 001F318C 01001026 */  addiu       $16, $16, 0x1
.L001F3190:
/* 0F3290 001F3190 0500022A */  slti        $2, $16, 0x5
/* 0F3294 001F3194 E7FF4014 */  bnez        $2, .L001F3134
/* 0F3298 001F3198 00000000 */   nop
/* 0F329C 001F319C DA01023C */  lui         $2, %hi(AtoraNameMes)
/* 0F32A0 001F31A0 D0524424 */  addiu       $4, $2, %lo(AtoraNameMes)
/* 0F32A4 001F31A4 C8000524 */  addiu       $5, $0, 0xC8
/* 0F32A8 001F31A8 5441050C */  jal         MakeMesWin__6ClsMesFi
/* 0F32AC 001F31AC 00000000 */   nop
/* 0F32B0 001F31B0 7E000324 */  addiu       $3, $0, 0x7E
/* 0F32B4 001F31B4 D901013C */  lui         $1, %hi(FishRecordMenu + 0x14)
/* 0F32B8 001F31B8 D40323AC */  sw          $3, %lo(FishRecordMenu + 0x14)($1)
/* 0F32BC 001F31BC 01000324 */  addiu       $3, $0, 0x1
/* 0F32C0 001F31C0 D901013C */  lui         $1, %hi(FishRecordMenu + 0x18)
/* 0F32C4 001F31C4 D80323AC */  sw          $3, %lo(FishRecordMenu + 0x18)($1)
.L001F31C8:
/* 0F32C8 001F31C8 1000BF7B */  lq          $31, 0x10($29)
/* 0F32CC 001F31CC 0000B07B */  lq          $16, 0x0($29)
/* 0F32D0 001F31D0 5000BD27 */  addiu       $29, $29, 0x50
/* 0F32D4 001F31D4 0800E003 */  jr          $31
/* 0F32D8 001F31D8 00000000 */   nop
/* 0F32DC 001F31DC 00000000 */  nop
