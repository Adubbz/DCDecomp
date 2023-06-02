.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_DMG_COL__FP12RS_STACKDATAi
/* E3EB0 001E3DB0 90FFBD27 */  addiu      $sp, $sp, -0x70
/* E3EB4 001E3DB4 6000BF7F */  sq         $31, 0x60($sp)
/* E3EB8 001E3DB8 5000B47F */  sq         $20, 0x50($sp)
/* E3EBC 001E3DBC 4000B37F */  sq         $19, 0x40($sp)
/* E3EC0 001E3DC0 3000B27F */  sq         $18, 0x30($sp)
/* E3EC4 001E3DC4 2000B17F */  sq         $17, 0x20($sp)
/* E3EC8 001E3DC8 1000B07F */  sq         $16, 0x10($sp)
/* E3ECC 001E3DCC 0800B6E7 */  swc1       $f22, 0x8($sp)
/* E3ED0 001E3DD0 0400B5E7 */  swc1       $f21, 0x4($sp)
/* E3ED4 001E3DD4 0000B4E7 */  swc1       $f20, 0x0($sp)
/* E3ED8 001E3DD8 08008324 */  addiu      $3, $4, 0x8
/* E3EDC 001E3DDC B085070C */  jal        GetStackString__FP12RS_STACKDATA_3
/* E3EE0 001E3DE0 00000000 */   nop
/* E3EE4 001E3DE4 28864070 */  paddub     $16, $2, $0
/* E3EE8 001E3DE8 28266070 */  paddub     $4, $3, $0
/* E3EEC 001E3DEC 08008324 */  addiu      $3, $4, 0x8
/* E3EF0 001E3DF0 A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E3EF4 001E3DF4 00000000 */   nop
/* E3EF8 001E3DF8 06050046 */  mov.s      $f20, $f0
/* E3EFC 001E3DFC 28266070 */  paddub     $4, $3, $0
/* E3F00 001E3E00 08008324 */  addiu      $3, $4, 0x8
/* E3F04 001E3E04 A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E3F08 001E3E08 00000000 */   nop
/* E3F0C 001E3E0C 46050046 */  mov.s      $f21, $f0
/* E3F10 001E3E10 28266070 */  paddub     $4, $3, $0
/* E3F14 001E3E14 A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E3F18 001E3E18 00000000 */   nop
/* E3F1C 001E3E1C 86050046 */  mov.s      $f22, $f0
/* E3F20 001E3E20 E09C838F */  lw         $3, -0x6320($gp)
/* E3F24 001E3E24 9000728C */  lw         $18, 0x90($3)
/* E3F28 001E3E28 288E0070 */  paddub     $17, $0, $0
/* E3F2C 001E3E2C 55000010 */  b          .L001E3F84
/* E3F30 001E3E30 00000000 */   nop
.L001E3E34:
/* E3F34 001E3E34 50030224 */  addiu      $2, $0, 0x350
/* E3F38 001E3E38 18A04202 */  mult       $20, $18, $2
/* E3F3C 001E3E3C 21108302 */  addu       $2, $20, $3
/* E3F40 001E3E40 80981100 */  sll        $19, $17, 2
/* E3F44 001E3E44 21106202 */  addu       $2, $19, $2
/* E3F48 001E3E48 0600013C */  lui        $at, (0x60000 >> 16)
/* E3F4C 001E3E4C 21084100 */  addu       $at, $2, $at
/* E3F50 001E3E50 50A6228C */  lw         $2, -0x59B0($at)
/* E3F54 001E3E54 4A004014 */  bnez       $2, .L001E3F80
/* E3F58 001E3E58 00000000 */   nop
/* E3F5C 001E3E5C 10350224 */  addiu      $2, $0, 0x3510
/* E3F60 001E3E60 18104202 */  mult       $2, $18, $2
/* E3F64 001E3E64 21104300 */  addu       $2, $2, $3
/* E3F68 001E3E68 0200013C */  lui        $at, (0x20000 >> 16)
/* E3F6C 001E3E6C 21084100 */  addu       $at, $2, $at
/* E3F70 001E3E70 8CFD248C */  lw         $4, -0x274($at)
/* E3F74 001E3E74 282E0072 */  paddub     $5, $16, $0
/* E3F78 001E3E78 C0A1040C */  jal        SearchFrame__6CFrameFPc
/* E3F7C 001E3E7C 00000000 */   nop
/* E3F80 001E3E80 27004010 */  beqz       $2, .L001E3F20
/* E3F84 001E3E84 00000000 */   nop
/* E3F88 001E3E88 01000424 */  addiu      $4, $0, 0x1
/* E3F8C 001E3E8C E09C838F */  lw         $3, -0x6320($gp)
/* E3F90 001E3E90 21188302 */  addu       $3, $20, $3
/* E3F94 001E3E94 21186302 */  addu       $3, $19, $3
/* E3F98 001E3E98 0600013C */  lui        $at, (0x60000 >> 16)
/* E3F9C 001E3E9C 21086100 */  addu       $at, $3, $at
/* E3FA0 001E3EA0 50A624AC */  sw         $4, -0x59B0($at)
/* E3FA4 001E3EA4 E09C838F */  lw         $3, -0x6320($gp)
/* E3FA8 001E3EA8 21188302 */  addu       $3, $20, $3
/* E3FAC 001E3EAC 21186302 */  addu       $3, $19, $3
/* E3FB0 001E3EB0 0600013C */  lui        $at, (0x60000 >> 16)
/* E3FB4 001E3EB4 21086100 */  addu       $at, $3, $at
/* E3FB8 001E3EB8 50A422AC */  sw         $2, -0x5BB0($at)
/* E3FBC 001E3EBC E09C828F */  lw         $2, -0x6320($gp)
/* E3FC0 001E3EC0 21108202 */  addu       $2, $20, $2
/* E3FC4 001E3EC4 21106202 */  addu       $2, $19, $2
/* E3FC8 001E3EC8 0600013C */  lui        $at, (0x60000 >> 16)
/* E3FCC 001E3ECC 21084100 */  addu       $at, $2, $at
/* E3FD0 001E3ED0 90A434E4 */  swc1       $f20, -0x5B70($at)
/* E3FD4 001E3ED4 E09C828F */  lw         $2, -0x6320($gp)
/* E3FD8 001E3ED8 21108202 */  addu       $2, $20, $2
/* E3FDC 001E3EDC 21106202 */  addu       $2, $19, $2
/* E3FE0 001E3EE0 0600013C */  lui        $at, (0x60000 >> 16)
/* E3FE4 001E3EE4 21084100 */  addu       $at, $2, $at
/* E3FE8 001E3EE8 D0A535E4 */  swc1       $f21, -0x5A30($at)
/* E3FEC 001E3EEC E09C828F */  lw         $2, -0x6320($gp)
/* E3FF0 001E3EF0 21108202 */  addu       $2, $20, $2
/* E3FF4 001E3EF4 21106202 */  addu       $2, $19, $2
/* E3FF8 001E3EF8 0600013C */  lui        $at, (0x60000 >> 16)
/* E3FFC 001E3EFC 21084100 */  addu       $at, $2, $at
/* E4000 001E3F00 10A636E4 */  swc1       $f22, -0x59F0($at)
/* E4004 001E3F04 E09C828F */  lw         $2, -0x6320($gp)
/* E4008 001E3F08 21108202 */  addu       $2, $20, $2
/* E400C 001E3F0C 0600013C */  lui        $at, (0x60000 >> 16)
/* E4010 001E3F10 21084100 */  addu       $at, $2, $at
/* E4014 001E3F14 90A631AC */  sw         $17, -0x5970($at)
/* E4018 001E3F18 1D000010 */  b          .L001E3F90
/* E401C 001E3F1C 00000000 */   nop
.L001E3F20:
/* E4020 001E3F20 E09C848F */  lw         $4, -0x6320($gp)
/* E4024 001E3F24 80101200 */  sll        $2, $18, 2
/* E4028 001E3F28 21185200 */  addu       $3, $2, $18
/* E402C 001E3F2C 80100300 */  sll        $2, $3, 2
/* E4030 001E3F30 21106200 */  addu       $2, $3, $2
/* E4034 001E3F34 00110200 */  sll        $2, $2, 4
/* E4038 001E3F38 21184400 */  addu       $3, $2, $4
/* E403C 001E3F3C 2A00023C */  lui        $2, %hi(_1040)
/* E4040 001E3F40 B0D04424 */  addiu      $4, $2, %lo(_1040)
/* E4044 001E3F44 0200013C */  lui        $at, (0x20000 >> 16)
/* E4048 001E3F48 21086100 */  addu       $at, $3, $at
/* E404C 001E3F4C ECE3258C */  lw         $5, -0x1C14($at)
/* E4050 001E3F50 28360072 */  paddub     $6, $16, $0
/* E4054 001E3F54 A611040C */  jal        printf
/* E4058 001E3F58 00000000 */   nop
/* E405C 001E3F5C FFFF0324 */  addiu      $3, $0, -0x1
/* E4060 001E3F60 E09C828F */  lw         $2, -0x6320($gp)
/* E4064 001E3F64 21108202 */  addu       $2, $20, $2
/* E4068 001E3F68 0600013C */  lui        $at, (0x60000 >> 16)
/* E406C 001E3F6C 21084100 */  addu       $at, $2, $at
/* E4070 001E3F70 90A623AC */  sw         $3, -0x5970($at)
/* E4074 001E3F74 01000224 */  addiu      $2, $0, 0x1
/* E4078 001E3F78 06000010 */  b          .L001E3F94
/* E407C 001E3F7C 00000000 */   nop
.L001E3F80:
/* E4080 001E3F80 01003126 */  addiu      $17, $17, 0x1
.L001E3F84:
/* E4084 001E3F84 1000222A */  slti       $2, $17, 0x10
/* E4088 001E3F88 AAFF4014 */  bnez       $2, .L001E3E34
/* E408C 001E3F8C 00000000 */   nop
.L001E3F90:
/* E4090 001E3F90 01000224 */  addiu      $2, $0, 0x1
.L001E3F94:
/* E4094 001E3F94 6000BF7B */  lq         $31, 0x60($sp)
/* E4098 001E3F98 5000B47B */  lq         $20, 0x50($sp)
/* E409C 001E3F9C 4000B37B */  lq         $19, 0x40($sp)
/* E40A0 001E3FA0 3000B27B */  lq         $18, 0x30($sp)
/* E40A4 001E3FA4 2000B17B */  lq         $17, 0x20($sp)
/* E40A8 001E3FA8 1000B07B */  lq         $16, 0x10($sp)
/* E40AC 001E3FAC 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* E40B0 001E3FB0 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* E40B4 001E3FB4 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* E40B8 001E3FB8 7000BD27 */  addiu      $sp, $sp, 0x70
/* E40BC 001E3FBC 0800E003 */  jr         $31
/* E40C0 001E3FC0 00000000 */   nop
/* E40C4 001E3FC4 00000000 */  nop
/* E40C8 001E3FC8 00000000 */  nop
/* E40CC 001E3FCC 00000000 */  nop
