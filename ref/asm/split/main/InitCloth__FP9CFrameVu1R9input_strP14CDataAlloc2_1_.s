.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel InitCloth__FP9CFrameVu1R9input_strP14CDataAlloc2_1_
/* 03FAC0 0013F9C0 80EFBD27 */  addiu       $29, $29, -0x1080
/* 03FAC4 0013F9C4 2000BF7F */  sq          $31, 0x20($29)
/* 03FAC8 0013F9C8 1000B17F */  sq          $17, 0x10($29)
/* 03FACC 0013F9CC 0000B07F */  sq          $16, 0x0($29)
/* 03FAD0 0013F9D0 288E8070 */  paddub      $17, $4, $0
/* 03FAD4 0013F9D4 2886A070 */  paddub      $16, $5, $0
/* 03FAD8 0013F9D8 188D86AF */  sw          $6, -0x72E8($28)
/* 03FADC 0013F9DC 2826C070 */  paddub      $4, $6, $0
/* 03FAE0 0013F9E0 56080524 */  addiu       $5, $0, 0x856
/* 03FAE4 0013F9E4 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 03FAE8 0013F9E8 00000000 */   nop
/* 03FAEC 0013F9EC 50850434 */  ori         $4, $0, 0x8550
/* 03FAF0 0013F9F0 282E4070 */  paddub      $5, $2, $0
/* 03FAF4 0013F9F4 E09E040C */  jal         __nw__FUiP1
/* 03FAF8 0013F9F8 00000000 */   nop
/* 03FAFC 0013F9FC 08004010 */  beqz        $2, .L0013FA20
/* 03FB00 0013FA00 00000000 */   nop
/* 03FB04 0013FA04 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 03FB08 0013FA08 00608344 */  mtc1        $3, $f12
/* 03FB0C 0013FA0C 28264070 */  paddub      $4, $2, $0
/* 03FB10 0013FA10 10000524 */  addiu       $5, $0, 0x10
/* 03FB14 0013FA14 2836A070 */  paddub      $6, $5, $0
/* 03FB18 0013FA18 DCF2040C */  jal         __ct__6CClothFiif
/* 03FB1C 0013FA1C 00000000 */   nop
.L0013FA20:
/* 03FB20 0013FA20 0C8D82AF */  sw          $2, -0x72F4($28)
/* 03FB24 0013FA24 148D91AF */  sw          $17, -0x72EC($28)
/* 03FB28 0013FA28 108D80AF */  sw          $0, -0x72F0($28)
/* 03FB2C 0013FA2C 04002016 */  bnez        $17, .L0013FA40
/* 03FB30 0013FA30 00000000 */   nop
/* 03FB34 0013FA34 28160070 */  paddub      $2, $0, $0
/* 03FB38 0013FA38 48000010 */  b           .L0013FB5C
/* 03FB3C 0013FA3C 00000000 */   nop
.L0013FA40:
/* 03FB40 0013FA40 04004014 */  bnez        $2, .L0013FA54
/* 03FB44 0013FA44 00000000 */   nop
/* 03FB48 0013FA48 28160070 */  paddub      $2, $0, $0
/* 03FB4C 0013FA4C 43000010 */  b           .L0013FB5C
/* 03FB50 0013FA50 00000000 */   nop
.L0013FA54:
/* 03FB54 0013FA54 28260072 */  paddub      $4, $16, $0
/* 03FB58 0013FA58 1C01050C */  jal         SkipSpace__FR9input_str__2
/* 03FB5C 0013FA5C 00000000 */   nop
/* 03FB60 0013FA60 28260070 */  paddub      $4, $0, $0
/* 03FB64 0013FA64 08000010 */  b           .L0013FA88
/* 03FB68 0013FA68 00000000 */   nop
.L0013FA6C:
/* 03FB6C 0013FA6C 00120400 */  sll         $2, $4, 8
/* 03FB70 0013FA70 21105D00 */  addu        $2, $2, $29
/* 03FB74 0013FA74 30004324 */  addiu       $3, $2, 0x30
/* 03FB78 0013FA78 80100400 */  sll         $2, $4, 2
/* 03FB7C 0013FA7C 21105D00 */  addu        $2, $2, $29
/* 03FB80 0013FA80 301043AC */  sw          $3, 0x1030($2)
/* 03FB84 0013FA84 01008424 */  addiu       $4, $4, 0x1
.L0013FA88:
/* 03FB88 0013FA88 10008228 */  slti        $2, $4, 0x10
/* 03FB8C 0013FA8C F7FF4014 */  bnez        $2, .L0013FA6C
/* 03FB90 0013FA90 00000000 */   nop
/* 03FB94 0013FA94 29000010 */  b           .L0013FB3C
/* 03FB98 0013FA98 00000000 */   nop
.L0013FA9C:
/* 03FB9C 0013FA9C 7C10A38F */  lw          $3, 0x107C($29)
/* 03FBA0 0013FAA0 09006128 */  slti        $1, $3, 0x9
/* 03FBA4 0013FAA4 03002010 */  beqz        $1, .L0013FAB4
/* 03FBA8 0013FAA8 00000000 */   nop
/* 03FBAC 0013FAAC 07006104 */  bgez        $3, .L0013FACC
/* 03FBB0 0013FAB0 00000000 */   nop
.L0013FAB4:
/* 03FBB4 0013FAB4 2A00023C */  lui         $2, %hi(LIT_254)
/* 03FBB8 0013FAB8 D0914424 */  addiu       $4, $2, %lo(LIT_254)
/* 03FBBC 0013FABC A611040C */  jal         printf
/* 03FBC0 0013FAC0 00000000 */   nop
/* 03FBC4 0013FAC4 1D000010 */  b           .L0013FB3C
/* 03FBC8 0013FAC8 00000000 */   nop
.L0013FACC:
/* 03FBCC 0013FACC 00110300 */  sll         $2, $3, 4
/* 03FBD0 0013FAD0 21104300 */  addu        $2, $2, $3
/* 03FBD4 0013FAD4 80180200 */  sll         $3, $2, 2
/* 03FBD8 0013FAD8 2500023C */  lui         $2, %hi(Command__2)
/* 03FBDC 0013FADC A0174224 */  addiu       $2, $2, %lo(Command__2)
/* 03FBE0 0013FAE0 21104300 */  addu        $2, $2, $3
/* 03FBE4 0013FAE4 3010A627 */  addiu       $6, $29, 0x1030
/* 03FBE8 0013FAE8 28260072 */  paddub      $4, $16, $0
/* 03FBEC 0013FAEC 04004524 */  addiu       $5, $2, 0x4
/* 03FBF0 0013FAF0 0000050C */  jal         GetArg__FR9input_strPiPPv__2
/* 03FBF4 0013FAF4 00000000 */   nop
/* 03FBF8 0013FAF8 16004010 */  beqz        $2, .L0013FB54
/* 03FBFC 0013FAFC 00000000 */   nop
/* 03FC00 0013FB00 05004104 */  bgez        $2, .L0013FB18
/* 03FC04 0013FB04 00000000 */   nop
/* 03FC08 0013FB08 2A00023C */  lui         $2, %hi(LIT_255)
/* 03FC0C 0013FB0C E8914424 */  addiu       $4, $2, %lo(LIT_255)
/* 03FC10 0013FB10 A611040C */  jal         printf
/* 03FC14 0013FB14 00000000 */   nop
.L0013FB18:
/* 03FC18 0013FB18 3010A427 */  addiu       $4, $29, 0x1030
/* 03FC1C 0013FB1C 7C10A28F */  lw          $2, 0x107C($29)
/* 03FC20 0013FB20 80180200 */  sll         $3, $2, 2
/* 03FC24 0013FB24 2500023C */  lui         $2, %hi(CommandExe__2)
/* 03FC28 0013FB28 101A4224 */  addiu       $2, $2, %lo(CommandExe__2)
/* 03FC2C 0013FB2C 21104300 */  addu        $2, $2, $3
/* 03FC30 0013FB30 0000428C */  lw          $2, 0x0($2)
/* 03FC34 0013FB34 09F84000 */  jalr        $2
/* 03FC38 0013FB38 00000000 */   nop
.L0013FB3C:
/* 03FC3C 0013FB3C 28260072 */  paddub      $4, $16, $0
/* 03FC40 0013FB40 7C10A527 */  addiu       $5, $29, 0x107C
/* 03FC44 0013FB44 C800050C */  jal         SearchCommand__FR9input_strPi__2
/* 03FC48 0013FB48 00000000 */   nop
/* 03FC4C 0013FB4C D3FF4014 */  bnez        $2, .L0013FA9C
/* 03FC50 0013FB50 00000000 */   nop
.L0013FB54:
/* 03FC54 0013FB54 0C8D828F */  lw          $2, -0x72F4($28)
/* 03FC58 0013FB58 00000000 */  nop
.L0013FB5C:
/* 03FC5C 0013FB5C 2000BF7B */  lq          $31, 0x20($29)
/* 03FC60 0013FB60 1000B17B */  lq          $17, 0x10($29)
/* 03FC64 0013FB64 0000B07B */  lq          $16, 0x0($29)
/* 03FC68 0013FB68 8010BD27 */  addiu       $29, $29, 0x1080
/* 03FC6C 0013FB6C 0800E003 */  jr          $31
/* 03FC70 0013FB70 00000000 */   nop
/* 03FC74 0013FB74 00000000 */  nop
/* 03FC78 0013FB78 00000000 */  nop
/* 03FC7C 0013FB7C 00000000 */  nop
