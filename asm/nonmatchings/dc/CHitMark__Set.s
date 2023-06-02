.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Set__8CHitMarkFPfPfiffffif
/* B2F90 001B2E90 80FFBD27 */  addiu      $sp, $sp, -0x80
/* B2F94 001B2E94 7000BF7F */  sq         $31, 0x70($sp)
/* B2F98 001B2E98 6000B47F */  sq         $20, 0x60($sp)
/* B2F9C 001B2E9C 5000B37F */  sq         $19, 0x50($sp)
/* B2FA0 001B2EA0 4000B27F */  sq         $18, 0x40($sp)
/* B2FA4 001B2EA4 3000B17F */  sq         $17, 0x30($sp)
/* B2FA8 001B2EA8 2000B07F */  sq         $16, 0x20($sp)
/* B2FAC 001B2EAC 1000B8E7 */  swc1       $f24, 0x10($sp)
/* B2FB0 001B2EB0 0C00B7E7 */  swc1       $f23, 0xC($sp)
/* B2FB4 001B2EB4 0800B6E7 */  swc1       $f22, 0x8($sp)
/* B2FB8 001B2EB8 0400B5E7 */  swc1       $f21, 0x4($sp)
/* B2FBC 001B2EBC 0000B4E7 */  swc1       $f20, 0x0($sp)
/* B2FC0 001B2EC0 28A68070 */  paddub     $20, $4, $0
/* B2FC4 001B2EC4 289EC070 */  paddub     $19, $6, $0
/* B2FC8 001B2EC8 2886E070 */  paddub     $16, $7, $0
/* B2FCC 001B2ECC 06660046 */  mov.s      $f24, $f12
/* B2FD0 001B2ED0 C66D0046 */  mov.s      $f23, $f13
/* B2FD4 001B2ED4 86750046 */  mov.s      $f22, $f14
/* B2FD8 001B2ED8 467D0046 */  mov.s      $f21, $f15
/* B2FDC 001B2EDC 28960071 */  paddub     $18, $8, $0
/* B2FE0 001B2EE0 06850046 */  mov.s      $f20, $f16
/* B2FE4 001B2EE4 A000998E */  lw         $25, 0xA0($20)
/* B2FE8 001B2EE8 1400398F */  lw         $25, 0x14($25)
/* B2FEC 001B2EEC 09F82003 */  jalr       $25
/* B2FF0 001B2EF0 00000000 */   nop
/* B2FF4 001B2EF4 580690AE */  sw         $16, 0x658($20)
/* B2FF8 001B2EF8 C40598E6 */  swc1       $f24, 0x5C4($20)
/* B2FFC 001B2EFC C00597E6 */  swc1       $f23, 0x5C0($20)
/* B3000 001B2F00 C80596E6 */  swc1       $f22, 0x5C8($20)
/* B3004 001B2F04 CC0595E6 */  swc1       $f21, 0x5CC($20)
/* B3008 001B2F08 5C0694E6 */  swc1       $f20, 0x65C($20)
/* B300C 001B2F0C 28266072 */  paddub     $4, $19, $0
/* B3010 001B2F10 282E6072 */  paddub     $5, $19, $0
/* B3014 001B2F14 9285040C */  jal        sceVu0Normalize
/* B3018 001B2F18 00000000 */   nop
/* B301C 001B2F1C 000061C6 */  lwc1       $f1, 0x0($19)
/* B3020 001B2F20 CC0580C6 */  lwc1       $f0, 0x5CC($20)
/* B3024 001B2F24 02080046 */  mul.s      $f0, $f1, $f0
/* B3028 001B2F28 000060E6 */  swc1       $f0, 0x0($19)
/* B302C 001B2F2C 040061C6 */  lwc1       $f1, 0x4($19)
/* B3030 001B2F30 CC0580C6 */  lwc1       $f0, 0x5CC($20)
/* B3034 001B2F34 02080046 */  mul.s      $f0, $f1, $f0
/* B3038 001B2F38 040060E6 */  swc1       $f0, 0x4($19)
/* B303C 001B2F3C 080061C6 */  lwc1       $f1, 0x8($19)
/* B3040 001B2F40 CC0580C6 */  lwc1       $f0, 0x5CC($20)
/* B3044 001B2F44 02080046 */  mul.s      $f0, $f1, $f0
/* B3048 001B2F48 080060E6 */  swc1       $f0, 0x8($19)
/* B304C 001B2F4C 28860070 */  paddub     $16, $0, $0
/* B3050 001B2F50 80000010 */  b          .L001B3154
/* B3054 001B2F54 00000000 */   nop
.L001B2F58:
/* B3058 001B2F58 BE11040C */  jal        rand
/* B305C 001B2F5C 00000000 */   nop
/* B3060 001B2F60 00008244 */  mtc1       $2, $f0
/* B3064 001B2F64 00000000 */  nop
/* B3068 001B2F68 60008046 */  cvt.s.w    $f1, $f0
/* B306C 001B2F6C 004F023C */  lui        $2, (0x4F000000 >> 16)
/* B3070 001B2F70 00008244 */  mtc1       $2, $f0
/* B3074 001B2F74 00000000 */  nop
/* B3078 001B2F78 43080046 */  div.s      $f1, $f1, $f0
/* B307C 001B2F7C 003F023C */  lui        $2, (0x3F000000 >> 16)
/* B3080 001B2F80 00008244 */  mtc1       $2, $f0
/* B3084 001B2F84 00000000 */  nop
/* B3088 001B2F88 01080046 */  sub.s      $f0, $f1, $f0
/* B308C 001B2F8C 00891000 */  sll        $17, $16, 4
/* B3090 001B2F90 21103402 */  addu       $2, $17, $20
/* B3094 001B2F94 B00040E4 */  swc1       $f0, 0xB0($2)
/* B3098 001B2F98 BE11040C */  jal        rand
/* B309C 001B2F9C 00000000 */   nop
/* B30A0 001B2FA0 00008244 */  mtc1       $2, $f0
/* B30A4 001B2FA4 00000000 */  nop
/* B30A8 001B2FA8 60008046 */  cvt.s.w    $f1, $f0
/* B30AC 001B2FAC 004F023C */  lui        $2, (0x4F000000 >> 16)
/* B30B0 001B2FB0 00008244 */  mtc1       $2, $f0
/* B30B4 001B2FB4 00000000 */  nop
/* B30B8 001B2FB8 43080046 */  div.s      $f1, $f1, $f0
/* B30BC 001B2FBC 003F023C */  lui        $2, (0x3F000000 >> 16)
/* B30C0 001B2FC0 00008244 */  mtc1       $2, $f0
/* B30C4 001B2FC4 00000000 */  nop
/* B30C8 001B2FC8 01080046 */  sub.s      $f0, $f1, $f0
/* B30CC 001B2FCC 21103402 */  addu       $2, $17, $20
/* B30D0 001B2FD0 B40040E4 */  swc1       $f0, 0xB4($2)
/* B30D4 001B2FD4 BE11040C */  jal        rand
/* B30D8 001B2FD8 00000000 */   nop
/* B30DC 001B2FDC 00008244 */  mtc1       $2, $f0
/* B30E0 001B2FE0 00000000 */  nop
/* B30E4 001B2FE4 60008046 */  cvt.s.w    $f1, $f0
/* B30E8 001B2FE8 004F023C */  lui        $2, (0x4F000000 >> 16)
/* B30EC 001B2FEC 00008244 */  mtc1       $2, $f0
/* B30F0 001B2FF0 00000000 */  nop
/* B30F4 001B2FF4 43080046 */  div.s      $f1, $f1, $f0
/* B30F8 001B2FF8 003F023C */  lui        $2, (0x3F000000 >> 16)
/* B30FC 001B2FFC 00008244 */  mtc1       $2, $f0
/* B3100 001B3000 00000000 */  nop
/* B3104 001B3004 01080046 */  sub.s      $f0, $f1, $f0
/* B3108 001B3008 21183402 */  addu       $3, $17, $20
/* B310C 001B300C B80060E4 */  swc1       $f0, 0xB8($3)
/* B3110 001B3010 803F023C */  lui        $2, (0x3F800000 >> 16)
/* B3114 001B3014 BC0062AC */  sw         $2, 0xBC($3)
/* B3118 001B3018 C40594C6 */  lwc1       $f20, 0x5C4($20)
/* B311C 001B301C BE11040C */  jal        rand
/* B3120 001B3020 00000000 */   nop
/* B3124 001B3024 00008244 */  mtc1       $2, $f0
/* B3128 001B3028 00000000 */  nop
/* B312C 001B302C 20008046 */  cvt.s.w    $f0, $f0
/* B3130 001B3030 42A00046 */  mul.s      $f1, $f20, $f0
/* B3134 001B3034 004F023C */  lui        $2, (0x4F000000 >> 16)
/* B3138 001B3038 00008244 */  mtc1       $2, $f0
/* B313C 001B303C 00000000 */  nop
/* B3140 001B3040 43080046 */  div.s      $f1, $f1, $f0
/* B3144 001B3044 000060C6 */  lwc1       $f0, 0x0($19)
/* B3148 001B3048 40000146 */  add.s      $f1, $f0, $f1
/* B314C 001B304C 0040023C */  lui        $2, (0x40000000 >> 16)
/* B3150 001B3050 00008244 */  mtc1       $2, $f0
/* B3154 001B3054 00000000 */  nop
/* B3158 001B3058 03A00046 */  div.s      $f0, $f20, $f0
/* B315C 001B305C 01080046 */  sub.s      $f0, $f1, $f0
/* B3160 001B3060 21103402 */  addu       $2, $17, $20
/* B3164 001B3064 B00240E4 */  swc1       $f0, 0x2B0($2)
/* B3168 001B3068 C40594C6 */  lwc1       $f20, 0x5C4($20)
/* B316C 001B306C BE11040C */  jal        rand
/* B3170 001B3070 00000000 */   nop
/* B3174 001B3074 00008244 */  mtc1       $2, $f0
/* B3178 001B3078 00000000 */  nop
/* B317C 001B307C 20008046 */  cvt.s.w    $f0, $f0
/* B3180 001B3080 42A00046 */  mul.s      $f1, $f20, $f0
/* B3184 001B3084 004F023C */  lui        $2, (0x4F000000 >> 16)
/* B3188 001B3088 00008244 */  mtc1       $2, $f0
/* B318C 001B308C 00000000 */  nop
/* B3190 001B3090 43080046 */  div.s      $f1, $f1, $f0
/* B3194 001B3094 000060C6 */  lwc1       $f0, 0x0($19)
/* B3198 001B3098 40000146 */  add.s      $f1, $f0, $f1
/* B319C 001B309C 0040023C */  lui        $2, (0x40000000 >> 16)
/* B31A0 001B30A0 00008244 */  mtc1       $2, $f0
/* B31A4 001B30A4 00000000 */  nop
/* B31A8 001B30A8 03A00046 */  div.s      $f0, $f20, $f0
/* B31AC 001B30AC 01080046 */  sub.s      $f0, $f1, $f0
/* B31B0 001B30B0 21103402 */  addu       $2, $17, $20
/* B31B4 001B30B4 B40240E4 */  swc1       $f0, 0x2B4($2)
/* B31B8 001B30B8 C40594C6 */  lwc1       $f20, 0x5C4($20)
/* B31BC 001B30BC BE11040C */  jal        rand
/* B31C0 001B30C0 00000000 */   nop
/* B31C4 001B30C4 00008244 */  mtc1       $2, $f0
/* B31C8 001B30C8 00000000 */  nop
/* B31CC 001B30CC 20008046 */  cvt.s.w    $f0, $f0
/* B31D0 001B30D0 42A00046 */  mul.s      $f1, $f20, $f0
/* B31D4 001B30D4 004F023C */  lui        $2, (0x4F000000 >> 16)
/* B31D8 001B30D8 00008244 */  mtc1       $2, $f0
/* B31DC 001B30DC 00000000 */  nop
/* B31E0 001B30E0 43080046 */  div.s      $f1, $f1, $f0
/* B31E4 001B30E4 000060C6 */  lwc1       $f0, 0x0($19)
/* B31E8 001B30E8 40000146 */  add.s      $f1, $f0, $f1
/* B31EC 001B30EC 0040023C */  lui        $2, (0x40000000 >> 16)
/* B31F0 001B30F0 00008244 */  mtc1       $2, $f0
/* B31F4 001B30F4 00000000 */  nop
/* B31F8 001B30F8 03A00046 */  div.s      $f0, $f20, $f0
/* B31FC 001B30FC 01080046 */  sub.s      $f0, $f1, $f0
/* B3200 001B3100 21103402 */  addu       $2, $17, $20
/* B3204 001B3104 B80240E4 */  swc1       $f0, 0x2B8($2)
/* B3208 001B3108 BE11040C */  jal        rand
/* B320C 001B310C 00000000 */   nop
/* B3210 001B3110 00008244 */  mtc1       $2, $f0
/* B3214 001B3114 00000000 */  nop
/* B3218 001B3118 60008046 */  cvt.s.w    $f1, $f0
/* B321C 001B311C 088380C7 */  lwc1       $f0, -0x7CF8($gp)
/* B3220 001B3120 42000146 */  mul.s      $f1, $f0, $f1
/* B3224 001B3124 004F033C */  lui        $3, (0x4F000000 >> 16)
/* B3228 001B3128 00008344 */  mtc1       $3, $f0
/* B322C 001B312C 00000000 */  nop
/* B3230 001B3130 43080046 */  div.s      $f1, $f1, $f0
/* B3234 001B3134 808080C7 */  lwc1       $f0, -0x7F80($gp)
/* B3238 001B3138 00000146 */  add.s      $f0, $f0, $f1
/* B323C 001B313C 80181000 */  sll        $3, $16, 2
/* B3240 001B3140 21207400 */  addu       $4, $3, $20
/* B3244 001B3144 B00480E4 */  swc1       $f0, 0x4B0($4)
/* B3248 001B3148 01000324 */  addiu      $3, $0, 0x1
/* B324C 001B314C D40583AC */  sw         $3, 0x5D4($4)
/* B3250 001B3150 01001026 */  addiu      $16, $16, 0x1
.L001B3154:
/* B3254 001B3154 2A181202 */  slt        $3, $16, $18
/* B3258 001B3158 7FFF6014 */  bnez       $3, .L001B2F58
/* B325C 001B315C 00000000 */   nop
/* B3260 001B3160 20000324 */  addiu      $3, $0, 0x20
/* B3264 001B3164 540683AE */  sw         $3, 0x654($20)
/* B3268 001B3168 7000BF7B */  lq         $31, 0x70($sp)
/* B326C 001B316C 6000B47B */  lq         $20, 0x60($sp)
/* B3270 001B3170 5000B37B */  lq         $19, 0x50($sp)
/* B3274 001B3174 4000B27B */  lq         $18, 0x40($sp)
/* B3278 001B3178 3000B17B */  lq         $17, 0x30($sp)
/* B327C 001B317C 2000B07B */  lq         $16, 0x20($sp)
/* B3280 001B3180 1000B8C7 */  lwc1       $f24, 0x10($sp)
/* B3284 001B3184 0C00B7C7 */  lwc1       $f23, 0xC($sp)
/* B3288 001B3188 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* B328C 001B318C 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* B3290 001B3190 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* B3294 001B3194 8000BD27 */  addiu      $sp, $sp, 0x80
/* B3298 001B3198 0800E003 */  jr         $31
/* B329C 001B319C 00000000 */   nop
