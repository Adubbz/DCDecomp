.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawBGModel__11CDungeonMapFP7CCamera
/* C30C0 001C2FC0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* C30C4 001C2FC4 3000BF7F */  sq         $31, 0x30($sp)
/* C30C8 001C2FC8 2000B27F */  sq         $18, 0x20($sp)
/* C30CC 001C2FCC 1000B17F */  sq         $17, 0x10($sp)
/* C30D0 001C2FD0 0000B07F */  sq         $16, 0x0($sp)
/* C30D4 001C2FD4 28968070 */  paddub     $18, $4, $0
/* C30D8 001C2FD8 2826A070 */  paddub     $4, $5, $0
/* C30DC 001C2FDC 4000A527 */  addiu      $5, $sp, 0x40
/* C30E0 001C2FE0 9C91040C */  jal        GetPos__7CCameraFPf
/* C30E4 001C2FE4 00000000 */   nop
/* C30E8 001C2FE8 4400A0AF */  sw         $0, 0x44($sp)
/* C30EC 001C2FEC 28860070 */  paddub     $16, $0, $0
/* C30F0 001C2FF0 0E000010 */  b          .L001C302C
/* C30F4 001C2FF4 00000000 */   nop
.L001C2FF8:
/* C30F8 001C2FF8 80181000 */  sll        $3, $16, 2
/* C30FC 001C2FFC 21187200 */  addu       $3, $3, $18
/* C3100 001C3000 78047124 */  addiu      $17, $3, 0x478
/* C3104 001C3004 7804648C */  lw         $4, 0x478($3)
/* C3108 001C3008 07008010 */  beqz       $4, .L001C3028
/* C310C 001C300C 00000000 */   nop
/* C3110 001C3010 4000A527 */  addiu      $5, $sp, 0x40
/* C3114 001C3014 B89F040C */  jal        SetPosition__6CFrameFPf
/* C3118 001C3018 00000000 */   nop
/* C311C 001C301C 0000248E */  lw         $4, 0x0($17)
/* C3120 001C3020 60BB040C */  jal        MGDraw__FP6CFrame
/* C3124 001C3024 00000000 */   nop
.L001C3028:
/* C3128 001C3028 01001026 */  addiu      $16, $16, 0x1
.L001C302C:
/* C312C 001C302C 0600032A */  slti       $3, $16, 0x6
/* C3130 001C3030 F1FF6014 */  bnez       $3, .L001C2FF8
/* C3134 001C3034 00000000 */   nop
/* C3138 001C3038 3000BF7B */  lq         $31, 0x30($sp)
/* C313C 001C303C 2000B27B */  lq         $18, 0x20($sp)
/* C3140 001C3040 1000B17B */  lq         $17, 0x10($sp)
/* C3144 001C3044 0000B07B */  lq         $16, 0x0($sp)
/* C3148 001C3048 5000BD27 */  addiu      $sp, $sp, 0x50
/* C314C 001C304C 0800E003 */  jr         $31
/* C3150 001C3050 00000000 */   nop
/* C3154 001C3054 00000000 */  nop
/* C3158 001C3058 00000000 */  nop
/* C315C 001C305C 00000000 */  nop
