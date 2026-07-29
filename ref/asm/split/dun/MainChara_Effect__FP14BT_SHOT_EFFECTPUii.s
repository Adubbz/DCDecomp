.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MainChara_Effect__FP14BT_SHOT_EFFECTPUii
/* 00E530 01DBA230 C0FFBD27 */  addiu       $29, $29, -0x40
/* 00E534 01DBA234 3000BF7F */  sq          $31, 0x30($29)
/* 00E538 01DBA238 2000B27F */  sq          $18, 0x20($29)
/* 00E53C 01DBA23C 1000B17F */  sq          $17, 0x10($29)
/* 00E540 01DBA240 0000B07F */  sq          $16, 0x0($29)
/* 00E544 01DBA244 288E8070 */  paddub      $17, $4, $0
/* 00E548 01DBA248 2886A070 */  paddub      $16, $5, $0
/* 00E54C 01DBA24C 2896C070 */  paddub      $18, $6, $0
/* 00E550 01DBA250 E901023C */  lui         $2, %hi(CharaMainEffect)
/* 00E554 01DBA254 60DA4424 */  addiu       $4, $2, %lo(CharaMainEffect)
/* 00E558 01DBA258 10B9060C */  jal         Initialize__12CSHOT_EFFECTFv
/* 00E55C 01DBA25C 00000000 */   nop
/* 00E560 01DBA260 E901023C */  lui         $2, %hi(CharaMainEffectCrash)
/* 00E564 01DBA264 C07B4424 */  addiu       $4, $2, %lo(CharaMainEffectCrash)
/* 00E568 01DBA268 10B9060C */  jal         Initialize__12CSHOT_EFFECTFv
/* 00E56C 01DBA26C 00000000 */   nop
/* 00E570 01DBA270 4B002012 */  beqz        $17, .L01DBA3A0_2F59A0
/* 00E574 01DBA274 00000000 */   nop
/* 00E578 01DBA278 10004012 */  beqz        $18, .L01DBA2BC_2F58BC
/* 00E57C 01DBA27C 00000000 */   nop
/* 00E580 01DBA280 C701023C */  lui         $2, %hi(TexManager)
/* 00E584 01DBA284 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00E588 01DBA288 10000524 */  addiu       $5, $0, 0x10
/* 00E58C 01DBA28C C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 00E590 01DBA290 00000000 */   nop
/* 00E594 01DBA294 C701023C */  lui         $2, %hi(TexManager)
/* 00E598 01DBA298 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00E59C 01DBA29C FCCD040C */  jal         CleanUpBuffer__15CTextureManagerFv
/* 00E5A0 01DBA2A0 00000000 */   nop
/* 00E5A4 01DBA2A4 C701023C */  lui         $2, %hi(TexManager)
/* 00E5A8 01DBA2A8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00E5AC 01DBA2AC 98CE040C */  jal         CleanUpTextureList__15CTextureManagerFv
/* 00E5B0 01DBA2B0 00000000 */   nop
/* 00E5B4 01DBA2B4 F001013C */  lui         $1, %hi(WEffectModelBuffer + 0x8)
/* 00E5B8 01DBA2B8 886620AC */  sw          $0, %lo(WEffectModelBuffer + 0x8)($1)
.L01DBA2BC_2F58BC:
/* 00E5BC 01DBA2BC E901023C */  lui         $2, %hi(CharaMainEffect)
/* 00E5C0 01DBA2C0 60DA4424 */  addiu       $4, $2, %lo(CharaMainEffect)
/* 00E5C4 01DBA2C4 282E2072 */  paddub      $5, $17, $0
/* 00E5C8 01DBA2C8 28360072 */  paddub      $6, $16, $0
/* 00E5CC 01DBA2CC 10000724 */  addiu       $7, $0, 0x10
/* 00E5D0 01DBA2D0 F001023C */  lui         $2, %hi(WEffectModelBuffer)
/* 00E5D4 01DBA2D4 80664824 */  addiu       $8, $2, %lo(WEffectModelBuffer)
/* 00E5D8 01DBA2D8 06000924 */  addiu       $9, $0, 0x6
/* 00E5DC 01DBA2DC 98B4060C */  jal         Entry2__12CSHOT_EFFECTFP14BT_SHOT_EFFECTPUiiP14CDataAlloc2_1_i
/* 00E5E0 01DBA2E0 00000000 */   nop
/* 00E5E4 01DBA2E4 07004014 */  bnez        $2, .L01DBA304_2F5904
/* 00E5E8 01DBA2E8 00000000 */   nop
/* 00E5EC 01DBA2EC DC01023C */  lui         $2, %hi(LIT_5159)
/* 00E5F0 01DBA2F0 30314424 */  addiu       $4, $2, %lo(LIT_5159)
/* 00E5F4 01DBA2F4 A611040C */  jal         printf
/* 00E5F8 01DBA2F8 00000000 */   nop
/* 00E5FC 01DBA2FC 05000010 */  b           .L01DBA314_2F5914
/* 00E600 01DBA300 00000000 */   nop
.L01DBA304_2F5904:
/* 00E604 01DBA304 DC01023C */  lui         $2, %hi(LIT_5160)
/* 00E608 01DBA308 50314424 */  addiu       $4, $2, %lo(LIT_5160)
/* 00E60C 01DBA30C A611040C */  jal         printf
/* 00E610 01DBA310 00000000 */   nop
.L01DBA314_2F5914:
/* 00E614 01DBA314 789C838F */  lw          $3, -0x6388($28)
/* 00E618 01DBA318 04006480 */  lb          $4, 0x4($3)
/* 00E61C 01DBA31C 05000324 */  addiu       $3, $0, 0x5
/* 00E620 01DBA320 0C008314 */  bne         $4, $3, .L01DBA354_2F5954
/* 00E624 01DBA324 00000000 */   nop
/* 00E628 01DBA328 EC9D868F */  lw          $6, -0x6214($28)
/* 00E62C 01DBA32C E901023C */  lui         $2, %hi(CharaMainEffectCrash)
/* 00E630 01DBA330 C07B4424 */  addiu       $4, $2, %lo(CharaMainEffectCrash)
/* 00E634 01DBA334 DC01013C */  lui         $1, %hi(MyEffectEntry_Tbl + 0x24)
/* 00E638 01DBA338 1422258C */  lw          $5, %lo(MyEffectEntry_Tbl + 0x24)($1)
/* 00E63C 01DBA33C 10000724 */  addiu       $7, $0, 0x10
/* 00E640 01DBA340 F001023C */  lui         $2, %hi(WEffectModelBuffer)
/* 00E644 01DBA344 80664824 */  addiu       $8, $2, %lo(WEffectModelBuffer)
/* 00E648 01DBA348 06000924 */  addiu       $9, $0, 0x6
/* 00E64C 01DBA34C 98B4060C */  jal         Entry2__12CSHOT_EFFECTFP14BT_SHOT_EFFECTPUiiP14CDataAlloc2_1_i
/* 00E650 01DBA350 00000000 */   nop
.L01DBA354_2F5954:
/* 00E654 01DBA354 789C838F */  lw          $3, -0x6388($28)
/* 00E658 01DBA358 04006480 */  lb          $4, 0x4($3)
/* 00E65C 01DBA35C 03000324 */  addiu       $3, $0, 0x3
/* 00E660 01DBA360 0C008314 */  bne         $4, $3, .L01DBA394_2F5994
/* 00E664 01DBA364 00000000 */   nop
/* 00E668 01DBA368 EC9D868F */  lw          $6, -0x6214($28)
/* 00E66C 01DBA36C E901023C */  lui         $2, %hi(CharaMainEffectCrash)
/* 00E670 01DBA370 C07B4424 */  addiu       $4, $2, %lo(CharaMainEffectCrash)
/* 00E674 01DBA374 DC01013C */  lui         $1, %hi(MyEffectEntry_Tbl + 0xC)
/* 00E678 01DBA378 FC21258C */  lw          $5, %lo(MyEffectEntry_Tbl + 0xC)($1)
/* 00E67C 01DBA37C 10000724 */  addiu       $7, $0, 0x10
/* 00E680 01DBA380 F001023C */  lui         $2, %hi(WEffectModelBuffer)
/* 00E684 01DBA384 80664824 */  addiu       $8, $2, %lo(WEffectModelBuffer)
/* 00E688 01DBA388 06000924 */  addiu       $9, $0, 0x6
/* 00E68C 01DBA38C 98B4060C */  jal         Entry2__12CSHOT_EFFECTFP14BT_SHOT_EFFECTPUiiP14CDataAlloc2_1_i
/* 00E690 01DBA390 00000000 */   nop
.L01DBA394_2F5994:
/* 00E694 01DBA394 E901033C */  lui         $3, %hi(CharaMainEffect)
/* 00E698 01DBA398 60DA6324 */  addiu       $3, $3, %lo(CharaMainEffect)
/* 00E69C 01DBA39C FC9C83AF */  sw          $3, -0x6304($28)
.L01DBA3A0_2F59A0:
/* 00E6A0 01DBA3A0 3000BF7B */  lq          $31, 0x30($29)
/* 00E6A4 01DBA3A4 2000B27B */  lq          $18, 0x20($29)
/* 00E6A8 01DBA3A8 1000B17B */  lq          $17, 0x10($29)
/* 00E6AC 01DBA3AC 0000B07B */  lq          $16, 0x0($29)
/* 00E6B0 01DBA3B0 4000BD27 */  addiu       $29, $29, 0x40
/* 00E6B4 01DBA3B4 0800E003 */  jr          $31
/* 00E6B8 01DBA3B8 00000000 */   nop
/* 00E6BC 01DBA3BC 00000000 */  nop
