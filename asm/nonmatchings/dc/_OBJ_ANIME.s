.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _OBJ_ANIME__FP12RS_STACKDATAi
/* 94D70 00194C70 60FFBD27 */  addiu      $sp, $sp, -0xA0
/* 94D74 00194C74 6000BF7F */  sq         $31, 0x60($sp)
/* 94D78 00194C78 5000B57F */  sq         $21, 0x50($sp)
/* 94D7C 00194C7C 4000B47F */  sq         $20, 0x40($sp)
/* 94D80 00194C80 3000B37F */  sq         $19, 0x30($sp)
/* 94D84 00194C84 2000B27F */  sq         $18, 0x20($sp)
/* 94D88 00194C88 1000B17F */  sq         $17, 0x10($sp)
/* 94D8C 00194C8C 0000B07F */  sq         $16, 0x0($sp)
/* 94D90 00194C90 28A6A070 */  paddub     $20, $5, $0
/* 94D94 00194C94 08009524 */  addiu      $21, $4, 0x8
/* 94D98 00194C98 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 94D9C 00194C9C 00000000 */   nop
/* 94DA0 00194CA0 28864070 */  paddub     $16, $2, $0
/* 94DA4 00194CA4 2826A072 */  paddub     $4, $21, $0
/* 94DA8 00194CA8 08009524 */  addiu      $21, $4, 0x8
/* 94DAC 00194CAC D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 94DB0 00194CB0 00000000 */   nop
/* 94DB4 00194CB4 288E4070 */  paddub     $17, $2, $0
/* 94DB8 00194CB8 2826A072 */  paddub     $4, $21, $0
/* 94DBC 00194CBC 08009524 */  addiu      $21, $4, 0x8
/* 94DC0 00194CC0 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 94DC4 00194CC4 00000000 */   nop
/* 94DC8 00194CC8 28964070 */  paddub     $18, $2, $0
/* 94DCC 00194CCC 2826A072 */  paddub     $4, $21, $0
/* 94DD0 00194CD0 08009524 */  addiu      $21, $4, 0x8
/* 94DD4 00194CD4 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 94DD8 00194CD8 00000000 */   nop
/* 94DDC 00194CDC 289E4070 */  paddub     $19, $2, $0
/* 94DE0 00194CE0 2700023C */  lui        $2, %hi(_2032)
/* 94DE4 00194CE4 309C4224 */  addiu      $2, $2, %lo(_2032)
/* 94DE8 00194CE8 7000A527 */  addiu      $5, $sp, 0x70
/* 94DEC 00194CEC 00004278 */  lq         $2, 0x0($2)
/* 94DF0 00194CF0 0000A27C */  sq         $2, 0x0($5)
/* 94DF4 00194CF4 8000A427 */  addiu      $4, $sp, 0x80
/* 94DF8 00194CF8 0C86040C */  jal        sceVu0CopyVector
/* 94DFC 00194CFC 00000000 */   nop
/* 94E00 00194D00 9000A427 */  addiu      $4, $sp, 0x90
/* 94E04 00194D04 7000A527 */  addiu      $5, $sp, 0x70
/* 94E08 00194D08 0C86040C */  jal        sceVu0CopyVector
/* 94E0C 00194D0C 00000000 */   nop
/* 94E10 00194D10 2826A072 */  paddub     $4, $21, $0
/* 94E14 00194D14 08009524 */  addiu      $21, $4, 0x8
/* 94E18 00194D18 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 94E1C 00194D1C 00000000 */   nop
/* 94E20 00194D20 7000A0E7 */  swc1       $f0, 0x70($sp)
/* 94E24 00194D24 2826A072 */  paddub     $4, $21, $0
/* 94E28 00194D28 08009524 */  addiu      $21, $4, 0x8
/* 94E2C 00194D2C E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 94E30 00194D30 00000000 */   nop
/* 94E34 00194D34 7400A327 */  addiu      $3, $sp, 0x74
/* 94E38 00194D38 000060E4 */  swc1       $f0, 0x0($3)
/* 94E3C 00194D3C 2826A072 */  paddub     $4, $21, $0
/* 94E40 00194D40 08009524 */  addiu      $21, $4, 0x8
/* 94E44 00194D44 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 94E48 00194D48 00000000 */   nop
/* 94E4C 00194D4C 7800A427 */  addiu      $4, $sp, 0x78
/* 94E50 00194D50 000080E4 */  swc1       $f0, 0x0($4)
/* 94E54 00194D54 10004016 */  bnez       $18, .L00194D98
/* 94E58 00194D58 00000000 */   nop
/* 94E5C 00194D5C 3443023C */  lui        $2, (0x43340000 >> 16)
/* 94E60 00194D60 00108244 */  mtc1       $2, $f2
/* 94E64 00194D64 7000A0C7 */  lwc1       $f0, 0x70($sp)
/* 94E68 00194D68 02100046 */  mul.s      $f0, $f2, $f0
/* 94E6C 00194D6C 288181C7 */  lwc1       $f1, -0x7ED8($gp)
/* 94E70 00194D70 03000146 */  div.s      $f0, $f0, $f1
/* 94E74 00194D74 7000A0E7 */  swc1       $f0, 0x70($sp)
/* 94E78 00194D78 000060C4 */  lwc1       $f0, 0x0($3)
/* 94E7C 00194D7C 02100046 */  mul.s      $f0, $f2, $f0
/* 94E80 00194D80 03000146 */  div.s      $f0, $f0, $f1
/* 94E84 00194D84 000060E4 */  swc1       $f0, 0x0($3)
/* 94E88 00194D88 000080C4 */  lwc1       $f0, 0x0($4)
/* 94E8C 00194D8C 02100046 */  mul.s      $f0, $f2, $f0
/* 94E90 00194D90 03000146 */  div.s      $f0, $f0, $f1
/* 94E94 00194D94 000080E4 */  swc1       $f0, 0x0($4)
.L00194D98:
/* 94E98 00194D98 0A00822A */  slti       $2, $20, 0xA
/* 94E9C 00194D9C 23004014 */  bnez       $2, .L00194E2C
/* 94EA0 00194DA0 00000000 */   nop
/* 94EA4 00194DA4 2826A072 */  paddub     $4, $21, $0
/* 94EA8 00194DA8 08009524 */  addiu      $21, $4, 0x8
/* 94EAC 00194DAC E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 94EB0 00194DB0 00000000 */   nop
/* 94EB4 00194DB4 8000A0E7 */  swc1       $f0, 0x80($sp)
/* 94EB8 00194DB8 2826A072 */  paddub     $4, $21, $0
/* 94EBC 00194DBC 08009524 */  addiu      $21, $4, 0x8
/* 94EC0 00194DC0 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 94EC4 00194DC4 00000000 */   nop
/* 94EC8 00194DC8 8400A327 */  addiu      $3, $sp, 0x84
/* 94ECC 00194DCC 000060E4 */  swc1       $f0, 0x0($3)
/* 94ED0 00194DD0 2826A072 */  paddub     $4, $21, $0
/* 94ED4 00194DD4 08009524 */  addiu      $21, $4, 0x8
/* 94ED8 00194DD8 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 94EDC 00194DDC 00000000 */   nop
/* 94EE0 00194DE0 8800A427 */  addiu      $4, $sp, 0x88
/* 94EE4 00194DE4 000080E4 */  swc1       $f0, 0x0($4)
/* 94EE8 00194DE8 10004016 */  bnez       $18, .L00194E2C
/* 94EEC 00194DEC 00000000 */   nop
/* 94EF0 00194DF0 3443023C */  lui        $2, (0x43340000 >> 16)
/* 94EF4 00194DF4 00108244 */  mtc1       $2, $f2
/* 94EF8 00194DF8 8000A0C7 */  lwc1       $f0, 0x80($sp)
/* 94EFC 00194DFC 02100046 */  mul.s      $f0, $f2, $f0
/* 94F00 00194E00 288181C7 */  lwc1       $f1, -0x7ED8($gp)
/* 94F04 00194E04 03000146 */  div.s      $f0, $f0, $f1
/* 94F08 00194E08 8000A0E7 */  swc1       $f0, 0x80($sp)
/* 94F0C 00194E0C 000060C4 */  lwc1       $f0, 0x0($3)
/* 94F10 00194E10 02100046 */  mul.s      $f0, $f2, $f0
/* 94F14 00194E14 03000146 */  div.s      $f0, $f0, $f1
/* 94F18 00194E18 000060E4 */  swc1       $f0, 0x0($3)
/* 94F1C 00194E1C 000080C4 */  lwc1       $f0, 0x0($4)
/* 94F20 00194E20 02100046 */  mul.s      $f0, $f2, $f0
/* 94F24 00194E24 03000146 */  div.s      $f0, $f0, $f1
/* 94F28 00194E28 000080E4 */  swc1       $f0, 0x0($4)
.L00194E2C:
/* 94F2C 00194E2C 0D00822A */  slti       $2, $20, 0xD
/* 94F30 00194E30 22004014 */  bnez       $2, .L00194EBC
/* 94F34 00194E34 00000000 */   nop
/* 94F38 00194E38 2826A072 */  paddub     $4, $21, $0
/* 94F3C 00194E3C 08009524 */  addiu      $21, $4, 0x8
/* 94F40 00194E40 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 94F44 00194E44 00000000 */   nop
/* 94F48 00194E48 9000A0E7 */  swc1       $f0, 0x90($sp)
/* 94F4C 00194E4C 2826A072 */  paddub     $4, $21, $0
/* 94F50 00194E50 08009524 */  addiu      $21, $4, 0x8
/* 94F54 00194E54 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 94F58 00194E58 00000000 */   nop
/* 94F5C 00194E5C 9400A327 */  addiu      $3, $sp, 0x94
/* 94F60 00194E60 000060E4 */  swc1       $f0, 0x0($3)
/* 94F64 00194E64 2826A072 */  paddub     $4, $21, $0
/* 94F68 00194E68 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 94F6C 00194E6C 00000000 */   nop
/* 94F70 00194E70 9800A427 */  addiu      $4, $sp, 0x98
/* 94F74 00194E74 000080E4 */  swc1       $f0, 0x0($4)
/* 94F78 00194E78 10004016 */  bnez       $18, .L00194EBC
/* 94F7C 00194E7C 00000000 */   nop
/* 94F80 00194E80 3443023C */  lui        $2, (0x43340000 >> 16)
/* 94F84 00194E84 00108244 */  mtc1       $2, $f2
/* 94F88 00194E88 9000A0C7 */  lwc1       $f0, 0x90($sp)
/* 94F8C 00194E8C 02100046 */  mul.s      $f0, $f2, $f0
/* 94F90 00194E90 288181C7 */  lwc1       $f1, -0x7ED8($gp)
/* 94F94 00194E94 03000146 */  div.s      $f0, $f0, $f1
/* 94F98 00194E98 9000A0E7 */  swc1       $f0, 0x90($sp)
/* 94F9C 00194E9C 000060C4 */  lwc1       $f0, 0x0($3)
/* 94FA0 00194EA0 02100046 */  mul.s      $f0, $f2, $f0
/* 94FA4 00194EA4 03000146 */  div.s      $f0, $f0, $f1
/* 94FA8 00194EA8 000060E4 */  swc1       $f0, 0x0($3)
/* 94FAC 00194EAC 000080C4 */  lwc1       $f0, 0x0($4)
/* 94FB0 00194EB0 02100046 */  mul.s      $f0, $f2, $f0
/* 94FB4 00194EB4 03000146 */  div.s      $f0, $f0, $f1
/* 94FB8 00194EB8 000080E4 */  swc1       $f0, 0x0($4)
.L00194EBC:
/* 94FBC 00194EBC 28260072 */  paddub     $4, $16, $0
/* 94FC0 00194EC0 282E2072 */  paddub     $5, $17, $0
/* 94FC4 00194EC4 28364072 */  paddub     $6, $18, $0
/* 94FC8 00194EC8 283E6072 */  paddub     $7, $19, $0
/* 94FCC 00194ECC 7000A827 */  addiu      $8, $sp, 0x70
/* 94FD0 00194ED0 8000A927 */  addiu      $9, $sp, 0x80
/* 94FD4 00194ED4 9000AA27 */  addiu      $10, $sp, 0x90
/* 94FD8 00194ED8 742B060C */  jal        init_obj_anime__FiiiiPfPfPf
/* 94FDC 00194EDC 00000000 */   nop
/* 94FE0 00194EE0 01000224 */  addiu      $2, $0, 0x1
/* 94FE4 00194EE4 6000BF7B */  lq         $31, 0x60($sp)
/* 94FE8 00194EE8 5000B57B */  lq         $21, 0x50($sp)
/* 94FEC 00194EEC 4000B47B */  lq         $20, 0x40($sp)
/* 94FF0 00194EF0 3000B37B */  lq         $19, 0x30($sp)
/* 94FF4 00194EF4 2000B27B */  lq         $18, 0x20($sp)
/* 94FF8 00194EF8 1000B17B */  lq         $17, 0x10($sp)
/* 94FFC 00194EFC 0000B07B */  lq         $16, 0x0($sp)
/* 95000 00194F00 A000BD27 */  addiu      $sp, $sp, 0xA0
/* 95004 00194F04 0800E003 */  jr         $31
/* 95008 00194F08 00000000 */   nop
/* 9500C 00194F0C 00000000 */  nop
