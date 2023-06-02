.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_NPC_FOOT_SOUND__FP12RS_STACKDATAi
/* 8F030 0018EF30 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 8F034 0018EF34 4000BF7F */  sq         $31, 0x40($sp)
/* 8F038 0018EF38 3000B37F */  sq         $19, 0x30($sp)
/* 8F03C 0018EF3C 2000B27F */  sq         $18, 0x20($sp)
/* 8F040 0018EF40 1000B17F */  sq         $17, 0x10($sp)
/* 8F044 0018EF44 0000B07F */  sq         $16, 0x0($sp)
/* 8F048 0018EF48 2896A070 */  paddub     $18, $5, $0
/* 8F04C 0018EF4C 08009324 */  addiu      $19, $4, 0x8
/* 8F050 0018EF50 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8F054 0018EF54 00000000 */   nop
/* 8F058 0018EF58 28864070 */  paddub     $16, $2, $0
/* 8F05C 0018EF5C 288E0070 */  paddub     $17, $0, $0
/* 8F060 0018EF60 20000010 */  b          .L0018EFE4
/* 8F064 0018EF64 00000000 */   nop
.L0018EF68:
/* 8F068 0018EF68 28266072 */  paddub     $4, $19, $0
/* 8F06C 0018EF6C 08009324 */  addiu      $19, $4, 0x8
/* 8F070 0018EF70 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8F074 0018EF74 00000000 */   nop
/* 8F078 0018EF78 28264070 */  paddub     $4, $2, $0
/* 8F07C 0018EF7C 842C060C */  jal        GetChara__Fi
/* 8F080 0018EF80 00000000 */   nop
/* 8F084 0018EF84 16004010 */  beqz       $2, .L0018EFE0
/* 8F088 0018EF88 00000000 */   nop
/* 8F08C 0018EF8C 03008104 */  bgez       $4, .L0018EF9C
/* 8F090 0018EF90 00000000 */   nop
/* 8F094 0018EF94 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8F098 0018EF98 38D230AC */  sw         $16, -0x2DC8($at)
.L0018EF9C:
/* 8F09C 0018EF9C 09008004 */  bltz       $4, .L0018EFC4
/* 8F0A0 0018EFA0 00000000 */   nop
/* 8F0A4 0018EFA4 10008128 */  slti       $at, $4, 0x10
/* 8F0A8 0018EFA8 06002010 */  beqz       $at, .L0018EFC4
/* 8F0AC 0018EFAC 00000000 */   nop
/* 8F0B0 0018EFB0 80200400 */  sll        $4, $4, 2
/* 8F0B4 0018EFB4 D401033C */  lui        $3, %hi(D_1D3D304)
/* 8F0B8 0018EFB8 04D36324 */  addiu      $3, $3, %lo(D_1D3D304)
/* 8F0BC 0018EFBC 21186400 */  addu       $3, $3, $4
/* 8F0C0 0018EFC0 000070AC */  sw         $16, 0x0($3)
.L0018EFC4:
/* 8F0C4 0018EFC4 02000324 */  addiu      $3, $0, 0x2
/* 8F0C8 0018EFC8 05000316 */  bne        $16, $3, .L0018EFE0
/* 8F0CC 0018EFCC 00000000 */   nop
/* 8F0D0 0018EFD0 28264070 */  paddub     $4, $2, $0
/* 8F0D4 0018EFD4 01000524 */  addiu      $5, $0, 0x1
/* 8F0D8 0018EFD8 88E0040C */  jal        FootSoundEnable__10CCharacterFi
/* 8F0DC 0018EFDC 00000000 */   nop
.L0018EFE0:
/* 8F0E0 0018EFE0 01003126 */  addiu      $17, $17, 0x1
.L0018EFE4:
/* 8F0E4 0018EFE4 FFFF4226 */  addiu      $2, $18, -0x1
/* 8F0E8 0018EFE8 2A102202 */  slt        $2, $17, $2
/* 8F0EC 0018EFEC DEFF4014 */  bnez       $2, .L0018EF68
/* 8F0F0 0018EFF0 00000000 */   nop
/* 8F0F4 0018EFF4 01000224 */  addiu      $2, $0, 0x1
/* 8F0F8 0018EFF8 4000BF7B */  lq         $31, 0x40($sp)
/* 8F0FC 0018EFFC 3000B37B */  lq         $19, 0x30($sp)
/* 8F100 0018F000 2000B27B */  lq         $18, 0x20($sp)
/* 8F104 0018F004 1000B17B */  lq         $17, 0x10($sp)
/* 8F108 0018F008 0000B07B */  lq         $16, 0x0($sp)
/* 8F10C 0018F00C 5000BD27 */  addiu      $sp, $sp, 0x50
/* 8F110 0018F010 0800E003 */  jr         $31
/* 8F114 0018F014 00000000 */   nop
/* 8F118 0018F018 00000000 */  nop
/* 8F11C 0018F01C 00000000 */  nop
