.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _STATUS_GET_USER_VECTOR__FP12RS_STACKDATAi
/* 0E30E0 001E2FE0 C0FFBD27 */  addiu       $29, $29, -0x40
/* 0E30E4 001E2FE4 2000BF7F */  sq          $31, 0x20($29)
/* 0E30E8 001E2FE8 1000B17F */  sq          $17, 0x10($29)
/* 0E30EC 001E2FEC 0000B07F */  sq          $16, 0x0($29)
/* 0E30F0 001E2FF0 288E8070 */  paddub      $17, $4, $0
/* 0E30F4 001E2FF4 28860070 */  paddub      $16, $0, $0
/* 0E30F8 001E2FF8 04000224 */  addiu       $2, $0, 0x4
/* 0E30FC 001E2FFC 0500A214 */  bne         $5, $2, .L001E3014
/* 0E3100 001E3000 00000000 */   nop
/* 0E3104 001E3004 08009124 */  addiu       $17, $4, 0x8
/* 0E3108 001E3008 9085070C */  jal         GetStackInt__FP12RS_STACKDATA__3
/* 0E310C 001E300C 00000000 */   nop
/* 0E3110 001E3010 28864070 */  paddub      $16, $2, $0
.L001E3014:
/* 0E3114 001E3014 00608044 */  mtc1        $0, $f12
/* 0E3118 001E3018 28262072 */  paddub      $4, $17, $0
/* 0E311C 001E301C 08009124 */  addiu       $17, $4, 0x8
/* 0E3120 001E3020 A485070C */  jal         GetStackFloat__FP12RS_STACKDATA__3
/* 0E3124 001E3024 00000000 */   nop
/* 0E3128 001E3028 788181C7 */  lwc1        $f1, -0x7E88($28)
/* 0E312C 001E302C 02080046 */  mul.s       $f0, $f1, $f0
/* 0E3130 001E3030 00630046 */  add.s       $f12, $f12, $f0
/* 0E3134 001E3034 B08080C7 */  lwc1        $f0, -0x7F50($28)
/* 0E3138 001E3038 36600046 */  c.le.s      $f12, $f0
/* 0E313C 001E303C 00000000 */  nop
/* 0E3140 001E3040 03000145 */  bc1t        .L001E3050
/* 0E3144 001E3044 00000000 */   nop
/* 0E3148 001E3048 808180C7 */  lwc1        $f0, -0x7E80($28)
/* 0E314C 001E304C 01630046 */  sub.s       $f12, $f12, $f0
.L001E3050:
/* 0E3150 001E3050 848180C7 */  lwc1        $f0, -0x7E7C($28)
/* 0E3154 001E3054 34600046 */  c.lt.s      $f12, $f0
/* 0E3158 001E3058 00000000 */  nop
/* 0E315C 001E305C 03000045 */  bc1f        .L001E306C
/* 0E3160 001E3060 00000000 */   nop
/* 0E3164 001E3064 888180C7 */  lwc1        $f0, -0x7E78($28)
/* 0E3168 001E3068 00630046 */  add.s       $f12, $f12, $f0
.L001E306C:
/* 0E316C 001E306C 3000A427 */  addiu       $4, $29, 0x30
/* 0E3170 001E3070 6850070C */  jal         getCharacterVector__FPff
/* 0E3174 001E3074 00000000 */   nop
/* 0E3178 001E3078 05000012 */  beqz        $16, .L001E3090
/* 0E317C 001E307C 00000000 */   nop
/* 0E3180 001E3080 3000A427 */  addiu       $4, $29, 0x30
/* 0E3184 001E3084 282E8070 */  paddub      $5, $4, $0
/* 0E3188 001E3088 9285040C */  jal         sceVu0Normalize
/* 0E318C 001E308C 00000000 */   nop
.L001E3090:
/* 0E3190 001E3090 28262072 */  paddub      $4, $17, $0
/* 0E3194 001E3094 08009124 */  addiu       $17, $4, 0x8
/* 0E3198 001E3098 3000ACC7 */  lwc1        $f12, 0x30($29)
/* 0E319C 001E309C BC85070C */  jal         SetStack__FP12RS_STACKDATAf__3
/* 0E31A0 001E30A0 00000000 */   nop
/* 0E31A4 001E30A4 28262072 */  paddub      $4, $17, $0
/* 0E31A8 001E30A8 08009124 */  addiu       $17, $4, 0x8
/* 0E31AC 001E30AC 3400ACC7 */  lwc1        $f12, 0x34($29)
/* 0E31B0 001E30B0 BC85070C */  jal         SetStack__FP12RS_STACKDATAf__3
/* 0E31B4 001E30B4 00000000 */   nop
/* 0E31B8 001E30B8 28262072 */  paddub      $4, $17, $0
/* 0E31BC 001E30BC 3800ACC7 */  lwc1        $f12, 0x38($29)
/* 0E31C0 001E30C0 BC85070C */  jal         SetStack__FP12RS_STACKDATAf__3
/* 0E31C4 001E30C4 00000000 */   nop
/* 0E31C8 001E30C8 01000224 */  addiu       $2, $0, 0x1
/* 0E31CC 001E30CC 2000BF7B */  lq          $31, 0x20($29)
/* 0E31D0 001E30D0 1000B17B */  lq          $17, 0x10($29)
/* 0E31D4 001E30D4 0000B07B */  lq          $16, 0x0($29)
/* 0E31D8 001E30D8 4000BD27 */  addiu       $29, $29, 0x40
/* 0E31DC 001E30DC 0800E003 */  jr          $31
/* 0E31E0 001E30E0 00000000 */   nop
/* 0E31E4 001E30E4 00000000 */  nop
/* 0E31E8 001E30E8 00000000 */  nop
/* 0E31EC 001E30EC 00000000 */  nop
