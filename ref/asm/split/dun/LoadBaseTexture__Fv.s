.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadBaseTexture__Fv
/* 000080 01DABD80 30FBBD27 */  addiu       $29, $29, -0x4D0
/* 000084 01DABD84 3000BF7F */  sq          $31, 0x30($29)
/* 000088 01DABD88 2000B27F */  sq          $18, 0x20($29)
/* 00008C 01DABD8C 1000B17F */  sq          $17, 0x10($29)
/* 000090 01DABD90 0000B07F */  sq          $16, 0x0($29)
/* 000094 01DABD94 A49D828F */  lw          $2, -0x625C($28)
/* 000098 01DABD98 01004624 */  addiu       $6, $2, 0x1
/* 00009C 01DABD9C DC01013C */  lui         $1, %hi(texdata__2 + 0x18)
/* 0000A0 01DABDA0 9825248C */  lw          $4, %lo(texdata__2 + 0x18)($1)
/* 0000A4 01DABDA4 DC01023C */  lui         $2, %hi(LIT_653__6)
/* 0000A8 01DABDA8 E02B4524 */  addiu       $5, $2, %lo(LIT_653__6)
/* 0000AC 01DABDAC 1614040C */  jal         sprintf
/* 0000B0 01DABDB0 00000000 */   nop
/* 0000B4 01DABDB4 948B858F */  lw          $5, -0x746C($28)
/* 0000B8 01DABDB8 DC01023C */  lui         $2, %hi(LIT_654__6)
/* 0000BC 01DABDBC F02B4424 */  addiu       $4, $2, %lo(LIT_654__6)
/* 0000C0 01DABDC0 28360070 */  paddub      $6, $0, $0
/* 0000C4 01DABDC4 D8FC040C */  jal         LoadFile__FPcPvPi
/* 0000C8 01DABDC8 00000000 */   nop
/* 0000CC 01DABDCC DC4F050C */  jal         wait_now_loading_vsync__Fv
/* 0000D0 01DABDD0 00000000 */   nop
/* 0000D4 01DABDD4 28860070 */  paddub      $16, $0, $0
/* 0000D8 01DABDD8 24000010 */  b           .L01DABE6C_2E746C
/* 0000DC 01DABDDC 00000000 */   nop
.L01DABDE0_2E73E0:
/* 0000E0 01DABDE0 00002382 */  lb          $3, 0x0($17)
/* 0000E4 01DABDE4 23000224 */  addiu       $2, $0, 0x23
/* 0000E8 01DABDE8 05006214 */  bne         $3, $2, .L01DABE00_2E7400
/* 0000EC 01DABDEC 00000000 */   nop
/* 0000F0 01DABDF0 21105D02 */  addu        $2, $18, $29
/* 0000F4 01DABDF4 400051AC */  sw          $17, 0x40($2)
/* 0000F8 01DABDF8 15000010 */  b           .L01DABE50_2E7450
/* 0000FC 01DABDFC 00000000 */   nop
.L01DABE00_2E7400:
/* 000100 01DABE00 948B848F */  lw          $4, -0x746C($28)
/* 000104 01DABE04 282E2072 */  paddub      $5, $17, $0
/* 000108 01DABE08 CC04A627 */  addiu       $6, $29, 0x4CC
/* 00010C 01DABE0C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 000110 01DABE10 00000000 */   nop
/* 000114 01DABE14 05004010 */  beqz        $2, .L01DABE2C_2E742C
/* 000118 01DABE18 00000000 */   nop
/* 00011C 01DABE1C 21185D02 */  addu        $3, $18, $29
/* 000120 01DABE20 400062AC */  sw          $2, 0x40($3)
/* 000124 01DABE24 0A000010 */  b           .L01DABE50_2E7450
/* 000128 01DABE28 00000000 */   nop
.L01DABE2C_2E742C:
/* 00012C 01DABE2C DC01023C */  lui         $2, %hi(LIT_655__4)
/* 000130 01DABE30 102C4424 */  addiu       $4, $2, %lo(LIT_655__4)
/* 000134 01DABE34 282E0072 */  paddub      $5, $16, $0
/* 000138 01DABE38 28362072 */  paddub      $6, $17, $0
/* 00013C 01DABE3C A611040C */  jal         printf
/* 000140 01DABE40 00000000 */   nop
/* 000144 01DABE44 FFFF0424 */  addiu       $4, $0, -0x1
/* 000148 01DABE48 DC05040C */  jal         exit__2
/* 00014C 01DABE4C 00000000 */   nop
.L01DABE50_2E7450:
/* 000150 01DABE50 DC01023C */  lui         $2, %hi(texdata__2 + 0x4)
/* 000154 01DABE54 84254224 */  addiu       $2, $2, %lo(texdata__2 + 0x4)
/* 000158 01DABE58 21105200 */  addu        $2, $2, $18
/* 00015C 01DABE5C 0000438C */  lw          $3, 0x0($2)
/* 000160 01DABE60 21105D02 */  addu        $2, $18, $29
/* 000164 01DABE64 440043AC */  sw          $3, 0x44($2)
/* 000168 01DABE68 01001026 */  addiu       $16, $16, 0x1
.L01DABE6C_2E746C:
/* 00016C 01DABE6C 40101000 */  sll         $2, $16, 1
/* 000170 01DABE70 21105000 */  addu        $2, $2, $16
/* 000174 01DABE74 80900200 */  sll         $18, $2, 2
/* 000178 01DABE78 DC01023C */  lui         $2, %hi(texdata__2)
/* 00017C 01DABE7C 80254224 */  addiu       $2, $2, %lo(texdata__2)
/* 000180 01DABE80 21105200 */  addu        $2, $2, $18
/* 000184 01DABE84 0000518C */  lw          $17, 0x0($2)
/* 000188 01DABE88 D5FF2016 */  bnez        $17, .L01DABDE0_2E73E0
/* 00018C 01DABE8C 00000000 */   nop
/* 000190 01DABE90 21105D02 */  addu        $2, $18, $29
/* 000194 01DABE94 400040AC */  sw          $0, 0x40($2)
/* 000198 01DABE98 C701023C */  lui         $2, %hi(TexManager)
/* 00019C 01DABE9C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0001A0 01DABEA0 FFFF0524 */  addiu       $5, $0, -0x1
/* 0001A4 01DABEA4 4000A627 */  addiu       $6, $29, 0x40
/* 0001A8 01DABEA8 C8CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 0001AC 01DABEAC 00000000 */   nop
/* 0001B0 01DABEB0 3000BF7B */  lq          $31, 0x30($29)
/* 0001B4 01DABEB4 2000B27B */  lq          $18, 0x20($29)
/* 0001B8 01DABEB8 1000B17B */  lq          $17, 0x10($29)
/* 0001BC 01DABEBC 0000B07B */  lq          $16, 0x0($29)
/* 0001C0 01DABEC0 D004BD27 */  addiu       $29, $29, 0x4D0
/* 0001C4 01DABEC4 0800E003 */  jr          $31
/* 0001C8 01DABEC8 00000000 */   nop
/* 0001CC 01DABECC 00000000 */  nop
