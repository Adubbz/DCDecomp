.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawDngYesNoDialog__Fiii
/* F40E0 001F3FE0 90FFBD27 */  addiu      $sp, $sp, -0x70
/* F40E4 001F3FE4 4000BF7F */  sq         $31, 0x40($sp)
/* F40E8 001F3FE8 3000B37F */  sq         $19, 0x30($sp)
/* F40EC 001F3FEC 2000B27F */  sq         $18, 0x20($sp)
/* F40F0 001F3FF0 1000B17F */  sq         $17, 0x10($sp)
/* F40F4 001F3FF4 0000B07F */  sq         $16, 0x0($sp)
/* F40F8 001F3FF8 289EC070 */  paddub     $19, $6, $0
/* F40FC 001F3FFC 5000A4AF */  sw         $4, 0x50($sp)
/* F4100 001F4000 5400B127 */  addiu      $17, $sp, 0x54
/* F4104 001F4004 000025AE */  sw         $5, 0x0($17)
/* F4108 001F4008 60000424 */  addiu      $4, $0, 0x60
/* F410C 001F400C 5800A4AF */  sw         $4, 0x58($sp)
/* F4110 001F4010 20000324 */  addiu      $3, $0, 0x20
/* F4114 001F4014 5C00A3AF */  sw         $3, 0x5C($sp)
/* F4118 001F4018 6000A0AF */  sw         $0, 0x60($sp)
/* F411C 001F401C 6400B227 */  addiu      $18, $sp, 0x64
/* F4120 001F4020 000040AE */  sw         $0, 0x0($18)
/* F4124 001F4024 6800A4AF */  sw         $4, 0x68($sp)
/* F4128 001F4028 6C00A3AF */  sw         $3, 0x6C($sp)
/* F412C 001F402C 28860070 */  paddub     $16, $0, $0
/* F4130 001F4030 0E000010 */  b          .L001F406C
/* F4134 001F4034 00000000 */   nop
.L001F4038:
/* F4138 001F4038 2895848F */  lw         $4, -0x6AD8($gp)
/* F413C 001F403C 5000A527 */  addiu      $5, $sp, 0x50
/* F4140 001F4040 6000A627 */  addiu      $6, $sp, 0x60
/* F4144 001F4044 283E6072 */  paddub     $7, $19, $0
/* F4148 001F4048 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* F414C 001F404C 00000000 */   nop
/* F4150 001F4050 0000238E */  lw         $3, 0x0($17)
/* F4154 001F4054 1C006324 */  addiu      $3, $3, 0x1C
/* F4158 001F4058 000023AE */  sw         $3, 0x0($17)
/* F415C 001F405C 0000438E */  lw         $3, 0x0($18)
/* F4160 001F4060 20006324 */  addiu      $3, $3, 0x20
/* F4164 001F4064 000043AE */  sw         $3, 0x0($18)
/* F4168 001F4068 01001026 */  addiu      $16, $16, 0x1
.L001F406C:
/* F416C 001F406C 0200032A */  slti       $3, $16, 0x2
/* F4170 001F4070 F1FF6014 */  bnez       $3, .L001F4038
/* F4174 001F4074 00000000 */   nop
/* F4178 001F4078 4000BF7B */  lq         $31, 0x40($sp)
/* F417C 001F407C 3000B37B */  lq         $19, 0x30($sp)
/* F4180 001F4080 2000B27B */  lq         $18, 0x20($sp)
/* F4184 001F4084 1000B17B */  lq         $17, 0x10($sp)
/* F4188 001F4088 0000B07B */  lq         $16, 0x0($sp)
/* F418C 001F408C 7000BD27 */  addiu      $sp, $sp, 0x70
/* F4190 001F4090 0800E003 */  jr         $31
/* F4194 001F4094 00000000 */   nop
/* F4198 001F4098 00000000 */  nop
/* F419C 001F409C 00000000 */  nop
