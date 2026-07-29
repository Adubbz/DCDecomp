.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Draw_MainUnitShadow__Fv
/* 001F40 01DADC40 10FFBD27 */  addiu       $29, $29, -0xF0
/* 001F44 01DADC44 2000BF7F */  sq          $31, 0x20($29)
/* 001F48 01DADC48 1000B07F */  sq          $16, 0x10($29)
/* 001F4C 01DADC4C 3000A427 */  addiu       $4, $29, 0x30
/* 001F50 01DADC50 7000A527 */  addiu       $5, $29, 0x70
/* 001F54 01DADC54 2CB7040C */  jal         MGGetPLight__FPA4_fPA4_f
/* 001F58 01DADC58 00000000 */   nop
/* 001F5C 01DADC5C B000A427 */  addiu       $4, $29, 0xB0
/* 001F60 01DADC60 3000A527 */  addiu       $5, $29, 0x30
/* 001F64 01DADC64 1086040C */  jal         sceVu0CopyMatrix
/* 001F68 01DADC68 00000000 */   nop
/* 001F6C 01DADC6C 3000A0C7 */  lwc1        $f0, 0x30($29)
/* 001F70 01DADC70 1C8581C7 */  lwc1        $f1, -0x7AE4($28)
/* 001F74 01DADC74 02000146 */  mul.s       $f0, $f0, $f1
/* 001F78 01DADC78 3000A0E7 */  swc1        $f0, 0x30($29)
/* 001F7C 01DADC7C 5000A0C7 */  lwc1        $f0, 0x50($29)
/* 001F80 01DADC80 02000146 */  mul.s       $f0, $f0, $f1
/* 001F84 01DADC84 5000A0E7 */  swc1        $f0, 0x50($29)
/* 001F88 01DADC88 3000A427 */  addiu       $4, $29, 0x30
/* 001F8C 01DADC8C 7000A527 */  addiu       $5, $29, 0x70
/* 001F90 01DADC90 08B7040C */  jal         MGSetPLight__FPA4_fPA4_f
/* 001F94 01DADC94 00000000 */   nop
/* 001F98 01DADC98 C701023C */  lui         $2, %hi(TexManager)
/* 001F9C 01DADC9C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 001FA0 01DADCA0 D48B858F */  lw          $5, -0x742C($28)
/* 001FA4 01DADCA4 0F000624 */  addiu       $6, $0, 0xF
/* 001FA8 01DADCA8 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 001FAC 01DADCAC 00000000 */   nop
/* 001FB0 01DADCB0 C701023C */  lui         $2, %hi(TexManager)
/* 001FB4 01DADCB4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 001FB8 01DADCB8 DC01023C */  lui         $2, %hi(LIT_919__3)
/* 001FBC 01DADCBC 382E4524 */  addiu       $5, $2, %lo(LIT_919__3)
/* 001FC0 01DADCC0 FFFF0624 */  addiu       $6, $0, -0x1
/* 001FC4 01DADCC4 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 001FC8 01DADCC8 00000000 */   nop
/* 001FCC 01DADCCC 280044DC */  ld          $4, 0x28($2)
/* 001FD0 01DADCD0 28C2040C */  jal         MGBeginDrawShadow__F9sceGsTex0
/* 001FD4 01DADCD4 00000000 */   nop
/* 001FD8 01DADCD8 DC01013C */  lui         $1, %hi(BtActStatus + 0x54)
/* 001FDC 01DADCDC D444228C */  lw          $2, %lo(BtActStatus + 0x54)($1)
/* 001FE0 01DADCE0 11004010 */  beqz        $2, .L01DADD28_2E9328
/* 001FE4 01DADCE4 00000000 */   nop
/* 001FE8 01DADCE8 D401013C */  lui         $1, %hi(EdEventInfo + 0x64)
/* 001FEC 01DADCEC 34D2228C */  lw          $2, %lo(EdEventInfo + 0x64)($1)
/* 001FF0 01DADCF0 0D004010 */  beqz        $2, .L01DADD28_2E9328
/* 001FF4 01DADCF4 00000000 */   nop
/* 001FF8 01DADCF8 D401013C */  lui         $1, %hi(EdEventInfo + 0x60)
/* 001FFC 01DADCFC 30D2228C */  lw          $2, %lo(EdEventInfo + 0x60)($1)
/* 002000 01DADD00 09004010 */  beqz        $2, .L01DADD28_2E9328
/* 002004 01DADD04 00000000 */   nop
/* 002008 01DADD08 DC01013C */  lui         $1, %hi(BtActStatus)
/* 00200C 01DADD0C 8044228C */  lw          $2, %lo(BtActStatus)($1)
/* 002010 01DADD10 05004010 */  beqz        $2, .L01DADD28_2E9328
/* 002014 01DADD14 00000000 */   nop
/* 002018 01DADD18 EA01023C */  lui         $2, %hi(CharaMain)
/* 00201C 01DADD1C 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 002020 01DADD20 C0E5040C */  jal         DrawShadow__10CCharacterFv
/* 002024 01DADD24 00000000 */   nop
.L01DADD28_2E9328:
/* 002028 01DADD28 F09C828F */  lw          $2, -0x6310($28)
/* 00202C 01DADD2C 07004014 */  bnez        $2, .L01DADD4C_2E934C
/* 002030 01DADD30 00000000 */   nop
/* 002034 01DADD34 189E828F */  lw          $2, -0x61E8($28)
/* 002038 01DADD38 04004014 */  bnez        $2, .L01DADD4C_2E934C
/* 00203C 01DADD3C 00000000 */   nop
/* 002040 01DADD40 E09C848F */  lw          $4, -0x6320($28)
/* 002044 01DADD44 0066070C */  jal         DrawShadowMonstor__12CMonstorUnitFv
/* 002048 01DADD48 00000000 */   nop
.L01DADD4C_2E934C:
/* 00204C 01DADD4C 189E828F */  lw          $2, -0x61E8($28)
/* 002050 01DADD50 1F004010 */  beqz        $2, .L01DADDD0_2E93D0
/* 002054 01DADD54 00000000 */   nop
/* 002058 01DADD58 28860070 */  paddub      $16, $0, $0
/* 00205C 01DADD5C 19000010 */  b           .L01DADDC4_2E93C4
/* 002060 01DADD60 00000000 */   nop
.L01DADD64_2E9364:
/* 002064 01DADD64 80181000 */  sll         $3, $16, 2
/* 002068 01DADD68 D401023C */  lui         $2, %hi(EdEventInfo + 0xF4)
/* 00206C 01DADD6C C4D24224 */  addiu       $2, $2, %lo(EdEventInfo + 0xF4)
/* 002070 01DADD70 21104300 */  addu        $2, $2, $3
/* 002074 01DADD74 0000428C */  lw          $2, 0x0($2)
/* 002078 01DADD78 11004010 */  beqz        $2, .L01DADDC0_2E93C0
/* 00207C 01DADD7C 00000000 */   nop
/* 002080 01DADD80 D401023C */  lui         $2, %hi(EdEventInfo + 0xB4)
/* 002084 01DADD84 84D24224 */  addiu       $2, $2, %lo(EdEventInfo + 0xB4)
/* 002088 01DADD88 21104300 */  addu        $2, $2, $3
/* 00208C 01DADD8C 0000428C */  lw          $2, 0x0($2)
/* 002090 01DADD90 0B004010 */  beqz        $2, .L01DADDC0_2E93C0
/* 002094 01DADD94 00000000 */   nop
/* 002098 01DADD98 40111000 */  sll         $2, $16, 5
/* 00209C 01DADD9C 21185000 */  addu        $3, $2, $16
/* 0020A0 01DADDA0 80100300 */  sll         $2, $3, 2
/* 0020A4 01DADDA4 21106200 */  addu        $2, $3, $2
/* 0020A8 01DADDA8 40190200 */  sll         $3, $2, 5
/* 0020AC 01DADDAC EB01023C */  lui         $2, %hi(NPCUnit)
/* 0020B0 01DADDB0 60844224 */  addiu       $2, $2, %lo(NPCUnit)
/* 0020B4 01DADDB4 21204300 */  addu        $4, $2, $3
/* 0020B8 01DADDB8 8859050C */  jal         DrawShadow__12CNPCharacterFv
/* 0020BC 01DADDBC 00000000 */   nop
.L01DADDC0_2E93C0:
/* 0020C0 01DADDC0 01001026 */  addiu       $16, $16, 0x1
.L01DADDC4_2E93C4:
/* 0020C4 01DADDC4 0600022A */  slti        $2, $16, 0x6
/* 0020C8 01DADDC8 E6FF4014 */  bnez        $2, .L01DADD64_2E9364
/* 0020CC 01DADDCC 00000000 */   nop
.L01DADDD0_2E93D0:
/* 0020D0 01DADDD0 40000424 */  addiu       $4, $0, 0x40
/* 0020D4 01DADDD4 CCC2040C */  jal         MGEndDrawShadow__FUc
/* 0020D8 01DADDD8 00000000 */   nop
/* 0020DC 01DADDDC 3000A427 */  addiu       $4, $29, 0x30
/* 0020E0 01DADDE0 B000A527 */  addiu       $5, $29, 0xB0
/* 0020E4 01DADDE4 1086040C */  jal         sceVu0CopyMatrix
/* 0020E8 01DADDE8 00000000 */   nop
/* 0020EC 01DADDEC 3000A427 */  addiu       $4, $29, 0x30
/* 0020F0 01DADDF0 7000A527 */  addiu       $5, $29, 0x70
/* 0020F4 01DADDF4 08B7040C */  jal         MGSetPLight__FPA4_fPA4_f
/* 0020F8 01DADDF8 00000000 */   nop
/* 0020FC 01DADDFC 2000BF7B */  lq          $31, 0x20($29)
/* 002100 01DADE00 1000B07B */  lq          $16, 0x10($29)
/* 002104 01DADE04 F000BD27 */  addiu       $29, $29, 0xF0
/* 002108 01DADE08 0800E003 */  jr          $31
/* 00210C 01DADE0C 00000000 */   nop
