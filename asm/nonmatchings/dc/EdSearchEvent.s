.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdSearchEvent__FP14ED_EVENT_PARAMPcif
/* 84DB0 00184CB0 40FFBD27 */  addiu      $sp, $sp, -0xC0
/* 84DB4 00184CB4 7000BF7F */  sq         $31, 0x70($sp)
/* 84DB8 00184CB8 6000B57F */  sq         $21, 0x60($sp)
/* 84DBC 00184CBC 5000B47F */  sq         $20, 0x50($sp)
/* 84DC0 00184CC0 4000B37F */  sq         $19, 0x40($sp)
/* 84DC4 00184CC4 3000B27F */  sq         $18, 0x30($sp)
/* 84DC8 00184CC8 2000B17F */  sq         $17, 0x20($sp)
/* 84DCC 00184CCC 1000B07F */  sq         $16, 0x10($sp)
/* 84DD0 00184CD0 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 84DD4 00184CD4 28AE8070 */  paddub     $21, $4, $0
/* 84DD8 00184CD8 28A6A070 */  paddub     $20, $5, $0
/* 84DDC 00184CDC 289EC070 */  paddub     $19, $6, $0
/* 84DE0 00184CE0 06650046 */  mov.s      $f20, $f12
/* 84DE4 00184CE4 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 84DE8 00184CE8 BC9B318C */  lw         $17, -0x6444($at)
/* 84DEC 00184CEC 6090828F */  lw         $2, -0x6FA0($gp)
/* 84DF0 00184CF0 0200013C */  lui        $at, (0x23260 >> 16)
/* 84DF4 00184CF4 60322134 */  ori        $at, $at, (0x23260 & 0xFFFF)
/* 84DF8 00184CF8 21904100 */  addu       $18, $2, $at
/* 84DFC 00184CFC 28860070 */  paddub     $16, $0, $0
/* 84E00 00184D00 5C000010 */  b          .L00184E74
/* 84E04 00184D04 00000000 */   nop
.L00184D08:
/* 84E08 00184D08 28264072 */  paddub     $4, $18, $0
/* 84E0C 00184D0C 06A30046 */  mov.s      $f12, $f20
/* 84E10 00184D10 980E060C */  jal        CheckEventPoint__FP14ED_EVENT_POINTf
/* 84E14 00184D14 00000000 */   nop
/* 84E18 00184D18 54004010 */  beqz       $2, .L00184E6C
/* 84E1C 00184D1C 00000000 */   nop
/* 84E20 00184D20 30004426 */  addiu      $4, $18, 0x30
/* 84E24 00184D24 282E8072 */  paddub     $5, $20, $0
/* 84E28 00184D28 0815040C */  jal        strcmp
/* 84E2C 00184D2C 00000000 */   nop
/* 84E30 00184D30 4E004014 */  bnez       $2, .L00184E6C
/* 84E34 00184D34 00000000 */   nop
/* 84E38 00184D38 0400428E */  lw         $2, 0x4($18)
/* 84E3C 00184D3C 4B005314 */  bne        $2, $19, .L00184E6C
/* 84E40 00184D40 00000000 */   nop
/* 84E44 00184D44 8000A427 */  addiu      $4, $sp, 0x80
/* 84E48 00184D48 50004526 */  addiu      $5, $18, 0x50
/* 84E4C 00184D4C 0C86040C */  jal        sceVu0CopyVector
/* 84E50 00184D50 00000000 */   nop
/* 84E54 00184D54 A000A427 */  addiu      $4, $sp, 0xA0
/* 84E58 00184D58 80004526 */  addiu      $5, $18, 0x80
/* 84E5C 00184D5C 0C86040C */  jal        sceVu0CopyVector
/* 84E60 00184D60 00000000 */   nop
/* 84E64 00184D64 9000A427 */  addiu      $4, $sp, 0x90
/* 84E68 00184D68 70004526 */  addiu      $5, $18, 0x70
/* 84E6C 00184D6C 0C86040C */  jal        sceVu0CopyVector
/* 84E70 00184D70 00000000 */   nop
/* 84E74 00184D74 B000A427 */  addiu      $4, $sp, 0xB0
/* 84E78 00184D78 70004526 */  addiu      $5, $18, 0x70
/* 84E7C 00184D7C 0C86040C */  jal        sceVu0CopyVector
/* 84E80 00184D80 00000000 */   nop
/* 84E84 00184D84 1400508E */  lw         $16, 0x14($18)
/* 84E88 00184D88 0C00458E */  lw         $5, 0xC($18)
/* 84E8C 00184D8C 1500A004 */  bltz       $5, .L00184DE4
/* 84E90 00184D90 00000000 */   nop
/* 84E94 00184D94 28262072 */  paddub     $4, $17, $0
/* 84E98 00184D98 2086060C */  jal        GetPartsObject__11CEditGroundFi
/* 84E9C 00184D9C 00000000 */   nop
/* 84EA0 00184DA0 28864070 */  paddub     $16, $2, $0
/* 84EA4 00184DA4 06000012 */  beqz       $16, .L00184DC0
/* 84EA8 00184DA8 00000000 */   nop
/* 84EAC 00184DAC 28260072 */  paddub     $4, $16, $0
/* 84EB0 00184DB0 8000A527 */  addiu      $5, $sp, 0x80
/* 84EB4 00184DB4 9000A627 */  addiu      $6, $sp, 0x90
/* 84EB8 00184DB8 3C0E060C */  jal        GetPosRot__FP10CMapObjectPfPf
/* 84EBC 00184DBC 00000000 */   nop
.L00184DC0:
/* 84EC0 00184DC0 16000012 */  beqz       $16, .L00184E1C
/* 84EC4 00184DC4 00000000 */   nop
/* 84EC8 00184DC8 28260072 */  paddub     $4, $16, $0
/* 84ECC 00184DCC A000A527 */  addiu      $5, $sp, 0xA0
/* 84ED0 00184DD0 B000A627 */  addiu      $6, $sp, 0xB0
/* 84ED4 00184DD4 3C0E060C */  jal        GetPosRot__FP10CMapObjectPfPf
/* 84ED8 00184DD8 00000000 */   nop
/* 84EDC 00184DDC 0F000010 */  b          .L00184E1C
/* 84EE0 00184DE0 00000000 */   nop
.L00184DE4:
/* 84EE4 00184DE4 06000012 */  beqz       $16, .L00184E00
/* 84EE8 00184DE8 00000000 */   nop
/* 84EEC 00184DEC 28260072 */  paddub     $4, $16, $0
/* 84EF0 00184DF0 8000A527 */  addiu      $5, $sp, 0x80
/* 84EF4 00184DF4 9000A627 */  addiu      $6, $sp, 0x90
/* 84EF8 00184DF8 3C0E060C */  jal        GetPosRot__FP10CMapObjectPfPf
/* 84EFC 00184DFC 00000000 */   nop
.L00184E00:
/* 84F00 00184E00 06000012 */  beqz       $16, .L00184E1C
/* 84F04 00184E04 00000000 */   nop
/* 84F08 00184E08 28260072 */  paddub     $4, $16, $0
/* 84F0C 00184E0C A000A527 */  addiu      $5, $sp, 0xA0
/* 84F10 00184E10 B000A627 */  addiu      $6, $sp, 0xB0
/* 84F14 00184E14 3C0E060C */  jal        GetPosRot__FP10CMapObjectPfPf
/* 84F18 00184E18 00000000 */   nop
.L00184E1C:
/* 84F1C 00184E1C 1000428E */  lw         $2, 0x10($18)
/* 84F20 00184E20 0000A2AE */  sw         $2, 0x0($21)
/* 84F24 00184E24 0C00428E */  lw         $2, 0xC($18)
/* 84F28 00184E28 0400A2AE */  sw         $2, 0x4($21)
/* 84F2C 00184E2C 1000A426 */  addiu      $4, $21, 0x10
/* 84F30 00184E30 8000A527 */  addiu      $5, $sp, 0x80
/* 84F34 00184E34 0C86040C */  jal        sceVu0CopyVector
/* 84F38 00184E38 00000000 */   nop
/* 84F3C 00184E3C 2000A426 */  addiu      $4, $21, 0x20
/* 84F40 00184E40 A000A527 */  addiu      $5, $sp, 0xA0
/* 84F44 00184E44 0C86040C */  jal        sceVu0CopyVector
/* 84F48 00184E48 00000000 */   nop
/* 84F4C 00184E4C 3000A426 */  addiu      $4, $21, 0x30
/* 84F50 00184E50 9000A527 */  addiu      $5, $sp, 0x90
/* 84F54 00184E54 0C86040C */  jal        sceVu0CopyVector
/* 84F58 00184E58 00000000 */   nop
/* 84F5C 00184E5C 5000B2AE */  sw         $18, 0x50($21)
/* 84F60 00184E60 01000224 */  addiu      $2, $0, 0x1
/* 84F64 00184E64 07000010 */  b          .L00184E84
/* 84F68 00184E68 00000000 */   nop
.L00184E6C:
/* 84F6C 00184E6C 01001026 */  addiu      $16, $16, 0x1
/* 84F70 00184E70 90005226 */  addiu      $18, $18, 0x90
.L00184E74:
/* 84F74 00184E74 0001022A */  slti       $2, $16, 0x100
/* 84F78 00184E78 A3FF4014 */  bnez       $2, .L00184D08
/* 84F7C 00184E7C 00000000 */   nop
/* 84F80 00184E80 28160070 */  paddub     $2, $0, $0
.L00184E84:
/* 84F84 00184E84 7000BF7B */  lq         $31, 0x70($sp)
/* 84F88 00184E88 6000B57B */  lq         $21, 0x60($sp)
/* 84F8C 00184E8C 5000B47B */  lq         $20, 0x50($sp)
/* 84F90 00184E90 4000B37B */  lq         $19, 0x40($sp)
/* 84F94 00184E94 3000B27B */  lq         $18, 0x30($sp)
/* 84F98 00184E98 2000B17B */  lq         $17, 0x20($sp)
/* 84F9C 00184E9C 1000B07B */  lq         $16, 0x10($sp)
/* 84FA0 00184EA0 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 84FA4 00184EA4 C000BD27 */  addiu      $sp, $sp, 0xC0
/* 84FA8 00184EA8 0800E003 */  jr         $31
/* 84FAC 00184EAC 00000000 */   nop
