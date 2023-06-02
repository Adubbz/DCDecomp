.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdMapJump__FiPc
/* 84FB0 00184EB0 60FFBD27 */  addiu      $sp, $sp, -0xA0
/* 84FB4 00184EB4 2000BF7F */  sq         $31, 0x20($sp)
/* 84FB8 00184EB8 1000B17F */  sq         $17, 0x10($sp)
/* 84FBC 00184EBC 0000B07F */  sq         $16, 0x0($sp)
/* 84FC0 00184EC0 288EA070 */  paddub     $17, $5, $0
/* 84FC4 00184EC4 04002012 */  beqz       $17, .L00184ED8
/* 84FC8 00184EC8 00000000 */   nop
/* 84FCC 00184ECC 00002382 */  lb         $3, 0x0($17)
/* 84FD0 00184ED0 03006014 */  bnez       $3, .L00184EE0
/* 84FD4 00184ED4 00000000 */   nop
.L00184ED8:
/* 84FD8 00184ED8 6B000010 */  b          .L00185088
/* 84FDC 00184EDC 00000000 */   nop
.L00184EE0:
/* 84FE0 00184EE0 03008228 */  slti       $2, $4, 0x3
/* 84FE4 00184EE4 01004014 */  bnez       $2, .L00184EEC
/* 84FE8 00184EE8 00000000 */   nop
.L00184EEC:
/* 84FEC 00184EEC 2700023C */  lui        $2, %hi(_691_2)
/* 84FF0 00184EF0 50994224 */  addiu      $2, $2, %lo(_691_2)
/* 84FF4 00184EF4 3000A427 */  addiu      $4, $sp, 0x30
/* 84FF8 00184EF8 00004378 */  lq         $3, 0x0($2)
/* 84FFC 00184EFC 100042C4 */  lwc1       $f2, 0x10($2)
/* 85000 00184F00 0000837C */  sq         $3, 0x0($4)
/* 85004 00184F04 100082E4 */  swc1       $f2, 0x10($4)
/* 85008 00184F08 30FB040C */  jal        StartReadBG__Fv
/* 8500C 00184F0C 00000000 */   nop
/* 85010 00184F10 948B908F */  lw         $16, -0x746C($gp)
/* 85014 00184F14 5000A427 */  addiu      $4, $sp, 0x50
/* 85018 00184F18 2A00023C */  lui        $2, %hi(_727_3)
/* 8501C 00184F1C 70B04524 */  addiu      $5, $2, %lo(_727_3)
/* 85020 00184F20 28362072 */  paddub     $6, $17, $0
/* 85024 00184F24 1614040C */  jal        sprintf
/* 85028 00184F28 00000000 */   nop
/* 8502C 00184F2C 5000A427 */  addiu      $4, $sp, 0x50
/* 85030 00184F30 282E0072 */  paddub     $5, $16, $0
/* 85034 00184F34 9C00A627 */  addiu      $6, $sp, 0x9C
/* 85038 00184F38 ACFA040C */  jal        LoadFileBG__FPcP1Pi
/* 8503C 00184F3C 00000000 */   nop
/* 85040 00184F40 13004014 */  bnez       $2, .L00184F90
/* 85044 00184F44 00000000 */   nop
/* 85048 00184F48 28262072 */  paddub     $4, $17, $0
/* 8504C 00184F4C A015040C */  jal        strlen
/* 85050 00184F50 00000000 */   nop
/* 85054 00184F54 21105100 */  addu       $2, $2, $17
/* 85058 00184F58 FFFF40A0 */  sb         $0, -0x1($2)
/* 8505C 00184F5C 5000A427 */  addiu      $4, $sp, 0x50
/* 85060 00184F60 2A00023C */  lui        $2, %hi(_727_3)
/* 85064 00184F64 70B04524 */  addiu      $5, $2, %lo(_727_3)
/* 85068 00184F68 28362072 */  paddub     $6, $17, $0
/* 8506C 00184F6C 1614040C */  jal        sprintf
/* 85070 00184F70 00000000 */   nop
/* 85074 00184F74 5000A427 */  addiu      $4, $sp, 0x50
/* 85078 00184F78 282E0072 */  paddub     $5, $16, $0
/* 8507C 00184F7C 9C00A627 */  addiu      $6, $sp, 0x9C
/* 85080 00184F80 ACFA040C */  jal        LoadFileBG__FPcP1Pi
/* 85084 00184F84 00000000 */   nop
/* 85088 00184F88 3F004010 */  beqz       $2, .L00185088
/* 8508C 00184F8C 00000000 */   nop
.L00184F90:
/* 85090 00184F90 9C00A28F */  lw         $2, 0x9C($sp)
/* 85094 00184F94 83110200 */  sra        $2, $2, 6
/* 85098 00184F98 01004224 */  addiu      $2, $2, 0x1
/* 8509C 00184F9C 80110200 */  sll        $2, $2, 6
/* 850A0 00184FA0 03110200 */  sra        $2, $2, 4
/* 850A4 00184FA4 00110200 */  sll        $2, $2, 4
/* 850A8 00184FA8 21800202 */  addu       $16, $16, $2
/* 850AC 00184FAC 5000A427 */  addiu      $4, $sp, 0x50
/* 850B0 00184FB0 2A00023C */  lui        $2, %hi(_728_3)
/* 850B4 00184FB4 78B04524 */  addiu      $5, $2, %lo(_728_3)
/* 850B8 00184FB8 28362072 */  paddub     $6, $17, $0
/* 850BC 00184FBC 1614040C */  jal        sprintf
/* 850C0 00184FC0 00000000 */   nop
/* 850C4 00184FC4 5000A427 */  addiu      $4, $sp, 0x50
/* 850C8 00184FC8 282E0072 */  paddub     $5, $16, $0
/* 850CC 00184FCC 9C00A627 */  addiu      $6, $sp, 0x9C
/* 850D0 00184FD0 ACFA040C */  jal        LoadFileBG__FPcP1Pi
/* 850D4 00184FD4 00000000 */   nop
/* 850D8 00184FD8 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 850DC 00184FDC 58B3228C */  lw         $2, -0x4CA8($at)
/* 850E0 00184FE0 00190200 */  sll        $3, $2, 4
/* 850E4 00184FE4 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 850E8 00184FE8 50B3228C */  lw         $2, -0x4CB0($at)
/* 850EC 00184FEC 21804300 */  addu       $16, $2, $3
/* 850F0 00184FF0 5000A427 */  addiu      $4, $sp, 0x50
/* 850F4 00184FF4 2A00023C */  lui        $2, %hi(_729_3)
/* 850F8 00184FF8 80B04524 */  addiu      $5, $2, %lo(_729_3)
/* 850FC 00184FFC 28362072 */  paddub     $6, $17, $0
/* 85100 00185000 1614040C */  jal        sprintf
/* 85104 00185004 00000000 */   nop
/* 85108 00185008 5000A427 */  addiu      $4, $sp, 0x50
/* 8510C 0018500C 282E0072 */  paddub     $5, $16, $0
/* 85110 00185010 9C00A627 */  addiu      $6, $sp, 0x9C
/* 85114 00185014 ACFA040C */  jal        LoadFileBG__FPcP1Pi
/* 85118 00185018 00000000 */   nop
/* 8511C 0018501C 0E004014 */  bnez       $2, .L00185058
/* 85120 00185020 00000000 */   nop
/* 85124 00185024 5000A427 */  addiu      $4, $sp, 0x50
/* 85128 00185028 2A00023C */  lui        $2, %hi(_730_3)
/* 8512C 0018502C 88B04524 */  addiu      $5, $2, %lo(_730_3)
/* 85130 00185030 28362072 */  paddub     $6, $17, $0
/* 85134 00185034 1614040C */  jal        sprintf
/* 85138 00185038 00000000 */   nop
/* 8513C 0018503C 5000A427 */  addiu      $4, $sp, 0x50
/* 85140 00185040 282E0072 */  paddub     $5, $16, $0
/* 85144 00185044 9C00A627 */  addiu      $6, $sp, 0x9C
/* 85148 00185048 ACFA040C */  jal        LoadFileBG__FPcP1Pi
/* 8514C 0018504C 00000000 */   nop
/* 85150 00185050 0D004010 */  beqz       $2, .L00185088
/* 85154 00185054 00000000 */   nop
.L00185058:
/* 85158 00185058 9C00A38F */  lw         $3, 0x9C($sp)
/* 8515C 0018505C 2000013C */  lui        $at, (0x200001 >> 16)
/* 85160 00185060 01002134 */  ori        $at, $at, (0x200001 & 0xFFFF)
/* 85164 00185064 2A086100 */  slt        $at, $3, $at
/* 85168 00185068 07002014 */  bnez       $at, .L00185088
/* 8516C 0018506C 00000000 */   nop
/* 85170 00185070 2A00023C */  lui        $2, %hi(_731_3)
/* 85174 00185074 90B04424 */  addiu      $4, $2, %lo(_731_3)
/* 85178 00185078 A611040C */  jal        printf
/* 8517C 0018507C 00000000 */   nop
.L00185080:
/* 85180 00185080 FFFF0010 */  b          .L00185080
/* 85184 00185084 00000000 */   nop
.L00185088:
/* 85188 00185088 2000BF7B */  lq         $31, 0x20($sp)
/* 8518C 0018508C 1000B17B */  lq         $17, 0x10($sp)
/* 85190 00185090 0000B07B */  lq         $16, 0x0($sp)
/* 85194 00185094 A000BD27 */  addiu      $sp, $sp, 0xA0
/* 85198 00185098 0800E003 */  jr         $31
/* 8519C 0018509C 00000000 */   nop
