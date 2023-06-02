.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawGrid__9CEditAreaFv
/* 6FFF0 0016FEF0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 6FFF4 0016FEF4 1000BF7F */  sq         $31, 0x10($sp)
/* 6FFF8 0016FEF8 0000B07F */  sq         $16, 0x0($sp)
/* 6FFFC 0016FEFC 28868070 */  paddub     $16, $4, $0
/* 70000 0016FF00 5420828C */  lw         $2, 0x2054($4)
/* 70004 0016FF04 FFFF4224 */  addiu      $2, $2, -0x1
/* 70008 0016FF08 542082AC */  sw         $2, 0x2054($4)
/* 7000C 0016FF0C 5020828C */  lw         $2, 0x2050($4)
/* 70010 0016FF10 03004010 */  beqz       $2, .L0016FF20
/* 70014 0016FF14 00000000 */   nop
/* 70018 0016FF18 02000224 */  addiu      $2, $0, 0x2
/* 7001C 0016FF1C 542002AE */  sw         $2, 0x2054($16)
.L0016FF20:
/* 70020 0016FF20 5420028E */  lw         $2, 0x2054($16)
/* 70024 0016FF24 0A004018 */  blez       $2, .L0016FF50
/* 70028 0016FF28 00000000 */   nop
/* 7002C 0016FF2C 28260072 */  paddub     $4, $16, $0
/* 70030 0016FF30 3CBB050C */  jal        RemakeGrid__9CEditAreaFv
/* 70034 0016FF34 00000000 */   nop
/* 70038 0016FF38 2820028E */  lw         $2, 0x2028($16)
/* 7003C 0016FF3C 09004010 */  beqz       $2, .L0016FF64
/* 70040 0016FF40 00000000 */   nop
/* 70044 0016FF44 E00040A0 */  sb         $0, 0xE0($2)
/* 70048 0016FF48 06000010 */  b          .L0016FF64
/* 7004C 0016FF4C 00000000 */   nop
.L0016FF50:
/* 70050 0016FF50 2820038E */  lw         $3, 0x2028($16)
/* 70054 0016FF54 03006010 */  beqz       $3, .L0016FF64
/* 70058 0016FF58 00000000 */   nop
/* 7005C 0016FF5C 01000224 */  addiu      $2, $0, 0x1
/* 70060 0016FF60 E00062A0 */  sb         $2, 0xE0($3)
.L0016FF64:
/* 70064 0016FF64 502000AE */  sw         $0, 0x2050($16)
/* 70068 0016FF68 5420028E */  lw         $2, 0x2054($16)
/* 7006C 0016FF6C 02004104 */  bgez       $2, .L0016FF78
/* 70070 0016FF70 00000000 */   nop
/* 70074 0016FF74 542000AE */  sw         $0, 0x2054($16)
.L0016FF78:
/* 70078 0016FF78 100000C6 */  lwc1       $f0, 0x10($16)
/* 7007C 0016FF7C 2000A0E7 */  swc1       $f0, 0x20($sp)
/* 70080 0016FF80 140000C6 */  lwc1       $f0, 0x14($16)
/* 70084 0016FF84 2400A0E7 */  swc1       $f0, 0x24($sp)
/* 70088 0016FF88 180000C6 */  lwc1       $f0, 0x18($16)
/* 7008C 0016FF8C 2800A0E7 */  swc1       $f0, 0x28($sp)
/* 70090 0016FF90 2820048E */  lw         $4, 0x2028($16)
/* 70094 0016FF94 2000A527 */  addiu      $5, $sp, 0x20
/* 70098 0016FF98 B89F040C */  jal        SetPosition__6CFrameFPf
/* 7009C 0016FF9C 00000000 */   nop
/* 700A0 0016FFA0 2820048E */  lw         $4, 0x2028($16)
/* 700A4 0016FFA4 60BB040C */  jal        MGDraw__FP6CFrame
/* 700A8 0016FFA8 00000000 */   nop
/* 700AC 0016FFAC 1000BF7B */  lq         $31, 0x10($sp)
/* 700B0 0016FFB0 0000B07B */  lq         $16, 0x0($sp)
/* 700B4 0016FFB4 3000BD27 */  addiu      $sp, $sp, 0x30
/* 700B8 0016FFB8 0800E003 */  jr         $31
/* 700BC 0016FFBC 00000000 */   nop