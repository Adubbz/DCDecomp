.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FishRecordTextureEnter__Fv
/* F3100 001F3000 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* F3104 001F3004 1000BF7F */  sq         $31, 0x10($sp)
/* F3108 001F3008 0000B07F */  sq         $16, 0x0($sp)
/* F310C 001F300C 8CFB040C */  jal        ReadBGSync__Fv
/* F3110 001F3010 00000000 */   nop
/* F3114 001F3014 6C004014 */  bnez       $2, .L001F31C8
/* F3118 001F3018 00000000 */   nop
/* F311C 001F301C 28260070 */  paddub     $4, $0, $0
/* F3120 001F3020 18FB040C */  jal        GetReadBGFile__Fi
/* F3124 001F3024 00000000 */   nop
/* F3128 001F3028 28864070 */  paddub     $16, $2, $0
/* F312C 001F302C 2900023C */  lui        $2, %hi(_3261)
/* F3130 001F3030 C02A4524 */  addiu      $5, $2, %lo(_3261)
/* F3134 001F3034 2000A427 */  addiu      $4, $sp, 0x20
/* F3138 001F3038 02000324 */  addiu      $3, $0, 0x2
.L001F303C:
/* F313C 001F303C 0000A278 */  lq         $2, 0x0($5)
/* F3140 001F3040 1000A524 */  addiu      $5, $5, 0x10
/* F3144 001F3044 FFFF6324 */  addiu      $3, $3, -0x1
/* F3148 001F3048 0000827C */  sq         $2, 0x0($4)
/* F314C 001F304C 10008424 */  addiu      $4, $4, 0x10
/* F3150 001F3050 FAFF601C */  bgtz       $3, .L001F303C
/* F3154 001F3054 00000000 */   nop
/* F3158 001F3058 0000A2C4 */  lwc1       $f2, 0x0($5)
/* F315C 001F305C 000082E4 */  swc1       $f2, 0x0($4)
/* F3160 001F3060 D901013C */  lui        $at, (0x1D903DC >> 16)
/* F3164 001F3064 DC03228C */  lw         $2, (0x1D903DC & 0xFFFF)($at)
/* F3168 001F3068 2400A2AF */  sw         $2, 0x24($sp)
/* F316C 001F306C 3000A2AF */  sw         $2, 0x30($sp)
/* F3170 001F3070 8C00048E */  lw         $4, 0x8C($16)
/* F3174 001F3074 2A00023C */  lui        $2, %hi(_3274)
/* F3178 001F3078 78D44524 */  addiu      $5, $2, %lo(_3274)
/* F317C 001F307C 28360070 */  paddub     $6, $0, $0
/* F3180 001F3080 C8FD040C */  jal        GetPackFile__FPUiPcPi
/* F3184 001F3084 00000000 */   nop
/* F3188 001F3088 2C00A2AF */  sw         $2, 0x2C($sp)
/* F318C 001F308C C701023C */  lui        $2, %hi(TexManager)
/* F3190 001F3090 70584424 */  addiu      $4, $2, %lo(TexManager)
/* F3194 001F3094 D901013C */  lui        $at, (0x1D903DC >> 16)
/* F3198 001F3098 DC03258C */  lw         $5, (0x1D903DC & 0xFFFF)($at)
/* F319C 001F309C C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* F31A0 001F30A0 00000000 */   nop
/* F31A4 001F30A4 C701023C */  lui        $2, %hi(TexManager)
/* F31A8 001F30A8 70584424 */  addiu      $4, $2, %lo(TexManager)
/* F31AC 001F30AC 98CE040C */  jal        CleanUpTextureList__15CTextureManagerFv
/* F31B0 001F30B0 00000000 */   nop
/* F31B4 001F30B4 C701023C */  lui        $2, %hi(TexManager)
/* F31B8 001F30B8 70584424 */  addiu      $4, $2, %lo(TexManager)
/* F31BC 001F30BC FFFF0524 */  addiu      $5, $0, -0x1
/* F31C0 001F30C0 2000A627 */  addiu      $6, $sp, 0x20
/* F31C4 001F30C4 30D0040C */  jal        LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* F31C8 001F30C8 00000000 */   nop
/* F31CC 001F30CC C701023C */  lui        $2, %hi(TexManager)
/* F31D0 001F30D0 70584424 */  addiu      $4, $2, %lo(TexManager)
/* F31D4 001F30D4 2A00023C */  lui        $2, %hi(_3275)
/* F31D8 001F30D8 88D44524 */  addiu      $5, $2, %lo(_3275)
/* F31DC 001F30DC FFFF0624 */  addiu      $6, $0, -0x1
/* F31E0 001F30E0 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* F31E4 001F30E4 00000000 */   nop
/* F31E8 001F30E8 C89482AF */  sw         $2, -0x6B38($gp)
/* F31EC 001F30EC 8C00048E */  lw         $4, 0x8C($16)
/* F31F0 001F30F0 2A00023C */  lui        $2, %hi(_2964)
/* F31F4 001F30F4 40D44524 */  addiu      $5, $2, %lo(_2964)
/* F31F8 001F30F8 28360070 */  paddub     $6, $0, $0
/* F31FC 001F30FC C8FD040C */  jal        GetPackFile__FPUiPcPi
/* F3200 001F3100 00000000 */   nop
/* F3204 001F3104 28260070 */  paddub     $4, $0, $0
/* F3208 001F3108 282E4070 */  paddub     $5, $2, $0
/* F320C 001F310C 50B0080C */  jal        InitMenuMesSet__FiPs
/* F3210 001F3110 00000000 */   nop
/* F3214 001F3114 FFFF0224 */  addiu      $2, $0, -0x1
/* F3218 001F3118 DA01013C */  lui        $at, (0x1DA3A0C >> 16)
/* F321C 001F311C 0C3A22AC */  sw         $2, (0x1DA3A0C & 0xFFFF)($at)
/* F3220 001F3120 DA01013C */  lui        $at, (0x1DA698C >> 16)
/* F3224 001F3124 8C6922AC */  sw         $2, (0x1DA698C & 0xFFFF)($at)
/* F3228 001F3128 28860070 */  paddub     $16, $0, $0
/* F322C 001F312C 18000010 */  b          .L001F3190
/* F3230 001F3130 00000000 */   nop
.L001F3134:
/* F3234 001F3134 D901013C */  lui        $at, (0x1D903C4 >> 16)
/* F3238 001F3138 C403228C */  lw         $2, (0x1D903C4 & 0xFFFF)($at)
/* F323C 001F313C 21205000 */  addu       $4, $2, $16
/* F3240 001F3140 94CB070C */  jal        GetFishingRankData__Fi
/* F3244 001F3144 00000000 */   nop
/* F3248 001F3148 0B004010 */  beqz       $2, .L001F3178
/* F324C 001F314C 00000000 */   nop
/* F3250 001F3150 0000448C */  lw         $4, 0x0($2)
/* F3254 001F3154 84CB070C */  jal        GetFishMsgNo__Fi
/* F3258 001F3158 00000000 */   nop
/* F325C 001F315C 80201000 */  sll        $4, $16, 2
/* F3260 001F3160 DA01033C */  lui        $3, %hi(D_1DA69B0)
/* F3264 001F3164 B0696324 */  addiu      $3, $3, %lo(D_1DA69B0)
/* F3268 001F3168 21186400 */  addu       $3, $3, $4
/* F326C 001F316C 000062AC */  sw         $2, 0x0($3)
/* F3270 001F3170 06000010 */  b          .L001F318C
/* F3274 001F3174 00000000 */   nop
.L001F3178:
/* F3278 001F3178 80181000 */  sll        $3, $16, 2
/* F327C 001F317C DA01023C */  lui        $2, %hi(D_1DA69B0)
/* F3280 001F3180 B0694224 */  addiu      $2, $2, %lo(D_1DA69B0)
/* F3284 001F3184 21104300 */  addu       $2, $2, $3
/* F3288 001F3188 000040AC */  sw         $0, 0x0($2)
.L001F318C:
/* F328C 001F318C 01001026 */  addiu      $16, $16, 0x1
.L001F3190:
/* F3290 001F3190 0500022A */  slti       $2, $16, 0x5
/* F3294 001F3194 E7FF4014 */  bnez       $2, .L001F3134
/* F3298 001F3198 00000000 */   nop
/* F329C 001F319C DA01023C */  lui        $2, %hi(AtoraNameMes)
/* F32A0 001F31A0 D0524424 */  addiu      $4, $2, %lo(AtoraNameMes)
/* F32A4 001F31A4 C8000524 */  addiu      $5, $0, 0xC8
/* F32A8 001F31A8 5441050C */  jal        MakeMesWin__6ClsMesFi
/* F32AC 001F31AC 00000000 */   nop
/* F32B0 001F31B0 7E000324 */  addiu      $3, $0, 0x7E
/* F32B4 001F31B4 D901013C */  lui        $at, (0x1D903D4 >> 16)
/* F32B8 001F31B8 D40323AC */  sw         $3, (0x1D903D4 & 0xFFFF)($at)
/* F32BC 001F31BC 01000324 */  addiu      $3, $0, 0x1
/* F32C0 001F31C0 D901013C */  lui        $at, (0x1D903D8 >> 16)
/* F32C4 001F31C4 D80323AC */  sw         $3, (0x1D903D8 & 0xFFFF)($at)
.L001F31C8:
/* F32C8 001F31C8 1000BF7B */  lq         $31, 0x10($sp)
/* F32CC 001F31CC 0000B07B */  lq         $16, 0x0($sp)
/* F32D0 001F31D0 5000BD27 */  addiu      $sp, $sp, 0x50
/* F32D4 001F31D4 0800E003 */  jr         $31
/* F32D8 001F31D8 00000000 */   nop
/* F32DC 001F31DC 00000000 */  nop
