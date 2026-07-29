.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _MES_MAKE__FP12RS_STACKDATAi
/* 08FAD0 0018F9D0 50FFBD27 */  addiu       $29, $29, -0xB0
/* 08FAD4 0018F9D4 5000BF7F */  sq          $31, 0x50($29)
/* 08FAD8 0018F9D8 4000B47F */  sq          $20, 0x40($29)
/* 08FADC 0018F9DC 3000B37F */  sq          $19, 0x30($29)
/* 08FAE0 0018F9E0 2000B27F */  sq          $18, 0x20($29)
/* 08FAE4 0018F9E4 1000B17F */  sq          $17, 0x10($29)
/* 08FAE8 0018F9E8 0000B07F */  sq          $16, 0x0($29)
/* 08FAEC 0018F9EC 2896A070 */  paddub      $18, $5, $0
/* 08FAF0 0018F9F0 08009324 */  addiu       $19, $4, 0x8
/* 08FAF4 0018F9F4 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08FAF8 0018F9F8 00000000 */   nop
/* 08FAFC 0018F9FC 28264070 */  paddub      $4, $2, $0
/* 08FB00 0018FA00 643E060C */  jal         GetMes__Fi
/* 08FB04 0018FA04 00000000 */   nop
/* 08FB08 0018FA08 28864070 */  paddub      $16, $2, $0
/* 08FB0C 0018FA0C 04000016 */  bnez        $16, .L0018FA20
/* 08FB10 0018FA10 00000000 */   nop
/* 08FB14 0018FA14 28160070 */  paddub      $2, $0, $0
/* 08FB18 0018FA18 45000010 */  b           .L0018FB30
/* 08FB1C 0018FA1C 00000000 */   nop
.L0018FA20:
/* 08FB20 0018FA20 D401013C */  lui         $1, %hi(EdEventInfo + 0x40)
/* 08FB24 0018FA24 10D2248C */  lw          $4, %lo(EdEventInfo + 0x40)($1)
/* 08FB28 0018FA28 0D008010 */  beqz        $4, .L0018FA60
/* 08FB2C 0018FA2C 00000000 */   nop
/* 08FB30 0018FA30 6000A527 */  addiu       $5, $29, 0x60
/* 08FB34 0018FA34 F890040C */  jal         GetCameraMatrix__7CCameraFPA4_f
/* 08FB38 0018FA38 00000000 */   nop
/* 08FB3C 0018FA3C D401013C */  lui         $1, %hi(EdEventInfo + 0x40)
/* 08FB40 0018FA40 10D2248C */  lw          $4, %lo(EdEventInfo + 0x40)($1)
/* 08FB44 0018FA44 A000A527 */  addiu       $5, $29, 0xA0
/* 08FB48 0018FA48 9C91040C */  jal         GetPos__7CCameraFPf
/* 08FB4C 0018FA4C 00000000 */   nop
/* 08FB50 0018FA50 6000A427 */  addiu       $4, $29, 0x60
/* 08FB54 0018FA54 A000A527 */  addiu       $5, $29, 0xA0
/* 08FB58 0018FA58 E8B7040C */  jal         MGSetViewMatrix__FPA4_fPf
/* 08FB5C 0018FA5C 00000000 */   nop
.L0018FA60:
/* 08FB60 0018FA60 28266072 */  paddub      $4, $19, $0
/* 08FB64 0018FA64 08009324 */  addiu       $19, $4, 0x8
/* 08FB68 0018FA68 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08FB6C 0018FA6C 00000000 */   nop
/* 08FB70 0018FA70 288E4070 */  paddub      $17, $2, $0
/* 08FB74 0018FA74 0300422A */  slti        $2, $18, 0x3
/* 08FB78 0018FA78 06004014 */  bnez        $2, .L0018FA94
/* 08FB7C 0018FA7C 00000000 */   nop
/* 08FB80 0018FA80 28266072 */  paddub      $4, $19, $0
/* 08FB84 0018FA84 08009324 */  addiu       $19, $4, 0x8
/* 08FB88 0018FA88 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08FB8C 0018FA8C 00000000 */   nop
/* 08FB90 0018FA90 281702AE */  sw          $2, 0x1728($16)
.L0018FA94:
/* 08FB94 0018FA94 0400422A */  slti        $2, $18, 0x4
/* 08FB98 0018FA98 20004014 */  bnez        $2, .L0018FB1C
/* 08FB9C 0018FA9C 00000000 */   nop
/* 08FBA0 0018FAA0 28260070 */  paddub      $4, $0, $0
/* 08FBA4 0018FAA4 06000010 */  b           .L0018FAC0
/* 08FBA8 0018FAA8 00000000 */   nop
.L0018FAAC:
/* 08FBAC 0018FAAC FFFF0324 */  addiu       $3, $0, -0x1
/* 08FBB0 0018FAB0 80100400 */  sll         $2, $4, 2
/* 08FBB4 0018FAB4 21105000 */  addu        $2, $2, $16
/* 08FBB8 0018FAB8 E01643AC */  sw          $3, 0x16E0($2)
/* 08FBBC 0018FABC 01008424 */  addiu       $4, $4, 0x1
.L0018FAC0:
/* 08FBC0 0018FAC0 04008228 */  slti        $2, $4, 0x4
/* 08FBC4 0018FAC4 F9FF4014 */  bnez        $2, .L0018FAAC
/* 08FBC8 0018FAC8 00000000 */   nop
/* 08FBCC 0018FACC 04001424 */  addiu       $20, $0, 0x4
/* 08FBD0 0018FAD0 0F000010 */  b           .L0018FB10
/* 08FBD4 0018FAD4 00000000 */   nop
.L0018FAD8:
/* 08FBD8 0018FAD8 28266072 */  paddub      $4, $19, $0
/* 08FBDC 0018FADC 08009324 */  addiu       $19, $4, 0x8
/* 08FBE0 0018FAE0 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08FBE4 0018FAE4 00000000 */   nop
/* 08FBE8 0018FAE8 80181400 */  sll         $3, $20, 2
/* 08FBEC 0018FAEC 21187000 */  addu        $3, $3, $16
/* 08FBF0 0018FAF0 D01662AC */  sw          $2, 0x16D0($3)
/* 08FBF4 0018FAF4 FCFF8526 */  addiu       $5, $20, -0x4
/* 08FBF8 0018FAF8 2A00033C */  lui         $3, %hi(LIT_1424)
/* 08FBFC 0018FAFC F8B06424 */  addiu       $4, $3, %lo(LIT_1424)
/* 08FC00 0018FB00 28364070 */  paddub      $6, $2, $0
/* 08FC04 0018FB04 A611040C */  jal         printf
/* 08FC08 0018FB08 00000000 */   nop
/* 08FC0C 0018FB0C 01009426 */  addiu       $20, $20, 0x1
.L0018FB10:
/* 08FC10 0018FB10 2A085402 */  slt         $1, $18, $20
/* 08FC14 0018FB14 F0FF2010 */  beqz        $1, .L0018FAD8
/* 08FC18 0018FB18 00000000 */   nop
.L0018FB1C:
/* 08FC1C 0018FB1C 28260072 */  paddub      $4, $16, $0
/* 08FC20 0018FB20 282E2072 */  paddub      $5, $17, $0
/* 08FC24 0018FB24 5441050C */  jal         MakeMesWin__6ClsMesFi
/* 08FC28 0018FB28 00000000 */   nop
/* 08FC2C 0018FB2C 01000224 */  addiu       $2, $0, 0x1
.L0018FB30:
/* 08FC30 0018FB30 5000BF7B */  lq          $31, 0x50($29)
/* 08FC34 0018FB34 4000B47B */  lq          $20, 0x40($29)
/* 08FC38 0018FB38 3000B37B */  lq          $19, 0x30($29)
/* 08FC3C 0018FB3C 2000B27B */  lq          $18, 0x20($29)
/* 08FC40 0018FB40 1000B17B */  lq          $17, 0x10($29)
/* 08FC44 0018FB44 0000B07B */  lq          $16, 0x0($29)
/* 08FC48 0018FB48 B000BD27 */  addiu       $29, $29, 0xB0
/* 08FC4C 0018FB4C 0800E003 */  jr          $31
/* 08FC50 0018FB50 00000000 */   nop
/* 08FC54 0018FB54 00000000 */  nop
/* 08FC58 0018FB58 00000000 */  nop
/* 08FC5C 0018FB5C 00000000 */  nop
